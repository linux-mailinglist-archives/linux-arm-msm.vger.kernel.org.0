Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19E326E966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 01:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgIQXUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 19:20:52 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:28738 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbgIQXUv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 19:20:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600384851; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T7ysh9tpMGUKbj6iCLW+ji7IKFLZoCynE1RzCH7rHBw=;
 b=MCfyIc38yKhVTdonS1VNn+dkJ3u8B5ieRKrp55tHB3OP/QSvt+bf6UEkUgv9wMFqxYh2+YXG
 wAad4f6/USjuLQiDfApzGCjd7ytnP4HzBFacpaG8ohjYG1aeOP+6m+VSj7l8kKGzxgyzzjN5
 44bVo2NizAQ1rq/kWfBhNfStK0c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f63ef527334da867808b228 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 23:20:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 79ADFC433CB; Thu, 17 Sep 2020 23:20:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82A8DC433CA;
        Thu, 17 Sep 2020 23:20:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 16:20:48 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: Sleep properly in dp_hpd_handler kthread
In-Reply-To: <20200917224425.2331583-1-swboyd@chromium.org>
References: <20200917224425.2331583-1-swboyd@chromium.org>
Message-ID: <e4dcf0230a9d2528862ce61aac0439cf@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-17 15:44, Stephen Boyd wrote:
> We shouldn't be waiting for an event here with a timeout of 100ms when
> we're not in the 'timeout' arm of the if condition. Instead we should 
> be
> sleeping in the interruptible state (S) until something happens and we
> need to wakeup. Right now this kthread is running almost all the time
> because it sleeps for 100ms, wakes up, sees there's nothing to do, and
> then starts the process all over again. Looking at top it shows up in
> the D state (uninterruptible) because it uses wait_event_timeout(). FIx
> this up.
> 
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on
> Snapdragon Chipsets")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
> 
> Based on msm-next-dp of https://gitlab.freedesktop.org/drm/msm.git
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 05a97e097edf..e175aa3fd3a9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -970,9 +970,8 @@ static int hpd_event_thread(void *data)
>  				(dp_priv->event_pndx == dp_priv->event_gndx),
>  						EVENT_TIMEOUT);
>  		} else {
> -			wait_event_timeout(dp_priv->event_q,
> -				(dp_priv->event_pndx != dp_priv->event_gndx),
> -						EVENT_TIMEOUT);
> +			wait_event_interruptible(dp_priv->event_q,
> +				(dp_priv->event_pndx != dp_priv->event_gndx));
>  		}
>  		spin_lock_irqsave(&dp_priv->event_lock, flag);
>  		todo = &dp_priv->event_list[dp_priv->event_gndx];
> 
> base-commit: 937f941ca06f2f3ab64baebf31be2c16d57ae7b8
