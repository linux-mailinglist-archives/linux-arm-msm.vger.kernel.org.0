Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663CF42F6B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 17:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbhJOPQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 11:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhJOPQZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 11:16:25 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B17EC061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 08:14:19 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id q129so13591825oib.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 08:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=quZ1O17Nj6tEk5vtyKWLRvIh5DNX8Uj4lPwTlIzGWQw=;
        b=aIQhFQm/NkLJ23t6I1LGKxAA2oCd9MU2/bN6XV6jfImwmh+ppYqhYNoNldht+15+Qx
         +QQ9HISjF4i2pB01CClylBvmRTwbQwTccGTZ3e1+Vj3hvkLkaWySA5lRa1YulF7VCPS2
         SBbr6XgpB7s/If1gvFcitDRIJf7ruuwk/q7XfmSc1Dz/AfHE1V0dp5Bggwg2iwAFiQoi
         hkulVIKQ7hfSMKqgJWMPhABZEtQQNn6I0FqgDgnjgirHgRyORzkJXEDPE3uUu87uiCUQ
         3L3ELaaTUTEYTQUeXt00pkT+rEyADTK+uMI+YPAThHlCt4751Y6Oomb9B/kvtTEboo0S
         5WfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=quZ1O17Nj6tEk5vtyKWLRvIh5DNX8Uj4lPwTlIzGWQw=;
        b=fYUu3uCAbsOWjDjfz4psF6ilwxqGZ5O2sjXDGJHmmgQfPl5greT6daBMhb0/ARPTRE
         mmefIugT5Otxr1AtgAYDCZNiT/bxPAT2hrNgCetDdTsUGJjJ0ukL+uPqYF8Gn2iTo6O3
         Q0sppgZ7NmcXXyT4FODLhQOg/zWQYcJDCaZDIHmh7pIBTVlzPwu3P8EhqUZPT73OckVg
         uJCPw4t6NosQcxXNSj5xiCBZlRf2UsBhHmm7KMGxbjyxRlvXJ29bL/72MVsAWR+J8Q+x
         3tCzFBnQz7qRGu+cPkECJDTv+ECiL6DoQvLHIo22rJvsF/LzwNDVlicchM8yN36aFZ4/
         YaiA==
X-Gm-Message-State: AOAM5313ZKUhmPVjP1hKgFC2hQQMnMCxP2hWqIPo/YLc3x+uJYhC7JKY
        8c0rfhZGOrTw6laT/mUIwebwjA==
X-Google-Smtp-Source: ABdhPJzh0rkn7ccscflbH6xttRZOXjPgD41B7krV/aWMEBmPluKt6z2bnq88We9dafg27IakkBRoWg==
X-Received: by 2002:aca:a817:: with SMTP id r23mr9234000oie.71.1634310858773;
        Fri, 15 Oct 2021 08:14:18 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id p12sm1028572oot.29.2021.10.15.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 08:14:18 -0700 (PDT)
Date:   Fri, 15 Oct 2021 10:14:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     clew@codeaurora.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 2/6] rpmsg: glink: Deny intent request if reusable
 intent fits
Message-ID: <YWmayBrhjGB+lvbU@builder.lan>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org>
 <1596086296-28529-3-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596086296-28529-3-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jul 00:18 CDT 2020, Deepak Kumar Singh wrote:

> From: Chris Lew <clew@codeaurora.org>
> 
> In high traffic scenarios a remote may request extra intents to send
> data faster. If the work thread that handles these intent requests is
> starved of cpu time, then these requests can build up. Some remote
> procs may not be able to handle this burst of built up intent requests.
> 
> In order to prevent intent build up, deny intent requests that can be
> fulfilled by default intents that are reusable.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 2668c66..df3c608 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -734,9 +734,11 @@ static void qcom_glink_handle_rx_done(struct qcom_glink *glink,
>  static void qcom_glink_handle_intent_req(struct qcom_glink *glink,
>  					 u32 cid, size_t size)
>  {
> -	struct glink_core_rx_intent *intent;
> +	struct glink_core_rx_intent *intent = NULL;
> +	struct glink_core_rx_intent *tmp;
>  	struct glink_channel *channel;
>  	unsigned long flags;
> +	int iid;
>  
>  	spin_lock_irqsave(&glink->idr_lock, flags);
>  	channel = idr_find(&glink->rcids, cid);
> @@ -747,6 +749,19 @@ static void qcom_glink_handle_intent_req(struct qcom_glink *glink,
>  		return;
>  	}
>  
> +	spin_lock_irqsave(&channel->intent_lock, flags);
> +	idr_for_each_entry(&channel->liids, tmp, iid) {
> +		if (tmp->size >= size && tmp->reuse) {
> +			intent = tmp;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&channel->intent_lock, flags);
> +	if (intent) {
> +		qcom_glink_send_intent_req_ack(glink, channel, !!intent);

This looks reasonable, but you know that !!intent is true in this block,
and looking more at it I think the end result would look better as:

	/* Try to find a reusable intent to fit the request */
	spin_lock()
	intent = findit();
	spin_unlock()

	/* Allocate a new intent if none was found */
	if (!intent) {
		intent = qcom_glink_alloc_intent(glink, channel, size, false);
		if (intent)
			qcom_glink_advertise_intent(glink, channel, intent);
	}

	qcom_glink_send_intent_req_ack(glink, channel, !!intent);

Regards,
Bjorn

> +		return;
> +	}
> +
>  	intent = qcom_glink_alloc_intent(glink, channel, size, false);
>  	if (intent)
>  		qcom_glink_advertise_intent(glink, channel, intent);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
