Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703B4390905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 20:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhEYSfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 14:35:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20913 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230388AbhEYSfw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 14:35:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621967662; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wAGWZGwhPHXFsgocMwNQwb25WGwLb6HfTZos1TGO8XI=;
 b=Zd7uEZ3KlnhiVGWhjsrdUcTXlWSaexUzkJnhkUsYN4fyc1EiVVSe83dmzYBEDujGY5MWi9Zd
 iE+RX+ebolXGzbr2UEf/22MjW9cm7qx3zjUBnzX4iI5a/2n1d/T1Jizx2v8rgQP3IiF5T4o1
 EM88pC5mLMuIWpVq1Gdo0K3EJvU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60ad432967d156359aab472f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 18:34:17
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 389E4C43145; Tue, 25 May 2021 18:34:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3242AC4338A;
        Tue, 25 May 2021 18:34:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 25 May 2021 11:34:16 -0700
From:   abhinavk@codeaurora.org
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Drop unnecessary NULL checks
 after container_of
In-Reply-To: <20210525032033.453143-1-linux@roeck-us.net>
References: <20210525032033.453143-1-linux@roeck-us.net>
Message-ID: <9bc7ffae7e4b2361be337c96f5524cbe@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-24 20:20, Guenter Roeck wrote:
> The result of container_of() operations is never NULL unless the 
> embedded
> element is the first element of the structure. This is not the case 
> here.
> The NULL check on the result of container_of() is therefore unnecessary
> and misleading. Remove it.
> 
> This change was made automatically with the following Coccinelle 
> script.
> 
> @@
> type t;
> identifier v;
> statement s;
> @@
> 
> <+...
> (
>   t v = container_of(...);
> |
>   v = container_of(...);
> )
>   ...
>   when != v
> - if (\( !v \| v == NULL \) ) s
> ...+>
> 
> While at it, remove unused but assigned variable hpd in
> dp_display_usbpd_attention_cb().
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1784e119269b..a74e7ef96fcf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -208,10 +208,6 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
> 
>  	dp = container_of(g_dp_display,
>  			struct dp_display_private, dp_display);
> -	if (!dp) {
> -		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
> -		return -EINVAL;
> -	}
> 
>  	dp->dp_display.drm_dev = drm;
>  	priv = drm->dev_private;
> @@ -252,10 +248,6 @@ static void dp_display_unbind(struct device *dev,
> struct device *master,
> 
>  	dp = container_of(g_dp_display,
>  			struct dp_display_private, dp_display);
> -	if (!dp) {
> -		DRM_ERROR("Invalid DP driver data\n");
> -		return;
> -	}
> 
>  	dp_power_client_deinit(dp->power);
>  	dp_aux_unregister(dp->aux);
> @@ -406,11 +398,6 @@ static int dp_display_usbpd_configure_cb(struct
> device *dev)
> 
>  	dp = container_of(g_dp_display,
>  			struct dp_display_private, dp_display);
> -	if (!dp) {
> -		DRM_ERROR("no driver data found\n");
> -		rc = -ENODEV;
> -		goto end;
> -	}
> 
>  	dp_display_host_init(dp, false);
> 
> @@ -437,11 +424,6 @@ static int dp_display_usbpd_disconnect_cb(struct
> device *dev)
> 
>  	dp = container_of(g_dp_display,
>  			struct dp_display_private, dp_display);
> -	if (!dp) {
> -		DRM_ERROR("no driver data found\n");
> -		rc = -ENODEV;
> -		return rc;
> -	}
> 
>  	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> 
> @@ -502,7 +484,6 @@ static int dp_display_usbpd_attention_cb(struct 
> device *dev)
>  	int rc = 0;
>  	u32 sink_request;
>  	struct dp_display_private *dp;
> -	struct dp_usbpd *hpd;
> 
>  	if (!dev) {
>  		DRM_ERROR("invalid dev\n");
> @@ -511,12 +492,6 @@ static int dp_display_usbpd_attention_cb(struct
> device *dev)
> 
>  	dp = container_of(g_dp_display,
>  			struct dp_display_private, dp_display);
> -	if (!dp) {
> -		DRM_ERROR("no driver data found\n");
> -		return -ENODEV;
> -	}
> -
> -	hpd = dp->usbpd;
> 
>  	/* check for any test request issued by sink */
>  	rc = dp_link_process_request(dp->link);
