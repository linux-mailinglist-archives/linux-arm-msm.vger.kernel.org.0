Return-Path: <linux-arm-msm+bounces-57323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD5AB0358
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 21:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2C517D33B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700A028750E;
	Thu,  8 May 2025 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfKcn8dF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC21E1E1D;
	Thu,  8 May 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731137; cv=none; b=tOPN3a2R2w1e3vjgGNUtH7aBPCBBNzIaHC1XXVRDf460uimRjRyzyCFe7ZDt37twl+FAuD3N6ODzoROlF2gPx67y2AGN4+mofqRFCQj6Un+d0QNiubpGgUAnbrkbmnHlbUE1QmV6+kCUHPhFPK5LbzY2h+6TtEBIAzgZN5/FIyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731137; c=relaxed/simple;
	bh=sS/epSykFZ6DI+EJUMxuYnkugabcqE6zUKwXh7G580I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSrjsZdlPVbQs4S8zVouZ7wOaDTsACUjsAl4HCiEqW9Bp1rnXHg7mqlxkNorMvkdv0F+Y3BTKHHTUDiRAYMQJ/qLyXjIRuv3X0QlKHTRD+HLlPBaMgOKqai4ga2TrG4OECYHs/CAQUSLox0ghAm7rtnlmunpAGJRrYha7wh5dsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfKcn8dF; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30a8c177f39so228037a91.3;
        Thu, 08 May 2025 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731135; x=1747335935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVloRZR4q+d4Nf07z3vdE4Ds2g+KkLZGb5NDJRX0JWM=;
        b=UfKcn8dFALmoYchpczjbNfeAImQ1FL+VawZm7GJhIXpkyRaNoVja9JHdszvSgYci2t
         htCl6QAr6NOhvynNoYF2O2Zg8ztJWOQtlLGacPluB/ODQIbPvIiKuWSy/8Cst7iUL7tg
         8i1j2Ypn/67mndMe/2TSa/5V2LDTFD9yh89KKgYLzyrlP7DWKbCaP20yR+03cpH9DynP
         C+8qMQaUayGmXV9qUFpIceiSxiVcYTT+oNT0f5LDPwNfMSdKFfC+db2ipTYxHfxZzu7m
         g5ErJycvl9EiYvBqEiKhmh4fkb3eM8fptGKB4K71Xpl4xwxuTY0go4fjHnyE0y1w0hkm
         zH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731135; x=1747335935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVloRZR4q+d4Nf07z3vdE4Ds2g+KkLZGb5NDJRX0JWM=;
        b=m3pgLjufQMBgKiYJnqHXa0/P5oZM1bzr3XXec/Otkizu4dh6ccUZqlJjMHCFCmv8Sp
         VQmErEu2ppfQgRVC2nybFxbnUvYuejt84+pg4oh27J2wu3Jo/+zSIZjzjXei7GZenwuZ
         cg3ppONUT6xb5owM6cpv4pVqnOGp61/4mJ22vdS3k61HoRgo3ROyun7uGM7XcpPsH8uZ
         57HAyWR86OsczBDDuZ1Pb8hFpDehPMD5JbcF9y687XgLi+gzwaVbyEpQ+0WLYx3UdZy/
         f3MD9Ce97Y14NtakgOSiBai9dPJKMth0YcoL9v1d7BkXL52TigfY7wzv+2F0dwLd5344
         dB4g==
X-Forwarded-Encrypted: i=1; AJvYcCVyDbyIddLS44K9JaoQZP3nfRzxfRpGyr8ia6iCDeFO0DLhCr1rG8E6qi5xKOPBHtvCDKirJDC4B0d8aIwD@vger.kernel.org, AJvYcCXOC6EZK5W5OfEg3HLdhdvB7BVu3g1HCik4oC+QRykoDyUbk37wADkxb9PMUqMBfRgHzhRfe2pWP1oDVjKl@vger.kernel.org
X-Gm-Message-State: AOJu0YxopJjWRXbXu7D+QCK4RywXlcoJLmHc+Hor2isQuCD/bvhynu5P
	A8TZsq8f66luKCULRI3D9WbeK44P2Zt807YyoRL8WoF/D1bMx4cEumZyVhb3/kzS0vKa2mDIDun
	ds35YsZjWf/KMjVsBLFNZuj28Iyk=
X-Gm-Gg: ASbGncsF9JImdIuCACWX2HDolF6Zq0lBeIgsD+ts4EFbH+PcYns939BEOBFebUfHPDv
	Lql4S+nzyw9O3uAY4U97fE7HaHQLVV5KaNi4sjqOH2n916FdzTHgJvaaEZDqo8+hDmaZDjU7cjN
	ifhCOoMtPK0srzaX4+8Wh1sw==
X-Google-Smtp-Source: AGHT+IHpN+OC2iYdrhKTStqjYyKZ1rIYx9pH7FOJpBnD2MuxinYne5QVDK3a9rLQwnVLE6gUQjHWawxKMi2T8atvwtM=
X-Received: by 2002:a17:90b:3a87:b0:306:b593:4551 with SMTP id
 98e67ed59e1d1-30c3d6558ffmr367378a91.6.1746731134924; Thu, 08 May 2025
 12:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-6-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:05:23 -0400
X-Gm-Features: ATxdqUERPcEjxJMCCMNwgqDCibVUtJOP8nd1dhiaGM8MG_KVqvI5Lb88TfZWGbo
Message-ID: <CACu1E7G8QEoadxOGOi22QCePR5C7X81wRZ2yzLGCaA8Um63ibA@mail.gmail.com>
Subject: Re: [PATCH RFT 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
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
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".

Can we also set this based on the UBWC version?

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 5fe0e8e72930320282a856e1ff77994865360854..e1eab0906b6c460528da82a94=
a285ef181e0b479 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -593,7 +593,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>                 return -EINVAL;
>
>         gpu->ubwc_config.rgb565_predicator =3D 0;
> -       gpu->ubwc_config.uavflagprd_inv =3D 0;
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
>         gpu->ubwc_config.macrotile_mode =3D 0;
> @@ -615,15 +614,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>         if (adreno_is_a619_holi(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>
> -       if (adreno_is_a621(gpu)) {
> +       if (adreno_is_a621(gpu))
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
> -       }
>
>         if (adreno_is_a623(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> @@ -638,21 +634,18 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
>                 gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a663(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x4;
>         }
>
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 1;
> -               gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> @@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *g=
pu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       u8 uavflagprd_inv =3D adreno_is_a650_family(adreno_gpu) || adreno=
_is_a7xx(adreno_gpu) ? 2 : 0;
>         const struct qcom_ubwc_cfg_data *cfg =3D adreno_gpu->common_ubwc_=
cfg;
>         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>         bool amsbc =3D cfg->ubwc_enc_version >=3D UBWC_3_0;
> @@ -689,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
>                   level2_swizzling_dis << 12 | hbb_hi << 10 |
> -                 adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> +                 uavflagprd_inv << 4 |
>                   adreno_gpu->ubwc_config.min_acc_len << 3 |
>                   hbb_lo << 1 | ubwc_mode);
>
>
> --
> 2.49.0
>

