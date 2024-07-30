Return-Path: <linux-arm-msm+bounces-27450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FA394236F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 01:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F1681F242A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 23:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9961917FA;
	Tue, 30 Jul 2024 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aelo3TR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254811917D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722382513; cv=none; b=GF2uDRaZwOOM84t6QdfG6SNGjokBH3keuCWvJVF3M7sVDunVtjIzi27NO/yYiKlK/Mn7s3MsUo9IJ2X+IPoUNltpeRDyGhYSt7eM60H5Es8Sg4h840HnYa2Sg7GpxOsCh4ZQsJjLnsiIyGRWAw7zcfrcqC+2EnnYloaW3x3RfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722382513; c=relaxed/simple;
	bh=wNV48EuaiKKaPdpHn134iIzkOQfR71MU0s4JVlo4Whg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NP+s7VgS7NkMGOyNfTVCJ2UtfrcWtmAQGexuWuR2P6bh3nSNGzNOhD7uOxh0N/WinhV6ns+nAfT2JnUGlhyCKyiZYwcGPvcm5toRoa+e/TjdYug4PArZIBA4Q2b1O6IGpYnl/Q+C3ZnaFZkjJqzoZw4wahQWYMOEnVmG12BkcEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aelo3TR0; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66599ca3470so38194177b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 16:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722382511; x=1722987311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
        b=aelo3TR0781jcniRIDwVS98XL+SIdBceuCg71tPgPgbdgf4qnVmTuenSjEFpnSWHnb
         DF/J/afP93qLfWHNwq1guIlwxHhkpKpD8sH88rlVPhcZCEk06gKABQvzpzB5klWnxK9s
         xt8pKd0Lx+qo2GiT5724G2nRP+/lqOOMlkUbjyJpaNyQtBPP9GqiptYiOpSe9DkbK4FV
         f5LL3dGRXN4jrYHyyrNtnVaPIeVFm8AUFCJ8e51LFFx/NG9M40XWp8iGjToulKdMR6NW
         buafvR5kQNs+QAcOJsoEpDCcNRl1FX//l59YIf1JocnVlaXHUlNdD7z7K8wYm7Da6vPP
         bnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722382511; x=1722987311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
        b=teEWgsu6lt1zku286ovvceCU4WO+jqEaRp12jUmR1NxVwV61BsB+uSyll+cIw+gi2g
         wrPxUtD1AX1Tla6KmF+2qF3OkXjzK8euDgvaX43qXWBS6SOyGdGLkn8ChTg0abNa/vbA
         MFE15JiIvLzcDVxzru9hKcvi9WFcu67JSsiSUSSwEzqneIouNrxvm/1ibADIuxP0zcqC
         ITY1WGNwFVIslzQm2Tksz/GE8bbBTXiBfUgHzRJOO6pzTXSTco3qy0jQGXIGA4JGsI9z
         2IqDKDG7UXR5LYnGxWX34e5qeyFhrlkeRFIhgtXWPRLEQ+NmSKdhAnRfyTnbSEAbhfDB
         h25A==
X-Forwarded-Encrypted: i=1; AJvYcCXKAOp+mDGfxiJcaTzBGR8ZQdnqjMODZUkZRyTmAlsWTNBeB5KNQ3VQ4h33azHMp3d308cb1jTQIBdz3D273IUqO78Ty+NNsCgRJSDIYQ==
X-Gm-Message-State: AOJu0Yzu6TCf4nqguMNGPkiFpdc459G2nLMgk8j3bw8hNK3aC+9YunwM
	tRBsKTAytHkYIy9O70GUZdSuxJc+h4e3Pblg25Yls901BNAurjGIuQY2xXLyeWivk1D2qIlfQEU
	twEz5en+ZTAqDH/01IENIR44cWYUAUw+u4tGFJQ==
X-Google-Smtp-Source: AGHT+IF5Qu44QrOZ4VrsYyLpvrmeLZVdMHwBqXOOZMpIBMYFD1xy6BhuFX59kqGp3Tq+s0ubsGow/En+HH7guzdfyGk=
X-Received: by 2002:a0d:fd01:0:b0:63b:c16e:a457 with SMTP id
 00721157ae682-67a069151f6mr132078237b3.13.1722382510997; Tue, 30 Jul 2024
 16:35:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com> <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 02:34:58 +0300
Message-ID: <CAA8EJpok+M3xYqtKDM=N=+fc778ipUdYcnNBLLEXMkpNjjy5rQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jul 2024 at 01:27, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:58:19PM +0300, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> >
> > On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > Hardware document indicates that widebus is recommended on DP on all
> > > MDSS chipsets starting version 5.x.x and above.
> > >
> > > Follow the guideline and mark widebus support on all relevant
> > > chipsets for DP.
> > >
> > > Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
> > > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
> > The issues are present in the following commits. Please consider using
> > them instead:
> >
> > Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
>
> But are we really fixing any bugs/issues here? While the docs do
> recommend widebus, we're effectively enabling more harware/features.
>
> Unless there's a strong reason (which I'm not confident that the commit
> message entails), I think we should drop the fixes-tags and just bring
> this to 6.12...

I'm fine either way. I'll check tomorrow if this is required to fix
https://gitlab.freedesktop.org/drm/msm/-/issues/43.



-- 
With best wishes
Dmitry

