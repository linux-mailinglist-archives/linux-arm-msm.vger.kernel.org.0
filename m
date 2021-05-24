Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A57C38F16C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 18:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234136AbhEXQYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 12:24:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23839 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbhEXQYP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 12:24:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621873367; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4vyHAaYb4l1Q6HXO7hiHj8To6HZLipzt3FsV5THr0SE=;
 b=G03qKONhqfLBJYshaHZIv3zPqByC4HLrYvFFTbYM2sMppyFNwJsMS/J81yhRhXEPUFx/FcUD
 2gFg58qEu+BTmGWXnsEIra8NQNIaV/C71zkkOJLdf4IV0rK2udjvTCv8xmwVcc1DGv0BAfr6
 CHegSnEkGPOy2ZdP8a75L2iR4xs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60abd2d7b15734c8f92acdce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 16:22:47
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32044C0091D; Mon, 24 May 2021 16:22:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E288AC43149;
        Mon, 24 May 2021 16:22:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 May 2021 09:22:43 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        aravindh@codeaurora.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 2/3] drm/msm/dp: Shrink locking area of dp_aux_transfer()
In-Reply-To: <20210507212505.1224111-3-swboyd@chromium.org>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-3-swboyd@chromium.org>
Message-ID: <d941f60adcac1cd7a55e1be252e890ae@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-07 14:25, Stephen Boyd wrote:
> We don't need to hold the lock to inspect the message we're going to
> transfer, and we don't need to clear the busy flag either. Take the 
> lock
> later and bail out earlier if conditions aren't met.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 91188466cece..b49810396513 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -329,30 +329,29 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	ssize_t ret;
>  	int const aux_cmd_native_max = 16;
>  	int const aux_cmd_i2c_max = 128;
> -	struct dp_aux_private *aux = container_of(dp_aux,
> -		struct dp_aux_private, dp_aux);
> +	struct dp_aux_private *aux;
> 
> -	mutex_lock(&aux->mutex);
> +	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
>  	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & 
> DP_AUX_NATIVE_READ);
> 
>  	/* Ignore address only message */
> -	if ((msg->size == 0) || (msg->buffer == NULL)) {
> +	if (msg->size == 0 || !msg->buffer) {
>  		msg->reply = aux->native ?
>  			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
> -		ret = msg->size;
> -		goto unlock_exit;
> +		return msg->size;
>  	}
> 
>  	/* msg sanity check */
> -	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
> -		(msg->size > aux_cmd_i2c_max)) {
> +	if ((aux->native && msg->size > aux_cmd_native_max) ||
> +	    msg->size > aux_cmd_i2c_max) {
>  		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
>  			__func__, msg->size, msg->request);
> -		ret = -EINVAL;
> -		goto unlock_exit;
> +		return -EINVAL;
>  	}
> 
> +	mutex_lock(&aux->mutex);
> +
>  	dp_aux_update_offset_and_segment(aux, msg);
>  	dp_aux_transfer_helper(aux, msg, true);
