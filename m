Return-Path: <linux-arm-msm+bounces-14939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A01887C7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 12:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4A34B20F30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 11:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22327175A5;
	Sun, 24 Mar 2024 11:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z1rs1EkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B27F9
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711278849; cv=none; b=l6M5/KRtlhjHaG0y8jb+E5VOXC/RBumS1artK6quTzyT2RsHDtdPEM+4rxZKQhzaZyZmcfgBFsDuxxuB+UX6LxWWgkb7AvxngXSuiArinApPdNqtfFgLHG4kcpm1kzkd0f7KAossGZwFT98kPKdi6md8Vycve9lo/ldZBEqPlT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711278849; c=relaxed/simple;
	bh=DKhvmdnKiY2QDkDmlA6mpQIx6SSE7kocCGPFKwy6JFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsiS0T8ehnYl6mLBrfc27/PfVHYdNqSxl2hTA6YSKX3TGWgfkO6OHlX98fBpNNMYq34Cnfnd5eWjLb2uRUmVnoGwMuYkIAelMP0ezyB5lxcwcvWYJXRm+1xwSMM6HlGHJbSMloHGazTL0JQH4YZ80gQviy08ND3jV3PB/E11Ty0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z1rs1EkZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso3322932276.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 04:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711278846; x=1711883646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
        b=Z1rs1EkZyHr5vSwtWN2K8x28CDwFhPZU4pQWj2syjwrO8sMpXuBZ3Zcxu7HQ87Hb5M
         CJNFXTyKhYwOzMc4PgqqeWf1NCbP+y2ZdDbgyI6i9wiwzJJ/5tvhGEic5s/foptavqC4
         IqPJKpVGrFRYn0OguSyXSZiqxuSeJIkAhsEvPmURXOK+xYMKjdy8muSjUwJKTqDk8sea
         Pl8Se81JUvR8x0udL23BTrn4/mrMMn4w0Lo2QxZYCGu+ck633V82SjPaen/PC0kKio8Q
         yZMiYFsXJM62RXnWGWE3VmV0InK3PVniRYQJGNecDMOMnXyIT07jd7M9AsQnpUYVpTMG
         pMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711278846; x=1711883646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mj6u+B8xlCB9159mUHz7E1aaC9KkzXuH6GFNH3xNBoM=;
        b=Ehin3gEjmEd8KBVh+K/EvhMZcRCwIZlMOcE4ErXF2NBykcZjmPkFwXP3vZQvKj7Vkk
         SOilFhiABOFQwCmGntR3iZw9fHocTM8TF0peYZSOykQGrWWyj01+P2K5xj+0BRg0PvRo
         A1BaRnCP5y/DsY1ESFHXEVDh0EExUxvSYuJ6cMxMuyN3rUY8tFmNmF9p0NNMtAakWA0I
         KQjnt72m4Rf/sq23rOod/EwrdTEVg1UAvJ+dmOXvN4z8+smL6pYDbhg4hn7vbQ81Xj/U
         5Nw+FmP04fMj7LzvhGkQ+U8j1EJmAGMFV0Wa1fZQz2gZaZGhY/96rj/wfmEX7hVqZEHB
         sxOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0CNjxMnfZ3JZJVGwRE23WKV4q2Is0cc6eynFoqO0BOW+jSopD6S96u34XiHYyeDYCcFuZuqMdxfC2yUSH1A2arVMmSzLIHNkdsiV05A==
X-Gm-Message-State: AOJu0Yw7J74XAn6s9mNEdC1wf5N8FIXYoJKxD0F06z17574+bRFsjaml
	0XBVUA6lfNO15tj9J2Icqh5bA8YKUi4vuLD+IIFUaGb3B9ls9dsjkUaJOHktJKMaHkyLV/54Jst
	4hTA9n87MBvX33s6CVUMjzN13ucvDD6UGGdIUOA==
X-Google-Smtp-Source: AGHT+IGr0tNnaqUlmK0eR1f5FzQiWKbsnubMD9+Wo9vIvgCqe8WTw3q8zUfy/4luXP0YRCD2+8dSeF51lmB7BvOZ22A=
X-Received: by 2002:a25:ba90:0:b0:dcd:a28e:e5e0 with SMTP id
 s16-20020a25ba90000000b00dcda28ee5e0mr2155613ybg.25.1711278846456; Sun, 24
 Mar 2024 04:14:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-4-cca5e8457b9e@linaro.org> <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 13:13:55 +0200
Message-ID: <CAA8EJppAsy9a0b4WzqWCaa=-fPYrKOMePo3vsAaJ4Nu3okoL7Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] drm/msm: move msm_gpummu.c to adreno/a2xx_gpummu.c
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Mar 2024 at 11:55, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On Sat, Mar 23, 2024 at 12:56:56AM +0200, Dmitry Baryshkov wrote:
> > The msm_gpummu.c implementation is used only on A2xx and it is tied to
> > the A2xx registers. Rename the source file accordingly.
> >
>
> There are very few functions in this file and a2xx_gpu.c is a relatively
> small source file too. Shall we just move them to a2xx_gpu.c instead of
> renaming?

I'd prefer to keep them separate, at least within this series. Let's
leave that to Rob's discretion.

> -Akhil
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Makefile                       |  2 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |  4 +-
> >  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |  4 ++
> >  .../drm/msm/{msm_gpummu.c => adreno/a2xx_gpummu.c} | 45 ++++++++++++----------
> >  drivers/gpu/drm/msm/msm_mmu.h                      |  5 ---
> >  5 files changed, 31 insertions(+), 29 deletions(-)


-- 
With best wishes
Dmitry

