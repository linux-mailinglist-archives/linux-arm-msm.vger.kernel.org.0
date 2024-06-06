Return-Path: <linux-arm-msm+bounces-21866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B966A8FE1BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5291DB22DF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 08:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F38145340;
	Thu,  6 Jun 2024 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xHd99Ngz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497C13FD9F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664062; cv=none; b=WjbLv2zb50K3CEtIPR4R8mAaZFkCp+oRC0l/GnB8PsRDi76yQcdFQL/vs1ddKJCa5jpEvHCkuLm28xTtRH6o7tj9bwtWf2jzwnGpALZiwse3qJDxTOw+e15QQ/dGhh8c5bU0cUMyhVjQ46as+X443v91A+GsP4PPS4QAgcOEc/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664062; c=relaxed/simple;
	bh=i+b9uZ9a4NsJn65/qLie+xZL7ZD0qq99aE7ZxCea3aM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LOIDtrcycLkS5NuiNZgEQUqAU/OBNNwNJwelOCPZ5cW3udibzN0s/dKM1tspU7RFQ7xrh8Zq5IhdpyagJSxfeM0d09v/HqbhIoIg/aqtdeXSYcl/1m56hvWy5flUJAbCifJWNGUKzRAxcCcesVT4MnVacpBgD7Mcotr/2Jeojss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xHd99Ngz; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfa8427f22dso883097276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 01:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717664059; x=1718268859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+iELr/WPzJm0A7EM6v/U4tRKEa6mtrRIhxMOyb3jnnc=;
        b=xHd99NgzG1HdBANoZlvs7ED492yr1/KwTpo2iNjXOnDlLQ1rApGr6LPuuBP1Lg4yTf
         Rm3/T1MLvLPVb+rTHcIIsaU6aiUt4MVjHT58v0D6fRq80/5o9KohnB78RMbMr+OGOEYK
         +KIrCaQe9AvkszGnQBPMLmhMi63NMhXWCVES4Y9rz76LshQQI8bQuBWYisUtMqxMUuuY
         N8seqOE8SnjHMhzHySjVv24IKZo97mbmMXFEvtyLGpcz/etIbFV4CGJtKWr0qJIbE7qa
         OwLuOtVxu80gSJAH0ujtX8YgR7x7MTY7cMxnzLYHysXO6poGO0/RyzZEo7vA/yJXyOSu
         2sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664059; x=1718268859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iELr/WPzJm0A7EM6v/U4tRKEa6mtrRIhxMOyb3jnnc=;
        b=Q+wfK97nOPrR+e6kRILMhyBvfK+Iuib8dKZyyTexzdnxxmlLXGHiWY23FuRSqKl91L
         80PTs6Mtnf2qS7lcZuAY5Pill7BEYOCeY8VJSYiBh7SZl2RSxAkNwoTeFMJDmvpHriOv
         WyQ5RAzbxfpvedTRGfkKSNLClmoBqCJxIVm4UpToRif9Bo4eT8f81e8J85VkpjmhdSQg
         d5xIQqRMGK+FqZb3naa3cq42UXx0A8ziXi0WES/EeVYyVeMJWliiAgJt4qIafx5CMRXR
         YuFw+l9syn7uMAKpXEOEtJHgvStFXYUPzhfzMQ8TIFB5LOkmkR8eZcFX94ilQVp2Q5jH
         EcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+nxauQ6FEJKIaMXhltc+t5xsHNt3XZZRA+bzSC0MB2Lc+hU2p+CYAcEaAWULE3xSFUt52nErRJzfPZsT+CLkjWggLmaPJBsIjQtdwWQ==
X-Gm-Message-State: AOJu0YwoXJ2em59tWooAZVeA24ZKLiss3Q4e4+zfP3EsubJuJABDGWT/
	Lm+OYy4r/NngPKHmUQox/uof656/Xr5LjHojuqCjryEVIgwTNu8mNEHaHdmjD2tHNi0AvxcCLt/
	Sa+GzWNnN0qIvdHj2fMkuQ+nmOA4ZeSxo/88ZJA==
X-Google-Smtp-Source: AGHT+IFVHYy2qIeOQs9q5V92xKkDYTynf4PQxhlNASe/iGH0WwNFzITXGL0WNI9PXXLo8Ls225McpXU6BeaKzqXO3hE=
X-Received: by 2002:a25:2d19:0:b0:de5:5084:715d with SMTP id
 3f1490d57ef6-dfacad2443fmr5080848276.53.1717664059531; Thu, 06 Jun 2024
 01:54:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org> <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
 <CAA8EJpp+NvoTMZdVNivqe0_nQd3PChSND7ojqa+Ee3nMdWcQGQ@mail.gmail.com>
 <1c107933-2180-fcd2-06f2-61eb7108b6b0@quicinc.com> <CAA8EJpp7DL+hpTUgmzsKciXg8ZEZ5BFy8ALiH0CbFmWb058HCw@mail.gmail.com>
In-Reply-To: <CAA8EJpp7DL+hpTUgmzsKciXg8ZEZ5BFy8ALiH0CbFmWb058HCw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 11:54:08 +0300
Message-ID: <CAA8EJpqBSiCadAKXSXSB58cPV7Fb31_92vJJDMDsnxHz1TnuOA@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2024 at 11:53, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 6 Jun 2024 at 02:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 6/5/2024 4:32 PM, Dmitry Baryshkov wrote:
> > > On Thu, 6 Jun 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> > >>> Split dpu_plane_atomic_check() function into two pieces:
> > >>>
> > >>> dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> > >>> without touching the associated pipe,
> > >>>
> > >>> and
> > >>>
> > >>> dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> > >>>
> > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>> ---
> > >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
> > >>>    1 file changed, 117 insertions(+), 67 deletions(-)
> > >>>

> > >>> +     if (new_plane_state->crtc)
> > >>> +             crtc_state = drm_atomic_get_new_crtc_state(state,
> > >>> +                                                        new_plane_state->crtc);
> > >>> +
> > >>> +     if (pdpu->pipe != SSPP_NONE) {
> > >>
> > >> This check was not present iirc, why did you have to add this?
> > >> RM will return the same SSPP unless freed. So why this additional check?
> > >
> > > If pdpu->pipe is not SSPP_NONE, then virtual planes are disabled and
> > > there is a fixed 1:1 relationship between planes and SSPP blocks.
> > >
> >
> > True, pdpu->pipe is currently assigned in dpu_plane_init(), so we will
> > always be hitting this condition.
> >
> > Perhaps the patches later on are changing that, so shouldnt this part
> > come along with those?
>
> Ack, I'll move it to patch 5.

Patch 8, of course.

-- 
With best wishes
Dmitry

