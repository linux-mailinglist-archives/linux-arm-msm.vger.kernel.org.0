Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01441DE984
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbfJUKb4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:31:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33956 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbfJUKb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:31:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so8179669wrr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fQUvlL0V3Iz6E4Ap+lDL6E5wl3Ji5YJZ7TElhvimK6s=;
        b=sNQbgSe6MW9Sf188uOBYTA+NasNjY7oDNNSVRg80tBE27c9oTBKOeTOMBhKbIfSnFo
         9fkgnUIi2Drnm02trdz8ueWMyzH7rb45BJPDAsHxAC/uVs45kb4m9g09Pvcas5OGWFzf
         DWH9vGPLNAryoDnEviIkDk+cuhXVfHBR3FK+/IkRRLTVbLQ4eRInplmskDLz0elRyE2X
         tAAQe/vc0QIYP8i8VqLixnry7C+73poCoC+aSEnJYUbKzt+ax6O/itJJr1sCUStytl3u
         gbMqKpuJQWKu/lh1fykZ1lIpc5ZxKzp1T0h77Op17uH6xYjSi9/TCYQ9yy8bIxKylSQ4
         Zq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fQUvlL0V3Iz6E4Ap+lDL6E5wl3Ji5YJZ7TElhvimK6s=;
        b=K3a9G8FnkV4TaghO86GzWsdkdUrx4M7uez7OmzxDM8stSuHP3vFdKClQTHhKGrRZQ/
         gajU6NlN3A8cwxn56jj3hb6s3PvvPFsCJz7n02lbnQdhmeD20p2nkpma9cEg6tae392r
         +is/VpmnOQ4KXvNMLzGb+Rg/VjjWFniLQSFwH3PKMvav7fOAQHpfugPvBgjqOBYR/S2Z
         RWcHYiUrXqhO3ZDM0pKLEzWTVGcpoFYDht/isu+frPosilZszqerYj9OGY9wbdczFv4L
         cAHgtD8OqwnGyJZJG4mSFiBqTPZdPH+sXLAUnvQSnlbJbaFivlHDdjfJdS+d6FqoyV7u
         L1yw==
X-Gm-Message-State: APjAAAWIZW+tUjIxJJiREIiwGoRb5/733wgXmeweLJGWnnBxH9tK0VNY
        h0i3L03HgQPxH4KfWmODftYoHWGoKZir5w==
X-Google-Smtp-Source: APXvYqyy4Oux2tNP8V/BSFAyhpaClSr0k2FeVWZej2dR57qFLk+u7vifjBbJudZPXvQKK+XBBOZNeQ==
X-Received: by 2002:adf:e702:: with SMTP id c2mr17251611wrm.70.1571653912695;
        Mon, 21 Oct 2019 03:31:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f143sm27637543wme.40.2019.10.21.03.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 03:31:52 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:31:50 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V8 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191021103150.ta7qalltldofouh4@holly.lan>
References: <1571402009-8706-1-git-send-email-kgunda@codeaurora.org>
 <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1571402009-8706-7-git-send-email-kgunda@codeaurora.org>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 06:03:29PM +0530, Kiran Gunda wrote:
> The auto string detection algorithm checks if the current WLED
> sink configuration is valid. It tries enabling every sink and
> checks if the OVP fault is observed. Based on this information
> it detects and enables the valid sink configuration.
> Auto calibration will be triggered when the OVP fault interrupts
> are seen frequently thereby it tries to fix the sink configuration.
> 
> The auto-detection also kicks in when the connected LED string
> of the display-backlight malfunctions (because of damage) and
> requires the damaged string to be turned off to prevent the
> complete panel and/or board from being damaged.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 398 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 392 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 658b1e0..b2e6754 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -193,7 +216,23 @@ static int wled_module_enable(struct wled *wled, int val)
>  				WLED3_CTRL_REG_MOD_EN,
>  				WLED3_CTRL_REG_MOD_EN_MASK,
>  				val << WLED3_CTRL_REG_MOD_EN_SHIFT);
> -	return rc;
> +	if (rc < 0)
> +		return rc;
> +
> +	if (wled->ovp_irq > 0) {
> +		if (val) {
> +			/*
> +			 * Wait for at least 10ms before enabling OVP interrupt
> +			 * after module enable so that soft start is completed.
> +			 */

Comments should not say what is does (we can read that). It should be
saying what is weird about the hardware the results in us enabling the
interrupt in an unusual way.

More like:

"The hardware generates a storm of spurious OVP interrupts during soft
start operations so defer enabling the IRQ for 10ms to ensure that
the soft start is complete."

Note that I am only guessing that is an spurious interrupt storm that
caused you to defer the interrupt enable... I don't want to have to
guess which is why I am asking for a good quality comment!


Daniel.
