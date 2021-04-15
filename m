Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E53036113E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 19:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhDORl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 13:41:26 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:10506 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233395AbhDORlZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 13:41:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618508462; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1h4g4HCpxjuVIRzjGY/X9sGZ4OJArnjvLpi4gAm/6E4=;
 b=wp6HhB4r5zmwfiZtJsC8ZCFpMUQHGRKdMLJcWJ8iljinoO2Wd5cJO0rqh84YJPWkIuSuAXta
 qjKaDVpknJdFN0J1t4u2R15cMCUgPR/46MyB3oNr82OFgxaeaRQgC5kDfNxblNYgqhOgYSCP
 A17InnCKgDEW30cAQ42V0x0tnLw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60787a9e87ce1fbb56124857 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Apr 2021 17:40:46
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BF47C43462; Thu, 15 Apr 2021 17:40:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A32CFC433CA;
        Thu, 15 Apr 2021 17:40:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Apr 2021 10:40:44 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/msm/dp: initialize audio_comp when audio
 starts
In-Reply-To: <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
References: <1618434170-28302-1-git-send-email-khsieh@codeaurora.org>
 <161843536949.46595.14917924989191979850@swboyd.mtv.corp.google.com>
Message-ID: <645818ed642db192a252343199ecbcc5@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-14 14:22, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-14 14:02:50)
>> Initialize audio_comp when audio starts and wait for audio_comp at
>> dp_display_disable(). This will take care of both dongle unplugged
>> and display off (suspend) cases.
>> 
>> Changes in v2:
>> -- add dp_display_start_audio()
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Looking better. Thanks!
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 0ba71c7..8a69bcd 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -177,6 +177,14 @@ static int dp_del_event(struct dp_display_private 
>> *dp_priv, u32 event)
>> 
>>         return 0;
>>  }
>> +void dp_display_start_audio(struct msm_dp *dp_display)
> 
> Please unstick this from previous function by adding a newline above.
> 
>> +{
>> +       struct dp_display_private *dp;
>> +
>> +       dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> +
>> +       reinit_completion(&dp->audio_comp);
>> +}
>> 
>>  void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>>  {
>> @@ -648,10 +656,6 @@ static int dp_hpd_unplug_handle(struct 
>> dp_display_private *dp, u32 data)
>>         /* start sentinel checking in case of missing uevent */
>>         dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, 
>> DP_TIMEOUT_5_SECOND);
>> 
>> -       /* signal the disconnect event early to ensure proper teardown 
>> */
> 
> This doesn't need to be done early anymore? Please mention why in the
> commit text.
> 
This is my mistake, it still need signal audio here, will fix it

>> -       reinit_completion(&dp->audio_comp);
>> -       dp_display_handle_plugged_change(g_dp_display, false);
>> -
>>         dp_catalog_hpd_config_intr(dp->catalog, 
>> DP_DP_HPD_PLUG_INT_MASK |
>>                                         DP_DP_IRQ_HPD_INT_MASK, true);
>> 
>> @@ -894,7 +898,6 @@ static int dp_display_disable(struct 
>> dp_display_private *dp, u32 data)
>>         /* wait only if audio was enabled */
>>         if (dp_display->audio_enabled) {
>>                 /* signal the disconnect event */
>> -               reinit_completion(&dp->audio_comp);
>>                 dp_display_handle_plugged_change(dp_display, false);
>>                 if (!wait_for_completion_timeout(&dp->audio_comp,
>>                                 HZ * 5))
