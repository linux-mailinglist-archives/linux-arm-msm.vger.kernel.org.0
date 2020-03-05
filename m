Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7482417A6D6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 14:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbgCEN5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 08:57:14 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:60775 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726211AbgCEN5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 08:57:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583416633; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zOieWkAjoEw8P19n/t7PzYyxX8NrouzGC34JBMcgWuQ=; b=RWZmVKuuQa5FigmVqUE3yfGs4m268XW8blj8U9+yL4msM69r/1tcV5YMzLVRsNAxQrwNSaTf
 HdqB54SPFdz7rF3auNRCkDCA21R69b1Q6GwLEsfbzlLwSx9QltEepeqZ2g0TNd8wahbI82sS
 DL7pKThYciKKXPCGPE8B72ytkWc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e610531.7f1308bc18f0-smtp-out-n03;
 Thu, 05 Mar 2020 13:57:05 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35012C433A2; Thu,  5 Mar 2020 13:57:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 20689C43383;
        Thu,  5 Mar 2020 13:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 20689C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Stephen Boyd <swboyd@chromium.org>,
        Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
 <CAPDyKFqSJ4h7UvQfQzWmSq9gg97A0MXvdcuXXaY7b-YUHs=V2g@mail.gmail.com>
 <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <5f854baa-3bb1-8cea-b605-dfabae8d8b2a@codeaurora.org>
Date:   Thu, 5 Mar 2020 19:26:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158334039680.7173.16159724456027777605@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/4/2020 10:16 PM, Stephen Boyd wrote:
> Quoting Ulf Hansson (2020-03-04 07:34:29)
>> On Thu, 20 Feb 2020 at 07:45, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
>>> The existing suspend/resume callbacks of sdhci-msm driver are just
>>> gating/un-gating the clocks. During suspend cycle more can be done
>>> like disabling controller, disabling card detection, enabling wake-up events.
>>>
>>> So updating the system pm callbacks for performing these extra
>>> actions besides controlling the clocks.
>>>
>>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>> ---
>>> Changes since V3:
>>>      Invoking sdhci & cqhci resume if sdhci_host_suspend fails.
>>>      Removed condition check before invoking cqhci_resume since its a dummy function.
>>>
>>> Changes since V2:
>>>      Removed disabling/enabling pwr-irq from system pm ops.
>>>
>>> Changes since V1:
>>>      Invoking pm_runtime_force_suspend/resume instead of
>>>      sdhci_msm_runtime_suepend/resume.
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index 3955fa5d..3559b50 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -2159,9 +2159,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
> [...]
>>> +
>>> +       ret = sdhci_suspend_host(host);
>>> +       if (ret)
>>> +               goto resume_cqhci;
>> sdhci_suspend_host() can't be called on a device that has been runtime
>> suspended, as that would lead to accessing device registers when
>> clocks/PM domains are gated.
>>
>> Depending on how the corresponding cqhci device is managed from a
>> runtime PM point of view, it could also be problematic to call
>> cqhci_suspend().
> There seems to be another patch floating around here[1] that is an
> attempt at a fix to this patch. They should probably be combined so that
> it's not confusing what's going on.

The other fix is altogether different. It is the fix for the issue seen 
with run-time pm.

whereas this change is for system pm.

>>> +
>>> +       ret = pm_runtime_force_suspend(dev);
>> It looks to me that perhaps you could make use of solely
>> pm_runtime_force_suspend(), then just skip calling
>> sdhci_suspend|resume_host() altogether. Do you think that could work?
> Does that do all the things the commit text mentions is desired for
> system suspend?
>
>>> like disabling controller, disabling card detection, enabling wake-up events.
> [1] https://lore.kernel.org/linux-arm-msm/1583322863-21790-1-git-send-email-vbadigan@codeaurora.org/
