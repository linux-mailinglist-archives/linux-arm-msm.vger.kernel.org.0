Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8713C28B1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGIRta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:49:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24555 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229491AbhGIRta (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:49:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625852806; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=e48brEJUc/f60e/npMKYIQTRdSErufGPtT0TQJcL8cA=;
 b=ONkQmIs0aLkxsLWVvG8/ZyqasaTbRnmVFKJFxQq/zeEwNex5BeE8uQrtEQ3RlPG9D4N7RBc1
 +9HVcZiQQAG6dZyFZ0BW5feU0mJAQKWU7WhPezpWoDD8r0a8JLfNRNejKEBFfk9vq9CE+97b
 MSiAAuh6fw+I24DnbR5H+Fo96r0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60e88b837b2963a282acc2e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 17:46:43
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 11DB6C4338A; Fri,  9 Jul 2021 17:46:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABE4CC433D3;
        Fri,  9 Jul 2021 17:46:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Jul 2021 10:46:41 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/msm/dp: reduce link rate if failed at link
 training 1
In-Reply-To: <CAE-0n52WyMKdQ96ji=5YLBxpndgB_CLsxscXaFexMPdLducrkQ@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-3-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52WyMKdQ96ji=5YLBxpndgB_CLsxscXaFexMPdLducrkQ@mail.gmail.com>
Message-ID: <ef24f67a334698610b7b8e607a727b5d@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 00:33, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:15)
>> Reduce link rate and re start link training if link training 1
>> failed due to loss of clock recovery done to fix Link Layer
>> CTS case 4.3.1.7.  Also only update voltage and pre-emphasis
>> swing level after link training started to fix Link Layer CTS
>> case 4.3.1.6.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 86 
>> ++++++++++++++++++++++++++--------------
>>  1 file changed, 56 insertions(+), 30 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 27fb0f0..6f8443d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -83,13 +83,6 @@ struct dp_ctrl_private {
>>         struct completion video_comp;
>>  };
>> 
>> -struct dp_cr_status {
>> -       u8 lane_0_1;
>> -       u8 lane_2_3;
>> -};
>> -
>> -#define DP_LANE0_1_CR_DONE     0x11
>> -
>>  static int dp_aux_link_configure(struct drm_dp_aux *aux,
>>                                         struct dp_link_info *link)
>>  {
>> @@ -1080,7 +1073,7 @@ static int dp_ctrl_read_link_status(struct 
>> dp_ctrl_private *ctrl,
>>  }
>> 
>>  static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>> -               struct dp_cr_status *cr, int *training_step)
>> +               u8 *cr, int *training_step)
>>  {
>>         int tries, old_v_level, ret = 0;
>>         u8 link_status[DP_LINK_STATUS_SIZE];
>> @@ -1109,8 +1102,8 @@ static int dp_ctrl_link_train_1(struct 
>> dp_ctrl_private *ctrl,
>>                 if (ret)
>>                         return ret;
>> 
>> -               cr->lane_0_1 = link_status[0];
>> -               cr->lane_2_3 = link_status[1];
>> +               cr[0] = link_status[0];
>> +               cr[1] = link_status[1];
>> 
>>                 if (drm_dp_clock_recovery_ok(link_status,
>>                         ctrl->link->link_params.num_lanes)) {
>> @@ -1188,7 +1181,7 @@ static void 
>> dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
>>  }
>> 
>>  static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>> -               struct dp_cr_status *cr, int *training_step)
>> +               u8 *cr, int *training_step)
>>  {
>>         int tries = 0, ret = 0;
>>         char pattern;
>> @@ -1204,10 +1197,6 @@ static int dp_ctrl_link_train_2(struct 
>> dp_ctrl_private *ctrl,
>>         else
>>                 pattern = DP_TRAINING_PATTERN_2;
>> 
>> -       ret = dp_ctrl_update_vx_px(ctrl);
>> -       if (ret)
>> -               return ret;
>> -
>>         ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
>>         if (ret)
>>                 return ret;
>> @@ -1220,8 +1209,8 @@ static int dp_ctrl_link_train_2(struct 
>> dp_ctrl_private *ctrl,
>>                 ret = dp_ctrl_read_link_status(ctrl, link_status);
>>                 if (ret)
>>                         return ret;
>> -               cr->lane_0_1 = link_status[0];
>> -               cr->lane_2_3 = link_status[1];
>> +               cr[0] = link_status[0];
>> +               cr[1] = link_status[1];
>> 
>>                 if (drm_dp_channel_eq_ok(link_status,
>>                         ctrl->link->link_params.num_lanes)) {
>> @@ -1241,7 +1230,7 @@ static int dp_ctrl_link_train_2(struct 
>> dp_ctrl_private *ctrl,
>>  static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private 
>> *ctrl);
>> 
>>  static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>> -               struct dp_cr_status *cr, int *training_step)
>> +               u8 *cr, int *training_step)
>>  {
>>         int ret = 0;
>>         u8 encoding = DP_SET_ANSI_8B10B;
>> @@ -1282,7 +1271,7 @@ static int dp_ctrl_link_train(struct 
>> dp_ctrl_private *ctrl,
>>  }
>> 
>>  static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>> -               struct dp_cr_status *cr, int *training_step)
>> +               u8 *cr, int *training_step)
>>  {
>>         int ret = 0;
>> 
>> @@ -1496,14 +1485,14 @@ static int 
>> dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
>>  static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>>  {
>>         int ret = 0;
>> -       struct dp_cr_status cr;
>> +       u8 cr_status[2];
>>         int training_step = DP_TRAINING_NONE;
>> 
>>         dp_ctrl_push_idle(&ctrl->dp_ctrl);
>> 
>>         ctrl->dp_ctrl.pixel_rate = 
>> ctrl->panel->dp_mode.drm_mode.clock;
>> 
>> -       ret = dp_ctrl_setup_main_link(ctrl, &cr, &training_step);
>> +       ret = dp_ctrl_setup_main_link(ctrl, cr_status, 
>> &training_step);
>>         if (ret)
>>                 goto end;
> 
> Do we need to extract the link status information from deep in these
> functions? Why not read it again when we need to?
> 
>> 
>> @@ -1634,6 +1623,41 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl 
>> *dp_ctrl)
>>         }
>>  }
>> 
>> +static bool dp_ctrl_any_lane_cr_done(struct dp_ctrl_private *ctrl,
>> +                                       u8 *cr_status)
>> +
>> +{
>> +       int i;
>> +       u8 status;
>> +       int lane = ctrl->link->link_params.num_lanes;
>> +
>> +       for (i = 0; i < lane; i++) {
>> +               status = cr_status[i / 2];
>> +               status >>= ((i % 2) * 4);
>> +               if (status & DP_LANE_CR_DONE)
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static bool dp_ctrl_any_lane_cr_lose(struct dp_ctrl_private *ctrl,
>> +                                       u8 *cr_status)
>> +{
>> +       int i;
>> +       u8 status;
>> +       int lane = ctrl->link->link_params.num_lanes;
>> +
>> +       for (i = 0; i < lane; i++) {
>> +               status = cr_status[i / 2];
>> +               status >>= ((i % 2) * 4);
>> +               if (!(status & DP_LANE_CR_DONE))
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
> 
> Why not use !drm_dp_clock_recovery_ok() for dp_ctrl_any_lane_cr_lose()?
ok,

> And then move dp_ctrl_any_lane_cr_done() next to
> drm_dp_clock_recovery_ok() and call it drm_dp_clock_recovery_any_ok()?
no understand how it work, can you elaborate it more?
> 
>> +
>>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>  {
>>         int rc = 0;
>> @@ -1641,7 +1665,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>         u32 rate = 0;
>>         int link_train_max_retries = 5;
>>         u32 const phy_cts_pixel_clk_khz = 148500;
>> -       struct dp_cr_status cr;
>> +       u8 cr_status[2];
>>         unsigned int training_step;
>> 
>>         if (!dp_ctrl)
>> @@ -1681,19 +1705,18 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>                 }
>> 
>>                 training_step = DP_TRAINING_NONE;
>> -               rc = dp_ctrl_setup_main_link(ctrl, &cr, 
>> &training_step);
>> +               rc = dp_ctrl_setup_main_link(ctrl, cr_status, 
>> &training_step);
>>                 if (rc == 0) {
>>                         /* training completed successfully */
>>                         break;
>>                 } else if (training_step == DP_TRAINING_1) {
>>                         /* link train_1 failed */
>> -                       if 
>> (!dp_catalog_link_is_connected(ctrl->catalog)) {
>> +                       if 
>> (!dp_catalog_link_is_connected(ctrl->catalog))
>>                                 break;
>> -                       }
>> 
>>                         rc = dp_ctrl_link_rate_down_shift(ctrl);
>>                         if (rc < 0) { /* already in RBR = 1.6G */
>> -                               if (cr.lane_0_1 & DP_LANE0_1_CR_DONE) 
>> {
>> +                               if (dp_ctrl_any_lane_cr_done(ctrl, 
>> cr_status)) {
>>                                         /*
>>                                          * some lanes are ready,
>>                                          * reduce lane number
>> @@ -1709,12 +1732,15 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>                                 }
>>                         }
>>                 } else if (training_step == DP_TRAINING_2) {
>> -                       /* link train_2 failed, lower lane rate */
>> -                       if 
>> (!dp_catalog_link_is_connected(ctrl->catalog)) {
>> +                       /* link train_2 failed */
>> +                       if 
>> (!dp_catalog_link_is_connected(ctrl->catalog))
>>                                 break;
>> -                       }
>> 
>> -                       rc = dp_ctrl_link_lane_down_shift(ctrl);
>> +                       if (dp_ctrl_any_lane_cr_lose(ctrl, cr_status))
>> +                               rc = 
>> dp_ctrl_link_rate_down_shift(ctrl);
>> +                       else
>> +                               rc = 
>> dp_ctrl_link_lane_down_shift(ctrl);
>> +
>>                         if (rc < 0) {
>>                                 /* end with failure */
>>                                 break; /* lane == 1 already */
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
