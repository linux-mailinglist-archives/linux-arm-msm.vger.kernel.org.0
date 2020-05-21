Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2AF1DD5E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 20:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbgEUSWt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 14:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728949AbgEUSWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 14:22:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15010C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 11:22:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id a13so3174440pls.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5k4jr7oQbGC/waSmHCtV4glDgCwPs1EjTz2h56TFslo=;
        b=mbODuniVM/EKfE1h310kd29H9xa4SPKxMHkXOoQeT77ocfLApBA8kz9XT63C4dLlu6
         5gOpPgLTD4Ip7PFFp3A7mcBckVWD49p1bj4G0ZIbD+uskkVdl/4NUfHYYrXSrb2Z6C04
         Jb/QMEDYIyJvl8KiqVosPiRMvwfC6iqVNRlJFiQY86Sbgn/3mrVkGHrfPamTId3VC6Uj
         6ovTaBEFPEfhoRyklMMk+MgeAcRgLaRe8N56OJvCI4kCzE6zlheshrMLBGYijypSGp0v
         MSGFyGKypkys7TWFRMcUivt8+Eowg+OXr+6/DxO0PB8/Z2j+cn002uwSdosXmDOsBBbt
         muHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5k4jr7oQbGC/waSmHCtV4glDgCwPs1EjTz2h56TFslo=;
        b=jD+Mf++rZ+cN5OG0XIh+4P3NIe/N1LLzyjsEpNWxutjY+SaybiIzXTtlfa+vPDPskj
         hFTcoLco5sq+fhJdsx0b8DWlg0y9sFfZR2rrBpxqcNGYEh245JENNu3Bph3ceq439UHC
         wcagnmtcKdQPDx5cuSrUUJQoCzMtuopKgv3QPdbjvVaf0j6L+wpPWVCMR30bE1OxHFTh
         M/3YhL3JD09GwaGAUVmKBQd7SZrmhl0ui1Bi4zJ5ibaNJ6cG9ahyyaFLfvK3r6ioyAg7
         SMFzo3iJqiX1aKkeV/NCECeiQWOSk397tckQvbtPajQxto+h6kbmhPnEtP+gj619kH2U
         bJSw==
X-Gm-Message-State: AOAM530OpLVaGxwHjO0u4kpIsHouFqF+bksmpwH/EJfHW5L5EMreRlkw
        L3miCgMqf5nzgPgAjfJmj21Di+FFRPk=
X-Google-Smtp-Source: ABdhPJwB3fc3nwNk9pGyuNDG8OM1ndTxyj8Am/bJavff2gPpLkdE9FNQse3rbpm9jyocGmzsBJJ/hw==
X-Received: by 2002:a17:902:a511:: with SMTP id s17mr10810265plq.33.1590085368092;
        Thu, 21 May 2020 11:22:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x6sm5309166pfn.90.2020.05.21.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 11:22:47 -0700 (PDT)
Date:   Thu, 21 May 2020 11:21:29 -0700
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
Message-ID: <20200521182129.GB1331782@builder.lan>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1589541535-8523-3-git-send-email-vbadigan@codeaurora.org>
 <20200518195711.GH2165@builder.lan>
 <1f546a8b-7f10-95e7-efc2-8e3d5787aee6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f546a8b-7f10-95e7-efc2-8e3d5787aee6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 May 04:16 PDT 2020, Veerabhadrarao Badiganti wrote:

