Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B00D4173169
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 07:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgB1GzJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 01:55:09 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:55098 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726614AbgB1GzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 01:55:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582872909; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ocx4fj9vAB5RcFI/K8qcqaNpKxontpgTVQkM0E6lBf0=; b=YV6qJRIMJvtruPaM8KnlUDYwA9MEKFPlVOo8hGGm1GIvUf2qPsIo6NAxPv0vAAd0DaFjFSMK
 joeCaFfQYXHtu222+jBH6rQ77soozKEMEB6r16IbP8MqSZeEwhT+168zuc1r/eagfq4bnKxo
 ewh7uOZmO3Og6A9w5ifVzOJVYI4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e58b93f.7ff823006228-smtp-out-n03;
 Fri, 28 Feb 2020 06:54:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E44C8C447A3; Fri, 28 Feb 2020 06:54:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.58] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sayalil)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 217EBC43383;
        Fri, 28 Feb 2020 06:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 217EBC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sayalil@codeaurora.org
Subject: Re: [PATCH RFC] mmc: sdhci-msm: Toggle fifo write clk after ungating
 sdcc clk
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        ppvk@codeaurora.org, rampraka@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org
References: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org>
 <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
 <4e4f1e44-8033-94e9-641c-a74232727895@codeaurora.org>
From:   Sayali Lokhande <sayalil@codeaurora.org>
Message-ID: <f486df9d-072e-6a39-82a8-3d21465653b3@codeaurora.org>
Date:   Fri, 28 Feb 2020 12:24:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4e4f1e44-8033-94e9-641c-a74232727895@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Veera,

On 2/24/2020 7:19 PM, Veerabhadrarao Badiganti wrote:
>
> On 2/20/2020 2:50 PM, Sayali Lokhande wrote:
>> From: Ram Prakash Gupta <rampraka@codeaurora.org>
>>
>> During GCC level clock gating of MCLK, the async FIFO
>> gets into some hang condition, such that for the next
>> transfer after MCLK ungating, first bit of CMD response
>> doesn't get written in to the FIFO. This cause the CPSM
>> to hang eventually leading to SW timeout.
>>
>> To fix the issue, toggle the FIFO write clock after
>> MCLK ungated to get the FIFO pointers and flags to
>> valid states.
>>
>> Change-Id: Ibef2d1d283ac0b6983c609a4abc98bc574d31fa6
>> Signed-off-by: Ram Prakash Gupta <rampraka@codeaurora.org>
>> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 43 
>> +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index c3a160c..eaa3e95 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -127,6 +127,8 @@
>>   #define CQHCI_VENDOR_CFG1    0xA00
>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN    (0x3 << 13)
>>   +#define RCLK_TOGGLE 0x2
>> +
>>   struct sdhci_msm_offset {
>>       u32 core_hc_mode;
>>       u32 core_mci_data_cnt;
>> @@ -1554,6 +1556,43 @@ static void __sdhci_msm_set_clock(struct 
>> sdhci_host *host, unsigned int clock)
>>       sdhci_enable_clk(host, clk);
>>   }
>>   +/*
>> + * After MCLK ugating, toggle the FIFO write clock to get
>> + * the FIFO pointers and flags to valid state.
>> + */
>> +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
>> +{
>> +    struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +    struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +    const struct sdhci_msm_offset *msm_offset =
>> +                    msm_host->offset;
>> +    struct mmc_card *card = host->mmc->card;
>> +
>> +    if (msm_host->tuning_done ||
>> +            (card && card->ext_csd.strobe_support &&
>> +            card->host->ios.enhanced_strobe)) {
>
> This issue is present on only HS400ES mode.
>
> If(host->ios.enhanced_strob) check should be sufficient, other checks 
> are not needed.
Agree, Will update.
>
>> +        /*
>> +         * set HC_REG_DLL_CONFIG_3[1] to select MCLK as
>> +         * DLL input clock
>> +         */
>> +        writel_relaxed(((readl_relaxed(host->ioaddr +
>> +            msm_offset->core_dll_config_3))
>> +            | RCLK_TOGGLE), host->ioaddr +
>> +            msm_offset->core_dll_config_3);
>> +        /* ensure above write as toggling same bit quickly */
>> +        wmb();
>> +        udelay(2);
>> +        /*
>> +         * clear HC_REG_DLL_CONFIG_3[1] to select RCLK as
>> +         * DLL input clock
>> +         */
>> +        writel_relaxed(((readl_relaxed(host->ioaddr +
>> +            msm_offset->core_dll_config_3))
>> +            & ~RCLK_TOGGLE), host->ioaddr +
>> +            msm_offset->core_dll_config_3);
>> +    }
>> +}
>> +
>>   /* sdhci_msm_set_clock - Called with (host->lock) spinlock held. */
>>   static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned 
>> int clock)
>>   {
>> @@ -2149,6 +2188,10 @@ static __maybe_unused int 
>> sdhci_msm_runtime_resume(struct device *dev)
>>                          msm_host->bulk_clks);
>>       if (ret)
>>           return ret;
>> +    if (host->mmc &&
>> +            (host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
> These checks are not needed. You can have these checks within 
> sdhci_msm_toggle_fifo_write_clk
Agree. Will update.
>> + sdhci_msm_toggle_fifo_write_clk(host);
>> +
>>       /*
>>        * Whenever core-clock is gated dynamically, it's needed to
>>        * restore the SDR DLL settings when the clock is ungated.
