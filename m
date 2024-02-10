Return-Path: <linux-arm-msm+bounces-10500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419F48503C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 10:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 748E91C20C31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 09:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EDD36138;
	Sat, 10 Feb 2024 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwYJJ1rU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F4282E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707558914; cv=none; b=PUL0fQ0v61NznDkjUH7E0AgQtp2Dts5CJCOAnqY82nFB5BrITMJte4A4DyTamhM4QMSmBxlwcG6/RYs/o/vh1D/QqrbRRS40eaZ6+CrsswP0LwwT3UBhvgeOeskaRMD03EXZyqB9cYyXMitgzpqrN+mVZH0X5BiBKkmOw7dUkWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707558914; c=relaxed/simple;
	bh=2EY7YmlGnXLVQGmHtIRnCLYhrtFGIS2eeUAkQmv+5II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBtWb3LGh6H/9wYzrAB/ih5OvoDS9xzqIrj1Zq83xtSj2XRSTbZbY45J6n81QEHby6hChgX8cZ0qiz3uvt6lXElm8eMjSb5qubLIuGRGpekhetK8LgZ3RXubjaYoySzgmYWy8lIZ9eXmvIIYnSVqiT6p6QFAtlAIJ/Em4yihmA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwYJJ1rU; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2039935276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 01:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707558911; x=1708163711; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
        b=EwYJJ1rUdAK/h11z6z11P7tTKI6znHgANsy8s5tlwjUhxzmRTmMW9f/klTF2WNYCPJ
         /F2h9ZHIA8uQyhLkOn0uMcWx0zrW5t+rENLMl1d12JEivKJBxxxdLfhh82P5t4NRmNo2
         kepcc3gcM+CQDQFbwYKVdedgoBuYIJSf3QSdjZWIAE4QE8VR6gWj3FJmIJE2mri74bdW
         41Zr6vleJ593yDyK04WNzmDjnZnnRXImgfLNdKBFHPpN7CG9vNEMob0c19a+A43Zi8dJ
         PJEM6EO66bWbH6aU4nNVb304h1LJpkXhVB2d+O9IkKhyzp7cFc2f6hr2RJ5UhffvCcLl
         iEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707558911; x=1708163711;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwKRO335TL12T1ugNIYuUs2JClpMBYM/9p0MgS1ZsMw=;
        b=kSLWzHuVFPD3Hn2CdzXAgVMOPXFgp8QwUXaJSTeTJkvGaZ9BMqfW2MUCj99rr7OG+M
         PgDit7U7D251r+koeMA0Z4jl/h72IAaP3fLawa/X5z5UZc9dF6hiI85M9uKl9cXUHJII
         qV7jPamtWQ2lBsasKT+F9WdpXFfQg1SEc+0Gv2XCrXvDfN/tAn1E7WBUVMd1PbG2Kirv
         hJH3JN2I6WZCV/V+0GhBPuT+iwj6jEpRwOqIlW8dILHOvT8Rlu1yRss/6Qhg+71A4i9W
         V4fMnT4GHEsugjTh++xmNVCdjIfRwMWsWwULA0ygg4mBe2e4rI8cGv9VG2lrHziidd+3
         T3rA==
X-Forwarded-Encrypted: i=1; AJvYcCXY7emOLvr4vaxUB5rZ01jaf/00MrC3g93nqyIfi85UmkyUmcY9vL7DXKsOV8UAhKlijnDAg+Bb5VTMakus8uxUJ6z9dkGGZfoi3ZuGKQ==
X-Gm-Message-State: AOJu0YydGdDW+pNJoXz8QyOsV/q+jCVZTAHSXP2vt8N+xIgOtTg/VRr9
	MgWBmJQ14Um1g+C0wGjUV/VV9zkqFoclliM88IjA4sdK+Xo4PUWhOF91Z6ZOYk5YzTsDygtbDmZ
	BuSU9M08MD5ToatchH8n0TlAdfTeHKLETfODDKQ==
X-Google-Smtp-Source: AGHT+IGHSanBc/5P0KYgb1X3eLxidccmytEEnZo/ritl6ETykacuJJJ7mViK1X+VYMRMhGiedJA+mXbN9stbHWSubxk=
X-Received: by 2002:a25:6954:0:b0:dc6:f0ac:6b74 with SMTP id
 e81-20020a256954000000b00dc6f0ac6b74mr2845262ybc.15.1707558911270; Sat, 10
 Feb 2024 01:55:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com> <20240210015223.24670-13-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-13-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:55:00 +0200
Message-ID: <CAA8EJppppDiaQdEzX7WnFA8rFJQBTHJUQq4o6kZtfzTm5Y=nnA@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] drm/msm/dp: move parity calculation to dp_utils
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Parity calculation is necessary for VSC SDP implementation. Therefore
> create new files dp_utils.c and dp_utils.h and move the parity
> calculating functions here. This ensures that they are usable by SDP
> programming in both dp_catalog.c and dp_audio.c
>
> Changes in v2:
>         - Create new files dp_utils.c and dp_utils.h
>         - Move the parity calculation to these new files instead of
>           having them in dp_catalog.c and dp_catalog.h
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile      |   3 +-
>  drivers/gpu/drm/msm/dp/dp_audio.c | 101 +++++-------------------------
>  drivers/gpu/drm/msm/dp/dp_utils.c |  71 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h |  22 +++++++
>  4 files changed, 110 insertions(+), 87 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.c
>  create mode 100644 drivers/gpu/drm/msm/dp/dp_utils.h

[skipped]

> diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
> new file mode 100644
> index 0000000000000..c062e29d07898
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/dp_utils.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DP_UTILS_H_
> +#define _DP_UTILS_H_
> +
> +#define HEADER_BYTE_0_BIT       0
> +#define PARITY_BYTE_0_BIT       8
> +#define HEADER_BYTE_2_BIT       0
> +#define PARITY_BYTE_2_BIT       8
> +#define HEADER_BYTE_1_BIT      16
> +#define PARITY_BYTE_1_BIT      24
> +#define HEADER_BYTE_3_BIT      16
> +#define PARITY_BYTE_3_BIT      24

Nit: it is usually 0-1-2-3 rather than 0-2-1-3.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +
> +u8 dp_utils_get_g0_value(u8 data);
> +u8 dp_utils_get_g1_value(u8 data);
> +u8 dp_utils_calculate_parity(u32 data);
> +
> +#endif /* _DP_UTILS_H_ */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry

