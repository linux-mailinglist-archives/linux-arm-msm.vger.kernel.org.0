Return-Path: <linux-arm-msm+bounces-28338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21C94F6AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B57E61C212C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D77018E05B;
	Mon, 12 Aug 2024 18:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laak68vn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059F01993B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 18:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723487129; cv=none; b=FtK5zMRM1q4j256WdT7Rrj073ilOjG040sHMByMMWotzmYATxVTL912atT/4Cdrrl4h3/SBjgGWuOO7+nF4DIzxR51eY9r2xou9ivkqUUMdQW/AnNIZ8WFND68/qb61vfhS1eUmsW9vgy6KPlP8vQRubfNGU/2IwbolkTIjXDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723487129; c=relaxed/simple;
	bh=/DMlAOteHzC4GC/T2PZYXNcwpBNfTHkSel5dxS+S38c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaaa7zxslUgd1dhuH19V3YMaFVy8yiq/V+sK9ehOetgmwM4Ws7yY2mEF16m//ueV+qAZyD3vdwBL2YqBvau9NexDXpJwIQo6s3D6wPO3SfC5YyNi2z1kVsGR6VMUOSPzX9M76P5pLpvEZlQvyqpmJrNnD/yZU1U26Fe0815GCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laak68vn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d1e3381cb1so2404062a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 11:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723487126; x=1724091926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K6+MsUfHhq7fCbiw1ymIFvBEijlhEhujgaNDGKpLw0=;
        b=laak68vnCmq/FFMfgW7p8MsUKza8x7N/6b7SZiepDYdc2cg4x4oG88X7cbYpnGDCPt
         oPmAmbDxByeNqTVDY99DElvUon4mLMvBUFMAEqrc1cew3s1H2AkfOJRXYWLiD5gg/okl
         CfCn/APkjDzuo3qyiOI5AMJV8FQ5uJXnr5KxrlsBYEN3l/E5MJU8QdD6no88eiaXB8kj
         iMfpUU+leNel9wuPw2wxuvWwWpYQ9A6lTArK9JlU1nzUC1sJFA/opCHHU9/cKx0isjVl
         oPu5hBf7GQuZykAfr2G7FoAD17dkD6mceqhfmqlKWdDxzEB5jwWBFAfeavkRFMBcRyL7
         8OSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723487126; x=1724091926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K6+MsUfHhq7fCbiw1ymIFvBEijlhEhujgaNDGKpLw0=;
        b=Yep/mOKJBX8txdpkFk6zdSwG8ULFxNr0czght2GwB5eEYLjvaFdtymYTO7iYmZKTis
         jkz0MtFo3d6UeqgVcktVEgjECSRm7DUlQ/ctDxqY5w46r2/bFY8yPpAnFNYVD3VJY8iQ
         Z8eDYQS8kYql0C0lcuzCvZy5xvZNG+bRyCAj//T4coKEqr0yA0CzKZbG7ahyWu1H14Mp
         OUR4F3d3VvgS4stocxoPKuc2UlEL6gHBdt+CD2uB4Y7crGUugMjLpfbb/UlZVblYhMbb
         BcDV2lhD/pHqVo3AaiVnmec4rfuAbL2xwJAp9eUzSLrDHpjft1+8ak9Z+Zqt5Cqv82kV
         fQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYoPCnIr/c9TRYA/uIFQx4UlFRHPQSuI22erFYgTfKYOJDi+e5KJH1LbY6TJcV7FnD7NSlxWk23jVM//jg8NXZQss7tSz129SQgvg6HQ==
X-Gm-Message-State: AOJu0YwjcmqhG01UdglQcZIWj/yqBYcFpymEi9Uva/nHzCP+SWnGQYyq
	oo5YcrOsYy6Dur4fTOuscE3M23kfyQzoHpaTzgt6ZM9WXx6nSX2u5RZzeHrjNELLZEwxnGr2v12
	c3ttWnzILnoGmzUK0rIic/K2LpoY=
