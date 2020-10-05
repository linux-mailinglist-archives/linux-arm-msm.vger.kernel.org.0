Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D06283DF1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 20:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgJESCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 14:02:48 -0400
Received: from z5.mailgun.us ([104.130.96.5]:52271 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbgJESCs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 14:02:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601920967; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ld9Fueldp78QECrk1tT6tf3UhOcfsqkKomFN6EN3Tjg=;
 b=sSFkkwAzlVA07ZHKrmvxhrLTJPRQJ7fzMyb1qfTfP0zA3qNPyWCp7vV/md3otfMoKZntrd5L
 uB+OsNU4pkNG8Ik49HYg0fmVId0/JlBerwqIq6BrQzsUwJr9hKPHkjc4M5YdkHiRxjPkxtO8
 F9S2/L8pQVVoFlWW1vEC7q3QlR4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f7b5fa3aad2c3cd1c8412ab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 18:02:11
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28E93C433F1; Mon,  5 Oct 2020 18:02:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47ACAC433C8;
        Mon,  5 Oct 2020 18:02:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 05 Oct 2020 11:02:10 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, tanmay@codeaurora.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: fixes wrong connection state caused by
 failure of link train
In-Reply-To: <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
References: <20201002220919.17245-1-khsieh@codeaurora.org>
 <160169114309.310579.5033839844955785761@swboyd.mtv.corp.google.com>
Message-ID: <0de13a805820e4d73b8f906682386845@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-02 19:12, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2020-10-02 15:09:19)
>> Connection state is set incorrectly happen at either failure of link 
>> train
>> or cable plugged in while suspended. This patch fixes these problems.
>> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Any Fixes: tag?
> 
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 52 
>> ++++++++++++++---------------
>>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++
>>  2 files changed, 31 insertions(+), 26 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 431dff9de797..898c6cc1643a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -340,8 +340,6 @@ static int dp_display_process_hpd_high(struct 
>> dp_display_private *dp)
>>         }
>> 
>>         dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
>> -
>> -
>>  end:
>>         return rc;
>>  }
> 
> Not sure we need this hunk
> 
>> @@ -1186,19 +1180,19 @@ static int dp_pm_resume(struct device *dev)
>> 
>>         dp = container_of(dp_display, struct dp_display_private, 
>> dp_display);
>> 
>> +       /* start from dis connection state */
> 
> disconnection? Or disconnected state?
> 
>> +       atomic_set(&dp->hpd_state, ST_DISCONNECTED);
>> +
>>         dp_display_host_init(dp);
>> 
>>         dp_catalog_ctrl_hpd_config(dp->catalog);
>> 
>>         status = dp_catalog_hpd_get_state_status(dp->catalog);
>> 
>> -       if (status) {
>> +       if (status)
>>                 dp->dp_display.is_connected = true;
>> -       } else {
>> +       else
>>                 dp->dp_display.is_connected = false;
>> -               /* make sure next resume host_init be called */
>> -               dp->core_initialized = false;
>> -       }
>> 
>>         return 0;
>>  }
>> @@ -1214,6 +1208,9 @@ static int dp_pm_suspend(struct device *dev)
>>         if (dp_display->power_on == true)
>>                 dp_display_disable(dp, 0);
>> 
>> +       /* host_init will be called at pm_resume */
>> +       dp->core_initialized = false;
>> +
>>         atomic_set(&dp->hpd_state, ST_SUSPENDED);
>> 
>>         return 0;
>> @@ -1343,6 +1340,9 @@ int msm_dp_display_enable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>> 
>>         mutex_lock(&dp_display->event_mutex);
>> 
>> +       /* delete sentinel checking */
> 
> Stop sentinel checking?
> 
>> +       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>> +
>>         rc = dp_display_set_mode(dp, &dp_display->dp_mode);
>>         if (rc) {
>>                 DRM_ERROR("Failed to perform a mode set, rc=%d\n", 
>> rc);
>> @@ -1368,9 +1368,8 @@ int msm_dp_display_enable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>>                 dp_display_unprepare(dp);
>>         }
>> 
>> -       dp_del_event(dp_display, EV_CONNECT_PENDING_TIMEOUT);
>> -
>> -       if (state == ST_SUSPEND_PENDING)
>> +       /* manual kick off plug event to train link */
>> +       if (state == ST_DISPLAY_OFF)
>>                 dp_add_event(dp_display, EV_IRQ_HPD_INT, 0, 0);
>> 
>>         /* completed connection */
>> @@ -1402,20 +1401,21 @@ int msm_dp_display_disable(struct msm_dp *dp, 
>> struct drm_encoder *encoder)
>> 
>>         mutex_lock(&dp_display->event_mutex);
>> 
>> +       /* delete sentinel checking */
> 
> Stop sentinel checking?
> 
>> +       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> +
>>         dp_display_disable(dp_display, 0);
>> 
>>         rc = dp_display_unprepare(dp);
>>         if (rc)
>>                 DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
>> 
>> -       dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>> -
>>         state =  atomic_read(&dp_display->hpd_state);
>>         if (state == ST_DISCONNECT_PENDING) {
> 
> I don't understand the atomic nature of this hpd_state variable. Why is
> it an atomic variable? Is taking a spinlock bad? What is to prevent the
> atomic read here to not be interrupted and then this if condition check
> be invalid because the variable has been updated somewhere else?
hpd_state variable updated by multiple threads. however it was protected 
by mutex.
in theory, it should also work as u32. since it was declared as atomic 
from beginning
and it does not cause any negative effects, can we keep it as it is?

>>                 /* completed disconnection */
>>                 atomic_set(&dp_display->hpd_state, ST_DISCONNECTED);
>>         } else {
>> -               atomic_set(&dp_display->hpd_state, 
>> ST_SUSPEND_PENDING);
>> +               atomic_set(&dp_display->hpd_state, ST_DISPLAY_OFF);
