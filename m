Return-Path: <linux-arm-msm+bounces-47657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B3A319F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61971188071A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 23:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9ED271803;
	Tue, 11 Feb 2025 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEl17lfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3695A27180C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 23:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739317970; cv=none; b=OB97lIrkvoS6Nsz1ilhyhEf7iym+91sg1pGuChB/lVMKUwSTJrCoB4Lzmv0RwWRc23lREwn82UZ/Lz/WBHRjd/5Ip8C1+QimEdbUzkauLy9vQLyd0j+imfzv3CzgxcEQNv0FIr/59bHi3SnxoV3QPNkVd6P9E4i6vqqQlBCyezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739317970; c=relaxed/simple;
	bh=vtPe0zxCo2kwXIx8YDxzvgLijPeDDH+fRxu5JJuuBW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BL88TjVbHEODBErzpBossy2mSvChsiXNw9a6i+DFncFMQzjQ2jSIrMlh7d8aE4TTo6bjdxoIUT2Zrj/bGNB1yCO6At+zXwCR8Fv42tUfY5ZI2OB1S1PE6JFXPi0h889JyDtO4tmcjRX7jVCnYDAdj90GDU0MLuVXgTG2tDa2SwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEl17lfI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54298ec925bso7811323e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739317966; x=1739922766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=060BUK70oyF2hRYa4NzdOQ1LYVTMQlOAYDrgLB06a/4=;
        b=GEl17lfI509BPaaTyt6f1PZvDcK6LAGfKfmoy9gZZPf+osf++d3GK36ChiRjk9/DuF
         vVgwa76jodndUJjcTjJuG41GfYkAaY5NGGwfGd7/DwIg7uGetG6W8ebZ5Br+P9y+KPno
         psMw7cbLSs7krD5MWsakt+NRPDJQetfqxjj1iDqaUHZFh9H55nlLY1RbKKmQm/vi4z2m
         KSnNtGFxMs2eeNBPS9TSRWmqvfCdC2QtWJnE+yYMdgZEsYECtzCiM7xMLi5lv6PjHEjQ
         QXDJnlFtY/imRiMOOCLx1WPOJcyrPnRW67OXT0opMmmH0PQ/O7KUk3GmdBhghY++fWfp
         TzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317966; x=1739922766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=060BUK70oyF2hRYa4NzdOQ1LYVTMQlOAYDrgLB06a/4=;
        b=RuGbm+EJ/cx1+w4/THGKqGs4E6VKdqPQeUioffqJ3CKnxVkfJZgEMaNj+vedzrXkDu
         X1HpvGwswYhJd+VoZd7FdvcnFKl6/J4qfzIklUhWNNr6hzv16yvdPBjyOK/fPIbzxhwl
         btSeHW6qfQds1SAwbHXl+AU40i7su6SEkphbWQRPfFE58aFAan5D+KBtIfxjSS+8B96J
         AkUlWhcbvmNEYOkbhIExaKpZp0QxWaix1W/LsFjqvPizznG1gMj2o8btZnnPUWhQdRHT
         gkzDmuaDDoIn51dL8NAULAlZCoN9Xk/fgRT4w+J/RmNLo6f0PnF0GE0LseFnlJprAtdr
         ptjA==
X-Forwarded-Encrypted: i=1; AJvYcCW5nLVvTrP1BeYzvNqhYaZfaWVStG0gxIqkO+lh4Vbc7EDA7bahEoLixSP0rRhVIqLtMY25Yn0AL9mc7eHu@vger.kernel.org
X-Gm-Message-State: AOJu0YwZI5AXa/7F1AHY7gtzWFG/alnn327m2SQmQAlglmcWaotKEIZt
	43ilfZLBIPGZKEPi6YsdYZDZDPa8RQGe+CZH0hxoplkJKgBZ1uBn/hc0qmn1qjw=
X-Gm-Gg: ASbGncthk7TXVhvxNDxkmTko/pNFtM+HAcLpNm6z81ClxvTxcjaQu05TTxkRfNPB8u2
	RNxs/47/aWiSq+QKmOum59qq5zEyLPltYlfEHHImu4t7zBoIlj19jhFIj9Mv7RaG+9Tpxq5h/zo
	LN6faG0eOLqUlUVfQKG3GgBl11svl2lHZoMoKvfQYcaqTKoQbSAr6mb/tUXHlFWn2iQn9QRnd81
	osZq1i1vm0Hc/RD6X4xrbclZzyeU+5op8WReUTpqIQJZmcuUUvOrvA16GQhVGQEgyPOqiowUDQq
	AYgzmGC3pxaEczYKAu0o3DCGV+tD7EECde4HsIMJW4vIIAa/xgKuz3QmWadPS4i/3s8EPqw=
