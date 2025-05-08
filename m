Return-Path: <linux-arm-msm+bounces-57317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2316CAB02A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA123A9116
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5831F8744;
	Thu,  8 May 2025 18:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRIBSlNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C71D618E;
	Thu,  8 May 2025 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728731; cv=none; b=min20reKjLE4/XofpcdtWZDYfexaBObbx05F2Lc1TYkwiN040Dm62y17fVeAl3XvH729riZaRdaN5+pLLvgNToi/vohXLYb9nT4fxw91JEidJszZ7Jw0xih+6cdIxUL2rJU0Vs7zettH9n9eCGkNNAulZ1DhvXXzxwfCtOrek4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728731; c=relaxed/simple;
	bh=yJM8+i0iPYMYmNqm1ryjBX4Or6+cWmb3ISw9re/R/1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jB43x0BS62k64QsaJZilCxa9qiq01XVbMYHPlXV3zzSPqYgmdNQZIsJNmvAvUYRM6mUQ7a2OFvQsS85D0E/IuiRjfMpcEK/NOotUdzaFBlDCiWmjIV1xYsR+FnjE5B/p0/GsxskGiMDcrSMkRAe/Pg0y3cvTX+5YUJFn6sBrMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRIBSlNf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30c1fe19b07so122817a91.2;
        Thu, 08 May 2025 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746728729; x=1747333529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waEbCrslf02j0euz1Hyel1xKxpuwwD71wy+gaLfyWXA=;
        b=DRIBSlNfN/qK05XsG3N5zmJ4Z3k9rV3LJ3Tbj0RGss8ijWCeLAKXeOjCK2s+ndajKY
         +5VWHUxejER2thakONoyI4dE1b2RH5D+xHf4CvCVTrOYNrLI8bu/HE8kv+IcukiXRKYK
         jl/zrgQZ+Il1gtjQXEWNkyBP+NgDjhe017XRqc7PZAQGCrH0Q8AI3jerrOphw+XOsXMF
         GtTHE82ZmkVy9Ectknp6A+bXRIkEI8rtHHL4voDzvTq9VM5VvzhsJDkRuCbJ6sxFCPLW
         W7faHShBEn7MENCU0jKV4Re44ttgLmcL3rvYZPgwl7zHhVRIeWy3l8X0GG/6QtTaGzZZ
         TIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746728729; x=1747333529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waEbCrslf02j0euz1Hyel1xKxpuwwD71wy+gaLfyWXA=;
        b=stPTD4hhaSJN83pXmz9sjznYu2hAFzlVC2qdHepEIue0tpzL7QacQGTUj1R5E349ne
         kblBmhtzp7cg8nz9/raz2Xu+9X4QGP+0deOwPNKYlw5NpgksRwDooFEA9hrhczK5ce6z
         OX3bKRTihocy7koz9MPRjBsgmcQc76MCxprUAglSxoNLFUJJLFh/+N3R2cUWcpYL0V2x
         oC5EObeFcEjRn7LO8IQG4yQ1TU+mbq19ckw9mOVZgVHiWtRNwaOdDUpK49Ngk/xiUdW9
         8S2a5kgfFx5kkEBfhYYvDUgz3v97Y+4BM5wuCcont1IZCEf3zM/whnLv2wnW3VmvmFz/
         xapQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4irUpddXGw6mIbUsHGqLZRaIs9OSncW8lGDhRN2NzkNzNDaFMfqlx3CGip1JBsgE7o/ePlnDxTYzmnH3@vger.kernel.org, AJvYcCXaInNZ48HOTdrphWvkSP1KS0W4uxn08foZ4jpHx84u5HaqbuMcoQdGjumyoYPXaUIZrGh/2x3YBORXBeUm@vger.kernel.org
X-Gm-Message-State: AOJu0YzNsnZ5d1yGtaZznasx/+zTpKJrb88f45eiRQttt6woy5V9pGII
	BGn5ZqxHCVQY7gfjmpkkwpz94xCTAp8lkVREjti+0yons0ivNoNDLOs9JZxb4zXNaHluIXww1Z/
	yrzE62pJKsQ76qTLgpwq6G9Y2ARI=
X-Gm-Gg: ASbGncv+0xX1rIaVqcryzBC0ToJ8MHhr1UGl5a5auuKFgNwWsZmi9TNAi6psA1ywCFD
	oCiniT/z2BBt0KEqbMHJIuUzlVGplrJcR1KhZZyuGb0GAgva1u3BIdoPx810uZGP3Kw0hAE0WdN
	XAk61zcBeSpo6ZPFg3YalAXw==
X-Google-Smtp-Source: AGHT+IHm+1k+jR7TnUT8ZSpFd7U5tcrz5KJivMD+5bDfj/leop0E5igVUwVXpDEwEgoS20vzCAfVm+cD5wr/rcq2wGs=
X-Received: by 2002:a17:90b:3812:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-30c3d669070mr276315a91.7.1746728729571; Thu, 08 May 2025
 11:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-7-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 14:25:18 -0400
X-Gm-Features: ATxdqUGGKzILlDDNdGb-69ow4qakqzEaJcVTZgzzDN8Bbo3FXuGdXfNDVeMIZAU
Message-ID: <CACu1E7H9_EkGFkjL1MRU9M-_YFHnPb5v9SxDg6fXm0m-imzC2Q@mail.gmail.com>
Subject: Re: [PATCH RFT 07/14] drm/msm/a6xx: Resolve the meaning of UBWC_MODE
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".

While this is technically true, AFAIK the only difference between UBWC
1.0 and 2.0 is that newer UBWC disables level 1 bank swizzling, which
is why I originally wrote it this way. There's a bit of redundancy
between the UBWC version and ubwc_swizzle bit 0.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index e1eab0906b6c460528da82a94a285ef181e0b479..d47726ea8818a9660eadd52d9=
7dde1489a884684 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -663,10 +663,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
>         u8 uavflagprd_inv =3D adreno_is_a650_family(adreno_gpu) || adreno=
_is_a7xx(adreno_gpu) ? 2 : 0;
>         const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> +       bool ubwc_mode =3D cfg->ubwc_enc_version =3D=3D UBWC_1_0;
>         bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
> -       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>         u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swizz=
le & 2);
>
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>
> --
> 2.49.0
>

