Return-Path: <linux-arm-msm+bounces-24273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C809180C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7361C21BCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 12:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1FC181B98;
	Wed, 26 Jun 2024 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA6gxLzh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B26181B86;
	Wed, 26 Jun 2024 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719404164; cv=none; b=XVztuG5grWH8gmL/J/hmtIv9WR1VRt8kbf4e2avZNPwtjeNE8Wz8rfXEEMkj+OYXIv6ICUck4PVQ9LMzS8i62fwlTE61uhpmXQGmjY9QukCfSEAeuRbxwl+xDbhOkDNL+aS225zkf+ufkXg3zhJRBpIoVsZ7Lm9Zilh5BMA0EYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719404164; c=relaxed/simple;
	bh=I05K1/ywYAS4VCu7rfDnTBdklddZWqSo+1+tW9APewM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xo9OdGDx31SyP5TZQBaZuosK0N4BRW9cs7k2zmjY5Ynf5iwsrC2u9hsJ5TnAEJVy3XUTrpN0uG9z2k0rFPc5vosyIcU2DPjBgBmXLpgmGOgBBxrXvj8Zkkc3BavhJeXSH+tMs/V3rzGdUpLiosev0Ns1eJBswH9Z5GVXvR9Lumg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA6gxLzh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7041053c0fdso3859751b3a.3;
        Wed, 26 Jun 2024 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719404162; x=1720008962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I05K1/ywYAS4VCu7rfDnTBdklddZWqSo+1+tW9APewM=;
        b=SA6gxLzhYAOFq6FlU1oEo2AEXSGjK1UTcGfszO8x3ynO33cvHSjPDD0P/6kM+gdlec
         Ya+bUYiqJ6rSA3AMGOPikotwbodhRjozl8VtK6gS5WUkX/rV1eAFCFav+0lhKeqeAYxN
         HFKcO/pn/QJWmvQWjVoq+8im6/mS4Q8FgSPY7ZYLyPmpxfZ5i/qTQ+m14QA8O+sWxNQC
         tVFLuQu8w7fPy1QHwi9YDafuapVoVME+xTgR8m0beYi/po2q0WqkRufEfDA4TBMnrj8y
         SzNtVPfVk5IxRmov7/HiFt5VSPoIZxT0II4eI80eNLyMpxInKhree38TARUsEqRTGEc+
         xYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719404162; x=1720008962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I05K1/ywYAS4VCu7rfDnTBdklddZWqSo+1+tW9APewM=;
        b=EbzEIAficI3Xze/psT9itX6vYtTEAqXZYBWv9a5O/v7VwhnLzK2Ktg6zYM2+BzN6+n
         WIdEZhAubQMycTz0jQwTRBmIrYsGjres+pCgjSHIfdPeKTUMh3oRTIubYaOShwDsiwet
         iZQ+vS22JPWnYD+FAlwR2kipaANny8xHa3y9EmxrawRbnfEdP7iFDDhUq5GlpV9gqy16
         zonyFoAVzgCDvxC7jsn94eQYt7S/C3kGLetIor7Dk5kDYtqKJtY8+ibf3Qa7z2cZkLkZ
         bzfEW2vdnJ+LhjHdfK9bo81D8sK8xxZGFtI0vU3Tzrmr5CCgukLt0mBH37D6eaDfjXmj
         Qz7g==
X-Forwarded-Encrypted: i=1; AJvYcCXP1y7nTuK60LCpnpXyvw5VE9fyK0xvPMKHbCiY6B/8V/yy+/bwX6bvyv1hH3HCIXSkq5U+dR2Eknv544eKm05KZTf8BrBfHOHAsFHuvanuDhg7AD4l7ZTh2twopF4jCHPVsDubl+QuTMc28w==
X-Gm-Message-State: AOJu0YwbEhvz7AQR8bksOD/U8XrGUUAddmdY9InoxvLv/sWCy7b4+Qhd
	9uLBvKwbs0PjShi+//Q8uj1rgpLs2FQ1Vv6vDdm3zRjMJXvbF2jEqv/Rl8oLXyrX0BDfWJufk0F
	9EC3QAcUjhDqhZ8k+gWp8OKLCwv0=
X-Google-Smtp-Source: AGHT+IG3anRqa+MiJAAggts5EH1CGLqq7RvzapM9iWuCH7mcUV/xDmy8QcLVo8Tb5lGP2lriA0FSn+KTa+LN6LElifk=
X-Received: by 2002:a05:6a21:78a4:b0:1be:c18d:9f66 with SMTP id
 adf61e73a8af0-1bec18da0c4mr1242338637.19.1719404161989; Wed, 26 Jun 2024
 05:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
In-Reply-To: <20240626-topic-sm8x50-upstream-fix-a730-a730-gpu-raytracing-init-v1-1-fd7e94694ab9@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 26 Jun 2024 13:15:48 +0100
Message-ID: <CACu1E7GakWGRTdWc055n7RNbYdBZgcNDATHsog8rntXsYajHgg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix a743 and a740 cx mem init
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 1:04=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Disable the call to qcom_scm_gpu_init_regs() for a730 and a740
> after init failures on the HDK8550 and HDK8450 platforms:
> msm_dpu ae01000.display-controller: failed to load adreno gpu
> msm_dpu ae01000.display-controller: failed to bind 3d00000.gpu (ops a3xx_=
ops [msm]): -5
> msm_dpu ae01000.display-controller: adev bind failed: -5
>
> While debugging, it happens the call to:
> qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ)
> returns -5 and makes the gpu fail to initialize.
>
> Remove the scm call since it's not done downstream either and
> works fine without.
>
> Fixes: 14b27d5df3ea ("drm/msm/a7xx: Initialize a750 "software fuse"")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Connor Abbott <cwabbott0@gmail.com>

