Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 419F61790F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 14:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388147AbgCDNKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 08:10:16 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:60628 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388120AbgCDNKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 08:10:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583327415; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=09KH4danPPy1GXYTiRJtgclAiPC8KNirEOS/XScmEZI=; b=GYHTxFwOJiIuSxK8H2XuxqweeuakeH2Zvpfr9n8J0RmKtvEs/OVgj8+p2kVh03PPOfHpB7I2
 nQv10Fk5gm5Ob8WP922vHhZJaUq0PL6TvI+0P7/vvfAGpGNk9sqwF+pw9e5LtQFR3J9XDBUh
 1vtFasfKhPzq3ChUMvAZPZxZLvk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5fa8ae.7f8254ac53b0-smtp-out-n02;
 Wed, 04 Mar 2020 13:10:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 893FDC447A2; Wed,  4 Mar 2020 13:10:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B78F2C43383;
        Wed,  4 Mar 2020 13:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B78F2C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V2] mmc: sdhci-msm: Disable CQE during SDHC reset
To:     Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583322863-21790-1-git-send-email-vbadigan@codeaurora.org>
 <da449444-1878-e387-6ebf-4ddb282a9b71@intel.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <1430237a-9dc5-f046-1dfe-1d5c09c16ead@codeaurora.org>
Date:   Wed, 4 Mar 2020 18:40:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <da449444-1878-e387-6ebf-4ddb282a9b71@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Adrian

On 3/4/2020 5:58 PM, Adrian Hunter wrote:
> On 4/03/20 1:54 pm, Veerabhadrarao Badiganti wrote:
>> When SDHC gets reset (E.g. in suspend path), CQE also gets reset
>> and goes to disable state. But s/w state still points it as CQE
>> is in enabled state. Since s/w and h/w states goes out of sync,
>> it results in s/w request timeout for subsequent CQE requests.
>>
>> To synchronize CQE s/w and h/w state during SDHC reset,
>> explicitly disable CQE after reset.
> Shouldn't you be calling cqhci_suspend() / cqhci_resume() in the suspend and
> resume paths?

This issue is seen during mmc runtime suspend.  I can add it 
sdhci_msm_runtime_suspend

but sdhci_msm runtime delay is aggressive, its 50ms. It may get invoked 
very frequently.

So Im of the opinion that disabling CQE very often from platform runtime 
suspend is overkill.

>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> ---
>> Changes since V1:
>> 	- Disable CQE only when SDHC undergoes s/w reset for all.
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 53b79ee..75929d3 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1823,6 +1823,13 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>>   	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
>>   }
>>   
>> +static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>> +{
>> +	sdhci_reset(host, mask);
>> +	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
>> +		cqhci_suspend(host->mmc);
>> +}
>> +
>>   static const struct sdhci_msm_variant_ops mci_var_ops = {
>>   	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
>>   	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
>> @@ -1861,7 +1868,7 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
>>   MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>>   
>>   static const struct sdhci_ops sdhci_msm_ops = {
>> -	.reset = sdhci_reset,
>> +	.reset = sdhci_msm_reset,
>>   	.set_clock = sdhci_msm_set_clock,
>>   	.get_min_clock = sdhci_msm_get_min_clock,
>>   	.get_max_clock = sdhci_msm_get_max_clock,
>>
