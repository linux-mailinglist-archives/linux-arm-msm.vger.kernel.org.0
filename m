Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B33A02F56F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 02:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbhANBzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 20:55:54 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:58431 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729565AbhAMXr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 18:47:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610581595; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=OrIBbjvcy2CpauJvNx42vjvolQdIdZaCK1IWK1tHpYE=;
 b=Rfto1QA8X9Zx+gPE8b3x5g/11hIcgoIoREIPTyI5vFcq46TpBOzqJKOtorBa1sPYeI/o/jH4
 GF3mGx8f1M+/ToMYRKE8okKz7pwHFKvCKGQ+C5Qhj3lT0S1Yt4EAKwc2OZRDrQ65ZNGiiJDU
 gLEFNvnGeezbi4rB4TY3rDRD3zg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fff86514104d9478d676c18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 23:46:25
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1726C43462; Wed, 13 Jan 2021 23:46:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE3CDC433CA;
        Wed, 13 Jan 2021 23:46:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 13 Jan 2021 15:46:23 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dp: unplug interrupt missed after irq_hpd
 handler
In-Reply-To: <161056938760.3661239.7140156995833982843@swboyd.mtv.corp.google.com>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-3-git-send-email-khsieh@codeaurora.org>
 <161039484176.3661239.14240346276437866761@swboyd.mtv.corp.google.com>
 <e7e1e5f8808fc35a3bed9e6291c76460@codeaurora.org>
 <161056938760.3661239.7140156995833982843@swboyd.mtv.corp.google.com>
Message-ID: <e5c5c32a7a1ee655577b2121ffffb16a@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-13 12:23, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-01-13 09:48:25)
>> On 2021-01-11 11:54, Stephen Boyd wrote:
>> > Quoting Kuogee Hsieh (2021-01-07 12:30:25)
>> >> There is HPD unplug interrupts missed at scenario of an irq_hpd
>> >> followed by unplug interrupts with around 10 ms in between.
>> >> Since both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts,
>> >> irq_hpd handler should not issues either aux or sw reset to avoid
>> >> following unplug interrupt be cleared accidentally.
>> >
>> > So the problem is that we're resetting the DP aux phy in the middle of
>> > the HPD state machine transitioning states?
>> >
>> yes, after reset aux, hw clear pending hpd interrupts
>> >>
>> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> >> ---
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> index 44f0c57..9c0ce98 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>> >> @@ -190,6 +190,18 @@ int dp_catalog_aux_clear_hw_interrupts(struct
>> >> dp_catalog *dp_catalog)
>> >>         return 0;
>> >>  }
>> >>
>> >> +/**
>> >> + * dp_catalog_aux_reset() - reset AUX controller
>> >> + *
>> >> + * @aux: DP catalog structure
>> >> + *
>> >> + * return: void
>> >> + *
>> >> + * This function reset AUX controller
>> >> + *
>> >> + * NOTE: reset AUX controller will also clear any pending HPD related
>> >> interrupts
>> >> + *
>> >> + */
>> >>  void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
>> >>  {
>> >>         u32 aux_ctrl;
>> >> @@ -483,6 +495,18 @@ int dp_catalog_ctrl_set_pattern(struct dp_catalog
>> >> *dp_catalog,
>> >>         return 0;
>> >>  }
>> >>
>> >> +/**
>> >> + * dp_catalog_ctrl_reset() - reset DP controller
>> >> + *
>> >> + * @aux: DP catalog structure
>> >
>> > It's called dp_catalog though.
>> registers access are through dp_catalog_xxxx
> 
> Agreed. The variable is not called 'aux' though, it's called
> 'dp_catalog'.
> 
>> >
>> >> + *
>> >> + * return: void
>> >> + *
>> >> + * This function reset DP controller
>> >
>> > resets the
>> >
>> >> + *
>> >> + * NOTE: reset DP controller will also clear any pending HPD related
>> >> interrupts
>> >> + *
>> >> + */
>> >>  void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
> 
> Right here.

fixed at v2
> 
>> >>  {
>> >>         u32 sw_reset;
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> index e3462f5..f96c415 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> >> @@ -1296,7 +1296,8 @@ static int dp_ctrl_setup_main_link(struct
>> >> dp_ctrl_private *ctrl,
>> >>          * transitioned to PUSH_IDLE. In order to start transmitting
>> >>          * a link training pattern, we have to first do soft reset.
>> >>          */
>> >> -       dp_catalog_ctrl_reset(ctrl->catalog);
>> >> +       if (*training_step != DP_TRAINING_NONE)
>> >
>> > Can we check for the positive value instead? i.e.
>> > DP_TRAINING_1/DP_TRAINING_2
>> >
> 
> Any answer?

fixed at v2