> 
> Thanks Bjorn for the review. For major comments I'm responding.
> Other comments, i will take care of them in my next patch-set.
> 
> On 5/19/2020 1:27 AM, Bjorn Andersson wrote:
> > On Fri 15 May 04:18 PDT 2020, Veerabhadrarao Badiganti wrote:
[..]
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
[..]
> > > +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
> > > +			      struct mmc_host *mmc, int level)
> > > +{
> > > +	int load, ret;
> > > +
> > > +	if (IS_ERR(mmc->supply.vmmc))
> > > +		return 0;
> > > +
> > > +	if (msm_host->vmmc_load) {
> > > +		load = level ? msm_host->vmmc_load : 0;
> > > +		ret = regulator_set_load(mmc->supply.vmmc, load);
> > I started on the comment about regulator_set_load() that you can find
> > below...
> > 
> > > +		if (ret)
> > > +			goto out;
> > > +	}
> > > +
> > > +	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> > ...but I don't see that mmc->ios.vdd necessarily is in sync with
> > "level". Or do you here simply set the load based on what the hardware
> > tell you and then orthogonally to that let the core enable/disable the
> > regulator?
> > 
> > Perhaps I'm just missing something obvious, but if not I believe this
> > warrants a comment describing that you're lowering the power level
> > regardless of the actual power being disabled.
> 
> ios.vdd will be in sync with level. Vdd will be either 0 or a valid voltage
> (3v).
> 
> This indirectly gets triggered/invoked through power-irq when driver writes
> 0
> or valid voltage to SDHCI_POWER_CONTROL register from
> sdhci_set_power_noreg().

Ok, thanks for explaining.

> > > +out:
> > > +	if (ret)
> > > +		pr_err("%s: vmmc set load/ocr failed: %d\n",
> > > +				mmc_hostname(mmc), ret);
> > Please use:
> > 	dev_err(mmc_dev(mmc), ...);
> > 
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
> > > +			      struct mmc_host *mmc, int level)
> > vqmmc_enabled is a bool and "level" sounds like an int with several
> > possible values. So please make level bool here as well, to make it
> > easer to read..
> > 
> > > +{
> > > +	int load, ret;
> > > +	struct mmc_ios ios;
> > > +
> > > +	if (IS_ERR(mmc->supply.vqmmc)			 ||
> > > +	    (mmc->ios.power_mode == MMC_POWER_UNDEFINED) ||
> > > +	    (msm_host->vqmmc_enabled == level))
> > > +		return 0;
> > > +
> > > +	if (msm_host->vqmmc_load) {
> > > +		load = level ? msm_host->vqmmc_load : 0;
> > > +		ret = regulator_set_load(mmc->supply.vqmmc, load);
> > Since v5.0 the "load" of a regulator consumer is only taken into
> > consideration if the consumer is enabled. So given that you're toggling
> > the regulator below there's no need to change this here.
> > 
> > Just specify the "active load" at probe time.
> 
> For eMMC case, we don't disable this Vccq2 regulator by having always-on
> flag
> in the regulator node. Only for SDcard Vccq2 will be disabled.
> Sice driver is common for both eMMC and SDcard, I have to set 0 load to make
> it generic and to ensure eMMC Vccq2 regulator will be in LPM mode.
> 

You should still call regulator_enable()/regulator_disable() on your
consumer regulator in this driver. When you do this the regulator core
will conclude that the regulator_dev (i.e. the part that represents the
hardware) is marked always_on and will not enable/disable the regulator.

But it will still invoke _regulator_handle_consumer_enable() and
_regulator_handle_consumer_disable(), which will aggregate the "load" of
all client regulators and update the regulator's load.

So this will apply the load as you expect regardless of it being
supplied by a regulator marked as always_on.

> > 
> > > +		if (ret)
> > > +			goto out;
> > > +	}
> > > +
> > > +	/*
> > > +	 * The IO voltage regulator may not always support a voltage close to
> > > +	 * vdd. Set IO voltage based on capability of the regulator.
> > > +	 */
> > Is this comment related to the if/else-if inside the conditional? If so
> > please move it one line down.
> > 
> > > +	if (level) {
> > > +		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> > > +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
> > > +		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
> > > +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
> > Please add a space here, to indicate that the if statement on the next
> > line is unrelated to the if/elseif above.
> > 
> > > +		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
> > > +			pr_debug("%s: %s: setting signal voltage: %d\n",
> > > +					mmc_hostname(mmc), __func__,
> > > +					ios.signal_voltage);
> > I strongly believe you should replace these debug prints with
> > tracepoints, throughout the driver.
> > 
> > > +			ret = mmc_regulator_set_vqmmc(mmc, &ios);
> > > +			if (ret < 0)
> > > +				goto out;
> > > +		}
> > > +		ret = regulator_enable(mmc->supply.vqmmc);
> > > +	} else {
> > > +		ret = regulator_disable(mmc->supply.vqmmc);
> > > +	}
> > Given that you don't need to regulator_set_load() this function is now
> > just one large if/else condition on a constant passed as an argument.
> > Please split it into sdhci_msm_enable_vqmmc() and
> > sdhci_msm_disable_vqmmc().
> 
> 
> Same response as above
> For eMMC case, we don't disable this Vccq2 regulator by having always-on
> flag
> in the regulator node. Only for SDcard Vccq2 will be disabled.
> Sice driver is common for both eMMC and SDcard, I have to set 0 load to make
> it generic and to ensure eMMC Vccq2 regulator will be in LPM mode.
> 
> > > +out:
> > > +	if (ret)
> > > +		pr_err("%s: vqmmc failed: %d\n", mmc_hostname(mmc), ret);
> > I think it would be useful to know if this error came from
> > mmc_regulator_set_vqmmc() or regulator_enable() - or
> > regulator_disable().
> > 
> > So please move this up and add some context in the error message, and
> > please use dev_err().
> > 
> > > +	else
> > > +		msm_host->vqmmc_enabled = level;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
> > >   {
> > >   	init_waitqueue_head(&msm_host->pwr_irq_wait);
> > > @@ -1401,8 +1478,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
> > >   {
> > >   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +	struct mmc_host *mmc = host->mmc;
> > >   	u32 irq_status, irq_ack = 0;
> > > -	int retry = 10;
> > > +	int retry = 10, ret = 0;
> > There's no need to initialize ret, in all occasions it's assigned before
> > being read.
> > 
> > >   	u32 pwr_state = 0, io_level = 0;
> > >   	u32 config;
> > >   	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > @@ -1438,14 +1516,35 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
> > >   	/* Handle BUS ON/OFF*/
> > >   	if (irq_status & CORE_PWRCTL_BUS_ON) {
> > > -		pwr_state = REQ_BUS_ON;
> > > -		io_level = REQ_IO_HIGH;
> > > -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> > > +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 1);
> > > +		if (!ret)
> > > +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 1);
> > I find this quite complex to follow. Wouldn't it be cleaner to retain
> > the 4 checks on irq_status as they are and then before the writel of
> > irq_ack check pwr_state and io_level and call sdhci_msm_set_{vmmc,vqmmc}
> > accordingly?
> 
> I will see if i can update as you suggested.
> 
> > > +
> > > +		if (!ret) {
> > > +			pwr_state = REQ_BUS_ON;
> > > +			io_level = REQ_IO_HIGH;
> > > +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> > > +		} else {
> > > +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
> > > +					mmc_hostname(mmc), ret, irq_status);
> > You already printed that this failed in sdhci_msm_set_{vmmc,vqmmc}, no
> > need to print again.
> > 
> > > +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
> > > +			sdhci_msm_set_vmmc(msm_host, mmc, 0);
> > > +		}
> > >   	}
> > >   	if (irq_status & CORE_PWRCTL_BUS_OFF) {
> > > -		pwr_state = REQ_BUS_OFF;
> > > -		io_level = REQ_IO_LOW;
> > > -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> > > +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 0);
> > > +		if (!ret)
> > > +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 0);
> > > +
> > > +		if (!ret) {
> > > +			pwr_state = REQ_BUS_OFF;
> > > +			io_level = REQ_IO_LOW;
> > > +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> > > +		} else {
> > > +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
> > > +					mmc_hostname(mmc), ret, irq_status);
> > > +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
> > > +		}
> > >   	}
> > >   	/* Handle IO LOW/HIGH */
> > >   	if (irq_status & CORE_PWRCTL_IO_LOW) {
> > > @@ -1457,6 +1556,15 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
> > >   		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
> > >   	}
> > > +	if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
> > > +		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
> > Didn't you already call this through sdhci_msm_set_vqmmc()?
> 
> No.sdhci_msm_set_vqmmc handles only vqmmc ON/OFF. While turning it ON it
> sets
> Vqmmc to possbile default IO level (1.8v or 3.0v).
> Where this is only to make IO lines high (3.0v) or Low (1.8v).

