Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD07336E1D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 01:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhD1Wkb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 18:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240041AbhD1Wka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 18:40:30 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98371C06138E
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 15:39:43 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id d25so27111874oij.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NJgioqDWdKAET5WKiWO1U4XbKqCMuCFU3cGEOM7ro6o=;
        b=u/E9Gt5cg1H8iyQ0N4FUiZxddi9IEfEi3QJA9VDk2Uxia48DMRDVvWz07Tzyw4cRAy
         jvu8OaWHWcChElNul+iVWzqSfHOYI4iCVy9ZRyxNEKYys53KWsuizy50DOiWYVSotqQW
         HoZikWrXR36qEj2YJkCVrAiiqNyYgOEG6E9p9NFRNhwsiRetGkinSuL4fxcENbVPYxmL
         dXJWNysM3rbD6rvb1rBrR2Nt2bTtFAdLvh8w9n5QF4E6T/rM801pwLbw4BoWLv2WHUTB
         Qg24nLc3e+ifWGhTC/laIlMpBpQpDgVLtqncdrqNEtQvQTvbxOVP0SnWQvXRxnlq2bUA
         eWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NJgioqDWdKAET5WKiWO1U4XbKqCMuCFU3cGEOM7ro6o=;
        b=CcA5sknVuQSlG0yM/WERThsZHWUEsVYgAA9ENJh8RyRv+0FNL29xNhE82THVf0bAnJ
         kUMieIOSfpFI2/xwHUC7y6wNH3G+TECDTVqTCSKd/9vJWNCunFcDWvIruxDkE+PLVRbq
         ewX5qORcdVvs50rDlTmO2FR9qMhol8xdFq6bhO6MPT/Txu1E4wmqu1exYkWlqXQ8VEF7
         +YCZaHuMAYDU4RE6aHVjeFmtH2TSWg4aEbKA64hA3C3M3XcOQ5JkUKepcE+vcarOc8U1
         GkHQtHifjLBMje8lU5Yv8qS0Du6QpKm6/JpZVVCmT3L7p/532lF0hrC2459p+prb/Kxn
         q7pw==
X-Gm-Message-State: AOAM531ooweAb0bMxkz+WzNGWjJ5mZljIm/xTq0U8YryzjlIWKmhZCmp
        JmQ+oKNqDmXbsexFHfYslqn1qA==
X-Google-Smtp-Source: ABdhPJwD8AMHlFWkT0PEmKmxtPOG8Dya6tQD8PCReMCG0J6yux62nUtJNRQVt2iU1xRcVWvWs8Cr+g==
X-Received: by 2002:a05:6808:f8e:: with SMTP id o14mr22019998oiw.56.1619649582773;
        Wed, 28 Apr 2021 15:39:42 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j20sm313169ooc.29.2021.04.28.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 15:39:42 -0700 (PDT)
Date:   Wed, 28 Apr 2021 17:39:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Martin Botka <martin.botka1@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/4] leds: Add driver for Qualcomm LPG
Message-ID: <20210428223939.GN1908499@yoga>
References: <20201021201224.3430546-1-bjorn.andersson@linaro.org>
 <20201021201224.3430546-3-bjorn.andersson@linaro.org>
 <881fb5a3-fb51-3967-63de-a09950839855@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881fb5a3-fb51-3967-63de-a09950839855@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 18 Apr 16:54 CDT 2021, Marijn Suijten wrote:

> Hi Bjorn,
> 
> On 10/21/20 10:12 PM, Bjorn Andersson wrote:
> > The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> > PMICs from Qualcomm. It can operate on fixed parameters or based on a
> > lookup-table, altering the duty cycle over time - which provides the
> > means for e.g. hardware assisted transitions of LED brightness.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Tested-by: Luca Weiss <luca@z3ntu.xyz>
> 
> 
> Thanks for these patches.  I have tested them successfully on the Sony
> Xperia XA2 (Discovery, Nile platform) with the leds on the PM660l - feel
> free to add my Tested-by.  Should I send the configuration your way for
> inclusion in this patch, or submit them separately (either applied after, or
> included as separate patches in the next version of this series)?
> 

Thanks for testing, let's try to land this first iteration first and
then we can add PM660l and PM8150* definitions/support on top.

