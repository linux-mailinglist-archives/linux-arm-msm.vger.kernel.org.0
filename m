Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3FE1DB14C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 13:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgETLRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 07:17:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:59982 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726486AbgETLRD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 07:17:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589973421; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=x2QeAKoeum0/WUVq47LRs8/u1TfnZeJl9NoUecmRu0w=; b=OKshHeNo5cuowmqPUBo1FPB60D6iE3z8pgFu1NNdJG+WK3IuI65SAAsH+xUf0EYoJqzIpz+Y
 +WoJ8opYFQ9tPvCcwjAdE1R/YMrGW3vswy/6/k5MbDoTo6AHRLVTnpweYRtJw3Sa7Nip5k41
 0BOdk1yrIo1gSTKi3Nfwc1HcYT8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec511ac087f08818e97d4ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 11:17:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 572E4C433CA; Wed, 20 May 2020 11:16:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.83.65.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 276B7C433C8;
        Wed, 20 May 2020 11:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 276B7C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1 2/3] mmc: sdhci-msm: Use internal voltage control
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Andy Gross <agross@kernel.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1589541535-8523-3-git-send-email-vbadigan@codeaurora.org>
 <20200518195711.GH2165@builder.lan>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <1f546a8b-7f10-95e7-efc2-8e3d5787aee6@codeaurora.org>
Date:   Wed, 20 May 2020 16:46:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518195711.GH2165@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Thanks Bjorn for the review. For major comments I'm responding.
Other comments, i will take care of them in my next patch-set.

