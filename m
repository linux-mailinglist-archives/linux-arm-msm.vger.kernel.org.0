Return-Path: <linux-arm-msm+bounces-70776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F39B34ECC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 00:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89D6F167293
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 22:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4439629BD9C;
	Mon, 25 Aug 2025 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxnnTVSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4922820DB
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756159929; cv=none; b=MqyPH1YxdUl4Ge1rQ4G7JAKe0v7hz//X4xlUMl8C0l9UGLVxIcIr0JAb0EuA/UJ7hfunH33FY9WpC12qFNJ/u4gdR2jbOqh7f90GpqqxKy3w/KFOAs4GQs2X8CIF3OqqZoWlxdsQYzRQBkmH8uxp31cP+Qanwjw9gnO4RtICAn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756159929; c=relaxed/simple;
	bh=7WG3Yd04KG8k/CItCoZH6NEBq1q9hulD9LCXjOyQNhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQbk6bE7kTyv5a3BQXvDu4HvJ7Nu1nhNE3ZV7vrF9dcYJMLN42gsZZFLxecWhSTaKfRcBGreFywenqsJBoFYhZpj/gHAyF98maLMPC/RP67n9Bl5g2itV+P3rhHAU/daB3KoEFjtSFi12zgPkXfAXMsEUQWhI9wVUZdQHGbbvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxnnTVSZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260D3C4CEED;
	Mon, 25 Aug 2025 22:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756159928;
	bh=7WG3Yd04KG8k/CItCoZH6NEBq1q9hulD9LCXjOyQNhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxnnTVSZ1Use1CjeuRtx5C4HdbOP4K9P3jQlrXwBBuFFINYNBAMvNB8MwlwwVZbla
	 JVy0+pgYA0z+B7GOgToPh6yHj5ZiBtIO6IylvJboRXjti6dsQ/bITZN5dGFb9FPZSq
	 Cw5VekmztUR2Rj11OmOdu/nNN6yeMbt6w7PXaZsA5rLnzrnjJcm01rpkz58o2GS0fa
	 PT+bCcqCauR2vW9tTsQPUhUwploFfTcZlOwepqnt6R1bqLyJoG8qPynry+ojL8astz
	 MgqCQdP3i0Lkafsh/TWEKLNQFfzUUrVbNx+HWZr6KLO8zFVm7HSuYK1VHukQVo3ZAR
	 ZZt/pM1g3FZ/g==
Date: Mon, 25 Aug 2025 17:12:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kishore Batta <kishore.batta@oss.qualcomm.com>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com, 
	konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 05/12] drivers: soc: qcom: Move Sahara driver to
 drivers/soc/qcom directory.
Message-ID: <6n4e6luxfu2f7taijdcdhjscfkyh47bbql6cpnx6p2wmmwmm6q@gyp7jhzhuu2v>
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-6-kishore.batta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825101926.2160554-6-kishore.batta@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 03:49:19PM +0530, Kishore Batta wrote:
> Move the Sahara protocol driver from the "drivers/accel" directory
> to the "drivers/soc/qcom" directory. This change makes the Sahara
> driver applicable to all Qualcomm devices, not just Qualcomm Accelerator
> devices. It also facilitates adding support for new devices. Client drivers
> can use the registration and deregistration functionalities of the Sahara
> driver as needed.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/Kconfig                      |  1 +
>  drivers/accel/qaic/Makefile                     |  4 +---
>  drivers/accel/qaic/mhi_controller.c             |  2 +-
>  drivers/accel/qaic/qaic_drv.c                   |  9 +--------
>  drivers/soc/qcom/Kconfig                        |  6 ++++--
>  drivers/soc/qcom/Makefile                       |  1 +
>  drivers/soc/qcom/sahara/Kconfig                 | 17 +++++++++++++++++

No other drivers under drivers/soc/qcom/ has their own directory, I'm
not sure I see a reason for Sahara to be different.

>  drivers/soc/qcom/sahara/Makefile                |  6 ++++++
>  .../{accel/qaic => soc/qcom/sahara}/sahara.c    | 11 ++++++++---
>  .../qcom/sahara}/sahara_image_table.c           |  7 ++++++-
>  {drivers/accel/qaic => include/linux}/sahara.h  |  0
>  .../linux}/sahara_image_table_ops.h             |  0
>  12 files changed, 46 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/soc/qcom/sahara/Kconfig
>  create mode 100644 drivers/soc/qcom/sahara/Makefile
>  rename drivers/{accel/qaic => soc/qcom/sahara}/sahara.c (99%)
>  rename drivers/{accel/qaic => soc/qcom/sahara}/sahara_image_table.c (94%)
>  rename {drivers/accel/qaic => include/linux}/sahara.h (100%)
>  rename {drivers/accel/qaic => include/linux}/sahara_image_table_ops.h (100%)

