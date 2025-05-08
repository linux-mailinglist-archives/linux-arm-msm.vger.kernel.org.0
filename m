Return-Path: <linux-arm-msm+bounces-57322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0CFAB0350
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 21:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6132F3B5380
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 19:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D3F284B25;
	Thu,  8 May 2025 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ1x9rPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FA41E1E1D;
	Thu,  8 May 2025 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731052; cv=none; b=RGARRG+mg6DCdagEE88fdiX0nfSY2fqAMXH5zDY4KQ5ySbm/5vK4GsKC7wHJ38edp1PK4QHpZejBh+Wxo7wjxYYvO7iaSDcJn2g2jdyC32c0fU9Ih1cw72qlpTV6eefnOmYstIe5kEBNcsIieRuY2J918JUc4YaHP2ThHgBkoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731052; c=relaxed/simple;
	bh=FdcF8LPvFEIRjFb8Vt4CZNA/AGk0yOvi119CvlwEVgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lK1Jpl8HppN92c6XgdBjuOzo7GPzRfOVDoK0DtHIzU4wAnSe3GUpgmXOTJ9TKXut4AH1W6sCE1Vyh+hWA2A2Qw92TOEzkLUAJ8Afut+eUpr6hvn2LEcTScCJiunMMJ7GwCsn0IQ3lPS9pkFc8ofUeo/R+HUbsMJAAzDMKFzLsSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ1x9rPb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e19c71070so2332975ad.3;
        Thu, 08 May 2025 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746731049; x=1747335849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjUfrthWG0OAqJqpUOlt7CMN4+3EkPk7d8LdTb15dXI=;
        b=MJ1x9rPb3gOlc0NeToxBFsw9M4Mn43b3Xyk7IiOqFbOzKq+6VAYe/ot/Y710NwWi12
         PWKITlB3OKlgTDh13fntsoRR+jsecuVLGRDPsAPEvnoL6sRlp9TtZ+paCnQH70cgFtMQ
         AU8Xhcsu83UxMsf1zTIFXtCG8DiF3Byt6ruDOzvCrk+F+zz925Zdd8NNOOz/EmuYlEVd
         1Yw+bCdiFjkGUSR6vPwSakhKtSUffKSbTaFVOCQV2VSkpHlPhzw72ATSt27JFXq3Ft/9
         +CZWHWexviuz36VTfFF+6qEHc7ii/EN7650ogkXXSnhnvbXSHFbncMEPJrHDcpv6jxlm
         B9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746731049; x=1747335849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjUfrthWG0OAqJqpUOlt7CMN4+3EkPk7d8LdTb15dXI=;
        b=SKhIA0cuLExusuLmnL6dFsjDoXLejA5ux2CxczUvPcRXH7TAVtEd8eOPyzRqjuQAFT
         /4AmS8dlwD1g5ihTWAxTBPOZYoz9aIRkQQKAM+4Fmi9ZPQwS8Wix9Clbkse15LRU/EJv
         jTrjsXxjlghH27s3O24l5sndUQSqUQ9hOVYHoyp230WHdk2be20OfrPcVap3GTGu4pYt
         qsiJXix+q2Lr/axt+OfzV+Sa/i+plB3QZgdZHO5XeP2y49E5CzUqPuS8xssFBGsrXp7R
         GNPtoWKaabgr7EMg1eE1hVVBLOO3SIIpScNbCxG9bol8aX6dXnrjohv55BxhTWDvVX07
         AAeg==
X-Forwarded-Encrypted: i=1; AJvYcCX9rjEMnywmo1RbHGpgiGKeZvjVxo7tl55jBYaXPt6Uivrnh2eeuencSpkZWFFuDiMJCnUyHnuEws4lhqZU@vger.kernel.org, AJvYcCXtqSeG5MAVj0VT6p+qsup1kMlAQ7Zij8vyrAV0AqQNya8qy4O6kUbZcF4QxpoTZUJj1lVcmNL+QxLLJqsq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+hoVCNvYMmkcL/HazhRVAQ+8OmQhdOLotQdmqi3q8roDZDC1
	WRQH+Al5SESWAb9cpLDGyL8Zfv7I9WO02JGBlrSBfBc/I50VMiUQnV2uxBKRBgWrM6ANfqALe+l
	6DhCAEr0o7B1T5U7B0EjPutPBOE8=
