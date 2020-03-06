Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F5517B4FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2020 04:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgCFDim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 22:38:42 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:62489 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726251AbgCFDim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 22:38:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583465921; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xrqy1Nw8K3ed/VZmjwlPm8bWGmb9xQw2xhPR2bt2Yuo=;
 b=BvA6gLNeYhuCJStBxVePQa8Ty9ull2PReOWYIck02l0Qnndic4M66zb5TB92wnRqB1zouZ95
 p8k0svEt3fevKt4IDRtUFjbtqQTiAG/24ZK8/K0pHVIzpM/ivla2J97wzt9eMAX2EKJyGutF
 Vuou1IER68UFDyXUPBQYpidPGlk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e61c5b0.7fdbdf9d57d8-smtp-out-n01;
 Fri, 06 Mar 2020 03:38:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A290CC4479C; Fri,  6 Mar 2020 03:38:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1ED85C43383;
        Fri,  6 Mar 2020 03:38:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 05 Mar 2020 19:38:24 -0800
From:   nguyenb@codeaurora.org
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-mmc@vger.kernel.org, Asutosh Das <asutoshd@codeaurora.org>,
        cang@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [<PATCH v1> 1/4] mmc: core: Add check for NULL pointer access
In-Reply-To: <CAPDyKFrGmXj8HWNz2irUd7i8Cb77U8rLM=V91vcrWE+r7Pqeyg@mail.gmail.com>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
 <b328b981a785525b8424b4ab2197dc1ec54417d1.1582839544.git.nguyenb@codeaurora.org>
 <CAPDyKFrGmXj8HWNz2irUd7i8Cb77U8rLM=V91vcrWE+r7Pqeyg@mail.gmail.com>
Message-ID: <fd4bdb88d984a4095215347bc6e80afe@codeaurora.org>
X-Sender: nguyenb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-27 22:46, Ulf Hansson wrote:
> On Thu, 27 Feb 2020 at 23:06, Bao D. Nguyen <nguyenb@codeaurora.org> 
> wrote:
>> 
>> If the SD card is removed, the mmc_card pointer can be set to NULL
>> by the mmc_sd_remove() function. Check mmc_card pointer to avoid NULL
>> pointer access.
>> 
>> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>> ---
>>  drivers/mmc/core/bus.c  | 5 +++++
>>  drivers/mmc/core/core.c | 3 +++
>>  2 files changed, 8 insertions(+)
>> 
>> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
>> index 74de3f2..4558f51 100644
>> --- a/drivers/mmc/core/bus.c
>> +++ b/drivers/mmc/core/bus.c
>> @@ -131,6 +131,11 @@ static void mmc_bus_shutdown(struct device *dev)
>>         struct mmc_host *host = card->host;
>>         int ret;
> 
> This obviously doesn't solve anything as we have already dereferenced
> the card->host above. In other words we should hit a NULL pointer
> dereference bug then.
> 
> More exactly, how do you trigger this problem?
I am porting this fix in the older kernel version 3.4. In that version 
3.4, the pointer check was needed.
Obviously, this NULL pointer check is not helping anything here as you 
pointed out. I will remove this check and resubmit.

> 
>> 
>> +       if (!card) {
>> +               dev_dbg(dev, "%s: %s: card is NULL\n", dev_name(dev), 
>> __func__);
>> +               return;
>> +       }
>> +
>>         if (dev->driver && drv->shutdown)
>>                 drv->shutdown(card);
>> 
> 
> [...]
> 
> Kind regards
> Uffe
