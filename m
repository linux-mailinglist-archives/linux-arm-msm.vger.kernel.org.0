Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5741D88A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 21:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgERT6h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 15:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgERT6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 15:58:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF9EC05BD0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 12:58:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x13so5440678pfn.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 12:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VsCVE7U3GIcVUiZlJdZhJr6XBuJkji4837XQDpLrp4g=;
        b=fm3WT9EYWXVsFNkSNqzxOKy4AePjJrQvAJuHIwZP16FEw/gGlVjA5vTMJVlzuV6xRm
         Bbrc+Rawfq26Q0qCnOhj0DqFRl4BgZwzbDT+JQUUiHHpLx+UOku0as080QCvSnUK6TZU
         O1g/hVUedOWEDvbtWaqO94o0qr35SYiKDFaXf/VTFgl1S0pvC8b/jLu/lFTlQNMX4c5P
         jC+0RRxoHOn5kzItrYPaXgpWaZ/58xfybhu/oKoNKrT6f5TsR3pkQ5wG+mJFD+Zbk3/R
         1xe3W3OaQTOHZM3XRYZ/ZArEdJwgw9xt6O391kZUkCrYMM6w5NhC/czEAF4NYbblKUOA
         NrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VsCVE7U3GIcVUiZlJdZhJr6XBuJkji4837XQDpLrp4g=;
        b=AGRtXYilzgI7uv4X9PKGRZnBvysUZ1K2ske8+sRX4ziwLBmp//SGYnb4GWMtZB/Qgg
         MGRMavdC4elUEzGENjhpMRjbuB92Hk8RdgzuFVjZl7aE62wpMEfoJ8F2Mj18Hwh2lU11
         /ZZzyL/984gi0lNwt1lEPMq/dUD3e34vkcPsvPhLV16GtApgVbkMDHMiU5LyGKzd+2sM
         c1YqwbHzTUb9jO6mzIb2uxfOzB7LKK0EbXm9mr/dJyROj6SVEpcJ78UMfaTBOTSNI0Ch
         +dDeHtmKHtZq94x2kYfZSaL1NJh+H4aLH7Qz1viBREhgH8HbdekKEnlQ0uWI46LfuRK4
         /iuw==
X-Gm-Message-State: AOAM532uHmwQ4+fgvtPYfkPj1Qb9K6G2BA1Sba4x8DXjNPd0VNDWd9Xk
        PRRwP/UER1uLMtbRQnACUyBbzGmWBZA=
X-Google-Smtp-Source: ABdhPJzUdiDGCZc/vfqNifUiZsF2+6w65MwzCoWhveN5PE81a3mn/TaJ0eSAQEqdbuihNsg4ywxIoA==
X-Received: by 2002:a63:2a93:: with SMTP id q141mr16044815pgq.129.1589831914283;
        Mon, 18 May 2020 12:58:34 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f6sm9855396pfn.189.2020.05.18.12.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 12:58:33 -0700 (PDT)
Date:   Mon, 18 May 2020 12:57:11 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1 2/3] mmc: sdhci-msm: Use internal voltage control
Message-ID: <20200518195711.GH2165@builder.lan>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1589541535-8523-3-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589541535-8523-3-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 15 May 04:18 PDT 2020, Veerabhadrarao Badiganti wrote:

> From: Vijay Viswanath <vviswana@codeaurora.org>
> 
> On qcom SD host controllers voltage switching be done after the HW
> is ready for it. The HW informs its readiness through power irq.
> The voltage switching should happen only then.
> 
> Use the internal voltage switching and then control the voltage
> switching using power irq.
> 
> Set the regulator load as well so that regulator can be configured
> in LPM mode when in is not being used.
> 
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Please note that per Documentation/process/submitting-patches.rst
section 11) this states:

1) You wrote the patch (From:) without stating that its Certificate of
origin.

2) Then Asutosh took your patch (in full or part) and guarantees that
he's allowed to contribute it to the project.

3) Then you took his patch (in full or part) and guarantee that you're
allowed to contribute it to the project.

4) Then Veerabhadrarao took your patch (in full or part) and guarantees
that he's allowed to contribute it to the project

