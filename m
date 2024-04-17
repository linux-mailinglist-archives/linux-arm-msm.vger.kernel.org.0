Return-Path: <linux-arm-msm+bounces-17692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F247E8A8296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 13:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922B01F22DDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 11:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466AE13CF94;
	Wed, 17 Apr 2024 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TdQI+8Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA56913CF87
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713355022; cv=none; b=Rwo7V+BZpF8y/f4DgVEwlKFAhSVHDVkhUD6slLVv4f4qvELFkMViOmlUCMKvskl9fEnp5oKiMG85IPb0ZfdQYu5i4l8vS7LEV23lmxZVNrocOxvdHbUuMqQ4Rbeja2f63KiDAQ93jmP+IHMP5zGdVia+yykDTnj0l1JYpCYNZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713355022; c=relaxed/simple;
	bh=rFWYHRR/8wQe0/h8nXEAewAVnKCnbdH3Rt5dV8yzjTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NX3GLW+nnfx4OHm7Iu/CempjLe9Pz7pT+7qoDockB5hCe44S5EJdrUgjNADKMyPuuYYERQWwfLfWsDoLf0Pekhd4lKS3i8qc0PlTiJg/SxJ4EnwVRLaR6KwcsOy+NIwGdbrti2bdpvyR02GK+nXz68OgGkvntijQE6cY9/KaOkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TdQI+8Lv; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso3642384276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713355020; x=1713959820; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
        b=TdQI+8LvzmqPZn1yvqFHpPhC2u92d9udMKJM9NfzRHMAzuTe2zp06QyzB3p4zMhrN6
         Su1io/EHPQCMCAWqeicjs65L7HFh/Tx42tFPibBJNmNoFoXThVgClvw6y3CUTBa1dl9b
         PPa/kZKkacwtrVsXSh2t0CroQqeX/L0Dp0+9C4CGpk7NapZOXCS1LVOfx48mm3Xv3ylB
         ZXv3IFKnlbyMXJOUXH9h7xzoNAbxGlrQusFjbE5kn0Ht4qvkJkhoXQ8EYrMl+Ir9mAsx
         DCdAcZS447NmJ9J933ex3tLTVRPpWTNEnTVDD7k9oQj56+FkkayAiuf9JEkMAZtqAl4s
         5CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713355020; x=1713959820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
        b=JPEtxkBYO35oWzlyB+r8QLuhfm1bINp8WpTaG6/n+gEJ0ccAcXG6jr252TJgp0wEfR
         tuTnvC572Yh01IV4XORmBcOWK4p0YCL5m6La1uwD5Et6IJw+dVbdu5Qj5jtcTZ87AsA7
         CDy6z3Y+kXfhhn1kP1gTZqhx86cuxSGl1d1NDD1FMSEHXKWNgon9dJHfc2KmqK+jmuV5
         7l2N57YU3Bifffv5xu8mAdFvJzfu6zfdxdm04X0xt6doSbElV88xF6x9QjJda4Oeo76W
         2EbCEbQqQyRNqGM/heQhhQuHxlZaEUbEYMZy6RXQMuTRVFP+3aF7pBxjURcQPwOyzVom
         F8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7MBSb1Lub17h8tujgGILqQHZxNC12V3S0Xj5j2afDcXlEdOAXJ5iR0k381PRePzb1xLibReS1bo9QWzyaoi+GYb2tojCcunmlYK+tsw==
X-Gm-Message-State: AOJu0Yx5T7vtcZ/6U7vsyHk1ZCXowbdtCa/KTFyJBMo1Q3mb6Pu4a1mz
	RH8RotTwzK9h9tmdFSVLPns13b/h5x3l2NbDTUz0Ad5/P/4fXu/nrQvBzA0TFF1sEA4GEZWQR+w
	HWvsty9hdpGwfE2jrqbFU1LYOKFYDQI04mQgz9Q==
X-Google-Smtp-Source: AGHT+IHuJ+P0+tIP8Ja/s31hcE/lLfe8rzFJZRFTNiK24q6dN5Ov40yhIbmq423DTWh9Cjd7EAZUIsIKaKherzh7G/4=
X-Received: by 2002:a25:4ec2:0:b0:dcc:1449:71ea with SMTP id
 c185-20020a254ec2000000b00dcc144971eamr15228037ybb.50.1713355019639; Wed, 17
 Apr 2024 04:56:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:56:48 +0300
Message-ID: <CAA8EJpqJfkRd3hN-QoHaxhP2dUaEOyaqnGzA5MiGk96oTLRO2g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/dsi: Print dual-DSI-adjusted pclk instead of
 original mode pclk
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Archit Taneja <architt@codeaurora.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When dual-DSI (bonded DSI) was added in commit ed9976a09b48
> ("drm/msm/dsi: adjust dsi timing for dual dsi mode") some DBG() prints
> were not updated, leading to print the original mode->clock rather
> than the adjusted (typically the mode clock divided by two, though more
> recently also adjusted for DSC compression) msm_host->pixel_clk_rate
> which is passed to clk_set_rate() just below.  Fix that by printing the
> actual pixel_clk_rate that is being set.
>
> Fixes: ed9976a09b48 ("drm/msm/dsi: adjust dsi timing for dual dsi mode")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

