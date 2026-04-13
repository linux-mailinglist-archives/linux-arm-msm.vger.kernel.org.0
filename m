Return-Path: <linux-arm-msm+bounces-102936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wALgNGTS3GmcWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:24:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8BD3EB3F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 13:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E10043029E61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFA83C0621;
	Mon, 13 Apr 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU66Kl8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ACA3AF667;
	Mon, 13 Apr 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079255; cv=none; b=lXItbAh18ldRyEvLLqc6qDQ/Dfz1mkXhJwATuuZ4QlTPNWVYfuqGZ9Io1cIO+zkSpWdwOjHsaObPAuLO13AjtyqRCwL7WPQRaM5VDy9i6kDzSRQ7yCLa64ZDoRfuhF+oW20D0DY5YbqR+HNFxeit7pP0nNLufrsM/DGo0iG15fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079255; c=relaxed/simple;
	bh=UiS601VUn5/ZvPYsy5C4Mul8oOXSARMTv/V7FEYtdJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ncxeFjuZ7qGKityvX4huoVc/AtFoFeukDZnTx7TP2slynnMYRbr2WspLl4hYEtxvkdF9pTc5dn34gW3+8wLNIOoe9dG2ncNbLCOpbHHfpYSeAYuWpT4B7c3VjGWI0YQZYkMS9YpLM0sBv0vOPkTr0luuyRuux+miGaWLsMnTSNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU66Kl8V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32921C116C6;
	Mon, 13 Apr 2026 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776079255;
	bh=UiS601VUn5/ZvPYsy5C4Mul8oOXSARMTv/V7FEYtdJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kU66Kl8VXCrcRB9lA+ElZb1UkRrVc6F9u1vRzLrB5Ig72B0rrDu2wJC61n45CViGZ
	 RGytLAU1LikED+X9r0tZ8UBExIySrBBQv/f04PhfN58iRypPYWRoaGYcNMA6SFnkxM
	 tFwcH/5GROwM/OSJRG3LrRJd0j5LalQINWMRrAzFu3XC2jU63PSaQld0i8bPeKgrda
	 8FAmHsow1pOchE+kItJaP2heb2Vd0Gc5LOcT8pS8pi0lfINFnOOwz8ZvOQ4WjnSiJ4
	 2d43Z7dR7h+VDmD4uCTWmV2zBoK9tujK6RyhjfZjlFHk1/B1xkEF3aMxgDPv5oXNf9
	 9QkQyO4XuZbVg==
Date: Mon, 13 Apr 2026 16:50:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
Message-ID: <enwtopztznwtvlhukkggxcdmh4t7v7duoiuapi5gd4zggqwbit@ypb4nxnds53f>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102936-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E8BD3EB3F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 12:01:42PM +0530, Kishore Batta wrote:
> The Sahara protocol driver is currently located under the QAIC
> accelerator subsystem even though protocol itself is transported over the
> MHI bus and is used by multiple Qualcomm flashless devices.
> 
> Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
> an independent MHI protocol driver. This avoids treating Sahara as QAIC
> specific and makes it available for reuse by other MHI based devices.
> 
> As part of this move, introduce a dedicated Kconfig and Makefile under the
> MHI subsystem and expose the sahara interface via a common header.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/Kconfig                      |  1 +
>  drivers/accel/qaic/Makefile                     |  3 +--
>  drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
>  drivers/bus/mhi/Kconfig                         |  1 +
>  drivers/bus/mhi/Makefile                        |  3 +++
>  drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
>  drivers/bus/mhi/sahara/Makefile                 |  2 ++

Create one more subidr 'clients' and move 'sahara' here:
	drivers/bus/mhi/host/clients/sahara/

I'm not sure if we are going to have Sahara implementation for the endpoint
itself. If so, it should be moved under drivers/bus/mhi/common/.

>  drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
>  {drivers/accel/qaic => include/linux}/sahara.h  |  0

include/linux/mhi/sahara.h

