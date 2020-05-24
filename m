Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0C1E0047
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 17:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387559AbgEXP5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 11:57:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:27866 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387416AbgEXP5b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 11:57:31 -0400
IronPort-SDR: 4UajMwWyB+3lwvH5nRvwV2qh/uYIMCnXrHq1AWON8Zcw6nPRQeMuKX6+NqqBFSrizLbYYerRJB
 eIfs3BUb3K9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2020 08:57:31 -0700
IronPort-SDR: hk68hYC03OPo2F0K/+T9/mfav93uypD6QB4TPh6FY6viZHHUoPktCFF8BsIqHjBkN0VlMOU9Hg
 9fESbYVajIwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,430,1583222400"; 
   d="scan'208";a="413280834"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.157]) ([10.237.72.157])
  by orsmga004.jf.intel.com with ESMTP; 24 May 2020 08:57:28 -0700
Subject: Re: [PATCH V1 1/2] mmc: sdhci: Introduce new quirk to use reserved
 timeout
To:     sartgarg@codeaurora.org, Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        linux-mmc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-mmc-owner@vger.kernel.org
References: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org>
 <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
 <CAPDyKFo0CabC_O-NusH4tUzjnG37_XQhY=QNhgnkQMoTokfaQg@mail.gmail.com>
 <4db354d7-fff4-048e-dde5-647e8ba89a7d@intel.com>
 <CAPDyKFqN8CeniJq5S9zCdYYR38DFyk0vKnCw3fi548tXvwbseg@mail.gmail.com>
 <e27745b48566d3535bd1a1a6d8dbb9c4@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <eddfacfd-ecb6-fda3-5911-48e03046b8d5@intel.com>
Date:   Sun, 24 May 2020 18:57:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e27745b48566d3535bd1a1a6d8dbb9c4@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/20 5:08 pm, sartgarg@codeaurora.org wrote:
> On 2020-05-18 18:20, Ulf Hansson wrote:
>> On Mon, 18 May 2020 at 13:45, Adrian Hunter <adrian.hunter@intel.com> wrote:
>>>
>>> On 18/05/20 12:39 pm, Ulf Hansson wrote:
>>> > On Wed, 6 May 2020 at 15:53, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>>> >>
>>> >> Introduce a new quirk for letting vendor drivers to use reserved
>>> >> timeout value (0xF) in timeout control register.
>>> >>
>>> >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>> >> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
>>> >> ---
>>> >>  drivers/mmc/host/sdhci.c | 3 ++-
>>> >>  drivers/mmc/host/sdhci.h | 5 +++++
>>> >>  2 files changed, 7 insertions(+), 1 deletion(-)
>>> >>
>>> >> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>>> >> index 1bb6b67..07528a9 100644
>>> >> --- a/drivers/mmc/host/sdhci.c
>>> >> +++ b/drivers/mmc/host/sdhci.c
>>> >> @@ -967,7 +967,8 @@ static u8 sdhci_calc_timeout(struct sdhci_host
>>> *host, struct mmc_command *cmd,
>>> >>         }
>>> >>
>>> >>         if (count >= 0xF) {
>>> >> -               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
>>> >> +               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) ||
>>> >> +               !(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
>>> >
>>> > I don't quite get how this can make your variant use 0xF rather than 0xE?
>>> >
>>> > To me it looks like an updated conditional check to print a debug
>>> message, no?
>>>
>>> Probably need to introduce host->max_timeout_count, set it to 0xE in
>>> sdhci_alloc_host(), and change sdhci_calc_timeout() to use it in place of
>>> all the 0xE and 0xF constants.
>>
>> Yep, that seems like a reasonable approach to me as well.
>>
>> [...]
>>
>> Kind regards
>> Uffe
> 
> Resending the mail again as can't see my comment on the
> https://patchwork.kernel.org/ page.
> Sorry for the mistake just want to update the logic as below.
> -               count = 0xE;
> +               if(!(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
> +                       count = 0xE;

I think it is conceptually simpler to define SDHCI constants as variables
and let vendor drivers change them if need be.  In other words, what I wrote
above.  It changes more code, but the overall result is more consistent.
