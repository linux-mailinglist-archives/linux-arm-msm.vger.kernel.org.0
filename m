Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 726EB2F5157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 18:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbhAMRpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 12:45:20 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:57526 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728039AbhAMRpU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 12:45:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610559895; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vOsB4J/79wyZ5M6QDFAE82hn7FsSeNUr4X2jpE2ij1U=;
 b=VZKWlxRvwA7sHjqrCWAZFqKpvRbvOhVScMbrXWXLvI2Vkl26lflx4jW8FCeW915XYv+eihJu
 KE8rGORS1lY16P5nw8H/BvX9IFR7fZBem05ycTuK10HoUumWd3lzFtdC8+OYYKxj9BBvn3sS
 MRsRIebzxph7wtetf8RATQtuDns=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fff317a8fb3cda82f02d9b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 17:44:26
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B7C7CC433CA; Wed, 13 Jan 2021 17:44:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E9A53C433CA;
        Wed, 13 Jan 2021 17:44:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 09:44:24 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dp: postpone irq_hpd event during connection
 pending state
In-Reply-To: <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
 <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
Message-ID: <17a116011ae60194834210a4a0c877b3@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-11 11:55, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-01-07 12:30:24)
>> irq_hpd event can only be executed at connected state. Therefore
>> irq_hpd event should be postponed if it happened at connection
>> pending state. This patch also make sure both link rate and lane
> 
> Why does it happen at connection pending state?
plug in need two state to complete it.
advance to connection pending state once link training completed and 
sent uevent notification to frame work.
transition to connected state after frame work provided resolution 
timing and start transmit video panel.
Therefore irq_hpd should not be handled if it occurred before connected 
state.
> 
>> are valid before start link training.
> 
> Can this part about link rate and lane being valid be split off into
> another patch?
> 
ok, i will spilt this patch into two.
I will merge irq_hpd event part into 2nd patch (drm/msm/dp: unplug 
interrupt missed after irq_hpd handler).

>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
> 
> Any fixes tag?
> 
>>  drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 6e971d5..3bc7ed2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -693,6 +693,13 @@ static int dp_irq_hpd_handle(struct 
>> dp_display_private *dp, u32 data)
>>                 return 0;
>>         }
>> 
>> +       if (state == ST_CONNECT_PENDING) {
>> +               /* wait until ST_CONNECTED */
>> +               dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 
>> */
>> +               mutex_unlock(&dp->event_mutex);
>> +               return 0;
>> +       }
>> +
>>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>>         if (ret == -ECONNRESET) { /* cable unplugged */
>>                 dp->core_initialized = false;
