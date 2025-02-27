Return-Path: <linux-arm-msm+bounces-49679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD6A47E8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 14:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D487C3A6230
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C36C224246;
	Thu, 27 Feb 2025 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCEEYepn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B622E3F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661649; cv=none; b=uPheWES61cODZqIEVrmmcGrrN6SVmg8/iYoaK8g5lUM8rVEeU2H9xEdRSZMI5XJ0OZKn3PMRlhrQwTbQZIWikxh1MiAaGH5ygWobXAfVVpYonUBpeH1BaQie0WdL/hbWLw8eSWd2SYENyH8xapjtLrudF+n92MuOQXyr2Ft7MZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661649; c=relaxed/simple;
	bh=XL5kn7VGM3DLfqXNKKS9zls2n6nLce6SliFfWaxMstc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDw/ylnaPmdFxx//s+vy2T6j4wnH7CHf7MIXQ2IWaJK7FNrHfDBDyeG5PIX1m/V13H3auIlvLcXxyIMnpgHLsD6wyjoOYkhETGX2aMoiSZf55uGhl3L3mpPGwz6qWExdO7mWdJfP4vBJGLW4sAbR1pN/l5mMiEs+8p9FtF1I9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCEEYepn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0939c6456so1252123a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740661645; x=1741266445; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JTyMrNqruIfN80FNenPnWbn1JyAg6VWCPasiwyXp9FI=;
        b=XCEEYepnOtcYlzOvGQVa5HBoZE+sD2IyfaRSWs3zkhagsWaT5zyd9SrPWU57iI7yDy
         oq6CnHQ6jSDQjFJ8N6qJUFBk7aej0IU+7tjmB4U5lc5S7i4MZd5f5o1VB1eMbJnvwCfQ
         3RFYPZSTRBPYqzj/MH9zh9qHShLujMgrE5oYiagB4KRAD4Ju38PX6cQ2SAsSo3pWb2np
         0MQbzrhx1q3FoLb/Y3rg5DlhMAHHCWIcr335MAL1/bZJUOTTDyiU5WhpTRedGcZuT1IQ
         PMrbaORjmz9twMHU+vFd7dXET69Wj4yspxbFj/R9xM0H2DQ2gPgA0/Gh1fO1e20J8PDt
         sE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740661645; x=1741266445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTyMrNqruIfN80FNenPnWbn1JyAg6VWCPasiwyXp9FI=;
        b=rxOilC6tXTb9j1jR3vLkh8CxHBDxwPU6/jRNRu2PMkfob7z3I544wuVKuOi3x4Gjht
         vG6Ite7RiIW7ee5/eCV0LZXW265v35jlhuQnV3rPxY31iRpmHUZvDGqWyM0lqSGC5wD3
         p3zXLulR1WUujgNSR30762CY8KvJdYQY2k6vP4tZSUc7yWKc8vyGvA0hhkiPa3OasGHc
         a0h85jPBsmx+z1+yoa2V9HuxCR6dc4PcTo/cxal4pxHtVFSpWuk2n3TL7P75HhSQT7qb
         aFhu0BjWswK2/rxP1MPndlVnvd5acPU8LWy1S1niWXJ62EAL0UhsyiW+7ZafmjZChOck
         u6AA==
X-Forwarded-Encrypted: i=1; AJvYcCVhPzu4/lmWnqwQsRwMWA9KCYLsLnMGzmTGitMmYaobO19Hz2Er6ANqyBAA+QQfD/53Rx33Qm2vyl6Y9Ufq@vger.kernel.org
X-Gm-Message-State: AOJu0YwNFEdQvlb2zTZeLQKkEeE0vzf7DGiFsgvOIT7HSzCFphEiG18R
	OHUrpxgKDDDxr8IdDyDJnnhVosq5ZaAVi0wOzhCRsRL+bdr7nHS6qvTqQoi+ndg=
X-Gm-Gg: ASbGncvNMkMt2d0XKOceEr7hMVHLhYRXyAwJMsUZ8/ticwZ8UqvQ+vBBBRUJzm/qC0/
	2vY8n8HIpUv/PBMqtAX4o/AkenOfHgH9JbBPvZ16ucFQXqDqr0O7sNbFhZquyK+Wb7Y46HtWzNT
	+mds9BnSa6S7KbwHbO6BgxoXXTdWRFzDyMYnnng5l5Z4MjiEsOXce6YbMQtxPJa0WAZZE+8Xj/Y
	HoHgA3aenVBVolQQ1LPLhmKg+98cWBu+P1F9wPYOu0H2uDvCnJHiSh8Os4R3tRD2a6foGWoZM8m
	JSaPUUiClebKp854DJMyq+s=