On 5/19/2020 1:27 AM, Bjorn Andersson wrote:
> On Fri 15 May 04:18 PDT 2020, Veerabhadrarao Badiganti wrote:
>
>> From: Vijay Viswanath <vviswana@codeaurora.org>
>>
>> On qcom SD host controllers voltage switching be done after the HW
>> is ready for it. The HW informs its readiness through power irq.
>> The voltage switching should happen only then.
>>
>> Use the internal voltage switching and then control the voltage
>> switching using power irq.
>>
>> Set the regulator load as well so that regulator can be configured
>> in LPM mode when in is not being used.
>>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Please note that per Documentation/process/submitting-patches.rst
> section 11) this states:
>
> 1) You wrote the patch (From:) without stating that its Certificate of
> origin.
>
> 2) Then Asutosh took your patch (in full or part) and guarantees that
> he's allowed to contribute it to the project.
>
> 3) Then you took his patch (in full or part) and guarantee that you're
> allowed to contribute it to the project.
>
> 4) Then Veerabhadrarao took your patch (in full or part) and guarantees
> that he's allowed to contribute it to the project
>
> 5) Then somehow it came out of your inbox - even if Veerabhadrarao was
> the one who handled it last.
>
>
> As author you should be the first one to certify, and as poster to LKML
> you should be the last one.
>
> If you worked together on this, then list Asutosh and Veerabhadrarao as
> Co-developed-by.
>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 215 +++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 207 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 97758fa..a10e955 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -36,7 +36,9 @@
>>   #define CORE_PWRCTL_IO_LOW	BIT(2)
>>   #define CORE_PWRCTL_IO_HIGH	BIT(3)
>>   #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
>> +#define CORE_PWRCTL_BUS_FAIL    BIT(1)
>>   #define CORE_PWRCTL_IO_SUCCESS	BIT(2)
>> +#define CORE_PWRCTL_IO_FAIL     BIT(3)
>>   #define REQ_BUS_OFF		BIT(0)
>>   #define REQ_BUS_ON		BIT(1)
>>   #define REQ_IO_LOW		BIT(2)
>> @@ -263,6 +265,9 @@ struct sdhci_msm_host {
>>   	bool use_cdr;
>>   	u32 transfer_mode;
>>   	bool updated_ddr_cfg;
>> +	u32 vmmc_load;
>> +	u32 vqmmc_load;
>> +	bool vqmmc_enabled;
>>   };
>>   
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -1298,6 +1303,78 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>>   		sdhci_msm_hs400(host, &mmc->ios);
>>   }
>>   
>> +static int sdhci_msm_set_vmmc(struct sdhci_msm_host *msm_host,
>> +			      struct mmc_host *mmc, int level)
>> +{
>> +	int load, ret;
>> +
>> +	if (IS_ERR(mmc->supply.vmmc))
>> +		return 0;
>> +
>> +	if (msm_host->vmmc_load) {
>> +		load = level ? msm_host->vmmc_load : 0;
>> +		ret = regulator_set_load(mmc->supply.vmmc, load);
> I started on the comment about regulator_set_load() that you can find
> below...
>
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>> +	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> ...but I don't see that mmc->ios.vdd necessarily is in sync with
> "level". Or do you here simply set the load based on what the hardware
> tell you and then orthogonally to that let the core enable/disable the
> regulator?
>
> Perhaps I'm just missing something obvious, but if not I believe this
> warrants a comment describing that you're lowering the power level
> regardless of the actual power being disabled.

ios.vdd will be in sync with level. Vdd will be either 0 or a valid 
voltage (3v).

This indirectly gets triggered/invoked through power-irq when driver 
writes 0
or valid voltage to SDHCI_POWER_CONTROL register from 
sdhci_set_power_noreg().
>> +out:
>> +	if (ret)
>> +		pr_err("%s: vmmc set load/ocr failed: %d\n",
>> +				mmc_hostname(mmc), ret);
> Please use:
> 	dev_err(mmc_dev(mmc), ...);
>
>> +
>> +	return ret;
>> +}
>> +
>> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
>> +			      struct mmc_host *mmc, int level)
> vqmmc_enabled is a bool and "level" sounds like an int with several
> possible values. So please make level bool here as well, to make it
> easer to read..
>
>> +{
>> +	int load, ret;
>> +	struct mmc_ios ios;
>> +
>> +	if (IS_ERR(mmc->supply.vqmmc)			 ||
>> +	    (mmc->ios.power_mode == MMC_POWER_UNDEFINED) ||
>> +	    (msm_host->vqmmc_enabled == level))
>> +		return 0;
>> +
>> +	if (msm_host->vqmmc_load) {
>> +		load = level ? msm_host->vqmmc_load : 0;
>> +		ret = regulator_set_load(mmc->supply.vqmmc, load);
> Since v5.0 the "load" of a regulator consumer is only taken into
> consideration if the consumer is enabled. So given that you're toggling
> the regulator below there's no need to change this here.
>
> Just specify the "active load" at probe time.

For eMMC case, we don't disable this Vccq2 regulator by having always-on 
flag
in the regulator node. Only for SDcard Vccq2 will be disabled.
Sice driver is common for both eMMC and SDcard, I have to set 0 load to make
it generic and to ensure eMMC Vccq2 regulator will be in LPM mode.

>
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>> +	/*
>> +	 * The IO voltage regulator may not always support a voltage close to
>> +	 * vdd. Set IO voltage based on capability of the regulator.
>> +	 */
> Is this comment related to the if/else-if inside the conditional? If so
> please move it one line down.
>
>> +	if (level) {
>> +		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
>> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
>> +		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
>> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
> Please add a space here, to indicate that the if statement on the next
> line is unrelated to the if/elseif above.
>
>> +		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
>> +			pr_debug("%s: %s: setting signal voltage: %d\n",
>> +					mmc_hostname(mmc), __func__,
>> +					ios.signal_voltage);
> I strongly believe you should replace these debug prints with
> tracepoints, throughout the driver.
>
>> +			ret = mmc_regulator_set_vqmmc(mmc, &ios);
>> +			if (ret < 0)
>> +				goto out;
>> +		}
>> +		ret = regulator_enable(mmc->supply.vqmmc);
>> +	} else {
>> +		ret = regulator_disable(mmc->supply.vqmmc);
>> +	}
> Given that you don't need to regulator_set_load() this function is now
> just one large if/else condition on a constant passed as an argument.
> Please split it into sdhci_msm_enable_vqmmc() and
> sdhci_msm_disable_vqmmc().


Same response as above
For eMMC case, we don't disable this Vccq2 regulator by having always-on 
flag
in the regulator node. Only for SDcard Vccq2 will be disabled.
Sice driver is common for both eMMC and SDcard, I have to set 0 load to make
it generic and to ensure eMMC Vccq2 regulator will be in LPM mode.

>> +out:
>> +	if (ret)
>> +		pr_err("%s: vqmmc failed: %d\n", mmc_hostname(mmc), ret);
> I think it would be useful to know if this error came from
> mmc_regulator_set_vqmmc() or regulator_enable() - or
> regulator_disable().
>
> So please move this up and add some context in the error message, and
> please use dev_err().
>
>> +	else
>> +		msm_host->vqmmc_enabled = level;
>> +
>> +	return ret;
>> +}
>> +
>>   static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
>>   {
>>   	init_waitqueue_head(&msm_host->pwr_irq_wait);
>> @@ -1401,8 +1478,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>>   {
>>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = host->mmc;
>>   	u32 irq_status, irq_ack = 0;
>> -	int retry = 10;
>> +	int retry = 10, ret = 0;
> There's no need to initialize ret, in all occasions it's assigned before
> being read.
>
>>   	u32 pwr_state = 0, io_level = 0;
>>   	u32 config;
>>   	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>> @@ -1438,14 +1516,35 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>>   
>>   	/* Handle BUS ON/OFF*/
>>   	if (irq_status & CORE_PWRCTL_BUS_ON) {
>> -		pwr_state = REQ_BUS_ON;
>> -		io_level = REQ_IO_HIGH;
>> -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>> +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 1);
>> +		if (!ret)
>> +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 1);
> I find this quite complex to follow. Wouldn't it be cleaner to retain
> the 4 checks on irq_status as they are and then before the writel of
> irq_ack check pwr_state and io_level and call sdhci_msm_set_{vmmc,vqmmc}
> accordingly?

I will see if i can update as you suggested.

>> +
>> +		if (!ret) {
>> +			pwr_state = REQ_BUS_ON;
>> +			io_level = REQ_IO_HIGH;
>> +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>> +		} else {
>> +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
>> +					mmc_hostname(mmc), ret, irq_status);
> You already printed that this failed in sdhci_msm_set_{vmmc,vqmmc}, no
> need to print again.
>
>> +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
>> +			sdhci_msm_set_vmmc(msm_host, mmc, 0);
>> +		}
>>   	}
>>   	if (irq_status & CORE_PWRCTL_BUS_OFF) {
>> -		pwr_state = REQ_BUS_OFF;
>> -		io_level = REQ_IO_LOW;
>> -		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>> +		ret = sdhci_msm_set_vmmc(msm_host, mmc, 0);
>> +		if (!ret)
>> +			ret = sdhci_msm_set_vqmmc(msm_host, mmc, 0);
>> +
>> +		if (!ret) {
>> +			pwr_state = REQ_BUS_OFF;
>> +			io_level = REQ_IO_LOW;
>> +			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>> +		} else {
>> +			pr_err("%s: BUS_ON req failed(%d). irq_status: 0x%08x\n",
>> +					mmc_hostname(mmc), ret, irq_status);
>> +			irq_ack |= CORE_PWRCTL_BUS_FAIL;
>> +		}
>>   	}
>>   	/* Handle IO LOW/HIGH */
>>   	if (irq_status & CORE_PWRCTL_IO_LOW) {
>> @@ -1457,6 +1556,15 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>>   		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
>>   	}
>>   
>> +	if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
>> +		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
> Didn't you already call this through sdhci_msm_set_vqmmc()?

