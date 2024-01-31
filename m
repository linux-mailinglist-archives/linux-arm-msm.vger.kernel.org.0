Return-Path: <linux-arm-msm+bounces-9264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BEF8445B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 18:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86CEC2882DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 17:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2607212F592;
	Wed, 31 Jan 2024 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pV8hxO/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A312C539
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706720904; cv=none; b=qLxA5EUA+gvErDbpaLsJv6/Rw+jjGXqGN60RnAwmD+FFpEPqk/plQvf27elqfZa4FENllrwhZo/ZwGtSkSth6RsKrezqnEMgZZSSyG53WIuLvM3xpeo14zoJU1jub+X0Jew/f17veI52issfSa7oWhUt0KAEantjjd5lP7VwARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706720904; c=relaxed/simple;
	bh=xWgs8Rf8bDvnFcezIW6H9X4WJso9YVQGPPPhsScYyFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mssohN+6qr6CcCyHzXWf4pztYMTCMn1PMoc4o66z8sT0qsgdW+gfRoMZGbXQxbwT6Btpawqc1A190BulUNNKEz021Ej/QGOGEKz/6Le6SFr19viIOjmbUzwgNHE1D2COusG6TBCC6dhnVAAUK9eZT/GkvLlq+73VocEyVaOLRhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pV8hxO/w; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6041012c81fso6685567b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 09:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706720901; x=1707325701; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+9ppG/cDRjOPXvM/ttUkSSqu1lpu+kmdsbUzCZE3i8=;
        b=pV8hxO/wXC8Y3+L7stJGPUMdzsR/3XGhdJ+luzLDfBi8WKSdGjO+QR83K85Y6gfWWE
         gDVl8TZ5D4QPnWNd9zLZzMWSQYL3aghmN4Y1ANLKFZpHTVoh1pVJuU79b80cZam9IT3g
         SmcWtbHPZZ3lfj9yUlgl7cChm8KkNeOXChPPRowlGoDGl68A85Eux5lzsJLOS9Qcnoct
         5o+CmmAcqzXDnmPwGjHZcCv/1bc6IY4Lwa3XQWV14/qpVqeVCSPqkBnp0iSXm9JCYG9M
         iwWPwHxkFhv0Wd/uIMG6X3xvE6RCf3CYZGbekv4Klb6v9XAR9RGhun0V/yJoNLzS4ORR
         JQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706720901; x=1707325701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+9ppG/cDRjOPXvM/ttUkSSqu1lpu+kmdsbUzCZE3i8=;
        b=Gz7kOLVR815XFr6LONLh9Oylxy43u4hPBvkuOxdcEV88xugA8aNDP2A0YbyEHNcbCJ
         I2mMLK7O2W0RcyW+jnQmUuNXdqLp77WAFr+L9EavDi4vEPLBRjG+HQzzuXKqHxb9k4sa
         6edEwY8ogQqAA2O+p5kpYRnDzFe2FALGRA7HZgaKlypqLEE7iZ06XrUBvD4/cx/L/Xfo
         AXemzJ6AZWGPLQCHXhJSRvQky/q7/J8zpqhomoWA4E2mvkepybngGVCvlg0NpJY7JmZF
         QiU2cI7Hq7er64ZBBaP3Wqefr0rikEZrBjNO5QU3HRAaR5VkqCaUqoeKOnWZ0nNG5/AU
         9ypw==
X-Gm-Message-State: AOJu0Yzqusme467rdLpxI+Spmp5KjSRj36ixjjL3/bP0rCgUlpOnnUmz
	89fMYBbqjSq76TIgpvMeSFUgCczE3nX9edH3Je7tKcpcYA5Kg35SEYCgC9wGhc5IGp39Ktsk+1q
	XNtdcw54iAqws6nCXIKCp9TnFsBi9b0xYTAG3cw==
X-Google-Smtp-Source: AGHT+IEjAoxuGHt0dRHpkQSUr2ocD7zocOhX1KcS7P9exXx9WLr9h/lmNgtDKQ10CwpzLbWx6M0j/D680+qaAJX+4Kk=
X-Received: by 2002:a81:bc0b:0:b0:604:b8d:379d with SMTP id
 a11-20020a81bc0b000000b006040b8d379dmr1929231ywi.49.1706720901173; Wed, 31
 Jan 2024 09:08:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org> <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
 <Zbp9jPF2FspZEk6q@linaro.org>
In-Reply-To: <Zbp9jPF2FspZEk6q@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 19:08:09 +0200
Message-ID: <CAA8EJpqpk_W3kDtQ2=eCQ5gY0PgTcejfjifOApC-tUwAd6S4BA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into the
 port@0's endpoint first
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 19:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 24-01-29 17:08:29, Dmitry Baryshkov wrote:
> > On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > >
> > > On platforms where the endpoint used is on port@0, looking for port@1
> > > instead results in just ignoring the max link-frequencies altogether.
> > > Look at port@0 first, then, if not found, look for port@1.
> >
> > NAK. Platforms do not "use port@0". It is for the connection between
> > DPU and DP, while the link-frequencies property is for the link
> > between DP controller and the actual display.
>
> I messed up. This patch is not needed, plus the author is wrong.
>
> Will drop in the next version.
>
> Sorry about that.

No problem, don't worry.

>
> >
> > >
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > > index 7032dcc8842b..eec5b8b83f4b 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > > @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
> > >         u64 frequency = 0;
> > >         int cnt;
> > >
> > > -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > > +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> > > +
> > > +       if (!endpoint)
> > > +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > > +
> > >         if (!endpoint)
> > >                 return 0;
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry

