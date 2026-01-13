Return-Path: <linux-arm-msm+bounces-88696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D424CD17504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FE330E231E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053533815FC;
	Tue, 13 Jan 2026 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JbdX/QEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD67537FF7C;
	Tue, 13 Jan 2026 08:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292976; cv=none; b=OAvGFZ/BGjQQivMBOGkp9LxYsEF1hdS52Hji6gp8Kv1v2TDr73hOhSDYCaWX0QDGiM/7Swov92LzmH2oSx3FEJABqU0xIFplWbAKIKR38eQzu2K1T3YQpC6s2euLvwn3ccZ76rpTZPWahvrz7GpAlrWDc/vfGpNAxSEPZt3dlmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292976; c=relaxed/simple;
	bh=mcHlsB+4UjxMrLrV37ZJrHj87rVqz5N+1DNw//XfNO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNphNV5Qgl110Q0vC6oSsBpNnAwx/qgL8tj4CyJemr1y+2HE9jbkffhfMzBBLx7rnwt1BdPlAI2B9gOISM8v4K+gZ+Q7M1D6NnkiUXgTlvfHTTM0Icgx6rvLFjMeSMWlox1qXdXlKOGMK9ClNv10qGHWiUjesNOmuDqahlZ4beI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JbdX/QEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFD4C116C6;
	Tue, 13 Jan 2026 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292976;
	bh=mcHlsB+4UjxMrLrV37ZJrHj87rVqz5N+1DNw//XfNO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JbdX/QElel2AFUeRK7+mIkKWXF4gaPgpLKryiN5HUS7q/Ob+PnROxTIVon4PvSvSB
	 bVJ8n+sHH5Z0YtfnDftBfDA4MTsR6JY4mwdzoCngSdERZHrDCfAKeQeTGven3FaIA2
	 m7XMudMMe3qPVTDk5cDWKTClINLOjp7WfIKipVKGDiD0AOtNj65IAPmOdtOGnSgiwS
	 hOQ+p3M9xKMrb1PleQmmQckCsLpPnsdS7TP2Pcc4V1N/oosbt3AyWKP1ey11lE4pjj
	 hW+Umn2AeqQa6u5CmYCBrnpGf6HaRJgzufKTYzWpMzUb6sV9UZAewPqLSt6KVH/q/z
	 AYpAuk9NpnjIw==
Date: Tue, 13 Jan 2026 13:59:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 11/11] char: qcom_csm_dp: Add data path driver for QDU100
 device
Message-ID: <j6xnyeeehhjqryqwlalwmiytaoqvhzu6dvp5stwzpr7k2bhkl7@4srp22m6hpub>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-11-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-11-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:43PM +0530, Sivareddy Surasani wrote:
> Add a character device driver for the Qualcomm Cell Site Modem (CSM)
> Data Path (DP) interface, required to support the QDU100 5G
> distributed unit in cellular base station deployments.
> 
> Implement high-performance communication between the Layer 2
> host (x86) and Qualcomm Distributed Unit (QDU100) by enabling
> transmission and reception of FAPI packets over PCIe using the
> Modem Host Interface (MHI).
> 
> Create an efficient zero-copy mechanism using shared rings and
> memory pools to eliminate data copying between user and kernel space,
> allowing high data rates with low latency.
> 
> Register as an MHI client and provide a character-based interface
> to userspace via ioctls for memory pool management and packet
> transmission. Support two DMA channels (control and data) with system
> configuration to ensure proper channel assignment.
> 
> Implement Single Root I/O Virtualization (SR-IOV) support, allowing
> the QDU100 to present itself as multiple virtual PCIe functions to
> the host. Support up to 12 QDU100 devices with up to 4 virtual
> functions per device.
> 
> FAPI:
> https://www.techplayon.com/5g-fapi-femtocell-application-programming-interface/
> 
> dp-lib userspace:
> https://github.com/qualcomm/dp-lib/tree/dp-driver-upstream-specific
> 
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>

This driver itself should be split into several patches and belong to a separate
series. Let's first get the MHI bits merged (atleast the non-API parts) and then
look into it.

- Mani

