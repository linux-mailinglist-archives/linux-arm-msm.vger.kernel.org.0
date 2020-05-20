Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74811DB15D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 13:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgETLT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 07:19:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15264 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726403AbgETLT1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 07:19:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589973566; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8RmjSPVzWqrVMEPEvXp02rGXmjjJBqhGIA5ty/fVU8E=; b=lOtqY0zOJi7u8yuDZ/MrXjrHeix/c40pjNUJJHkodUTFel2r8/FtBTZq3rFZSZhk4A/LYp1m
 4j0RYywa7zGHiQjnPsHNKaNRn5AiYc1QCb+0CBCbjtyFxSM58eySn9dwGK412vFejnO8umnO
 BiP0vE5FlP2FA/eL+GKd2wtWlqw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec51230c68d04556635b956 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 11:19:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15849C433C8; Wed, 20 May 2020 11:19:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.83.65.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14DD1C43395;
        Wed, 20 May 2020 11:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14DD1C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1 3/3] mmc: sdhci: Allow platform controlled voltage
 switching
To:     Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org,
        robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vijay Viswanath <vviswana@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1589541535-8523-4-git-send-email-vbadigan@codeaurora.org>
 <480cc8ee-27ae-2538-68d6-c382dbaca6bb@intel.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <1c4cdb66-25b1-68bf-1474-35b182605fc1@codeaurora.org>
Date:   Wed, 20 May 2020 16:49:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <480cc8ee-27ae-2538-68d6-c382dbaca6bb@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/19/2020 11:36 AM, Adrian Hunter wrote:
> On 15/05/20 2:18 pm, Veerabhadrarao Badiganti wrote:
>> From: Vijay Viswanath <vviswana@codeaurora.org>
>>
>> If vendor platform drivers are controlling whole logic of voltage
>> switching, then sdhci driver no need control vqmmc regulator.
>> So skip enabling/disable vqmmc from SDHC driver.
>>
>> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> ---
>>   drivers/mmc/host/sdhci.c | 32 +++++++++++++++++++-------------
>>   drivers/mmc/host/sdhci.h |  1 +
>>   2 files changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 1bb6b67..c010823 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -4098,6 +4098,7 @@ int sdhci_setup_host(struct sdhci_host *host)
>>   	unsigned int override_timeout_clk;
>>   	u32 max_clk;
>>   	int ret;
>> +	bool enable_vqmmc = false;
>>   
>>   	WARN_ON(host == NULL);
>>   	if (host == NULL)
>> @@ -4111,9 +4112,12 @@ int sdhci_setup_host(struct sdhci_host *host)
>>   	 * the host can take the appropriate action if regulators are not
>>   	 * available.
>>   	 */
>> -	ret = mmc_regulator_get_supply(mmc);
>> -	if (ret)
>> -		return ret;
>> +	if (!mmc->supply.vqmmc) {
>> +		ret = mmc_regulator_get_supply(mmc);
>> +		if (ret)
>> +			return ret;
>> +		enable_vqmmc  = true;
>> +	}
>>   
>>   	DBG("Version:   0x%08x | Present:  0x%08x\n",
>>   	    sdhci_readw(host, SDHCI_HOST_VERSION),
>> @@ -4373,7 +4377,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>>   		mmc->caps |= MMC_CAP_NEEDS_POLL;
>>   
>>   	if (!IS_ERR(mmc->supply.vqmmc)) {
>> -		ret = regulator_enable(mmc->supply.vqmmc);
>> +		if (enable_vqmmc) {
>> +			ret = regulator_enable(mmc->supply.vqmmc);
>> +			if (ret) {
>> +				pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
>> +					mmc_hostname(mmc), ret);
>> +				mmc->supply.vqmmc = ERR_PTR(-EINVAL);
>> +			}
>> +			host->vqmmc_enabled = !ret;
>> +		}
>>   
>>   		/* If vqmmc provides no 1.8V signalling, then there's no UHS */
>>   		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 1700000,
>> @@ -4386,12 +4398,6 @@ int sdhci_setup_host(struct sdhci_host *host)
>>   		if (!regulator_is_supported_voltage(mmc->supply.vqmmc, 2700000,
>>   						    3600000))
>>   			host->flags &= ~SDHCI_SIGNALING_330;
>> -
>> -		if (ret) {
>> -			pr_warn("%s: Failed to enable vqmmc regulator: %d\n",
>> -				mmc_hostname(mmc), ret);
>> -			mmc->supply.vqmmc = ERR_PTR(-EINVAL);
>> -		}
>>   	}
>>   
>>   	if (host->quirks2 & SDHCI_QUIRK2_NO_1_8_V) {
>> @@ -4625,7 +4631,7 @@ int sdhci_setup_host(struct sdhci_host *host)
>>   	return 0;
>>   
>>   unreg:
>> -	if (!IS_ERR(mmc->supply.vqmmc))
>> +	if (host->vqmmc_enabled)
>>   		regulator_disable(mmc->supply.vqmmc);
>>   undma:
>>   	if (host->align_buffer)
>> @@ -4643,7 +4649,7 @@ void sdhci_cleanup_host(struct sdhci_host *host)
>>   {
>>   	struct mmc_host *mmc = host->mmc;
>>   
>> -	if (!IS_ERR(mmc->supply.vqmmc))
>> +	if (host->vqmmc_enabled)
>>   		regulator_disable(mmc->supply.vqmmc);
>>   
>>   	if (host->align_buffer)
>> @@ -4780,7 +4786,7 @@ void sdhci_remove_host(struct sdhci_host *host, int dead)
>>   
>>   	destroy_workqueue(host->complete_wq);
>>   
>> -	if (!IS_ERR(mmc->supply.vqmmc))
>> +	if (host->vqmmc_enabled)
>>   		regulator_disable(mmc->supply.vqmmc);
>>   
>>   	if (host->align_buffer)
>> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
>> index 8d2a096..24d27e1 100644
>> --- a/drivers/mmc/host/sdhci.h
>> +++ b/drivers/mmc/host/sdhci.h
>> @@ -570,6 +570,7 @@ struct sdhci_host {
>>   	u32 caps1;		/* CAPABILITY_1 */
>>   	bool read_caps;		/* Capability flags have been read */
>>   
>> +	bool vqmmc_enabled;	/* Vqmmc is enabled */
> Last time around there was dissatisfaction with this variable name.  Perhaps
> change it to sdhci_core_to_disable_vqmmc

Sure Adrian. Will update this variable name.

>
>>   	unsigned int            ocr_avail_sdio;	/* OCR bit masks */
>>   	unsigned int            ocr_avail_sd;
>>   	unsigned int            ocr_avail_mmc;
>>
