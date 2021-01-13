Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF922F5165
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 18:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbhAMRtS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 12:49:18 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:53154 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728011AbhAMRtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 12:49:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610560137; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NP9L1of0mfv0VlmLgAx+c+h3tPTXbzkvkcqDPng1QsI=;
 b=N2C8SUf2PwvyhCg2xVVbeGe+jxV6KCbY+QaGyNgHxqqfYnnjODH0pwMoROSz2cwIqM7hHsTh
 eDW1WrydM+RPAWei+vazEcsKzLGNmh4gzh3Tm+zaiaVQ9DXihlnI5RxXRk9sMrPZGW3ItTek
 4cmXXFQpaZVdJnVaW+0z/LFUkQI=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fff326bc88af06107558d88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 17:48:27
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 088D7C433ED; Wed, 13 Jan 2021 17:48:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2A003C433C6;
        Wed, 13 Jan 2021 17:48:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 09:48:25 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd
 handler
In-Reply-To: <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
 <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
Message-ID: <e7e1e5f8808fc35a3bed9e6291c76460@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-11 11:54, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-01-07 12:30:25)
>> There is HPD unplug interrupts missed at scenario of an irq_hpd
>> followed by unplug interrupts with around 10 ms in between.
>> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
>> irq_hpd handler should not issues either aux or sw reset to avoid
>> following unplug interrupt be cleared accidentally.
> 
> So the problem is that we're resetting the DP aux phy in the middle of
> the HPD state machine transitioning states?
> 
yes, after reset aux, hw clear pending hpd interrupts
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c 
>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> index 44f0c57..9c0ce98 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct 
>> dp_catalog *dp_catalog)
>>         return 0;
>>  }
>> 
>> +/**
>> + * dp_catalog_aux_reset() - reset AUX controller
>> + *
>> + * @aux: DP catalog structure
>> + *
>> + * return: void
>> + *
>> + * This function reset AUX controller
>> + *
>> + * NOTE: reset AUX controller will also clear any pending HPD related 
>> interrupts
>> + *
>> + */
>>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>>  {
>>         u32 aux_ctrl;
>> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog 
>> *dp_catalog,
>>         return 0;
>>  }
>> 
>> +/**
>> + * dp_catalog_ctrl_reset() - reset DP controller
>> + *
>> + * @aux: DP catalog structure
> 
> It's called dp_catalog though.
registers access are through dp_catalog_xxxx
> 
>> + *
>> + * return: void
>> + *
>> + * This function reset DP controller
> 
> resets the
> 
>> + *
>> + * NOTE: reset DP controller will also clear any pending HPD related 
>> interrupts
>> + *
>> + */
>>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
>>  {
>>         u32 sw_reset;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index e3462f5..f96c415 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct 
>> dp_ctrl_private *ctrl,
>>          * transitioned to PUSH_IDLE. In order to start transmitting
>>          * a link training pattern, we have to first do soft reset.
>>          */
>> -       dp_catalog_ctrl_reset(ctrl->catalog);
>> +       if (*training_step != DP_TRAINING_NONE)
> 
> Can we check for the positive value instead? i.e.
> DP_TRAINING_1/DP_TRAINING_2
> 
>> +               dp_catalog_ctrl_reset(ctrl->catalog);
>> 
>>         ret = dp_ctrl_link_train(ctrl, cr, training_step);
>> 
