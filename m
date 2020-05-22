Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8561DE806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 15:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgEVN1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 09:27:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:10824 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729906AbgEVN1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 09:27:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590154066; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aVvjVLZCUqbbjgAaWN6mYNWCWBwPMGWumaXLB5ZNMvs=; b=pY8GazUrRlL46bAcJuP64apGBrGU+/eucpiuBJYn6ooq5z4GIyBTjRdO8cVqWm7nIvHvhpxh
 eUvtotgR9geQIb4C37o4IDSYW2JsTNFWx6xxxvPZYCcza3pdDKhwjQV8eUC7zAu1yNUYo1sz
 1Wj+OvecyVo18caxPxgb/4+qzNU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ec7d34aeb073d569134556f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 13:27:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DBE5C433CA; Fri, 22 May 2020 13:27:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.83.65.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F6D2C433C8;
        Fri, 22 May 2020 13:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F6D2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V2 2/3] mmc: sdhci-msm: Use internal voltage control
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Asutosh Das <asutoshd@codeaurora.org>,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Andy Gross <agross@kernel.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1590074615-10787-1-git-send-email-vbadigan@codeaurora.org>
 <1590074615-10787-3-git-send-email-vbadigan@codeaurora.org>
 <20200521190739.GC1331782@builder.lan>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <08d11687-7aee-2c62-9435-670be1afb21e@codeaurora.org>
Date:   Fri, 22 May 2020 18:57:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521190739.GC1331782@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 5/22/2020 12:37 AM, Bjorn Andersson wrote:
> On Thu 21 May 08:23 PDT 2020, Veerabhadrarao Badiganti wrote:
>
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
>> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
>> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
>> Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Looks better, thanks.
>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 207 +++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 198 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> [..]
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -1298,6 +1302,71 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>>   		sdhci_msm_hs400(host, &mmc->ios);
>>   }
>>   
>> +static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
>> +{
>> +	int ret;
>> +
>> +	if (IS_ERR(mmc->supply.vmmc))
>> +		return 0;
>> +
>> +	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
>> +	if (ret)
>> +		dev_err(mmc_dev(mmc), "%s: vmmc set ocr with vdd=%d failed: %d\n",
>> +			mmc_hostname(mmc), mmc->ios.vdd, ret);
> Missed this one on v1, in the event that mmc_regulator_set_ocr() return
> a non-zero value it has already printed an error message. So please
> replace the tail with just:
>
> 	return mmc_regulator_set_ocr(...);
>
>> +
>> +	return ret;
>> +}
>> +
>> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
>> +			      struct mmc_host *mmc, bool level)
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
> Sorry for the late reply on v1, but please see my explanation regarding
> load and always-on regulators there.

<Merging your comment from V1 here>

 >> You should still call regulator_enable()/regulator_disable() on your
 >> consumer regulator in this driver. When you do this the regulator core
 >> will conclude that the regulator_dev (i.e. the part that represents the
 >> hardware) is marked always_on and will not enable/disable the regulator.

 >> But it will still invoke _regulator_handle_consumer_enable() and
 >> _regulator_handle_consumer_disable(), which will aggregate the "load" of
 >> all client regulators and update the regulator's load.

 >> So this will apply the load as you expect regardless of it being
 >> supplied by a regulator marked as always_on.

Since I'm not turning off this regulator for eMMC, I wanted to keep it 
in LPM mode
to save some power.
When the regulator configured in auto mode (RPMH_REGULATOR_MODE_AUTO) it
switches to LPM/HPM mode based on the active load.
So i have to minimize my driver load requirement so that I can let this 
regulator
in LPM mode.
So i need to set load every-time I disable/enable the regulator.

>> +		if (ret) {
>> +			dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
>> +				mmc_hostname(mmc), ret);
>> +			goto out;
>> +		}
>> +	}
>> +
>> +	if (level) {
>> +		/* Set the IO voltage regulator to default voltage level */
>> +		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
>> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
>> +		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
>> +			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
>> +
>> +		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
>> +			ret = mmc_regulator_set_vqmmc(mmc, &ios);
>> +			if (ret < 0) {
>> +				dev_err(mmc_dev(mmc), "%s: vqmmc set volgate failed: %d\n",
>> +					mmc_hostname(mmc), ret);
>> +				goto out;
>> +			}
>> +		}
>> +		ret = regulator_enable(mmc->supply.vqmmc);
>> +	} else {
>> +		ret = regulator_disable(mmc->supply.vqmmc);
>> +	}
>> +
>> +	if (ret)
>> +		dev_err(mmc_dev(mmc), "%s: vqmm %sable failed: %d\n",
>> +			mmc_hostname(mmc), level ? "en":"dis", ret);
>> +	else
>> +		msm_host->vqmmc_enabled = level;
>> +out:
>> +	return ret;
>> +}
> [..]
>> +static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
>> +				      struct mmc_ios *ios)
>> +{
>> +	struct sdhci_host *host = mmc_priv(mmc);
>> +	u16 ctrl, status;
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
>> +
>> +		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
>> +		ctrl &= ~SDHCI_CTRL_VDD_180;
>> +		break;
>> +	case MMC_SIGNAL_VOLTAGE_180:
>> +		if (!(host->flags & SDHCI_SIGNALING_180))
>> +			return -EINVAL;
>> +
>> +		/*
>> +		 * Enable 1.8V Signal Enable in the Host Control2
>> +		 * register
>> +		 */
>> +		ctrl |= SDHCI_CTRL_VDD_180;
>> +		break;
>> +	case MMC_SIGNAL_VOLTAGE_120:
>> +		if (!(host->flags & SDHCI_SIGNALING_120))
>> +			return -EINVAL;
>> +		return 0;
>> +	default:
>> +		/* No signal voltage switch required */
>> +		return 0;
>> +	}
>> +
>> +	sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
>> +
>> +	/* Wait for 5ms */
>> +	usleep_range(5000, 5500);
>> +
>> +	/* regulator output should be stable within 5 ms */
>> +	status = !!(ctrl & SDHCI_CTRL_VDD_180);
>> +	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
>> +	if (!!(ctrl &  SDHCI_CTRL_VDD_180) == status)
> You should be able to drop the !! both here and when assigning status.
>
> Overall this looks neater, thanks for reworking it.
>
> Regards,
> Bjorn


Thanks

Veera