5) Then somehow it came out of your inbox - even if Veerabhadrarao was
the one who handled it last.


As author you should be the first one to certify, and as poster to LKML
you should be the last one.

If you worked together on this, then list Asutosh and Veerabhadrarao as
Co-developed-by.

> ---
>  drivers/mmc/host/sdhci-msm.c | 215 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 207 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 97758fa..a10e955 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -36,7 +36,9 @@
>  #define CORE_PWRCTL_IO_LOW	BIT(2)
>  #define CORE_PWRCTL_IO_HIGH	BIT(3)
>  #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
> +#define CORE_PWRCTL_BUS_FAIL    BIT(1)
>  #define CORE_PWRCTL_IO_SUCCESS	BIT(2)
> +#define CORE_PWRCTL_IO_FAIL     BIT(3)
>  #define REQ_BUS_OFF		BIT(0)
>  #define REQ_BUS_ON		BIT(1)
>  #define REQ_IO_LOW		BIT(2)
> @@ -263,6 +265,9 @@ struct sdhci_msm_host {
>  	bool use_cdr;
>  	u32 transfer_mode;
>  	bool updated_ddr_cfg;
> +	u32 vmmc_load;
> +	u32 vqmmc_load;
> +	bool vqmmc_enabled;
>  };
>  
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -1298,6 +1303,78 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>  		sdhci_msm_hs400(host, &mmc->ios);
>  }
>  
> +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> +			      struct mmc_host *mmc, int level)
> +{
> +	int load, ret;
> +
> +	if (IS_ERR(mmc->supply.vmmc))
> +		return 0;
> +
> +	if (msm_host->vmmc_load) {
> +		load = level ? msm_host->vmmc_load : 0;
> +		ret = regulator_set_load(mmc->supply.vmmc, load);

I started on the comment about regulator_set_load() that you can find
below...

> +		if (ret)
> +			goto out;
> +	}
> +
> +	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);

...but I don't see that mmc->ios.vdd necessarily is in sync with
"level". Or do you here simply set the load based on what the hardware
tell you and then orthogonally to that let the core enable/disable the
regulator?

Perhaps I'm just missing something obvious, but if not I believe this
warrants a comment describing that you're lowering the power level
regardless of the actual power being disabled.

> +out:
> +	if (ret)
> +		pr_err("%s: vmmc set load/ocr failed: %d\n",
> +				mmc_hostname(mmc), ret);

Please use:
	dev_err(mmc_dev(mmc), ...);

> +
> +	return ret;
> +}
> +
> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
> +			      struct mmc_host *mmc, int level)

vqmmc_enabled is a bool and "level" sounds like an int with several
possible values. So please make level bool here as well, to make it
easer to read..

> +{
> +	int load, ret;
> +	struct mmc_ios ios;
> +
> +	if (IS_ERR(mmc->supply.vqmmc)			 ||
> +	    (mmc->ios.power_mode == MMC_POWER_UNDEFINED) ||
> +	    (msm_host->vqmmc_enabled == level))
> +		return 0;
> +
> +	if (msm_host->vqmmc_load) {
> +		load = level ? msm_host->vqmmc_load : 0;
> +		ret = regulator_set_load(mmc->supply.vqmmc, load);

Since v5.0 the "load" of a regulator consumer is only taken into
consideration if the consumer is enabled. So given that you're toggling
the regulator below there's no need to change this here.

Just specify the "active load" at probe time.

> +		if (ret)
> +			goto out;
> +	}
> +
> +	/*
> +	 * The IO voltage regulator may not always support a voltage close to
> +	 * vdd. Set IO voltage based on capability of the regulator.
> +	 */

Is this comment related to the if/else-if inside the conditional? If so
please move it one line down.

> +	if (level) {
> +		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
> +		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;

Please add a space here, to indicate that the if statement on the next
line is unrelated to the if/elseif above.

> +		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
> +			pr_debug("%s: %s: setting signal voltage: %d\n",
> +					mmc_hostname(mmc), __func__,
> +					ios.signal_voltage);

I strongly believe you should replace these debug prints with
tracepoints, throughout the driver.

> +			ret = mmc_regulator_set_vqmmc(mmc, &ios);
> +			if (ret < 0)
> +				goto out;

> +		}
> +		ret = regulator_enable(mmc->supply.vqmmc);
> +	} else {
> +		ret = regulator_disable(mmc->supply.vqmmc);
> +	}

