Return-Path: <linux-arm-msm+bounces-30743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF896C086
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3782886BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 14:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA771DB55F;
	Wed,  4 Sep 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3b8iFQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C295B63D;
	Wed,  4 Sep 2024 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460233; cv=none; b=FuqBfjf2Kh0imJ01thxyLNJo6RUCXlndgdQF41HexGOIkcmn5gJj9dSpCJlkKenIPaLA7mqiuHGjMCCvsvl0VLy/0SMzR01RT4xQQMgiPyX9GAv0vFtFOV7CHvzP2ZfnGplJcsjA+GgdoGhsoug4VeCwEh1G/Viv8b5JlibDUiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460233; c=relaxed/simple;
	bh=oUMmrAUW6n46iBK2Om852EAinIl1iovpcj2mta3w+84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sv7q6pZRaziNcBCSMXpIhXGBIz2eDCMmHDmxxbRbWZaFJuGSDG+bTnAawX+etyHvnmDBvb09QY6YrfUy4BMgPOSivvFFOvU8ejyr2AJxalFDCtBg7CNx4OK8XAR/xe+a0Yv46D4HFQjx/sGS66bBUXcVon+UGISseoVxdUYHLLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3b8iFQR; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-39d4a4e4931so24096225ab.2;
        Wed, 04 Sep 2024 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725460230; x=1726065030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUh1Bn8LTCD+clJ/J0HFf8JHKVuXPH+EGrtYwcbTYIQ=;
        b=T3b8iFQR+Yccc2VVuazOGHYlRqZE031oxm/IqlXIoC4hu27WIG008LQ+pfsfdAE1Ow
         BKZybS8ruJowSLd5eXe76RQ87QkUdPNBOskWimyQKQGvGfnNguIsJe2n+v1TSl5yTLD8
         G8JQZo27ynRr8xBAqpZH6kdnrlaaPyq5d3mgCZOPA3AboiBNKK3/j7Vr2EGFesFXzYHe
         GxefLmXULNsAifTMFyw7S5cEfpx1DX2XEoZlxioJ91qVo+aSZHNMpAyE0LOkjad9bzGE
         SX9EMjsIasmAgD0+6xgKd7FlSLbjZS2ojrICJcDVC62H8HW+oUP9yggHGeXEz0RPyfz2
         hQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725460230; x=1726065030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUh1Bn8LTCD+clJ/J0HFf8JHKVuXPH+EGrtYwcbTYIQ=;
        b=Nmh3sppb8rPXE9xh6RXXivvOUHnH2Of9btai6czzlV4Smk3XByCpdjjO4ddR8+FyNx
         IjrQHM3n2Ey5H8JViye7D9hVDeGeNxVWrI66azXLwPpgf97NrDAyNtFobU7oMsgISgHw
         E9JTNJ4II1WSSjRV3RvfEznVOphDrCyV8wJ3ITh+TpJBL68GSJvfcARcwgXs4X+Ywr0N
         fnWnRLkSo9iLpqVNNLD81q816rJgXsbr2q6Z4AOoYhAtyljlyslWMIGKPoYIRrSqcxvR
         Cd7aNBHD5topwOmcY/xQSLRNug7+3k4J0ldHlb62Nrbk4pTfRJikaOzwkwhT8Dqq9ceO
         94YA==
X-Forwarded-Encrypted: i=1; AJvYcCW5jNyPexW9JlWA3m81QD2YN/8PN2xfUq4VNpdGmsK/JY08sF1nzki/RUdkhAHwFOmQDuZ1yRV2Lq/1fU2w@vger.kernel.org, AJvYcCWtXumNGOYze4R9HGJhwdiQPduAtDOuUirnbztRI4oyzW35f5E4l4oPqgzViUN5cyFAceuqQr+Qjrkb2K4/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwtZoCu+lQNfqMzciq+CDOPNDfmEzcT0ZSzu7Z1OrmaQeSja4
	Z0rALkPdSDDZrjez2DoGwX7Cz4vAc3aBwxPpXyBvaOXmqXXj/YLeKn0+TiQNEFvCfxfvluxqm/u
	Z8JbfPLSuByPLfsmQfEIpgB4sEm4=
X-Google-Smtp-Source: AGHT+IEOs79kz4wpYRVi6vayStorUTQuG3MLQed42xUFFfh4rUgAOixAlfb7UxVs1MDoDJIZwMT7ryuRLZClp+PiPMc=
X-Received: by 2002:a92:cda5:0:b0:39f:7a06:2a62 with SMTP id
 e9e14a558f8ab-39f7a062ad8mr22423485ab.5.1725460229529; Wed, 04 Sep 2024
 07:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com> <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
 <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
