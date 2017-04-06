#!/bin/bash
# Install Robot Operating System (ROS) on NVIDIA Jetson TX1
# Maintainer of ARM builds for ROS is http://answers.ros.org/users/1034/ahendrix/
# Information from:
# http://wiki.ros.org/kinetic/Installation/UbuntuARM

# Setup Locale
# sudo update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX
# Setup sources.lst
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Setup keys
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
# Installation
sudo apt-get update
sudo apt-get install ros-kinetic-ros-base -y

# Add Individual Packages here
#sudo apt-get install ros-kinetic-desktop-full -y

sudo apt-get install ros-kinetic-ar-track-alvar-msgs \
  ros-kinetic-collada-urdf ros-kinetic-perception \
  ros-kinetic-mrpt-navigation ros-kinetic-gmapping \
  ros-kinetic-xacro -y

sudo apt-get install ros-kinetic-ros-control \
  ros-kinetic-gazebo-ros-control \
  ros-kinetic-joint-state-controller \
  ros-kinetic-effort-controllers \
  ros-kinetic-joint-trajectory-controller \
  ros-kinetic-moveit* ros-kinetic-octomap* \
  ros-kinetic-object-recognition-* \
  ros-kinetic-ros-tutorials \
  ros-kinetic-diagnostic-updater -y


#Tries to install gazebo. Keep commented out for now.
#sudo apt-get install ros-kinetic-gazebo-ros-control

# Initialize rosdep
sudo apt-get install python-rosdep -y
# ssl certificates can get messed up on TX1 for some reason
sudo c_rehash /etc/ssl/certs
# Initialize rosdep
sudo rosdep init
# To find available packages, use:
rosdep update
# Environment Setup
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
# Install rosinstall
sudo apt-get install python-rosinstall -y
