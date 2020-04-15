Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8871AAE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 18:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404634AbgDOQoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 12:44:01 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38566 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404569AbgDOQoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 12:44:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586969039; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=S5OWgppMszTi73VbpoM9eu/98YhTDWaVCVkdl2z9VJM=; b=TZOCBcXpWTA1sC/p16X8btaz8KeaovIweBMKakEXi0tZ5grqzqTyPOpxYv9U0tD7km9sGT/H
 wP8GcZ8xJOgE49KvyjY4wqrndhldgZIjdGfCv+BSQfsvifjzZrULiNFJCqIsgyW5QTUwYcrJ
 pr7yW2IWGdZhm4zyIUmJVGksIwk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9739b0.7ff5c5d787a0-smtp-out-n05;
 Wed, 15 Apr 2020 16:43:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 93C68C433BA; Wed, 15 Apr 2020 16:43:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.111.193.245] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCE36C433F2;
        Wed, 15 Apr 2020 16:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCE36C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH 13/21] mmc: sdhci-msm: Use OPP API to set clk/perf state
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
 <1586353607-32222-14-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrOFOLCWHu8nE4i5t=d+Ei-kcJ15_42Ft3ROSUDe5jkpw@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <3e5f8e78-7cd1-30fb-e005-78c1e7111794@codeaurora.org>
Date:   Wed, 15 Apr 2020 22:13:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFrOFOLCWHu8nE4i5t=d+Ei-kcJ15_42Ft3ROSUDe5jkpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/15/2020 7:22 PM, Ulf Hansson wrote:
> On Wed, 8 Apr 2020 at 15:48, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>> On some qualcomm SoCs we need to vote on a performance state of a power
>> domain depending on the clock rates. Hence move to using OPP api to set
>> the clock rate and performance state specified in the OPP table.
>> On platforms without an OPP table, dev_pm_opp_set_rate() is eqvivalent to
>> clk_set_rate()
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: Pradeep P V K <ppvk@codeaurora.org>
>> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>> Cc: Subhash Jadavani <subhashj@codeaurora.org>
>> Cc: linux-mmc@vger.kernel.org
> 
> This looks good to me!
> 
> However, are there any of the other patches in the series that
> $subject patch depends on - or can I apply this as a standalone mmc
> patch?

Hey Ulf, thanks for the review. I'll just need to respin these to make
sure I do not do a dev_pm_opp_of_remove_table() if dev_pm_opp_of_add_table()
isn;t successful as discussed with Viresh on another thread [1]

As for the dependencies, its only PATCH 01/21 in this series and that's
already been queued by Viresh [2]

[1] https://lkml.org/lkml/2020/4/15/18
[2] https://lkml.org/lkml/2020/4/14/98

> 
> Kind regards
> Uffe
> 
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 09ff731..d82075a 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/mmc/mmc.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/pm_opp.h>
>>   #include <linux/slab.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/regulator/consumer.h>
>> @@ -242,6 +243,7 @@ struct sdhci_msm_host {
>>          struct clk *xo_clk;     /* TCXO clk needed for FLL feature of cm_dll*/
>>          struct clk_bulk_data bulk_clks[4]; /* core, iface, cal, sleep clocks */
>>          unsigned long clk_rate;
>> +       struct opp_table *opp;
>>          struct mmc_host *mmc;
>>          bool use_14lpp_dll_reset;
>>          bool tuning_done;
>> @@ -332,7 +334,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
>>          int rc;
>>
>>          clock = msm_get_clock_rate_for_bus_mode(host, clock);
>> -       rc = clk_set_rate(core_clk, clock);
>> +       rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), clock);
>>          if (rc) {
>>                  pr_err("%s: Failed to set clock at rate %u at timing %d\n",
>>                         mmc_hostname(host->mmc), clock,
>> @@ -1963,7 +1965,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>          msm_host->bulk_clks[0].clk = clk;
>>
>>          /* Vote for maximum clock rate for maximum performance */
>> -       ret = clk_set_rate(clk, INT_MAX);
>> +       ret = dev_pm_opp_set_rate(&pdev->dev, INT_MAX);
>>          if (ret)
>>                  dev_warn(&pdev->dev, "core clock boost failed\n");
>>
>> @@ -2087,6 +2089,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>                  goto clk_disable;
>>          }
>>
>> +       msm_host->opp = dev_pm_opp_set_clkname(&pdev->dev, "core");
>> +       dev_pm_opp_of_add_table(&pdev->dev);
>> +
>>          pm_runtime_get_noresume(&pdev->dev);
>>          pm_runtime_set_active(&pdev->dev);
>>          pm_runtime_enable(&pdev->dev);
>> @@ -2109,10 +2114,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>          return 0;
>>
>>   pm_runtime_disable:
>> +       dev_pm_opp_of_remove_table(&pdev->dev);
>>          pm_runtime_disable(&pdev->dev);
>>          pm_runtime_set_suspended(&pdev->dev);
>>          pm_runtime_put_noidle(&pdev->dev);
>>   clk_disable:
>> +       dev_pm_opp_set_rate(&pdev->dev, 0);
>>          clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>>                                     msm_host->bulk_clks);
>>   bus_clk_disable:
>> @@ -2133,10 +2140,12 @@ static int sdhci_msm_remove(struct platform_device *pdev)
>>
>>          sdhci_remove_host(host, dead);
>>
>> +       dev_pm_opp_of_remove_table(&pdev->dev);
>>          pm_runtime_get_sync(&pdev->dev);
>>          pm_runtime_disable(&pdev->dev);
>>          pm_runtime_put_noidle(&pdev->dev);
>>
>> +       dev_pm_opp_set_rate(&pdev->dev, 0);
>>          clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>>                                     msm_host->bulk_clks);
>>          if (!IS_ERR(msm_host->bus_clk))
>> @@ -2151,6 +2160,7 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
>>          struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>          struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>
>> +       dev_pm_opp_set_rate(dev, 0);
>>          clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
>>                                     msm_host->bulk_clks);
>>
>> @@ -2173,9 +2183,11 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>>           * restore the SDR DLL settings when the clock is ungated.
>>           */
>>          if (msm_host->restore_dll_config && msm_host->clk_rate)
>> -               return sdhci_msm_restore_sdr_dll_config(host);
>> +               ret = sdhci_msm_restore_sdr_dll_config(host);
>>
>> -       return 0;
>> +       dev_pm_opp_set_rate(dev, msm_host->clk_rate);
>> +
>> +       return ret;
>>   }
>>
>>   static const struct dev_pm_ops sdhci_msm_pm_ops = {
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
