Return-Path: <linux-arm-msm+bounces-40147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A99E2ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 23:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BFB0B256E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 20:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513141FE473;
	Tue,  3 Dec 2024 20:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lk4YFwNh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0F8189F57
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 20:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258801; cv=none; b=cuSgwPXB9rTLKSYtpykjDG60wraf+OYKW+DgP0dAajK+wTaRvtOJpyjUukgn+q+3nzEwZrveiLx8CasNPh+hMTiKxPRnYpQEFjHk6qi4vqlWHFeT07WcOKC3gGxM+bBMyCxuOBF0Bdpic+UG+ZLCnRTe9WoN8BJXeRqOyeDOD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258801; c=relaxed/simple;
	bh=xB5EOCC4QawlE1y/CAlqwTi+F3cHDukCFZS272HUMcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLNi5ZNBD1n9NVHx+viOlTOh5BpeWHchMMzPtf05zD733a5L0AxPcis6mZFfAgFjc6w7K2aiQxCJjlmqg5V53JWNjrgi2VpImJpJkzIxtlGJ7yxXi+eRYQ3mADdg44Pv8eukGr7dYgKWqKuUOXK250eWNok4ZO7+cWfD/gRbRuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lk4YFwNh; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e388503c0d7so4409471276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 12:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733258798; x=1733863598; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
        b=Lk4YFwNhgGpaTS4z71MGjmOYurN9+/IN/35lGJqZaN3lu4c5/YZzFLqjt2GUP2p176
         Xe50tZHlq0WevzFpjh16oCY92fUFH87pr5i0/EUA4we4SQ6vZoUL1XYmoXtgDzEQ+dSZ
         e4ZUQonZqIZaZwDBy9ms5biNzYUMOIaKy8KhF8PJM0/qJGQSP+ADbvx71gGJx2fx080T
         AHtP2iSpvqyoDBfybgsLu9a7Lvrf99P5JDdhEV42af2sY7tgDTNhmlTf/w52A/5IrBuU
         cHD4LtIfow1NwNuMMjmh4dPjibJMX1yFS/xukxodsyYESDpYifzCyoILfKPLWA78pu/j
         p03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258798; x=1733863598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
        b=xSxWv+3xevWsjdotGmsu445fUBC0wzgN5jcqJUMs/qMIwX1oo6TPxvD86qLFfisilo
         HjXe35Cx6LWHMnKa+lju3jCs9be0mPa9LpkyArCxO830y+j1uiqgmTINVz6PWkyA1cNC
         Rv8rCVDaz3Bx71SriWQ/azbA5C+uZvXlYPd5673yIHakHSTgqfRNEvpXE8cGNJVGxxvO
         8SAim1PuI4StOjP1llR3CfLgj+Su9esSfuCSQXEjwHyrWIG8B/naa0DS2LWsKaRP6Ddw
         2Fg7J9XESw2nIOHTxwNPEE9lBHsKAln8tB4Xr76iTD0mbrRZfOtcguxJTyL362p6mNiJ
         tIiw==
X-Forwarded-Encrypted: i=1; AJvYcCWxD/FvHpZofwSD09jEdxM8VNeurhk0YE9K7SnceGGa2MJriAqvyKeYoWqIdDqWqppwjCEgl9HFxPPHGSSq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4av2kpkO3aC40SK64iZHurK3JIlRtrUJlmmjQEQ5HpKtyHEan
	qqRk4lcoB6hiHZVIq87AMV8F729TWcqKd+XvPJWtkjSWmF/+z65wdyqC9uJ/MTkzeHBn3XVCRkn
	QnWcvmzbK9J3PDRjgyXoeaROP4Cm2A7EL8T3TS8CUAnarXvbP
X-Gm-Gg: ASbGncupc02qRGf3N78+GoYiqsp+Ave5X5sYQTRCmlakEPuiRhfdNMcFAJ0c3SrIT51
	7zk+3zMP3US/5QXllg+m8GjdJvt38OA==
X-Google-Smtp-Source: AGHT+IH8hrI8UpkvlEij0qypL74Pq/pAf4QOqyLjB1Y7xU/3KeHSuRxwQIYl7F2mGLf9kHagIekQ7TkNhcuk6salH9w=
X-Received: by 2002:a05:6902:1147:b0:e33:14fa:2273 with SMTP id
 3f1490d57ef6-e39d39ee50dmr4169526276.5.1733258798414; Tue, 03 Dec 2024
 12:46:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com> <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
 <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
In-Reply-To: <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 22:46:27 +0200
Message-ID: <CAA8EJpqmoOzwT5STjPggXi+hm3zwu=j=0xAxexHS477t_g9n6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 21:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2024 6:31 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
> >> DP Test Patten Generator is a very useful tool to debug issues such
> >> as blank screen or corruption seen on the DP monitor by isolating it
> >> to whether the corruption is coming from further upstream such as DPU
> >> OR from the DP controller and below. It was noted in [1] that this API
> >> is unused. Rather than dropping the API, it should be fixed and used.
> >>
> >> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> >> it by adding a debugfs for it.
> >>
> >> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1
> >
> > I'd prefer for this to be rebased on top of [2]. The series has been
> > posted a month ago.
> >
> > [2] https://patchwork.freedesktop.org/series/141074/
> >
>
> Well, the review of that series which tried dropping the tpg led to this
> one really.
>
> I will review that one within a couple of days. Lets first agree on that
> series before deciding to rebase.

SGTM. Note, v2 kept the TPG in place, as you have asked.

>
> >>
> >> To: Rob Clark <robdclark@gmail.com>
> >> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> To: Sean Paul <sean@poorly.run>
> >> To: Marijn Suijten <marijn.suijten@somainline.org>
> >> To: David Airlie <airlied@gmail.com>
> >> To: Simona Vetter <simona@ffwll.ch>
> >> To: Stephen Boyd <swboyd@chromium.org>
> >> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >> Abhinav Kumar (3):
> >>        drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
> >>        drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
> >>        drm/msm/dp: add a debugfs node for using tpg
> >>
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
> >>   drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
> >>   3 files changed, 76 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> >> change-id: 20241202-tpg-3f7543c036ac
> >>
> >> Best regards,
> >> --
> >> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry

