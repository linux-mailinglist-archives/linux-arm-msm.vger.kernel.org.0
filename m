Return-Path: <linux-arm-msm+bounces-48418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD83A3A55F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 19:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5F9175523
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E538B17A2EB;
	Tue, 18 Feb 2025 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2s1mFEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342ED2356A1;
	Tue, 18 Feb 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739902993; cv=none; b=tHBij7w2xVvS1RRbctT+iiLA++KY3TKK8SJJYmHIEb4fzD2nuDGPJH4mfboJmAbPIT1NKEo+czekgWZtLcCEc9IceAjHucl0WFPfxP0qmF5hcS0Qo1/tLXLGcEb1/USiDSjo0AvjfQt+BLjUaAdioBMjp+V6tzEbbC9WTjU1Oak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739902993; c=relaxed/simple;
	bh=nGJUJkNAzAszvjWSp5A8aZOciq+2ykmFPOpWSTnQFC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuBbtLnQbCRdLzkpkuKf0JW/FfHYDj0dyiFo+LzqJNQXTs6DYWtOZT9B+o/CIGL8ZfGsQVVdkRT6SzyTNLpU4xXZ4vCnTMPBq/xT519siiMBF2uxvZnUNvuzawa7CkEKJgPfX8UhxXE5g5iWtn1g46HsMv2V9mdEbDMXCYBgBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2s1mFEz; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-855a8c1ffe9so24670439f.1;
        Tue, 18 Feb 2025 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739902991; x=1740507791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z21PGtMoKOkP6/rqvgbqZXruaILXexhwG8Q6wG3Y9zo=;
        b=B2s1mFEzNwluHyBO3ppUy+mm1qEOCEev3P/SxKGwC7tTjxh1pomLtQmMcbJ3uW9d8L
         Vlwg3Y+9C73ou3cVpKjoBkQQzaxOl6Z3G6jt5GwQE/lOU+R9AKvB3KpKMYrOd81qs+Ju
         1jwBdGxxYq5U6j8vn3xyckLCoi6kFYDTDSvrisXtyKPU9m7GClQiXSO4Z3/Jrf32gB0g
         RA+bJkLiebs4BEeW9rgK9aHn1mUcfqsg8YDPtdjEoKcEggp6BiY6xs2Qi29SHjf+Rvzj
         w55Mr1GgHZHC+bKIWOdnTfFmO2hW3MSyPHW/VmsB1YshhJe9Vv+03k7t5o4vhixWRt6V
         pktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739902991; x=1740507791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z21PGtMoKOkP6/rqvgbqZXruaILXexhwG8Q6wG3Y9zo=;
        b=tKSx7W3rTjofF1SFoGOEUg0DYQvhBQ+esumaiyp3ATAOtFztPJZ5fJY9QS7NNT+P4U
         lwK4OC2MkrTEda3Q7EbfNeFXaVtweOi8CuR/uwF5BWqvik7aboa5KsMj5YSyFGEST3RN
         WZH0aM2hMnIiBAgIkzsyoO6U9DLvnjoCzr6FqoEi5WU1mV1zVrisXOhSZlyOsqvlzKcv
         6CpZtoApqbUlG2r3SomgM5b6fAS0DbwXS8anJZZIQcozQo2oTyGdu9sIpfOA4M0dSNh+
         YXmsgKZxNGSpilBRag0RR/TI2eyvRaqOX2vr2eQdFewL+nzRU2UccBUrYYenRtxZEXAj
         zBgA==
X-Forwarded-Encrypted: i=1; AJvYcCUtsC/fNstRZrfFTo4htZZdtDhFoU7ATDMHmKDTssiXyL4W8o9ZbsjZ7xTa1rjGMHQj2fATemohuxJ1@vger.kernel.org, AJvYcCVTwWmYHn3iWM8OeY07FehYHAve29QMF5QtLCTFBL7ugvVT/3JZcVzZric2fkE57QzS1v0V4WQmFrCSqnY5@vger.kernel.org, AJvYcCX3bJvtF7COdzSy7qdTJDnG9iY0R0OtFT8fwPY2KWgOi3sFkMGoSm25QinhOM4RIQwWnH6FhhldfKDRrLrWzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYFf/1x6eJs2tmCkgh3bU0dlBPD3Uw5dkFS9CG0EfOuX0dx3Kn
	KN3OVYCgrmX5IynZk/yfXtkd+VyuFUpj6I8nJ3jiCQgaLmLbI619LoRNeDRicp+bSGQciDAEivM
	RdVNXgx1V+OqutDPmCmgB8VUmjsQ=
X-Gm-Gg: ASbGncuZyEl6jZfgncK5ie3+UwBoQu8ph3fjahbNbl+iF25+1qHhvsEV2PUumLuRd9d
	6n03vRUaueUEVXDQpNtsL6xQmvKiypytO4+sV+uyvpYAun+VNJw6Jas86dlBnFjofnvXWKMJ+7G
	2+cVZ09n59ffl0CZINgJ/1kEgMhoo=
X-Google-Smtp-Source: AGHT+IH6m+3JpSoefsz/wCPh++hcK26qXs4lJwUORXK0FJ65ByGufreIwlwfoIgDMMvRpdHdGUsMMLBHV/pse5FopSc=
X-Received: by 2002:a05:6e02:20c7:b0:3d1:883c:6e84 with SMTP id
 e9e14a558f8ab-3d2807b9b5fmr128847205ab.8.1739902991169; Tue, 18 Feb 2025
 10:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com> <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
