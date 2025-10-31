Return-Path: <linux-arm-msm+bounces-79966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA29C27362
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 00:43:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBE994E1ED8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 23:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8733328633;
	Fri, 31 Oct 2025 23:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kfmsYSQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18E82566F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761954218; cv=none; b=Pbl+oINLe1yK0bkNeOptVmSBA0Eh5mftjwd6qBohNG/2o6Gpjh4JToGHGh7YS0Ik1KmyHpMsMPPKkQWicgUqRSek8+0nCosxfCon3vrjqmrEJhQPsuCKOriMlYzwolYMWx72cXlw61/L/2GEuZYJySbTg5pqn9V4e5uzuXE/+jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761954218; c=relaxed/simple;
	bh=gX56oJ4Q+MI6yMndT8b3t4Z272uCDYxLMfaDCQFxRSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXAaoPNdM9JJBlzSrI/W6Q/5VLBuhQSCFYC7cm3mduXlti/SHuVwi3/OZlMN6JKkaLdeiH+7PTRGA3Q61m0sy1E6mGTKfG/J/Odm2ugvjkHOby8VKu1fI3vgP3aJo9I5OTtWg4oOWfQbGOUACHqDoJm/XkvNWBJszu3h2PkH0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kfmsYSQD; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63bc1aeb427so3078020d50.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 16:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761954216; x=1762559016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgO/DWOmuj6w8q58zdaOU7zMQCVZmvikJjSVWAUKf5k=;
        b=kfmsYSQDJFTqs7LwCT6IfsNPk4JQ1Gf/L04FH7h9C0VAGdyZw0oBM6xvdyers6DvO0
         sysFbQBHszF+5qk6todTlzsaRsQlkMNrR4WFh0PV5W2qa7bHhSJKFRPg3C3XD9w1qqph
         Sk81TU5SxxylQdI67T2iQnb/cDZuUGgteX/9FfWbZ53fyiF9zADnY4FS+tzJmaJtKJvW
         OuTwDfWv3j6cI018zyTcC5hadf02vflZU8K953S05wP6jj2+IhjqN8r1hN6mBHBhIEYV
         PQ0rVfNyLEC9WoghEE10MZ7+lSywm9JRLbYzpLbny3sIGDg3zf+wFAPpuauuIw45LEi4
         lHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761954216; x=1762559016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgO/DWOmuj6w8q58zdaOU7zMQCVZmvikJjSVWAUKf5k=;
        b=LvT1Z9+GXfZ2h5i6X7B/cfhTWp6ELaJ5uGuXkeroAZ6uNBGYhbBBOMn2goUUbve1L6
         70CfieDF1fQDiLerr5z1qI53VUam61qeWA4Iyj5BjVZ/HxLPg3D5a5CBPtJ+wwom2SXs
         W6/+cWr79xMo0gsbiMumMlRwSMMnpvuLT9okPQl0oBFz0tyfJ0+ZiAMgmNmTvkttB62F
         uzYvJU/m0qz1i7lkNeOSICCGgSrqI0vHO9ZOixXHhokmVfGeSC2m9k58O9K/ib2vcbur
         5o2qwMfyMgIUvsBg/AGSKBs72mS8P/5pI2yBmQISnX3D6NU9XYONh8Is00Qy3F2KnXGR
         A9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWweulpTcUH+K7NumUkX7C4U/ktZZ+igfmnVu7tVd2nL47gjgs9aOzw5esX7xVUVlJyOH5c5ETX7KqmvBTu@vger.kernel.org
X-Gm-Message-State: AOJu0YyTjv/gnhzACGeWdY8PUhdQu/8r6+zlXiEF5z61yINHZ1ewKQC5
	AxgZrkOsBt+ErLJtydGfnGb1mE8BgczbgW8tzwPlDUBkp1IMSPNt6rpN+zu7ZoQYKasqY1Tcxq6
	ahCtnsbXbtLhdVom79tYMQfbbrglT7w4=
X-Gm-Gg: ASbGncts2lDJYTP6xoVaCmffdNEWdtidSsqCaE5wgHx2qlpeaALQr3clRLQSPt/gOzG
	GGIy9MgQbib6IUg2HNDr7r0LxgSvtFBVAy3NX2xybyaj8RosvK+LFQZwkIHlriwfFzEZiIZgeeR
	7czjzuRbSdjUpbfbc3xtRgBwpps9YQES1msyZFZkWkRkMHBEh0Ql1vU61F85FzSfYrGf51Cx3sw
	Od/dIs5lMFGhrVAr/XXzqUWswqWe6so2wTgRIpvZcvG9sscUEChF/HLA3MqXYCghcr4nG87qDjp
	j+0xRE/Lgrqh5Y09cA==
X-Google-Smtp-Source: AGHT+IFK5Mg3P3wWGK+GySaVQXlBC0Ubey7TBZYaOxffUY/BqMs0ME8D/+JRN26TZyPOSuTMs+miZG2jn3GWI721SSE=
X-Received: by 2002:a05:690e:d8b:b0:63f:9f4a:3ea with SMTP id
 956f58d0204a3-63f9f4a0557mr1762776d50.19.1761954215782; Fri, 31 Oct 2025
 16:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com> <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 31 Oct 2025 16:43:25 -0700
X-Gm-Features: AWmQ_blqeY-HldrhXd9X3mz1P5MLF3t6WOznNDOk6v6bu4NoTLrVvav3xvoKWiY
Message-ID: <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add the IFPC restore register list and enable IFPC support on Adreno
> X1-85 gpu.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  3 files changed, 79 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/=
msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9b27f=
08a5b1eeb08dced 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[] =
=3D {
>
>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
>
> +/* Applicable for X185, A750 */
> +static const u32 a750_ifpc_reglist_regs[] =3D {
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> +       REG_A6XX_SP_NC_MODE_CNTL,
> +       REG_A6XX_CP_DBG_ECO_CNTL,
> +       REG_A6XX_CP_PROTECT_CNTL,
> +       REG_A6XX_CP_PROTECT(0),
> +       REG_A6XX_CP_PROTECT(1),
> +       REG_A6XX_CP_PROTECT(2),
> +       REG_A6XX_CP_PROTECT(3),
> +       REG_A6XX_CP_PROTECT(4),
> +       REG_A6XX_CP_PROTECT(5),
> +       REG_A6XX_CP_PROTECT(6),
> +       REG_A6XX_CP_PROTECT(7),
> +       REG_A6XX_CP_PROTECT(8),
> +       REG_A6XX_CP_PROTECT(9),
> +       REG_A6XX_CP_PROTECT(10),
> +       REG_A6XX_CP_PROTECT(11),
> +       REG_A6XX_CP_PROTECT(12),
> +       REG_A6XX_CP_PROTECT(13),
> +       REG_A6XX_CP_PROTECT(14),
> +       REG_A6XX_CP_PROTECT(15),
> +       REG_A6XX_CP_PROTECT(16),
> +       REG_A6XX_CP_PROTECT(17),
> +       REG_A6XX_CP_PROTECT(18),
> +       REG_A6XX_CP_PROTECT(19),
> +       REG_A6XX_CP_PROTECT(20),
> +       REG_A6XX_CP_PROTECT(21),
> +       REG_A6XX_CP_PROTECT(22),
> +       REG_A6XX_CP_PROTECT(23),
> +       REG_A6XX_CP_PROTECT(24),
> +       REG_A6XX_CP_PROTECT(25),
> +       REG_A6XX_CP_PROTECT(26),
> +       REG_A6XX_CP_PROTECT(27),
> +       REG_A6XX_CP_PROTECT(28),
> +       REG_A6XX_CP_PROTECT(29),
> +       REG_A6XX_CP_PROTECT(30),
> +       REG_A6XX_CP_PROTECT(31),
> +       REG_A6XX_CP_PROTECT(32),
> +       REG_A6XX_CP_PROTECT(33),
> +       REG_A6XX_CP_PROTECT(34),
> +       REG_A6XX_CP_PROTECT(35),
> +       REG_A6XX_CP_PROTECT(36),
> +       REG_A6XX_CP_PROTECT(37),
> +       REG_A6XX_CP_PROTECT(38),
> +       REG_A6XX_CP_PROTECT(39),
> +       REG_A6XX_CP_PROTECT(40),
> +       REG_A6XX_CP_PROTECT(41),
> +       REG_A6XX_CP_PROTECT(42),
> +       REG_A6XX_CP_PROTECT(43),
> +       REG_A6XX_CP_PROTECT(44),
> +       REG_A6XX_CP_PROTECT(45),
> +       REG_A6XX_CP_PROTECT(46),
> +       REG_A6XX_CP_PROTECT(47),
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> +
>  static const struct adreno_info a7xx_gpus[] =3D {
>         {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
>                           ADRENO_QUIRK_HAS_HW_APRIV |
> -                         ADRENO_QUIRK_PREEMPTION,
> +                         ADRENO_QUIRK_PREEMPTION |
> +                         ADRENO_QUIRK_IFPC,
>                 .init =3D a6xx_gpu_init,
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .hwcg =3D a740_hwcg,
>                         .protect =3D &a730_protect,
>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
>                         .gmu_chipid =3D 0x7050001,
>                         .gmu_cgc_mode =3D 0x00020202,
>                 },
> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D {
>                 .a6xx =3D &(const struct a6xx_info) {
>                         .protect =3D &a730_protect,
>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
>                         .gmu_chipid =3D 0x7090100,
>                         .gmu_cgc_mode =3D 0x00020202,
>                         .bcms =3D (const struct a6xx_bcm[]) {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b052172ef=
dd7255165f3c04a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu=
 *gpu)
>         u32 *dest =3D (u32 *)&lock->regs[0];
>         int i;
>
> -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> -
>         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> -       lock->ifpc_list_len =3D 0;
> -       lock->preemption_list_len =3D reglist->count;
> +
> +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
This is NULL on X1-45 and causes

  [    8.795603] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008

> +       lock->ifpc_list_len =3D reglist->count;
>
>         /*
>          * For each entry in each of the lists, write the offset and the =
current
> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu =
*gpu)
>                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
>         }
>
> +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> +       lock->preemption_list_len =3D reglist->count;
> +
> +       for (i =3D 0; i < reglist->count; i++) {
> +               *dest++ =3D reglist->regs[i];
> +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> +       }
> +
>         /*
>          * The overall register list is composed of
>          * 1. Static IFPC-only registers
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4269a=
e7783ed3578e40e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -45,6 +45,7 @@ struct a6xx_info {
>         const struct adreno_reglist *hwcg;
>         const struct adreno_protect *protect;
>         const struct adreno_reglist_list *pwrup_reglist;
> +       const struct adreno_reglist_list *ifpc_reglist;
>         u32 gmu_chipid;
>         u32 gmu_cgc_mode;
>         u32 prim_fifo_threshold;
>
> --
> 2.50.1
>

