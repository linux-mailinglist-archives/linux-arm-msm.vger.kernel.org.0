Return-Path: <linux-arm-msm+bounces-30301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D289668F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A7F1F240EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 18:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0BE1BC07B;
	Fri, 30 Aug 2024 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kthcJNY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3366136353;
	Fri, 30 Aug 2024 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725042747; cv=none; b=TWyRe9+nXyq5KTTrPtlNzoTDQ2nVL6pPMKSVUGMdiXKTDZzz7vVu2n8AHe7KTF71J5Snl9wBAICzXaRimeDVLfq8m6MGZeqPWb2hwOd9qw1gHlwIycqJIgtjTgtjVphHuPRNF7G9/zvtxlNzYaPgEQbIuo06HOqk8z7A8LzIjYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725042747; c=relaxed/simple;
	bh=lvx74f2wIWuO59f+dYqvUABi8hohfk9B1rXCnBQK5vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEV4qcTSyftF2pAZXQ4nscPFLgOyH1hy/VeEibbhvBNM6nLBVhQh3IQVVqohel7LBNuV9Ijms3FNf8tvMngsDH4xWaG3WmMDet0vbOGB3wQGker1xxUo7GpX89gypxWFYaF/xSwjwuQwvQF5Z/MDKrJHhq6FzSsr4IcMiqQmEpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kthcJNY0; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-45681098bbdso19558841cf.1;
        Fri, 30 Aug 2024 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725042745; x=1725647545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLPzJyyoWbwhl068AUGb6D6mbwAIjmJVIIMFbsf6Npw=;
        b=kthcJNY0YW0jtYTKn4zJmR8B4ZtvQRsBd0dl9sOF0DgeeiUUKc9wMZJS1YfD0BZ9dZ
         pVQhb+7QoxnnIoEhSWsOchOfGErjWZXu4w0g1UO1m8ZDOebJeGc2XSCtjCVYR2VLlWwq
         6a9Kgo2PXVOEPPauQFqgs4TPacVQV1+kWmOJngC03R0yN57EQyz66NSz16GZbyzSGrQf
         eskt4V/ocK32s//rhg9PDCB5Ky7UVNBJGsvNcu+dgEJtGv67+1/i4a8R+UJnMTLc7CKe
         aVEIBNh3AimB099FjwdNtNRIsbq0GdiEzjZcgKFGVNRR3E1ZsRWlHWvUEScAoM8/7chX
         CYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725042745; x=1725647545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLPzJyyoWbwhl068AUGb6D6mbwAIjmJVIIMFbsf6Npw=;
        b=aNQQFr6pU1vjWg2sZgspPVIhXLyTWP6bF99XfcqSotzzn7BV/oUscZgppGoAIIpcGs
         E6lZncSbrMBU4iYtD6X6gwiD/3a1WF0xavxzj8AYSXP4UtICyy2igXZFzc+mfK37XWNg
         hfM8bEQn8l8r3jgbEIpQG4W9srmhjr9xVylilDOSztZ9Llrup54OKFJt8vqFpJkY3uIX
         w7Se0y9Z2G/mZrJQEFUH+aYpL0XxBzXJGxDtI4GmR9fKThWaxtMshDN6I8gFoD577Zz/
         f/W/fibe+DscX65bKDZ3fgyM8Xz1HecFUw9uHSxawBK8oLD0nQ0AZi9Mp+lbFXm4mgUB
         zuxw==
X-Forwarded-Encrypted: i=1; AJvYcCW0DGR9VbBd5HnS0OtPw9TDM0SaTAwzuErs2A8dUpkYDobeko+42X1vAu9EWvi69fScU0C5qMPrYso8IFVI@vger.kernel.org, AJvYcCWwbYgqypMmYRaS+JVTDMiXB8L16hvcdJnExR0Evbk9+jFP1wkWYeinqYi5udnegu53b2y4sgrJMFy2MaXS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp8Sw8TJwaEBKW333yOHPm30m0tz4u8Hq+GoDZ7Kl+zX9x5WQM
	HOSVIYI3frzwFiy/90tm7OoMgYh1tca/CwMxEQ4AroTHJ0u1JR5VnZxdlJd/xONBkXHdgaxP46U
	Me9qG0T5aXRGlbSIw2DYcFSrd76U=
X-Google-Smtp-Source: AGHT+IF811wZgP7aarX2VA3DEXvYPnMy88uZypQ4nm+UF70H4ShZS1bDEcbqnrmzJjAKUH6IOa23ZM7/NWyIzq/y/H4=
X-Received: by 2002:a05:622a:5103:b0:456:953f:6fe6 with SMTP id
 d75a77b69052e-456953f908dmr22491241cf.8.1725042744512; Fri, 30 Aug 2024
 11:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com> <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-6-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 11:32:09 -0700