X-Gm-Gg: ASbGncvgRY1WUeulZL8LaqPCSmnX0w32IIuEsGwGL/zxh4wMJA6DTDrrEd2hz/hGaZK
	gqMoFclz0r9C2RSRgBfJcK2DXl8DHQkQfogHMGPmz0XP0+CvJ+8din2zcNeAWc0KsO9Hf8XSXIy
	aiaLM3Nm52hFRE9bkMcvPJpkM+bQCWwqNb
X-Google-Smtp-Source: AGHT+IF2U5RrRWVsjD/rdOOI2zHFPBHUJygHQOjsEtJ1IQeu1u/Zg3M/zmOTehGOWHK6OpBIjEPkLTtu69d/6B9UZKQ=
X-Received: by 2002:a17:903:2988:b0:22e:663f:c4c with SMTP id
 d9443c01a7336-22fc918876bmr2639425ad.11.1746731048740; Thu, 08 May 2025
 12:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com> <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 8 May 2025 15:03:57 -0400
X-Gm-Features: ATxdqUHFkruH16jzsyUYwEx6TLTP20FKQA0OEl9aKVD3zll2cLYYh9IBmKdgRbM
Message-ID: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
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
> The value the UBWC hardware expects is 13 less than the actual value.
> To make it easier to migrate to a common UBWC configuration table,
> defer that logic to the data source (which is currently a number of
> if-else statements with assignments in case of this driver).

Don't break the value exposed to userspace!

Connor

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  7 +++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++-----------------=
-
>  2 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index 650e5bac225f372e819130b891f1d020b464f17f..67331a7ee750c0d9eeeead944=
0e5d08b1a09c878 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -833,8 +833,7 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>
>         gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +       hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>
>         gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>         gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
> @@ -1792,9 +1791,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *de=
v)
>
>         /* Set the highest bank bit */
>         if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
> -               adreno_gpu->ubwc_config.highest_bank_bit =3D 15;
> +               adreno_gpu->ubwc_config.highest_bank_bit =3D 2;
>         else
> -               adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
> +               adreno_gpu->ubwc_config.highest_bank_bit =3D 1;
>
>         /* a5xx only supports UBWC 1.0, these are not configurable */
>         adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index bf3758f010f4079aa86f9c658b52a70acf10b488..b161b5cd991fc645dfcd69754=
b82be9691775ffe 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,32 +592,32 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>         gpu->ubwc_config.min_acc_len =3D 0;
>         gpu->ubwc_config.ubwc_swizzle =3D 0x6;
>         gpu->ubwc_config.macrotile_mode =3D 0;
> -       gpu->ubwc_config.highest_bank_bit =3D 15;
> +       gpu->ubwc_config.highest_bank_bit =3D 2;
>
>         if (adreno_is_a610(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>                 gpu->ubwc_config.ubwc_swizzle =3D 0x7;
>         }
>
>         if (adreno_is_a618(gpu))
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>
>         if (adreno_is_a619(gpu))
>                 /* TODO: Should be 14 but causes corruption at e.g. 1920x=
1200 on DP */
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>
>         if (adreno_is_a619_holi(gpu))
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>
>         if (adreno_is_a621(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>         }
>
>         if (adreno_is_a623(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 16;
> +               gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -636,7 +636,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>             adreno_is_a730(gpu) ||
>             adreno_is_a740_family(gpu)) {
>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR=
4 */
> -               gpu->ubwc_config.highest_bank_bit =3D 16;
> +               gpu->ubwc_config.highest_bank_bit =3D 3;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -644,7 +644,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *=
gpu)
>         }
>
>         if (adreno_is_a663(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.highest_bank_bit =3D 0;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.rgb565_predicator =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> @@ -653,14 +653,14 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
>         }
>
>         if (adreno_is_7c3(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.amsbc =3D 1;
>                 gpu->ubwc_config.uavflagprd_inv =3D 2;
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
>         if (adreno_is_a702(gpu)) {
> -               gpu->ubwc_config.highest_bank_bit =3D 14;
> +               gpu->ubwc_config.highest_bank_bit =3D 1;
>                 gpu->ubwc_config.min_acc_len =3D 1;
>         }
>  }
> @@ -668,13 +668,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> -       /*
> -        * We subtract 13 from the highest bank bit (13 is the minimum va=
lue
> -        * allowed by hw) and write the lowest two bits of the remaining =
value
> -        * as hbb_lo and the one above it as hbb_hi to the hardware.
> -        */
> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +       u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit;
>         u32 hbb_hi =3D hbb >> 2;
>         u32 hbb_lo =3D hbb & 3;
>         u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>
> --
> 2.49.0
>

