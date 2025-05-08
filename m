Return-Path: <linux-arm-msm+bounces-57324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C665AB037A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 21:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 414317AB42F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFF521FF54;
	Thu,  8 May 2025 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZP5A4Gc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E91C3306;
	Thu,  8 May 2025 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731791; cv=none; b=iNwUth01OsUjr0Av5wzuA31o/T9F7qMg3EHdZqgLII9P3KzSEOLf5LPldFGumzFfMBTwKxRhYxgI7BUr7AfEgc5bBLkz3nDCe4oxc0xrP2+TFiiXg0Srlyae/fRRBl6kpaUxfpBA95c1KoRV5LpeTvcOrxkf5kZWu3XPpTLkeuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731791; c=relaxed/simple;
	bh=rfmXXBVoNqTex65022lN4GHlfQgjwGemw6URhPvtZ6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMlhm70pAUrrsTGNCUYsb9S5Yl2yXDUzUuRCPmA37B+42E9jA4NAy5UBPYVVVs/gi28t2EKafJ6anGgucBtaCFoNqmkb9fdnG7/ZRk8MqiUOoXIGK6WoZcmlyLMwAySKQ4CZb8NBjS+ZJw/C6mIaJSsVmdzK3IisbIT6m5liI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZP5A4Gc; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-309f26c68b8so211594a91.2;
        Thu, 08 May 2025 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731789; x=1747336589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84mPmcLjjmYTudDd8CpbhvwzXUd0/qgapgzE5Qn/8Po=;
        b=VZP5A4GcyAB/Q4yfJRpL+4jSbh7fOlSs6vgophGBQVhIAv1SakLI9J5EISuJIKgon1
         qPNA1J4nOPsirNK2HChUZhx9UKq0CjAj1+IY+te9FsweAimWsjj78mUCUn4TnRSMGGMe
         12CBITEEW2xBNfweveJ1kxvD7Zd/aeS+CCLTULequMERRHdDnfKROOsOOLgxfLPFgjTk
         scPpuRKzMAmmes2q7RBJ+FRSrD27RWg5+jMtrPivAJFFcirj/aWsntgZWXojGrI7FjCE
         1wi7TIK6/2jQj6xYcByRNFWA9qBg3dUreXWHItKqhEbR0IqH9LmuqTqAnhaMwADKunZE
         RFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731789; x=1747336589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84mPmcLjjmYTudDd8CpbhvwzXUd0/qgapgzE5Qn/8Po=;
        b=Q/v1b/TppHCF4Q2Es55IZ5ZTrn0yuxJJXoClXJwHDWFSUQte/zRxm7jnF0cmuYEdn3
         iAZNzh/0h6glNw8QKcPamuIwKDeKiKKnKnZL+DF2QIy8GxaOqoZpt85ggRgR5cYOyNs+
         G/g/ugZPQbyMhJAYOW3amipHitUIts8hxerGxa4hh/TNvS8U27ZawcCDsvWTuhKHYDi8
         X01iqciqRa3P/3RqU1WEEdIzs09q0RxC3RUeQeUa1wxdkgZr0C0q5Nv8TUAXWAQVixIZ
         JGGpyiJjKh1itiDRCXQE4FpTa2265tvzKMtRQqvoaNrd29yWTQch9hpeH8q63c7ipu3Y
         64Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUq6jND66i3p9alq9yKcCHUrc/gnx+l/pAo/cCAjpYTRGo5q2eSC4IsOATFVoR4NCSZY47V2LkZf4rEX2v5@vger.kernel.org, AJvYcCVX8ogzeBjBIDxO6qOq/JeCukVroev3VKW9WCH7rkiMjdbMAQv8F8wdS2mh9bThoZfqa1Pm8WT9i3YTWGZp@vger.kernel.org
X-Gm-Message-State: AOJu0YyjDLlpKpFUBywSyXBm2FGpkqRM595aZgoQAgZ0hRusH32bbf3U
	Hpqgte0388iDXWdn6x+x328NwasUs0VlJk+JPL2ehUyfbM4vUQ5QeFm4wmtNp1XwAyFvXnbntLH
	IUvv9+0Y8m2tlIGwAju05+sFQ/04=
X-Gm-Gg: ASbGncsdgkCZiuxhZjkZZEr6wQxF4RdQ/mHyEqMthBuxOKmJZkChPWeKVvSjwtV1Qpn
	15U/sjRHy0BvkDvavpPOXAYBirH1YPLsS/OPK1Pq5O6My9ySlD1AyNB3mJxmpmto1B9Soyt++CD
	fCcws6LQHZDDBRoGb9m3NuQQ==
X-Google-Smtp-Source: AGHT+IFnJI/dGTw42zeAnFybyVqbxMj3ucJwVN3oeKoPAG/l010GL4Y+78qpZJpzYGlUpVf8RbqJGDcVWc6cKAm0TLY=
X-Received: by 2002:a17:90b:1b4a:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-30c3d65e755mr383705a91.6.1746731789590; Thu, 08 May 2025
 12:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:16:18 -0400
X-Gm-Features: ATxdqUGiqWT_DWApTY9ymoO6UH-6KDlDJuxswDFXWcGSKrN_vB9pf1QCaLL_Oto
Message-ID: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
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

On Thu, May 8, 2025 at 2:13=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.or=
g> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The bit must be set to 1 if the UBWC encoder version is >=3D 3.0, drop it
> as a separate field.

For these sorts of things, it's probably best to add a helper to the
common ubwc config header. Other blocks also have bits for enabling
AMSBC and similar things that also need to be set based on the UBWC
version.

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 89eb725f0950f3679d6214366cfbd22d5bcf4bc7..5fe0e8e72930320282a856e1f=
f77994865360854 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>
>         if (adreno_is_a621(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>         }
>
>         if (adreno_is_a623(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> -       if (adreno_is_a640_family(gpu))
> -               gpu->ubwc_config.amsbc =3D 1;
> -
>         if (adreno_is_a680(gpu))
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>
> @@ -642,7 +637,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
> @@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
> @@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
> @@ -675,7 +667,9 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
> +       bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
>         u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> @@ -684,7 +678,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 |
>                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
> -                 hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
> +                 hbb_hi << 10 | amsbc << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
>                   hbb_lo << 1 | ubwc_mode);
>
>
> --
> 2.49.0
>

