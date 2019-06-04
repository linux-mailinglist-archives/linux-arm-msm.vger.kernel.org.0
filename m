Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F633340BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2019 09:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfFDHxl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 03:53:41 -0400
Received: from ns.iliad.fr ([212.27.33.1]:37150 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726792AbfFDHxl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 03:53:41 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 5C19E20109;
        Tue,  4 Jun 2019 09:53:39 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 4428620C53;
        Tue,  4 Jun 2019 09:53:39 +0200 (CEST)
Subject: Re: [PATCH 2/3] scsi: ufs: Allow resetting the UFS device
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20190604072001.9288-1-bjorn.andersson@linaro.org>
 <20190604072001.9288-3-bjorn.andersson@linaro.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        SCSI <linux-scsi@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <53775224-5418-1235-20a2-c46d76ef56da@free.fr>
Date:   Tue, 4 Jun 2019 09:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190604072001.9288-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Jun  4 09:53:39 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ Shuffling the recipients list ]

On 04/06/2019 09:20, Bjorn Andersson wrote:

> Acquire the device-reset GPIO and toggle this to reset the UFS device
> during initialization and host reset.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/scsi/ufs/ufshcd.c | 44 +++++++++++++++++++++++++++++++++++++++
>  drivers/scsi/ufs/ufshcd.h |  4 ++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 8c1c551f2b42..951a0efee536 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -42,6 +42,7 @@
>  #include <linux/nls.h>
>  #include <linux/of.h>
>  #include <linux/bitfield.h>
> +#include <linux/gpio/consumer.h>
>  #include "ufshcd.h"
>  #include "ufs_quirks.h"
>  #include "unipro.h"
> @@ -6104,6 +6105,25 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>  	return err;
>  }
>  
> +/**
> + ufshcd_device_reset() - toggle the (optional) device reset line
> + * @hba: per-adapter instance
> + *
> + * Toggles the (optional) reset line to reset the attached device.
> + */
> +static void ufshcd_device_reset(struct ufs_hba *hba)
> +{
> +	/*
> +	 * The USB device shall detect reset pulses of 1us, sleep for 10us to
> +	 * be on the safe side.
> +	 */
> +	gpiod_set_value_cansleep(hba->device_reset, 1);
> +	usleep_range(10, 15);
> +
> +	gpiod_set_value_cansleep(hba->device_reset, 0);
> +	usleep_range(10, 15);
> +}
> +
>  /**
>   * ufshcd_host_reset_and_restore - reset and restore host controller
>   * @hba: per-adapter instance
> @@ -6159,6 +6179,9 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba)
>  	int retries = MAX_HOST_RESET_RETRIES;
>  
>  	do {
> +		/* Reset the attached device */
> +		ufshcd_device_reset(hba);
> +
>  		err = ufshcd_host_reset_and_restore(hba);
>  	} while (err && --retries);
>  
> @@ -7355,6 +7378,18 @@ static void ufshcd_variant_hba_exit(struct ufs_hba *hba)
>  	ufshcd_vops_exit(hba);
>  }
>  
> +static int ufshcd_init_device_reset(struct ufs_hba *hba)
> +{
> +	hba->device_reset = devm_gpiod_get_optional(hba->dev, "device-reset",
> +						    GPIOD_OUT_HIGH);
> +	if (IS_ERR(hba->device_reset)) {
> +		dev_err(hba->dev, "failed to acquire reset gpio: %ld\n",
> +			PTR_ERR(hba->device_reset));
> +	}
> +
> +	return PTR_ERR_OR_ZERO(hba->device_reset);
> +}
> +
>  static int ufshcd_hba_init(struct ufs_hba *hba)
>  {
>  	int err;
> @@ -7394,9 +7429,15 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
>  	if (err)
>  		goto out_disable_vreg;
>  
> +	err = ufshcd_init_device_reset(hba);
> +	if (err)
> +		goto out_disable_variant;
> +
>  	hba->is_powered = true;
>  	goto out;
>  
> +out_disable_variant:
> +	ufshcd_vops_setup_regulators(hba, false);
>  out_disable_vreg:
>  	ufshcd_setup_vreg(hba, false);
>  out_disable_clks:
> @@ -8290,6 +8331,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
>  		goto exit_gating;
>  	}
>  
> +	/* Reset the attached device */
> +	ufshcd_device_reset(hba);
> +
>  	/* Host controller enable */
>  	err = ufshcd_hba_enable(hba);
>  	if (err) {
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index ecfa898b9ccc..d8be67742168 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -72,6 +72,8 @@
>  #define UFSHCD "ufshcd"
>  #define UFSHCD_DRIVER_VERSION "0.2"
>  
> +struct gpio_desc;
> +
>  struct ufs_hba;
>  
>  enum dev_cmd_type {
> @@ -706,6 +708,8 @@ struct ufs_hba {
>  
>  	struct device		bsg_dev;
>  	struct request_queue	*bsg_queue;
> +
> +	struct gpio_desc *device_reset;
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> 

Why is this needed on 845 and not on 8998?

On 8998 we already have:

			resets = <&gcc GCC_UFS_BCR>;
			reset-names = "rst";

The above reset line gets wiggled/frobbed when appropriate.

(What's the difference between gpio and pinctrl? vs a reset "clock" as above)

ufshcd_device_reset_ctrl() vs ufshcd_init_device_reset()

Sounds like the nomenclature could be unified or clarified.

Regards.
