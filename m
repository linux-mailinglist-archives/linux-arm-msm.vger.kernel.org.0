Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEBC3C282D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbhGIRUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:20:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35711 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229735AbhGIRT6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:19:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625851034; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xx1QWoGplZYDFvg3o09yp0wM5pDO8b7Sp2lAAG1myl8=;
 b=cFn8M4b+uqtPp8ahtvLCinktaoq+O8l80QZ1o304wqp1EGHs2PDfFb5kNqyTm+TQg+yzbGlU
 lvGWFg+cWBMof1sK0GS2PbDs6RemBZtfiAFxg73I1A7TLNqLesU7miHaLd3NPMZbmpTK/xab
 srpZbc3i6ucDcJHfftrKEvFKmGY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60e8848501dd9a9431a8c44e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 17:16:53
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8D101C43460; Fri,  9 Jul 2021 17:16:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FA01C433F1;
        Fri,  9 Jul 2021 17:16:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 09 Jul 2021 10:16:52 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/msm/dp: retrain link when loss of symbol lock
 detected
In-Reply-To: <CAE-0n51U8faPjxfFcd3uuOk27urR2rCSGhg1Kat1AO6LLixYTw@mail.gmail.com>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-8-git-send-email-khsieh@codeaurora.org>
 <CAE-0n51U8faPjxfFcd3uuOk27urR2rCSGhg1Kat1AO6LLixYTw@mail.gmail.com>
Message-ID: <e6375232222bc357897b62c1752c06d8@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-08 00:21, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-06 10:20:20)
>> Main link symbol locked is achieved at end of link training 2. Some
>> dongle main link symbol may become unlocked again if host did not end
>> link training soon enough after completion of link training 2. Host
>> have to re train main link if loss of symbol lock detected before
>> end link training so that the coming video stream can be transmitted
>> to sink properly.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> I guess this is a fix for the original driver, so it should be tagged
> with Fixes appropriately.
Actually, this is fix on patch #6 : drm/msm/dp: do not end dp link 
training until video is ready
Should i merge patch #6 and #7 together?
Or can you suggest what should I do?
> 
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 
>> ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 0cb01a9..e616ab2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1661,6 +1661,25 @@ static bool dp_ctrl_any_lane_cr_lose(struct 
>> dp_ctrl_private *ctrl,
>>         return false;
>>  }
>> 
>> +static bool dp_ctrl_loss_symbol_lock(struct dp_ctrl_private *ctrl)
>> +{
>> +       u8 link_status[6];
> 
> Can we use link_status[DP_LINK_STATUS_SIZE] instead?
> 
>> +       u8 status;
>> +       int i;
>> +       int lane = ctrl->link->link_params.num_lanes;
> 
> s/lane/num_lanes/
> 
> would make the code easier to read
> 
>> +
>> +       dp_ctrl_read_link_status(ctrl, link_status);
>> +
>> +       for (i = 0; i < lane; i++) {
>> +               status = link_status[i / 2];
>> +               status >>= ((i % 2) * 4);
>> +               if (!(status & DP_LANE_SYMBOL_LOCKED))
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>  {
>>         int rc = 0;
>> @@ -1777,6 +1796,17 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>>         return rc;
>>  }
>> 
>> +static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>> +{
>> +       int ret = 0;
> 
> Please drop init of ret.
> 
>> +       u8 cr_status[2];
>> +       int training_step = DP_TRAINING_NONE;
>> +
>> +       ret = dp_ctrl_setup_main_link(ctrl, cr_status, 
>> &training_step);
> 
> as it is assigned here.
> 
>> +
>> +       return ret;
> 
> And indeed, it could be 'return dp_ctrl_setup_main_link()' instead.
> 
>> +}
>> +
>>  int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>  {
>>         int ret = 0;
>> @@ -1802,6 +1832,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>>                 }
>>         }
>> 
>> +       /* if loss symbol lock happen, then retaining the link */
> 
> retain or retrain? The comment seems to be saying what the code says 
> "if
> loss retrain", so the comment is not very useful.
> 
>> +       if (dp_ctrl_loss_symbol_lock(ctrl))
>> +               dp_ctrl_link_retrain(ctrl);
>> +
>>         /* stop txing train pattern to end link training */
>>         dp_ctrl_clear_training_pattern(ctrl);
>> 