X-Google-Smtp-Source: AGHT+IFQaBMd7owVglZPD32Tkbi94LwNMechqHnLhs8nTLL8DE0vygNazH/5ko+5m5MkF950qtvRDg==
X-Received: by 2002:a05:6512:10cb:b0:544:ee5:87aa with SMTP id 2adb3069b0e04-545180ea29cmr228634e87.4.1739317966198;
        Tue, 11 Feb 2025 15:52:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450ed1411dsm612626e87.97.2025.02.11.15.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:52:44 -0800 (PST)
Date: Wed, 12 Feb 2025 01:52:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
	neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	jonathan@marek.ca, jun.nie@linaro.org, fekz115@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux@mainlining.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
Message-ID: <vlni5ophwkwfbvh6zj6aqqdhyt3wwjjkv77d6fublj22zidv2d@hr4qlot72vqi>
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7aa140d-ea0d-4288-8e31-29aab9a49077@jiaxyga.com>

On Tue, Feb 11, 2025 at 09:06:19PM +0300, Danila Tikhonov wrote:
> On 2/9/25 01:09, Marijn Suijten wrote:
> > On 2025-02-03 21:14:26, Danila Tikhonov wrote:
> > > From: Eugene Lepshy <fekz115@gmail.com>
> > > 
> > > DRM DSC helper has parameters for various bpc values ​​other than 8:
> > Weird zero-width \u200b spaces here between "values" and "other", please delete
> > those.
> Thanks, I will fix it in the next version.
> > > (8/10/12/14/16).
> > > 
> > > Remove this guard.
> > > 
> > > Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > Should this patch elaborate that those "DRM DSC helper" don't have any
> > additional guarding for the values you mention either, i.e. passing 9 or 11 or
> > > 16 don't seem to be checked anywhere else either?
> There are no other bpc checks, you are right. But to be honest I don't
> really see any sense in this. Anyway, if you still want us to leave the
> current guard and just extend it with new values ​​(for example via
> switch case) - let me know.

Yes, please. Add a caselist and also a note that only 8, 10 and 12 are
valid for DSC 1.1 block. Then whoever stomps upon other bpc value will
have to extend the check, verifying DSC version.

> > And your title might have space to spell out "Bits Per Component" entirely.
> I'll fix that too.
> > > ---
> > >   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
> > >   1 file changed, 1 insertion(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 007311c21fda..d182af7bbb81 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> > >   		return -EINVAL;
> > >   	}
> > > -	if (dsc->bits_per_component != 8) {
> > > -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
> > > -		return -EOPNOTSUPP;
> > > -	}
> > > -
> > >   	dsc->simple_422 = 0;
> > >   	dsc->convert_rgb = 1;
> > >   	dsc->vbr_enable = 0;
> > This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
> > dpu_hw_dsc_config(), which has:
> > 
> > 	data |= (dsc->line_buf_depth << 3);
> > 	data |= (dsc->simple_422 << 2);
> > 	data |= (dsc->convert_rgb << 1);
> > 	data |= dsc->bits_per_component;
> > 
> > The original value of `8` would overlap with the lowest bit of line_buf_depth
> > (4th bit in `data`).  Now, the 2nd bit which will take the value from
> > convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
> > your new bpc value of 10.
> > 
> > Can you double-check that this code in DPU1 is actually valid?  I assume you
> > have tested this panel at least and it is working (worthy mention in the cover
> > letter?), this just seems like yet another mistake in the original bindings
> > (though the register always had a matching value with downstream on 8 BPC panels
> > for me).
> 
> Of course I have tested the panel and it works, I just thought it would
> be obvious. We also have tested sm7150-xiaomi-courbet, sm8450-xiaomi-cupid
> and sm8475-nothing-pong, which already have bpp = bpc = 10 panels and
> with some hack it also work without any changes to the DRM.

This is now being fixed by a separate patch.

> 
> > > @@ -1779,7 +1774,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
> > >   	drm_dsc_set_const_params(dsc);
> > >   	drm_dsc_set_rc_buf_thresh(dsc);
> > > -	/* handle only bpp = bpc = 8, pre-SCR panels */
> > > +	/* handle only pre-SCR panels */
> > >   	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
> > Good catch - this comment sounds like it's documenting a limitation of
> > this helper function, but the function does not have such limitations...
> > rc_parameters_pre_scr has values for all these combinations.
> Maybe we should remove this comment entirely?

No, the pre-SCR comment is fine.

> 
> Regards,
> Danila
> > - Marijn
> > 
> > >   	if (ret) {
> > >   		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
> > > -- 
> > > 2.48.1
> > > 

-- 
With best wishes
Dmitry

