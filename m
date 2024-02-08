Return-Path: <linux-arm-msm+bounces-10182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3684E210
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 14:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0E81F22F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 13:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132F376408;
	Thu,  8 Feb 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJE+vHof"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A871763FF
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399477; cv=none; b=mvkDD2ea+QJRGGEwNJti+xcYv2opN/rMTZPeD/CJA0CEFghyowt7man4Jpcrqn+hAtfkia/cZfTfza48K/wzodHttTuy0ouM1TZ3UnYWh/58W8qrCytP7mlZWeN3/d1thgBElu3UZyyR0MV9eMv/0o1tLeExZ3KhMwIuzMNLAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399477; c=relaxed/simple;
	bh=sLHaNsZhVrwA4g8QeNjpXSri5z5j7yj78v7VenZiXNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLSofY/TzDtbWfVqyzN27y+P00MFdsV4wmGG9bRsZk1Ckl7++AI+IvgOWG9uFF1TYg1K9QxEEtQE5Q+RL+N+8UrmSyW4+Ht5ugZbk90r55ImUg1kO7CtLOaWV3hMbgEc3GPWpnfUAn/7D34e3hw7Tw2U8iiHHBi464ep1u9NWYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJE+vHof; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso2206748a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707399473; x=1708004273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p28vv63s2/cv9zUdQKuXCFX/dJkkk/3pPlOtbrZYMXE=;
        b=IJE+vHofhGlBr+vp8qPSVHcKSUA1Ab9fBb5P0Oi4rW8PTMKrT+K1H8L4w8RIFqTJ2q
         MmPrAa0DJGXZDbYFKBfB3HkmTOXu97UL7Z6S0PrXK7V0NrSkJ8HlRufDrypU14C9BC3N
         bSs0XFsPdD4zXLEM4mxB452ckpTseQH0Gc3XUI0EvKqw7yYzGHNWCrS0CKm9sAjvEkoJ
         c/QnOrgA3XTLEsyTOvAwb5lq9C383dTylAbSZ7oGu5HHZxR29t19Ucx1j/RtHPba49Er
         XpbSfWIXXEVw99OUrJpi8eju3tk8lQlITEWve2ztWPJeydeY1MnxNKJu04AsL6QZc+3F
         5RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399473; x=1708004273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p28vv63s2/cv9zUdQKuXCFX/dJkkk/3pPlOtbrZYMXE=;
        b=Tb5YVPmPAceKE+/wx2lKgg9zzLQZt1gF6rwRHHYdDpE88BDoDYj7UCZ9yjmGXdfaTP
         pFZ+0LVXlqrET0twV8sFy8j9m7unfQyH9g1donSVprheo2UaPQI+opgFPgjTX7r4rPwH
         O0urH/ChgkFmlIumjwM6Z1hkPgMiPNvWJRvqpracyQjRFdjsstvfLT2iFRf6sCW/UvXn
         iETuCqaiUJwnP1uAXdl7ip8GuqumILUTvzLOr4DzQ5D/AUnTjmYnzoR0jkpmJ/G4Uv71
         wLUD099PdSIUnCD88v6331rZ7pqB8R84k4GZ5B6Kpu+fzV7jyDqPAUAdXGzsBcBKbxfl
         sC1Q==
X-Gm-Message-State: AOJu0YwJB+iZvpraOZmxp2etcRAheArp814S8CVc+L16MF5EyKb0ZOz5
	u4+MyIdtnXSQj25/JrAxRV7roRkKiwrvpl5AApt90kMwV360xAezg4kuQ49OgqI=
X-Google-Smtp-Source: AGHT+IGp93U2IHf7DpwYHNPt1pK52y49QAMI+oxxjZGbDXXT5TsL+pX9I6v9sXTEdNzAMlaNpb7vXg==
X-Received: by 2002:a05:6402:322:b0:561:123f:a98f with SMTP id q2-20020a056402032200b00561123fa98fmr1059559edw.24.1707399473378;
        Thu, 08 Feb 2024 05:37:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRIw9jXsWnTERowFWcTJ0k/8IDzNxP1SXRPVN3mJF3KKZEqIsZc0PMSakI45/4EZJ0p3Mgc4IhE0Ye3F2hvLSYLGrWdUJyA6cYS+kqh0dp7G4e9IbWst4U9GW9yemCzPUhZW4PpkN8ZZiSMMrzjNcVeOO+mFyO+vlX3PcQcHOT6CcFs6qsAt2iHlFU/G0x9/SqyMQM5QuHpAOLN0cvW03GUFNcuc4qux9c4/zdghGh186h537IYCtYA+Tqr4vLFHnytths282McRT+p4Oyfsu853wSYw4pBSEZNn1Je+kZdw7QjwitwhOkuuugDQMxXLddDQthywjrNS9LkHim7ZauTOpCa8cLs7EE/asP+4Inc3N0B48isV0so6q+nYdUjnDKNtDRlr/ANc18VzrIrZUhH/zDdjsUF0DTKK4G1NrvjEcCRlC6Od1inTZPw//0lHbHTkp8MJu39aatmMXowyyy3pCRKfBDa9xjQVvdKV4B/eRLwVX33eYZprycBpdniM31hbBJgU1onF180ALj47HGFPA/ez/DMepBiVbelzpbcFKzZMT77MEma4SWhdL9EHBHJ85rCpiHRZAWTZZPmxpZJdzkXEmWfo5KXfdz1RZ5FVbD0MzCQBNNFsEgJNw3CBpk0Vvfo86oOXWcIw==
Received: from linaro.org ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id ev12-20020a056402540c00b00560f611ce2bsm813058edb.10.2024.02.08.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:37:52 -0800 (PST)
Date: Thu, 8 Feb 2024 15:37:51 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
Message-ID: <ZcTZL+fls7A8O9P0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
 <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>

On 24-01-29 17:11:25, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > Add support for MDSS on X1E80100.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 455b2e3a0cdd..eddf7fdbb60a 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
> >         .highest_bank_bit = 1,
> >  };
> >
> > +static const struct msm_mdss_data x1e80100_data = {
> > +       .ubwc_enc_version = UBWC_4_0,
> > +       .ubwc_dec_version = UBWC_4_3,
> > +       .ubwc_swizzle = 6,
> > +       .ubwc_static = 1,
> > +       .highest_bank_bit = 2,
> > +       .macrotile_mode = 1,
> 
> Missing .reg_bus_bw, LGTM otherwise

Dmitry, I do not have the exact value yet.

Can I come back with a subsequent (different) patch to add it at a later stage
when I have that information?

I see no point in holding display support any further since it works
fine with the default bandwith.

If yes, I'll respin this series right away, but without the reg_bus_bw.

> 
> > +};
> > +
> >  static const struct msm_mdss_data sdm845_data = {
> >         .ubwc_enc_version = UBWC_2_0,
> >         .ubwc_dec_version = UBWC_2_0,
> > @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >         { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
> >         { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
> >         { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
> > +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
> >         {}
> >  };
> >  MODULE_DEVICE_TABLE(of, mdss_dt_match);
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

