Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEECE11A8C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 11:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbfLKKWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 05:22:33 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:33204
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727469AbfLKKWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 05:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576059751;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=vwcJjPcAeYtU95VIZmYe302qrrM4P5xyjn2TgM8BR0w=;
        b=pBWojAKID6t1MT70uDdU6d7tIitE2SnvRIfCmEN2GdvxaBTKywbbXFp/sUsI2xVP
        rv58o+xVcK56TL8bN0QJtZv8Td2nM6y4uCEFxjt1+fsp4d68G/heXw1uG+i6glC9K2D
        6N6xwgeRMUlJXyFew9lmSKoEEWtUjRMXG1LlnolA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576059751;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=vwcJjPcAeYtU95VIZmYe302qrrM4P5xyjn2TgM8BR0w=;
        b=WZ9kUw6yPlA8q5sNqqTuBCF2d6Gge6HgabHEng10vUZQQbJLA0pDwWbCGjTlIEXe
        EGa0ubI53SToeEgmUAXaKZx+IdjTKkbai2KzTuBF21kmUe6q9PPb9mj9v4BjTz0xVkn
        UxOl73zgLR1JfN7Xnh3ddP2pVm1UJ3PJRue2SnqA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB6CBC36ED5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH] mmc: sdhci-msm: Correct the offset and value for
 DDR_CONFIG register
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <0101016ea738eb52-8c362755-205a-4383-9181-1a867e82eeed-000000@us-west-2.amazonses.com>
 <CAPDyKFqdFc1RMNu38d7b+s2Bpr49v-w18frGsPSxsYf924HLWg@mail.gmail.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <0101016ef47b4d25-49791932-586b-456e-b9a7-6f9a6f95babf-000000@us-west-2.amazonses.com>
Date:   Wed, 11 Dec 2019 10:22:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFqdFc1RMNu38d7b+s2Bpr49v-w18frGsPSxsYf924HLWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2019.12.11-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/10/2019 3:21 PM, Ulf Hansson wrote:
> On Tue, 26 Nov 2019 at 11:19, Veerabhadrarao Badiganti
> <vbadigan@codeaurora.org> wrote:
>> The DDR_CONFIG register offset got updated after a specific
>> minor version of sdcc V4. This offset change has not been properly
>> taken care of while updating register changes for sdcc V5.
>>
>> Correcting proper offset for this register.
>> Also updating this register value to reflect the recommended RCLK
>> delay.
>>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> I have applied this for fixes, however it seems like this should also
> be tagged for stable, right?

  Thank you. Yes, I agree.

>
> Is there a specific commit this fixes or should we just find the
> version it applies to?

It fixes the bug introduced by commit:

f153588 (mmc: sdhci-msm: Define new Register address map)

>
> Kind regards
> Uffe
>
>
>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 28 +++++++++++++++++++---------
>>   1 file changed, 19 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index b75c82d..3d0bb5e 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -99,7 +99,7 @@
>>
>>   #define CORE_PWRSAVE_DLL       BIT(3)
>>
>> -#define DDR_CONFIG_POR_VAL     0x80040853
>> +#define DDR_CONFIG_POR_VAL     0x80040873
>>
>>
>>   #define INVALID_TUNING_PHASE   -1
>> @@ -148,8 +148,9 @@ struct sdhci_msm_offset {
>>          u32 core_ddr_200_cfg;
>>          u32 core_vendor_spec3;
>>          u32 core_dll_config_2;
>> +       u32 core_dll_config_3;
>> +       u32 core_ddr_config_old; /* Applicable to sdcc minor ver < 0x49 */
>>          u32 core_ddr_config;
>> -       u32 core_ddr_config_2;
>>   };
>>
>>   static const struct sdhci_msm_offset sdhci_msm_v5_offset = {
>> @@ -177,8 +178,8 @@ struct sdhci_msm_offset {
>>          .core_ddr_200_cfg = 0x224,
>>          .core_vendor_spec3 = 0x250,
>>          .core_dll_config_2 = 0x254,
>> -       .core_ddr_config = 0x258,
>> -       .core_ddr_config_2 = 0x25c,
>> +       .core_dll_config_3 = 0x258,
>> +       .core_ddr_config = 0x25c,
>>   };
>>
>>   static const struct sdhci_msm_offset sdhci_msm_mci_offset = {
>> @@ -207,8 +208,8 @@ struct sdhci_msm_offset {
>>          .core_ddr_200_cfg = 0x184,
>>          .core_vendor_spec3 = 0x1b0,
>>          .core_dll_config_2 = 0x1b4,
>> -       .core_ddr_config = 0x1b8,
>> -       .core_ddr_config_2 = 0x1bc,
>> +       .core_ddr_config_old = 0x1b8,
>> +       .core_ddr_config = 0x1bc,
>>   };
>>
>>   struct sdhci_msm_variant_ops {
>> @@ -253,6 +254,7 @@ struct sdhci_msm_host {
>>          const struct sdhci_msm_offset *offset;
>>          bool use_cdr;
>>          u32 transfer_mode;
>> +       bool updated_ddr_cfg;
>>   };
>>
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -924,8 +926,10 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>>   static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>>   {
>>          struct mmc_host *mmc = host->mmc;
>> -       u32 dll_status, config;
>> +       u32 dll_status, config, ddr_cfg_offset;
>>          int ret;
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>          const struct sdhci_msm_offset *msm_offset =
>>                                          sdhci_priv_msm_offset(host);
>>
>> @@ -938,8 +942,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>>           * bootloaders. In the future, if this changes, then the desired
>>           * values will need to be programmed appropriately.
>>           */
>> -       writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr +
>> -                       msm_offset->core_ddr_config);
>> +       if (msm_host->updated_ddr_cfg)
>> +               ddr_cfg_offset = msm_offset->core_ddr_config;
>> +       else
>> +               ddr_cfg_offset = msm_offset->core_ddr_config_old;
>> +       writel_relaxed(DDR_CONFIG_POR_VAL, host->ioaddr + ddr_cfg_offset);
>>
>>          if (mmc->ios.enhanced_strobe) {
>>                  config = readl_relaxed(host->ioaddr +
>> @@ -1899,6 +1906,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>                                  msm_offset->core_vendor_spec_capabilities0);
>>          }
>>
>> +       if (core_major == 1 && core_minor >= 0x49)
>> +               msm_host->updated_ddr_cfg = true;
>> +
>>          /*
>>           * Power on reset state may trigger power irq if previous status of
>>           * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
>> --
>> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

Thanks,

Veera

