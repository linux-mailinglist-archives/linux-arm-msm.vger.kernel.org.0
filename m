Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342F11AC71D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 16:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394627AbgDPOtL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 10:49:11 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58832 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394758AbgDPOtJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 10:49:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587048549; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Skl7Q5RWa0/wmSos/4aZNHd6qEL+q77C8ZcG2EaOzNY=; b=ET3ilOPJ+3sGNfuUZBBbGzn7a5ekMcSueIb0e5/85IhyDgwUnqemwSsiwa9KJ+dhaFCxDhjl
 rSsbvJSEeigTcOPSkv/QBEumaqpGnQZdbjsgRIQ7soe1Js3fj9KtP0qG42aoN7tiY/mLQ0X+
 AdycwsrhkKOlV0BNrre/sLoHqKM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e987055.7ff69210fa08-smtp-out-n02;
 Thu, 16 Apr 2020 14:48:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5BFF7C432C2; Thu, 16 Apr 2020 14:48:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [183.83.68.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09658C433CB;
        Thu, 16 Apr 2020 14:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09658C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1 2/4] mmc: sdhci-msm: Enable MMC_CAP_NEED_RSP_BUSY host
 capability
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
References: <1586706808-27337-1-git-send-email-vbadigan@codeaurora.org>
 <1586706808-27337-3-git-send-email-vbadigan@codeaurora.org>
 <CAPDyKFobBGDYMGmkpTcmKVrnT7MywM5=xaOx86f91ay6c7DUWw@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <abe9cee2-dce4-c887-cece-5a321e4852bd@codeaurora.org>
Date:   Thu, 16 Apr 2020 20:18:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFobBGDYMGmkpTcmKVrnT7MywM5=xaOx86f91ay6c7DUWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Ulf,

On 4/16/2020 5:46 PM, Ulf Hansson wrote:
> On Sun, 12 Apr 2020 at 17:54, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>> sdhci-msm controller requires the R1B response for commands that
>> has this response associated with them.
>>
>> So enable MMC_CAP_NEED_RSP_BUSY capability.
> I assume this potentially should be considered as fix and tagged for stable?
Yes Stable flag can be applied to this.

Patch with MMC_CAP_WAIT_WHILE_BUSY cap also needed besides this.
Shall I push V2 with stable flag?

> Another question, if there is there an upper limit of the busy timeout
> in the HW (cmd->busy_timeout) or does the driver use a software
> timeout that is adjustable?

The max supported h.w busy timeout value on qcom h/w 21sec.

> Kind regards
> Uffe
>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 013dcea..d826e9b 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2088,6 +2088,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>          }
>>
>>          msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
>> +       msm_host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>>
>>          pm_runtime_get_noresume(&pdev->dev);
>>          pm_runtime_set_active(&pdev->dev);
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