If you move both the regulator operations here (below the point where
you figure out pwr_state and io_level), wouldn't it be possible to avoid
the additional, nested, vqmmc voltage request?

> > > +		if (ret < 0)
> > > +			pr_err("%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
> > > +					mmc_hostname(mmc), ret,
> > > +					mmc->ios.signal_voltage, mmc->ios.vdd,
> > > +					irq_status);
> > > +	}
> > > +
> > >   	/*
> > >   	 * The driver has to acknowledge the interrupt, switch voltages and
> > >   	 * report back if it succeded or not to this register. The voltage
> > > @@ -1833,6 +1941,91 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
> > >   	sdhci_reset(host, mask);
> > >   }
> > > +static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
> > > +{
> > > +	int ret = 0;
> > No need to initialize ret, first use is an assignment.
> > 
> > > +	struct mmc_host *mmc = msm_host->mmc;
> > > +
> > > +	ret = mmc_regulator_get_supply(msm_host->mmc);
> > > +	if (ret)
> > > +		return ret;
> > > +	device_property_read_u32(&msm_host->pdev->dev,
> > > +			"vmmc-max-load-microamp",
> > > +			&msm_host->vmmc_load);
> > > +	device_property_read_u32(&msm_host->pdev->dev,
> > > +			"vqmmc-max-load-microamp",
> > > +			&msm_host->vqmmc_load);
> > These properties are not documented. Do they vary enough to mandate
> > being read from DT or could they simply be approximated by a define
> > instead?
> 
> I can use defines. But since these values are different for eMMC and SDcard
> I will have to maintain two sets and need to have logic during probe to
> identify SDcard or eMMC and use the assign the set accordingly.
> So we tought, getting from dt is simpler and clean.
> In case Rob didn't agree with dt entries, I will go with this approach.
> 

Sounds reasonable, let's see what Rob says.

> > > +
> > > +	sdhci_msm_set_regulator_caps(msm_host);
> > > +	mmc->ios.power_mode = MMC_POWER_UNDEFINED;
> > > +
> > > +	return 0;
> > > +
> > > +}
> > > +
> > > +static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
> > > +				      struct mmc_ios *ios)
> > > +{
> > > +	struct sdhci_host *host = mmc_priv(mmc);
> > > +	u16 ctrl;
> > > +
> > > +	/*
> > > +	 * Signal Voltage Switching is only applicable for Host Controllers
> > > +	 * v3.00 and above.
> > > +	 */
> > > +	if (host->version < SDHCI_SPEC_300)
> > > +		return 0;
> > > +
> > > +	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> > > +
> > > +	switch (ios->signal_voltage) {
> > > +	case MMC_SIGNAL_VOLTAGE_330:
> > > +		if (!(host->flags & SDHCI_SIGNALING_330))
> > > +			return -EINVAL;
> > > +		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
> > > +		ctrl &= ~SDHCI_CTRL_VDD_180;
> > > +		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
> > > +
> > > +		/* 3.3V regulator output should be stable within 5 ms */
> > What mechanism ensures that the readw won't return withing 5ms from the
> > writew above?
> 
> Thanks for pointing this. This delay got missed. I will add it in next
> patchset.

Nice, thanks.

Regards,
Bjorn