Given that you don't need to regulator_set_load() this function is now
just one large if/else condition on a constant passed as an argument.
Please split it into sdhci_msm_enable_vqmmc() and
sdhci_msm_disable_vqmmc().

> +out:
> +	if (ret)
> +		pr_err("%s: vqmmc failed: %d\n", mmc_hostname(mmc), ret);

I think it would be useful to know if this error came from
mmc_regulator_set_vqmmc() or regulator_enable() - or
regulator_disable().

So please move this up and add some context in the error message, and
please use dev_err().

> +	else
> +		msm_host->vqmmc_enabled = level;
> +
> +	return ret;
> +}
> +
>  static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
>  {
>  	init_waitqueue_head(&msm_host->pwr_irq_wait);
> @@ -1401,8 +1478,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct mmc_host *mmc = host->mmc;
>  	u32 irq_status, irq_ack = 0;
> -	int retry = 10;
> +	int retry = 10, ret = 0;

There's no need to initialize ret, in all occasions it's assigned before
being read.

>  	u32 pwr_state = 0, io_level = 0;
>  	u32 config;
>  	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> @@ -1438,14 +1516,35 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  
>  	/* Handle BUS ON/OFF*/
>  	if (irq_status & CORE_PWRCTL_BUS_ON) {
> -		pwr_state = REQ_BUS_ON;
> -		io_level = REQ_IO_HIGH;
> -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 1);
> +		if (!ret)
> +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 1);

I find this quite complex to follow. Wouldn't it be cleaner to retain
the 4 checks on irq_status as they are and then before the writel of
irq_ack check pwr_state and io_level and call sdhci_msm_set_{vmmc,vqmmc}
accordingly?

> +
> +		if (!ret) {
> +			pwr_state = REQ_BUS_ON;
> +			io_level = REQ_IO_HIGH;
> +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> +		} else {
> +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
> +					mmc_hostname(mmc), ret, irq_status);

You already printed that this failed in sdhci_msm_set_{vmmc,vqmmc}, no
need to print again.

> +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
> +			sdhci_msm_set_vmmc(msm_host, mmc, 0);
> +		}
>  	}
>  	if (irq_status & CORE_PWRCTL_BUS_OFF) {
> -		pwr_state = REQ_BUS_OFF;
> -		io_level = REQ_IO_LOW;
> -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 0);
> +		if (!ret)
> +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 0);
> +
> +		if (!ret) {
> +			pwr_state = REQ_BUS_OFF;
> +			io_level = REQ_IO_LOW;
> +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> +		} else {
> +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
> +					mmc_hostname(mmc), ret, irq_status);
> +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
> +		}
>  	}
>  	/* Handle IO LOW/HIGH */
>  	if (irq_status & CORE_PWRCTL_IO_LOW) {
> @@ -1457,6 +1556,15 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
>  	}
>  
> +	if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
> +		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);

Didn't you already call this through sdhci_msm_set_vqmmc()?