In-Reply-To: <b899d35a-fedf-4748-ac23-6389a8742160@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 4 Sep 2024 07:30:16 -0700
Message-ID: <CAF6AEGufJhPMbyJJ7kV6-2cknmOwKD15Z5foYfje0bVjH7G0MQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] drm/msm/A6xx: Use posamble to reset counters on preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 6:39=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/30/24 8:32 PM, Rob Clark wrote:
> > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> >>
> >> Use the postamble to reset perf counters when switching between rings,
> >> except when sysprof is enabled, analogously to how they are reset
> >> between submissions when switching pagetables.
> >>
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
> >>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++=
++++-
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
> >>   4 files changed, 49 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.c
> >> index 1a90db5759b8..3528ecbbc1ab 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struc=
t msm_gem_submit *submit)
> >>   static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
> >>                  struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue=
 *queue)
> >>   {
> >> -       u64 preempt_offset_priv_secure;
> >> +       bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_ac=
tive) > 1;
> >> +       u64 preempt_offset_priv_secure, preempt_postamble;
> >>
> >>          OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
> >>
> >> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_r=
ingbuffer *ring,
> >>          /* seems OK to set to 0 to disable it */
> >>          OUT_RING(ring, 0);
> >>          OUT_RING(ring, 0);
> >> +
> >> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> >> +               preempt_postamble =3D SCRATCH_PREEMPT_POSTAMBLE_IOVA(a=
6xx_gpu);
> >> +
> >> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
> >> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
> >> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
> >> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> >> +                                       a6xx_gpu->preempt_postamble_le=
n) |
> >> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> >> +       }
> >
> > Hmm, ok, we set this in the submit path.. but do we need to clear it
> > somehow when transitioning from !sysprof to sysprof?
> >
>
> We can always emit the packet and 0 fields out when sysprof is enabled.
> Would that be ok for you? Only emitting it when needed might be
> nontrivial given that there are multiple rings and we would be paying
> the overhead for emitting it in the more common case (not profiling) anyw=
ay.

That sounds like it would work

> > Also, how does this interact with UMD perfctr queries, I would expect
> > they would prefer save/restore?
>
> Right so my understanding given previous discussions is that we want to
> disable preemption from userspace in that case? The vulkan extension
> requires to acquire and release a lock so we could use that to emit the
> packets that enable and disable preemption perhaps.

ack

BR,
-R

> >
> > BR,
> > -R
> >
> >>   }
> >>
> >>   static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *=
submit)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/m=
sm/adreno/a6xx_gpu.h
> >> index 652e49f01428..2338e36c8f47 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> >> @@ -66,6 +66,7 @@ struct a6xx_gpu {
> >>          atomic_t preempt_state;
> >>          spinlock_t eval_lock;
> >>          struct timer_list preempt_timer;
> >> +       uint64_t preempt_postamble_len;
> >>
> >>          unsigned int preempt_level;
> >>          bool uses_gmem;
> >> @@ -99,6 +100,11 @@ struct a6xx_gpu {
> >>   #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
> >>          (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
> >>
> >> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
> >> +
> >> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
> >> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
> >> +
> >>   /*
> >>    * In order to do lockless preemption we use a simple state machine =
to progress
> >>    * through the process.
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/d=
rm/msm/adreno/a6xx_preempt.c
> >> index 4b61b993f75f..f586615db97e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6x=
x_gpu,
> >>          return 0;
> >>   }
> >>
> >> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> >> +{
> >> +       u32 *postamble =3D a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POS=
TAMBLE_OFFSET;
> >> +       u32 count =3D 0;
> >> +
> >> +       postamble[count++] =3D PKT7(CP_REG_RMW, 3);
> >> +       postamble[count++] =3D REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> >> +       postamble[count++] =3D 0;
> >> +       postamble[count++] =3D 1;
> >> +
> >> +       postamble[count++] =3D PKT7(CP_WAIT_REG_MEM, 6);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> >> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS=
);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_3_REF(0x1);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_4_MASK(0x1);
> >> +       postamble[count++] =3D CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> >> +
> >> +       a6xx_gpu->preempt_postamble_len =3D count;
> >> +}
> >> +
> >>   void a6xx_preempt_fini(struct msm_gpu *gpu)
> >>   {
> >>          struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
> >>          a6xx_gpu->skip_save_restore =3D 1;
> >>
> >>          a6xx_gpu->scratch_ptr  =3D msm_gem_kernel_new(gpu->dev,
> >> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
> >> +                       PAGE_SIZE, MSM_BO_WC,
> >>                          gpu->aspace, &a6xx_gpu->scratch_bo,
> >>                          &a6xx_gpu->scratch_iova);
> >>
> >> +       preempt_prepare_postamble(a6xx_gpu);
> >> +
> >>          if (IS_ERR(a6xx_gpu->scratch_ptr))
> >>                  goto fail;
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.h
> >> index 6b1888280a83..87098567483b 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t r=
egindx, uint16_t cnt)
> >>          OUT_RING(ring, PKT4(regindx, cnt));
> >>   }
> >>
> >> +#define PKT7(opcode, cnt) \
> >> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> >> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> >> +
> >>   static inline void
> >>   OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
> >>   {
> >>          adreno_wait_ring(ring, cnt + 1);
> >> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) <<=
 15) |
> >> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> >> +       OUT_RING(ring, PKT7(opcode, cnt));
> >>   }
> >>
> >>   struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
> >>
> >> --
> >> 2.46.0
> >>
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>