> ---
>  Documentation/misc-devices/qcom_csm_dp.rst     |  138 +++
>  drivers/char/Kconfig                           |    2 +
>  drivers/char/Makefile                          |    1 +
>  drivers/char/qcom_csm_dp/Kconfig               |    9 +
>  drivers/char/qcom_csm_dp/Makefile              |    5 +
>  drivers/char/qcom_csm_dp/qcom_csm_dp.h         |  173 ++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c    |  941 +++++++++++++++++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_core.c    |  571 +++++++++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c |  993 ++++++++++++++++++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c     | 1078 ++++++++++++++++++++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h     |  292 +++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c     |  651 ++++++++++++++
>  drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h     |   81 ++
>  include/uapi/linux/qcom_csm_dp_ioctl.h         |  306 +++++++
>  14 files changed, 5241 insertions(+)
> 
> diff --git a/Documentation/misc-devices/qcom_csm_dp.rst b/Documentation/misc-devices/qcom_csm_dp.rst
> new file mode 100644
> index 000000000000..88051dadabda
> --- /dev/null
> +++ b/Documentation/misc-devices/qcom_csm_dp.rst
> @@ -0,0 +1,138 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=====================================
> +Qualcomm QDU100 device CSM_DP driver
> +=====================================
> +
> +CSM-DP stands for Cell Site Modem Data Path. Specifically designed to support
> +high-performance data transmission between a host (typically an x86 server
> +running Layer 2 software) and the distributed unit (QDU100).
> +
> +The CSM-DP driver enables the transmission and reception of FAPI (Functional
> +Application Platform Interface) packets both control and data—between the L2
> +host and the QDU.
> +
> +All data path traffic is transferred over the Modem Host Interface (MHI),
> +with PCIe as the physical transport layer.
> +
> +Block Diagram
> +=============
> +
> +  -------------------------------------------------------------------------------------------
> +  | +-------------------+        +-------------------+  mmap      +-------------------+     |
> +  | |   L2 Application  |------->|   DP-Lib          |----------->| CharDev Interface |     |
> +  | |     (dp_ping)     |        |                   |----------->|                   |     |
> +  | +-------------------+        +-------------------+  ioctl     +-------------------+     |
> +  |                                                                    |                    |
> +  |  User Space                                                        |                    |
> +  ---------------------------------------------------------------------+---------------------
> +                                                                       |
> +            -----------------------------------------------------------|-------------------------------------------------------------
> +            |                                                          V                                                            |
> +            |     CSM-DP Driver                               +-------------------+                                                 |
> +            |                                                 |   CSM-DP Core     |                                                 |
> +            |                                                 +-------------------+                                                 |
> +            |                                                          |                                                            |
> +            |                                                          |                                                            |
> +            |                       +----------------------------------+----------------------------------------+                   |
> +            |                       |                                  |                                        |                   |
> +            |                       |                                  |                                        |                   |
> +            |                       |                                  |                                        |                   |
> +            |                       V                                  V                                        V                   |
> +            |             +-------------------+       +----------------------------------+            +-------------------+         |
> +            |             | CSM-DP Memory     |       |              CSM-DP              |            |   CSM-DP Sysfs    |         |
> +            |             | UL/DL Allocation  |       |       MHI Client Interface       |            |   Debug Interface |         |
> +            |             +-------------------+       +----------------------------------+            +-------------------+         |
> +            |                                               |                     |                                                 |
> +            |                                               |                     |                                                 |
> +            |                                               |                     |                                                 |
> +            |                                               V                     V                                                 |
> +            |                                         +------------+       +------------+                                           |
> +            |                                         |  IP_HW1    |       | IP_HW2     |                                           |
> +            |                                         | (Control)  |       | (Data)     |                                           |
> +            |                                         +------------+       +------------+                                           |
> +            |                                               |                     |                                                 |
> +            ------------------------------------------------+---------------------+--------------------------------------------------
> +                                                            |                     |
> +                                                            |                     |
> +            ------------------------------------------------+---------------------+--------------------------------------------------
> +            |                                               V                     V                                                 |
> +            |                                         +----------------------------------+                                          |
> +            |                                         |   MHI Controllers (VF1…VF4)      |                                          |
> +            |                                         +----------------------------------+                                          |
> +            |                                                         |                                                             |
> +            | MHI Driver                                              | (PCI-E Interface)                                           |
> +            ----------------------------------------------------------+--------------------------------------------------------------
> +                                                                      V
> +                                                      +----------------------------------+
> +                                                      |             QDU100               |
> +                                                      +----------------------------------+
> +
> +
> +Supported chips
> +---------------
> +
> +- QDU100
> +
> +Driver location
> +===============
> +
> +drivers/char/qcom_csm_dp/qcom_csm_dp_core.c
> +
> +Driver type definitions
> +=======================
> +
> +include/uapi/linux/qcom_csm_dp_ioctl.h
> +
> +Driver IOCTLs
> +=============
> +
> +:c:macro::`CSM_DP_IOCTL_MEMPOOL_ALLOC`
> +Mempool allocation for UL/DL.
> +
> +:c:macro::`CSM_DP_IOCTL_MEMPOOL_GET_CONFIG`
> +Returns the allocated mempool config UL/DL.
> +
> +:c:macro::`CSM_DP_IOCTL_RX_GET_CONFIG`
> +Returns the RX Queue configuration for UL Control channel.
> +
> +:c:macro::`CSM_DP_IOCTL_TX`
> +To transmit UL data.
> +
> +:c:macro::`CSM_DP_IOCTL_SG_TX`
> +To transmit UL data in Scatter Gather mode.
> +
> +:c:macro::`CSM_DP_IOCTL_RX_POLL`
> +Poll operation for UL Data Channel.
> +
> +:c:macro::`CSM_DP_IOCTL_GET_STATS`
> +Returns the UL/DL Packet stats information.
> +
> +CSM_DP Driver
> +============
> +
> +The CSM_DP driver functions as a client driver for the
> +MHI device. It utilizes MHI channels 104, 105, 106, and 107,
> +where:
> +    - Channels 104 and 105 are used for FAPI control packets.
> +    - Channels 106 and 107 are used for FAPI data packets.
> +The driver supports multiple Virtual Functions (VFs) to enable
> +scalable and efficient communication.
> +
> +See available QDU100 devices(PF/VF) on PCIe bus::
> +
> +    # lspci | grep Qualcomm
> +
> +See available CSM_DP devices upon probe::
> +
> +    # ls /dev/csm*
> +    /dev/csm1-dp1  /dev/csm2-dp2  /dev/csm3-dp3  /dev/csm4-dp4
> +
> +CSM DP_LIB
> +============
> +Clone, Build and Install dp-lib code from following repository.
> +https://github.com/qualcomm/dp-lib/tree/dp-driver-upstream-specific
> +
> +Run the dp_ping application for data traffic::
> +
> +    # dp_ping -B <BUS NUM> -V <VF NUM>
> diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
> index d2cfc584e202..60db50049c7c 100644
> --- a/drivers/char/Kconfig
> +++ b/drivers/char/Kconfig
> @@ -411,6 +411,8 @@ source "drivers/s390/char/Kconfig"
>  
>  source "drivers/char/xillybus/Kconfig"
>  
> +source "drivers/char/qcom_csm_dp/Kconfig"
> +
>  config ADI
>  	tristate "SPARC Privileged ADI driver"
>  	depends on SPARC64
> diff --git a/drivers/char/Makefile b/drivers/char/Makefile
> index 1291369b9126..d85a6fa16b03 100644
> --- a/drivers/char/Makefile
> +++ b/drivers/char/Makefile
> @@ -44,3 +44,4 @@ obj-$(CONFIG_PS3_FLASH)		+= ps3flash.o
>  obj-$(CONFIG_XILLYBUS_CLASS)	+= xillybus/
>  obj-$(CONFIG_POWERNV_OP_PANEL)	+= powernv-op-panel.o
>  obj-$(CONFIG_ADI)		+= adi.o
> +obj-$(CONFIG_QCOM_CSM_DP)       += qcom_csm_dp/
> diff --git a/drivers/char/qcom_csm_dp/Kconfig b/drivers/char/qcom_csm_dp/Kconfig
> new file mode 100644
> index 000000000000..472a5defe585
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/Kconfig
> @@ -0,0 +1,9 @@
> +menuconfig QCOM_CSM_DP
> +	tristate "CSM DP Interface Core"
> +	depends on MHI_BUS
> +	help
> +	  CSM Data Path (DP) driver is used to support the
> +	  transmission and reception of functional application platform
> +	  interface (FAPI) packets (control and data) between the L2 host (x86)
> +	  and the Qualcomm Distributed Unit (QDU100).
> +	  The CSM DP character driver provides a datapath server to user space.
> diff --git a/drivers/char/qcom_csm_dp/Makefile b/drivers/char/qcom_csm_dp/Makefile
> new file mode 100644
> index 000000000000..e345844d3483
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/Makefile
> @@ -0,0 +1,5 @@
> +obj-$(CONFIG_QCOM_CSM_DP) += qcom_csm_dp.o
> +
> +qcom_csm_dp-objs := qcom_csm_dp_core.o qcom_csm_dp_cdev.o
> +qcom_csm_dp-objs += qcom_csm_dp_mhi.o qcom_csm_dp_mem.o
> +qcom_csm_dp-objs += qcom_csm_dp_debugfs.o
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp.h b/drivers/char/qcom_csm_dp/qcom_csm_dp.h
> new file mode 100644
> index 000000000000..da9ce499da35
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp.h
> @@ -0,0 +1,173 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_CSM_DP__
> +#define __QCOM_CSM_DP__
> +
> +#include <linux/atomic.h>
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/netdevice.h>
> +#include <linux/qcom_csm_dp_ioctl.h>
> +#include <linux/spinlock.h>
> +#include <linux/workqueue.h>
> +
> +#include "qcom_csm_dp_mem.h"
> +#include "qcom_csm_dp_mhi.h"
> +
> +#define CSM_DP_MODULE_NAME	"csm-dp"
> +#define CSM_DP_DEV_CLASS_NAME	CSM_DP_MODULE_NAME
> +#define CSM_DP_CDEV_NAME	CSM_DP_MODULE_NAME
> +#define CSM_DP_NAPI_WEIGHT	64
> +#define CSM_DP_DMA_MASK		40
> +
> +#define CSM_DP_MMAP_MEM_TYPE_SHIFT	24
> +#define CSM_DP_MMAP_MEM_TYPE_MASK	0xFF
> +#define CSM_DP_MMAP_TYPE_SHIFT		16
> +#define CSM_DP_MMAP_TYPE_MASK		0xFF
> +
> +#define CSM_DP_MMAP_COOKIE(type, target) \
> +	((((type) & CSM_DP_MMAP_MEM_TYPE_MASK) <<  CSM_DP_MMAP_MEM_TYPE_SHIFT) | \
> +	(((target) & CSM_DP_MMAP_TYPE_MASK) << CSM_DP_MMAP_TYPE_SHIFT))
> +
> +#define CSM_DP_MMAP_COOKIE_TO_MEM_TYPE(cookie) \
> +	(((cookie) >> CSM_DP_MMAP_MEM_TYPE_SHIFT) & CSM_DP_MMAP_MEM_TYPE_MASK)
> +
> +#define CSM_DP_MMAP_COOKIE_TO_TYPE(cookie) \
> +	(((cookie) >> CSM_DP_MMAP_TYPE_SHIFT) & CSM_DP_MMAP_TYPE_MASK)
> +
> +#define CSM_DP_MMAP_RX_COOKIE(type) \
> +	CSM_DP_MMAP_COOKIE((type) + CSM_DP_MEM_TYPE_LAST, CSM_DP_MMAP_TYPE_RING)
> +
> +#define CSM_DP_MMAP_RX_COOKIE_TO_TYPE(cookie) \
> +	(CSM_DP_MMAP_COOKIE_TO_MEM_TYPE(cookie) - CSM_DP_MEM_TYPE_LAST)
> +
> +#define CSM_DP_TX_FLAG_SG	0x01
> +
> +#define CSM_DP_MAX_NUM_BUSES 12 /* max supported QDU100 devices connected to this Host */
> +#define CSM_DP_MAX_NUM_VFS 4    /* max Virtual Functions that single QDU100 device can expose */
> +#define CSM_DP_MAX_NUM_DEVS (CSM_DP_MAX_NUM_BUSES * CSM_DP_MAX_NUM_VFS)
> +
> +#define ch_name(ch) ((ch) == CSM_DP_CH_CONTROL) ? "CONTROL" : "DATA"
> +
> +/*
> + * vma mapping for mempool which includes
> + * - buffer memory region
> + * - ring buffer shared between kernel and user space
> + *   for buffer management
> + */
> +struct csm_dp_mempool_vma {
> +	struct csm_dp_mempool **pp_mempool;
> +	struct vm_area_struct *vma[CSM_DP_MMAP_TYPE_LAST];
> +	atomic_t refcnt[CSM_DP_MMAP_TYPE_LAST];
> +	bool usr_alloc;	/* allocated by user using ioctl */
> +};
> +
> +/* vma mapping for receive queue */
> +struct csm_dp_rxqueue_vma {
> +	enum csm_dp_rx_type type;
> +	struct vm_area_struct *vma;
> +	atomic_t refcnt;
> +};
> +
> +/* RX queue using ring buffer */
> +struct csm_dp_rxqueue {
> +	enum csm_dp_rx_type type;
> +	struct csm_dp_ring *ring;
> +	wait_queue_head_t wq;
> +	atomic_t refcnt;
> +	bool inited;
> +};
> +
> +struct csm_dp_cdev {
> +	struct list_head list;
> +	struct csm_dp_dev *pdev;
> +	pid_t pid;
> +
> +	/* vma mapping for memory pool */
> +	struct csm_dp_mempool_vma mempool_vma[CSM_DP_MEM_TYPE_LAST];
> +
> +	/* vma mapping for receiving queue */
> +	struct csm_dp_rxqueue_vma rxqueue_vma[CSM_DP_RX_TYPE_LAST];
> +};
> +
> +struct csm_dp_core_mem_stats {
> +	unsigned long mempool_mem_in_use[CSM_DP_MEM_TYPE_LAST];
> +	unsigned long mempool_mem_dma_mapped[CSM_DP_MEM_TYPE_LAST];
> +	unsigned long mempool_ring_in_use[CSM_DP_MEM_TYPE_LAST];
> +	unsigned long rxq_ring_in_use[CSM_DP_RX_TYPE_LAST];
> +};
> +
> +struct csm_dp_core_stats {
> +	unsigned long tx_cnt;
> +	unsigned long tx_err;
> +	unsigned long tx_drop;
> +
> +	unsigned long rx_cnt;
> +	unsigned long rx_badmsg;
> +	unsigned long rx_drop;
> +	unsigned long rx_int;
> +	unsigned long rx_budget_overflow;
> +	unsigned long rx_poll_ignore;
> +	unsigned long rx_pending_pkts;
> +
> +	struct csm_dp_core_mem_stats mem_stats;
> +};
> +
> +struct csm_dp_dev {
> +	struct csm_dp_drv *pdrv;		/* parent */
> +	struct csm_dp_mhi mhi_control_dev;	/* control path Tx/Rx */
> +	struct csm_dp_mhi mhi_data_dev;		/* data path Tx/Rx */
> +	bool cdev_inited;
> +	pid_t pid;
> +	char pid_name[TASK_COMM_LEN + 1];
> +	unsigned int bus_num;
> +	unsigned int vf_num;
> +	struct cdev cdev;
> +	struct net_device *dummy_dev;
> +	struct napi_struct napi;
> +	/* Lock for each VF */
> +	struct mutex cdev_lock;
> +	struct list_head cdev_head;
> +	/* Lock for each Mempool */
> +	struct mutex mempool_lock;
> +	struct csm_dp_mempool *mempool[CSM_DP_MEM_TYPE_LAST];
> +	struct csm_dp_rxqueue rxq[CSM_DP_RX_TYPE_LAST];
> +	struct csm_dp_core_stats stats;
> +	struct work_struct alloc_work;
> +	unsigned int csm_dp_prev_ul_prod_tail;
> +
> +	struct csm_dp_buf_cntrl	*pending_packets;
> +};
> +
> +struct csm_dp_drv {
> +	struct device *dev;
> +	struct class *dev_class;
> +	dev_t devno;
> +	struct dentry *dent;
> +	struct csm_dp_dev dp_devs[CSM_DP_MAX_NUM_DEVS];
> +};
> +
> +int csm_dp_cdev_init(struct csm_dp_drv *pdrv);
> +void csm_dp_cdev_cleanup(struct csm_dp_drv *pdrv);
> +int csm_dp_cdev_add(struct csm_dp_dev *pdev, struct device *mhi_dev);
> +void csm_dp_cdev_del(struct csm_dp_dev *pdev);
> +
> +void csm_dp_debugfs_init(struct csm_dp_drv *pdrv);
> +void csm_dp_debugfs_cleanup(struct csm_dp_drv *pdrv);
> +
> +int csm_dp_rx_init(struct csm_dp_dev *pdev);
> +void csm_dp_rx_cleanup(struct csm_dp_dev *pdev);
> +int csm_dp_tx(struct csm_dp_dev *pdev, enum csm_dp_channel ch,
> +	      struct iovec *iov, unsigned int iov_nr,
> +	      unsigned int flag, dma_addr_t dma_addr[]);
> +int csm_dp_rx_poll(struct csm_dp_dev *pdev, struct iovec *iov, size_t iov_nr);
> +void csm_dp_rx(struct csm_dp_dev *pdev, struct csm_dp_buf_cntrl *buf_cntrl, unsigned int length);
> +int csm_dp_get_stats(struct csm_dp_dev *pdev, struct csm_dp_ioctl_getstats *stats);
> +void csm_dp_mempool_put(struct csm_dp_mempool *mempool);
> +
> +#endif /* __QCOM_CSM_DP__ */
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c b/drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c
> new file mode 100644
> index 000000000000..94fc69a8903a
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_cdev.c
> @@ -0,0 +1,941 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#include "qcom_csm_dp.h"
> +
> +static bool csm_dp_is_rxqueue_mmap_cookie(unsigned int cookie)
> +{
> +	unsigned int type, mmap_type;
> +
> +	mmap_type = CSM_DP_MMAP_COOKIE_TO_TYPE(cookie);
> +	type = CSM_DP_MMAP_COOKIE_TO_MEM_TYPE(cookie);
> +	if (mmap_type == CSM_DP_MMAP_TYPE_RING && type >= CSM_DP_MEM_TYPE_LAST)
> +		return true;
> +	return false;
> +}
> +
> +static void *csm_dp_usr_to_kern_vaddr(struct csm_dp_mempool_vma *mempool_vma,
> +				      void __user *addr, unsigned int *cluster,
> +				      unsigned int *c_offset)
> +{
> +	struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +	unsigned long offset = (unsigned long)addr -
> +		mempool_vma->vma[CSM_DP_MMAP_TYPE_MEM]->vm_start;
> +
> +	*cluster = offset >> CSM_DP_MEMPOOL_CLUSTER_SHIFT;
> +	*c_offset = offset & CSM_DP_MEMPOOL_CLUSTER_MASK;
> +
> +	return ((void *)mempool->mem.loc.cluster_kernel_addr[*cluster] +
> +								*c_offset);
> +}
> +
> +static struct csm_dp_rxqueue *csm_dp_rxqueue_vma_to_rxqueue(struct csm_dp_rxqueue_vma *rxq_vma)
> +{
> +	struct csm_dp_cdev *cdev = container_of(rxq_vma,
> +						struct csm_dp_cdev,
> +						rxqueue_vma[rxq_vma->type]);
> +	return &cdev->pdev->rxq[rxq_vma->type];
> +}
> +
> +static void csm_dp_cdev_init_mempool_vma(struct csm_dp_cdev *cdev)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	int type;
> +
> +	memset(cdev->mempool_vma, 0, sizeof(cdev->mempool_vma));
> +
> +	for (type = 0; type < CSM_DP_MEM_TYPE_LAST; type++)
> +		cdev->mempool_vma[type].pp_mempool = &pdev->mempool[type];
> +}
> +
> +static struct csm_dp_mempool_vma *csm_dp_find_mempool_vma(struct csm_dp_cdev *cdev,
> +							  void __user *addr,
> +							  unsigned int len)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma = NULL;
> +	struct vm_area_struct *vma;
> +	unsigned int mem_type;
> +
> +	for (mem_type = 0; mem_type < CSM_DP_MEM_TYPE_LAST; mem_type++) {
> +		mempool_vma = &cdev->mempool_vma[mem_type];
> +		vma = mempool_vma->vma[CSM_DP_MMAP_TYPE_MEM];
> +		if (vma && csm_dp_vaddr_in_vma_range(addr, len, vma))
> +			return mempool_vma;
> +	}
> +	return NULL;
> +}
> +
> +static int csm_dp_cdev_tx(struct csm_dp_cdev *cdev,
> +			  enum csm_dp_channel ch,
> +			  struct iovec __user *uiov,
> +			  unsigned int iov_nr,
> +			  unsigned int ioctl_flags,
> +			  bool sg)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_mempool_vma *mempool_vma;
> +	struct iovec iov[CSM_DP_MAX_IOV_SIZE];
> +	dma_addr_t dma_addr[CSM_DP_MAX_IOV_SIZE];
> +	unsigned int n;
> +	int ret;
> +	unsigned int flag = 0;
> +	struct csm_dp_mempool *mempool;
> +	u32 iov_off_array[CSM_DP_MAX_IOV_SIZE];
> +	unsigned int c_offset;
> +	unsigned int cluster;
> +	struct csm_dp_buf_cntrl *buf_cntrl = NULL, *prev_buf_cntrl = NULL;
> +
> +	pr_debug("ch %s bus %d VF %d iov_nr %u sg %d\n",
> +		 ch_name(ch), pdev->bus_num, pdev->vf_num, iov_nr, sg);
> +	if (iov_nr > CSM_DP_MAX_IOV_SIZE)
> +		return  -E2BIG;
> +
> +	if (copy_from_user(iov, (void __user *)uiov,
> +			   sizeof(struct iovec) * iov_nr))
> +		return -EFAULT;
> +
> +	for (n = 0; n < iov_nr; n++) {
> +		mempool_vma = csm_dp_find_mempool_vma(cdev,
> +						      iov[n].iov_base,
> +						      iov[n].iov_len);
> +		if (!mempool_vma) {
> +			pr_debug("cannot find mempool addr=%p, len=%lu\n",
> +				 iov[n].iov_base, iov[n].iov_len);
> +			return -EINVAL;
> +		}
> +		mempool = *mempool_vma->pp_mempool;
> +
> +		/* User passes in the pointer to message payload */
> +		iov[n].iov_base = csm_dp_usr_to_kern_vaddr(mempool_vma, iov[n].iov_base,
> +							   &cluster, &c_offset);
> +
> +		unsigned long b_backtrack;
> +		struct csm_dp_buf_cntrl *p;
> +
> +		b_backtrack = c_offset %
> +			csm_dp_buf_true_size(&mempool->mem);
> +		iov_off_array[n] = b_backtrack;
> +		p = (struct csm_dp_buf_cntrl *)
> +			(iov[n].iov_base - b_backtrack);
> +		if (p->signature != CSM_DP_BUFFER_SIG) {
> +			pr_err("mempool type %d buffer at kernel addr %p corrupted, %x, exp %x\n",
> +			       (*mempool_vma->pp_mempool)->type,
> +			       iov[n].iov_base, p->signature,
> +			       CSM_DP_BUFFER_SIG);
> +			return -EINVAL;
> +		}
> +		if (p->fence != CSM_DP_BUFFER_FENCE_SIG) {
> +			pr_err("mempool type %d buffer at kernel addr %p corrupted",
> +			       (*mempool_vma->pp_mempool)->type,
> +			       iov[n].iov_base);
> +			return -EINVAL;
> +		}
> +		p->state = CSM_DP_BUF_STATE_KERNEL_XMIT_DMA;
> +		p->xmit_status = CSM_DP_XMIT_IN_PROGRESS;
> +
> +		/* link SG fragments */
> +		b_backtrack = c_offset % csm_dp_buf_true_size(&mempool->mem);
> +		buf_cntrl = (struct csm_dp_buf_cntrl *)(iov[n].iov_base - b_backtrack);
> +		if (sg) {
> +			if (prev_buf_cntrl)
> +				prev_buf_cntrl->next = buf_cntrl;
> +			prev_buf_cntrl = buf_cntrl;
> +			if (n == iov_nr - 1)
> +				buf_cntrl->next = NULL;
> +		}	else {
> +			buf_cntrl->next = NULL;
> +		}
> +
> +		atomic_inc(&mempool->out_xmit);
> +		if (mempool->mem.loc.dma_mapped) {
> +			/*
> +			 * set to indicate iov_base is
> +			 * dma handle instead of
> +			 * kernel virtual addr
> +			 */
> +			dma_addr[n] =
> +				mempool->mem.loc.cluster_dma_addr[cluster] +
> +								c_offset;
> +		} else {
> +			dma_addr[n] = 0;
> +		}
> +
> +		pr_debug("start tx iov[%d], kaddr=%p len=%lu\n",
> +			 n, iov[n].iov_base, iov[n].iov_len);
> +	}
> +
> +	buf_cntrl->next = NULL;
> +
> +	if (sg)
> +		flag |= CSM_DP_TX_FLAG_SG;
> +
> +	ret = csm_dp_tx(pdev, ch, iov, iov_nr, flag, dma_addr);
> +
> +	if (ret) {
> +		struct csm_dp_buf_cntrl *p;
> +
> +		for (n = 0; n < iov_nr; n++) {
> +			p = (struct csm_dp_buf_cntrl *)
> +				(iov[n].iov_base - iov_off_array[n]);
> +			p->state = CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP;
> +			atomic_dec(&mempool->out_xmit);
> +			p->xmit_status = ret;
> +		}
> +	} else {
> +		ret = iov_nr;
> +	}
> +
> +	/* Ensure all the data are written */
> +	wmb();
> +	return ret;
> +}
> +
> +static int __cdev_rx_poll(struct csm_dp_cdev *cdev,
> +			  struct iovec __user *uiov, size_t iov_nr)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct iovec iov[CSM_DP_MAX_IOV_SIZE];
> +	int ret;
> +
> +	ret = csm_dp_rx_poll(pdev, iov, iov_nr);
> +
> +	if (ret > 0 && copy_to_user((void __user *)uiov, iov, sizeof(struct iovec) * ret))
> +		ret = -EFAULT;
> +
> +	return ret;
> +}
> +
> +static int csm_dp_cdev_ioctl_mempool_alloc(struct csm_dp_cdev *cdev,
> +					   unsigned long ioarg)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_ioctl_mempool_alloc req;
> +	struct csm_dp_mempool *mempool;
> +
> +	if (copy_from_user(&req, (void __user *)ioarg, sizeof(req)))
> +		return -EFAULT;
> +
> +	mempool = csm_dp_mempool_alloc(pdev, req.type, req.buf_sz, req.buf_num,
> +				       true);
> +	if (!mempool)
> +		return -ENOMEM;
> +
> +	cdev->mempool_vma[req.type].usr_alloc = true;
> +
> +	if (req.cfg) {
> +		struct csm_dp_mempool_cfg cfg;
> +
> +		csm_dp_mempool_get_cfg(mempool, &cfg);
> +		if (copy_to_user((void __user *)req.cfg, &cfg, sizeof(cfg)))
> +			return -EFAULT;
> +	}
> +	return 0;
> +}
> +
> +static int csm_dp_cdev_ioctl_mempool_getcfg(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_ioctl_getcfg req;
> +	struct csm_dp_mempool_cfg cfg;
> +
> +	if (copy_from_user(&req, (void __user *)ioarg, sizeof(req)))
> +		return -EFAULT;
> +
> +	if (!csm_dp_mem_type_is_valid(req.type))
> +		return -EINVAL;
> +
> +	if (csm_dp_mempool_get_cfg(pdev->mempool[req.type], &cfg))
> +		return -EAGAIN;
> +
> +	if (copy_to_user((void __user *)req.cfg, &cfg, sizeof(cfg)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int csm_dp_cdev_ioctl_tx(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct csm_dp_ioctl_tx arg;
> +
> +	if (copy_from_user(&arg, (void __user *)ioarg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (!arg.iov.iov_len || arg.iov.iov_len > CSM_DP_MAX_IOV_SIZE)
> +		return -EINVAL;
> +
> +	return (csm_dp_cdev_tx(cdev, arg.ch, arg.iov.iov_base,
> +			       arg.iov.iov_len, arg.flags, false));
> +}
> +
> +static int csm_dp_cdev_ioctl_sg_tx(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct csm_dp_ioctl_tx arg;
> +
> +	if (copy_from_user(&arg, (void __user *)ioarg, sizeof(arg)))
> +		return -EFAULT;
> +
> +	if (!arg.iov.iov_len || arg.iov.iov_len > CSM_DP_MAX_IOV_SIZE)
> +		return -EINVAL;
> +
> +	return (csm_dp_cdev_tx(cdev, arg.ch, arg.iov.iov_base,
> +			       arg.iov.iov_len, arg.flags, true));
> +}
> +
> +static int csm_dp_cdev_ioctl_rx_getcfg(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_ioctl_getcfg req;
> +	struct csm_dp_ring_cfg cfg;
> +
> +	if (copy_from_user(&req, (void __user *)ioarg, sizeof(req)))
> +		return -EFAULT;
> +
> +	if (!csm_dp_rx_type_is_valid(req.type) || !req.cfg)
> +		return -EINVAL;
> +
> +	csm_dp_ring_get_cfg(pdev->rxq[req.type].ring, &cfg);
> +	if (copy_to_user((void __user *)req.cfg, &cfg, sizeof(cfg)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int csm_dp_cdev_ioctl_rx_poll(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct iovec iov;
> +
> +	if (copy_from_user(&iov, (void __user *)ioarg, sizeof(iov)))
> +		return -EFAULT;
> +
> +	if (!iov.iov_len || iov.iov_len > CSM_DP_MAX_IOV_SIZE)
> +		return -EINVAL;
> +
> +	return __cdev_rx_poll(cdev, iov.iov_base, iov.iov_len);
> +}
> +
> +static int csm_dp_cdev_ioctl_get_stats(struct csm_dp_cdev *cdev, unsigned long ioarg)
> +{
> +	struct csm_dp_ioctl_getstats req;
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	int ret;
> +
> +	if (copy_from_user(&req, (void __user *)ioarg, sizeof(req)))
> +		return -EFAULT;
> +
> +	mutex_lock(&pdev->cdev_lock);
> +	ret = csm_dp_get_stats(pdev, &req);
> +	mutex_unlock(&pdev->cdev_lock);
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user((void __user *)ioarg, &req, sizeof(req)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static unsigned int csm_dp_cdev_poll(struct file *file, poll_table *wait)
> +{
> +	struct csm_dp_cdev *cdev = file->private_data;
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_rxqueue *rxq;
> +	unsigned int mask = 0;
> +	int type, n;
> +
> +	for (type = 0, n = 0; type < CSM_DP_RX_TYPE_LAST; type++) {
> +		if (cdev->rxqueue_vma[type].vma) {
> +			rxq = &pdev->rxq[type];
> +			if (!rxq->inited)
> +				continue;
> +
> +			poll_wait(file, &rxq->wq, wait);
> +			n++;
> +		}
> +	}
> +	if (unlikely(!n))
> +		return POLLERR;
> +
> +	for (type = 0; type < CSM_DP_RX_TYPE_LAST; type++) {
> +		if (cdev->rxqueue_vma[type].vma) {
> +			rxq = &pdev->rxq[type];
> +			if (!rxq->inited)
> +				continue;
> +
> +			if (!csm_dp_ring_is_empty(rxq->ring)) {
> +				mask |= POLLIN | POLLRDNORM;
> +				break;
> +			}
> +		}
> +	}
> +	return mask;
> +}
> +
> +static long csm_dp_cdev_ioctl(struct file *file,
> +			      unsigned int iocmd,
> +			      unsigned long ioarg)
> +{
> +	struct csm_dp_cdev *cdev = file->private_data;
> +	int ret = -EINVAL;
> +
> +	if (in_compat_syscall())
> +		return ret;
> +
> +	switch (iocmd) {
> +	case CSM_DP_IOCTL_MEMPOOL_ALLOC:
> +		ret = csm_dp_cdev_ioctl_mempool_alloc(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_MEMPOOL_GET_CONFIG:
> +		ret = csm_dp_cdev_ioctl_mempool_getcfg(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_RX_GET_CONFIG:
> +		ret = csm_dp_cdev_ioctl_rx_getcfg(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_TX:
> +		ret = csm_dp_cdev_ioctl_tx(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_SG_TX:
> +		ret = csm_dp_cdev_ioctl_sg_tx(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_RX_POLL:
> +		ret = csm_dp_cdev_ioctl_rx_poll(cdev, ioarg);
> +		break;
> +	case CSM_DP_IOCTL_GET_STATS:
> +		ret = csm_dp_cdev_ioctl_get_stats(cdev, ioarg);
> +		break;
> +	default:
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static void csm_dp_mempool_mem_vma_open(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma = vma->vm_private_data;
> +	atomic_t *refcnt = &mempool_vma->refcnt[CSM_DP_MMAP_TYPE_MEM];
> +
> +	if (atomic_add_return(1, refcnt) == 1) {
> +		struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +
> +		mempool_vma->vma[CSM_DP_MMAP_TYPE_MEM] = vma;
> +		if (!csm_dp_mempool_hold(mempool))
> +			atomic_dec(refcnt);
> +	}
> +}
> +
> +static void csm_dp_mempool_mem_vma_close(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma = vma->vm_private_data;
> +	atomic_t *refcnt = &mempool_vma->refcnt[CSM_DP_MMAP_TYPE_MEM];
> +
> +	if (atomic_dec_and_test(refcnt)) {
> +		struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +
> +		mempool_vma->vma[CSM_DP_MMAP_TYPE_MEM] = NULL;
> +		csm_dp_mempool_put(mempool);
> +	}
> +}
> +
> +static const struct vm_operations_struct csm_dp_mempool_mem_vma_ops = {
> +	.open   = csm_dp_mempool_mem_vma_open,
> +	.close  = csm_dp_mempool_mem_vma_close,
> +};
> +
> +static int csm_dp_mempool_mem_mmap(struct csm_dp_mempool_vma *mempool_vma,
> +				   struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +	struct csm_dp_mem *mem;
> +	unsigned long size;
> +	int ret;
> +	unsigned long addr = vma->vm_start;
> +	int i;
> +	unsigned long remainder;
> +
> +	if (mempool_vma->vma[CSM_DP_MMAP_TYPE_MEM]) {
> +		pr_err("memory already mapped\n");
> +		return -EBUSY;
> +	}
> +	if (!csm_dp_mempool_hold(mempool)) {
> +		pr_err("mempool does not exist, mempool %p\n", mempool);
> +		return -EAGAIN;
> +	}
> +
> +	mem = &mempool->mem;
> +	size = vma->vm_end - vma->vm_start;
> +	remainder = mem->loc.size;
> +	if (size < remainder) {
> +		ret = -EINVAL;
> +		pr_err("size(0x%lx) too small, expect at least 0x%lx\n",
> +		       size, remainder);
> +		goto out;
> +	}
> +
> +	/* Reset pgoff */
> +	vma->vm_pgoff = 0;
> +
> +	for (i = 0; i < mem->loc.num_cluster; i++) {
> +		unsigned long len;
> +
> +		if (i ==  mem->loc.num_cluster - 1)
> +			len = remainder;
> +		else
> +			len = CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +
> +		ret = remap_pfn_range(vma, addr,
> +				      page_to_pfn(mem->loc.page[i]),
> +				     len,
> +				     vma->vm_page_prot);
> +		if (ret) {
> +			pr_err("dma mmap failed\n");
> +			goto out;
> +		}
> +		addr += len;
> +		remainder -= len;
> +	}
> +
> +	vma->vm_private_data = mempool_vma;
> +	vma->vm_ops = &csm_dp_mempool_mem_vma_ops;
> +	csm_dp_mempool_mem_vma_open(vma);
> +
> +out:
> +	csm_dp_mempool_put(mempool);
> +	return ret;
> +}
> +
> +static void csm_dp_mempool_ring_vma_open(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma = vma->vm_private_data;
> +	atomic_t *refcnt = &mempool_vma->refcnt[CSM_DP_MMAP_TYPE_RING];
> +
> +	if (atomic_add_return(1, refcnt) == 1) {
> +		struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +
> +		mempool_vma->vma[CSM_DP_MMAP_TYPE_RING] = vma;
> +		__csm_dp_mempool_hold(mempool);
> +	}
> +}
> +
> +static void csm_dp_mempool_ring_vma_close(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma = vma->vm_private_data;
> +	atomic_t *refcnt = &mempool_vma->refcnt[CSM_DP_MMAP_TYPE_RING];
> +
> +	if (atomic_dec_and_test(refcnt)) {
> +		struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +
> +		mempool_vma->vma[CSM_DP_MMAP_TYPE_RING] = NULL;
> +		csm_dp_mempool_put(mempool);
> +	}
> +}
> +
> +static const struct vm_operations_struct csm_dp_mempool_ring_vma_ops = {
> +	.open   = csm_dp_mempool_ring_vma_open,
> +	.close  = csm_dp_mempool_ring_vma_close,
> +};
> +
> +static int csm_dp_mempool_ring_mmap(struct csm_dp_mempool_vma *mempool_vma,
> +				    struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +	struct csm_dp_ring *ring;
> +	unsigned long size;
> +	int ret;
> +
> +	if (mempool_vma->vma[CSM_DP_MMAP_TYPE_RING]) {
> +		pr_err("ring already mapped, mem_type=%u\n", mempool->type);
> +		ret = -EBUSY;
> +	}
> +
> +	if (!csm_dp_mempool_hold(mempool)) {
> +		pr_err("mempool not exist\n");
> +		return -EAGAIN;
> +	}
> +
> +	ring = &mempool->ring;
> +	size = vma->vm_end - vma->vm_start;
> +	if (size < csm_dp_mem_loc_mmap_size(&ring->loc)) {
> +		pr_err("size(0x%lx) too small, expect at least 0x%lx\n",
> +		       size, csm_dp_mem_loc_mmap_size(&ring->loc));
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	ret = remap_pfn_range(vma,
> +			      vma->vm_start,
> +			      page_to_pfn(ring->loc.page[0]),
> +			      ring->loc.size,
> +			      vma->vm_page_prot);
> +	if (ret) {
> +		pr_err("remap_pfn_range failed\n");
> +		goto out;
> +	}
> +
> +	/* Reset pgoff */
> +	vma->vm_pgoff = 0;
> +	vma->vm_private_data = mempool_vma;
> +	vma->vm_ops = &csm_dp_mempool_ring_vma_ops;
> +	csm_dp_mempool_ring_vma_open(vma);
> +
> +out:
> +	csm_dp_mempool_put(mempool);
> +	return ret;
> +}
> +
> +/* mmap mempool into user space */
> +static int csm_dp_cdev_mempool_mmap(struct csm_dp_cdev *cdev,
> +				    struct vm_area_struct *vma)
> +{
> +	struct csm_dp_mempool_vma *mempool_vma;
> +	unsigned int mem_type, type, cookie;
> +	int ret = 0;
> +
> +	/* use vm_pgoff to distinguish different area to map */
> +	cookie = vma->vm_pgoff << PAGE_SHIFT;
> +	type = CSM_DP_MMAP_COOKIE_TO_TYPE(cookie);
> +	mem_type = CSM_DP_MMAP_COOKIE_TO_MEM_TYPE(cookie);
> +
> +	if (!csm_dp_mem_type_is_valid(mem_type) ||
> +	    !csm_dp_mmap_type_is_valid(type)) {
> +		pr_err("invalid cookie(0x%x)\n", cookie);
> +		return -EINVAL;
> +	}
> +
> +	mempool_vma = &cdev->mempool_vma[mem_type];
> +	switch (type) {
> +	case CSM_DP_MMAP_TYPE_RING:
> +		/* map ring for buffer management */
> +		ret = csm_dp_mempool_ring_mmap(mempool_vma, vma);
> +		break;
> +	case CSM_DP_MMAP_TYPE_MEM:
> +		/* map buffer memory */
> +		ret = csm_dp_mempool_mem_mmap(mempool_vma, vma);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static void csm_dp_rxqueue_vma_open(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_rxqueue_vma *rxq_vma = vma->vm_private_data;
> +
> +	if (atomic_add_return(1, &rxq_vma->refcnt) == 1) {
> +		struct csm_dp_rxqueue *rxq;
> +
> +		rxq_vma->vma = vma;
> +		rxq_vma->type = CSM_DP_MMAP_RX_COOKIE_TO_TYPE(vma->vm_pgoff << PAGE_SHIFT);
> +
> +		rxq = csm_dp_rxqueue_vma_to_rxqueue(rxq_vma);
> +		atomic_inc(&rxq->refcnt);
> +	}
> +}
> +
> +static void csm_dp_rxqueue_vma_close(struct vm_area_struct *vma)
> +{
> +	struct csm_dp_rxqueue_vma *rxq_vma = vma->vm_private_data;
> +	struct csm_dp_rxqueue *rxq = csm_dp_rxqueue_vma_to_rxqueue(rxq_vma);
> +
> +	if (!atomic_dec_and_test(&rxq_vma->refcnt))
> +		return;
> +	rxq_vma->vma = NULL;
> +	atomic_dec(&rxq->refcnt);
> +}
> +
> +static const struct vm_operations_struct csm_dp_rxqueue_vma_ops = {
> +	.open   = csm_dp_rxqueue_vma_open,
> +	.close  = csm_dp_rxqueue_vma_close,
> +};
> +
> +/* mmap RXQ into user space */
> +static int csm_dp_cdev_rxqueue_mmap(struct csm_dp_cdev *cdev,
> +				    struct vm_area_struct *vma)
> +{
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	struct csm_dp_rxqueue_vma *rxq_vma = cdev->rxqueue_vma;
> +	struct csm_dp_ring *ring;
> +	unsigned int type, cookie;
> +	unsigned long size;
> +	int ret = 0;
> +
> +	cookie = vma->vm_pgoff << PAGE_SHIFT;
> +
> +	type = CSM_DP_MMAP_RX_COOKIE_TO_TYPE(cookie);
> +	if (!csm_dp_rx_type_is_valid(type)) {
> +		pr_err("invalid rx queue type, cookie=0x%x, type=%u\n",
> +		       cookie, type);
> +		return -EINVAL;
> +	}
> +
> +	if (!pdev->rxq[type].inited) {
> +		pr_err("rx queue type %d not initialized\n", type);
> +		return -EINVAL;
> +	}
> +
> +	if (rxq_vma[type].vma) {
> +		pr_err("rxqueue already mapped\n");
> +		return -EBUSY;
> +	}
> +
> +	ring = pdev->rxq[type].ring;
> +	size = vma->vm_end - vma->vm_start;
> +	if (size < csm_dp_mem_loc_mmap_size(&ring->loc)) {
> +		pr_err("size(0x%lx) too small, expect at least 0x%lx\n",
> +		       size, csm_dp_mem_loc_mmap_size(&ring->loc));
> +		return -EINVAL;
> +	}
> +	ret = remap_pfn_range(vma,
> +			      vma->vm_start,
> +			      page_to_pfn(ring->loc.page[0]),
> +			      ring->loc.size,
> +			      vma->vm_page_prot);
> +	if (ret) {
> +		pr_err("rxqueue mmap failed, error=%d\n", ret);
> +		return ret;
> +	}
> +
> +	vma->vm_private_data = &rxq_vma[type];
> +	vma->vm_ops = &csm_dp_rxqueue_vma_ops;
> +	csm_dp_rxqueue_vma_open(vma);
> +
> +	return 0;
> +}
> +
> +static int csm_dp_cdev_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct csm_dp_cdev *cdev = file->private_data;
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	unsigned int cookie;
> +	int ret;
> +
> +	mutex_lock(&pdev->cdev_lock);
> +
> +	cookie = vma->vm_pgoff << PAGE_SHIFT;
> +
> +	if (csm_dp_is_rxqueue_mmap_cookie(cookie))
> +		ret = csm_dp_cdev_rxqueue_mmap(cdev, vma);
> +	else
> +		ret = csm_dp_cdev_mempool_mmap(cdev, vma);
> +
> +	mutex_unlock(&pdev->cdev_lock);
> +
> +	return ret;
> +}
> +
> +static int csm_dp_cdev_open(struct inode *inode, struct file *file)
> +{
> +	struct csm_dp_dev *pdev = container_of(inode->i_cdev,
> +					    struct csm_dp_dev, cdev);
> +	struct csm_dp_cdev *cdev;
> +	struct csm_dp_mempool *mempool;
> +	struct csm_dp_mempool_vma *mempool_vma;
> +
> +	cdev = kzalloc(sizeof(*cdev), GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(cdev)) {
> +		pr_err("failed to alloc memory\n!");
> +		return -ENOMEM;
> +	}
> +
> +	cdev->pid = current->tgid;
> +	pdev->pid = cdev->pid;
> +	strscpy(pdev->pid_name, current->comm, TASK_COMM_LEN);
> +	cdev->pdev = pdev;
> +
> +	csm_dp_cdev_init_mempool_vma(cdev);
> +
> +	mutex_lock(&pdev->cdev_lock);
> +
> +	mempool_vma = cdev->mempool_vma;
> +
> +	mempool = &(*mempool_vma->pp_mempool[CSM_DP_MEM_TYPE_UL_DATA]);
> +	/* Free all the pending packets in Rx for UL data channel */
> +	free_rx_ring_buffers(mempool, false);
> +
> +	mempool = &(*mempool_vma->pp_mempool[CSM_DP_MEM_TYPE_UL_CONTROL]);
> +	/* Free all the pending packets in Rx for UL control channel */
> +	free_rx_ring_buffers(mempool, false);
> +
> +	list_add_tail(&cdev->list, &pdev->cdev_head);
> +	mutex_unlock(&pdev->cdev_lock);
> +
> +	file->private_data = cdev;
> +
> +	return 0;
> +}
> +
> +static int csm_dp_cdev_release(struct inode *inode, struct file *file)
> +{
> +	struct csm_dp_cdev *cdev = file->private_data;
> +	struct csm_dp_mempool *mempool;
> +	struct csm_dp_mempool_vma *mempool_vma = cdev->mempool_vma;
> +	struct csm_dp_dev *pdev = cdev->pdev;
> +	int type;
> +
> +	pdev->pid = -EINVAL;
> +	mutex_lock(&pdev->cdev_lock);
> +	list_del(&cdev->list);
> +
> +	mempool = &(*mempool_vma->pp_mempool[CSM_DP_MEM_TYPE_UL_DATA]);
> +	/* Free all the pending packets in Rx for UL data channel */
> +	free_rx_ring_buffers(mempool, false);
> +
> +	mempool = &(*mempool_vma->pp_mempool[CSM_DP_MEM_TYPE_UL_CONTROL]);
> +	/* Free all the pending packets in Rx for UL control channel */
> +	free_rx_ring_buffers(mempool, false);
> +
> +	for (type = 0; type < CSM_DP_MEM_TYPE_LAST; type++, mempool_vma++) {
> +		if (mempool_vma->usr_alloc)
> +			csm_dp_mempool_put(*mempool_vma->pp_mempool);
> +	}
> +
> +	kfree(cdev);
> +	mutex_unlock(&pdev->cdev_lock);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations csm_dp_cdev_fops = {
> +	.owner = THIS_MODULE,
> +	.poll = csm_dp_cdev_poll,
> +	.unlocked_ioctl = csm_dp_cdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
> +	.mmap = csm_dp_cdev_mmap,
> +	.open = csm_dp_cdev_open,
> +	.release = csm_dp_cdev_release
> +};
> +
> +int csm_dp_cdev_init(struct csm_dp_drv *pdrv)
> +{
> +	int ret;
> +
> +	pdrv->dev_class = class_create(CSM_DP_DEV_CLASS_NAME);
> +	if (IS_ERR_OR_NULL(pdrv->dev_class)) {
> +		pr_err("class_create failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = alloc_chrdev_region(&pdrv->devno, 0, CSM_DP_MAX_NUM_DEVS, CSM_DP_CDEV_NAME);
> +	if (ret) {
> +		pr_err("alloc_chrdev_region failed\n");
> +		class_destroy(pdrv->dev_class);
> +		pdrv->dev_class = NULL;
> +		pr_err("CSM-DP: failed to initialize cdev\n");
> +		return ret;
> +	}
> +
> +	pr_info("CSM-DP: cdev initialized\n");
> +	return 0;
> +}
> +
> +void csm_dp_cdev_cleanup(struct csm_dp_drv *pdrv)
> +{
> +	int i;
> +
> +	if (!pdrv->dev_class)
> +		return;
> +
> +	for (i = 0; i < CSM_DP_MAX_NUM_DEVS; i++)
> +		csm_dp_cdev_del(&pdrv->dp_devs[i]);
> +
> +	unregister_chrdev_region(pdrv->devno, CSM_DP_MAX_NUM_DEVS);
> +	class_destroy(pdrv->dev_class);
> +	pdrv->dev_class = NULL;
> +}
> +
> +/* Called from MHI probe for each VF */
> +int csm_dp_cdev_add(struct csm_dp_dev *pdev, struct device *mhi_dev)
> +{
> +	struct device *dev;
> +	int ret, new_devno;
> +	struct csm_dp_drv *pdrv = pdev->pdrv;
> +	unsigned int index = pdev - pdrv->dp_devs;
> +
> +	mutex_lock(&pdev->cdev_lock);
> +
> +	if (pdev->cdev_inited) {
> +		pr_err("cdev already initialized\n");
> +		mutex_unlock(&pdev->cdev_lock);
> +		return -EINVAL;
> +	}
> +
> +	ret = csm_dp_rx_init(pdev);
> +	if (ret) {
> +		mutex_unlock(&pdev->cdev_lock);
> +		return ret;
> +	}
> +
> +	cdev_init(&pdev->cdev, &csm_dp_cdev_fops);
> +	new_devno = MKDEV(MAJOR(pdrv->devno), index);
> +	ret = cdev_add(&pdev->cdev, new_devno, 1);
> +	if (ret) {
> +		pr_err("cdev_add failed!\n");
> +		goto err;
> +	}
> +
> +	dev = device_create(pdrv->dev_class, NULL, new_devno, pdrv, "csm%d-dp%d",
> +			    pdev->bus_num, pdev->vf_num);
> +	if (IS_ERR_OR_NULL(dev)) {
> +		pr_err("device_create failed\n");
> +		ret = PTR_ERR(dev);
> +		cdev_del(&pdev->cdev);
> +		goto err;
> +	}
> +
> +	pdev->cdev_inited = true;
> +
> +	mutex_unlock(&pdev->cdev_lock);
> +
> +	return 0;
> +
> +err:
> +	csm_dp_rx_cleanup(pdev);
> +	mutex_unlock(&pdev->cdev_lock);
> +	return ret;
> +}
> +
> +void csm_dp_cdev_del(struct csm_dp_dev *pdev)
> +{
> +	struct csm_dp_drv *pdrv = pdev->pdrv;
> +
> +	mutex_lock(&pdev->cdev_lock);
> +	if (!pdev->cdev_inited) {
> +		mutex_unlock(&pdev->cdev_lock);
> +		return;
> +	}
> +	if (!list_empty(&pdev->cdev_head)) {
> +		pr_err("Device file already open; skipping device deletion\n");
> +		mutex_unlock(&pdev->cdev_lock);
> +		return;
> +	}
> +
> +	pdev->cdev_inited = false;
> +
> +	device_destroy(pdrv->dev_class, pdev->cdev.dev);
> +	cdev_del(&pdev->cdev);
> +
> +	/* wait for idle mempools before Rx cleanup */
> +	while (1) {
> +		int control_ref = atomic_read(&pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL]->ref);
> +		int data_ref = atomic_read(&pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA]->ref);
> +
> +		pr_debug("UL_CONTROL ref %d UL_DATA ref %d\n", control_ref, data_ref);
> +		if (control_ref == 1 && data_ref == 1)
> +			break;
> +		mutex_unlock(&pdev->cdev_lock);
> +		msleep(100);
> +		mutex_lock(&pdev->cdev_lock);
> +	}
> +	csm_dp_rx_cleanup(pdev);
> +
> +	mutex_unlock(&pdev->cdev_lock);
> +}
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_core.c b/drivers/char/qcom_csm_dp/qcom_csm_dp_core.c
> new file mode 100644
> index 000000000000..c0c106e28423
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_core.c
> @@ -0,0 +1,571 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "qcom_csm_dp.h"
> +
> +#define CSM_DP_RX_QUEUE_SIZE 1024
> +#define CSM_DP_MEMPOOL_PUT_SLEEP 10
> +#define CSM_DP_MEMPOOL_PUT_ITER 2
> +
> +static struct csm_dp_drv *csm_dp_pdrv;
> +
> +static struct csm_dp_mhi *get_dp_mhi(struct csm_dp_dev *pdev, enum csm_dp_channel ch)
> +{
> +	switch (ch) {
> +	case CSM_DP_CH_CONTROL:
> +		return &pdev->mhi_control_dev;
> +	case CSM_DP_CH_DATA:
> +		return &pdev->mhi_data_dev;
> +	default:
> +		pr_err("invalid ch\n");
> +		return NULL;
> +	}
> +}
> +
> +static int csm_dp_rxqueue_init(struct csm_dp_rxqueue *rxq,
> +			       enum csm_dp_rx_type rx_type,
> +					unsigned int size)
> +{
> +	unsigned int ring_size;
> +	int ret;
> +
> +	if (!csm_dp_rx_type_is_valid(rx_type))
> +		return -EINVAL;
> +
> +	if (rxq->inited) {
> +		pr_err("rx queue already initialized!\n");
> +		return -EINVAL;
> +	}
> +
> +	ring_size = csm_dp_calc_ring_size(size);
> +	if (!ring_size)
> +		return -EINVAL;
> +
> +	rxq->ring = kzalloc(sizeof(*rxq->ring), GFP_KERNEL);
> +	if (!rxq->ring)
> +		return -ENOMEM;
> +
> +	ret = csm_dp_ring_init(rxq->ring, ring_size, CSM_DP_MMAP_RX_COOKIE(rx_type));
> +	if (ret) {
> +		pr_debug("failed to initialize rx ring!\n");
> +		kfree(rxq->ring);
> +		rxq->ring = NULL;
> +
> +		return ret;
> +	}
> +
> +	init_waitqueue_head(&rxq->wq);
> +	rxq->type = rx_type;
> +	rxq->inited = true;
> +	atomic_set(&rxq->refcnt, 0);
> +
> +	return 0;
> +}
> +
> +static void csm_dp_rxqueue_cleanup(struct csm_dp_rxqueue *rxq)
> +{
> +	unsigned long size;
> +	struct csm_dp_dev *dev = container_of(rxq,
> +					struct csm_dp_dev, rxq[rxq->type]);
> +	if (rxq->inited) {
> +		size = ((unsigned int)(1) << rxq->ring->loc.last_cl_order) * PAGE_SIZE;
> +		rxq->inited = false;
> +		wake_up(&rxq->wq);
> +		csm_dp_ring_cleanup(rxq->ring);
> +		dev->stats.mem_stats.rxq_ring_in_use[rxq->type] -= size;
> +		kfree(rxq->ring);
> +		rxq->ring = NULL;
> +	}
> +}
> +
> +void csm_dp_mempool_put(struct csm_dp_mempool *mempool)
> +{
> +	if (mempool && atomic_dec_and_test(&mempool->ref)) {
> +		struct csm_dp_mhi *mhi = &mempool->dp_dev->mhi_data_dev;
> +
> +		/* wait for any pending mempool buffers on DATA channel */
> +		if (csm_dp_mhi_is_ready(mhi)) {
> +			int counter = CSM_DP_MEMPOOL_PUT_ITER;
> +
> +			while (counter-- && atomic_read(&mempool->out_xmit)) {
> +				csm_dp_mhi_tx_poll(mhi);
> +				msleep(CSM_DP_MEMPOOL_PUT_SLEEP);
> +			}
> +		}
> +
> +		csm_dp_mempool_free(mempool);
> +	}
> +}
> +
> +void csm_dp_rx(struct csm_dp_dev *pdev, struct csm_dp_buf_cntrl *buf_cntrl, unsigned int length)
> +{
> +	struct csm_dp_mempool *mempool;
> +	struct csm_dp_rxqueue *rxq;
> +	struct csm_dp_buf_cntrl *packet_start = buf_cntrl, *packet_next;
> +	unsigned int offset, cl, i;
> +	void *addr = buf_cntrl + 1;
> +
> +	if (unlikely(!pdev || !addr || !length)) {
> +		pr_err("invalid argument\n");
> +		return;
> +	}
> +
> +	mempool = csm_dp_get_mempool(pdev, buf_cntrl, &cl);
> +	if (!mempool) {
> +		pr_err("not UL address, addr=%p\n", addr);
> +		return;
> +	}
> +
> +	for (i = 0; i < buf_cntrl->buf_count; i++) {
> +		packet_next = packet_start->next;
> +		packet_start->state = CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP;
> +		packet_start = packet_next;
> +	}
> +	packet_start = buf_cntrl;
> +	packet_next = NULL;
> +
> +	if (mempool->type == CSM_DP_MEM_TYPE_UL_DATA) {
> +		struct csm_dp_buf_cntrl **p = &pdev->pending_packets;
> +
> +		while (*p)
> +			p = &((*p)->next_packet);
> +
> +		*p = buf_cntrl;
> +		return;
> +	}
> +
> +	/* only one Rx queue */
> +	rxq = &pdev->rxq[CSM_DP_RX_TYPE_FAPI];
> +
> +	if (!atomic_read(&rxq->refcnt)) {
> +		pr_debug("rxq not active, drop message\n");
> +		goto free_rxbuf;
> +	}
> +
> +	offset = csm_dp_get_mem_offset(addr, &mempool->mem.loc, cl);
> +	if (csm_dp_ring_write(rxq->ring, offset)) {
> +		pr_err("failed to enqueue rx packet\n");
> +		goto free_rxbuf;
> +	}
> +	wake_up(&rxq->wq);
> +	pdev->stats.rx_cnt++;
> +	return;
> +free_rxbuf:
> +	for (i = 0; i < buf_cntrl->buf_count; i++) {
> +		addr = packet_start + 1;
> +		packet_next = packet_start->next;
> +		csm_dp_mempool_put_buf(mempool, addr);
> +		pdev->stats.rx_drop++;
> +		packet_start = packet_next;
> +	}
> +}
> +
> +int csm_dp_rx_init(struct csm_dp_dev *pdev)
> +{
> +	unsigned int type;
> +	int ret;
> +	unsigned int csm_dp_ul_buf_size = CSM_DP_DEFAULT_UL_BUF_SIZE;
> +	unsigned int csm_dp_ul_buf_cnt = CSM_DP_DEFAULT_UL_BUF_CNT;
> +	unsigned int rx_queue_size = CSM_DP_RX_QUEUE_SIZE;
> +
> +	if (csm_dp_ul_buf_size > CSM_DP_MAX_UL_MSG_LEN) {
> +		pr_err("UL buffer size %d exceeds limit %d\n",
> +		       csm_dp_ul_buf_size,
> +		       CSM_DP_MAX_UL_MSG_LEN);
> +		return -ENOMEM;
> +	}
> +
> +	pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL] = csm_dp_mempool_alloc(pdev,
> +									 CSM_DP_MEM_TYPE_UL_CONTROL,
> +									 csm_dp_ul_buf_size,
> +									 csm_dp_ul_buf_cnt,
> +									 false);
> +	if (!pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL]) {
> +		pr_err("failed to allocate UL_CONTROL memory pool!\n");
> +		return -ENOMEM;
> +	}
> +
> +	pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA] = csm_dp_mempool_alloc(pdev, CSM_DP_MEM_TYPE_UL_DATA,
> +								      csm_dp_ul_buf_size,
> +								      csm_dp_ul_buf_cnt,
> +								      false);
> +	if (!pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA]) {
> +		pr_err("failed to allocate UL_DATA memory pool!\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (type = 0; type < CSM_DP_RX_TYPE_LAST; type++) {
> +		ret = csm_dp_rxqueue_init(&pdev->rxq[type], type, rx_queue_size);
> +		if (ret) {
> +			pr_err("failed to init rxqueue!\n");
> +			return ret;
> +		}
> +		pdev->stats.mem_stats.rxq_ring_in_use[type] +=
> +				pdev->rxq[type].ring->loc.true_alloc_size;
> +	}
> +
> +	return 0;
> +}
> +
> +void csm_dp_rx_cleanup(struct csm_dp_dev *pdev)
> +{
> +	unsigned int type;
> +
> +	if (pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL])
> +		csm_dp_mempool_free(pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL]);
> +	if (pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA])
> +		csm_dp_mempool_free(pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA]);
> +
> +	for (type = 0; type < CSM_DP_RX_TYPE_LAST; type++)
> +		csm_dp_rxqueue_cleanup(&pdev->rxq[type]);
> +}
> +
> +int csm_dp_tx(struct csm_dp_dev *pdev,
> +	      enum csm_dp_channel ch,
> +	      struct iovec *iov,
> +	      unsigned int iov_nr,
> +	      unsigned int flag,
> +	      dma_addr_t dma_addr_array[])
> +{
> +	int ret = 0, n;
> +	unsigned int num, to_send;
> +	int j;
> +	struct csm_dp_mhi *mhi;
> +
> +	if (unlikely(!pdev || !iov || !iov_nr))
> +		return -EINVAL;
> +
> +	mhi = get_dp_mhi(pdev, ch);
> +
> +	if (flag & CSM_DP_TX_FLAG_SG) {
> +		if (iov_nr > CSM_DP_MAX_SG_IOV_SIZE) {
> +			pr_err("sg iov size too big!\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	atomic_inc(&mhi->mhi_dev_refcnt);
> +	if (!csm_dp_mhi_is_ready(mhi)) {
> +		atomic_dec(&mhi->mhi_dev_refcnt);
> +		if (pdev->stats.tx_drop % 1024 == 0)
> +			pr_err("mhi is not ready!\n");
> +		pdev->stats.tx_drop++;
> +		return -ENODEV;
> +	}
> +
> +	mutex_lock(&mhi->tx_mutex);
> +	to_send = 0;
> +	for (n = 0, to_send = iov_nr; to_send > 0; ) {
> +		if (to_send > CSM_DP_MAX_IOV_SIZE)
> +			num = CSM_DP_MAX_IOV_SIZE;
> +		else
> +			num = to_send;
> +		for (j = 0; j < num; j++) {
> +			if ((flag & CSM_DP_TX_FLAG_SG) && n != (iov_nr - 1))
> +				mhi->dl_flag_array[j] = MHI_CHAIN;
> +			else
> +				mhi->dl_flag_array[j] =  MHI_EOT;
> +			mhi->dl_buf_array[j].len = iov[n].iov_len;
> +
> +			if (flag & CSM_DP_TX_FLAG_SG) {
> +				mhi->dl_flag_array[j] |= MHI_SG;
> +				mhi->dl_buf_array[j].buf = iov[0].iov_base;
> +			} else {
> +				mhi->dl_buf_array[j].buf = iov[n].iov_base;
> +			}
> +
> +			if (ch == CSM_DP_CH_DATA)
> +				mhi->dl_flag_array[j] |= MHI_BEI;
> +
> +			if (dma_addr_array[n])
> +				mhi->dl_buf_array[j].dma_addr =
> +					dma_addr_array[n];
> +			else
> +				mhi->dl_buf_array[j].dma_addr = 0;
> +
> +			mhi->dl_buf_array[j].streaming_dma = true;
> +			n++;
> +		}
> +		ret = csm_dp_mhi_n_tx(mhi, num);
> +		if (ret) {
> +			pdev->stats.tx_err++;
> +			break;
> +		}
> +		to_send -= num;
> +	}
> +
> +	if (!(flag & CSM_DP_TX_FLAG_SG))
> +		pdev->stats.tx_cnt += (iov_nr - to_send);
> +	else if (!to_send)
> +		pdev->stats.tx_cnt++;
> +	mutex_unlock(&mhi->tx_mutex);
> +
> +	if (ch == CSM_DP_CH_DATA)
> +		csm_dp_mhi_tx_poll(mhi);
> +
> +	atomic_dec(&mhi->mhi_dev_refcnt);
> +	return ret;
> +}
> +
> +int csm_dp_rx_poll(struct csm_dp_dev *pdev, struct iovec *iov, size_t iov_nr)
> +{
> +	int ret;
> +	struct csm_dp_buf_cntrl *cur_packet;
> +	size_t n = 0, remain = iov_nr;
> +
> +	atomic_inc(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +	if (!csm_dp_mhi_is_ready(&pdev->mhi_data_dev)) {
> +		pdev->stats.rx_poll_ignore++;
> +		atomic_dec(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * poll to get packets from MHI. This will cause dl_xfer (RX callback) to get called which
> +	 * will then link the Rx packets into pdrv->pending_packets
> +	 */
> +	ret = mhi_poll(pdev->mhi_data_dev.mhi_dev, CSM_DP_NAPI_WEIGHT, DMA_FROM_DEVICE);
> +	if (ret < 0) {
> +		pr_err_ratelimited("Error:%d rx polling for bus:%d VF:%d %s\n",
> +				   ret, pdev->bus_num, pdev->vf_num, ch_name(CSM_DP_CH_DATA));
> +		atomic_dec(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +		return ret;
> +	}
> +
> +	ret = csm_dp_mhi_rx_replenish(&pdev->mhi_data_dev);
> +	if (ret < 0)
> +		pr_err_ratelimited("Error:%d rx replenish for bus:%d VF:%d %s\n",
> +				   ret, pdev->bus_num, pdev->vf_num, ch_name(CSM_DP_CH_DATA));
> +
> +	atomic_dec(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +
> +	/* fill iov with the received packets */
> +	cur_packet = pdev->pending_packets;
> +	while (cur_packet) {
> +		struct csm_dp_buf_cntrl *cur_buf, *tmp;
> +
> +		if (cur_packet->buf_count > remain) {
> +			if (cur_packet == pdev->pending_packets)
> +				return -EINVAL;	/* provided iov is too short even for 1st packet */
> +			/* no more room in iov, we're done */
> +			break;
> +		}
> +
> +		for (cur_buf = cur_packet; cur_buf; cur_buf = cur_buf->next) {
> +			unsigned int cl;
> +			struct csm_dp_mempool *mempool = pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA];
> +
> +			if (!mempool) {
> +				pr_err_ratelimited("not UL address\n");
> +				continue;
> +			}
> +
> +			cl = csm_dp_mem_get_cluster(&mempool->mem, cur_buf->buf_index);
> +			iov[n].iov_base = (void *)csm_dp_get_mem_offset(cur_buf + 1,
> +									&mempool->mem.loc, cl);
> +			iov[n].iov_len = cur_buf->len;
> +			n++;
> +			remain--;
> +		}
> +
> +		tmp = cur_packet;
> +		cur_packet = cur_packet->next_packet;
> +		tmp->next_packet = NULL;
> +	}
> +
> +	pdev->pending_packets = cur_packet;
> +
> +	return n;
> +}
> +
> +int csm_dp_get_stats(struct csm_dp_dev *pdev, struct csm_dp_ioctl_getstats *stats)
> +{
> +	struct csm_dp_mhi *mhi = NULL;
> +
> +	switch (stats->ch) {
> +	case CSM_DP_CH_CONTROL:
> +		mhi = &pdev->mhi_control_dev;
> +		break;
> +	case CSM_DP_CH_DATA:
> +		mhi = &pdev->mhi_data_dev;
> +		break;
> +	}
> +
> +	if (!mhi)
> +		return -EINVAL;
> +
> +	stats->tx_cnt = mhi->stats.tx_cnt;
> +	stats->tx_acked = mhi->stats.tx_acked;
> +	stats->rx_cnt = mhi->stats.rx_cnt;
> +
> +	return 0;
> +}
> +
> +/* napi function to replenish control channel */
> +static int csm_dp_poll(struct napi_struct *napi, int budget)
> +{
> +	int rx_work = 0;
> +	struct csm_dp_dev *pdev;
> +	int ret;
> +
> +	pdev = container_of(napi, struct csm_dp_dev, napi);
> +	atomic_inc(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +	if (!csm_dp_mhi_is_ready(&pdev->mhi_control_dev)) {
> +		pdev->stats.rx_poll_ignore++;
> +		atomic_dec(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +		return -ENODEV;
> +	}
> +
> +	rx_work = mhi_poll(pdev->mhi_control_dev.mhi_dev, budget, DMA_FROM_DEVICE);
> +	if (rx_work < 0) {
> +		pr_err("Error Rx polling ret:%d\n", rx_work);
> +		rx_work = 0;
> +		napi_complete(napi);
> +		goto exit_poll;
> +	}
> +
> +	ret = csm_dp_mhi_rx_replenish(&pdev->mhi_control_dev);
> +	if (ret == -ENOMEM)
> +		schedule_work(&pdev->alloc_work);  /* later */
> +	if (rx_work < budget)
> +		napi_complete(napi);
> +	else
> +		pdev->stats.rx_budget_overflow++;
> +exit_poll:
> +	atomic_dec(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +	return rx_work;
> +}
> +
> +/* worker function to replenish control channel, in case replenish failed in napi function */
> +static void csm_dp_alloc_work(struct work_struct *work)
> +{
> +	struct csm_dp_dev *pdev;
> +	const int sleep_ms =  1000;
> +	int retry = 60;
> +	int ret;
> +
> +	pdev = container_of(work, struct csm_dp_dev, alloc_work);
> +
> +	do {
> +		ret = csm_dp_mhi_rx_replenish(&pdev->mhi_control_dev);
> +		/* sleep and try again */
> +		if (ret == -ENOMEM) {
> +			msleep(sleep_ms);
> +			retry--;
> +		}
> +	} while (ret == -ENOMEM && retry);
> +}
> +
> +static int csm_dp_core_init(struct csm_dp_drv *pdrv)
> +{
> +	int i;
> +
> +	for (i = 0; i < CSM_DP_MAX_NUM_DEVS; i++) {
> +		struct csm_dp_dev *pdev = &pdrv->dp_devs[i];
> +
> +		pdev->pdrv = pdrv;
> +		mutex_init(&pdev->mempool_lock);
> +		mutex_init(&pdev->cdev_lock);
> +		INIT_LIST_HEAD(&pdev->cdev_head);
> +		pdev->dummy_dev = alloc_netdev_dummy(0);
> +		netif_napi_add(pdev->dummy_dev, &pdev->napi, csm_dp_poll);
> +		napi_enable(&pdev->napi);
> +		INIT_WORK(&pdev->alloc_work, csm_dp_alloc_work);
> +	}
> +
> +	return 0;
> +}
> +
> +static void csm_dp_core_cleanup(struct csm_dp_drv *pdrv)
> +{
> +	int i;
> +
> +	for (i = 0; i < CSM_DP_MAX_NUM_DEVS; i++) {
> +		struct csm_dp_dev *pdev = &pdrv->dp_devs[i];
> +
> +		flush_work(&pdev->alloc_work);
> +		napi_disable(&pdev->napi);
> +		netif_napi_del(&pdev->napi);
> +
> +		csm_dp_rx_cleanup(pdev);
> +	}
> +
> +	kfree(pdrv);
> +}
> +
> +static int csm_dp_init(void)
> +{
> +	struct csm_dp_drv *pdrv;
> +	int ret;
> +
> +	pr_info("CSM-DP: probing CSM\n");
> +
> +	pdrv = kzalloc(sizeof(*pdrv), GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(pdrv))
> +		return -ENOMEM;
> +	csm_dp_pdrv = pdrv;
> +
> +	ret = csm_dp_core_init(pdrv);
> +	if (ret)
> +		goto cleanup;
> +
> +	ret = csm_dp_cdev_init(pdrv);
> +	if (ret)
> +		goto cleanup_cdev;
> +
> +	csm_dp_debugfs_init(pdrv);
> +
> +	ret = csm_dp_mhi_init(pdrv);
> +	if (ret)
> +		goto cleanup_debugfs;
> +
> +	pr_info("CSM-DP: module initialized now\n");
> +	return 0;
> +
> +cleanup_debugfs:
> +	csm_dp_debugfs_cleanup(pdrv);
> +cleanup_cdev:
> +	csm_dp_cdev_cleanup(pdrv);
> +cleanup:
> +	csm_dp_core_cleanup(pdrv);
> +	csm_dp_pdrv = NULL;
> +	pr_err("CSM-DP: module init failed!\n");
> +	return ret;
> +}
> +
> +static int csm_dp_remove(void)
> +{
> +	struct csm_dp_drv *pdrv = csm_dp_pdrv;
> +
> +	if (pdrv) {
> +		csm_dp_mhi_cleanup(pdrv);
> +		csm_dp_cdev_cleanup(pdrv);
> +		csm_dp_debugfs_cleanup(pdrv);
> +		csm_dp_core_cleanup(pdrv);
> +	}
> +	csm_dp_pdrv = NULL;
> +
> +	return 0;
> +}
> +
> +static int __init csm_dp_module_init(void)
> +{
> +	return csm_dp_init();
> +}
> +module_init(csm_dp_module_init);
> +
> +static void __exit csm_dp_module_exit(void)
> +{
> +	csm_dp_remove();
> +}
> +module_exit(csm_dp_module_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("QUALCOMM CSM DP driver");
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c b/drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c
> new file mode 100644
> index 000000000000..9d2d158cb30f
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_debugfs.c
> @@ -0,0 +1,993 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "qcom_csm_dp.h"
> +#include "qcom_csm_dp_mhi.h"
> +#ifdef CONFIG_DEBUG_FS
> +
> +#include <linux/atomic.h>
> +#include <linux/debugfs.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/slab.h>
> +
> +#define CSM_DP_MEM_DUMP_COL_WIDTH 16
> +#define CSM_DP_MAX_MEM_DUMP_SIZE 256
> +
> +#define CSM_DP_DEFINE_DEBUGFS_OPS(name, __read, __write)	\
> +static int name ##_open(struct inode *inode, struct file *file)	\
> +{								\
> +	return single_open(file, __read, inode->i_private);	\
> +}								\
> +static const struct file_operations name ##_ops = {		\
> +	.open	 = name ## _open,				\
> +	.read = seq_read,					\
> +	.write = __write,					\
> +	.llseek = seq_lseek,					\
> +	.release = single_release,				\
> +}
> +
> +static int __csm_dp_rxqueue_vma_dump(struct seq_file *s,
> +				     struct csm_dp_rxqueue_vma *rxq_vma)
> +{
> +	if (rxq_vma->vma) {
> +		struct vm_area_struct *vma = rxq_vma->vma;
> +
> +		seq_printf(s, "    Type:               %s\n",
> +			   csm_dp_rx_type_to_str(rxq_vma->type));
> +		seq_printf(s, "    RefCnt:             %d\n",
> +			   atomic_read(&rxq_vma->refcnt));
> +		seq_printf(s,
> +			   "        vm_start:       %lx\n"
> +			   "        vm_end:         %lx\n"
> +			   "        vm_pgoff:       %lx\n"
> +			   "        vm_flags:       %lx\n",
> +			   vma->vm_start,
> +			   vma->vm_end,
> +			   vma->vm_pgoff,
> +			   vma->vm_flags);
> +	}
> +	return 0;
> +}
> +
> +static int __csm_dp_mempool_vma_dump(struct seq_file *s,
> +				     struct csm_dp_mempool_vma *mempool_vma)
> +{
> +	struct csm_dp_mempool *mempool = *mempool_vma->pp_mempool;
> +	struct vm_area_struct *vma;
> +	int i;
> +
> +	if (mempool)
> +		seq_printf(s, "    Type:               %s\n",
> +			   csm_dp_mem_type_to_str(mempool->type));
> +
> +	for (i = 0; i < CSM_DP_MMAP_TYPE_LAST; i++) {
> +		if (mempool_vma->vma[i]) {
> +			vma = mempool_vma->vma[i];
> +			seq_printf(s, "    VMA[%d]:             %s\n",
> +				   i, csm_dp_mmap_type_to_str(i));
> +			seq_printf(s,
> +				   "        vm_start:       %lx\n"
> +				   "        vm_end:         %lx\n"
> +				   "        vm_pgoff:       %lx\n"
> +				   "        vm_flags:       %lx\n",
> +				   vma->vm_start,
> +				   vma->vm_end,
> +				   vma->vm_pgoff,
> +				   vma->vm_flags);
> +			seq_printf(s, "        refcnt:         %d\n",
> +				   atomic_read(&mempool_vma->refcnt[i]));
> +		}
> +	}
> +	return 0;
> +}
> +
> +static int __csm_dp_ring_opstats_dump(struct seq_file *s,
> +				      struct csm_dp_ring_opstats *stats)
> +{
> +	seq_puts(s, "Read:\n");
> +	seq_printf(s, "    Ok:                %u\n", atomic_read(&stats->read_ok));
> +	seq_printf(s, "    Empty:             %u\n", atomic_read(&stats->read_empty));
> +	seq_puts(s, "Write:\n");
> +	seq_printf(s, "    Ok:                %u\n", atomic_read(&stats->write_ok));
> +	seq_printf(s, "    Full:              %u\n", atomic_read(&stats->write_full));
> +	return 0;
> +}
> +
> +static int __csm_dp_ring_runtime_dump(struct seq_file *s,
> +				      struct csm_dp_ring *ring)
> +{
> +	seq_printf(s, "ProdHdr:                %u\n", *ring->prod_head);
> +	seq_printf(s, "ProdTail:               %u\n", *ring->prod_tail);
> +	seq_printf(s, "ConsHdr:                %u\n", *ring->cons_head);
> +	seq_printf(s, "ConsTail:               %u\n", *ring->cons_tail);
> +	seq_printf(s, "NumOfElementAvail:      %u\n",
> +		   (*ring->prod_head - *ring->cons_tail) & (ring->size - 1));
> +	return 0;
> +}
> +
> +static int __csm_dp_ring_config_dump(struct seq_file *s,
> +				     struct csm_dp_ring *ring)
> +{
> +	seq_printf(s, "Ring %llx MemoryAlloc:\n", (u64)ring);
> +	seq_printf(s, "         AllocAddr:     %llx\n", (u64)ring->loc.base);
> +	seq_printf(s, "         AllocSize:     0x%08lx\n", ring->loc.size);
> +	seq_printf(s, "         MmapCookie:    0x%08x\n", ring->loc.cookie);
> +	seq_printf(s, "Size:                   0x%x\n", ring->size);
> +	seq_printf(s, "ProdHdr:                %llx\n", (u64)ring->prod_head);
> +	seq_printf(s, "ProdTail:               %llx\n", (u64)ring->prod_tail);
> +	seq_printf(s, "ConsHdr:                %llx\n", (u64)ring->cons_head);
> +	seq_printf(s, "ConsTail:               %llx\n", (u64)ring->cons_tail);
> +	seq_printf(s, "RingBuf:                %llx\n", (u64)ring->element);
> +	return 0;
> +}
> +
> +static int csm_dp_debugfs_rxq_refcnt_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_rxqueue *rxq = (struct csm_dp_rxqueue *)s->private;
> +
> +	if (rxq->inited)
> +		seq_printf(s, "%d\n", atomic_read(&rxq->refcnt));
> +
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_rxq_refcnt,
> +			  csm_dp_debugfs_rxq_refcnt_read, NULL);
> +
> +static int csm_dp_debugfs_rxq_opstats_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_rxqueue *rxq = (struct csm_dp_rxqueue *)s->private;
> +
> +	if (rxq->inited)
> +		__csm_dp_ring_opstats_dump(s, &rxq->ring->opstats);
> +
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_rxq_opstats,
> +			  csm_dp_debugfs_rxq_opstats_read, NULL);
> +
> +static int csm_dp_debugfs_rxq_config_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_rxqueue *rxq = (struct csm_dp_rxqueue *)s->private;
> +
> +	if (rxq->inited) {
> +		seq_printf(s, "Type:                   %s\n",
> +			   csm_dp_rx_type_to_str(rxq->type));
> +		__csm_dp_ring_config_dump(s, rxq->ring);
> +	}
> +
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_rxq_config,
> +			  csm_dp_debugfs_rxq_config_read, NULL);
> +
> +static int csm_dp_debugfs_rxq_runtime_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_rxqueue *rxq = (struct csm_dp_rxqueue *)s->private;
> +
> +	if (rxq->inited)
> +		__csm_dp_ring_runtime_dump(s, rxq->ring);
> +
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_rxq_runtime,
> +			  csm_dp_debugfs_rxq_runtime_read, NULL);
> +
> +static unsigned int __mem_dump_size[CSM_DP_MEM_TYPE_LAST];
> +static unsigned int __mem_offset[CSM_DP_MEM_TYPE_LAST];
> +
> +static int csm_dp_debugfs_mem_data_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +		unsigned int n = __mem_dump_size[mempool->type];
> +		unsigned int offset = __mem_offset[mempool->type];
> +		unsigned int i, j;
> +		unsigned int cluster, c_offset;
> +		unsigned char *data = (unsigned char *)mem->loc.base + offset;
> +
> +		data = csm_dp_mem_offset_addr(mem, offset, &cluster, &c_offset);
> +		if (!data)
> +			return 0;
> +		if (n > (mem->loc.size - offset))
> +			n = mem->loc.size - offset;
> +
> +		for (i = 0; i < offset % CSM_DP_MEM_DUMP_COL_WIDTH; i++)
> +			seq_puts(s, "   ");
> +
> +		for (j = 0; j < n; j++, i++) {
> +			if (i && !(i % CSM_DP_MEM_DUMP_COL_WIDTH))
> +				seq_puts(s, "\n");
> +			seq_printf(s, "%02x ", *data);
> +			data++;
> +			c_offset++;
> +			if (c_offset >= CSM_DP_MEMPOOL_CLUSTER_SIZE) {
> +				c_offset = 0;
> +				cluster++;
> +				data = mem->loc.cluster_kernel_addr[cluster];
> +			}
> +		}
> +		seq_puts(s, "\n");
> +	}
> +	return 0;
> +}
> +
> +static ssize_t csm_dp_debugfs_mem_data_write(struct file *fp,
> +					     const char __user *buf,
> +					     size_t count, loff_t *ppos)
> +{
> +	struct csm_dp_mempool *mempool = *((struct csm_dp_mempool **)
> +			(((struct seq_file *)fp->private_data)->private));
> +
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +		unsigned int value = 0;
> +		unsigned int *data;
> +		unsigned int offset = __mem_offset[mempool->type];
> +		unsigned int cluster, c_offset;
> +
> +		if (kstrtouint_from_user(buf, count, 0, &value))
> +			return -EFAULT;
> +		data = (unsigned int *)csm_dp_mem_offset_addr(mem, offset,
> +								&cluster, &c_offset);
> +		if (!data)
> +			return count;
> +		*data = value;
> +	}
> +	return count;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mem_data,
> +			  csm_dp_debugfs_mem_data_read,
> +			  csm_dp_debugfs_mem_data_write);
> +
> +static int csm_dp_debugfs_mem_dump_size_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		seq_printf(s, "%u\n", __mem_dump_size[mempool->type]);
> +	return 0;
> +}
> +
> +static ssize_t csm_dp_debugfs_mem_dump_size_write(struct file *fp,
> +						  const char __user *buf,
> +						  size_t count, loff_t *ppos)
> +{
> +	struct csm_dp_mempool *mempool = *((struct csm_dp_mempool **)
> +			(((struct seq_file *)fp->private_data)->private));
> +	unsigned int value = 0;
> +
> +	if (!mempool)
> +		goto done;
> +
> +	if (kstrtouint_from_user(buf, count, 0, &value))
> +		return -EFAULT;
> +
> +	if (value > CSM_DP_MAX_MEM_DUMP_SIZE)
> +		return -EINVAL;
> +
> +	__mem_dump_size[mempool->type] = value;
> +done:
> +	return count;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mem_dump_size,
> +			  csm_dp_debugfs_mem_dump_size_read,
> +			  csm_dp_debugfs_mem_dump_size_write);
> +
> +static int csm_dp_debugfs_mem_offset_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		seq_printf(s, "0x%08x\n", __mem_offset[mempool->type]);
> +	return 0;
> +}
> +
> +static ssize_t csm_dp_debugfs_mem_offset_write(struct file *fp,
> +					       const char __user *buf,
> +					       size_t count,
> +					       loff_t *ppos)
> +{
> +	struct csm_dp_mempool *mempool = *((struct csm_dp_mempool **)
> +			(((struct seq_file *)fp->private_data)->private));
> +
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +		unsigned int value = 0;
> +
> +		if (kstrtouint_from_user(buf, count, 0, &value))
> +			return -EFAULT;
> +
> +		if (value >= mem->loc.size)
> +			return -EINVAL;
> +		if (value & 3)
> +			return -EINVAL;
> +
> +		__mem_offset[mempool->type] = value;
> +	}
> +	return count;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mem_offset,
> +			  csm_dp_debugfs_mem_offset_read,
> +			  csm_dp_debugfs_mem_offset_write);
> +
> +static int csm_dp_debugfs_mem_config_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +	int i;
> +
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +
> +		seq_puts(s, "MemoryAlloc:\n");
> +		seq_printf(s, "    AllocSize:     0x%08lx\n",
> +			   mem->loc.size);
> +		seq_printf(s, "    Total Cluster:  %d\n",
> +			   mem->loc.num_cluster);
> +		seq_printf(s, "    Cluster Size:  0x%x\n",
> +			   CSM_DP_MEMPOOL_CLUSTER_SIZE);
> +		for (i = 0; i < mem->loc.num_cluster; i++)
> +			seq_printf(s, "    Cluster %d Addr: %llx\n", i,
> +				   (u64)mem->loc.cluster_kernel_addr[i]);
> +		seq_printf(s, "    Buffer Per Cluster:  %d\n",
> +			   mem->loc.buf_per_cluster);
> +		seq_printf(s, "    Last Cluster Order:  %d\n",
> +			   mem->loc.last_cl_order);
> +		seq_printf(s, "    MmapCookie:    %08x\n",
> +			   mem->loc.cookie);
> +		seq_printf(s, "BufSize:                0x%x\n", mem->buf_sz);
> +		seq_printf(s, "BufCount:               0x%x\n", mem->buf_cnt);
> +		seq_printf(s, "BufTrueSize:            0x%x\n",
> +			   csm_dp_buf_true_size(mem));
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mem_config,
> +			  csm_dp_debugfs_mem_config_show, NULL);
> +
> +static int csm_dp_debugfs_mem_buffer_state_show(struct seq_file *s, void *unused)
> +{
> +	int i, j;
> +	int k_free = 0;
> +	int k_alloc_dma = 0;
> +	int k_recv_msgq_app = 0;
> +	int k_xmit_dma = 0;
> +	int k_xmit_dma_comp = 0;
> +	int u_free = 0;
> +	int u_alloc = 0;
> +	int u_recv = 0;
> +	char *cl_start;
> +	unsigned int cl_buf_cnt;
> +	struct csm_dp_buf_cntrl *p;
> +
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +
> +		if (!csm_dp_mem_type_is_valid(mempool->type))
> +			return 0;
> +
> +		for (j = 0; j < mem->loc.num_cluster; j++) {
> +			cl_start = mem->loc.cluster_kernel_addr[j];
> +			if (j == mem->loc.num_cluster - 1)
> +				cl_buf_cnt = mem->buf_cnt -
> +					(mem->loc.buf_per_cluster * j);
> +			else
> +				cl_buf_cnt = mem->loc.buf_per_cluster;
> +			for (i = 0; i < cl_buf_cnt; i++) {
> +				p = (struct csm_dp_buf_cntrl *)(cl_start +
> +					(i * csm_dp_buf_true_size(mem)));
> +
> +				if (!p)
> +					break;
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_FREE)
> +					k_free++;
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA)
> +					k_alloc_dma++;
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP)
> +					k_recv_msgq_app++;
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_XMIT_DMA)
> +					k_xmit_dma++;
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP)
> +					k_xmit_dma_comp++;
> +				if (p->state == CSM_DP_BUF_STATE_USER_FREE)
> +					u_free++;
> +				if (p->state == CSM_DP_BUF_STATE_USER_ALLOC)
> +					u_alloc++;
> +				if (p->state == CSM_DP_BUF_STATE_USER_RECV)
> +					u_recv++;
> +			}
> +		}
> +
> +		seq_puts(s, "MemoryBufferState:\n");
> +		seq_printf(s, "MemoryType:	%s\n", csm_dp_mem_type_to_str(mempool->type));
> +		seq_printf(s, "   KERNEL_FREE:     %d\n",
> +			   k_free);
> +		seq_printf(s, "   KERNEL_ALLOC_RECV_DMA:  %d\n",
> +			   k_alloc_dma);
> +		seq_printf(s, "   KERNEL_RECVCMP_MSGQ_TO_APP:  %d\n",
> +			   k_recv_msgq_app);
> +		seq_printf(s, "   KERNEL_XMIT_DMA:     %d\n",
> +			   k_xmit_dma);
> +		seq_printf(s, "   KERNEL_XMIT_DMA_COMP:  %d\n",
> +			   k_xmit_dma_comp);
> +		seq_printf(s, "   USER_FREE:  %d\n",
> +			   u_free);
> +		seq_printf(s, "   USER_ALLOC:  %d\n",
> +			   u_alloc);
> +		seq_printf(s, "   USER_RECV:  %d\n",
> +			   u_recv);
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mem_buffer_state,
> +			  csm_dp_debugfs_mem_buffer_state_show, NULL);
> +
> +static int csm_dp_debugfs_ring_config_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		__csm_dp_ring_config_dump(s, &mempool->ring);
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_ring_config,
> +			  csm_dp_debugfs_ring_config_read, NULL);
> +
> +static int csm_dp_debugfs_ring_runtime_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		__csm_dp_ring_runtime_dump(s, &mempool->ring);
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_ring_runtime,
> +			  csm_dp_debugfs_ring_runtime_read, NULL);
> +
> +static int csm_dp_debugfs_ring_opstats_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		__csm_dp_ring_opstats_dump(s, &mempool->ring.opstats);
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_ring_opstats,
> +			  csm_dp_debugfs_ring_opstats_read, NULL);
> +
> +unsigned long __ring_index[CSM_DP_MEM_TYPE_LAST];
> +
> +static int csm_dp_debugfs_ring_index_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool)
> +		seq_printf(s, "%lu\n", __ring_index[mempool->type]);
> +	return 0;
> +}
> +
> +static ssize_t csm_dp_debugfs_ring_index_write(struct file *fp,
> +					       const char __user *buf,
> +					       size_t count,
> +					       loff_t *ppos)
> +{
> +	struct csm_dp_mempool *mempool = *((struct csm_dp_mempool **)
> +			(((struct seq_file *)fp->private_data)->private));
> +	unsigned int value = 0;
> +
> +	if (!mempool)
> +		goto done;
> +
> +	if (kstrtouint_from_user(buf, count, 0, &value))
> +		return -EFAULT;
> +
> +	if (value >= mempool->ring.size)
> +		return -EINVAL;
> +
> +	__ring_index[mempool->type] = value;
> +done:
> +	return count;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_ring_index,
> +			  csm_dp_debugfs_ring_index_read,
> +			  csm_dp_debugfs_ring_index_write);
> +
> +static int csm_dp_debugfs_ring_data_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool) {
> +		struct csm_dp_ring_element *elem_p;
> +
> +		elem_p = (mempool->ring.element + __ring_index[mempool->type]);
> +
> +		seq_printf(s, "0x%lx\n", elem_p->element_data);
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_ring_data,
> +			  csm_dp_debugfs_ring_data_read, NULL);
> +
> +static int csm_dp_debugfs_mempool_status_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool) {
> +		seq_printf(s, "BufPut:                 %lu\n",
> +			   mempool->stats.buf_put);
> +		seq_printf(s, "InvalidBufPut:          %lu\n",
> +			   mempool->stats.invalid_buf_put);
> +		seq_printf(s, "ErrBufPut:              %lu\n",
> +			   mempool->stats.buf_put_err);
> +		seq_printf(s, "BufGet:                 %lu\n",
> +			   mempool->stats.buf_get);
> +		seq_printf(s, "InvalidBufGet:          %lu\n",
> +			   mempool->stats.invalid_buf_get);
> +		seq_printf(s, "ErrBufGet:              %lu\n",
> +			   mempool->stats.buf_get_err);
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mempool_status,
> +			  csm_dp_debugfs_mempool_status_show, NULL);
> +
> +static int csm_dp_debugfs_mempool_state_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +	unsigned long state_cnt[CSM_DP_BUF_STATE_LAST];
> +	unsigned long buf_bad = 0;
> +	unsigned long unknown_state = 0;
> +	int i;
> +
> +	memset(state_cnt, 0, sizeof(state_cnt));
> +	if (mempool) {
> +		struct csm_dp_mem *mem = &mempool->mem;
> +		struct csm_dp_buf_cntrl *p;
> +
> +		for (i = 0; i < mem->buf_cnt; i++) {
> +			p = (struct csm_dp_buf_cntrl *)
> +				csm_dp_mem_rec_addr(mem, i);
> +			if (!p)
> +				return 0;
> +			if (p->signature != CSM_DP_BUFFER_SIG ||
> +			    p->fence != CSM_DP_BUFFER_FENCE_SIG ||
> +			    p->buf_index != i)
> +				buf_bad++;
> +			else if (p->state >= CSM_DP_BUF_STATE_LAST)
> +				unknown_state++;
> +			else
> +				state_cnt[p->state]++;
> +		}
> +
> +		seq_printf(s, "Total Buf:                  %u\n",
> +			   mem->buf_cnt);
> +		seq_printf(s, "Buf Real Size:              %u\n",
> +			   mem->buf_sz + mem->buf_overhead_sz);
> +		seq_printf(s, "Buf Corrupted:              %lu\n",
> +			   buf_bad);
> +		seq_printf(s, "Buf Unknown State:          %lu\n",
> +			   unknown_state);
> +
> +		for (i = 0; i < CSM_DP_BUF_STATE_LAST; i++) {
> +			if (state_cnt[i]) {
> +				seq_printf(s, "Buf State %s:        ",
> +					   csm_dp_buf_state_to_str(i));
> +				seq_printf(s, "                    %lu\n",
> +					   state_cnt[i]);
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mempool_state,
> +			  csm_dp_debugfs_mempool_state_show, NULL);
> +
> +static int csm_dp_debugfs_mempool_active_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_dev *pdev = (struct csm_dp_dev *)s->private;
> +	unsigned int type;
> +
> +	for (type = 0; type < CSM_DP_MEM_TYPE_LAST; type++) {
> +		if (pdev->mempool[type])
> +			seq_printf(s, "%s ", csm_dp_mem_type_to_str(type));
> +	}
> +	seq_puts(s, "\n");
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mempool_active,
> +			  csm_dp_debugfs_mempool_active_show, NULL);
> +
> +static int csm_dp_debugfs_mempool_info_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mempool *mempool =
> +		*((struct csm_dp_mempool **)s->private);
> +
> +	if (mempool) {
> +		seq_printf(s, "Driver:                 %llx\n",
> +			   (u64)mempool->dp_dev);
> +		seq_printf(s, "MemPool:                %llx\n",
> +			   (u64)mempool);
> +		seq_printf(s, "Type:                   %s\n",
> +			   csm_dp_mem_type_to_str(mempool->type));
> +		seq_printf(s, "Ref:                    %d\n",
> +			   atomic_read(&mempool->ref));
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mempool_info,
> +			  csm_dp_debugfs_mempool_info_show, NULL);
> +
> +static int csm_dp_debugfs_start_recovery_dev_read(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mhi *mhi = (struct csm_dp_mhi *)s->private;
> +
> +	if (mhi)
> +		seq_printf(s, "mhi_dev_suspended: %u\n",
> +			   mhi->mhi_dev_suspended);
> +
> +	return 0;
> +}
> +
> +static ssize_t csm_dp_debugfs_start_recovery_dev_write(struct file *fp,
> +						       const char __user *buf,
> +						       size_t count,
> +						       loff_t *ppos)
> +{
> +	struct csm_dp_mhi *mhi = ((struct csm_dp_mhi *)
> +		(((struct seq_file *)fp->private_data)->private));
> +	int retry = 10;
> +
> +	if (mhi->mhi_dev_suspended) {
> +		pr_info("MHI channel is already suspended\n");
> +		return count;
> +	}
> +
> +	/* Start the recovery operation */
> +	mhi->mhi_dev_suspended = true;
> +	pr_info("Recovering MHI channel..\n");
> +	/* Allocating work to queue */
> +	queue_work(mhi->mhi_dev_workqueue, &mhi->alloc_work);
> +
> +	while (mhi->mhi_dev_suspended && retry) {
> +		msleep(50);
> +		retry--;
> +	}
> +
> +	if (!mhi->mhi_dev_suspended)
> +		pr_info("MHI channel recovery is complete\n");
> +	return count;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_start_recovery_control_dev,
> +			  csm_dp_debugfs_start_recovery_dev_read,
> +			  csm_dp_debugfs_start_recovery_dev_write);
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_start_recovery_data_dev,
> +			  csm_dp_debugfs_start_recovery_dev_read,
> +			  csm_dp_debugfs_start_recovery_dev_write);
> +
> +static int csm_dp_debugfs_mhi_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_mhi *mhi = (struct csm_dp_mhi *)s->private;
> +	struct mhi_device *mhi_dev = mhi->mhi_dev;
> +
> +	seq_printf(s, "MHIDevice:              %llx\n", (u64)mhi->mhi_dev);
> +	seq_puts(s, "Stats:\n");
> +	seq_printf(s, "    TX:                 %lu\n", mhi->stats.tx_cnt);
> +	seq_printf(s, "    TX_ACKED:           %lu\n", mhi->stats.tx_acked);
> +	seq_printf(s, "    TX_ERR:             %lu\n", mhi->stats.tx_err);
> +	seq_printf(s, "    RX:                 %lu\n", mhi->stats.rx_cnt);
> +
> +	if (mhi_dev) {
> +		struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +		struct csm_dp_core_stats *stats = &pdev->stats;
> +		bool is_control = (mhi_dev->id->driver_data == CSM_DP_CH_CONTROL);
> +
> +		if (stats && is_control)
> +			seq_printf(s, "    RX_DROP:            %lu\n", stats->rx_drop);
> +	}
> +
> +	seq_printf(s, "    RX_OUT_OF_BUF:      %lu\n",
> +		   mhi->stats.rx_out_of_buf);
> +	seq_printf(s, "    RX_REPLENISH:       %lu\n",
> +		   mhi->stats.rx_replenish);
> +	seq_printf(s, "    RX_REPLENISH_ERR:   %lu\n",
> +		   mhi->stats.rx_replenish_err);
> +	seq_printf(s, "    CHANNEL_ERR_COUNT:   %lu\n",
> +		   mhi->stats.ch_err_cnt);
> +	if (mhi_dev) {
> +		seq_printf(s, "    MHI_TX_RING_LAST_REQ_COUNT:   %d\n",
> +			   mhi_get_free_desc_count(mhi->mhi_dev, DMA_TO_DEVICE));
> +		seq_printf(s, "    MHI_RX_RING_LAST_REQ_COUNT:   %d\n",
> +			   mhi_get_free_desc_count(mhi->mhi_dev, DMA_FROM_DEVICE));
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_mhi, csm_dp_debugfs_mhi_show, NULL);
> +
> +static int csm_dp_debugfs_cdev_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_dev *pdev = (struct csm_dp_dev *)s->private;
> +	struct csm_dp_cdev *cdev;
> +	int n = 0;
> +	int i;
> +
> +	if (!pdev->cdev_inited)
> +		return 0;
> +
> +	mutex_lock(&pdev->cdev_lock);
> +	list_for_each_entry(cdev, &pdev->cdev_head, list) {
> +		seq_printf(s, "CDEV(%d)\n", n++);
> +		seq_printf(s, "Driver:                 %llx\n",
> +			   (u64)cdev->pdev);
> +		seq_printf(s, "Cdev:                   %llx\n",
> +			   (u64)cdev);
> +		seq_printf(s, "PID:                    %d\n",
> +			   cdev->pid);
> +
> +		for (i = 0; i < CSM_DP_MEM_TYPE_LAST; i++) {
> +			seq_printf(s, "MemPoolVMA[%d]\n", i);
> +			__csm_dp_mempool_vma_dump(s, &cdev->mempool_vma[i]);
> +		}
> +		seq_puts(s, "RxQueue\n");
> +		for (i = 0; i < CSM_DP_RX_TYPE_LAST; i++)
> +			__csm_dp_rxqueue_vma_dump(s, &cdev->rxqueue_vma[i]);
> +	}
> +	mutex_unlock(&pdev->cdev_lock);
> +
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_cdev,
> +			  csm_dp_debugfs_cdev_show, NULL);
> +
> +static int csm_dp_debugfs_dev_status_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_dev *pdev = (struct csm_dp_dev *)s->private;
> +	struct csm_dp_core_stats *stats = &pdev->stats;
> +	int i;
> +
> +	seq_printf(s, "TX:             %lu\n", stats->tx_cnt);
> +	seq_printf(s, "TX_ERR:         %lu\n", stats->tx_err);
> +	seq_printf(s, "TX_DROP:        %lu\n", stats->tx_drop);
> +	seq_printf(s, "RX:             %lu\n", stats->rx_cnt);
> +	seq_printf(s, "RX_BADMSG:      %lu\n", stats->rx_badmsg);
> +	seq_printf(s, "RX_DROP:        %lu\n", stats->rx_drop);
> +	seq_printf(s, "RX_INT:         %lu\n", stats->rx_int);
> +	seq_printf(s, "RX_BUDGET_OVF:  %lu\n", stats->rx_budget_overflow);
> +	seq_printf(s, "RX_IGNORE:      %lu\n", stats->rx_poll_ignore);
> +	for (i = 0; i < CSM_DP_MEM_TYPE_LAST; i++) {
> +		seq_printf(s, "Mempool[%d]\n", i);
> +		seq_printf(s, "MEM_POOL_IN_USE:	%lu\n",
> +			   stats->mem_stats.mempool_mem_in_use[i]);
> +		seq_printf(s, "MEM_DMA_MAPPED:	%lu\n",
> +			   stats->mem_stats.mempool_mem_dma_mapped[i]);
> +		seq_printf(s, "MEM_RING_IN_USE:	%lu\n",
> +			   stats->mem_stats.mempool_ring_in_use[i]);
> +	}
> +	for (i = 0; i < CSM_DP_RX_TYPE_LAST; i++) {
> +		seq_printf(s, "RXQ[%d]\n", i);
> +		seq_printf(s, "MEM_RXQ_IN_USE:		%lu\n",
> +			   stats->mem_stats.rxq_ring_in_use[i]);
> +	}
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_dev_status,
> +			  csm_dp_debugfs_dev_status_show, NULL);
> +
> +static int csm_dp_debugfs_drv_show(struct seq_file *s, void *unused)
> +{
> +	struct csm_dp_drv *drv = (struct csm_dp_drv *)s->private;
> +
> +	seq_printf(s, "Driver:         %llx\n", (u64)drv);
> +	return 0;
> +}
> +
> +CSM_DP_DEFINE_DEBUGFS_OPS(csm_dp_debugfs_drv,
> +			  csm_dp_debugfs_drv_show, NULL);
> +
> +static void csm_dp_debugfs_create_rxq_dir(struct dentry *parent,
> +					  struct csm_dp_dev *pdev)
> +{
> +	struct dentry *dentry = NULL, *root = NULL;
> +	unsigned int type;
> +
> +	root = debugfs_create_dir("rxque", parent);
> +
> +	for (type = 0; type < CSM_DP_RX_TYPE_LAST; type++) {
> +		dentry = debugfs_create_dir(csm_dp_rx_type_to_str(type),
> +					    root);
> +
> +		debugfs_create_file("config", 0444, dentry,
> +				    &pdev->rxq[type],
> +				    &csm_dp_debugfs_rxq_config_ops);
> +
> +		debugfs_create_file("runtime", 0444, dentry,
> +				    &pdev->rxq[type],
> +				    &csm_dp_debugfs_rxq_runtime_ops);
> +
> +		debugfs_create_file("opstats", 0444, dentry,
> +				    &pdev->rxq[type],
> +				    &csm_dp_debugfs_rxq_opstats_ops);
> +
> +		debugfs_create_file("refcnt", 0444, dentry,
> +				    &pdev->rxq[type],
> +				    &csm_dp_debugfs_rxq_refcnt_ops);
> +	}
> +}
> +
> +static void csm_dp_debugfs_create_ring_dir(struct dentry *parent,
> +					   struct csm_dp_mempool **mempool)
> +{
> +	struct dentry *dentry = NULL;
> +
> +	dentry = debugfs_create_dir("ring", parent);
> +
> +	debugfs_create_file("config", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_ring_config_ops);
> +
> +	debugfs_create_file("runtime", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_ring_runtime_ops);
> +
> +	debugfs_create_file("index", 0644, dentry, mempool,
> +			    &csm_dp_debugfs_ring_index_ops);
> +
> +	debugfs_create_file("data", 0644, dentry, mempool,
> +			    &csm_dp_debugfs_ring_data_ops);
> +
> +	debugfs_create_file("opstats", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_ring_opstats_ops);
> +}
> +
> +static void csm_dp_debugfs_create_mem_dir(struct dentry *parent,
> +					  struct csm_dp_mempool **mempool)
> +{
> +	struct dentry *dentry = NULL;
> +
> +	dentry = debugfs_create_dir("mem", parent);
> +
> +	debugfs_create_file("config", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_mem_config_ops);
> +
> +	debugfs_create_file("offset", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_mem_offset_ops);
> +
> +	debugfs_create_file("dump_size", 0644, dentry, mempool,
> +			    &csm_dp_debugfs_mem_dump_size_ops);
> +
> +	debugfs_create_file("data", 0644, dentry, mempool,
> +			    &csm_dp_debugfs_mem_data_ops);
> +
> +	debugfs_create_file("buffer_state", 0444, dentry, mempool,
> +			    &csm_dp_debugfs_mem_buffer_state_ops);
> +}
> +
> +static void csm_dp_debugfs_create_mempool_dir(struct dentry *parent,
> +					      struct csm_dp_dev *pdev)
> +{
> +	struct dentry *dentry = NULL, *root = NULL;
> +	unsigned int type;
> +
> +	root = debugfs_create_dir("mempool", parent);
> +
> +	debugfs_create_file("active", 0444, root, pdev,
> +			    &csm_dp_debugfs_mempool_active_ops);
> +
> +	for (type = 0; type < CSM_DP_MEM_TYPE_LAST; type++) {
> +		dentry = debugfs_create_dir(csm_dp_mem_type_to_str(type), root);
> +
> +		csm_dp_debugfs_create_ring_dir(dentry, &pdev->mempool[type]);
> +
> +		csm_dp_debugfs_create_mem_dir(dentry, &pdev->mempool[type]);
> +
> +		debugfs_create_file("info", 0444, dentry,
> +				    &pdev->mempool[type],
> +				    &csm_dp_debugfs_mempool_info_ops);
> +
> +		debugfs_create_file("status", 0444, dentry,
> +				    &pdev->mempool[type],
> +				    &csm_dp_debugfs_mempool_status_ops);
> +
> +		debugfs_create_file("state", 0444, dentry,
> +				    &pdev->mempool[type],
> +				    &csm_dp_debugfs_mempool_state_ops);
> +	}
> +}
> +
> +void csm_dp_debugfs_init(struct csm_dp_drv *drv)
> +{
> +	struct dentry *dp_dev_entry;
> +	int i;
> +
> +	drv->dent = debugfs_create_dir(CSM_DP_MODULE_NAME, 0);
> +	debugfs_create_file("driver", 0444, drv->dent, drv,
> +			    &csm_dp_debugfs_drv_ops);
> +
> +	for (i = 0; i < CSM_DP_MAX_NUM_DEVS; i++) {
> +		char buf[10];
> +		struct csm_dp_dev *pdev = &drv->dp_devs[i];
> +
> +		snprintf(buf, sizeof(buf), "dev%d", i);
> +		dp_dev_entry = debugfs_create_dir(buf, drv->dent);
> +
> +		debugfs_create_file("cdev", 0444, dp_dev_entry, pdev,
> +				    &csm_dp_debugfs_cdev_ops);
> +
> +		debugfs_create_file("mhi_control_dev", 0444, dp_dev_entry,
> +				    &pdev->mhi_control_dev, &csm_dp_debugfs_mhi_ops);
> +
> +		debugfs_create_file("mhi_data_dev", 0444, dp_dev_entry,
> +				    &pdev->mhi_data_dev, &csm_dp_debugfs_mhi_ops);
> +
> +		debugfs_create_file("status", 0444, dp_dev_entry, pdev,
> +				    &csm_dp_debugfs_dev_status_ops);
> +
> +		debugfs_create_file("start_recovery_mhi_control_dev",
> +				    0644, dp_dev_entry, &pdev->mhi_control_dev,
> +				    &csm_dp_debugfs_start_recovery_control_dev_ops);
> +
> +		debugfs_create_file("start_recovery_mhi_data_dev",
> +				    0644, dp_dev_entry,	&pdev->mhi_data_dev,
> +				    &csm_dp_debugfs_start_recovery_data_dev_ops);
> +
> +		csm_dp_debugfs_create_mempool_dir(dp_dev_entry, pdev);
> +
> +		csm_dp_debugfs_create_rxq_dir(dp_dev_entry, pdev);
> +	}
> +}
> +
> +void csm_dp_debugfs_cleanup(struct csm_dp_drv *drv)
> +{
> +	debugfs_remove_recursive(drv->dent);
> +	drv->dent = NULL;
> +}
> +
> +#else
> +
> +int csm_dp_debugfs_init(struct csm_dp_drv *drv)
> +{
> +	return 0;
> +}
> +
> +void csm_dp_debugfs_cleanup(struct csm_dp_drv *drv)
> +{
> +}
> +#endif
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c b/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c
> new file mode 100644
> index 000000000000..6d3f4e2299a7
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.c
> @@ -0,0 +1,1078 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +
> +#include "qcom_csm_dp.h"
> +#include "qcom_csm_dp_mem.h"
> +
> +static struct csm_dp_mempool *csm_dp_mem_to_mempool(struct csm_dp_mem *mem)
> +{
> +	struct csm_dp_mempool *mempool = container_of(mem,
> +						   struct csm_dp_mempool, mem);
> +	return mempool;
> +}
> +
> +static struct csm_dp_mempool *csm_dp_mem_loc_to_mempool(struct csm_dp_mem_loc *loc)
> +{
> +	struct csm_dp_mem *mem = container_of(loc,
> +					   struct csm_dp_mem, loc);
> +	return csm_dp_mem_to_mempool(mem);
> +}
> +
> +static void csm_dp_mem_loc_set(struct csm_dp_mem_loc *loc, size_t size,
> +			       unsigned int mmap_cookie)
> +{
> +	loc->base = loc->cluster_kernel_addr[0];
> +	loc->size = size;
> +	loc->cookie = mmap_cookie;
> +	loc->dma_mapped = false;
> +}
> +
> +static int csm_dp_alloc_ring(size_t size, unsigned int mmap_cookie,
> +			     struct csm_dp_mem_loc *loc)
> +{
> +	unsigned int order;
> +	struct page *page;
> +
> +	order = get_order(size);
> +	if (order > get_order(CSM_DP_MEMPOOL_CLUSTER_SIZE)) {
> +		pr_err("failed to allocate memory. Too Big %ld\n", size);
> +		return -ENOMEM;
> +	}
> +	page = alloc_pages(GFP_KERNEL, order);
> +	loc->last_cl_order = order;
> +	loc->num_cluster = 1;
> +	if (page) {
> +		loc->page[0] = page;
> +		loc->cluster_kernel_addr[0] = page_address(page);
> +		csm_dp_mem_loc_set(loc, size, mmap_cookie);
> +		loc->true_alloc_size += ((unsigned int)(1) << loc->last_cl_order) * PAGE_SIZE;
> +		pr_info("Allocated ring memory of size %lu\n", loc->true_alloc_size);
> +		return 0;
> +	}
> +	return -ENOMEM;
> +}
> +
> +static void csm_dp_free_ring(struct csm_dp_mem_loc *loc)
> +{
> +	if (loc && loc->page[0]) {
> +		__free_pages(loc->page[0], loc->last_cl_order);
> +		pr_info("Free ring memory of size %lu\n",
> +			((unsigned int)(1) << loc->last_cl_order) * PAGE_SIZE);
> +		memset(loc, 0, sizeof(*loc));
> +	}
> +}
> +
> +static struct page *csm_dp_alloc_zeroed_pages(unsigned int gfp_mask, unsigned int order)
> +{
> +	int i;
> +	struct page *page = alloc_pages(gfp_mask, order);
> +	void *page_addr;
> +
> +	if (!page)
> +		return NULL;
> +
> +	page_addr = page_address(page);
> +	for (i = 0; i < 1 << order; i++)
> +		clear_page(page_addr + i * PAGE_SIZE);
> +
> +	return page;
> +}
> +
> +static int csm_dp_buf_mem_alloc(size_t size,
> +				unsigned int mmap_cookie,
> +				struct csm_dp_mem_loc *loc)
> +{
> +	unsigned int order;
> +	struct page *page;
> +	int i;
> +	unsigned long rem = size;
> +	unsigned long len;
> +	struct csm_dp_mempool *mempool = csm_dp_mem_loc_to_mempool(loc);
> +
> +	for (i = 0; i < loc->num_cluster; i++) {
> +		if (i == loc->num_cluster - 1)
> +			len = rem;
> +		else
> +			len = CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +		order = get_order(len);
> +		if (i == loc->num_cluster - 1)
> +			loc->last_cl_order = order;
> +		page = csm_dp_alloc_zeroed_pages(GFP_KERNEL, order);
> +		if (!page)
> +			goto error;
> +		loc->page[i] = page;
> +		loc->cluster_kernel_addr[i] = page_address(page);
> +		rem -= len;
> +		loc->true_alloc_size +=
> +			(i == (loc->num_cluster - 1)) ?
> +				((unsigned int)(1) << order) *
> +				PAGE_SIZE : CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +	}
> +	csm_dp_mem_loc_set(loc, size, mmap_cookie);
> +	mempool->dp_dev->stats.mem_stats.mempool_mem_in_use[mempool->type] +=
> +									loc->true_alloc_size;
> +	pr_info("Allocated Mempool %u of size %lu\n",
> +		mempool->type, loc->true_alloc_size);
> +	return 0;
> +error:
> +	for (i = 0; i < loc->num_cluster; i++) {
> +		if (loc->page[i]) {
> +			if (i == loc->num_cluster - 1)
> +				order = loc->last_cl_order;
> +			else
> +				order = get_order(CSM_DP_MEMPOOL_CLUSTER_SIZE);
> +			__free_pages(loc->page[i], order);
> +			loc->page[i] = NULL;
> +			loc->true_alloc_size -=
> +				(i == (loc->num_cluster - 1)) ? ((unsigned int)(1) << order) *
> +							PAGE_SIZE : CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +		}
> +	}
> +	loc->num_cluster = 0;
> +	return -ENOMEM;
> +}
> +
> +static void csm_dp_buf_mem_free(struct csm_dp_mem_loc *loc)
> +{
> +	int i;
> +	struct csm_dp_mempool *mempool;
> +	unsigned long to_free = loc->true_alloc_size;
> +	unsigned int order = get_order(CSM_DP_MEMPOOL_CLUSTER_SIZE);
> +
> +	if (loc) {
> +		mempool = csm_dp_mem_loc_to_mempool(loc);
> +		for (i = 0; i < loc->num_cluster; i++) {
> +			if (loc->page[i]) {
> +				if (i == loc->num_cluster - 1)
> +					order = loc->last_cl_order;
> +				__free_pages(loc->page[i], order);
> +				loc->true_alloc_size -=
> +					(i == (loc->num_cluster - 1)) ?
> +						((unsigned int)(1) << order) * PAGE_SIZE :
> +						CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +			}
> +		}
> +		mempool->dp_dev->stats.mem_stats.mempool_mem_in_use[mempool->type] -=
> +								(to_free - loc->true_alloc_size);
> +		pr_info("Free Mempool %u of size %lu\n",
> +			mempool->type, (to_free - loc->true_alloc_size));
> +		memset(loc, 0, sizeof(*loc));
> +	}
> +}
> +
> +/*
> + * Get the MHI controller dev - needed for dma operations. Control and data
> + * channels refer to same MHI controller dev.
> + */
> +static struct device *get_mhi_cntrl_dev(struct csm_dp_dev *pdev)
> +{
> +	atomic_inc(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +	atomic_inc(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +
> +	if (csm_dp_mhi_is_ready(&pdev->mhi_control_dev))
> +		return pdev->mhi_control_dev.mhi_dev->mhi_cntrl->cntrl_dev;
> +	else if (csm_dp_mhi_is_ready(&pdev->mhi_data_dev))
> +		return pdev->mhi_data_dev.mhi_dev->mhi_cntrl->cntrl_dev;
> +
> +	atomic_dec(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +	atomic_dec(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +
> +	return NULL;
> +}
> +
> +static void put_mhi_cntrl_dev(struct csm_dp_dev *pdev)
> +{
> +	atomic_dec(&pdev->mhi_control_dev.mhi_dev_refcnt);
> +	atomic_dec(&pdev->mhi_data_dev.mhi_dev_refcnt);
> +}
> +
> +int csm_dp_ring_init(struct csm_dp_ring *ring,
> +		     unsigned int ringsz,
> +		     unsigned int mmap_cookie)
> +{
> +	unsigned int allocsz = ringsz * sizeof(*ring->element);
> +	char *aligned_ptr;
> +	struct csm_dp_ring_element *elem_p;
> +
> +	/* cons and prod index space, aligned to cache line */
> +	allocsz += 4 * cache_line_size();
> +	allocsz = ALIGN(allocsz, cache_line_size());
> +
> +	if (csm_dp_alloc_ring(allocsz, mmap_cookie, &ring->loc)) {
> +		pr_err("failed to allocate ring memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	aligned_ptr = (char *)ALIGN((unsigned long)ring->loc.base,
> +				    cache_line_size());
> +	ring->prod_head = (unsigned int *)aligned_ptr;
> +	aligned_ptr += cache_line_size();
> +	ring->prod_tail = (unsigned int *)aligned_ptr;
> +	aligned_ptr += cache_line_size();
> +	ring->cons_head = (unsigned int *)aligned_ptr;
> +	aligned_ptr += cache_line_size();
> +	ring->cons_tail = (unsigned int *)aligned_ptr;
> +	aligned_ptr += cache_line_size();
> +	elem_p = (struct csm_dp_ring_element *)aligned_ptr;
> +	ring->element = elem_p;
> +	ring->size = ringsz;
> +	*ring->cons_tail = 0;
> +	*ring->cons_head = 0;
> +	*ring->prod_tail = 0;
> +	*ring->prod_head = 0;
> +
> +	return 0;
> +}
> +
> +void csm_dp_ring_cleanup(struct csm_dp_ring *ring)
> +{
> +	if (ring) {
> +		csm_dp_free_ring(&ring->loc);
> +		memset(ring, 0, sizeof(*ring));
> +	}
> +}
> +
> +int csm_dp_ring_get_cfg(struct csm_dp_ring *ring, struct csm_dp_ring_cfg *cfg)
> +{
> +	if (unlikely(!ring || !cfg))
> +		return -EINVAL;
> +	cfg->mmap.length = ring->loc.size;
> +	cfg->mmap.cookie = ring->loc.cookie;
> +
> +	cfg->size = ring->size;
> +	cfg->prod_head_off = csm_dp_vaddr_offset((void *)ring->prod_head,
> +						 ring->loc.base);
> +	cfg->prod_tail_off = csm_dp_vaddr_offset((void *)ring->prod_tail,
> +						 ring->loc.base);
> +	cfg->cons_head_off = csm_dp_vaddr_offset((void *)ring->cons_head,
> +						 ring->loc.base);
> +	cfg->cons_tail_off = csm_dp_vaddr_offset((void *)ring->cons_tail,
> +						 ring->loc.base);
> +	cfg->ringbuf_off = csm_dp_vaddr_offset((void *)ring->element,
> +					       ring->loc.base);
> +	return 0;
> +}
> +
> +int csm_dp_ring_read(struct csm_dp_ring *ring,
> +		     unsigned long *element_ptr)
> +{
> +	register unsigned int cons_head, cons_next;
> +	register unsigned int prod_tail, mask;
> +	unsigned long data;
> +
> +	if (unlikely(!ring))
> +		return -EINVAL;
> +
> +	mask = ring->size - 1;
> +
> +again:
> +	/*
> +	 * Test to see if the ring is empty.
> +	 * If not, advance cons_head and read the data
> +	 */
> +	cons_head = *ring->cons_head;
> +	prod_tail = *ring->prod_tail;
> +	/* Get current cons_head and prod_tail */
> +	rmb();
> +	if ((cons_head & mask) == (prod_tail & mask)) {
> +		/* Load ring elements */
> +		rmb();
> +		if (cons_head == *ring->cons_head && prod_tail == *ring->prod_tail) {
> +			atomic_inc(&ring->opstats.read_empty);
> +			return -EAGAIN;
> +		}
> +		goto again;
> +	}
> +	cons_next = cons_head + 1;
> +	if (atomic_cmpxchg((atomic_t *)ring->cons_head,
> +			   cons_head,
> +			   cons_next) != cons_head)
> +		goto again;
> +
> +	/* Read the ring */
> +	data = ring->element[(cons_head & mask)].element_data;
> +	/* Get current element */
> +	rmb();
> +
> +	if (element_ptr)
> +		*element_ptr = data;
> +
> +	atomic_inc(&ring->opstats.read_ok);
> +
> +	/* Potential two consumer is updating */
> +	while (atomic_cmpxchg((atomic_t *)ring->cons_tail,
> +			      cons_head, cons_next) != cons_head)
> +		;
> +
> +	return 0;
> +}
> +
> +int csm_dp_ring_write(struct csm_dp_ring *ring, unsigned long data)
> +{
> +	register unsigned int prod_head, prod_next;
> +	register unsigned int cons_tail, mask;
> +
> +	if (unlikely(!ring))
> +		return -EINVAL;
> +
> +	mask = ring->size - 1;
> +
> +again:
> +	/*
> +	 * Test to see if the ring is full.
> +	 * If not, advance prod_head and write the data
> +	 */
> +	prod_head = *ring->prod_head;
> +	cons_tail = *ring->cons_tail;
> +	/* Get current prod_head and cons_tail */
> +	rmb();
> +	prod_next = prod_head + 1;
> +	if ((prod_next & mask) == (cons_tail & mask)) {
> +		/* Load ring elements */
> +		rmb();
> +		if (prod_head == *ring->prod_head && cons_tail == *ring->cons_tail) {
> +			atomic_inc(&ring->opstats.write_full);
> +			return -EAGAIN;
> +		}
> +		goto again;
> +	}
> +	if (atomic_cmpxchg((atomic_t *)ring->prod_head,
> +			   prod_head,
> +			   prod_next) != prod_head)
> +		goto again;
> +
> +	ring->element[(prod_head & mask)].element_data = data;
> +	/* Ensure element is written */
> +	wmb();
> +
> +	atomic_inc(&ring->opstats.write_ok);
> +
> +	/* Potential two producer is updating */
> +	while (atomic_cmpxchg((atomic_t *)ring->prod_tail,
> +			      prod_head, prod_next) != prod_head)
> +		;
> +
> +	return 0;
> +}
> +
> +bool csm_dp_ring_is_empty(struct csm_dp_ring *ring)
> +{
> +	unsigned int prod_tail, cons_tail;
> +
> +	prod_tail = *ring->prod_tail;
> +	cons_tail = *ring->cons_tail;
> +	if (prod_tail == cons_tail)
> +		return true;
> +	return false;
> +}
> +
> +static int csm_dp_mem_init(struct csm_dp_mem *mem,
> +			   unsigned int bufcnt,
> +			   unsigned int bufsz,
> +			   unsigned int cookie)
> +{
> +	unsigned int num_buf_cl; /* number of buffers per cluster */
> +	unsigned int num_cl; /* number of clusters */
> +	unsigned long size;
> +	unsigned long rem_size = 0;
> +	unsigned int rem_buf;
> +
> +	mem->buf_cnt = bufcnt;
> +	mem->buf_sz = ALIGN(bufsz, cache_line_size());
> +	mem->buf_overhead_sz = CSM_DP_L1_CACHE_BYTES;
> +
> +	if (csm_dp_buf_true_size(mem) > CSM_DP_MEMPOOL_CLUSTER_SIZE) {
> +		pr_err("buf_true_size too big %d (CLUSTER_SIZE %d)\n",
> +		       csm_dp_buf_true_size(mem), CSM_DP_MEMPOOL_CLUSTER_SIZE);
> +		return -ENOMEM;
> +	}
> +
> +	num_buf_cl = CSM_DP_MEMPOOL_CLUSTER_SIZE / csm_dp_buf_true_size(mem);
> +	num_cl = bufcnt / num_buf_cl;
> +	size = (long)num_cl * CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +	rem_buf = bufcnt % num_buf_cl;
> +	if (rem_buf) {
> +		num_cl++;
> +		rem_size = csm_dp_buf_true_size(mem) * rem_buf;
> +	}
> +	if (num_cl > MAX_CSM_DP_MEMPOOL_CLUSTERS) {
> +		pr_err("mempool size too big. num_cl %d\n", num_cl);
> +		return -ENOMEM;
> +	}
> +	if (ULONG_MAX / CSM_DP_MEMPOOL_CLUSTER_SIZE < num_cl) {
> +		pr_err("mempool size too big. num_cl %d CLUSTER_SIZE %d\n",
> +		       num_cl, CSM_DP_MEMPOOL_CLUSTER_SIZE);
> +		return -ENOMEM;
> +	}
> +	mem->loc.num_cluster = num_cl;
> +	mem->loc.buf_per_cluster = num_buf_cl;
> +	size += rem_size;
> +	if (csm_dp_buf_mem_alloc(size, cookie, &mem->loc)) {
> +		pr_err("failed to allocate DMA memory\n");
> +		return -ENOMEM;
> +	}
> +	return 0;
> +}
> +
> +static void csm_dp_mem_cleanup(struct csm_dp_mem *mem)
> +{
> +	struct csm_dp_mempool *mempool = NULL;
> +	struct csm_dp_dev *pdev = NULL;
> +	int i;
> +	unsigned long size;
> +
> +	if (!mem) {
> +		pr_err("csm_dp_mem is NULL!\n");
> +		return;
> +	}
> +	mempool = csm_dp_mem_to_mempool(mem);
> +
> +	if (!mempool) {
> +		pr_err("csm_dp_mempool is NULL!\n");
> +		return;
> +	}
> +	pdev = mempool->dp_dev;
> +
> +	spin_lock(&mempool->lock);
> +	if (mem->loc.dma_mapped && mempool->dev) {
> +		size = mem->loc.size;
> +		for (i = 0; i < mem->loc.num_cluster; i++) {
> +			if (i ==  mem->loc.num_cluster - 1) {
> +				dma_unmap_single(mempool->dev,
> +						 mem->loc.cluster_dma_addr[i],
> +						 size,
> +						 mem->loc.direction);
> +
> +				if (pdev)
> +					pdev->stats.mem_stats.mempool_mem_dma_mapped[mempool->type]
> +									-=
> +									size;
> +			} else {
> +				dma_unmap_single(mempool->dev,
> +						 mem->loc.cluster_dma_addr[i],
> +						 CSM_DP_MEMPOOL_CLUSTER_SIZE,
> +						 mem->loc.direction);
> +
> +				if (pdev)
> +					pdev->stats.mem_stats.mempool_mem_dma_mapped[mempool->type]
> +									-=
> +								CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +				size -= CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +			}
> +		}
> +		pr_info("DMA Unmap Mempool %u of size %lu\n", mempool->type, mem->loc.size);
> +	}
> +	mem->loc.dma_mapped = false;
> +	spin_unlock(&mempool->lock);
> +
> +	csm_dp_buf_mem_free(&mem->loc);
> +	memset(mem, 0, sizeof(*mem));
> +
> +	mempool->dev = NULL;
> +
> +	put_mhi_cntrl_dev(pdev);
> +}
> +
> +static int csm_dp_mem_get_cfg(struct csm_dp_mem *mem,
> +			      struct csm_dp_mem_cfg *cfg)
> +{
> +	cfg->mmap.length = mem->loc.size;
> +	cfg->mmap.cookie = mem->loc.cookie;
> +
> +	cfg->buf_sz = mem->buf_sz;
> +	cfg->buf_cnt = mem->buf_cnt;
> +	cfg->buf_overhead_sz = CSM_DP_L1_CACHE_BYTES;
> +	cfg->cluster_size = CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +	cfg->num_cluster = mem->loc.num_cluster;
> +	cfg->buf_per_cluster = mem->loc.buf_per_cluster;
> +
> +	pr_debug("buf_sz %d buf_cnt %d buf_overhead_sz %d cluster_size %d num_cluster %d buf_per_cluster %d\n",
> +		 cfg->buf_sz, cfg->buf_cnt, cfg->buf_overhead_sz,
> +		 cfg->cluster_size, cfg->num_cluster, cfg->buf_per_cluster);
> +
> +	return 0;
> +}
> +
> +static void csm_dp_mempool_init(struct csm_dp_mempool *mempool)
> +{
> +	struct csm_dp_mem *mem = &mempool->mem;
> +	struct csm_dp_ring *ring = &mempool->ring;
> +	unsigned long element_data;
> +	int i, j;
> +	struct csm_dp_buf_cntrl *p;
> +	unsigned int cl_buf_cnt;
> +	unsigned int buf_index = 0;
> +	char *cl_start;
> +
> +	if (!csm_dp_mem_type_is_valid(mempool->type))
> +		return;
> +
> +	for (j = 0; j < mem->loc.num_cluster; j++) {
> +		element_data = (long)j * CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +		cl_start = mem->loc.cluster_kernel_addr[j];
> +		if (j == mem->loc.num_cluster - 1)
> +			cl_buf_cnt = mem->buf_cnt -
> +				(mem->loc.buf_per_cluster * j);
> +		else
> +			cl_buf_cnt = mem->loc.buf_per_cluster;
> +		for (i = 0; i < cl_buf_cnt; i++) {
> +			p = (struct csm_dp_buf_cntrl *)(cl_start +
> +				(i * csm_dp_buf_true_size(mem)));
> +			p->signature = CSM_DP_BUFFER_SIG;
> +			p->fence = CSM_DP_BUFFER_FENCE_SIG;
> +			p->state = CSM_DP_BUF_STATE_KERNEL_FREE;
> +			p->mem_type = mempool->type;
> +			p->buf_index = buf_index;
> +			p->next_packet = NULL;
> +			if (!csm_dp_mem_type_is_ul(mempool->type))
> +				p->xmit_status = CSM_DP_XMIT_OK;
> +			/* pointing to start of user data */
> +			ring->element[buf_index].element_data =
> +				element_data + mem->buf_overhead_sz;
> +			element_data += csm_dp_buf_true_size(mem);
> +			buf_index++;
> +		}
> +	}
> +	*ring->cons_head = *ring->cons_tail = 0;
> +	*ring->prod_head = *ring->prod_tail = mem->buf_cnt - 1;
> +	/* Ensure all the data are written */
> +	wmb();
> +}
> +
> +static struct csm_dp_mempool *__csm_dp_mempool_alloc(struct csm_dp_dev *pdev,
> +						     enum csm_dp_mem_type type,
> +						     unsigned int buf_sz,
> +						     unsigned int buf_cnt,
> +						     unsigned int ring_sz,
> +						     bool may_map)
> +{
> +	struct csm_dp_mempool *mempool;
> +	unsigned int cookie;
> +
> +	mempool = kzalloc(sizeof(*mempool), GFP_KERNEL);
> +	if (IS_ERR_OR_NULL(mempool)) {
> +		pr_err("failed to allocate mempool\n");
> +		return NULL;
> +	}
> +
> +	mempool->dp_dev = pdev;
> +	mempool->type = type;
> +	mempool->signature = CSM_DP_MEMPOOL_SIG;
> +
> +	cookie = CSM_DP_MMAP_COOKIE(type, CSM_DP_MMAP_TYPE_MEM);
> +	if (csm_dp_mem_init(&mempool->mem, buf_cnt, buf_sz, cookie)) {
> +		pr_err("failed to initialize memory\n");
> +		goto cleanup;
> +	}
> +
> +	if (may_map) {
> +		struct device *dev = get_mhi_cntrl_dev(pdev);
> +
> +		if (dev) {
> +			int ret = csm_dp_mempool_dma_map(dev, mempool);
> +
> +			put_mhi_cntrl_dev(pdev);
> +			if (ret)
> +				goto cleanup_mem;
> +		}
> +	}
> +	cookie = CSM_DP_MMAP_COOKIE(type, CSM_DP_MMAP_TYPE_RING);
> +	if (csm_dp_ring_init(&mempool->ring, ring_sz, cookie)) {
> +		pr_err("failed to initialize ring\n");
> +		goto cleanup_mem;
> +	}
> +	mempool->dp_dev->stats.mem_stats.mempool_ring_in_use[mempool->type] +=
> +		mempool->ring.loc.true_alloc_size;
> +	csm_dp_mempool_init(mempool);
> +
> +	pr_debug("mempool is created, type=%u bufsz=%u bufcnt=%u\n",
> +		 type, buf_sz, buf_cnt);
> +
> +	return mempool;
> +
> +cleanup_mem:
> +	csm_dp_mem_cleanup(&mempool->mem);
> +cleanup:
> +	kfree(mempool);
> +	return NULL;
> +}
> +
> +static void csm_dp_mempool_release(struct csm_dp_mempool *mempool)
> +{
> +	unsigned long to_release;
> +
> +	if (mempool) {
> +		enum csm_dp_mem_type type = mempool->type;
> +
> +		to_release = ((unsigned int)(1) << mempool->ring.loc.last_cl_order) * PAGE_SIZE;
> +
> +		mempool->signature = CSM_DP_MEMPOOL_SIG_BAD;
> +		/* Ensure all the data are written before cleanup*/
> +		wmb();
> +		csm_dp_mem_cleanup(&mempool->mem);
> +		csm_dp_ring_cleanup(&mempool->ring);
> +		mempool->dp_dev->stats.mem_stats.mempool_ring_in_use[mempool->type] -= to_release;
> +		kfree(mempool);
> +		pr_debug("mempool is freed, type=%u\n", type);
> +	}
> +}
> +
> +#define CSM_DP_MEMPOOL_RELEASE_SLEEP 200 /* 200 ms */
> +void csm_dp_mempool_release_no_delay(struct csm_dp_mempool *mempool)
> +{
> +	unsigned int out_xmit, out_xmit1;
> +
> +	if (!mempool)
> +		return;
> +	/* wait for all tx buffers done */
> +
> +	out_xmit1 = atomic_read(&mempool->out_xmit);
> +	if (out_xmit1) {
> +		msleep(CSM_DP_MEMPOOL_RELEASE_SLEEP);
> +		out_xmit = atomic_read(&mempool->out_xmit);
> +		if (out_xmit)
> +			pr_err("mempool %p out_xmit changed from %d to %d after %d ms\n",
> +			       mempool, out_xmit1, out_xmit, CSM_DP_MEMPOOL_RELEASE_SLEEP);
> +	}
> +	csm_dp_mempool_release(mempool);
> +}
> +
> +int csm_dp_mempool_dma_map(struct device *dev,	/* device for iommu ops */
> +			struct csm_dp_mempool *mpool)
> +{
> +	enum dma_data_direction direction;
> +	int i, k, err;
> +	unsigned long size;
> +	struct csm_dp_mem_loc *loc;
> +
> +	loc = &mpool->mem.loc;
> +	if (loc->dma_mapped)
> +		return 0;
> +	if (csm_dp_mem_type_is_ul(mpool->type))
> +		direction = DMA_BIDIRECTIONAL; /* rx, tx for rx loopback */
> +	else
> +		direction = DMA_TO_DEVICE;
> +	size = loc->size;
> +
> +	err = dma_set_mask(dev, DMA_BIT_MASK(CSM_DP_DMA_MASK));
> +	if (err) {
> +		pr_err("Cannot set proper DMA mask\n");
> +		return err;
> +	}
> +
> +	for (i = 0; i < loc->num_cluster; i++) {
> +		if (i == loc->num_cluster - 1) {
> +			loc->cluster_dma_addr[i] =
> +				dma_map_single(dev,
> +					       loc->cluster_kernel_addr[i],
> +					size,
> +					direction);
> +			mpool->dp_dev->stats.mem_stats.mempool_mem_dma_mapped[mpool->type] += size;
> +		} else {
> +			loc->cluster_dma_addr[i] =
> +				dma_map_single(dev,
> +					       loc->cluster_kernel_addr[i],
> +					CSM_DP_MEMPOOL_CLUSTER_SIZE,
> +					direction);
> +			mpool->dp_dev->stats.mem_stats.mempool_mem_dma_mapped[mpool->type] +=
> +								CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +			size -= CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +		}
> +		if (dma_mapping_error(dev, loc->cluster_dma_addr[i]))
> +			goto error;
> +	}
> +	pr_info("DMA map Mempool %u of size %lu\n", mpool->type, loc->size);
> +	mpool->mem.loc.dma_mapped = true;
> +	mpool->mem.loc.direction = direction;
> +	mpool->dev = dev;
> +	return 0;
> +error:
> +	for (k = 0; k < i - 1; k++) {
> +		dma_unmap_single(dev, loc->cluster_dma_addr[k],
> +				 CSM_DP_MEMPOOL_CLUSTER_SIZE,
> +				 loc->direction);
> +	}
> +	return -ENOMEM;
> +}
> +
> +struct csm_dp_mempool *csm_dp_mempool_alloc(struct csm_dp_dev *pdev,
> +					    enum csm_dp_mem_type type,
> +					    unsigned int buf_sz,
> +					    unsigned int buf_cnt,
> +					    bool may_dma_map)
> +{
> +	struct csm_dp_mempool *mempool;
> +	unsigned int ring_sz;
> +
> +	if (unlikely(!buf_sz || !buf_cnt || !csm_dp_mem_type_is_valid(type)))
> +		return NULL;
> +	if (unlikely(((ULONG_MAX) / (buf_sz + CSM_DP_L1_CACHE_BYTES) < buf_cnt)))
> +		return NULL;
> +	if (buf_sz > CSM_DP_MAX_DL_MSG_LEN) {
> +		pr_err("mempool alloc buffer size %d exceeds limit %d\n",
> +		       buf_sz, CSM_DP_MAX_DL_MSG_LEN);
> +		return NULL;
> +	}
> +
> +	ring_sz = csm_dp_calc_ring_size(buf_cnt);
> +	if (unlikely(!ring_sz))
> +		return NULL;
> +
> +	mutex_lock(&pdev->mempool_lock);
> +	mempool = pdev->mempool[type];
> +	if (mempool) {
> +		if (!csm_dp_mem_type_is_ul(type)) {
> +			pr_err("can't use existing mempool, type=%u\n", type);
> +			mempool = NULL;
> +			goto done;
> +		}
> +		goto mempool_hold;
> +	}
> +
> +	mempool = __csm_dp_mempool_alloc(pdev, type, buf_sz,
> +					 buf_cnt, ring_sz, may_dma_map);
> +	if (!mempool)
> +		goto done;
> +	atomic_set(&mempool->ref, 1);
> +	atomic_set(&mempool->out_xmit, 0);
> +	spin_lock_init(&mempool->lock);
> +	pdev->mempool[type] = mempool;
> +	goto done;
> +mempool_hold:
> +	if (!csm_dp_mempool_hold(mempool))
> +		mempool = NULL;
> +done:
> +	mutex_unlock(&pdev->mempool_lock);
> +	return mempool;
> +}
> +
> +void csm_dp_mempool_free(struct csm_dp_mempool *mempool)
> +{
> +	struct csm_dp_dev *pdev = mempool->dp_dev;
> +
> +	if (!mempool)
> +		return;
> +	pr_info("Free mempool type %d\n", mempool->type);
> +	csm_dp_mempool_release_no_delay(mempool);
> +	pdev->mempool[mempool->type] = NULL;
> +	/* Ensure all the data are freed */
> +	wmb();
> +}
> +
> +int csm_dp_mempool_get_cfg(struct csm_dp_mempool *mempool,
> +			   struct csm_dp_mempool_cfg *cfg)
> +{
> +	if (unlikely(!mempool || !cfg))
> +		return -EINVAL;
> +
> +	cfg->type = mempool->type;
> +	csm_dp_mem_get_cfg(&mempool->mem, &cfg->mem);
> +	csm_dp_ring_get_cfg(&mempool->ring, &cfg->ring);
> +	return 0;
> +}
> +
> +/* For CSM_DP_MEM_TYPE_UL_* pool only */
> +int csm_dp_mempool_put_buf(struct csm_dp_mempool *mempool, void *vaddr)
> +{
> +	struct csm_dp_mem *mem;
> +	unsigned long offset;
> +	int ret;
> +	struct csm_dp_buf_cntrl *p;
> +	unsigned int buf_index;
> +	unsigned int cluster;
> +
> +	if (unlikely(!mempool || !vaddr))
> +		return -EINVAL;
> +
> +	mem = &mempool->mem;
> +	p = (vaddr - mem->buf_overhead_sz);
> +	buf_index = p->buf_index;
> +	if (buf_index >= mem->buf_cnt) {
> +		pr_err("buf_index %d exceed %d\n", buf_index, mem->buf_cnt);
> +		return -EINVAL;
> +	}
> +	cluster = buf_index / mem->loc.buf_per_cluster;
> +	offset = ((long)cluster * CSM_DP_MEMPOOL_CLUSTER_SIZE) +
> +			(buf_index % mem->loc.buf_per_cluster) *
> +					csm_dp_buf_true_size(mem);
> +	if (p->signature != CSM_DP_BUFFER_SIG) {
> +		mempool->stats.invalid_buf_put++;
> +		pr_err("mempool %llx type %d buffer at offset %ld corrupted, sig %x, exp %x\n",
> +		       (u64)mempool, mempool->type,
> +			offset, p->signature, CSM_DP_BUFFER_SIG);
> +		return -EINVAL;
> +	}
> +	if (p->fence != CSM_DP_BUFFER_FENCE_SIG) {
> +		mempool->stats.invalid_buf_put++;
> +		pr_err("mempool %llx type %d buffer at offset %ld corrupted, fence %x, exp %x\n",
> +		       (u64)mempool, mempool->type,
> +		       offset, p->fence, CSM_DP_BUFFER_FENCE_SIG);
> +		pr_err("vaddr %llx  p %llx\n", (u64)vaddr, (u64)p);
> +		return -EINVAL;
> +	}
> +	p->state = CSM_DP_BUF_STATE_KERNEL_FREE;
> +	offset += sizeof(struct csm_dp_buf_cntrl);
> +
> +	ret = csm_dp_ring_write(&mempool->ring, (unsigned long)offset);
> +	if (ret)
> +		mempool->stats.buf_put_err++;
> +	else
> +		mempool->stats.buf_put++;
> +
> +	return ret;
> +}
> +
> +/* For CSM_DP_MEM_TYPE_UL_* pool only */
> +void *csm_dp_mempool_get_buf(struct csm_dp_mempool *mempool,
> +			     unsigned int *cluster,  unsigned int *c_offset)
> +{
> +	struct csm_dp_mem *mem;
> +	unsigned long val;
> +	void *ptr;
> +	struct csm_dp_buf_cntrl *p;
> +
> +	if (unlikely(!mempool))
> +		return NULL;
> +
> +	if (csm_dp_ring_read(&mempool->ring, &val)) {
> +		mempool->stats.buf_get_err++;
> +		return NULL;
> +	}
> +
> +	mem = &mempool->mem;
> +	*cluster = val >> CSM_DP_MEMPOOL_CLUSTER_SHIFT;
> +	*c_offset = val & CSM_DP_MEMPOOL_CLUSTER_MASK;
> +	ptr = (char *)mempool->mem.loc.cluster_kernel_addr[*cluster] +
> +								*c_offset;
> +	if ((*c_offset - mem->buf_overhead_sz) % csm_dp_buf_true_size(mem)) {
> +		mempool->stats.invalid_buf_get++;
> +		pr_err("get unaligned buffer from ring, buf true size %d offset %d\n",
> +		       csm_dp_buf_true_size(mem), *c_offset);
> +		return NULL;
> +	}
> +	p = ptr - mem->buf_overhead_sz;
> +	if (p->signature !=  CSM_DP_BUFFER_SIG) {
> +		mempool->stats.invalid_buf_get++;
> +		pr_err("mempool type %d buffer at %d corrupted, %x, exp %x\n",
> +		       *c_offset, mempool->type,
> +			p->signature, CSM_DP_BUFFER_SIG);
> +		return NULL;
> +	}
> +	if (p->fence !=  CSM_DP_BUFFER_FENCE_SIG) {
> +		mempool->stats.invalid_buf_get++;
> +		pr_err("mempool type %d buffer at %d corrupted, fence %x, exp %x\n",
> +		       *c_offset, mempool->type,
> +			p->fence, CSM_DP_BUFFER_FENCE_SIG);
> +		return NULL;
> +	}
> +	mempool->stats.buf_get++;
> +	return ptr;
> +}
> +
> +void get_mempool_buf_status(struct csm_dp_mempool *mempool)
> +{
> +	struct csm_dp_dev *pdev = mempool->dp_dev;
> +	struct csm_dp_mem *mem = &mempool->mem;
> +	struct csm_dp_buf_cntrl *p = NULL;
> +	char *cl_start = NULL;
> +	unsigned int cl_buf_cnt;
> +	unsigned int k_free = 0, u_free = 0, u_recev = 0, k_msg_q_app = 0, k_recev_dma = 0;
> +	unsigned int k_tx_dma = 0, k_tx_dma_cmp = 0, u_alloc = 0;
> +	void *buf = NULL;
> +	int i, j;
> +
> +	if (mempool) {
> +		if (!csm_dp_mem_type_is_valid(mempool->type))
> +			return;
> +
> +		for (j = 0; j < mem->loc.num_cluster; j++) {
> +			cl_start = mem->loc.cluster_kernel_addr[j];
> +			if (j == mem->loc.num_cluster - 1)
> +				cl_buf_cnt = mem->buf_cnt -
> +				(mem->loc.buf_per_cluster * j);
> +			else
> +				cl_buf_cnt = mem->loc.buf_per_cluster;
> +			for (i = 0; i < cl_buf_cnt; i++) {
> +				p = (struct csm_dp_buf_cntrl *)(cl_start +
> +					(i * csm_dp_buf_true_size(mem)));
> +
> +				if (!p)
> +					break;
> +				buf = (char *)p + CSM_DP_L1_CACHE_BYTES;
> +				if (!buf)
> +					break;
> +				if (p->state == CSM_DP_BUF_STATE_USER_RECV)
> +					u_recev++;
> +				else if (p->state == CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP)
> +					k_msg_q_app++;
> +				else if (p->state == CSM_DP_BUF_STATE_KERNEL_FREE)
> +					k_free++;
> +				else if (p->state == CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA)
> +					k_recev_dma++;
> +				else if (p->state == CSM_DP_BUF_STATE_USER_FREE)
> +					u_free++;
> +				else if (p->state == CSM_DP_BUF_STATE_KERNEL_XMIT_DMA)
> +					k_tx_dma++;
> +				else if (p->state == CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP)
> +					k_tx_dma_cmp++;
> +				else if (p->state == CSM_DP_BUF_STATE_USER_ALLOC)
> +					u_alloc++;
> +			}
> +		}
> +		pr_err("%s Buffer status for bus %d VF %d\n"
> +		       "KERNEL_FREE:%u\n"
> +		       "KERNEL_ALLOC_RECV_DMA:%u\n"
> +		       "KERNEL_RECVCMP_MSGQ_TO_APP:%u\n"
> +		       "KERNEL_XMIT_DMA:%u\n"
> +		       "KERNEL_XMIT_DMA_COMP:%u\n"
> +		       "USER_FREE:%u\n"
> +		       "USER_ALLOC:%u\n"
> +		       "USER_RECV:%u\n",
> +		       csm_dp_mem_type_to_str(mempool->type),
> +		       pdev->bus_num,
> +		       pdev->vf_num,
> +		       k_free,
> +		       k_recev_dma,
> +		       k_msg_q_app,
> +		       k_tx_dma,
> +		       k_tx_dma_cmp,
> +		       u_free,
> +		       u_alloc,
> +		       u_recev);
> +	}
> +}
> +
> +void free_rx_ring_buffers(struct csm_dp_mempool *mempool, bool probe)
> +{
> +	struct csm_dp_dev *pdev = mempool->dp_dev;
> +	struct csm_dp_mem *mem = &mempool->mem;
> +	struct csm_dp_buf_cntrl *p = NULL;
> +	struct csm_dp_buf_cntrl *packet_start, *tmp;
> +	struct csm_dp_rxqueue *rxq;
> +	char *cl_start = NULL;
> +	unsigned int cl_buf_cnt;
> +	void *buf = NULL;
> +	int i, j, free_count = 0;
> +	struct task_struct *task;
> +	bool task_active = true;
> +	unsigned int cluster, c_offset;
> +	unsigned long offset;
> +
> +	/* Check if L2 is running and has a valid PID on mhi_probe */
> +	if (probe && pdev->pid != -EINVAL) {
> +		task = pid_task(find_vpid(pdev->pid), PIDTYPE_PID);
> +
> +		if (!task || strncmp(pdev->pid_name, task->comm, TASK_COMM_LEN) != 0) {
> +			task_active = false;
> +			pr_info("pid %d l2 task not active\n", pdev->pid);
> +		}
> +	}
> +
> +	if (mempool) {
> +		if (!csm_dp_mem_type_is_valid(mempool->type))
> +			return;
> +
> +		if (mempool->type == CSM_DP_MEM_TYPE_UL_DATA) {
> +			packet_start = pdev->pending_packets;
> +			while (packet_start) {
> +				tmp = packet_start->next_packet;
> +				packet_start->next_packet = NULL;
> +				csm_dp_mempool_put_buf(mempool, packet_start + 1);
> +				packet_start = tmp;
> +				free_count++;
> +			}
> +		}
> +
> +		if (mempool->type == CSM_DP_MEM_TYPE_UL_CONTROL) {
> +			rxq = &pdev->rxq[CSM_DP_RX_TYPE_FAPI];
> +			while (rxq && !csm_dp_ring_is_empty(rxq->ring)) {
> +				if (csm_dp_ring_read(rxq->ring, &offset)) {
> +					pr_err("RxQ ring read failed\n");
> +					break;
> +				}
> +				buf = csm_dp_mem_offset_addr(&mempool->mem, offset,
> +							     &cluster, &c_offset);
> +				csm_dp_mempool_put_buf(mempool, buf);
> +				free_count++;
> +			}
> +			if (!csm_dp_ring_is_empty(rxq->ring))
> +				pr_err("Not all RX control channel packets freed\n");
> +		}
> +
> +		for (j = 0; j < mem->loc.num_cluster; j++) {
> +			cl_start = mem->loc.cluster_kernel_addr[j];
> +			if (j == mem->loc.num_cluster - 1)
> +				cl_buf_cnt = mem->buf_cnt -
> +				(mem->loc.buf_per_cluster * j);
> +			else
> +				cl_buf_cnt = mem->loc.buf_per_cluster;
> +			for (i = 0; i < cl_buf_cnt; i++) {
> +				p = (struct csm_dp_buf_cntrl *)(cl_start +
> +				     (i * csm_dp_buf_true_size(mem)));
> +
> +				if (!p)
> +					break;
> +				buf = (char *)p + CSM_DP_L1_CACHE_BYTES;
> +				if (!buf)
> +					break;
> +
> +				if (p->state == CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP) {
> +					csm_dp_mempool_put_buf(mempool, buf);
> +					free_count++;
> +				}
> +				if (list_empty(&pdev->cdev_head) || !task_active) {
> +					if (p->state == CSM_DP_BUF_STATE_USER_RECV) {
> +						csm_dp_mempool_put_buf(mempool, buf);
> +						free_count++;
> +					}
> +				}
> +				if (probe) {
> +					if (p->state == CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA) {
> +						csm_dp_mempool_put_buf(mempool, buf);
> +						free_count++;
> +					}
> +				}
> +			}
> +		}
> +		pr_info("%s %d RX buffers freed for bus %d VF %d\n",
> +			csm_dp_mem_type_to_str(mempool->type),
> +			free_count, pdev->bus_num, pdev->vf_num);
> +	}
> +}
> +
> +struct csm_dp_mempool *csm_dp_get_mempool(struct csm_dp_dev *pdev,
> +					  struct csm_dp_buf_cntrl *buf_cntrl,
> +					  unsigned int *cluster)
> +{
> +	struct csm_dp_mempool *mempool;
> +
> +	if (!csm_dp_mem_type_is_valid(buf_cntrl->mem_type))
> +		return NULL;
> +
> +	mempool = pdev->mempool[buf_cntrl->mem_type];
> +	if (!mempool)
> +		return NULL;
> +
> +	if (buf_cntrl->buf_index >= U16_MAX * mempool->mem.loc.buf_per_cluster)
> +		return NULL;
> +
> +	if (cluster)
> +		*cluster = csm_dp_mem_get_cluster(&mempool->mem, buf_cntrl->buf_index);
> +
> +	return mempool;
> +}
> +
> +uint16_t csm_dp_mem_get_cluster(struct csm_dp_mem *mem, unsigned int buf_index)
> +{
> +	if (buf_index >= U16_MAX * mem->loc.buf_per_cluster) {
> +		pr_err("invalid buf_index\n");
> +		return U16_MAX;
> +	}
> +
> +	return buf_index / mem->loc.buf_per_cluster;
> +}
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h b/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h
> new file mode 100644
> index 000000000000..4abee1e8d6b6
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_mem.h
> @@ -0,0 +1,292 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_CSM_DP_MEM_H__
> +#define __QCOM_CSM_DP_MEM_H__
> +
> +#include <linux/types.h>
> +#include <linux/qcom_csm_dp_ioctl.h>
> +
> +#define MAX_CSM_DP_MEMPOOL_SIZE (1024L * 1024 * 1024 * 16)
> +#define CSM_DP_MEMPOOL_CLUSTER_SIZE (1024 * 1024 * 2)  /* must be > CSM_DP_MAX_DL_MSG_LEN */
> +#define CSM_DP_MEMPOOL_CLUSTER_SHIFT 21
> +#define CSM_DP_MEMPOOL_CLUSTER_MASK (CSM_DP_MEMPOOL_CLUSTER_SIZE - 1)
> +#define MAX_CSM_DP_MEMPOOL_CLUSTERS \
> +	(MAX_CSM_DP_MEMPOOL_SIZE / CSM_DP_MEMPOOL_CLUSTER_SIZE)
> +
> +struct csm_dp_mem_loc {
> +	size_t size;		/* size of memory chunk */
> +	void *base;		/* virtual address of first cluster.
> +				 *  for ring with one cluster only
> +				 */
> +	unsigned int cookie;	/* mmap cookie */
> +	struct page *page[MAX_CSM_DP_MEMPOOL_CLUSTERS];
> +	unsigned int last_cl_order;
> +	unsigned int num_cluster; /* number of cluster, 1 for ring */
> +	char *cluster_kernel_addr[MAX_CSM_DP_MEMPOOL_CLUSTERS];
> +
> +	/* for  CSM_DP_MMAP_TYPE_MEM */
> +	dma_addr_t cluster_dma_addr[MAX_CSM_DP_MEMPOOL_CLUSTERS];
> +	enum dma_data_direction direction;
> +	bool dma_mapped;
> +	unsigned int buf_per_cluster;
> +	unsigned long true_alloc_size;
> +};
> +
> +struct csm_dp_mem {
> +	struct csm_dp_mem_loc loc;	/* location */
> +	unsigned int buf_cnt;		/* buffer counter */
> +	unsigned int buf_sz;		/* buffer size */
> +	unsigned int buf_headroom_sz;	/* headroom unused for now */
> +	unsigned int buf_overhead_sz;	/* buffer overhead size */
> +};
> +
> +struct csm_dp_ring_opstats {
> +	atomic_t read_ok;
> +	atomic_t read_empty;
> +
> +	atomic_t write_ok;
> +	atomic_t write_full;
> +};
> +
> +struct csm_dp_ring {
> +	struct csm_dp_mem_loc loc;	/* location */
> +	unsigned int size;		/* size of ring(power of 2) */
> +	unsigned int *cons_head;	/* consumer index header */
> +	unsigned int *cons_tail;	/* consumer index tail */
> +	unsigned int *prod_head;	/* producer index header */
> +	unsigned int *prod_tail;	/* producer index tail */
> +	struct csm_dp_ring_element *element;	/* ring element */
> +	struct csm_dp_ring_opstats opstats;
> +};
> +
> +struct csm_dp_mempool_stats {
> +	unsigned long buf_put;
> +	unsigned long buf_get;
> +	unsigned long invalid_buf_put;
> +	unsigned long invalid_buf_get;
> +	unsigned long buf_put_err;
> +	unsigned long buf_get_err;
> +};
> +
> +#define CSM_DP_MEMPOOL_SIG 0xdeadbeef
> +#define CSM_DP_MEMPOOL_SIG_BAD 0xbeefdead
> +
> +struct csm_dp_mempool {
> +	unsigned int signature;
> +	struct csm_dp_dev *dp_dev;
> +	enum csm_dp_mem_type type;
> +	struct csm_dp_ring ring;
> +	struct csm_dp_mem mem;
> +	atomic_t ref;
> +	atomic_t out_xmit;
> +	struct csm_dp_mempool_stats stats;
> +	/* Lock for mempools */
> +	spinlock_t lock;
> +	struct device *dev;	/* device for iommu ops */
> +};
> +
> +struct csm_dp_mempool *csm_dp_mempool_alloc(struct csm_dp_dev *pdev,
> +					    enum csm_dp_mem_type type,
> +					    unsigned int buf_sz,
> +					    unsigned int buf_cnt,
> +					    bool may_dma_map);
> +
> +void csm_dp_mempool_free(struct csm_dp_mempool *mempool);
> +
> +int csm_dp_mempool_get_cfg(struct csm_dp_mempool *mempool,
> +			   struct csm_dp_mempool_cfg *cfg);
> +
> +int csm_dp_mempool_put_buf(struct csm_dp_mempool *mempool, void *vaddr);
> +void *csm_dp_mempool_get_buf(struct csm_dp_mempool *mempool,
> +			     unsigned int *cluster, unsigned int *c_offset);
> +void get_mempool_buf_status(struct csm_dp_mempool *mempool);
> +void free_rx_ring_buffers(struct csm_dp_mempool *mempool, bool probe);
> +
> +static inline bool csm_dp_mempool_hold(struct csm_dp_mempool *mempool)
> +{
> +	bool ret = false;
> +
> +	if (!mempool)
> +		return ret;
> +
> +	/* Update mempool ref count before incrementing */
> +	smp_mb__before_atomic();
> +	if (atomic_inc_not_zero(&mempool->ref))
> +		ret = true;
> +
> +	/* Update mempool ref count after incrementing */
> +	smp_mb__after_atomic();
> +	return ret;
> +}
> +
> +static inline void __csm_dp_mempool_hold(struct csm_dp_mempool *mempool)
> +{
> +	atomic_inc(&mempool->ref);
> +}
> +
> +int csm_dp_ring_init(struct csm_dp_ring *ring,
> +		     unsigned int ringsz,
> +		     unsigned int mmap_cookie);
> +
> +void csm_dp_ring_cleanup(struct csm_dp_ring *ring);
> +
> +int csm_dp_ring_read(struct csm_dp_ring *ring, unsigned long *element_data);
> +int csm_dp_ring_write(struct csm_dp_ring *ring, unsigned long element_data);
> +
> +bool csm_dp_ring_is_empty(struct csm_dp_ring *ring);
> +
> +int csm_dp_ring_get_cfg(struct csm_dp_ring *ring, struct csm_dp_ring_cfg *cfg);
> +
> +struct csm_dp_mempool *csm_dp_get_mempool(struct csm_dp_dev *pdev,
> +					  struct csm_dp_buf_cntrl *buf_cntrl,
> +					  unsigned int *cluster);
> +uint16_t csm_dp_mem_get_cluster(struct csm_dp_mem *mem, unsigned int buf_index);
> +
> +void csm_dp_mempool_release_no_delay(struct csm_dp_mempool *mempool);
> +
> +int csm_dp_mempool_dma_map(struct device *dev,	/* device for iommu ops */
> +			struct csm_dp_mempool *mpool);
> +
> +static inline bool __csm_dp_ulong_in_range(unsigned long v,
> +					   unsigned long start,
> +					   unsigned long end)
> +{
> +	return (v >= start && v < end);
> +}
> +
> +static inline bool csm_dp_ulong_in_range(unsigned long v,
> +					 unsigned long start,
> +					 size_t size)
> +{
> +	return __csm_dp_ulong_in_range(v, start, start + size - 1);
> +}
> +
> +static inline bool __csm_dp_vaddr_in_range(void *addr, void *start, void *end)
> +{
> +	return __csm_dp_ulong_in_range((unsigned long)addr,
> +				(unsigned long)start,
> +				(unsigned long)end);
> +}
> +
> +static inline bool csm_dp_vaddr_in_range(void *addr, void *start, size_t size)
> +{
> +	return __csm_dp_vaddr_in_range(addr, start, (char *)start + size - 1);
> +}
> +
> +static inline bool __csm_dp_vaddr_in_vma_range(void __user *vaddr_start,
> +					       void __user *vaddr_end,
> +					       struct vm_area_struct *vma)
> +{
> +	unsigned long start = (unsigned long)vaddr_start;
> +	unsigned long end = (unsigned long)vaddr_end;
> +
> +	return (start >= vma->vm_start && end < vma->vm_end);
> +}
> +
> +static inline bool csm_dp_vaddr_in_vma_range(void __user *vaddr, size_t len,
> +					     struct vm_area_struct *vma)
> +{
> +	return __csm_dp_vaddr_in_vma_range(vaddr,
> +				    (void __user *)((char *)vaddr + len - 1),
> +				    vma);
> +}
> +
> +/* Find offset, this function is used with a memory ring type */
> +static inline unsigned long csm_dp_vaddr_offset(void *addr, void *base)
> +{
> +	return (unsigned long)addr - (unsigned long)base;
> +}
> +
> +/* Find mmap size */
> +static inline unsigned long csm_dp_mem_loc_mmap_size(struct csm_dp_mem_loc *loc)
> +{
> +	return loc->size;
> +}
> +
> +static inline unsigned int csm_dp_calc_ring_size(unsigned int elements)
> +{
> +	unsigned int size = 1, shift = 0;
> +
> +	for (shift = 0; (shift < (sizeof(unsigned int) * 8 - 1)); shift++) {
> +		if (size >= elements)
> +			return size;
> +		size <<= 1;
> +	}
> +	return 0;
> +}
> +
> +/* set buffer state, ptr: pointing to beginging of buffer user data */
> +static inline void csm_dp_set_buf_state(void *ptr, enum csm_dp_buf_state state)
> +{
> +	struct csm_dp_buf_cntrl *pf = (ptr - CSM_DP_L1_CACHE_BYTES);
> +
> +	pf->state = state;
> +}
> +
> +/* get true buffer size which includes size for user space and control  */
> +static inline uint32_t csm_dp_buf_true_size(struct csm_dp_mem *mem)
> +{
> +	return (mem->buf_sz + mem->buf_overhead_sz);
> +}
> +
> +static inline void *csm_dp_mem_rec_addr(struct csm_dp_mem *mem,
> +					unsigned int rec)
> +{
> +	unsigned int cluster;
> +	unsigned int offset;
> +
> +	if (rec >= mem->buf_cnt) {
> +		pr_err("record %d exceed %d\n",
> +		       rec,  mem->buf_cnt);
> +		return NULL;
> +	}
> +	cluster = rec / mem->loc.buf_per_cluster;
> +	offset = (rec % mem->loc.buf_per_cluster) * csm_dp_buf_true_size(mem);
> +	return (void *)mem->loc.cluster_kernel_addr[cluster] + offset;
> +}
> +
> +static inline long csm_dp_mem_rec_offset(struct csm_dp_mem *mem,
> +					 unsigned int rec)
> +{
> +	unsigned int cluster;
> +	unsigned int offset;
> +
> +	if (rec >= mem->buf_cnt) {
> +		pr_err("record %d exceed %d\n", rec,  mem->buf_cnt);
> +		return -EINVAL;
> +	}
> +	cluster = rec / mem->loc.buf_per_cluster;
> +	offset = (rec % mem->loc.buf_per_cluster) * csm_dp_buf_true_size(mem);
> +	return (long)cluster * CSM_DP_MEMPOOL_CLUSTER_SIZE + offset;
> +}
> +
> +static inline void *csm_dp_mem_offset_addr(struct csm_dp_mem *mem,
> +					   unsigned long offset,
> +					   unsigned int *cluster,
> +					   unsigned int *c_offset)
> +{
> +	if (offset >= mem->loc.size) {
> +		pr_err("offset 0x%lx exceed 0x%lx\n",
> +		       offset,  mem->loc.size);
> +		return NULL;
> +	}
> +	*cluster = offset >>  CSM_DP_MEMPOOL_CLUSTER_SHIFT;
> +	*c_offset = offset & CSM_DP_MEMPOOL_CLUSTER_MASK;
> +	return (void *)(mem->loc.cluster_kernel_addr[*cluster] + *c_offset);
> +}
> +
> +static inline unsigned long csm_dp_get_mem_offset(void *addr,
> +						  struct csm_dp_mem_loc *loc,
> +						  unsigned int cl)
> +{
> +	unsigned long offset;
> +
> +	offset = (char *)addr - loc->cluster_kernel_addr[cl];
> +	offset += (long)cl * CSM_DP_MEMPOOL_CLUSTER_SIZE;
> +	return offset;
> +}
> +
> +#endif /* __QCOM_CSM_DP_MEM_H__ */
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c b/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c
> new file mode 100644
> index 000000000000..406f3c5e5c66
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.c
> @@ -0,0 +1,651 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/pci.h>
> +#include <linux/slab.h>
> +
> +#include "qcom_csm_dp.h"
> +#include "qcom_csm_dp_mhi.h"
> +
> +static struct csm_dp_drv *__pdrv;
> +
> +static int __mhi_rx_replenish(struct csm_dp_mhi *mhi)
> +{
> +	struct mhi_device *mhi_dev = mhi->mhi_dev;
> +	struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +	struct csm_dp_mempool *mempool;
> +	int nr = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> +	void *buf;
> +	int ret, i, to_xfer;
> +	bool is_control = (mhi_dev->id->driver_data == CSM_DP_CH_CONTROL);
> +	unsigned int cluster, c_offset;
> +	struct csm_dp_buf_cntrl *first_buf_cntrl = NULL, *buf_cntrl = NULL, *prev_buf_cntrl = NULL;
> +
> +	mempool = is_control ? pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL] :
> +			       pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA];
> +
> +	ret = 0;
> +	if (nr < mhi_get_total_descriptors(mhi_dev, DMA_FROM_DEVICE) / 8)
> +		return ret;
> +	for (; nr > 0;) {
> +		to_xfer = min(CSM_DP_MAX_IOV_SIZE, nr);
> +		for (i = 0; i < to_xfer; i++) {
> +			buf = csm_dp_mempool_get_buf(mempool, &cluster,
> +						     &c_offset);
> +			if (!buf) {
> +				mhi->stats.rx_out_of_buf++;
> +				pr_debug("out of rx buffer (nr %d to_xfer %d)!\n",
> +					 nr, to_xfer);
> +				to_xfer = i;
> +				ret = -ENOMEM;
> +				goto err;
> +			}
> +			csm_dp_set_buf_state(buf, CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA);
> +			/* link all buffers */
> +			buf_cntrl = buf - sizeof(struct csm_dp_buf_cntrl);
> +			if (!first_buf_cntrl)
> +				first_buf_cntrl = buf_cntrl;
> +			else
> +				prev_buf_cntrl->next = buf_cntrl;
> +			prev_buf_cntrl = buf_cntrl;
> +
> +			mhi->ul_buf_array[i].buf = buf;
> +			mhi->ul_buf_array[i].len = mempool->mem.buf_sz;
> +			mhi->ul_flag_array[i] = MHI_EOT | MHI_SG;
> +			if (!is_control)
> +				mhi->ul_flag_array[i] |= MHI_BEI;
> +			if (mempool->mem.loc.dma_mapped)
> +				mhi->ul_buf_array[i].dma_addr =
> +					mempool->mem.loc.cluster_dma_addr
> +							[cluster] + c_offset;
> +			else
> +				mhi->ul_buf_array[i].dma_addr = 0;
> +
> +			mhi->ul_buf_array[i].streaming_dma = true;
> +		}
> +		ret = mhi_queue_n_dma(mhi_dev,
> +				      DMA_FROM_DEVICE,
> +				      mhi->ul_buf_array,
> +				      mhi->ul_flag_array,
> +				      to_xfer);
> +		if (ret)
> +			goto err;
> +
> +		/* update rx head/tail */
> +		if (!mhi->rx_tail_buf_cntrl) {
> +			/* first repelenish (after probe) */
> +			buf_cntrl->next = first_buf_cntrl;
> +			mhi->rx_head_buf_cntrl = first_buf_cntrl;
> +		} else {
> +			mhi->rx_tail_buf_cntrl->next = first_buf_cntrl;
> +			buf_cntrl->next = mhi->rx_head_buf_cntrl;
> +		}
> +		mhi->rx_tail_buf_cntrl = buf_cntrl;
> +		first_buf_cntrl = NULL;
> +
> +		mhi->stats.rx_replenish++;
> +		nr -= to_xfer;
> +	}
> +
> +	return ret;
> +
> +err:
> +	for (i = 0; i < to_xfer; i++) {
> +		csm_dp_set_buf_state(mhi->ul_buf_array[i].buf,
> +				     CSM_DP_BUF_STATE_KERNEL_FREE);
> +		csm_dp_mempool_put_buf(mempool,
> +				       mhi->ul_buf_array[i].buf);
> +	}
> +	mhi->stats.rx_replenish_err++;
> +	pr_err("failed to load rx buf for bus:%d VF:%d %s\n",
> +	       pdev->bus_num, pdev->vf_num, csm_dp_mem_type_to_str(mempool->type));
> +	get_mempool_buf_status(mempool);
> +	return ret;
> +}
> +
> +static struct csm_dp_mhi *get_dp_mhi(struct mhi_device *mhi_dev)
> +{
> +	struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +
> +	switch (mhi_dev->id->driver_data) {
> +	case CSM_DP_CH_CONTROL:
> +		return &pdev->mhi_control_dev;
> +	case CSM_DP_CH_DATA:
> +		return &pdev->mhi_data_dev;
> +	default:
> +		pr_err("invalid mhi_dev->id->driver_data\n");
> +		return NULL;
> +	}
> +}
> +
> +/* TX complete */
> +static void __mhi_ul_xfer_cb(struct mhi_device *mhi_dev,
> +			     struct mhi_result *result)
> +{
> +	struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +	struct csm_dp_mhi *mhi = get_dp_mhi(mhi_dev);
> +	void *addr = result->buf_addr;
> +	struct csm_dp_mempool *mempool;
> +	struct csm_dp_buf_cntrl *buf_cntrl;
> +
> +	if ((result->transaction_status == -ENOTCONN) || mhi->mhi_dev_suspended) {
> +		pr_debug("(TX Dropped) ch %s bus %d VF %d addr=%p bytes=%lu status=%d mhi->mhi_dev_suspended %d\n",
> +			 ch_name(mhi_dev->id->driver_data),
> +			 pdev->bus_num, pdev->vf_num, result->buf_addr,
> +			 result->bytes_xferd, result->transaction_status,
> +			 mhi->mhi_dev_suspended);
> +
> +	} else {
> +		pr_debug("(TX complete) ch %s bus %d VF %d addr=%p bytes=%lu status=%d\n",
> +			 ch_name(mhi_dev->id->driver_data),
> +			 pdev->bus_num, pdev->vf_num, result->buf_addr,
> +			 result->bytes_xferd, result->transaction_status);
> +
> +		mhi->stats.tx_acked++;
> +	}
> +
> +	buf_cntrl = addr - sizeof(struct csm_dp_buf_cntrl);
> +	while (buf_cntrl) {
> +		mempool = csm_dp_get_mempool(pdev, buf_cntrl, NULL);
> +		if (unlikely(!mempool)) {
> +			pr_err("cannot find mempool for ch %s bus %d VF %d, addr=0x%p\n",
> +			       ch_name(mhi_dev->id->driver_data),
> +			       pdev->bus_num, pdev->vf_num, addr);
> +			return;
> +		}
> +
> +		if (mempool->signature != CSM_DP_MEMPOOL_SIG) {
> +			pr_err("mempool 0x%p signature 0x%x error, expect 0x%x for ch %s bus %d VF %d\n",
> +			       mempool, mempool->signature,
> +			       CSM_DP_MEMPOOL_SIG, ch_name(mhi_dev->id->driver_data),
> +			       pdev->bus_num, pdev->vf_num);
> +			return;
> +		}
> +
> +		if (atomic_read(&mempool->out_xmit) == 0) {
> +			pr_err("mempool 0x%p out xmit cnt should not be zero for ch %s bus %d VF %d\n",
> +			       mempool, ch_name(mhi_dev->id->driver_data),
> +			       pdev->bus_num, pdev->vf_num);
> +			return;
> +		}
> +
> +		atomic_dec(&mempool->out_xmit);
> +
> +		switch (mempool->type) {
> +		case CSM_DP_MEM_TYPE_UL_CONTROL:
> +		case CSM_DP_MEM_TYPE_UL_DATA:
> +			pr_err("unexpected mempool %d\n", mempool->type);
> +			break;
> +		default:
> +			if (buf_cntrl->state == CSM_DP_BUF_STATE_KERNEL_XMIT_DMA)
> +				buf_cntrl->state =
> +					CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP;
> +			buf_cntrl->xmit_status = CSM_DP_XMIT_OK;
> +			/* make it visible to other CPU */
> +			wmb();
> +			break;
> +		}
> +
> +		buf_cntrl = buf_cntrl->next;
> +		addr = buf_cntrl + 1;
> +	}
> +}
> +
> +/* RX */
> +static void __mhi_dl_xfer_cb(struct mhi_device *mhi_dev,
> +			     struct mhi_result *result)
> +{
> +	struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +	struct csm_dp_mhi *mhi = get_dp_mhi(mhi_dev);
> +	struct csm_dp_mempool *mempool;
> +	struct csm_dp_buf_cntrl *packet_start, *packet_end, *prev_buf_cntrl = NULL;
> +	bool is_control = (mhi_dev->id->driver_data == CSM_DP_CH_CONTROL);
> +	unsigned int buf_count = 0;
> +
> +	mempool = is_control ? pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL] :
> +			       pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA];
> +	if (!mempool) {
> +		/*
> +		 *  Getting here with transaction_status == -ENOTCONN is an expected situation while
> +		 * mhi devices gets removed: mempool got released part of 1st mhi device removal
> +		 * (e.g. CONTROL) and we now get RX complete for 2nd mhi device (e.g. DATA).
> +		 */
> +		if (result->transaction_status != -ENOTCONN)
> +			pr_err_ratelimited("no mempool (ch %s bus %d VF %d status %d)\n",
> +					   ch_name(mhi_dev->id->driver_data),
> +					   pdev->bus_num, pdev->vf_num,
> +					   result->transaction_status);
> +		return;
> +	}
> +
> +	if ((result->transaction_status == -ENOTCONN) || mhi->mhi_dev_suspended) {
> +		pr_debug("(RX) ch %s bus %d VF %d addr=%p bytes=%lu status=%d mhi->mhi_dev_suspended %d\n",
> +			 ch_name(mhi_dev->id->driver_data),
> +			 pdev->bus_num, pdev->vf_num, result->buf_addr,
> +			 result->bytes_xferd, result->transaction_status,
> +			 mhi->mhi_dev_suspended);
> +	} else {
> +		pr_debug("(RX) ch %s bus %d VF %d addr=%p bytes=%lu status=%d\n",
> +			 ch_name(mhi_dev->id->driver_data),
> +			 pdev->bus_num, pdev->vf_num, result->buf_addr,
> +			 result->bytes_xferd, result->transaction_status);
> +	}
> +
> +	if (result->transaction_status == -EOVERFLOW) {
> +		pr_debug("overflow event ignored\n");
> +		return;
> +	}
> +
> +	while (!mhi->rx_tail_buf_cntrl) {
> +		pr_debug("waiting for probe to complete\n");
> +		usleep_range(0, 100);
> +	}
> +
> +	packet_start = mhi->rx_head_buf_cntrl;
> +	packet_end = result->buf_addr - sizeof(struct csm_dp_buf_cntrl);
> +	for (; ((mhi->rx_head_buf_cntrl != mhi->rx_tail_buf_cntrl) ||
> +		(mhi->rx_head_buf_cntrl == packet_end));
> +	     mhi->rx_head_buf_cntrl = mhi->rx_head_buf_cntrl->next) {
> +		buf_count++;
> +		if (prev_buf_cntrl)
> +			prev_buf_cntrl->next_buf_index = mhi->rx_head_buf_cntrl->buf_index;
> +		prev_buf_cntrl = mhi->rx_head_buf_cntrl;
> +		if (mhi->rx_head_buf_cntrl != packet_end) {
> +			mhi->rx_head_buf_cntrl->len = 0;	/* 0 indicates this is part of SG */
> +			continue;
> +		}
> +
> +		/* reached end of packet */
> +		if (mhi->rx_head_buf_cntrl != mhi->rx_tail_buf_cntrl)
> +			mhi->rx_head_buf_cntrl = packet_end->next;
> +		packet_start->buf_count = buf_count;
> +		packet_end->next = NULL;
> +		packet_end->next_buf_index = CSM_DP_INVALID_BUF_INDEX;
> +		packet_end->len = result->bytes_xferd;
> +
> +		if (result->transaction_status == -ENOTCONN) {
> +			for (; packet_start; packet_start = packet_start->next)
> +				csm_dp_mempool_put_buf(mempool, packet_start + 1);
> +			return;
> +		}
> +
> +		mhi->stats.rx_cnt++;
> +		csm_dp_rx(pdev, packet_start, result->bytes_xferd);
> +
> +		return;
> +	}
> +
> +	pr_err("couldn't find end of packet for bus:%d VF:%d %s, buf_addr 0x%p bytes:%lu rx_head_buf_cntrl 0x%p rx_tail_buf_cntrl 0x%p buf_count %d\n",
> +	       pdev->bus_num, pdev->vf_num, csm_dp_mem_type_to_str(mempool->type),
> +	       result->buf_addr, result->bytes_xferd, mhi->rx_head_buf_cntrl,
> +	       mhi->rx_tail_buf_cntrl, buf_count);
> +	mhi->rx_head_buf_cntrl = packet_start;
> +}
> +
> +/*
> + * Worker function to reset (unprepare and prepare)
> + * MHI channel when channel goes into error state
> + */
> +static void csm_dp_mhi_alloc_work(struct work_struct *work)
> +{
> +	struct mhi_controller *mhi_cntrl;
> +	struct pci_dev *pci_dev;
> +	struct csm_dp_mhi *mhi;
> +	const int sleep_us =  500;
> +	int retry = 10;
> +	unsigned int bus_num, vf_num;
> +	int ret;
> +
> +	mhi = container_of(work, struct csm_dp_mhi, alloc_work);
> +
> +	if (!mhi || !mhi->mhi_dev)
> +		return;
> +
> +	mhi_cntrl = mhi->mhi_dev->mhi_cntrl;
> +	pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	bus_num = mhi_cntrl->index;
> +	vf_num = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> +	pr_info("bus %d VF %d ch %s\n", bus_num, vf_num,
> +		ch_name(mhi->mhi_dev->id->driver_data));
> +
> +	if (!mhi->mhi_dev_suspended) {
> +		pr_err("mhi is not suspended\n");
> +		return;
> +	}
> +	mhi->stats.ch_err_cnt++;
> +	do {
> +		if (atomic_read(&mhi->mhi_dev_refcnt) == 0) {
> +			break;
> +
> +		usleep_range(sleep_us, 2 * sleep_us);
> +		retry--;
> +		}
> +	} while (retry);
> +
> +	mhi_unprepare_from_transfer(mhi->mhi_dev);
> +	pr_info("bus %d VF %d ch %s mhi_unprepare_from_transfer completed\n",
> +		bus_num, vf_num, ch_name(mhi->mhi_dev->id->driver_data));
> +
> +	/*
> +	 * mhi_prepare_for_transfer is a blocking call that will return
> +	 * only after the mhi channel connection is restored
> +	 */
> +	ret = mhi_prepare_for_transfer(mhi->mhi_dev);
> +	if (ret) {
> +		pr_err("mhi_prepare_for_transfer failed\n");
> +		return;
> +	}
> +	pr_info("bus %d VF %d ch %s mhi_prepare_for_transfer completed\n",
> +		bus_num, vf_num,
> +		ch_name(mhi->mhi_dev->id->driver_data));
> +	mhi->rx_head_buf_cntrl = NULL;
> +	mhi->rx_tail_buf_cntrl = NULL;
> +
> +	ret = csm_dp_mhi_rx_replenish(mhi);
> +	if (ret) {
> +		pr_err("csm_dp_mhi_rx_replenish failed\n");
> +		return;
> +	}
> +
> +	mhi->mhi_dev_suspended = false;
> +	pr_info("bus %d VF %d ch %s mhi channel reset completed\n",
> +		bus_num, vf_num,
> +		ch_name(mhi->mhi_dev->id->driver_data));
> +}
> +
> +static void __mhi_status_cb(struct mhi_device *mhi_dev, enum mhi_callback mhi_cb)
> +{
> +	struct csm_dp_dev *pdev;
> +	struct csm_dp_mhi *mhi;
> +
> +	switch (mhi_cb) {
> +	case MHI_CB_PENDING_DATA:
> +		pdev = dev_get_drvdata(&mhi_dev->dev);
> +		if (napi_schedule_prep(&pdev->napi)) {
> +			__napi_schedule(&pdev->napi);
> +			pdev->stats.rx_int++;
> +		}
> +		break;
> +	case MHI_CB_CHANNEL_ERROR:
> +		mhi = get_dp_mhi(mhi_dev);
> +		mhi->mhi_dev_suspended = true;
> +		queue_work(mhi->mhi_dev_workqueue, &mhi->alloc_work);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +int csm_dp_mhi_rx_replenish(struct csm_dp_mhi *mhi)
> +{
> +	int ret;
> +
> +	spin_lock_bh(&mhi->rx_lock);
> +
> +	if (mhi->mhi_dev_destroyed) {
> +		ret = -ENODEV;
> +		pr_err_ratelimited("Replenish error:%d Device destroyed\n", ret);
> +	} else {
> +		ret = __mhi_rx_replenish(mhi);
> +	}
> +
> +	spin_unlock_bh(&mhi->rx_lock);
> +	return ret;
> +}
> +
> +void csm_dp_mhi_tx_poll(struct csm_dp_mhi *mhi)
> +{
> +	int n;
> +
> +	do {
> +		n = mhi_poll(mhi->mhi_dev, CSM_DP_NAPI_WEIGHT, DMA_TO_DEVICE);
> +		if (n < 0)
> +			pr_err_ratelimited("Error Tx polling n:%d\n", n);
> +	} while (n == CSM_DP_NAPI_WEIGHT);
> +}
> +
> +void csm_dp_mhi_rx_poll(struct csm_dp_mhi *mhi)
> +{
> +	int n;
> +
> +	do {
> +		n = mhi_poll(mhi->mhi_dev, CSM_DP_NAPI_WEIGHT, DMA_FROM_DEVICE);
> +		if (n < 0)
> +			pr_err_ratelimited("Error Rx polling n:%d\n", n);
> +
> +		pr_info("Number of Rx poll %d\n", n);
> +	} while (n == CSM_DP_NAPI_WEIGHT);
> +}
> +
> +static void csm_dp_mhi_packet_stats_reset(struct csm_dp_mhi *mhi,
> +					  struct csm_dp_dev *pdev,
> +					  enum csm_dp_channel ch)
> +{
> +	struct csm_dp_core_stats *stats = &pdev->stats;
> +	bool is_control = (ch == CSM_DP_CH_CONTROL);
> +
> +	if (mhi) {
> +		mhi->stats.tx_cnt = 0;
> +		mhi->stats.tx_acked = 0;
> +		mhi->stats.tx_err = 0;
> +		mhi->stats.rx_cnt = 0;
> +		mhi->stats.rx_out_of_buf = 0;
> +		mhi->stats.rx_replenish = 0;
> +		mhi->stats.rx_replenish_err = 0;
> +		mhi->stats.ch_err_cnt = 0;
> +		if (stats && is_control)
> +			stats->rx_drop = 0;
> +	}
> +}
> +
> +static int csm_dp_mhi_probe(struct mhi_device *mhi_dev,
> +			    const struct mhi_device_id *id)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct pci_dev *pci_dev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	struct csm_dp_dev *pdev;
> +	int ret;
> +	struct csm_dp_mhi *mhi;
> +	struct csm_dp_mempool *mempool;
> +	unsigned int bus_num, vf_num;
> +
> +	bus_num = mhi_cntrl->index;
> +	vf_num = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), PCI_FUNC(pci_dev->devfn));
> +	pr_info("probing bus:%d VF:%d mhi chan %s dp chan %s\n",
> +		bus_num, vf_num, id->chan, ch_name(id->driver_data));
> +
> +	if (!__pdrv)
> +		return -ENODEV;
> +
> +	if (vf_num < 0) {
> +		/* SR-IOV disabled, create single device node */
> +		pdev = &__pdrv->dp_devs[bus_num * CSM_DP_MAX_NUM_VFS];
> +	} else if (vf_num == 0) {
> +		/* SR-IOV enabled, PF device: ignore */
> +		return 0;
> +	} else if (bus_num >= CSM_DP_MAX_NUM_BUSES || vf_num > CSM_DP_MAX_NUM_VFS) {
> +		/* invalid ids */
> +		pr_err("invalid ids bus_num %d vf_num %d\n", bus_num, vf_num);
> +		return -EINVAL;
> +	}
> +
> +	/* SR-IOV enabled, VF device. bus_num is 0..11, vf_num is 1..4 */
> +	if (vf_num > 0)
> +		pdev = &__pdrv->dp_devs[vf_num];
> +
> +	if (!pdev->cdev_inited) {
> +		pdev->bus_num = bus_num;
> +		pdev->vf_num = vf_num;
> +		ret = csm_dp_cdev_add(pdev, &mhi_dev->dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	switch (id->driver_data) {
> +	case CSM_DP_CH_CONTROL:
> +		mhi = &pdev->mhi_control_dev;
> +		mempool = pdev->mempool[CSM_DP_MEM_TYPE_UL_CONTROL];
> +		break;
> +	case CSM_DP_CH_DATA:
> +		mhi = &pdev->mhi_data_dev;
> +		mempool = pdev->mempool[CSM_DP_MEM_TYPE_UL_DATA];
> +		break;
> +	default:
> +		pr_err("unexpected driver_data %ld for bus:%d VF:%d\n",
> +		       id->driver_data, bus_num, vf_num);
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	free_rx_ring_buffers(mempool, true);
> +	csm_dp_mhi_packet_stats_reset(mhi, pdev, id->driver_data);
> +
> +	dev_set_drvdata(&mhi_dev->dev, pdev);
> +
> +	ret = mhi_prepare_for_transfer(mhi_dev);
> +	if (ret) {
> +		pr_err("mhi_prepare_for_transfer failed for bus:%d VF:%d mhi chan %s dp chan %s\n",
> +		       bus_num, vf_num, id->chan, ch_name(id->driver_data));
> +		goto err;
> +	}
> +
> +	/* Creating workqueue */
> +	mhi->mhi_dev_workqueue = alloc_workqueue("csm_dp_mhi_workqueue",
> +						 WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
> +	if (!mhi->mhi_dev_workqueue) {
> +		pr_err("Failed to allocate workqueue for bus:%d VF:%d mhi chan %s dp chan %s\n",
> +		       bus_num, vf_num, id->chan, ch_name(id->driver_data));
> +		goto err;
> +	}
> +
> +	INIT_WORK(&mhi->alloc_work, csm_dp_mhi_alloc_work);
> +
> +	mhi->mhi_dev = mhi_dev;
> +	mhi->mhi_dev_suspended = false;
> +	atomic_set(&mhi->mhi_dev_refcnt, 0);
> +	spin_lock_init(&mhi->rx_lock);
> +	mutex_init(&mhi->tx_mutex);
> +	mhi->rx_head_buf_cntrl = NULL;
> +	mhi->rx_tail_buf_cntrl = NULL;
> +
> +	mhi->mhi_dev_destroyed = false;
> +	pr_debug("csm_dp_mhi_rx_replenish\n");
> +	if (mempool) {
> +		ret = csm_dp_mempool_dma_map(mhi_dev->mhi_cntrl->cntrl_dev, mempool);
> +		if (ret) {
> +			pr_err("dma_map failed for bus:%d VF:%d mhi chan %s dp chan %s, mempool type %d ret %d\n",
> +			       bus_num, vf_num, id->chan,
> +			       ch_name(id->driver_data), mempool->type, ret);
> +			goto err;
> +		}
> +
> +		ret = csm_dp_mhi_rx_replenish(mhi);
> +		if (ret) {
> +			pr_err("csm_dp_mhi_rx_replenish failed for bus:%d VF:%d mhi chan %s dp chan %s\n",
> +			       bus_num, vf_num, id->chan, ch_name(id->driver_data));
> +			goto err;
> +		}
> +	}
> +
> +	pr_info("successful for bus:%d VF:%d mhi chan %s dp chan %s\n",
> +		bus_num, vf_num, id->chan, ch_name(id->driver_data));
> +
> +	return 0;
> +
> +err:
> +	mhi->mhi_dev_destroyed = true;
> +	csm_dp_cdev_del(pdev);
> +	return ret;
> +}
> +
> +static void csm_dp_mhi_remove(struct mhi_device *mhi_dev)
> +{
> +	struct csm_dp_dev *pdev = dev_get_drvdata(&mhi_dev->dev);
> +	struct csm_dp_mhi *mhi;
> +
> +	pr_info("mhi chan %s dp chan %s bus %d VF %d\n",
> +		mhi_dev->id->chan,
> +		ch_name(mhi_dev->id->driver_data),
> +		pdev->bus_num, pdev->vf_num);
> +
> +	switch (mhi_dev->id->driver_data) {
> +	case CSM_DP_CH_CONTROL:
> +		mhi = &pdev->mhi_control_dev;
> +		break;
> +	case CSM_DP_CH_DATA:
> +		mhi = &pdev->mhi_data_dev;
> +		break;
> +	default:
> +		pr_err("unexpected driver_data %ld\n",
> +		       mhi_dev->id->driver_data);
> +		return;
> +	}
> +
> +	flush_work(&mhi->alloc_work);
> +	destroy_workqueue(mhi->mhi_dev_workqueue);
> +	mhi_unprepare_from_transfer(mhi_dev);
> +
> +	spin_lock_bh(&mhi->rx_lock);
> +	mhi->mhi_dev_destroyed = true;
> +	spin_unlock_bh(&mhi->rx_lock);
> +
> +	/* wait for idle mhi_dev */
> +	while (atomic_read(&mhi->mhi_dev_refcnt) > 0) {
> +		pr_debug("mhi_dev_refcnt %d\n",
> +			 atomic_read(&mhi->mhi_dev_refcnt));
> +		usleep_range(0, 10 * 1000);
> +	}
> +	mhi->mhi_dev = NULL;
> +}
> +
> +static struct mhi_device_id csm_dp_mhi_match_table[] = {
> +	{ .chan = "IP_HW1", .driver_data = CSM_DP_CH_CONTROL },
> +	{ .chan = "IP_HW2", .driver_data = CSM_DP_CH_DATA },
> +	{},
> +};
> +
> +static struct mhi_driver __csm_dp_mhi_drv = {
> +	.id_table = csm_dp_mhi_match_table,
> +	.remove = csm_dp_mhi_remove,
> +	.probe = csm_dp_mhi_probe,
> +	.ul_xfer_cb = __mhi_ul_xfer_cb,
> +	.dl_xfer_cb = __mhi_dl_xfer_cb,
> +	.status_cb = __mhi_status_cb,
> +	.driver = {
> +		.name = CSM_DP_MHI_NAME,
> +		.owner = THIS_MODULE,
> +	},
> +};
> +
> +int csm_dp_mhi_init(struct csm_dp_drv *pdrv)
> +{
> +	int ret = -EBUSY;
> +
> +	if (!__pdrv) {
> +		__pdrv = pdrv;
> +		ret = mhi_driver_register(&__csm_dp_mhi_drv);
> +		if (ret) {
> +			__pdrv = NULL;
> +			pr_err("CSM-DP: mhi registration failed!\n");
> +			return ret;
> +		}
> +
> +		pr_info("CSM-DP: Register MHI driver!\n");
> +	}
> +	return ret;
> +}
> +
> +void csm_dp_mhi_cleanup(struct csm_dp_drv *pdrv)
> +{
> +	if (__pdrv) {
> +		mhi_driver_unregister(&__csm_dp_mhi_drv);
> +		__pdrv = NULL;
> +		pr_info("CSM-DP: Unregister MHI driver\n");
> +	}
> +}
> diff --git a/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h b/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h
> new file mode 100644
> index 000000000000..ad014956e6ec
> --- /dev/null
> +++ b/drivers/char/qcom_csm_dp/qcom_csm_dp_mhi.h
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __QCOM_CSM_DP_MHI_H__
> +#define __QCOM_CSM_DP_MHI_H__
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/mhi.h>
> +#include <linux/slab.h>
> +
> +#define CSM_DP_MHI_NAME	"csm-dp-mhi"
> +
> +struct csm_dp_drv;
> +
> +struct csm_dp_mhi_stats {
> +	unsigned long tx_cnt;
> +	unsigned long tx_acked;
> +	unsigned long tx_err;
> +	unsigned long rx_cnt;
> +	unsigned long rx_out_of_buf;
> +
> +	unsigned long rx_replenish;
> +	unsigned long rx_replenish_err;
> +	unsigned long ch_err_cnt;
> +};
> +
> +/* Represents MHI channel pair - Tx and Rx */
> +struct csm_dp_mhi {
> +	struct mhi_device *mhi_dev;
> +	bool mhi_dev_destroyed;
> +	bool mhi_dev_suspended;
> +	atomic_t mhi_dev_refcnt;
> +	struct csm_dp_mhi_stats stats;
> +	/* rx_lock for control and data channels */
> +	spinlock_t rx_lock;
> +	/* Mutex lock for TX's */
> +	struct mutex tx_mutex;
> +	struct workqueue_struct *mhi_dev_workqueue;
> +	struct work_struct alloc_work;
> +	/*
> +	 * The following are for needed storage
> +	 * for mhi_queue_n_transfer.
> +	 */
> +	enum mhi_flags ul_flag_array[CSM_DP_MAX_IOV_SIZE];
> +	enum mhi_flags dl_flag_array[CSM_DP_MAX_IOV_SIZE];
> +	struct mhi_buf dl_buf_array[CSM_DP_MAX_IOV_SIZE];
> +	struct mhi_buf ul_buf_array[CSM_DP_MAX_IOV_SIZE];
> +
> +	struct csm_dp_buf_cntrl *rx_head_buf_cntrl, *rx_tail_buf_cntrl;
> +};
> +
> +int csm_dp_mhi_init(struct csm_dp_drv *pdrv);
> +void csm_dp_mhi_cleanup(struct csm_dp_drv *pdrv);
> +
> +int csm_dp_mhi_rx_replenish(struct csm_dp_mhi *mhi);
> +
> +static inline int csm_dp_mhi_n_tx(struct csm_dp_mhi *mhi,
> +				  unsigned int num)
> +{
> +	int ret;
> +
> +	ret = mhi_queue_n_dma(mhi->mhi_dev, DMA_TO_DEVICE, mhi->dl_buf_array,
> +			      mhi->dl_flag_array, num);
> +	if (!ret)
> +		mhi->stats.tx_cnt += num;
> +	else
> +		mhi->stats.tx_err += num;
> +	return ret;
> +}
> +
> +static inline bool csm_dp_mhi_is_ready(struct csm_dp_mhi *mhi)
> +{
> +	return mhi->mhi_dev && !mhi->mhi_dev_destroyed && !mhi->mhi_dev_suspended;
> +}
> +
> +void csm_dp_mhi_tx_poll(struct csm_dp_mhi *mhi);
> +void csm_dp_mhi_rx_poll(struct csm_dp_mhi *mhi);
> +
> +#endif /* __QCOM_CSM_DP_MHI_H__ */
> diff --git a/include/uapi/linux/qcom_csm_dp_ioctl.h b/include/uapi/linux/qcom_csm_dp_ioctl.h
> new file mode 100644
> index 000000000000..af04b9b13d34
> --- /dev/null
> +++ b/include/uapi/linux/qcom_csm_dp_ioctl.h
> @@ -0,0 +1,306 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#ifndef __QCOM_CSM_DP_IOCTL_H__
> +#define __QCOM_CSM_DP_IOCTL_H__
> +
> +#include <linux/types.h>
> +#ifdef __KERNEL__
> +#include <linux/uio.h>
> +#else
> +#include <sys/uio.h>
> +#endif
> +
> +#define CSM_DP_MAX_IOV_SIZE	128
> +#define CSM_DP_MAX_SG_IOV_SIZE	128
> +
> +#define CSM_DP_IOCTL_BASE	0xDA
> +
> +#define CSM_DP_IOCTL_MEMPOOL_ALLOC	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 1, struct csm_dp_ioctl_mempool_alloc)
> +
> +#define CSM_DP_IOCTL_MEMPOOL_GET_CONFIG	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 2, struct csm_dp_ioctl_getcfg)
> +
> +#define CSM_DP_IOCTL_RX_GET_CONFIG	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 3, struct csm_dp_ioctl_getcfg)
> +
> +#define CSM_DP_IOCTL_TX			\
> +		_IOWR(CSM_DP_IOCTL_BASE, 4, struct csm_dp_ioctl_tx)
> +
> +#define CSM_DP_IOCTL_SG_TX		\
> +		_IOWR(CSM_DP_IOCTL_BASE, 5, struct csm_dp_ioctl_tx)
> +
> +/* obsolete */
> +#define CSM_DP_IOCTL_TX_MODE_CONFIG	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 6, unsigned int)
> +
> +#define CSM_DP_IOCTL_RX_POLL	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 7, struct iovec)
> +
> +#define CSM_DP_IOCTL_GET_STATS	\
> +		_IOWR(CSM_DP_IOCTL_BASE, 8, struct csm_dp_ioctl_getstats)
> +
> +enum csm_dp_mem_type {
> +	CSM_DP_MEM_TYPE_DL_CONTROL,
> +	CSM_DP_MEM_TYPE_DL_DATA,
> +	CSM_DP_MEM_TYPE_UL_CONTROL,
> +	CSM_DP_MEM_TYPE_UL_DATA,
> +	CSM_DP_MEM_TYPE_LAST,
> +};
> +
> +enum csm_dp_mmap_type {
> +	CSM_DP_MMAP_TYPE_MEM,
> +	CSM_DP_MMAP_TYPE_RING,
> +	CSM_DP_MMAP_TYPE_LAST,
> +};
> +
> +enum csm_dp_rx_type {
> +	CSM_DP_RX_TYPE_FAPI,
> +	CSM_DP_RX_TYPE_LAST,
> +};
> +
> +#define CSM_DP_BUFFER_FENCE_SIG 0xDEADFACE
> +#define CSM_DP_BUFFER_SIG       0xDAC0FFEE
> +
> +/*
> + * A buffer control is an area with size of L1_CACHE_BYTES (64 bytes for arm64).
> + * It is placed at the beginning of a buffer.
> + * csm_dp_buf_cntrl is placed at the control area. The last 4 bytes of the area is a fence defined
> + * as CSM_DP_BUFFER_FENCE_SIG.
> + * The size of csm_dp_buf_cntrl should be less than L1_CACHE_BYTES.
> + * User data is placed after the control area of L1_CACHE_BYTES size.
> + */
> +#define CSM_DP_L1_CACHE_BYTES 64  /*
> +				   * CSM_DP_L1_CACHE_BYTES is the same as
> +				   * L1_CACHE_BYTES.
> +				   * csm_dp_ioctl.h is included in
> +				   * the applications,
> +				   * The symbol L1_CACHE_BYTES is defined in the
> +				   * kernel, not be used here. Therefore,
> +				   * it is redefined.
> +				   */
> +/*
> + * xmit_status definition
> + * If xmit errors, defined as -(error code)
> + */
> +#define CSM_DP_XMIT_IN_PROGRESS (1)
> +#define CSM_DP_XMIT_OK		0
> +
> +/*
> + * maximum mtu size for CSM DP application, including csm_dp header
> + * Note, need to make sure both sides in sync between Host and Q6
> + */
> +#define CSM_DP_MAX_DL_MSG_LEN   ((2 * 1024 * 1024) - CSM_DP_L1_CACHE_BYTES)
> +#define CSM_DP_MAX_UL_MSG_LEN   CSM_DP_MAX_DL_MSG_LEN
> +
> +#define CSM_DP_DEFAULT_UL_BUF_SIZE	(512 * 1024)
> +#define CSM_DP_DEFAULT_UL_BUF_CNT	2500
> +
> +#define CSM_DP_INVALID_BUF_INDEX ((uint32_t)-1)
> +
> +struct csm_dp_buf_cntrl {
> +	uint32_t signature;
> +	uint32_t state;
> +	int32_t xmit_status;
> +	uint16_t mem_type;	/* enum csm_dp_mem_type */
> +	uint32_t buf_index;
> +	struct csm_dp_buf_cntrl *next;	/* used by kernel only */
> +	uint32_t next_buf_index;	/* used in Rx, kernel writes, user reads */
> +	uint32_t len;			/* used in Rx, kernel writes, user reads */
> +	struct csm_dp_buf_cntrl *next_packet;	/* used in Rx only */
> +	uint16_t buf_count;	/* used in Rx only */
> +	unsigned char spare[CSM_DP_L1_CACHE_BYTES
> +		- sizeof(uint32_t) /* signature */
> +		- sizeof(uint32_t) /* state */
> +		- sizeof(int32_t) /* xmit_status */
> +		- sizeof(uint16_t) /* mem_type */
> +		- sizeof(uint32_t) /* buf_index */
> +		- sizeof(struct csm_dp_buf_cntrl *) /* next */
> +		- sizeof(uint32_t) /* next_buf_index */
> +		- sizeof(uint32_t) /* len */
> +		- sizeof(struct csm_dp_buf_cntrl *) /* next_packet */
> +		- sizeof(uint16_t) /* buf_count */
> +		- sizeof(uint32_t)];/* fence */
> +	uint32_t fence;
> +} __attribute__((packed));
> +
> +enum csm_dp_buf_state {
> +	CSM_DP_BUF_STATE_KERNEL_FREE,
> +	CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA,
> +	CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP,
> +	CSM_DP_BUF_STATE_KERNEL_XMIT_DMA,
> +	CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP,
> +	CSM_DP_BUF_STATE_USER_FREE,
> +	CSM_DP_BUF_STATE_USER_ALLOC,
> +	CSM_DP_BUF_STATE_USER_RECV,
> +	CSM_DP_BUF_STATE_LAST,
> +};
> +
> +enum csm_dp_channel {
> +	CSM_DP_CH_CONTROL,
> +	CSM_DP_CH_DATA,
> +};
> +
> +struct csm_dp_ring_element {
> +	uint64_t element_ctrl;	/* 1 entry not valid, 0 valid */
> +				/* Other bits for control flags: tbd */
> +
> +	unsigned long element_data;
> +				/*
> +				 * If the ring is used for
> +				 * csm dp buffer management,
> +				 * ring data is pointing to
> +				 * user data
> +				 */
> +};
> +
> +struct csm_dp_mmap_cfg {
> +	__u64 length;	/* length parameter for mmap */
> +	__u32 cookie;	/* last parameter for mmap */
> +};
> +
> +struct csm_dp_ring_cfg {
> +	struct csm_dp_mmap_cfg mmap;	/* mmap parameters */
> +	__u32 size;			/* ring size */
> +	__u32 prod_head_off;		/* page offset of prod_head */
> +	__u32 prod_tail_off;		/* page offset of prod_tail */
> +	__u32 cons_head_off;		/* page offset of cons_head */
> +	__u32 cons_tail_off;		/* page offset of cons_tail */
> +	__u32 ringbuf_off;		/* page offset of ring buffer */
> +};
> +
> +struct csm_dp_mem_cfg {
> +	struct csm_dp_mmap_cfg mmap;	/* mmap parameters */
> +	__u32 buf_sz;			/* size of buffer for user data */
> +	__u32 buf_cnt;			/* number of buffer */
> +	__u32 buf_overhead_sz;		/*
> +					 * size of buffer overhead,
> +					 * on top of buf_sz.
> +					 */
> +	__u32 cluster_size;		/* cluster size in bytes.
> +					 * number of buffers in a cluster:
> +					 *  cluster_size /(buf_overhead_sz +
> +					 *                 buf_sz)
> +					 * A buffer starts at beginning of
> +					 * a cluster. Spared space with
> +					 * size less than (buf_overhead_sz
> +					 *          +  buf_sz) at end of
> +					 * a cluster is not used.
> +					 */
> +	__u32 num_cluster;		/* number of cluster */
> +	__u32 buf_per_cluster;		/* number of buffers per cluster  */
> +};
> +
> +struct csm_dp_mempool_cfg {
> +	enum csm_dp_mem_type type;
> +	struct csm_dp_mem_cfg mem;
> +	struct csm_dp_ring_cfg ring;
> +};
> +
> +struct csm_dp_ioctl_mempool_alloc {
> +	__u32 type;		/* type defined in enum csm_dp_mem_type */
> +	__u32 buf_sz;		/* size of buffer */
> +	__u32 buf_num;		/* number of buffer */
> +	struct csm_dp_mempool_cfg *cfg;	/* for kernel to return config info */
> +};
> +
> +struct csm_dp_ioctl_getcfg {
> +	__u32 type;
> +	void *cfg;
> +};
> +
> +struct csm_dp_ioctl_tx {
> +	enum csm_dp_channel ch;
> +	struct iovec iov;
> +	__u32 flags;	/* CSM_DP_IOCTL_TX_FLAG_xxx */
> +};
> +
> +struct csm_dp_ioctl_getstats {
> +	enum csm_dp_channel ch;	/* IN param, set by caller */
> +	__u64 tx_cnt;
> +	__u64 tx_acked;
> +	__u64 rx_cnt;
> +	__u64 reserved[10];	/* for future use */
> +};
> +
> +static inline int csm_dp_mem_type_is_valid(enum csm_dp_mem_type type)
> +{
> +	return (type >= 0 && type < CSM_DP_MEM_TYPE_LAST);
> +}
> +
> +static inline const char *csm_dp_mem_type_to_str(enum csm_dp_mem_type type)
> +{
> +	switch (type) {
> +	case CSM_DP_MEM_TYPE_DL_CONTROL: return "DL_CTRL";
> +	case CSM_DP_MEM_TYPE_DL_DATA: return "DL_DATA";
> +	case CSM_DP_MEM_TYPE_UL_CONTROL: return "UL_CTRL";
> +	case CSM_DP_MEM_TYPE_UL_DATA: return "UL_DATA";
> +	default: return "unknown";
> +	}
> +}
> +
> +static inline int csm_dp_mmap_type_is_valid(enum csm_dp_mmap_type type)
> +{
> +	return (type >= 0 && type < CSM_DP_MMAP_TYPE_LAST);
> +}
> +
> +static inline const char *csm_dp_mmap_type_to_str(enum csm_dp_mmap_type type)
> +{
> +	switch (type) {
> +	case CSM_DP_MMAP_TYPE_MEM: return "Memory";
> +	case CSM_DP_MMAP_TYPE_RING: return "Ring";
> +	default: return "unknown";
> +	}
> +}
> +
> +static inline int csm_dp_rx_type_is_valid(enum csm_dp_rx_type type)
> +{
> +	return (type >= 0 && type < CSM_DP_RX_TYPE_LAST);
> +}
> +
> +static inline const char *csm_dp_rx_type_to_str(enum csm_dp_rx_type type)
> +{
> +	switch (type) {
> +	case CSM_DP_RX_TYPE_FAPI: return "FAPI";
> +	default: return "unknown";
> +	}
> +}
> +
> +static inline const char *csm_dp_buf_state_to_str(enum csm_dp_buf_state state)
> +{
> +	switch (state) {
> +	case CSM_DP_BUF_STATE_KERNEL_FREE:
> +		return "KERNEL FREE";
> +	case CSM_DP_BUF_STATE_KERNEL_ALLOC_RECV_DMA:
> +		return "KERNEL ALLOC RECV DMA";
> +	case CSM_DP_BUF_STATE_KERNEL_RECVCMP_MSGQ_TO_APP:
> +		return "KERNEL RECV CMP MSGQ TO APP";
> +	case CSM_DP_BUF_STATE_KERNEL_XMIT_DMA:
> +		return "KERNEL XMIT DMA";
> +	case CSM_DP_BUF_STATE_KERNEL_XMIT_DMA_COMP:
> +		return "KERNEL XMIT DMA COMP";
> +	case CSM_DP_BUF_STATE_USER_FREE:
> +		return "USER FREE";
> +	case CSM_DP_BUF_STATE_USER_ALLOC:
> +		return "USER ALLOC";
> +	case CSM_DP_BUF_STATE_USER_RECV:
> +		return "USER RECV";
> +	case CSM_DP_BUF_STATE_LAST:
> +	default:
> +		return "unknown";
> +	};
> +}
> +
> +static inline bool csm_dp_mem_type_is_ul(enum csm_dp_mem_type type)
> +{
> +	return type == CSM_DP_MEM_TYPE_UL_CONTROL || type == CSM_DP_MEM_TYPE_UL_DATA;
> +}
> +
> +static inline bool csm_dp_mem_type_is_dl(enum csm_dp_mem_type type)
> +{
> +	return type == CSM_DP_MEM_TYPE_DL_CONTROL || type == CSM_DP_MEM_TYPE_DL_DATA;
> +}
> +
> +#endif /* __QCOM_CSM_DP_IOCTL_H__ */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

