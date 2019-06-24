Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC5FB51E35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 00:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfFXW0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 18:26:09 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48616 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfFXW0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 18:26:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 943936070D; Mon, 24 Jun 2019 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561415168;
        bh=xXLrVZUW84vLiT46gepdIB2NIgD+nbn9CbrTZViA3W8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Xa4GSngO0qeinbV+h+75FQ7AbcQs6yPjXQ/18SQpVHWUMTB1TRSleAk2D1y2eYvuD
         cMJYf+P0Bb+XQUy7mEwWwWowIN3pTO6rI2hOSZ44AyEZCCdWcavLAGCboa8XKzrPLN
         lqNT2KQBFepU04E1BEjxmTXyoNY2NqGQ7lVA8Ugo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id D1040602DD;
        Mon, 24 Jun 2019 22:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561415167;
        bh=xXLrVZUW84vLiT46gepdIB2NIgD+nbn9CbrTZViA3W8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UWoOJ7XMfNsrY7pS8bihXfs4tRnzpW+Mh5erh4GLvw26vjqJBMqNEySBJRYTSj3cb
         mqixmffSuUq0LPsk1NbtRjHZ/is4+QSkCpOFAtH+32VZXdnFDim3pLXF6HR5SLCpyJ
         79bbY7Kt5yByj7uRnEArstz7DDqBI/CyQW8pGwYc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 24 Jun 2019 15:26:07 -0700
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     Shubhashree Dhar <dhar@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, chandanu@codeaurora.org,
        nganji@codeaurora.org, jshekhar@codeaurora.org
Subject: Re: drm/msm/dpu: Correct dpu encoder spinlock initialization
In-Reply-To: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
References: <1561357632-15361-1-git-send-email-dhar@codeaurora.org>
Message-ID: <efade579f7ba59585b88ecb367422e5c@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-06-23 23:27, Shubhashree Dhar wrote:
> dpu encoder spinlock should be initialized during dpu encoder
> init instead of dpu encoder setup which is part of commit.
> There are chances that vblank control uses the uninitialized
> spinlock if not initialized during encoder init.
Not much can be done if someone is performing a vblank operation
before encoder_setup is done.
Can you point to the path where this lock is acquired before
the encoder_setup?

Thanks
Jeykumar S.
> 
> Change-Id: I5a18b95fa47397c834a266b22abf33a517b03a4e
> Signed-off-by: Shubhashree Dhar <dhar@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5f085b5..22938c7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2195,8 +2195,6 @@ int dpu_encoder_setup(struct drm_device *dev, 
> struct
> drm_encoder *enc,
>  	if (ret)
>  		goto fail;
> 
> -	spin_lock_init(&dpu_enc->enc_spinlock);
> -
>  	atomic_set(&dpu_enc->frame_done_timeout, 0);
>  	timer_setup(&dpu_enc->frame_done_timer,
>  			dpu_encoder_frame_done_timeout, 0);
> @@ -2250,6 +2248,7 @@ struct drm_encoder *dpu_encoder_init(struct
> drm_device *dev,
> 
>  	drm_encoder_helper_add(&dpu_enc->base, &dpu_encoder_helper_funcs);
> 
> +	spin_lock_init(&dpu_enc->enc_spinlock);
>  	dpu_enc->enabled = false;
> 
>  	return &dpu_enc->base;

-- 
Jeykumar S
