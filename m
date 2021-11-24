Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8CC45CD10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 20:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243419AbhKXTVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 14:21:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243231AbhKXTVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 14:21:10 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAADDC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 11:18:00 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id x131so3560593pfc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lRYEiY3a9ZTAs618fN+kr6u8/MAeWH9IPhTcrDyebEs=;
        b=Jwd4aaU1S34hZ8eU3YFVKMqv59/V+UpXAexAxZdzhKl6xSdlKGIpvBdmuey2W1U195
         56Q+5H8vAaCTbQwxH4ieIx/YYq3bD5F5H4795begBcCZDdbSWEvAUkc7hK2dZh3wRABM
         mxG+ifW00Ic2RYdLDjZ/x45WuTTEL3io88eZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lRYEiY3a9ZTAs618fN+kr6u8/MAeWH9IPhTcrDyebEs=;
        b=KI9yUxkXbOGfsBTACX04QZ47I92/gl47+Pcp36dvScNNKVUoHDgpBdG4COz9jWV5YQ
         hjkwt7TSJJLONc42Y1+lPvAgFo39kQ787HONcwEQzihbFKQf0RqEk9aJcqvanqkfYTN9
         +D38P8pr8Vj7a1VBK7JRJOUKBPCOEz8i0X5U1XOd8VN8mW9YX4YgN0tBuTBZc3fDbOfM
         uvnPHu9IUdT4hYS26qVJciNuh37XmhFG7iZEt7IKJpWo1bLR4TFmcfgq67Fn+oU/DrDQ
         9VSoUFyNvunTf1K3mZqKa155mLxLFrk9HGvWKM09Tk9hUU4I8SpmzpaEHJoJxexhPMCX
         OBaA==
X-Gm-Message-State: AOAM531FnPr5t/bQPWh8NITD+yYE5CBj8LOTCZvkhs/mqZGnBjdlc/G5
        TfMc9m6Rpbn1JocokDtnFLDQ9A==
X-Google-Smtp-Source: ABdhPJwiXSf0NUB07PV3do00Ol5yCyawJ0mCpxFdorKlBjH/yGbMu8iMRvnjbXI6sEYwVd+hOcx7PQ==
X-Received: by 2002:a05:6a00:26e3:b0:49f:c0ca:850e with SMTP id p35-20020a056a0026e300b0049fc0ca850emr8595057pfw.4.1637781480427;
        Wed, 24 Nov 2021 11:18:00 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d8d8:79a:9375:eb49])
        by smtp.gmail.com with UTF8SMTPSA id a3sm519742pfv.5.2021.11.24.11.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 11:18:00 -0800 (PST)
Date:   Wed, 24 Nov 2021 11:17:59 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, mathieu.poirier@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Subject: Re: [PATCH V1 2/3] rpmsg: glink: Add support to handle signals
 command
Message-ID: <YZ6P56yRP9TAtcqa@google.com>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org>
 <1633015924-881-4-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1633015924-881-4-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 09:02:03PM +0530, Deepak Kumar Singh wrote:
> Remote peripherals send signal notifications over glink with commandID 15.
> 
> Add support to send and receive the signal command and convert the signals
> from NATIVE to TIOCM while receiving and vice versa while sending.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 75 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 05533c7..384fcd2 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
>
> ...
>
> +static int qcom_glink_handle_signals(struct qcom_glink *glink,
> +				     unsigned int rcid, unsigned int sigs)
> +{
> +	struct glink_channel *channel;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&glink->idr_lock, flags);
> +	channel = idr_find(&glink->rcids, rcid);
> +	spin_unlock_irqrestore(&glink->idr_lock, flags);
> +	if (!channel) {
> +		dev_err(glink->dev, "signal for non-existing channel\n");
> +		return -EINVAL;
> +	}
> +
> +	/* convert signals from NATIVE to TIOCM */
> +	if (sigs & NATIVE_DTR_SIG)
> +		sigs |= TIOCM_DSR;
> +	if (sigs & NATIVE_CTS_SIG)
> +		sigs |= TIOCM_CTS;
> +	if (sigs & NATIVE_CD_SIG)
> +		sigs |= TIOCM_CD;
> +	if (sigs & NATIVE_RI_SIG)
> +		sigs |= TIOCM_RI;
> +	sigs &= 0x0fff;

'sigs' is only used when the channel has a signal handler, hence you could
return before the above block if there is no signal handler and remove the
condition below.

> +
> +	if (channel->ept.sig_cb)
> +		channel->ept.sig_cb(channel->ept.rpdev, channel->ept.priv, sigs);
> +
> +	return 0;
> +}