X-Google-Smtp-Source: AGHT+IEeSalSbcpGWm9tThoBPxi6Si8c+QzvdCOKudz58aXADFw07SWrfMU882mZcoEYhOkzX5SOEGuQCtpno0uuJjQ=
X-Received: by 2002:a17:90b:350d:b0:2c9:90f5:cfca with SMTP id
 98e67ed59e1d1-2d39269af13mr1140704a91.42.1723487126188; Mon, 12 Aug 2024
 11:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com> <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 12 Aug 2024 19:25:14 +0100
Message-ID: <CACu1E7EoVw0JGqjk9j7m8uT2R+MPzAuwGn7jB9hAJ7uvPu7ZfQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 7:09=E2=80=AFAM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Wed, Aug 07, 2024 at 01:34:27PM +0100, Connor Abbott wrote:
> > With a7xx, we need to import a new header for each new generation and
> > switch to a different list of registers, instead of making
> > backwards-compatible changes. Using the helpers inadvertently made a750
> > use the a740 list of registers, instead use the family directly to fix
> > this.
>
> This won't scale. What about other gpus in the same generation but has a
> different register list? You don't see that issue currently because
> there are no support for lower tier a7x GPUs yet.

GPUs in the same generation always have the same register list. e.g.
gen7_4_0 has the same register list as gen7_0_0. kgsl has already
moved onto gen8 which redoes everything again and will require a
separate codepath, they only have one more gen7 register list compared
to us, and I doubt they'll add many more. So the kgsl approach would
be pointless over-engineering.

Connor

