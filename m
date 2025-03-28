Return-Path: <linux-arm-msm+bounces-52741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44251A7460B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31B277A70E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F7E21324F;
	Fri, 28 Mar 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NlYHQI0E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0F11D5170;
	Fri, 28 Mar 2025 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153104; cv=none; b=FL6vnyyPC35qK66x55h5jyq6UQrue1uixxLE39e/LiClUcU+kPyvQrqciMK+vGQQKAePOKY5vJeNO97Vlejao/mKtDeDPoa2IP6kiVa88vj3oeZrODR1qhXRpGVg545Gz4bsIyAmsf+9kC5RICGUU+spaPculhHHw0tbnV55Csw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153104; c=relaxed/simple;
	bh=/fQ2l7cD/isQx2nupZb1macgcLB2IW4AcXV0qJ4AiJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acNnqPcu+7vGddqdrxBMYy7WtmnYSzSLjmW3FE8WVuN1OweHsm9Z0b1mKOsAnFGBwsBH9jDKHDASQ6igIk4FUafy/4QlWAgzTsQ0MXOjp7kfgGL+fF6lv8ev0pbfdsF0o4v6xm4eX+rBuCbIkbGsMTrdGhm3zu08UlRqutEDtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NlYHQI0E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3E4C4CEE4;
	Fri, 28 Mar 2025 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743153103;
	bh=/fQ2l7cD/isQx2nupZb1macgcLB2IW4AcXV0qJ4AiJ0=;
	h=Date:From:To:Cc:Subject:From;
	b=NlYHQI0E0t3V6LAxmMvMQTx0CTpo8GWONUz65LhA7mSzdh4aMvEu9b5G0/GIubz1z
	 ieNbbIGsDPqPe15+rCNGbUTE2kVQjZeQEXf9r4jMUbvdGyZnfZGIHk52MFb4hfCWSP
	 J2FXnc9IKO1Q7tTO1U0vlf9ga5hDZwV6IOTCyc1mDVB7tXAMPma70yEi0Rt2ZxpbPK
	 7uakO5uQ3t6ttEBACHaXqyiN5V0D7cmraP0wNlw+jFtNwunrgeDnAEVRxN4SM6rhNY
	 avdqubYgKzuilui0sKZhUPBShJpn3dLx2rDEnDviA5mRRhsJzj0Ws8B80wE7Eqm9ZQ
	 vfMV/8QAOAF7g==
Date: Fri, 28 Mar 2025 10:11:13 +0100
From: Joel Granados <joel.granados@kernel.org>
To: iommu@lists.linux.dev
Cc: David Woodhouse <dwmw2@infradead.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	virtualization@lists.linux.dev, iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: RFC iommutests_: Testing software for everything IOMMU
Message-ID: <5zoh5r6eovbpijic22htkqik6mvyfbma5w7kjzcpz7kgbjufd2@yw6ymwy2a54s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello everyone

This is a Request For Comment (RFC) describing a new testing infra
called iommutests. It is motivated by interest expressed during the "IO
Page Fault for all" [1] talk in LPC 2024 [2]. At the end of that
presentation in the "VFIO/IOMMU/PCI MC" microconference, There was a
clear "yes please" after asking if it made sense to have an
infrastructure that could evaluate the full spectrum of IOMMU
interactions — from host software to IOMMU in hardware and in emulated
environments.

What is iommutests?
--------------------
The primary goal of iommutests [3] is to provide a modular framework to
test IOMMU-mediated Direct Memory Access (DMA). It is meant to run
PASS/NO_PASS tests for the interaction between kernel subsystems and
hardware/virtual devices. All this in the hope of clarifying which IOMMU
features are working correctly and which are not. You can find the
project in github : https://github.com/SamsungDS/iommutests

* Test Orchestration:
  This component is implemented in pytest [4], a testing framework where
  tests can be parametrized, filtered and implemented concisely and
  easily. Additionally, pyudev [5] is employed for device enumeration
  and monitoring, as well as querying device properties and attributes.

* Test Executables:
  For the creation and execution of tests, iommutests leans heavily on
  libvfn [6], a zero-dependency C library designed for interacting with
  PCIe-based devices from user-space using the Linux kernel user API.
  The libvfn library can be used to abstract away common lower-level
  interactions which can then be re-used through out.

A Working Demonstration
-----------------------
To better illustrate how everything fits together, There’s a demo script
[7], with some demo notes [8] explaining the setup and output. It does
the following:

1. Sets up a custom qemu [9] virtual machine environment using a custom
   test device.
2. Builds both libvfn and iommutests.
3. Runs a pair of example tests (one of them always fails to show how
   how that would look like)

This demo shows how everything comes together to give the pass/no-pass
IOMMU testing results. It is there for anyone interested in trying it
out or contributing. To run it, you need to pass it a local ssh key and
linux kernel compiled with VFIO support

Custom qemu device: pci-ats-testdev
-------------------------------------
To support IOMMU testing under qemu, the pci-ats-testdev [10]
(different from pci-testdev [11]) was used to emulate DMA transactions.
It is a full fledged pci device capable of executing emulated DMA
accesses. It was originally intended to test Linux kernel interactions
with devices that had a working Address Translation Cache (ATC) but can
become a platform capable of testing anything PCI/IOMMU related if
needed.

Feedback
--------
This is a first draft, and many implementation details are still open to
refinement. I would appreciate your thoughts on any part of the project
— its design, scope, implementation language choices, or usability.
These are however some of the questions that are still outstanding from
my POV:

Q1: Beyond binary testing:
    Would iommutests be used for something other than pass/no-pass
    tests? Like performance? Stress testing?

Q2: Kernel Integration:
    Should iommutests interact with the already existing IOMMU linux
    kernel unit tests? Since it is an orchestration framework, then it
    can execute the unit tests in some way. This could actually be the
    next step, if found useful.

Thanks for your time
Best regards,

-- 

Joel Granados

[1] https://www.youtube.com/watch?v=UFrAjJ5TUf4
[2] https://lpc.events/event/18/timetable/#20240918
[3] https://github.com/SamsungDS/iommutests
[4] https://docs.pytest.org/en/stable/
[5] https://github.com/pyudev/pyudev
[6] https://github.com/SamsungDS/libvfn
[7] https://github.com/SamsungDS/iommutests/blob/master/docs/demo0_debian.sh
[8] https://github.com/SamsungDS/iommutests/blob/master/docs/demo0.md
[9] https://github.com/Joelgranados/qemu/tree/pcie-testdev
[10] https://github.com/Joelgranados/qemu/blob/pcie-testdev/hw/misc/pcie-ats-testdev.c
[11] https://github.com/Joelgranados/qemu/blob/pcie-testdev/hw/misc/pci-testdev.c

PS:
  Apologies for the long CC list. I always try to include the ppl that I
  think will be interested, but its not always easy to know who you are
  :). In this case, you are included because you appear as "M" under a
  subsystem that contains the string "IOMMU" in the MAINTAINERS file. Feel
  free to shoot me a mail if you don't want to be included in the future,
  I'll try my best to remove you.



