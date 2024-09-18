Return-Path: <linux-arm-msm+bounces-31973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95F97BFDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 19:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1611F22576
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825E51C9EA9;
	Wed, 18 Sep 2024 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTqoTda/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77DE2AC29;
	Wed, 18 Sep 2024 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726681924; cv=none; b=ta4zoRxysblQr00b6/Kbnv7C49Qt5pq9ter3mJBDlH/M9nGEImhapKPWxrBwCfvA/CVApOdYjUGHQ4S6Dqrmu52Hp7PWQykOOb5o6ASeOljNS2g3G+FEMQBMIrrV6cy4qAnZJo53atebhiJ8BjiSfXSgPwpDV6WJ5Qdj+KLYE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726681924; c=relaxed/simple;
	bh=mj8nFcIIxCHzzhwMu1RFYlqvCh9jeMP5Z6wkSYRtqfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElIjW6CAfRD4p6b1L+4k/+xaDvcimKKUClOPZzWHKKcaqMhBaNmjodaMKW3z0CQgh44IfpiNv5cxkP6GHAZ5Mx96hZYDKgoa5j2exIPMetX9uW33HbtjDA0NXa3XVauYqFs9ZpYwYzntoqOjXyt7F0yWq3GaBItF5V4DTtXNFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTqoTda/; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7db3e962c2aso304687a12.0;
        Wed, 18 Sep 2024 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726681922; x=1727286722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENDlvV+k2ihN7FXIWJUs/9L1QeoJY5NtPnVMTnrhmms=;
        b=UTqoTda/B+qKcaMd8De9/fd301VOiidHm2rVLvx+TzCX0R1ZsQN4bjvuVFN46aGoLb
         L/Bhgt5T38YCbAG51mdu6Tz6Vklr3uJEk8YwG1WfFZYNfhxBqW/HmLnJ5O34X70gIJkr
         tGXRF+oaqsI1gbjFtNjHieONZk7g1/8f92vLDwGgNeMQ1zbuLc5XfpM1NA1LhIFeiIpO
         /TAU3WqnOu/k5e6Kph1315paHXyvIAw9GdYJiJq+SgEKO/eZ6EeqqDF+/tmfRGNmc0zQ
         4bRGPmfFc5N6abbjJJuSoWFTusp5Ym1uMWW4/P5BAJFfFwTvzxBQ3hcQKUtTDai1r/iF
         9RDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726681922; x=1727286722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENDlvV+k2ihN7FXIWJUs/9L1QeoJY5NtPnVMTnrhmms=;
        b=GVpUmUGisaavRQ1TdGta0vuuo5KRrIbnMbuHhrRSn2mbQeeDP9vMS8L3dcf1OoKbUd
         LCmANg3q+SftHeMAISez7ii9WgdJ5cfiq3JqaRMt+YmwaBW4m8PhxVwKh1Cog0YONHxf
         ymehOAxtx+DmRqP/Kq8wYe99zL3bmwhyDiDbk2LcfFnH2u1r+FPnYgpdLFoNJPJiGAhq
         VVB6VHGFcJ3EZU2aulIW9hiTGTvLUJEEsBuZZGNWNqgEant/M/azkEGAT86lz/T4hzJB
         18Z2y44T83lkUEEK2KLfxVt/N89+Pa/x53QMtt080PsTgcV400tnCGYhhAYZWy5kSZ4c
         BxOg==
X-Forwarded-Encrypted: i=1; AJvYcCWouf6t1UBtlWANveQM/MCnUf1qQ7wgdIyQCTd9+i6u9/UOHTkAz+cVbALF3Nkk/LUPppyNbo3Mocwp@vger.kernel.org, AJvYcCXkeYj5YeEadWm+qDmKEUhzO5jJoHWz5ILaUFyxP2O4ifiEqE8AvsXxgcmeMteP5W94ZLCfWc7cCo0Cf4bj@vger.kernel.org, AJvYcCXqNZ2BPAhRyWiNwN6H9QOPrlk6/yCO5fKSPcnjbiOo2XSLDTTdqQ6l3ASOLOk6V+6EjEYquolCi7JTn7XmiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMjHrDGcBz8vzHE/o9NuT7d3rYgsYkJMV+NHHV8CgilUhu1MbF
	NVxHIJLxAZZdBBX4GBxr8l0FNtpkIDQ2rlhTa8Fw8H4khSvAIN6si74HnwFxOASFTltBksIc5uu
	BVzkPipPBNqRa+W/HS13S/gQSUUE=
X-Google-Smtp-Source: AGHT+IGl24GCLZbvMHh7TRhbzUZeL22U2do6IjT0xh3HcCz7pBaY6uhEYjhMYxPhuWZ2i/EP9WFfZrfcnG8qFj36Fe0=
X-Received: by 2002:a17:90b:78e:b0:2db:60b:366a with SMTP id
 98e67ed59e1d1-2dba007f424mr10737301a91.9.1726681921950; Wed, 18 Sep 2024
 10:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com> <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