>
> I think we should move to a "snapshot block list" like in the downstream
> driver if you want to simplify the whole logic. Otherwise, we should
> leave the chipid check as it is and just fix up a750 configurations.
>
> -Akhil
>
> >
> > Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 ++++++++++++++-------=
--------
> >  1 file changed, 20 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index 77146d30bcaa..c641ee7dec78 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -390,18 +390,18 @@ static void a7xx_get_debugbus_blocks(struct msm_g=
pu *gpu,
> >       const u32 *debugbus_blocks, *gbif_debugbus_blocks;
> >       int i;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               debugbus_blocks =3D gen7_0_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_0_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D a7xx_gbif_debugbus_blocks;
> >               gbif_debugbus_blocks_count =3D ARRAY_SIZE(a7xx_gbif_debug=
bus_blocks);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               debugbus_blocks =3D gen7_2_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_2_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D a7xx_gbif_debugbus_blocks;
> >               gbif_debugbus_blocks_count =3D ARRAY_SIZE(a7xx_gbif_debug=
bus_blocks);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               debugbus_blocks =3D gen7_9_0_debugbus_blocks;
> >               debugbus_blocks_count =3D ARRAY_SIZE(gen7_9_0_debugbus_bl=
ocks);
> >               gbif_debugbus_blocks =3D gen7_9_0_gbif_debugbus_blocks;
> > @@ -511,7 +511,7 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
> >               const struct a6xx_debugbus_block *cx_debugbus_blocks;
> >
> >               if (adreno_is_a7xx(adreno_gpu)) {
> > -                     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_=
a740_family(adreno_gpu)));
> > +                     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3=
);
> >                       cx_debugbus_blocks =3D a7xx_cx_debugbus_blocks;
> >                       nr_cx_debugbus_blocks =3D ARRAY_SIZE(a7xx_cx_debu=
gbus_blocks);
> >               } else {
> > @@ -662,11 +662,11 @@ static void a7xx_get_dbgahb_clusters(struct msm_g=
pu *gpu,
> >       const struct gen7_sptp_cluster_registers *dbgahb_clusters;
> >       unsigned dbgahb_clusters_size;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               dbgahb_clusters =3D gen7_0_0_sptp_clusters;
> >               dbgahb_clusters_size =3D ARRAY_SIZE(gen7_0_0_sptp_cluster=
s);
> >       } else {
> > -             BUG_ON(!adreno_is_a740_family(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> >               dbgahb_clusters =3D gen7_2_0_sptp_clusters;
> >               dbgahb_clusters_size =3D ARRAY_SIZE(gen7_2_0_sptp_cluster=
s);
> >       }
> > @@ -820,14 +820,14 @@ static void a7xx_get_clusters(struct msm_gpu *gpu=
,
> >       const struct gen7_cluster_registers *clusters;
> >       unsigned clusters_size;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               clusters =3D gen7_0_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_0_0_clusters);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               clusters =3D gen7_2_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_2_0_clusters);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               clusters =3D gen7_9_0_clusters;
> >               clusters_size =3D ARRAY_SIZE(gen7_9_0_clusters);
> >       }
> > @@ -895,7 +895,7 @@ static void a7xx_get_shader_block(struct msm_gpu *g=
pu,
> >       if (WARN_ON(datasize > A6XX_CD_DATA_SIZE))
> >               return;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 3);
> >       }
> >
> > @@ -925,7 +925,7 @@ static void a7xx_get_shader_block(struct msm_gpu *g=
pu,
> >               datasize);
> >
> >  out:
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               gpu_rmw(gpu, REG_A7XX_SP_DBG_CNTL, GENMASK(1, 0), 0);
> >       }
> >  }
> > @@ -958,14 +958,14 @@ static void a7xx_get_shaders(struct msm_gpu *gpu,
> >       unsigned num_shader_blocks;
> >       int i;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               shader_blocks =3D gen7_0_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_0_0_shader_blocks);
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               shader_blocks =3D gen7_2_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_2_0_shader_blocks);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               shader_blocks =3D gen7_9_0_shader_blocks;
> >               num_shader_blocks =3D ARRAY_SIZE(gen7_9_0_shader_blocks);
> >       }
> > @@ -1350,14 +1350,14 @@ static void a7xx_get_registers(struct msm_gpu *=
gpu,
> >       const u32 *pre_crashdumper_regs;
> >       const struct gen7_reg_list *reglist;
> >
> > -     if (adreno_is_a730(adreno_gpu)) {
> > +     if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN1) {
> >               reglist =3D gen7_0_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_0_0_pre_crashdumper_gpu_reg=
isters;
> > -     } else if (adreno_is_a740_family(adreno_gpu)) {
> > +     } else if (adreno_gpu->info->family =3D=3D ADRENO_7XX_GEN2) {
> >               reglist =3D gen7_2_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_0_0_pre_crashdumper_gpu_reg=
isters;
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               reglist =3D gen7_9_0_reg_list;
> >               pre_crashdumper_regs =3D gen7_9_0_pre_crashdumper_gpu_reg=
isters;
> >       }
> > @@ -1407,8 +1407,7 @@ static void a7xx_get_post_crashdumper_registers(s=
truct msm_gpu *gpu,
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       const u32 *regs;
> >
> > -     BUG_ON(!(adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adre=
no_gpu) ||
> > -              adreno_is_a750(adreno_gpu)));
> > +     BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
> >       regs =3D gen7_0_0_post_crashdumper_registers;
> >
> >       a7xx_get_ahb_gpu_registers(gpu,
> > @@ -1514,11 +1513,11 @@ static void a7xx_get_indexed_registers(struct m=
sm_gpu *gpu,
> >       const struct a6xx_indexed_registers *indexed_regs;
> >       int i, indexed_count, mempool_count;
> >
> > -     if (adreno_is_a730(adreno_gpu) || adreno_is_a740_family(adreno_gp=
u)) {
> > +     if (adreno_gpu->info->family <=3D ADRENO_7XX_GEN2) {
> >               indexed_regs =3D a7xx_indexed_reglist;
> >               indexed_count =3D ARRAY_SIZE(a7xx_indexed_reglist);
> >       } else {
> > -             BUG_ON(!adreno_is_a750(adreno_gpu));
> > +             BUG_ON(adreno_gpu->info->family !=3D ADRENO_7XX_GEN3);
> >               indexed_regs =3D gen7_9_0_cp_indexed_reg_list;
> >               indexed_count =3D ARRAY_SIZE(gen7_9_0_cp_indexed_reg_list=
);
> >       }
> >
> > --
> > 2.31.1
> >

