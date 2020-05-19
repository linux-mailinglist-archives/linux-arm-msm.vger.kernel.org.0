Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5804C1D98FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbgESOIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:08:44 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:17958 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728795AbgESOIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:08:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897323; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ozo4sFFD/vkELudTAzBv4lNjvTKjz0A3Zf2SclqnVPQ=;
 b=oNAjjFbja1tTH8cTh64tffiIW8PbW4Z6EHgUkUrD1tD2wCgdFo6MhxL3T0oQpR/6JU8ycmr7
 RJUS3sYtwRgOmQPx+0jApOisOWwx7sUuKlQiCvob2iP2/BBueWEfiINjRDrzRs+95060KWbx
 gcWZyjq8k+sa33ukFopGSHZEIz8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3e858.7f2e1a8de308-smtp-out-n05;
 Tue, 19 May 2020 14:08:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3BAD8C432C2; Tue, 19 May 2020 14:08:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sartgarg)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5B52C43636;
        Tue, 19 May 2020 14:08:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 19 May 2020 19:38:23 +0530
From:   sartgarg@codeaurora.org
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        linux-mmc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-mmc-owner@vger.kernel.org
Subject: Re: [PATCH V1 1/2] mmc: sdhci: Introduce new quirk to use reserved
 timeout
In-Reply-To: <CAPDyKFqN8CeniJq5S9zCdYYR38DFyk0vKnCw3fi548tXvwbseg@mail.gmail.com>
References: <1588772671-19675-1-git-send-email-sartgarg@codeaurora.org>
 <1588772671-19675-2-git-send-email-sartgarg@codeaurora.org>
 <CAPDyKFo0CabC_O-NusH4tUzjnG37_XQhY=QNhgnkQMoTokfaQg@mail.gmail.com>
 <4db354d7-fff4-048e-dde5-647e8ba89a7d@intel.com>
 <CAPDyKFqN8CeniJq5S9zCdYYR38DFyk0vKnCw3fi548tXvwbseg@mail.gmail.com>
Message-ID: <e27745b48566d3535bd1a1a6d8dbb9c4@codeaurora.org>
X-Sender: sartgarg@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-18 18:20, Ulf Hansson wrote:
> On Mon, 18 May 2020 at 13:45, Adrian Hunter <adrian.hunter@intel.com> 
> wrote:
>> 
>> On 18/05/20 12:39 pm, Ulf Hansson wrote:
>> > On Wed, 6 May 2020 at 15:53, Sarthak Garg <sartgarg@codeaurora.org> wrote:
>> >>
>> >> Introduce a new quirk for letting vendor drivers to use reserved
>> >> timeout value (0xF) in timeout control register.
>> >>
>> >> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>> >> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
>> >> ---
>> >>  drivers/mmc/host/sdhci.c | 3 ++-
>> >>  drivers/mmc/host/sdhci.h | 5 +++++
>> >>  2 files changed, 7 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> >> index 1bb6b67..07528a9 100644
>> >> --- a/drivers/mmc/host/sdhci.c
>> >> +++ b/drivers/mmc/host/sdhci.c
>> >> @@ -967,7 +967,8 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>> >>         }
>> >>
>> >>         if (count >= 0xF) {
>> >> -               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT))
>> >> +               if (!(host->quirks2 & SDHCI_QUIRK2_DISABLE_HW_TIMEOUT) ||
>> >> +               !(host->quirks2 & SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
>> >
>> > I don't quite get how this can make your variant use 0xF rather than 0xE?
>> >
>> > To me it looks like an updated conditional check to print a debug message, no?
>> 
>> Probably need to introduce host->max_timeout_count, set it to 0xE in
>> sdhci_alloc_host(), and change sdhci_calc_timeout() to use it in place 
>> of
>> all the 0xE and 0xF constants.
> 
> Yep, that seems like a reasonable approach to me as well.
> 
> [...]
> 
> Kind regards
> Uffe

Resending the mail again as can't see my comment on the 
https://patchwork.kernel.org/ page.
Sorry for the mistake just want to update the logic as below.
-               count = 0xE;
+               if(!(host->quirks2 & 
SDHCI_QUIRK2_USE_RESERVED_MAX_TIMEOUT))
+                       count = 0xE;
