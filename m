Return-Path: <linux-arm-msm+bounces-18024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAED8AB92B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 05:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E05A02813EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 03:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EE4625;
	Sat, 20 Apr 2024 03:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izSYQl+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7146205E39
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 03:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713582432; cv=none; b=avOuaZ5MLe2eXylmhiwnhJgmCwNp8SdZcK/XGxQL3Y9hGQKfgO53Ill5Ywbi36UmbVFLxB6LQREbAWSmELcE5II5EbFG8pp/ckV5b4Rs3c5AF4+zQTggj5qw5KMhYsIIoBHfP2Mg+hQauWzsIgTaiaV7XF5M9yaGqUDgfqSM5YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713582432; c=relaxed/simple;
	bh=hIgoH/JAUqGwL3MJpNEGJmsSt1swwZJ3v06B9AciFeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxsYXqmPk48eJb8giwoxLRk85b8zmlYTbqYNT+7myQSNwa0p8axgWZRzMxvURw3qwreDaWW6bo6Xw2Jbv8wOmLtms/Hg8K19CS6hOyFZ9Vnpm0J3fVz2udS+Q/o/XUYZqIL3+Nu2tCXvjwlS/9s9B+4ipImIJFquPbBtCmgjwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izSYQl+F; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de4640ec49fso2672375276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 20:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713582430; x=1714187230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AuNvB5tC5KyVnpy2mxYeoJ+5FSs7w1BA/+1YOfbE0R4=;
        b=izSYQl+FrOV0XBYp5KcpqJ8oxvazLbw1NHj+aX8Fp3h4u94TlBEcI5Q4ESe/5Zi5jj
         KwCyJRt6CQJ49IOiO/K0TOcWXeK4YFJ7lwzZhoFqp7Y0sl7eRNBMS9h1g1NgodHO1z7E
         8CGh/5xZhjinU7nH6rRVUXzYqakE24Cl694u/BONNKHf/m3K4p8ZuAlE2Wm23KtVwh6P
         TNZuQuUOVdvNAOI75tDeSmgkEzWOr4EKUKH6Q1/RUZJWWnsDkBy8XcaGf0IWlGahSSF/
         ghIAoc8VIXOAvD63HYh0Mtz9RJ3FyFP9cVXjrHzlClgux9b/HY5FewiRY3ixVXhfm3jT
         0V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713582430; x=1714187230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuNvB5tC5KyVnpy2mxYeoJ+5FSs7w1BA/+1YOfbE0R4=;
        b=bzXUPjrlE906MiHg/2BcZ9IMj8uCZr6QZRmlWnr8lbnip7kwOgBn0HeTo/72o/fTh9
         5/JUH1tJFU5cp8MnwoloKKIKI0g3L4TYmZRXbr3OCRUJ5DmmR1y5l1sq9iG43WIsh7Bj
         PqBxg4WmRZdG/H8uGvPmK8XsWPQAYGnYjz2YkxjyBGI2XowrKm7MdGnqgwatadbZ08df
         Y5rPzaIqjvMfeumQqMfhKtM6NZkaAsCkz1sJ1a7iSv5uyLCOn3wA3JFtgEsrQUS6RuXE
         zpBTVZcAwf487EJapHe1h/d6/W0pGFA3+BgrTI7xXPhqnEleW5Oc8ce13TgG1senus+v
         3y7g==
X-Forwarded-Encrypted: i=1; AJvYcCWSKh3SfkcpSc1EHNigGLp01c4nniIOdFYWfXFqMbxyZVAIV6PnX239unedf6/LeNH3SrCFonCA9v13yu401hxuKO14F2IWQT8TOWZAJw==
X-Gm-Message-State: AOJu0YzQ7rlr/eOBpcSJ94RdCWIskXJBh52mxT4A/bn/3n1KbBfAzD/+
	pL5m2G6LxSTn7nbX/lq8QR3l+7+sj65hyjfax3IVR9+CMfkTIBKNLHj9QbtfAyn3T9m3yILuR4H
	+AEBY9pfUpQhBbRKst+Sr6u7x+k5i74NiTlfImA==
X-Google-Smtp-Source: AGHT+IH+MIRQVLV/m6V0QaT4MfHL5Lfn7YeTnxIAAE1yv4y5WDVUxLaE/vqL6ieh78YIcOnm3fe499Q3oIOI1GPnSmM=
X-Received: by 2002:a25:7410:0:b0:dcd:4878:1f9 with SMTP id
 p16-20020a257410000000b00dcd487801f9mr3770629ybc.8.1713582429923; Fri, 19 Apr
 2024 20:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-9-d0fe6bf81bf1@linaro.org> <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
In-Reply-To: <7198d419-2b46-b9e6-4404-64f86b0b54bb@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 06:06:58 +0300
Message-ID: <CAA8EJpp-oz4U5nT9gv0RtLLx0bR4g6WJdRu2Vz8tPKsZdpn-Tw@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/msm/dpu: sync mode_config limits to the FB limits
 in dpu_plane.c
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Apr 2024 at 06:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Lift mode_config limits set by the DPU driver to the actual FB limits as
> > handled by the dpu_plane.c.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 9 ++-------
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 7257ac4020d8..e7dda9eca466 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1136,13 +1136,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >       dev->mode_config.min_width = 0;
> >       dev->mode_config.min_height = 0;
> >
> > -     /*
> > -      * max crtc width is equal to the max mixer width * 2 and max height is
> > -      * is 4K
> > -      */
> > -     dev->mode_config.max_width =
> > -                     dpu_kms->catalog->caps->max_mixer_width * 2;
> > -     dev->mode_config.max_height = 4096;
> > +     dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
> > +     dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
> >
>
> Can you please explain a little more about why the previous limits did
> not work in the multi-monitor case?
>
> We support at the most using 2 LMs per display today. Quad pipe support
> is not there yet. So by bounding to 2 * mixer_width should have been
> same as rejecting the mixer width in atomic_check.

This is the framebuffer limit, not a CRTC size limit.

>
> >       dev->max_vblank_count = 0xffffffff;
> >       /* Disable vblank irqs aggressively for power-saving */
> >



-- 
With best wishes
Dmitry