>  9 files changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
> --- a/drivers/accel/qaic/Kconfig
> +++ b/drivers/accel/qaic/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>  	depends on DRM_ACCEL
>  	depends on PCI && HAS_IOMEM
>  	depends on MHI_BUS
> +	select MHI_SAHARA
>  	select CRC32
>  	select WANT_DEV_COREDUMP
>  	help
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
> --- a/drivers/accel/qaic/Makefile
> +++ b/drivers/accel/qaic/Makefile
> @@ -13,7 +13,6 @@ qaic-y := \
>  	qaic_ras.o \
>  	qaic_ssr.o \
>  	qaic_sysfs.o \
> -	qaic_timesync.o \
> -	sahara.o
> +	qaic_timesync.o
>  
>  qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -15,6 +15,7 @@
>  #include <linux/msi.h>
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/sahara.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include <linux/wait.h>
> @@ -32,7 +33,6 @@
>  #include "qaic_ras.h"
>  #include "qaic_ssr.h"
>  #include "qaic_timesync.h"
> -#include "sahara.h"
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> @@ -782,18 +782,12 @@ static int __init qaic_init(void)
>  	ret = pci_register_driver(&qaic_pci_driver);
>  	if (ret) {
>  		pr_debug("qaic: pci_register_driver failed %d\n", ret);
> -		return ret;
> +		goto free_pci;
>  	}
>  
>  	ret = mhi_driver_register(&qaic_mhi_driver);
>  	if (ret) {
>  		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
> -		goto free_pci;
> -	}
> -
> -	ret = sahara_register();
> -	if (ret) {
> -		pr_debug("qaic: sahara_register failed %d\n", ret);
>  		goto free_mhi;
>  	}
>  
> @@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
>  	qaic_ras_unregister();
>  	qaic_bootlog_unregister();
>  	qaic_timesync_deinit();
> -	sahara_unregister();
>  	mhi_driver_unregister(&qaic_mhi_driver);
>  	pci_unregister_driver(&qaic_pci_driver);
>  }
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -7,3 +7,4 @@
>  
>  source "drivers/bus/mhi/host/Kconfig"
>  source "drivers/bus/mhi/ep/Kconfig"
> +source "drivers/bus/mhi/sahara/Kconfig"
> diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
> --- a/drivers/bus/mhi/Makefile
> +++ b/drivers/bus/mhi/Makefile
> @@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
>  
>  # Endpoint MHI stack
>  obj-$(CONFIG_MHI_BUS_EP) += ep/
> +
> +# Sahara MHI protocol
> +obj-$(CONFIG_MHI_SAHARA) += sahara/
> diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
> --- /dev/null
> +++ b/drivers/bus/mhi/sahara/Kconfig
> @@ -0,0 +1,18 @@
> +config MHI_SAHARA
> +	tristate
> +	depends on MHI_BUS
> +	select FW_LOADER_COMPRESS
> +	select FW_LOADER_COMPRESS_XZ
> +	select FW_LOADER_COMPRESS_ZSTD

Why suddenly these configs pop up?

> +	help
> +	  Enable support for the Sahara protocol transported over the MHI bus.
> +
> +	  The Sahara protocol is used to transfer firmware images, retrieve
> +	  memory dumps and exchange command mode DDR calibration data between
> +	  host and device. This driver is not tied to a specific SoC and may be
> +	  used by multiple MHI based devices.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called mhi_sahara.
> diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
> --- /dev/null
> +++ b/drivers/bus/mhi/sahara/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
> +mhi_sahara-y := sahara.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/bus/mhi/sahara/sahara.c
> index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -1,6 +1,8 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -
> -/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.

Why are you changing the copyright?

> + *
> + */
>  
>  #include <linux/devcoredump.h>
>  #include <linux/firmware.h>
> @@ -9,12 +11,11 @@
>  #include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/overflow.h>
> +#include <linux/sahara.h>
>  #include <linux/types.h>
>  #include <linux/vmalloc.h>
>  #include <linux/workqueue.h>
>  
> -#include "sahara.h"
> -
>  #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>  #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>  #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
> @@ -928,8 +929,13 @@ int sahara_register(void)
>  {
>  	return mhi_driver_register(&sahara_mhi_driver);
>  }
> +module_init(sahara_register);
>  
>  void sahara_unregister(void)
>  {
>  	mhi_driver_unregister(&sahara_mhi_driver);
>  }
> +module_exit(sahara_unregister);

Use module_mhi_driver().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