I was going to say something about other soc drivers living in
include/linux/soc/qcom/...

But that does touch upon another topic...drivers/soc/qcom is for
Qualcomm SoC drivers; and at least in the case of qaic, this driver
doesn't have anything to do with Qualcomm SoCs...


Given that this implementation only support, and is only ever going to
be used with, MHI. Perhaps drivers/bus/mhi would be a better home?

> 
> diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
> index 5e405a19c157..5e2ac1ecede3 100644
> --- a/drivers/accel/qaic/Kconfig
> +++ b/drivers/accel/qaic/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
>  	depends on DRM_ACCEL
>  	depends on PCI && HAS_IOMEM
>  	depends on MHI_BUS
> +	select QCOM_SAHARA_PROTOCOL
>  	select CRC32
>  	help
>  	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
> diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
> index 586a6877e568..4ad84f7e2162 100644
> --- a/drivers/accel/qaic/Makefile
> +++ b/drivers/accel/qaic/Makefile
> @@ -11,8 +11,6 @@ qaic-y := \
>  	qaic_data.o \
>  	qaic_drv.o \
>  	qaic_ras.o \
> -	qaic_timesync.o \
> -	sahara.o \
> -	sahara_image_table.o
> +	qaic_timesync.o
>  
>  qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 16c346e0e3b5..76beef6018a7 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -9,11 +9,11 @@
>  #include <linux/mhi.h>
>  #include <linux/moduleparam.h>
>  #include <linux/pci.h>
> +#include <linux/sahara_image_table_ops.h>
>  #include <linux/sizes.h>
>  
>  #include "mhi_controller.h"
>  #include "qaic.h"
> -#include "sahara_image_table_ops.h"
>  
>  #define MAX_RESET_TIME_SEC 25
>  
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 5c4fab328003..a55e279411c3 100644
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
> @@ -31,7 +32,6 @@
>  #include "qaic_debugfs.h"
>  #include "qaic_ras.h"
>  #include "qaic_timesync.h"
> -#include "sahara.h"
>  
>  MODULE_IMPORT_NS("DMA_BUF");
>  
> @@ -682,12 +682,6 @@ static int __init qaic_init(void)
>  		goto free_pci;
>  	}
>  
> -	ret = sahara_register();
> -	if (ret) {
> -		pr_debug("qaic: sahara_register failed %d\n", ret);
> -		goto free_mhi;
> -	}
> -
>  	ret = qaic_sahara_register_image_tables();
>  	if (ret) {
>  		pr_debug("qaic: Image table registration failed %d\n", ret);
> @@ -737,7 +731,6 @@ static void __exit qaic_exit(void)
>  	qaic_ras_unregister();
>  	qaic_bootlog_unregister();
>  	qaic_timesync_deinit();
> -	sahara_unregister();
>  	mhi_driver_unregister(&qaic_mhi_driver);
>  	pci_unregister_driver(&qaic_pci_driver);
>  }
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf830..7ea4cff9a679 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -295,8 +295,6 @@ config QCOM_PBS
>  	  This module provides the APIs to the client drivers that wants to send the
>  	  PBS trigger event to the PBS RAM.
>  
> -endmenu
> -
>  config QCOM_UBWC_CONFIG
>  	tristate
>  	help
> @@ -304,3 +302,7 @@ config QCOM_UBWC_CONFIG
>  	  (UBWC) engines across various IP blocks, which need to be initialized
>  	  with coherent configuration data. This module functions as a single
>  	  source of truth for that information.
> +
> +source "drivers/soc/qcom/sahara/Kconfig"
> +
> +endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index b7f1d2a57367..99e490e3174e 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -40,3 +40,4 @@ qcom_ice-objs			+= ice.o
>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>  obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>  obj-$(CONFIG_QCOM_UBWC_CONFIG) += ubwc_config.o
> +obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) += sahara/
> diff --git a/drivers/soc/qcom/sahara/Kconfig b/drivers/soc/qcom/sahara/Kconfig
> new file mode 100644
> index 000000000000..4be90959736e
> --- /dev/null
> +++ b/drivers/soc/qcom/sahara/Kconfig
> @@ -0,0 +1,17 @@
> +config QCOM_SAHARA_PROTOCOL
> +	tristate "Qualcomm Sahara protocol"