> +		if (ret < 0)
> +			pr_err("%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
> +					mmc_hostname(mmc), ret,
> +					mmc->ios.signal_voltage, mmc->ios.vdd,
> +					irq_status);
> +	}
> +
>  	/*
>  	 * The driver has to acknowledge the interrupt, switch voltages and
>  	 * report back if it succeded or not to this register. The voltage
> @@ -1833,6 +1941,91 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>  	sdhci_reset(host, mask);
>  }
>  
> +static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
> +{
> +	int ret = 0;

No need to initialize ret, first use is an assignment.

> +	struct mmc_host *mmc = msm_host->mmc;
> +
> +	ret = mmc_regulator_get_supply(msm_host->mmc);
> +	if (ret)
> +		return ret;
> +	device_property_read_u32(&msm_host->pdev->dev,
> +			"vmmc-max-load-microamp",
> +			&msm_host->vmmc_load);
> +	device_property_read_u32(&msm_host->pdev->dev,
> +			"vqmmc-max-load-microamp",
> +			&msm_host->vqmmc_load);

These properties are not documented. Do they vary enough to mandate
being read from DT or could they simply be approximated by a define
instead?

> +
> +	sdhci_msm_set_regulator_caps(msm_host);
> +	mmc->ios.power_mode = MMC_POWER_UNDEFINED;
> +
> +	return 0;
> +
> +}
> +
> +static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
> +				      struct mmc_ios *ios)
> +{
> +	struct sdhci_host *host = mmc_priv(mmc);
> +	u16 ctrl;
> +
> +	/*
> +	 * Signal Voltage Switching is only applicable for Host Controllers
> +	 * v3.00 and above.
> +	 */
> +	if (host->version < SDHCI_SPEC_300)
> +		return 0;
> +
> +	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +
> +	switch (ios->signal_voltage) {
> +	case MMC_SIGNAL_VOLTAGE_330:
> +		if (!(host->flags & SDHCI_SIGNALING_330))
> +			return -EINVAL;
> +		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
> +		ctrl &= ~SDHCI_CTRL_VDD_180;
> +		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
> +
> +		/* 3.3V regulator output should be stable within 5 ms */

What mechanism ensures that the readw won't return withing 5ms from the
writew above?

> +		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +		if (!(ctrl & SDHCI_CTRL_VDD_180))
> +			return 0;
> +
> +		pr_warn("%s: 3.3V regulator output did not became stable\n",
> +			mmc_hostname(mmc));
> +
> +		return -EAGAIN;

The body of the 330 and 180 cases are quite similar, can you perhaps
deal with those after the switch, once?

> +	case MMC_SIGNAL_VOLTAGE_180:
> +		if (!(host->flags & SDHCI_SIGNALING_180))
> +			return -EINVAL;
> +
> +		/*
> +		 * Enable 1.8V Signal Enable in the Host Control2
> +		 * register
> +		 */
> +		ctrl |= SDHCI_CTRL_VDD_180;
> +		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
> +
> +		/* 1.8V regulator output should be stable within 5 ms */
> +		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +		if (ctrl & SDHCI_CTRL_VDD_180)
> +			return 0;
> +
> +		pr_warn("%s: 1.8V regulator output did not became stable\n",
> +			mmc_hostname(mmc));
> +
> +		return -EAGAIN;
> +	case MMC_SIGNAL_VOLTAGE_120:
> +		if (!(host->flags & SDHCI_SIGNALING_120))
> +			return -EINVAL;
> +		return 0;
> +	default:
> +		/* No signal voltage switch required */
> +		return 0;
> +	}
> +

Empty line.

Regards,
Bjorn

> +}
> +
>  static const struct sdhci_msm_variant_ops mci_var_ops = {
>  	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>  	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
> @@ -1880,6 +2073,7 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>  	.write_w = sdhci_msm_writew,
>  	.write_b = sdhci_msm_writeb,
>  	.irq	= sdhci_msm_cqe_irq,
> +	.set_power = sdhci_set_power_noreg,
>  };
>  
>  static const struct sdhci_pltfm_data sdhci_msm_pdata = {
> @@ -2072,6 +2266,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	if (core_major == 1 && core_minor >= 0x49)
>  		msm_host->updated_ddr_cfg = true;
>  
> +	ret = sdhci_msm_register_vreg(msm_host);
> +	if (ret)
> +		goto clk_disable;
> +
>  	/*
>  	 * Power on reset state may trigger power irq if previous status of
>  	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
> @@ -2116,6 +2314,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  					 MSM_MMC_AUTOSUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(&pdev->dev);
>  
> +	host->mmc_host_ops.start_signal_voltage_switch =
> +		sdhci_msm_start_signal_voltage_switch;
>  	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
>  	if (of_property_read_bool(node, "supports-cqe"))
>  		ret = sdhci_msm_cqe_add_host(host, pdev);
> @@ -2123,7 +2323,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  		ret = sdhci_add_host(host);
>  	if (ret)
>  		goto pm_runtime_disable;
> -	sdhci_msm_set_regulator_caps(msm_host);
>  
>  	pm_runtime_mark_last_busy(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
> 