X-Google-Smtp-Source: AGHT+IGjfWHYiaAXdrqA594SKctf+/MPGNFwOKZ2m/oLfiL1GNAvt9xOlxqJ0+a9h6IWKjELe4604Q==
X-Received: by 2002:a05:6402:2b86:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5e0b70dc05emr25956467a12.11.1740661645077;
        Thu, 27 Feb 2025 05:07:25 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a6ab7sm1071222a12.74.2025.02.27.05.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 05:07:24 -0800 (PST)
Date: Thu, 27 Feb 2025 15:07:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] backlight: pwm_bl: Read back PWM period from provider
Message-ID: <Z8BjiRjLin8jTE8j@linaro.org>
References: <20250226-pwm-bl-read-back-period-from-hw-v1-1-ccd1df656b23@linaro.org>
 <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xltamao27utfrsax2pc6mh5tthanmrqszz4k7gyw3knqkm24xp@4tydmhfh6g4j>

On 25-02-26 17:34:50, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Feb 26, 2025 at 05:31:08PM +0200, Abel Vesa wrote:
> > The current implementation assumes that the PWM provider will be able to
> > meet the requested period, but that is not always the case. Some PWM
> > providers have limited HW configuration capabilities and can only
> > provide a period that is somewhat close to the requested one. This
> > simply means that the duty cycle requested might either be above the
> > PWM's maximum value or the 100% duty cycle is never reached.
> 
> If you request a state with 100% relative duty cycle you should get 100%
> unless the hardware cannot do that. Which PWM hardware are you using?
> Which requests are you actually doing that don't match your expectation?

The PWM hardware is Qualcomm PMK8550 PMIC. The way the duty cycle is
controlled is described in the following comment found in lpg_calc_freq
of the leds-qcom-lpg driver:

/*
 * The PWM period is determined by:
 *
 *          resolution * pre_div * 2^M
 * period = --------------------------
 *                   refclk
 *
 * Resolution = 2^9 bits for PWM or
 *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution PWM
 * pre_div = {1, 3, 5, 6} and
 * M = [0..7].
 *
 * This allows for periods between 27uS and 384s for PWM channels and periods between
 * 3uS and 24576s for high resolution PWMs.
 * The PWM framework wants a period of equal or lower length than requested,
 * reject anything below minimum period.
 */

So if we request a period of 5MHz, that will not ever be reached no matter what config
is used. Instead, the 4.26 MHz is selected as closest possible.

Now, the pwm_bl is not aware of this limitation and will request duty cycle values that
go above 4.26MHz.

>  
> > This could be easily fixed if the pwm_apply*() API family would allow
> > overriding the period within the PWM state that's used for providing the
> > duty cycle. But that is currently not the case.
> 
> I don't understand what you mean here.

What I was trying to say is that the PWM generic framework currently doesn't
allow overriding the PWM state's period with one provided by the consumer,
when calling pwm_apply_might_sleep().

Also, the pwm_get_state_hw() doesn't cache the state either.

This results in always having to call pwm_get_state_hw() before calling
pwm_apply_might_sleep().

On top of that, pwm_get_state_hw() doesn't default to the cached value if the
provider doesn't implement the ->get_state() op.

Please correct me if I'm wrong about these.

> 
> > So easiest fix here is to read back the period from the PWM provider via
> > the provider's ->get_state() op, if implemented, which should provide the
> > best matched period. Do this on probe after the first ->pwm_apply() op has
> > been done, which will allow the provider to determine the best match
> > period based on available configuration knobs. From there on, the
> > backlight will use the best matched period, since the driver's internal
> > PWM state is now synced up with the one from provider.
> > [...]
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index 237d3d3f3bb1a6d713c5f6ec3198af772bf1268c..71a3e9cd8844095e85c01b194d7466978f1ca78e 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -525,6 +525,17 @@ static int pwm_backlight_probe(struct platform_device *pdev)
> >  		goto err_alloc;
> >  	}
> >  
> > +	/*
> > +	 * The actual period might differ from the requested one due to HW
> > +	 * limitations, so sync up the period with one determined by the
> > +	 * provider driver.
> > +	 */
> > +	ret = pwm_get_state_hw(pb->pwm, &pb->pwm->state);
> 
> As a consumer you're not supposed to write to &pb->pwm->state. That's a
> layer violation. Please call pwm_get_state_hw() with a struct pwm_state
> that you own and save the relevant parts in your driver data.

Yep, that is indeed wrong. Maybe making the pwm opaque might be a good idea as well.

[1] Calling pwm_get_state_hw() would be wrong if the provider doesn't implement the ->get_state(),
as I mentioned above.

But are you suggesting we replace all calls to pwm_get_state() with
pwm_get_state_hw() in pwm_bl?

I can do that, but the concern from [1] still stands.

> 
> > +	if (ret && ret != -EOPNOTSUPP) {
> > +		dev_err(&pdev->dev, "failed to get PWM HW state");
> > +		goto err_alloc;
> > +	}
> > +
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> >  
> >  	if (data->levels) {
> 
> Best regards
> Uwe

Thanks for reviewing,
Abel

