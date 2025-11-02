Return-Path: <linux-arm-msm+bounces-80035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D77E4C29456
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 18:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8849A3A6FD9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 17:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8984E1C8606;
	Sun,  2 Nov 2025 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6NLlThM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39012BCF5
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106147; cv=none; b=rezZoihUbbvfg0czZuSMcAnAghGYsEsFqcEMtGXZczpmoigKHc0AbqopAh1lO8F/nkT3JB/LSi+e2luLCndmbHTZMBm6jl+zpWSqTSb4zUx/r2xUzZbb+JZtiFO1MW8Yi8UKTflNMkUf81YU3ZALZ21wRONISMRN2RAqsK0VujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106147; c=relaxed/simple;
	bh=eIjHrFzjlZWQYgWzqHxuokeCzTlN4VmnXV09NgGsz4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qkbCWhsZ+mF7uJn9nXkjkXHvgbSf9MCkCvrccJcU8hidsWmmZ7EYkXZhAjcTwSQeQ51eLiMyjB/oEoQwphQuDCHfkTsQz0pkoKXfZf2ii2zfXqFqZmuMyNlmtEQN9BtigKhXAPWNKWoAaUwmLLR8q9W7NKRR2q09kv3kntgDTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6NLlThM; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7866aca9ff4so6290397b3.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762106145; x=1762710945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COrNcrGnqRmVYJypFzHWli2n6WfayONN+cM0WGt3gX4=;
        b=h6NLlThMGWvWzmDNngZtksv+umXRYBEWw0Me9T6hzr+o/1E/68x7Ij0Zl/Pj9fwdME
         ELhk+3IZo9DmJ4qQOTEwLPsMgwneggfc6cysiUktmBnCtSKUfiUzvEEKoqTkclF/aV8E
         XXGmFxRrtMctKQBYdBen/d1MryUmlcato3YuBVEXM5NErBuHxO6Ns+LM2b4M+s5eK3/b
         C29meQPJKW+9PtS7NJM7cCNXA33/cMi+NzGTz2bJB0A5Y+pYm7HmmGngivIzJQouME6D
         CpXVSONEJjFggUyA93TS4XoT6DhD2iKPyyFna03cphpIlcV+91PpFKa/BQoQzrm+LZuF
         4wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762106145; x=1762710945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COrNcrGnqRmVYJypFzHWli2n6WfayONN+cM0WGt3gX4=;
        b=Fpg6BaBXbJwMbB52PFg5idktSAli8nmrni9XVDF+0GWa4bnA0GGwHLYt+jDNTr7+tL
         dys3iAlnHsRgs4Oj7eiKzSY6ZEOTr+VexT7lhxhJWuPj5QNEwzxdizESaa4rO9D+4dGg
         npYnyluPwpBlnO4h8b1FC1LEZ5bvaVgJGlpcyJGB/6NGYXANf0gHqTn8VhyAr0+cRBM4
         XWqceAN1M387+jFde+MCXg+p0r1WpBu2oYYzzn3Lop8MxdSIrHoipPys471Nu4p1wyxY
         N1ENvhIHwywc93uxGUH7ubGWTQu5espNuvTFhq6EAKw+0W3RCQZYvjsiOkDPOXF/HOHf
         xJng==
X-Forwarded-Encrypted: i=1; AJvYcCULYc2pyaO/NuYCo1DknLinp2PM/dkf46Hba6YyfM83++oP9euI6SQRLLijndu77/1FPiYujjHeTkM15X2B@vger.kernel.org
X-Gm-Message-State: AOJu0YzaehseMJRvqbj1HPGVM99oeoPA3hem6jKuUW/MkczDS6kuRnLG
	2OTd5aL34pnQSYuSGsoHVmb8nYI/4JqDXidOsWXuaMqG7fi+zdPwevChA+qGYNjIZUWe6HjM/s7
	Zla5wOajPv1Z25wo8n80Horh0iAbsM7E=
