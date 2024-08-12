Return-Path: <linux-arm-msm+bounces-28333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DD94F3C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 659382810AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 16:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D23183CA6;
	Mon, 12 Aug 2024 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfVfUmDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4F186E38
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723479708; cv=none; b=mb8uyjhRRpsUcfAkUz1a6Rjlb3+1/+7YEc+F1z6d6dXhiqVn0J+8tZSphJFojbtPbsrXySkyJBIpWYmEh5dRU+lyL5OqwRzG8c+CWHJSitALJiKAI0wiB8rpQmEBVJhq9jdSp+Dpzmuyt1FVErkCc74t3PKjA+CtpTa/rJ6cLF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723479708; c=relaxed/simple;
	bh=CImSiGMdH3ZRPMy5StJGlpq3T2l3Q0tLxR2HeDqCJLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toxLrgYiAAfIMELAabJFPUqYZJ+UFkzouGjYqsJurRwUB5ATT/jt97d08ZaCqVjB+yFKQHJA42VIPCHV8OTmEPFMAxFFUW8w1xXGGVaBg5QTwNFhMYY7YSQ0Nn5gKFsimSiTySmXLfJzAEnPC6WS5MAqlZdWF2FZgiMO7gq7/VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfVfUmDK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a1c496335aso2066596a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 09:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723479705; x=1724084505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlneiZJQLXLqJDusxP+PQ5OxJj9g1fPFn2AHdkUar7w=;
        b=VfVfUmDKHRehl5OH+jKwbKGt6FJ1SDoiPBJsqx+wHuVPEqZkRMFh9vfaER+nx1495l
         SUNdkVj8ufj0UsaWIoVt9ywhW6gQFf5z/E5gSHKlZ+uRL56oKJ5zNWdNFLQP+O9Ni7D5
         OTUOHFQRJgMaqwzLvN7BOvHI6FsLwgfiVfPU0qaGIgBOnpp3car1u0Hg4N2/vAW6DeYh
         Kgcix3PZt4++hZj9Lvv/I6nJr7UayuI+8LOxoMFFfAwkFc+/stO5PrFKMO2e9CvXUPz8
         wuLdiD4J7KGOoSVqDkCgnxUHAkViBtYBJw1GYr60zE1xwiz0Yi7I9dqAomeP8poqVWYu
         /GXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723479705; x=1724084505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlneiZJQLXLqJDusxP+PQ5OxJj9g1fPFn2AHdkUar7w=;
        b=cwqs3YuzVxXMdy5q05m2f2uSDi48C6mIlfR7GE8iUMj6b70RDI0Y0z7lobaLNnnPWo
         vg2MW5wZt2UKfKzZhLqmBxHcO4L7KFlgh7v2o13iyXs1djMq46sfuQn25K/wTxsbgq+z
         H6y41NFZZgGdv9Bq37rMY+Q8iRZ1oE1vyCsRyBFsYdY52r8OVLNYIYYISn7g7J+j53Fw
         hVk4BMRuwGbnggZmh3F0Hgx9wywlk5vbyM2wG0MG8vSAvdItdkadXyGLgH67euP3x3lX
         8FInLaXv0VQYEgB/Bp7jjMGuR180bKrLdMp14zOg4bL93ccZUPquQZjOBLtU2xN1ZA+n
         Cgug==
X-Forwarded-Encrypted: i=1; AJvYcCVLsMNU3GQE7k3H+J9JhvoxGho6juCSub0hy1qlNaMxlsiQ6EAkrPV5k3uMI3UPGVEpK2P+LsR3WaWHm5IGNCSavsL0sfxR9IrO86AKbg==
X-Gm-Message-State: AOJu0YytdMhXM8IVApQw22Qk0ufFMd+TSHfc/9akAjqIm2yjJ8U6DF7w
	yquq07v60tbiv+/HFWZYyWM2QMHshPlp89PWdum1hGL5nTB+SbKQRqlxZEba5gCEyRUuVkrDePs
	poYLvMMKppENwLKy7XTc613QMTXg=
X-Google-Smtp-Source: AGHT+IHISTHcYY16RxKbGRvV7EHWIgqlMCPcmLVjjnPto7VUvfwCYLwREm2AVVcuhCSV9LPb+Rnhh6ldMe2MQ/TwyE0=
X-Received: by 2002:a05:6402:35d5:b0:5a3:d140:1a57 with SMTP id
 4fb4d7f45d1cf-5bd44c0ced8mr813513a12.1.1723479704862; Mon, 12 Aug 2024
 09:21:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
 <20240807-a750-devcoredump-fixes-v2-1-d7483736d26d@gmail.com> <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20240812060854.xvtae4o6kvfnuxcx@hu-akhilpo-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Aug 2024 09:21:31 -0700
Message-ID: <CAF6AEGtOK5wD6X-oedZzN1quEAKyx1Xz5A-avuqma5rKpDTjUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/msm: Use a7xx family directly in gpu_state
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2024 at 11:09=E2=80=AFPM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
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
>
> I think we should move to a "snapshot block list" like in the downstream
> driver if you want to simplify the whole logic. Otherwise, we should
> leave the chipid check as it is and just fix up a750 configurations.

Or maybe just move some of this to the device catalogue?

BR,
-R

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