> > +/**
> > + * struct lpg_data - initialization data
> > + * @lut_base:		base address of LUT block
> > + * @lut_size:		number of entries in LUT
> > + * @triled_base:	base address of TRILED
> > + * @pwm_9bit_mask:	bitmask for switching from 6bit to 9bit pwm
> 
> 
> Our downstream kernel derives this from the "LPG subtype" for each distinct
> channel, read from register offset +0x5.  A value of 0xb is subtype "PWM"
> with a shift of 2, a value of 0x11 is subtype "LPG_LITE" with a shift of 4.
> Can we do the same here instead of hardcoding it for all channels in the LPG
> at once?  How should we determine if the mask is one or two bits wide, for
> the 3<<4 case?
> 

I don't see any obvious solution to the latter, so perhaps we should
just stick with defining this per compatible? Or am I reading your
suggestion wrong?

> > + * @num_channels:	number of channels in LPG
> > + * @channels:		list of channel initialization data
> > + */
> 
> > +	if (ping_pong) {
> > +		if (len % 2)
> > +			hi_pause = 0;
> > +		else
> > +			hi_pause = pattern[len + 1 / 2].delta_t;
> 
> 
> len + 1 should be wrapped in parentheses just like the reassignment to len=
> below, otherwise this is always an out of bounds read (at len + 0).
> 

Thanks for spotting this.

> > +		lo_pause = pattern[len - 1].delta_t;
> > +
> > +		len = (len + 1) / 2;
> > +	} else {
> > +		hi_pause = pattern[len - 1].delta_t;
> > +		lo_pause = 0;
> > +	}
> > +
> > +	ret = lpg_lut_store(lpg, pattern, len, &lo_idx, &hi_idx);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	for (i = 0; i < led->num_channels; i++) {
> > +		chan = led->channels[i];
> > +
> > +		chan->ramp_duration_ms = pattern[0].delta_t * len;
> 
> 
> Perhaps this could store the duration of a single step instead, since the
> only use in lpg_apply_lut_control divides it by pattern length again?
> 

Sounds like a good idea.

> > +		chan->ramp_ping_pong = ping_pong;
> > +		chan->ramp_oneshot = repeat != -1;
> > +
> > +		chan->ramp_lo_pause_ms = lo_pause;
> > +		chan->ramp_hi_pause_ms = hi_pause;
> > +
> > +		chan->pattern_lo_idx = lo_idx;
> > +		chan->pattern_hi_idx = hi_idx;
> > +	}
> > +
> > +out:
> > +	return ret;
> > +}
> 
> > +static int lpg_init_lut(struct lpg *lpg)
> > +{
> > +	const struct lpg_data *data = lpg->data;
> > +	size_t bitmap_size;
> > +
> > +	if (!data->lut_base)
> > +		return 0;
> > +
> > +	lpg->lut_base = data->lut_base;
> > +	lpg->lut_size = data->lut_size;
> > +
> > +	bitmap_size = BITS_TO_LONGS(lpg->lut_size) * sizeof(unsigned long);
> > +	lpg->lut_bitmap = devm_kzalloc(lpg->dev, bitmap_size, GFP_KERNEL);
> 
> 
> Would it be nicer to use BITS_TO_BYTES here, or otherwise devm_kcalloc(...,
> bitmap_size, sizeof(long), ...) without mutiplying with sizeof(unsigned
> long)?
> 

Yes, that's cleaner.

> > +
> > +	bitmap_clear(lpg->lut_bitmap, 0, lpg->lut_size);
> > +	return lpg->lut_bitmap ? 0 : -ENOMEM;
> > +}
> > +
> > +static int lpg_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np;
> > +	struct lpg *lpg;
> > +	int ret;
> > +	int i;
> > +
> > +	lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
> > +	if (!lpg)
> > +		return -ENOMEM;
> > +
> > +	lpg->data = of_device_get_match_data(&pdev->dev);
> > +	if (!lpg->data)
> > +		return -EINVAL;
> > +
> > +	lpg->dev = &pdev->dev;
> > +
> > +	lpg->map = dev_get_regmap(pdev->dev.parent, NULL);
> > +	if (!lpg->map) {
> > +		dev_err(&pdev->dev, "parent regmap unavailable\n");
> > +		return -ENXIO;
> > +	}
> > +
> > +	ret = lpg_init_channels(lpg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = lpg_init_triled(lpg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret = lpg_init_lut(lpg);
> > +	if (ret < 0)
> > +		return ret;
> 
> 
> How about turning these returns into dev_err_probe?  I'm not sure if that's
> the expected way to go nowadays, but having some form of logging when a
> driver fails to probe is always good to have.
> 

The intention is that each code path through these functions will either
pass or spit out an error in the log. I looked through them again and
think I cover all paths...

Thanks,
Bjorn
