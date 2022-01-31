Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6774A5273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 23:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbiAaWey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 17:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbiAaWex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 17:34:53 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A414C06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:34:53 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id v67so29649604oie.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/AiW+C7DZeqJuy4yRRuPpHIED4GcOdnyx11fCMvLYDI=;
        b=hp7aLllU2pxW2hZhxHXioc/rLKJNOL/HeslpwHGRdIJOR1VjwyLbb8bFukfQMGhG/y
         MLrSvXn/bBl7uT3rMpngIiN6ghMFfhODoeL8AQ7Qgyo15PG5wolAVcl3xABZF+cbRlNu
         zyyX5ZWCtPIsQVGbCJfOnwfrOQAVbz7Izvgw5K/rl7Ez9EBnL1JkkvWT/C3TqjPp2zu8
         Re8TPCz7bR2kUs8aZ9NYvf2sQmB6qo6c9lEuLXuc+1MPNYoHoczy9YXKaIEDgPzmwtzr
         im7htUza/JNaodUU4u/toE6MOHXJvjwVNPGCz/iX+kD2K0WdhBHQmU/+z7/2i8HXpBfV
         9Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/AiW+C7DZeqJuy4yRRuPpHIED4GcOdnyx11fCMvLYDI=;
        b=hBjl/B+hiWqN2PjFdDMyxZcRouNV5hopjVFouCUGKloXUka9Hypy9E9hOGDTgAPQU1
         MX8M4oxH6A6Da800TYAWP8MrodTuqZ1ykuDjqkTW/57DUA456Ecci38+Au+Fsg/1BUVh
         Yzphn4/DUoqRlHqHWdlT8kF0/PWYJ4P8g6T/Rc99ADsRmbm0uzpvEAP9G+oKdVaEsPSc
         rgCwhi1tdPoVCwVuj7py9At+tnX5ZDiUKSd5pBonuYGbzfvc4A5DsMSfRct3b8+GD3Sp
         egAWh8ys/Z0kXyS5e2MTJMEBalrL86//+5wWhUDmjNPvM/GAXH9AXp8I5+D4kF//FwEd
         rpew==
X-Gm-Message-State: AOAM530++b2dCXkRppn8QnXagkJOkn51Rt7Jvh+rLw4EZ0SWYipEYmKA
        Fch/G4/mqzS7gZTL6HBakBuqRA==
X-Google-Smtp-Source: ABdhPJynEoFBfks8TN4narXNk7Xj7cMswoQ2jUg5rebnwUFambpQVQaqHqI1OV2PneeaLG8igtr/5A==
X-Received: by 2002:a05:6808:3:: with SMTP id u3mr15649355oic.267.1643668492400;
        Mon, 31 Jan 2022 14:34:52 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bk4sm2518469oib.24.2022.01.31.14.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 14:34:51 -0800 (PST)
Date:   Mon, 31 Jan 2022 16:34:50 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/15] rpmsg: smd: Drop unnecessary condition for channel
 creation
Message-ID: <YfhkCgCGTa/kewHA@builder.lan>
References: <20220112194118.178026-1-luca@z3ntu.xyz>
 <20220112194118.178026-10-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112194118.178026-10-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 12 Jan 13:40 CST 2022, Luca Weiss wrote:

> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> RPM Firmware on variety of newer SoCs such as MSM8917 (also likely
> MSM8937, MSM8940, MSM8952), MSM8953 and on some MSM8916 devices) doesn't
> initiate opening of the SMD channel if it was previously opened by
> bootloader. This doesn't allow probing of smd-rpm driver on such devices
> because there is a check that requires RPM this behaviour.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/rpmsg/qcom_smd.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 8da1b5cb31b3..6a01ef932b01 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1280,19 +1280,13 @@ static void qcom_channel_state_worker(struct work_struct *work)
>  	unsigned long flags;
>  
>  	/*
> -	 * Register a device for any closed channel where the remote processor
> -	 * is showing interest in opening the channel.
> +	 * Register a device for any closed channel.
>  	 */
>  	spin_lock_irqsave(&edge->channels_lock, flags);
>  	list_for_each_entry(channel, &edge->channels, list) {
>  		if (channel->state != SMD_CHANNEL_CLOSED)
>  			continue;
>  
> -		remote_state = GET_RX_CHANNEL_INFO(channel, state);
> -		if (remote_state != SMD_CHANNEL_OPENING &&
> -		    remote_state != SMD_CHANNEL_OPENED)
> -			continue;

The second time you boot the modem (e.g. after a firmware crash), we
will find a whole bunch of channels here and attempt to open them in
order, but the modem will refuse to open most of them until the IPCRTR
channel has been opened and we have done the rmtfs dance - at which time
we have timed out opening a bunch of channels and things are in a broken
state.

As such, this has been proven to not work :(

Regards,
Bjorn

> -
>  		if (channel->registered)
>  			continue;
>  
> -- 
> 2.34.1
> 
