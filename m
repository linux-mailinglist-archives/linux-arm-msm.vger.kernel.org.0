Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16693392370
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 01:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbhEZX5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 19:57:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:17690 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbhEZX5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 19:57:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622073378; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Hiu2ypcR7tUPti7eowVxhYnxcS4L7xgP2ne/MPTNhIA=;
 b=mAufyWI9DweAgqy4cNxmXSTMoGd4/og70nlS+wFBv0A9U5qD6BTznnp0G8JbKiLcxKnALbwT
 +R1B6QHrgC38YTwwNQVv/4TRMrbIpWTMc1Uq55cyxuFZ5y2oWax6QNg8FX9HpiqsWTj5O3Sq
 200rtkHDe1XP8L8nUg4ZjMr20q4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60aee02214eae4d741fc8fcb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 May 2021 23:56:18
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3CA73C4338A; Wed, 26 May 2021 23:56:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5494FC433D3;
        Wed, 26 May 2021 23:56:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 26 May 2021 16:56:15 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: power off DP phy base on mainlink status at
 suspend
In-Reply-To: <CAE-0n53bGm4T7SE8sJWFgCbCs2uRYwKrXHxmKQ-0zHXQJpPKdw@mail.gmail.com>
References: <1622052503-21158-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n53bGm4T7SE8sJWFgCbCs2uRYwKrXHxmKQ-0zHXQJpPKdw@mail.gmail.com>
Message-ID: <7fc1bc954aff77ca5373caaf5fbf06a9@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-26 15:30, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-05-26 11:08:23)
>> DP mainlink can be either enabled or disabled at the time of suspend
>> happen. Therefore DP phy teared down at suspend should base on 
>> mainlink
>> status at that instance.
> 
> Please add some more details here. The system crashes if you plug in 
> the
> HDMI cable during system wide suspend. That seems to be because the DP
> phy isn't powered down during suspend if the HDMI cable is disconnected
> so we try to process the hpd plug event on the path to suspend instead
> of wait to bring up the phy and then the display?
> 
> I'm trying to find the case when we would be entering suspend and only
> have called phy_init() without calling phy_exit(). What path is that? I
> guess it is dp_ctrl_off_link_stream() called when the sink count goes 
> to
> 0? So plug in HDMI cable to apple dongle, unplug HDMI cable to apple
> dongle and phy_power_off() followed by phy_exit() followed by 
> phy_init()
> and then enter suspend so we want to call phy_exit(). Then we only call
> phy_power_off() if we've called dp_ctrl_on()? I think I followed it 
> all.
> 
ok, will do
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++++-
>>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 2 +-
>>  drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++++-
>>  3 files changed, 13 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index dbd8943..5115c05 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1398,7 +1398,7 @@ int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, 
>> bool flip, bool reset)
>>   * Perform required steps to uninitialize DP controller
>>   * and its resources.
>>   */
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
>> +void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on)
>>  {
>>         struct dp_ctrl_private *ctrl;
>>         struct dp_io *dp_io;
>> @@ -1414,6 +1414,9 @@ void dp_ctrl_host_deinit(struct dp_ctrl 
>> *dp_ctrl)
>>         phy = dp_io->phy;
>> 
>>         dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
>> +       if (mainlink_on)
>> +               phy_power_off(phy);
>> +
>>         phy_exit(phy);
>> 
>>         DRM_DEBUG_DP("Host deinitialized successfully\n");
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 25e4f75..a23ee2b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -20,7 +20,7 @@ struct dp_ctrl {
>>  };
>> 
>>  int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip, bool 
>> reset);
>> -void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
>> +void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl, bool mainlink_on);
>>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
>>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl);
>>  int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index cdec0a3..88eeeb5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -104,6 +104,8 @@ struct dp_display_private {
>> 
>>         bool encoder_mode_set;
>> 
>> +       bool mainlink_on;
>> +
> 
> Is there a reason why this can't be stashed away in dp_ctrl.c in the
> 'struct dp_ctrl'? It seems to follow closely with dp_ctrl_*() APIs.
yes, I will do that.

> 
>>         /* wait for audio signaling */
>>         struct completion audio_comp;
>> 
>> @@ -353,11 +355,14 @@ static int dp_display_process_hpd_high(struct 
>> dp_display_private *dp)
>>         dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>> 
>>         dp_link_reset_phy_params_vx_px(dp->link);
>> +
>> +       dp->mainlink_on = false;
> 
> Isn't this too late to be setting it to false? i.e. it should be false
> by default, and then set to false when a dp_ctrl_off() call is made?
> 
>>         rc = dp_ctrl_on_link(dp->ctrl);
>>         if (rc) {
>>                 DRM_ERROR("failed to complete DP link training\n");
>>                 goto end;
>>         }
>> +       dp->mainlink_on = true;
>> 
>>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>> 
>> @@ -392,7 +397,7 @@ static void dp_display_host_deinit(struct 
>> dp_display_private *dp)
>>                 return;
>>         }
>> 
>> -       dp_ctrl_host_deinit(dp->ctrl);
>> +       dp_ctrl_host_deinit(dp->ctrl, dp->mainlink_on);
>>         dp_aux_deinit(dp->aux);
>>         dp_power_deinit(dp->power);
>> 
>> @@ -941,6 +946,8 @@ static int dp_display_disable(struct 
>> dp_display_private *dp, u32 data)
>>                 dp->core_initialized = false;
>>         }
>> 
>> +       dp->mainlink_on = false;
>> +
>>         dp_display->power_on = false;
>> 
>>         return 0;
> 
> It would certainly help to keep it contained to one file instead of 
> two.
agree,

