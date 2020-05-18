Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B341D77A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 13:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgERLps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 07:45:48 -0400
Received: from mga02.intel.com ([134.134.136.20]:8571 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgERLps (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 07:45:48 -0400
IronPort-SDR: 86wQlj8NtQSR9yC4+rAi3+XkfMrLKWqNiNeXkNmX273DC+31JvTjgChQ7DGhuxWEiddsSqzVcz
 /uaF4qBkyakA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 04:45:47 -0700
IronPort-SDR: fMp6Jh4c9tB5sz7JoIjbV5D9Mt6F+z2/CjIhsUUTUpDYYlNIkaUHc+Z+WgzA4GSyxrjPDjwB+x
 KZkpAQS/bF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="267492215"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.157]) ([10.237.72.157])
  by orsmga006.jf.intel.com with ESMTP; 18 May 2020 04:45:45 -0700
Subject: Re: [PATCH V1 1/2] mmc: sdhci: Introduce new quirk to use reserved
 timeout
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Sarthak Garg <sartgarg@codeaurora.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org>
 <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
 <CAPDyKFo0CabC_O-NusH4tUzjnG37_XQhY=QNhgnkQMoTokfaQg@mail.gmail.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <4db354d7-fff4-048e-dde5-647e8ba89a7d@intel.com>
Date:   Mon, 18 May 2020 14:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo0CabC_O-NusH4tUzjnG37_XQhY=QNhgnkQMoTokfaQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/05/20 12:39 pm, Ulf Hansson wrote:
> On Wed, 6 May 2020 at 15:53, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>>
>> Introduce a new quirk for letting vendor drivers to use reserved
>> timeout value (0xF) in timeout control register.
>>
>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
>> ---
>>  drivers/mmc/host/sdhci.c | 3 ++-
>>  drivers/mmc/host/sdhci.h | 5 +++++
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index 1bb6b67..07528a9 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -967,7 +967,8 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>>         }
>>
>>         if (count >= 0xF) {
>> -               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
>> +               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) ||
>> +               !(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
> 
> I don't quite get how this can make your variant use 0xF rather than 0xE?
> 
> To me it looks like an updated conditional check to print a debug message, no?

Probably need to introduce host->max_timeout_count, set it to 0xE in
sdhci_alloc_host(), and change sdhci_calc_timeout() to use it in place of
all the 0xE and 0xF constants.

> 
>>                         DBG("Too large timeout 0x%x requested for CMD%d!\n",
>>                             count, cmd->opcode);
>>                 count = 0xE;
>> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
>> index 8d2a096..02f8779 100644
>> --- a/drivers/mmc/host/sdhci.h
>> +++ b/drivers/mmc/host/sdhci.h
>> @@ -476,6 +476,11 @@ struct sdhci_host {
>>   * block count.
>>   */
>>  #define SDHCI_QUIRK2_USE_32BIT_BLK_CNT                 (1<<18)
>> +/*
>> + * Some controllers define the usage of 0xF in data timeout counter
>> + * register (0x2E) which is actually a reserved bit as per specification.
>> + */
>> +#define SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT          (1<<19)
>>
>>         int irq;                /* Device IRQ */
>>         void __iomem *ioaddr;   /* Mapped address */
>> --
>> 2.7.4
>>
> 
> Kind regards
> Uffe
> 

