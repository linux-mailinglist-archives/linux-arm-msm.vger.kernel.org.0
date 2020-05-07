Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC041C969D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 18:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgEGQdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 12:33:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:30214 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726495AbgEGQdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 12:33:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588869224; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wLT5CFLaqtgLB/BEi/RGwsauWrW4mdPxSqIRzxuvoL8=; b=njmfqXPKrfrc8Ud2KkpV/n0fW8bGclSFmifX56TomHuWn2XhKhqcdFBHYj08B3RCszhZk5Iw
 fWyt5z7yvooWHRz+IBFNIdrd4GGXrH+njozkGzw3+vIqC+bx+Nx3pMuAH5/CKawelvoBS0pG
 Ig3yXKKUlZNu6MQIFEBfDdXx2CE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb43865.7f82d41e94c8-smtp-out-n05;
 Thu, 07 May 2020 16:33:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB5D3C44792; Thu,  7 May 2020 16:33:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.83.65.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B9BCC433D2;
        Thu,  7 May 2020 16:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6B9BCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Chun-Hung Wu <chun-hung.wu@mediatek.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>,
        Yong Mao <yong.mao@mediatek.com>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        DTML <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
 <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
 <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <f9fa0232-3945-4e47-9238-0b51f6531199@codeaurora.org>
Date:   Thu, 7 May 2020 22:03:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq7ffHeWg-S41tLvScg_BXCUULig=G=EzD_to1TG0NhVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/6/2020 10:06 PM, Ulf Hansson wrote:
> On Wed, 6 May 2020 at 15:01, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>>
>> On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
>>> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
>>> in mmc_of_parse().
>>>
>>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>> ---
>>>    drivers/mmc/core/host.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
>>> index c876872..47521c6 100644
>>> --- a/drivers/mmc/core/host.c
>>> +++ b/drivers/mmc/core/host.c
>>> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
>>>                host->caps2 |= MMC_CAP2_NO_SD;
>>>        if (device_property_read_bool(dev, "no-mmc"))
>>>                host->caps2 |= MMC_CAP2_NO_MMC;
>>> +     if (device_property_read_bool(dev, "supports-cqe"))
>>> +             host->caps2 |= MMC_CAP2_CQE;
>> This change is breaking emmc driver on qcom platforms where this dt
>> property is defined.
>>
>> [    1.543453]  cqhci_deactivate+0xc/0x38
>> [    1.545627]  sdhci_msm_reset+0x40/0x58
>> [    1.549447]  sdhci_do_reset+0x48/0x7c
>> [    1.553180]  __sdhci_read_caps+0x7c/0x214
>> [    1.556913]  sdhci_setup_host+0x58/0xce8
>> [    1.560905]  sdhci_msm_probe+0x588/0x8a4
>> [    1.564900]  platform_drv_probe+0x4c/0xb0
>>
>> So, we cant have this flag defined before sdhci_setup_host().
>>
>> I will have to clear this cap and re-enable it in our initialization.
> Thanks for reporting! I have dropped all the four patches from
> Chun-Hung, so we can figure out how to fix this.
>
> Please help to review the next version of the series.

Thanks Ulf.

Hi Chun-Hung,

On qcom controller CQE also gets reset when SDHC is reset. So we have to 
explicitly disable CQE
by invoking  cqhci_deactivate() during sdhc reset

SDHC gets reset in sdhci_setup_host() even before cqe is initialized.
With MMC_CAP2_CQE_DCMD cap set even before sdhci_set_host(), we are 
getting null pointer access with cqhci_deactivate().

If CQE getting reset with SDHC reset is generic (applicable to other 
controllers) then you have revisit your logic.
If its not the case then only qcom driver would get affected.

I see you are updating sdhci-msm.c file as-well. How about including 
below change besides your change?

@@ -1658,6 +1658,8 @@ static int sdhci_msm_cqe_add_host(struct 
sdhci_host *host,
         if (host->caps & SDHCI_CAN_64BIT)
                 host->alloc_desc_sz = 16;

+       /* Clear the CQE cap during setup host */
+       msm_host->mmc->caps2 &= ~MMC_CAP2_CQE;
+
         ret = sdhci_setup_host(host);

>>> +     if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
>>> +             host->caps2 |= MMC_CAP2_CQE_DCMD;
>>> +     }
>>>
>>>        /* Must be after "non-removable" check */
>>>        if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
> Kind regards
> Uffe