X-Gm-Gg: ASbGncuULbX0nUybKkQBjQkKCwgnJhnhAgpLjbLLFhnE41bXnSzreLWrdx8VTd3Rz9r
	vZ8VRgsxUdg8HeStWwYqj3Cixkxkr1pN5ngqFimSDxcLxOXb4HaIMA36gnmqlYIUU0eCiiAW0Ek
	aK2xeTfbWu6ZTxtiPKw2eH41+5JXlsnT6iQYnNLoudRI65l1mLJsyBnvTHL0FtTgdoq4ZHjhmVU
	0fRUQHPw6evFTaINosnzezvHybukr4zNfyepzXN0/r0aP2xYYog6VAtCQ0IvfN0FE6S1ImB3Ja0
	32CHQQAWZINTetjPkQ==
X-Google-Smtp-Source: AGHT+IHwOoTLpyzH/g3E/JzA7phD7BGeV6UpgA7q5eX+Y0LqpTITLujui7fYoTqTi21cWBOv2eaSPrNTGdO3xpZZc9g=
X-Received: by 2002:a05:690c:4d8a:b0:786:7797:6d90 with SMTP id
 00721157ae682-78677977fcfmr14963877b3.15.1762106144618; Sun, 02 Nov 2025
 09:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-15-631b1080bf91@oss.qualcomm.com>
 <CAPaKu7TQ3tkQREG8xphW_L5eQPLuQhA=oKjfmYVJDR7PsNBXQg@mail.gmail.com>
 <CACSVV02B8BzvznzOoMw0EgOXEY39syWdyfzTcqWB0qsYjf42hQ@mail.gmail.com> <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