In-Reply-To: <20240918-a663-gpu-support-v1-1-25fea3f3d64d@quicinc.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 18 Sep 2024 18:51:50 +0100
Message-ID: <CACu1E7FGMX8KTbhS1HAEumD9Dx7K334bnJecg14-mSQBaZ4V5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/a6xx: Add support for A663
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 9:39=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>
> Add support for Adreno 663 found on sa8775p based platforms.
>
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 19 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  8 +++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c     | 33 +++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  5 +++++
>  4 files changed, 64 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 0312b6ee0356..8d8d0d7630f0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -972,6 +972,25 @@ static const struct adreno_info a6xx_gpus[] =3D {
>                         .prim_fifo_threshold =3D 0x00300200,
>                 },
>                 .address_space_size =3D SZ_16G,
> +       }, {
> +               .chip_ids =3D ADRENO_CHIP_IDS(0x06060300),
> +               .family =3D ADRENO_6XX_GEN4,
> +               .fw =3D {
> +                       [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] =3D "a663_gmu.bin",
> +               },
> +               .gmem =3D SZ_1M + SZ_512K,
> +               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> +               .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +                       ADRENO_QUIRK_HAS_HW_APRIV,
> +               .init =3D a6xx_gpu_init,
> +               .a6xx =3D &(const struct a6xx_info) {
> +                       .hwcg =3D a690_hwcg,
> +                       .protect =3D &a660_protect,
> +                       .gmu_cgc_mode =3D 0x00020200,
> +                       .prim_fifo_threshold =3D 0x00300200,
> +               },
> +               .address_space_size =3D SZ_16G,
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x06030500),
>                 .family =3D ADRENO_6XX_GEN4,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 06cab2c6fd66..e317780caeae 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -541,6 +541,12 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu =
*gpu)
>                 gpu->ubwc_config.macrotile_mode =3D 1;
>         }
>
> +       if (adreno_is_a663(gpu)) {
> +               gpu->ubwc_config.highest_bank_bit =3D 13;
> +               gpu->ubwc_config.ubwc_swizzle =3D 0x4;

It's already been mentioned in the Mesa MR, but since this is the
first GPU with level2_swizzling_dis set, the relevant vulkan CTS tests
need to be tested with
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
rebased on your Mesa enablement patch.

> +               gpu->ubwc_config.macrotile_mode =3D 1;
> +       }
> +
>         if (adreno_is_7c3(gpu)) {
>                 gpu->ubwc_config.highest_bank_bit =3D 14;
>                 gpu->ubwc_config.amsbc =3D 1;
> @@ -1062,7 +1068,7 @@ static int hw_init(struct msm_gpu *gpu)
>         if (adreno_is_a690(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x90);
>         /* Set dualQ + disable afull for A660 GPU */
> -       else if (adreno_is_a660(adreno_gpu))
> +       else if (adreno_is_a660(adreno_gpu) || adreno_is_a663(adreno_gpu)=
)
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>         else if (adreno_is_a7xx(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/=
adreno/a6xx_hfi.c
> index cdb3f6e74d3e..f1196d66055c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -478,6 +478,37 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_=
bw_table *msg)
>         msg->cnoc_cmds_data[1][0] =3D  0x60000001;
>  }
>
> +static void a663_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /*
> +        * Send a single "off" entry just to get things running
> +        * TODO: bus scaling
> +        */
> +       msg->bw_level_num =3D 1;
> +
> +       msg->ddr_cmds_num =3D 3;
> +       msg->ddr_wait_bitmask =3D 0x07;
> +
> +       msg->ddr_cmds_addrs[0] =3D 0x50004;
> +       msg->ddr_cmds_addrs[1] =3D 0x50000;
> +       msg->ddr_cmds_addrs[2] =3D 0x500b4;
> +
> +       msg->ddr_cmds_data[0][0] =3D  0x40000000;
> +       msg->ddr_cmds_data[0][1] =3D  0x40000000;
> +       msg->ddr_cmds_data[0][2] =3D  0x40000000;
> +
> +       /*
> +        * These are the CX (CNOC) votes - these are used by the GMU but =
the
> +        * votes are known and fixed for the target
> +        */
> +       msg->cnoc_cmds_num =3D 1;
> +       msg->cnoc_wait_bitmask =3D 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] =3D 0x50058;
> +       msg->cnoc_cmds_data[0][0] =3D  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =3D  0x60000001;
> +}
> +
>  static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>         /*
> @@ -646,6 +677,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gm=
u)
>                 adreno_7c3_build_bw_table(&msg);
>         else if (adreno_is_a660(adreno_gpu))
>                 a660_build_bw_table(&msg);
> +       else if (adreno_is_a663(adreno_gpu))
> +               a663_build_bw_table(&msg);
>         else if (adreno_is_a690(adreno_gpu))
>                 a690_build_bw_table(&msg);
>         else if (adreno_is_a730(adreno_gpu))
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 58d7e7915c57..10f8f25d8826 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -455,6 +455,11 @@ static inline int adreno_is_a680(const struct adreno=
_gpu *gpu)
>         return adreno_is_revn(gpu, 680);
>  }
>
> +static inline int adreno_is_a663(const struct adreno_gpu *gpu)
> +{
> +       return gpu->info->chip_ids[0] =3D=3D 0x06060300;
> +}
> +
>  static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
>         return gpu->info->chip_ids[0] =3D=3D 0x06090000;
>
> --
> 2.45.2
>