Message-ID: <CAF6AEGv82=N4=motCpGhp5N7Yv8oqtBcG4bGahgF53CpFYpTgg@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Use the postamble to reset perf counters when switching between rings,
> except when sysprof is enabled, analogously to how they are reset
> between submissions when switching pagetables.
>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 26 +++++++++++++++++++++++++=
-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  7 +++++--
>  4 files changed, 49 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 1a90db5759b8..3528ecbbc1ab 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -366,7 +366,8 @@ static void a6xx_submit(struct msm_gpu *gpu, struct m=
sm_gem_submit *submit)
>  static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
>                 struct a6xx_gpu *a6xx_gpu, struct msm_gpu_submitqueue *qu=
eue)
>  {
> -       u64 preempt_offset_priv_secure;
> +       bool sysprof =3D refcount_read(&a6xx_gpu->base.base.sysprof_activ=
e) > 1;
> +       u64 preempt_offset_priv_secure, preempt_postamble;
>
>         OUT_PKT7(ring, CP_SET_PSEUDO_REG, 15);
>
> @@ -403,6 +404,17 @@ static void a6xx_emit_set_pseudo_reg(struct msm_ring=
buffer *ring,
>         /* seems OK to set to 0 to disable it */
>         OUT_RING(ring, 0);
>         OUT_RING(ring, 0);
> +
> +       if (!sysprof && a6xx_gpu->preempt_postamble_len) {
> +               preempt_postamble =3D SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx=
_gpu);
> +
> +               OUT_PKT7(ring, CP_SET_AMBLE, 3);
> +               OUT_RING(ring, lower_32_bits(preempt_postamble));
> +               OUT_RING(ring, upper_32_bits(preempt_postamble));
> +               OUT_RING(ring, CP_SET_AMBLE_2_DWORDS(
> +                                       a6xx_gpu->preempt_postamble_len) =
|
> +                               CP_SET_AMBLE_2_TYPE(KMD_AMBLE_TYPE));
> +       }

Hmm, ok, we set this in the submit path.. but do we need to clear it
somehow when transitioning from !sysprof to sysprof?

Also, how does this interact with UMD perfctr queries, I would expect
they would prefer save/restore?

BR,
-R

>  }
>
>  static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *subm=
it)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 652e49f01428..2338e36c8f47 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -66,6 +66,7 @@ struct a6xx_gpu {
>         atomic_t preempt_state;
>         spinlock_t eval_lock;
>         struct timer_list preempt_timer;
> +       uint64_t preempt_postamble_len;
>
>         unsigned int preempt_level;
>         bool uses_gmem;
> @@ -99,6 +100,11 @@ struct a6xx_gpu {
>  #define SCRATCH_USER_CTX_IOVA(ring_id, a6xx_gpu) \
>         (a6xx_gpu->scratch_iova + (ring_id * sizeof(uint64_t)))
>
> +#define SCRATCH_PREEMPT_POSTAMBLE_OFFSET (100 * sizeof(u64))
> +
> +#define SCRATCH_PREEMPT_POSTAMBLE_IOVA(a6xx_gpu) \
> +       (a6xx_gpu->scratch_iova + SCRATCH_PREEMPT_POSTAMBLE_OFFSET)
> +
>  /*
>   * In order to do lockless preemption we use a simple state machine to p=
rogress
>   * through the process.
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a6xx_preempt.c
> index 4b61b993f75f..f586615db97e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -351,6 +351,28 @@ static int preempt_init_ring(struct a6xx_gpu *a6xx_g=
pu,
>         return 0;
>  }
>
> +static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
> +{
> +       u32 *postamble =3D a6xx_gpu->scratch_ptr + SCRATCH_PREEMPT_POSTAM=
BLE_OFFSET;
> +       u32 count =3D 0;
> +
> +       postamble[count++] =3D PKT7(CP_REG_RMW, 3);
> +       postamble[count++] =3D REG_A6XX_RBBM_PERFCTR_SRAM_INIT_CMD;
> +       postamble[count++] =3D 0;
> +       postamble[count++] =3D 1;
> +
> +       postamble[count++] =3D PKT7(CP_WAIT_REG_MEM, 6);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_0_FUNCTION(WRITE_EQ);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_1_POLL_ADDR_LO(
> +                               REG_A6XX_RBBM_PERFCTR_SRAM_INIT_STATUS);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_2_POLL_ADDR_HI(0);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_3_REF(0x1);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_4_MASK(0x1);
> +       postamble[count++] =3D CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
> +
> +       a6xx_gpu->preempt_postamble_len =3D count;
> +}
> +
>  void a6xx_preempt_fini(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -382,10 +404,12 @@ void a6xx_preempt_init(struct msm_gpu *gpu)
>         a6xx_gpu->skip_save_restore =3D 1;
>
>         a6xx_gpu->scratch_ptr  =3D msm_gem_kernel_new(gpu->dev,
> -                       gpu->nr_rings * sizeof(uint64_t), MSM_BO_WC,
> +                       PAGE_SIZE, MSM_BO_WC,
>                         gpu->aspace, &a6xx_gpu->scratch_bo,
>                         &a6xx_gpu->scratch_iova);
>
> +       preempt_prepare_postamble(a6xx_gpu);
> +
>         if (IS_ERR(a6xx_gpu->scratch_ptr))
>                 goto fail;
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 6b1888280a83..87098567483b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -610,12 +610,15 @@ OUT_PKT4(struct msm_ringbuffer *ring, uint16_t regi=
ndx, uint16_t cnt)
>         OUT_RING(ring, PKT4(regindx, cnt));
>  }
>
> +#define PKT7(opcode, cnt) \
> +       (CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15) | \
> +               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23))
> +
>  static inline void
>  OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
>  {
>         adreno_wait_ring(ring, cnt + 1);
> -       OUT_RING(ring, CP_TYPE7_PKT | (cnt << 0) | (PM4_PARITY(cnt) << 15=
) |
> -               ((opcode & 0x7F) << 16) | (PM4_PARITY(opcode) << 23));
> +       OUT_RING(ring, PKT7(opcode, cnt));
>  }
>
>  struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
>
> --
> 2.46.0
>

