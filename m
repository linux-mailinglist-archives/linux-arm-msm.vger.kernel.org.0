Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD7037EFEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 01:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhELXhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 May 2021 19:37:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54416 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244100AbhELXcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 May 2021 19:32:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620862263; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vn1GUprrTOTgFLsy5aDltqbfGp3QhAfUgbGNgrzy+6k=;
 b=JtNym1sC4Pf9snjmUHKBPCxGO6kQa9af8lseeRG2Dg4oniydmICiTvg27WdLe/tto2AyU/yn
 x7iZqBIaMbXnjhf3vT5KzrkLvosd6iOOgucLhvfv0vMFGEdhjQUEGuYIE8Z1N8lJI1D5olI2
 I5HXPh9m3Xp8l2dh/25P5wnqhto=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 609c65327bf557a012050395 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 May 2021 23:30:58
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 888B4C433D3; Wed, 12 May 2021 23:30:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5925C433F1;
        Wed, 12 May 2021 23:30:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 May 2021 16:30:57 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: handle irq_hpd with sink_count = 0
 correctly
In-Reply-To: <CAE-0n517Xkj=-m=gYv-FkpWGP+xC=ht8pRTtr5V8CKdrNtq9gQ@mail.gmail.com>
References: <1620840558-28684-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n517Xkj=-m=gYv-FkpWGP+xC=ht8pRTtr5V8CKdrNtq9gQ@mail.gmail.com>
Message-ID: <f259274c5b474b51d31b05845d06c55b@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-12 11:50, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-05-12 10:29:18)
>> irq_hpd interrupt should be handled after dongle plugged in and
>> before dongle unplugged. Hence irq_hpd interrupt is enabled at
>> the end of the plugin handle and disabled at the beginning of
>> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
>> handled same as the dongle unplugged which tears down the mainlink
>> and disables the phy. This patch fixes this problem by only tearing
>> down the mainlink but keeping phy enabled at irq_hpd with
>> sink_count = 0 handle so that next irq_hpe with sink_count =1 can be
>> handled by setup mainlink only.
>> 
>> Changes in v2:
>> -- add ctrl->phy_Power_count
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_catalog.c |  5 +--
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 83 
>> ++++++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +
>>  drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++-----
>>  4 files changed, 118 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index b1a9b1b..f4f53f2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -582,10 +582,9 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog 
>> *dp_catalog)
>> 
>>         u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
>> 
>> -       /* enable HPD interrupts */
>> +       /* enable HPD plug and unplug interrupts */
>>         dp_catalog_hpd_config_intr(dp_catalog,
>> -               DP_DP_HPD_PLUG_INT_MASK | DP_DP_IRQ_HPD_INT_MASK
>> -               | DP_DP_HPD_UNPLUG_INT_MASK | 
>> DP_DP_HPD_REPLUG_INT_MASK, true);
>> +               DP_DP_HPD_PLUG_INT_MASK | DP_DP_HPD_UNPLUG_INT_MASK, 
>> true);
>> 
>>         /* Configure REFTIMER and enable it */
>>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 8d59eb9..b5bed5f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -77,6 +77,8 @@ struct dp_ctrl_private {
>>         struct dp_parser *parser;
>>         struct dp_catalog *catalog;
>> 
>> +       int phy_power_count;
> 
> This is still redundant. Please restructure the code to call the power
> on/off function in one place and the init/exit function in another so
> that we don't have to reference count it.

ok, v3 patch uploaded