It's bad practice to mix "select" and human selectable options. Drop the
"Qualcomm Sahara Protocol" and rely on the select to enable the driver.

> +	depends on MHI_BUS
> +	select FW_LOADER_COMPRESS
> +	select FW_LOADER_COMPRESS_XZ
> +	select FW_LOADER_COMPRESS_ZSTD
> +	help
> +	  The sahara protocol is primarily designed for transferring software
> +	  images from a host device to a target device using a simplified data
> +	  transfer mechanism over any physical link. However, the sahara
> +	  protocol does not support any authentication/validation of data sent
> +	  between devices. Such mechanism is beyond the scope of protocol.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called qcom_sahara.
> diff --git a/drivers/soc/qcom/sahara/Makefile b/drivers/soc/qcom/sahara/Makefile
> new file mode 100644
> index 000000000000..ad3922b30a31
> --- /dev/null
> +++ b/drivers/soc/qcom/sahara/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_QCOM_SAHARA_PROTOCOL) := qcom_sahara.o
> +
> +qcom_sahara-y := sahara.o \
> +		sahara_image_table.o
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/soc/qcom/sahara/sahara.c
> similarity index 99%
> rename from drivers/accel/qaic/sahara.c
> rename to drivers/soc/qcom/sahara/sahara.c
> index 7eae329396be..5e17d71a2d34 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/soc/qcom/sahara/sahara.c
> @@ -9,13 +9,12 @@

Make sure the style of the copyright comment matches the subsystem where
you move this driver to.

>  #include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/overflow.h>
> +#include <linux/sahara.h>
> +#include <linux/sahara_image_table_ops.h>
>  #include <linux/types.h>
>  #include <linux/vmalloc.h>
>  #include <linux/workqueue.h>
>  
> -#include "sahara.h"
> -#include "sahara_image_table_ops.h"
> -
>  #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
>  #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
>  #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
> @@ -814,8 +813,14 @@ int sahara_register(void)
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
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Qualcomm Innovation Center, Inc");

Skip MODULE_AUTHOR, or correct it.

> +MODULE_DESCRIPTION("Sahara driver");

There's already another driver by the name "sahara", so be more
specific.

Regards,
Bjorn

> diff --git a/drivers/accel/qaic/sahara_image_table.c b/drivers/soc/qcom/sahara/sahara_image_table.c
> similarity index 94%
> rename from drivers/accel/qaic/sahara_image_table.c
> rename to drivers/soc/qcom/sahara/sahara_image_table.c
> index dd0793a33727..18f9b7a59f25 100644
> --- a/drivers/accel/qaic/sahara_image_table.c
> +++ b/drivers/soc/qcom/sahara/sahara_image_table.c
> @@ -5,8 +5,8 @@
>  #include <linux/device.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/sahara_image_table_ops.h>
>  
> -#include "sahara_image_table_ops.h"
>  
>  struct sahara_image_table_context {
>  	struct list_head provider_list;
> @@ -49,6 +49,7 @@ int sahara_register_image_table_provider(struct sahara_image_table_provider
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(sahara_register_image_table_provider);
>  
>  /**
>   * sahara_get_image_table - Get the image table for a given device name
> @@ -78,6 +79,7 @@ const char * const *sahara_get_image_table(const char *dev_name)
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(sahara_get_image_table);
>  
>  /**
>   * sahara_get_image_table_size - Get the size of the image table for a given
> @@ -109,6 +111,7 @@ size_t sahara_get_image_table_size(const char *dev_name)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(sahara_get_image_table_size);
>  
>  /**
>   * sahara_unregister_image_table_provider - Unregister an image table provider.
> @@ -139,6 +142,7 @@ int sahara_unregister_image_table_provider(struct sahara_image_table_provider
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(sahara_unregister_image_table_provider);
>  
>  /**
>   * sahara_get_fw_folder_name - Retrieve the firmware folder name for a given
> @@ -171,3 +175,4 @@ char *sahara_get_fw_folder_name(const char *dev_name)
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(sahara_get_fw_folder_name);
> diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
> similarity index 100%
> rename from drivers/accel/qaic/sahara.h
> rename to include/linux/sahara.h
> diff --git a/drivers/accel/qaic/sahara_image_table_ops.h b/include/linux/sahara_image_table_ops.h
> similarity index 100%
> rename from drivers/accel/qaic/sahara_image_table_ops.h
> rename to include/linux/sahara_image_table_ops.h
> -- 
> 2.34.1
> 