No.sdhci_msm_set_vqmmc handles only vqmmc ON/OFF. While turning it ON it 
sets
Vqmmc to possbile default IO level (1.8v or 3.0v).
Where this is only to make IO lines high (3.0v) or Low (1.8v).
>> +		if (ret < 0)
>> +			pr_err("%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
>> +					mmc_hostname(mmc), ret,
>> +					mmc->ios.signal_voltage, mmc->ios.vdd,
>> +					irq_status);
>> +	}
>> +
>>   	/*
>>   	 * The driver has to acknowledge the interrupt, switch voltages and
>>   	 * report back if it succeded or not to this register. The voltage
>> @@ -1833,6 +1941,91 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>>   	sdhci_reset(host, mask);
>>   }
>>   
>> +static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
>> +{
>> +	int ret = 0;
> No need to initialize ret, first use is an assignment.
>
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +
>> +	ret = mmc_regulator_get_supply(msm_host->mmc);
>> +	if (ret)
>> +		return ret;
>> +	device_property_read_u32(&msm_host->pdev->dev,
>> +			"vmmc-max-load-microamp",
>> +			&msm_host->vmmc_load);
>> +	device_property_read_u32(&msm_host->pdev->dev,
>> +			"vqmmc-max-load-microamp",
>> +			&msm_host->vqmmc_load);
> These properties are not documented. Do they vary enough to mandate
> being read from DT or could they simply be approximated by a define
> instead?

I can use defines. But since these values are different for eMMC and SDcard
I will have to maintain two sets and need to have logic during probe to
identify SDcard or eMMC and use the assign the set accordingly.
So we tought, getting from dt is simpler and clean.
In case Rob didn't agree with dt entries, I will go with this approach.

>> +
>> +	sdhci_msm_set_regulator_caps(msm_host);
>> +	mmc->ios.power_mode = MMC_POWER_UNDEFINED;
>> +
>> +	return 0;
>> +
>> +}
>> +
>> +static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
>> +				      struct mmc_ios *ios)
>> +{
>> +	struct sdhci_host *host = mmc_priv(mmc);
>> +	u16 ctrl;
>> +
>> +	/*
>> +	 * Signal Voltage Switching is only applicable for Host Controllers
>> +	 * v3.00 and above.
>> +	 */
>> +	if (host->version < SDHCI_SPEC_300)
>> +		return 0;
>> +
>> +	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
>> +
>> +	switch (ios->signal_voltage) {
>> +	case MMC_SIGNAL_VOLTAGE_330:
>> +		if (!(host->flags & SDHCI_SIGNALING_330))
>> +			return -EINVAL;
>> +		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
>> +		ctrl &= ~SDHCI_CTRL_VDD_180;
>> +		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
>> +
>> +		/* 3.3V regulator output should be stable within 5 ms */
> What mechanism ensures that the readw won't return withing 5ms from the
> writew above?

Thanks for pointing this. This delay got missed. I will add it in next 
patchset.
>> +		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
>> +		if (!(ctrl & SDHCI_CTRL_VDD_180))
>> +			return 0;
>> +
>> +		pr_warn("%s: 3.3V regulator output did not became stable\n",
>> +			mmc_hostname(mmc));
>> +
>> +		return -EAGAIN;
> The body of the 330 and 180 cases are quite similar, can you perhaps
> deal with those after the switch, once?

Sure. Will check this.

>> +	case MMC_SIGNAL_VOLTAGE_180:
>> +		if (!(host->flags & SDHCI_SIGNALING_180))
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * Enable 1.8V Signal Enable in the Host Control2
>> +		 * register
>> +		 */
>> +		ctrl |= SDHCI_CTRL_VDD_180;
>> +		sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
>> +
>> +		/* 1.8V regulator output should be stable within 5 ms */
>> +		ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
>> +		if (ctrl & SDHCI_CTRL_VDD_180)
>> +			return 0;
>> +
>> +		pr_warn("%s: 1.8V regulator output did not became stable\n",
>> +			mmc_hostname(mmc));
>> +
>> +		return -EAGAIN;
>> +	case MMC_SIGNAL_VOLTAGE_120:
>> +		if (!(host->flags & SDHCI_SIGNALING_120))
>> +			return -EINVAL;
>> +		return 0;
>> +	default:
>> +		/* No signal voltage switch required */
>> +		return 0;
>> +	}
>> +
> Empty line.
>
> Regards,
> Bjorn
>
>> +}
>> +
>>   static const struct sdhci_msm_variant_ops mci_var_ops = {
>>   	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>>   	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
>> @@ -1880,6 +2073,7 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>>   	.write_w = sdhci_msm_writew,
>>   	.write_b = sdhci_msm_writeb,
>>   	.irq	= sdhci_msm_cqe_irq,
>> +	.set_power = sdhci_set_power_noreg,
>>   };
>>   
>>   static const struct sdhci_pltfm_data sdhci_msm_pdata = {
>> @@ -2072,6 +2266,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   	if (core_major == 1 && core_minor >= 0x49)
>>   		msm_host->updated_ddr_cfg = true;
>>   
>> +	ret = sdhci_msm_register_vreg(msm_host);
>> +	if (ret)
>> +		goto clk_disable;
>> +
>>   	/*
>>   	 * Power on reset state may trigger power irq if previous status of
>>   	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
>> @@ -2116,6 +2314,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   					 MSM_MMC_AUTOSUSPEND_DELAY_MS);
>>   	pm_runtime_use_autosuspend(&pdev->dev);
>>   
>> +	host->mmc_host_ops.start_signal_voltage_switch =
>> +		sdhci_msm_start_signal_voltage_switch;
>>   	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
>>   	if (of_property_read_bool(node, "supports-cqe"))
>>   		ret = sdhci_msm_cqe_add_host(host, pdev);
>> @@ -2123,7 +2323,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   		ret = sdhci_add_host(host);
>>   	if (ret)
>>   		goto pm_runtime_disable;
>> -	sdhci_msm_set_regulator_caps(msm_host);
>>   
>>   	pm_runtime_mark_last_busy(&pdev->dev);
>>   	pm_runtime_put_autosuspend(&pdev->dev);
>> -- 
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>>
