Return-Path: <linux-arm-msm+bounces-30476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F69695C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF6F1F24809
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4C0200133;
	Tue,  3 Sep 2024 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YX1J3pE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B481D6DBE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349001; cv=none; b=Bp16pw2kIgXnuLl1qhy1eOl3Y1F2rhGLLdhSdCXIDJDy6g721wgAq2ZJSH/0kZjc+SLkAf4nABVK7NY7EoSex6j4slEUjIXB09vXY3JiHL4ZsLA7zNlDXF/IhqAtktMfkqfuuDh63OAlI9Pkq7aNuJLSROp1Hfrgpnp+rkO/+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349001; c=relaxed/simple;
	bh=kqcEYObkrC0jQZ4XALAJ1vO1P6Mi2ZZhNfK7jC8/8yY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzUGi3Jh6PLwDQCtFdH1gzFA4lubGkFbRfsL0nz5J8Oq4uuw7gJueFw18P7AihjBv2yQ4ZiV+Z5DMNo4XZac6BRoWHYjPH2OsKPolq+10P9br0HC159mUtlmUNgBJsJ6fiTNj0RmboAVVgIoVktbzyg3FXgLl+OgKNBBfx+jdn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YX1J3pE+; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3eabcd293so56973731fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725348998; x=1725953798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqcEYObkrC0jQZ4XALAJ1vO1P6Mi2ZZhNfK7jC8/8yY=;
        b=YX1J3pE+e8VJomiUThfOYrvSt2q4FemBbru45Xr+FZNT3ExMvm/hzFrlTOE5DDQoOJ
         XKYtG0Peb0YNfp6KzUSOneC9O+Qk7udPnhTf3fatJg4VKOwzxYk42Gx2uaQUaKdwLNu7
         mFRod0aJ4atrECNRtFR05NUeRQYurDbCDDrF7HmTNKsbaeJYmAGVN4+b9uOfcgTgMcNw
         KxB9SqzDFX5oh9Axqmn/0oRbFBrCNUlCIWJxkFj6UWeVgwIzgd7rptVuxWXUwU5L4nD8
         5Zvz/AKTOR16utPQJDVhDXBgzDNyV8qP4IqKW728rsvMpVZDIafC19MPIzuuU7GDRPj/
         W+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348998; x=1725953798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqcEYObkrC0jQZ4XALAJ1vO1P6Mi2ZZhNfK7jC8/8yY=;
        b=onqrogjJWl3lFiZUH0lFspuVmMwe4kD5rPSehmptCFcA4ZjUeI0hkk8BVd3DoBGgl5
         Em5XL3U+aj27rbkrMvm+yuyrJrKCMRJwnNEiVBkY/tzCS8n9PpKLFE/fqQTAzVNj2PD7
         gXyZnDm/3B1lQh86yaqYkeMun2YnZEJqVyoMi+sySBG2dxRBZFYkaRf6s9hkV2E5qOEg
         PPOEichG1fK6Uk2CGvFo+lE6DBo3PT78F559w0MFIPaX29xyOqsz1r/01WVAOF7TyA7U
         /LvpPwfVVtClJ3aGIX3kkf4pH2dOyYEd5mfc/ZATGcxF0m2oxd8+qL/44H265jeP++sA
         QC1g==
X-Forwarded-Encrypted: i=1; AJvYcCVElFKgACqfalBDd38mxqAB7UZttkJ3h7/tfDtuiY6xi2iK+gXNbPFYjv+rS2z+FtbY/qsqLwEVbhxP1137@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVWbljAIxRrlVE5TGe4LaN/RrsxK80gjeroxq29RbsSTYGUW3
	PIX96sclpR/SdcBf+26sPccE8pslnvhSUNQiQy1o8Hx5HYf+Yl7Avw20N5g/dRc/K+UWKh1eJy9
	W/iRRzH5zeHVJDYG1hfdynnN33ZpVIn2CVZtPpQ==
X-Google-Smtp-Source: AGHT+IGteQhWMzNbnFN2+qKmtjU62TM1lL3m0+11wewZW7P3uvaelhDjpcxaWwlb8wZ9QV901P1BCZNJ2yN7NdhKUJc=
X-Received: by 2002:a05:651c:199f:b0:2f4:f8c1:2e91 with SMTP id
 38308e7fff4ca-2f6290ea8a5mr60244041fa.45.1725348997477; Tue, 03 Sep 2024
 00:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-4-bdb05b4b5a2e@linaro.org>
 <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
In-Reply-To: <CAA8EJprKnd269S_KMVUDk7UfT-c4ighPq4VkX-nEkwGg8ys1cQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:36:26 +0800
Message-ID: <CABymUCNCZFx3kMtxXt-U2L+_ks5oCCWMF0k-NyFkp99-aTqf-A@mail.gmail.com>
Subject: Re: [PATCH 04/21] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > MSM display controller support multiple slice to be sent in a single DS=
C
> > packet.
>
> This is not MSM-specific. It is allowed per the standard.

I do not find it in VESA standard 1.1 and 1.2a. Could you help point
me the standard
link?
>
> > Add a dsc_slice_per_pkt field to mipi_dsi_device struct and
> > support this field in msm mdss driver.
>
> This doesn't describe why this is necessary at all. Is it a fix or a feat=
ure?

It is a feature per the name. But I do not know more than the code from QCO=
M.
And different value other than 1 is needed for some panel with QCOM
SoC per test.
 So I suppose it is a key parameter. Any more idea?

>

