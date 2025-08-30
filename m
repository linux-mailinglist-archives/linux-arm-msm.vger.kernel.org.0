Return-Path: <linux-arm-msm+bounces-71281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17461B3C8D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 09:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A4518962BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 07:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54E3277C88;
	Sat, 30 Aug 2025 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="NAy3HAkl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF51E98E6
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 07:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539549; cv=none; b=Jten5338OqWzPy1n4EafuHVQDL2b+sE3jB0A/d0x9vV5hKwqn4us32WqpYoVDltlHyQB/hG8q5URZzBxX9PApXzEbxeU/Fi1gVPlehUBKh/XcWnqiWt0jYgbjxrJGrgYiPPkZw7BvB9VLFjofIpFqoxWgSc09W2645boRTp3+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539549; c=relaxed/simple;
	bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cW25DcTTySjWXKUwXaTX/NcEdg8oVJ5ZTTJ1Md1lXQoFZl0xwOiuUkzxDRl2MkW2e+ihA8h8qzqISnmHIyeDku1VxCwip4r/hWWgiSk2k6gQCojfbVcZvjDdihunx9C5bEIKTfuD9g3JSv4Lz/tWixaTrwVkOFAXiUTmyzvEwPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=NAy3HAkl; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7f8ea864d68so264530885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539547; x=1757144347; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=NAy3HAkl0EYVr7fs937tf/3j3bYJ5daRw+PK/Ga0aeCyFj3ojjbht+MANM4Ikx3B3a
         BYC1qIXoUrCDkrmIgIMjBr668z194EKDcZCOjDsSzX/j/zTlZWMcfMCVPU8oEYRSX8Hy
         nokJdcLgBh9kD/zERg1SIDjm7MFa+gjhIL7gLDxmfUa1AIhTZMO4t3pfp7r4mjVoyQ/o
         f7Es4a7aVO6Zy3nNaYtMAH4wLxFtaNQuow1XvkHLuiNnoRm9u7j4q3pkUamx3AqZjSL4
         xK6AXoBEQXWg+nWqh48YbnGIFtW51BbMZV9qiF8wKm9wajj/mDHqlAY2OcdQw4LZWRev
         QIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539547; x=1757144347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=rleebkZHsZinPhKioppXYArtMIM6NdCPHtLM1696XORaFlTynraC1ufxMEeAs28z+L
         XGh21293rnK14A/SILmgeDtU4ZEpkN6ybUEvEepGoRIKB5+RT64Df8qWBjHiBX5GOz52
         tRwqog7+Ghs75ikUxhmarsuMYYO6S+0VixrC9F52KG+iodIXDj9w8xALJdwWHUmN6RZS
         NNpc+azFLvMEWK+j8ObyNCdv5WHy4e46j884xThyzdGcBKo/ORpH7yhgbTGrWXO8jl7P
         MpA2knLJdBiHWnzJ5SfPkQ6nh3ImbprKjgfWvX3PV3zmaHWTCJlqTCoY72Fvfy8djNBJ
         VruA==
X-Forwarded-Encrypted: i=1; AJvYcCU+loqHVy7TOBN3qwLlcYg8yqS2m48SbGdxisZbLgo9dLaF7baxlgsE7HThHj5aa359krUxVlGBQzdpgWGT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcs+R1Rt1xVe7fcfacPmwF5gykyyZ5v7AmU5tF8jf1rEaEqAig
	8tgwiDADiYzavu8jMJNWwYGhsg05RWdMqrgmdTSD1vdy8CJmyU4/Fdk0uqOu3b4lJCAETeE5X/6
	UOPCHQEQ/uBOs48VKJuKBnfUL1wLX4t/Vj8Ofp7vKoA==
X-Gm-Gg: ASbGncuv6WnIU1UFDFIhfqImzfbA0DLgGwBpKdUzumCn6WsTGJbfYprAyg9IHSkyHai
	etGhm9QJDTdrKZRG3/GNuixWblVA9pBGJfGHPJ12w8nfnOKNEzDmVCZvxBwTGAxGQYEkzAes2ea
	0Lg3m1Rcb6k00vxa4IPRh4uee1TyEybJilLft6aT3K/gJ7S8Cq3qij556lVqnihfC5JF8DMAuLv
	tPj5TaXLUYjPM4u
X-Google-Smtp-Source: AGHT+IGcdIb5Bh5zrCRPBVL3fLoDcfNzuR05JRese/yFeQ6WZnki9GRGlAQtC8Gf4B7czjKl7GD5FNu5efT2Tyeq4FE=
X-Received: by 2002:a05:620a:3194:b0:7e9:f820:2b72 with SMTP id
 af79cd13be357-7ff2c51b1dfmr138787485a.72.1756539547138; Sat, 30 Aug 2025
 00:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:38:55 +0200
X-Gm-Features: Ac12FXzM9U8oA3u3fX5rkC_Acspb1Bpg3nyPrRsz__oJ7apEVkNTDxD29-I5hyE
Message-ID: <CAPj87rNz7PPqZ7P4JSKdnizFaEoaBMf2VFBYbpVn3VNt1giU0w@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Aug 2025 at 09:30, Daniel Stone <daniel@fooishbar.org> wrote:
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
>
> Thanks for the series, it's a really good cleanup.

FWIW, the rest of the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