In-Reply-To: <1d6a50c3-eb1d-46a9-922c-e57e6e83779d@oss.qualcomm.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sun, 2 Nov 2025 09:55:33 -0800
X-Gm-Features: AWmQ_blh6__PmMaN0IO5NFLoRXaEv17c5FLIGT9OWNmNqb_llsX2WSXZEKBZN_A
Message-ID: <CAPaKu7QvBZmx0b8SDBY1H3u-Em+0py0BrGkmrfGUXkx1uQrg3A@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: rob.clark@oss.qualcomm.com, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Antonino Maniscalco <antomani103@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 12:52=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 11/1/2025 6:27 PM, Rob Clark wrote:
> > On Fri, Oct 31, 2025 at 4:43=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> w=
rote:
> >>
> >> On Mon, Sep 8, 2025 at 1:28=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qua=
lcomm.com> wrote:
> >>>
> >>> Add the IFPC restore register list and enable IFPC support on Adreno
> >>> X1-85 gpu.
> >>>
> >>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 68 +++++++++++++++++++++=
+++++++++-
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 15 +++++--
> >>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
> >>>  3 files changed, 79 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/=
drm/msm/adreno/a6xx_catalog.c
> >>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..547c046730a9b50a82cc9=
b27f08a5b1eeb08dced 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> >>> @@ -1343,6 +1343,69 @@ static const uint32_t a7xx_pwrup_reglist_regs[=
] =3D {
> >>>
> >>>  DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
> >>>
> >>> +/* Applicable for X185, A750 */
> >>> +static const u32 a750_ifpc_reglist_regs[] =3D {
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
> >>> +       REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
> >>> +       REG_A6XX_TPL1_NC_MODE_CNTL,
> >>> +       REG_A6XX_SP_NC_MODE_CNTL,
> >>> +       REG_A6XX_CP_DBG_ECO_CNTL,
> >>> +       REG_A6XX_CP_PROTECT_CNTL,
> >>> +       REG_A6XX_CP_PROTECT(0),
> >>> +       REG_A6XX_CP_PROTECT(1),
> >>> +       REG_A6XX_CP_PROTECT(2),
> >>> +       REG_A6XX_CP_PROTECT(3),
> >>> +       REG_A6XX_CP_PROTECT(4),
> >>> +       REG_A6XX_CP_PROTECT(5),
> >>> +       REG_A6XX_CP_PROTECT(6),
> >>> +       REG_A6XX_CP_PROTECT(7),
> >>> +       REG_A6XX_CP_PROTECT(8),
> >>> +       REG_A6XX_CP_PROTECT(9),
> >>> +       REG_A6XX_CP_PROTECT(10),
> >>> +       REG_A6XX_CP_PROTECT(11),
> >>> +       REG_A6XX_CP_PROTECT(12),
> >>> +       REG_A6XX_CP_PROTECT(13),
> >>> +       REG_A6XX_CP_PROTECT(14),
> >>> +       REG_A6XX_CP_PROTECT(15),
> >>> +       REG_A6XX_CP_PROTECT(16),
> >>> +       REG_A6XX_CP_PROTECT(17),
> >>> +       REG_A6XX_CP_PROTECT(18),
> >>> +       REG_A6XX_CP_PROTECT(19),
> >>> +       REG_A6XX_CP_PROTECT(20),
> >>> +       REG_A6XX_CP_PROTECT(21),
> >>> +       REG_A6XX_CP_PROTECT(22),
> >>> +       REG_A6XX_CP_PROTECT(23),
> >>> +       REG_A6XX_CP_PROTECT(24),
> >>> +       REG_A6XX_CP_PROTECT(25),
> >>> +       REG_A6XX_CP_PROTECT(26),
> >>> +       REG_A6XX_CP_PROTECT(27),
> >>> +       REG_A6XX_CP_PROTECT(28),
> >>> +       REG_A6XX_CP_PROTECT(29),
> >>> +       REG_A6XX_CP_PROTECT(30),
> >>> +       REG_A6XX_CP_PROTECT(31),
> >>> +       REG_A6XX_CP_PROTECT(32),
> >>> +       REG_A6XX_CP_PROTECT(33),
> >>> +       REG_A6XX_CP_PROTECT(34),
> >>> +       REG_A6XX_CP_PROTECT(35),
> >>> +       REG_A6XX_CP_PROTECT(36),
> >>> +       REG_A6XX_CP_PROTECT(37),
> >>> +       REG_A6XX_CP_PROTECT(38),
> >>> +       REG_A6XX_CP_PROTECT(39),
> >>> +       REG_A6XX_CP_PROTECT(40),
> >>> +       REG_A6XX_CP_PROTECT(41),
> >>> +       REG_A6XX_CP_PROTECT(42),
> >>> +       REG_A6XX_CP_PROTECT(43),
> >>> +       REG_A6XX_CP_PROTECT(44),
> >>> +       REG_A6XX_CP_PROTECT(45),
> >>> +       REG_A6XX_CP_PROTECT(46),
> >>> +       REG_A6XX_CP_PROTECT(47),
> >>> +};
> >>> +
> >>> +DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
> >>> +
> >>>  static const struct adreno_info a7xx_gpus[] =3D {
> >>>         {
> >>>                 .chip_ids =3D ADRENO_CHIP_IDS(0x07000200),
> >>> @@ -1432,12 +1495,14 @@ static const struct adreno_info a7xx_gpus[] =
=3D {
> >>>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >>>                 .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> >>>                           ADRENO_QUIRK_HAS_HW_APRIV |
> >>> -                         ADRENO_QUIRK_PREEMPTION,
> >>> +                         ADRENO_QUIRK_PREEMPTION |
> >>> +                         ADRENO_QUIRK_IFPC,
> >>>                 .init =3D a6xx_gpu_init,
> >>>                 .a6xx =3D &(const struct a6xx_info) {
> >>>                         .hwcg =3D a740_hwcg,
> >>>                         .protect =3D &a730_protect,
> >>>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> >>> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >>>                         .gmu_chipid =3D 0x7050001,
> >>>                         .gmu_cgc_mode =3D 0x00020202,
> >>>                 },
> >>> @@ -1466,6 +1531,7 @@ static const struct adreno_info a7xx_gpus[] =3D=
 {
> >>>                 .a6xx =3D &(const struct a6xx_info) {
> >>>                         .protect =3D &a730_protect,
> >>>                         .pwrup_reglist =3D &a7xx_pwrup_reglist,
> >>> +                       .ifpc_reglist =3D &a750_ifpc_reglist,
> >>>                         .gmu_chipid =3D 0x7090100,
> >>>                         .gmu_cgc_mode =3D 0x00020202,
> >>>                         .bcms =3D (const struct a6xx_bcm[]) {
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 76dd78f5c48ea818a2aa209e0c0c88bc5e8f4e06..91a2a82c4f388ca6b0521=
72efdd7255165f3c04a 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -828,11 +828,10 @@ static void a7xx_patch_pwrup_reglist(struct msm=
_gpu *gpu)
> >>>         u32 *dest =3D (u32 *)&lock->regs[0];
> >>>         int i;
> >>>
> >>> -       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> >>> -
> >>>         lock->gpu_req =3D lock->cpu_req =3D lock->turn =3D 0;
> >>> -       lock->ifpc_list_len =3D 0;
> >>> -       lock->preemption_list_len =3D reglist->count;
> >>> +
> >>> +       reglist =3D adreno_gpu->info->a6xx->ifpc_reglist;
> >> This is NULL on X1-45 and causes
> >>
> >>   [    8.795603] Unable to handle kernel NULL pointer dereference at
> >> virtual address 0000000000000008
> >
> > Hmm, this is probably going to happen on all a7xx which don't have
> > IFPC from the looks of it.
> >
> > We should either check for the IFPC quirk.. or maybe just drop the
> > quirk and decide whether IFPC is supported based on ifpc_reglist !=3D
> > NULL?
> >
> > (That said, we probably do want to have IFPC enabled for x1-45)
>
> We should add a check for IFPC quirk here. Chia, do you plan to send a fi=
x?
>
> To enable IFPC, we can just add a750_ifpc_reglist_regs[] to
> adreno_gpu->info->a6xx->ifpc_reglist and enable the IFPC quirk.
Maybe it is easier for you to do the fix? Because I would have several
little questions (what happens when the reglist and the quirk flag are
inconsistent? how about preemption reglist?)

I am happy to do the testing.

>
> -Akhil.
>
> >
> > BR,
> > -R
> >
> >>> +       lock->ifpc_list_len =3D reglist->count;
> >>>
> >>>         /*
> >>>          * For each entry in each of the lists, write the offset and =
the current
> >>> @@ -843,6 +842,14 @@ static void a7xx_patch_pwrup_reglist(struct msm_=
gpu *gpu)
> >>>                 *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >>>         }
> >>>
> >>> +       reglist =3D adreno_gpu->info->a6xx->pwrup_reglist;
> >>> +       lock->preemption_list_len =3D reglist->count;
> >>> +
> >>> +       for (i =3D 0; i < reglist->count; i++) {
> >>> +               *dest++ =3D reglist->regs[i];
> >>> +               *dest++ =3D gpu_read(gpu, reglist->regs[i]);
> >>> +       }
> >>> +
> >>>         /*
> >>>          * The overall register list is composed of
> >>>          * 1. Static IFPC-only registers
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.h
> >>> index 124c63c4615930b00c64e488a498163ae35afccd..0b17d36c36a9567e6afa4=
269ae7783ed3578e40e 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >>> @@ -45,6 +45,7 @@ struct a6xx_info {
> >>>         const struct adreno_reglist *hwcg;
> >>>         const struct adreno_protect *protect;
> >>>         const struct adreno_reglist_list *pwrup_reglist;
> >>> +       const struct adreno_reglist_list *ifpc_reglist;
> >>>         u32 gmu_chipid;
> >>>         u32 gmu_cgc_mode;
> >>>         u32 prim_fifo_threshold;
> >>>
> >>> --
> >>> 2.50.1
> >>>
>

