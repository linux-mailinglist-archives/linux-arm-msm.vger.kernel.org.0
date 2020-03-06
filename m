Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37D4617B9F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 11:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgCFKOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 05:14:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:44119 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726231AbgCFKOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 05:14:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583489663; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=NtyrUOr8s94oXdyYaHt5f294dq+E37d+2TocPvyH+fA=; b=miVpeDA7PY0To4lgqvY8/Sk2nonCnnt9czcQ3M4817qF7ev4w5RQWhU/gZuP+oyzkcCes3nj
 ZrJOS5us1FLMiey5zJCHGAiOvE8TuoTquXIuqhdLnvGpsTEe6v72s85QGHbguYJVMdJ9eV+z
 mgjNI2hloGkRuwOFx90xypYsByE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e62227d.7f5ac5ecd570-smtp-out-n02;
 Fri, 06 Mar 2020 10:14:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 616F3C4478C; Fri,  6 Mar 2020 10:14:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 247A7C433D2;
        Fri,  6 Mar 2020 10:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 247A7C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V2] mmc: sdhci-msm: Disable CQE during SDHC reset
To:     Adrian Hunter <adrian.hunter@intel.com>, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
References: <1582890639-32072-1-git-send-email-vbadigan@codeaurora.org>
 <1583322863-21790-1-git-send-email-vbadigan@codeaurora.org>
 <da449444-1878-e387-6ebf-4ddb282a9b71@intel.com>
 <1430237a-9dc5-f046-1dfe-1d5c09c16ead@codeaurora.org>
 <3a1783c2-e8bb-f5af-4d3e-f4a45b487f0e@intel.com>
 <0e737f52-767f-05d4-829b-4f76c084062c@codeaurora.org>
 <460b7cbe-71f5-4bea-673f-2075ee5c5d6a@intel.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <cd306623-37a7-318e-8545-4b6a9c3765f4@codeaurora.org>
Date:   Fri, 6 Mar 2020 15:44:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <460b7cbe-71f5-4bea-673f-2075ee5c5d6a@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/5/2020 2:29 PM, Adrian Hunter wrote:
> On 4/03/20 6:50 pm, Veerabhadrarao Badiganti wrote:
>> On 3/4/2020 7:40 PM, Adrian Hunter wrote:
>>> On 4/03/20 3:10 pm, Veerabhadrarao Badiganti wrote:
>>>> Hi Adrian
>>>>
>>>> On 3/4/2020 5:58 PM, Adrian Hunter wrote:
>>>>> On 4/03/20 1:54 pm, Veerabhadrarao Badiganti wrote:
>>>>>> When SDHC gets reset (E.g. in suspend path), CQE also gets reset
>>>>>> and goes to disable state. But s/w state still points it as CQE
>>>>>> is in enabled state. Since s/w and h/w states goes out of sync,
>>>>>> it results in s/w request timeout for subsequent CQE requests.
>>>>>>
>>>>>> To synchronize CQE s/w and h/w state during SDHC reset,
>>>>>> explicitly disable CQE after reset.
>>>>> Shouldn't you be calling cqhci_suspend() / cqhci_resume() in the suspend
>>>>> and
>>>>> resume paths?
>>>> This issue is seen during mmc runtime suspend.  I can add it
>>>> sdhci_msm_runtime_suspend
>>>>
>>>> but sdhci_msm runtime delay is aggressive, its 50ms. It may get invoked very
>>>> frequently.
>>>>
>>>> So Im of the opinion that disabling CQE very often from platform runtime
>>>> suspend is overkill.
>>> It doesn't look like sdhci-msm calls any sdhci.c pm ops, so how does SDHC
>>> get reset?
>> With MMC_CAP_AGGRESSIVE_PM flag enabled, it getting called from
>> mmc_runtime_suspend()
>>
>> Below is the call stack()
>>
>>     sdhci_reset
>>    sdhci_do_reset
>>    sdhci_init
>>    sdhci_set_ios
>>    mmc_set_initial_state
>>    mmc_power_off
>>   _mmc_suspend
>>    mmc_runtime_suspend
>>
> OK, cqhci_suspend does the right thing, but it is not an
> appropriate function for this.  I suggest introducing
> cqhci_deactivate() as below.
>
> From: Adrian Hunter <adrian.hunter@intel.com>
> Date: Thu, 5 Mar 2020 10:42:09 +0200
> Subject: [PATCH] mmc: cqhci: Add cqhci_deactivate()
>
> Host controllers can reset CQHCI either directly or as a consequence of
> host controller reset. Add cqhci_deactivate() which puts the CQHCI
> driver into a state that is consistent with that.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>   drivers/mmc/host/cqhci.c | 6 +++---
>   drivers/mmc/host/cqhci.h | 5 ++++-
>   2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index e2ea2c4b6b94..d8d024a1682b 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -298,16 +298,16 @@ static void __cqhci_disable(struct cqhci_host *cq_host)
>   	cq_host->activated = false;
>   }
>   
> -int cqhci_suspend(struct mmc_host *mmc)
> +int cqhci_deactivate(struct mmc_host *mmc)
>   {
>   	struct cqhci_host *cq_host = mmc->cqe_private;
>   
> -	if (cq_host->enabled)
> +	if (cq_host->enabled && cq_host->activated)
>   		__cqhci_disable(cq_host);
>   
>   	return 0;
>   }
> -EXPORT_SYMBOL(cqhci_suspend);
> +EXPORT_SYMBOL(cqhci_deactivate);
>   
>   int cqhci_resume(struct mmc_host *mmc)
>   {
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index def76e9b5cac..8648846a0213 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -230,7 +230,10 @@ irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
>   		      int data_error);
>   int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
>   struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
> -int cqhci_suspend(struct mmc_host *mmc);
> +static inline int cqhci_suspend(struct mmc_host *mmc)
> +{
> +	return cqhci_deactivate(mmc);
> +}
>   int cqhci_resume(struct mmc_host *mmc);
>   
>   #endif

Thanks Adrian for the suggestion. Will post this change and my updated fix.

Thanks

Veera