In-Reply-To: <20250213-a623-gpu-support-v1-1-993c65c39fd2@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Feb 2025 10:22:59 -0800
X-Gm-Features: AWEUYZnNPg2AfVlGCXj9pinFkd16J3E28yQ3KeG-PhyvgCV6j8swgW1l6ohQvEk
Message-ID: <CAF6AEGvDR1md6D2dnqJWOW5v3t2wnaC29VD1fyX5q48bzqEkHQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/a6xx: Fix gpucc register block for A621
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 8:10=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> From: Jie Zhang <quic_jiezh@quicinc.com>
>
> Adreno 621 has a different memory map for GPUCC block. So update
> a6xx_gpu_state code to dump the correct set of gpucc registers.
>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 17 +++++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.c
> index 0fcae53c0b14..2c10474ccc95 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1214,12 +1214,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu=
 *gpu,
>         struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
>
>         a6xx_state->gmu_registers =3D state_kcalloc(a6xx_state,
> -               3, sizeof(*a6xx_state->gmu_registers));
> +               4, sizeof(*a6xx_state->gmu_registers));
>
>         if (!a6xx_state->gmu_registers)
>                 return;
>
> -       a6xx_state->nr_gmu_registers =3D 3;
> +       a6xx_state->nr_gmu_registers =3D 4;

nit, this and splitting out a6xx_gpucc_reg from a6xx_gmu_cx_registers
could probably be it's own commit

BR,
-R

>
>         /* Get the CX GMU registers from AHB */
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
> @@ -1227,6 +1227,13 @@ static void a6xx_get_gmu_registers(struct msm_gpu =
*gpu,
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
>                 &a6xx_state->gmu_registers[1], true);
>
> +       if (adreno_is_a621(adreno_gpu))
> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a621_gpucc_reg,
> +                       &a6xx_state->gmu_registers[2], false);
> +       else
> +               _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
> +                       &a6xx_state->gmu_registers[2], false);
> +
>         if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>                 return;
>
> @@ -1234,7 +1241,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *=
gpu,
>         gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>
>         _a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
> -               &a6xx_state->gmu_registers[2], false);
> +               &a6xx_state->gmu_registers[3], false);
>  }
>
>  static struct msm_gpu_state_bo *a6xx_snapshot_gmu_bo(
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/dr=
m/msm/adreno/a6xx_gpu_state.h
> index dd4c28a8d923..e545106c70be 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
> @@ -363,6 +363,9 @@ static const u32 a6xx_gmu_cx_registers[] =3D {
>         0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
>         /* GMU AO */
>         0x9300, 0x9316, 0x9400, 0x9400,
> +};
> +
> +static const u32 a6xx_gmu_gpucc_registers[] =3D {
>         /* GPU CC */
>         0x9800, 0x9812, 0x9840, 0x9852, 0x9c00, 0x9c04, 0x9c07, 0x9c0b,
>         0x9c15, 0x9c1c, 0x9c1e, 0x9c2d, 0x9c3c, 0x9c3d, 0x9c3f, 0x9c40,
> @@ -373,6 +376,17 @@ static const u32 a6xx_gmu_cx_registers[] =3D {
>         0xbc00, 0xbc16, 0xbc20, 0xbc27,
>  };
>
> +static const u32 a621_gmu_gpucc_registers[] =3D {
> +       /* GPU CC */
> +       0x9800, 0x980e, 0x9c00, 0x9c0e, 0xb000, 0xb004, 0xb400, 0xb404,
> +       0xb800, 0xb804, 0xbc00, 0xbc05, 0xbc14, 0xbc1d, 0xbc2a, 0xbc30,
> +       0xbc32, 0xbc32, 0xbc41, 0xbc55, 0xbc66, 0xbc68, 0xbc78, 0xbc7a,
> +       0xbc89, 0xbc8a, 0xbc9c, 0xbc9e, 0xbca0, 0xbca3, 0xbcb3, 0xbcb5,
> +       0xbcc5, 0xbcc7, 0xbcd6, 0xbcd8, 0xbce8, 0xbce9, 0xbcf9, 0xbcfc,
> +       0xbd0b, 0xbd0c, 0xbd1c, 0xbd1e, 0xbd40, 0xbd70, 0xbe00, 0xbe16,
> +       0xbe20, 0xbe2d,
> +};
> +
>  static const u32 a6xx_gmu_cx_rscc_registers[] =3D {
>         /* GPU RSCC */
>         0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
> @@ -386,6 +400,9 @@ static const struct a6xx_registers a6xx_gmu_reglist[]=
 =3D {
>         REGS(a6xx_gmu_gx_registers, 0, 0),
>  };
>
> +static const struct a6xx_registers a6xx_gpucc_reg =3D REGS(a6xx_gmu_gpuc=
c_registers, 0, 0);
> +static const struct a6xx_registers a621_gpucc_reg =3D REGS(a621_gmu_gpuc=
c_registers, 0, 0);
> +
>  static u32 a6xx_get_cp_roq_size(struct msm_gpu *gpu);
>  static u32 a7xx_get_cp_roq_size(struct msm_gpu *gpu);
>
>
> --
> 2.45.2
>

