Return-Path: <linux-arm-msm+bounces-72606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 383ECB49459
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 17:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D711188BB7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 15:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D7A30AD0F;
	Mon,  8 Sep 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjkpK71S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97B2E8E11
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757346904; cv=none; b=Ay+oQMQrrbgmynKN7vpaDx3+LOQMvfS02JduKt0H9LkKlDlJQs+r/wMDmxaLK0BtkfLzpA25TbB1Nghhe5DTXu6vdd+TfsRkjUz6IfHtreyGMQnvnMakXafJZ17JjqFJuiMbLA8ueNUAJVdG2K3WNUmifpevZ33yeGC/Me1NW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757346904; c=relaxed/simple;
	bh=CS00lYhJ/JI5qKzMwFjNeQzKhbAph8tswKHiCA52zAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjJOj8PL9PoEt8/uPupUEl2ZtOX3G/lQVD723UORNQQ8S5dOxrxExXsMt5kXg6nUWCkH2lnkXt4xUoB4hTkcvvTF8KRRGBDstU6ZiVs17s4eyMSUCBxG8XMiFE7SKiPtnDAZVstUT8C9X+mvMnIqqS3It+0Nh6Ik+H4/184NU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjkpK71S; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b47174b335bso458887a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757346901; x=1757951701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncy8rMYMPoo6qD4OwV7z755Sx/k/Cp6xU0Sc/P4F2ss=;
        b=fjkpK71S5DpGykTtYh46fZWOtKhteNpBsB/2ZbDV+am94wZv+K4a1/Vz5gi3AtPBpd
         O862qxZxrGSDKXqkS8XPIDALQVzGJ+kKyePqOeBofP9X5sAKcpDKiuDuClmvX4SglQWw
         +Bhf32QhtV8/L9XmI02RNBN1LM3xbqivCfxLxWjhD6VsXIAr8MvC4ToruMsdYY2MJ9jQ
         Gvsnj/DfCu1NkXbxDbQ8M9X3kfisVDh6gmpt68FOYcCOWQt8Qf+NknR2zpLabqyvFV+e
         OS6N/matF2P7E/OvvwQTIwa4tit0sKOyTWxGIoHWVGHzwMRqtsWOV+7yq2W1hXxcLNdk
         +ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757346901; x=1757951701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncy8rMYMPoo6qD4OwV7z755Sx/k/Cp6xU0Sc/P4F2ss=;
        b=afjh7UbJgQsyiM2pGjxQadPUQ45lpurAWmA2KmcPnQ/76InqQqeYw2pNSvSJTKWlP3
         Ct+b2Mor/f2sElTtDm4IAOgrUH4Aik3PrNw6LyUuUWnu6fkSfYO03tgMYfJIeWuGE7l4
         Pu440pjwDvVmom2m488QGQs9ugyCFJqDCBI3yEY6jVboz70pqgnBHatqix5Kt1a+OaQh
         TAP1f2xfPp5cdljsyUhxyqqI4xqujxuPUXpu/fEjIeMB2GxbVDHoo/cSBP9PF04sTk6F
         7RPLjR9G+lYROSvM21kNdRR97/p7UXNZ6awFXtRqkS2jBoJhrwNRMzFY1wK3IV7r+PMf
         w/lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdLYLjStbr5WBEtKqRwTypymkiE63xhD/z6gDFCiE/wB0y8aX77YALUMpoj45DY4CtpGYKv7Uj8PdO9Xnx@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1j8fyVxIzhfmtFeAP6fnNLsb+AHLejSUewyXVboGVlaA0U0P
	dsTsb1MLLsq48VDRJCksUaPXIuBvWOQRfGAszJtWGB9WDeRVEXQHiMGKdZmlScCN3Hnv32Jw6u0
	kBE5HoxZ2SY7Yu/+XgG5UUb11HSHPUjU=
X-Gm-Gg: ASbGnctaHfiCdzBHIpoBrf5NvjkZ+pyC/d6w6utnJljRPdX5svBWsCWuwfd54lS2MB+
	b4XJF2UhlMTOHF7JvCQetc5tyPDwrvNGkE5sc7gX8M63kf7wMo1fyrlMc2W5oNg9PZfTA60Z6uP
	zseQOawvb0wywFa9lqIFh2qi7lY0Y2grIAeFRUC5zjqXgleaMepM1S7f6RVLdbP0rsLXLHURXFj
	QsNP3hYXvOVUrIidw==
X-Google-Smtp-Source: AGHT+IGZSQ5JJVv+TntNrNjXPczNaBQa/rBlW+/B4duhLKucX8M6mTF04KFFT56z8aAM798hVCMz9iyyyiTT/FE7BWQ=
X-Received: by 2002:a17:90b:38cb:b0:32b:dcef:f65f with SMTP id
 98e67ed59e1d1-32d43f772e8mr6052003a91.3.1757346901055; Mon, 08 Sep 2025
 08:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com> <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-7-631b1080bf91@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 8 Sep 2025 11:54:49 -0400
X-Gm-Features: Ac12FXwZh4Knfa5C5jRkwC4PMADG3bi9JxMMu92KfaQYtzGrloYElebo2U4Ct24
Message-ID: <CACu1E7H_K0WbWsHDqD44YfyMvc9bfZon-Tx75LkBFqWdG2YZ=Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] drm/msm/adreno: Add fenced regwrite support
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

On Mon, Sep 8, 2025 at 4:27=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> There are some special registers which are accessible even when GX power
> domain is collapsed during an IFPC sleep. Accessing these registers
> wakes up GPU from power collapse and allow programming these registers
> without additional handshake with GMU. This patch adds support for this
> special register write sequence.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 80 +++++++++++++++++++++++++=
+++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++----
>  3 files changed, 90 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..a63dad80ef461da45d5c41a04=
2ed4f19d8282ef5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,84 @@
>
>  #define GPU_PAS_ID 13
>
> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 valu=
e, u32 status, u32 mask)
> +{
> +       /* Success if !writedropped0/1 */
> +       if (!(status & mask))
> +               return true;
> +
> +       udelay(10);
> +
> +       /* Try to update fenced register again */
> +       gpu_write(gpu, offset, value);
> +
> +       /* We can't do a posted write here because the power domain could=
 be
> +        * in collapse state. So use the heaviest barrier instead
> +        */
> +       mb();
> +       return false;
> +}
> +
> +static int fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u32 value=
, u32 mask)
> +{
> +       struct adreno_gpu *adreno_gpu =3D &a6xx_gpu->base;
> +       struct msm_gpu *gpu =3D &adreno_gpu->base;
> +       struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> +       u32 status;
> +
> +       gpu_write(gpu, offset, value);
> +
> +       /* Nothing else to be done in the case of no-GMU */
> +       if (adreno_has_gmu_wrapper(adreno_gpu))
> +               return 0;
> +
> +       /* We can't do a posted write here because the power domain could=
 be
> +        * in collapse state. So use the heaviest barrier instead
> +        */
> +       mb();
> +
> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +                       fence_status_check(gpu, offset, value, status, ma=
sk), 0, 1000))
> +               return 0;
> +
> +       /* Try again for another 1ms before failing */
> +       gpu_write(gpu, offset, value);
> +       mb();
> +
> +       if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
> +                       fence_status_check(gpu, offset, value, status, ma=
sk), 0, 1000)) {
> +               /*
> +                * The 'delay' warning is here because the pause to print=
 this
> +                * warning will allow gpu to move to power collapse which
> +                * defeats the purpose of continuous polling for 2 ms
> +                */
> +               dev_err_ratelimited(gmu->dev, "delay in fenced register w=
rite (0x%x)\n",
> +                               offset);
> +               return 0;
> +       }
> +
> +       dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\=
n",
> +                       offset);
> +
> +       return -ETIMEDOUT;
> +}
> +
> +int a6xx_fenced_write(struct a6xx_gpu *a6xx_gpu, u32 offset, u64 value, =
u32 mask, bool is_64b)
> +{
> +       int ret;
> +
> +       ret =3D fenced_write(a6xx_gpu, offset, lower_32_bits(value), mask=
);
> +       if (ret)
> +               return ret;
> +
> +       if (!is_64b)
> +               return 0;
> +
> +       ret =3D fenced_write(a6xx_gpu, offset + 1, upper_32_bits(value), =
mask);
> +
> +       return ret;
> +}
> +
>  static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> @@ -86,7 +164,7 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm=
_ringbuffer *ring)
>         /* Update HW if this is the current ring and we are not in preemp=
t*/
>         if (!a6xx_in_preempt(a6xx_gpu)) {
>                 if (a6xx_gpu->cur_ring =3D=3D ring)
> -                       gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +                       a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, =
wptr, BIT(0), false);
>                 else
>                         ring->restore_wptr =3D true;
>         } else {
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.h
> index 6e71f617fc3d0d564e51650dfed63a18f31042ac..e736c59d566b3fcf8c62a2124=
94e3b110c09caa9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -295,5 +295,6 @@ int a6xx_gpu_state_put(struct msm_gpu_state *state);
>
>  void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, =
bool gx_off);
>  void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
> +int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 m=
ask, bool is_64b);

"mask" makes it sound like it's the mask for a masked write, which it
isn't. At least in the public API I'd name it something more explicit
like "fence_status_mask". Also it would be nice to add defines like
GMU_FENCE_STATUS_WPTR/CONTEXT_SWITCH to make the parameter values in
callsites less magical. Finally, this might be personal preference,
but it's not immediately obvious what the "true"/"false" in callsites
mean, so it would make users clearer to add a separate
"a6xx_fenced_write64" and make 64-bit reg writes use that instead of
is_64b.

Connor

>
>  #endif /* __A6XX_GPU_H__ */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/=
msm/adreno/a6xx_preempt.c
> index 6a12a35dabff1e64aae8440c2a8c88f5feb4803e..10625ffbc4cfc26edc36efcf1=
1dbb4efd55ab3e0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -41,7 +41,7 @@ static inline void set_preempt_state(struct a6xx_gpu *g=
pu,
>  }
>
>  /* Write the most recent wptr for the given ring into the hardware */
> -static inline void update_wptr(struct msm_gpu *gpu, struct msm_ringbuffe=
r *ring)
> +static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_rin=
gbuffer *ring)
>  {
>         unsigned long flags;
>         uint32_t wptr;
> @@ -51,7 +51,7 @@ static inline void update_wptr(struct msm_gpu *gpu, str=
uct msm_ringbuffer *ring)
>         if (ring->restore_wptr) {
>                 wptr =3D get_wptr(ring);
>
> -               gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> +               a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_RB_WPTR, wptr, BI=
T(0), false);
>
>                 ring->restore_wptr =3D false;
>         }
> @@ -172,7 +172,7 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>
>         set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
>
> -       update_wptr(gpu, a6xx_gpu->cur_ring);
> +       update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>
>         set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>
> @@ -268,7 +268,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>          */
>         if (!ring || (a6xx_gpu->cur_ring =3D=3D ring)) {
>                 set_preempt_state(a6xx_gpu, PREEMPT_FINISH);
> -               update_wptr(gpu, a6xx_gpu->cur_ring);
> +               update_wptr(a6xx_gpu, a6xx_gpu->cur_ring);
>                 set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>                 spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
>                 return;
> @@ -302,13 +302,13 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>
>         spin_unlock_irqrestore(&ring->preempt_lock, flags);
>
> -       gpu_write64(gpu,
> -               REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> -               a6xx_gpu->preempt_smmu_iova[ring->id]);
> +       a6xx_fenced_write(a6xx_gpu,
> +               REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_s=
mmu_iova[ring->id],
> +               BIT(1), true);
>
> -       gpu_write64(gpu,
> +       a6xx_fenced_write(a6xx_gpu,
>                 REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> -               a6xx_gpu->preempt_iova[ring->id]);
> +               a6xx_gpu->preempt_iova[ring->id], BIT(1), true);
>
>         a6xx_gpu->next_ring =3D ring;
>
> @@ -328,7 +328,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>         set_preempt_state(a6xx_gpu, PREEMPT_TRIGGERED);
>
>         /* Trigger the preemption */
> -       gpu_write(gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl);
> +       a6xx_fenced_write(a6xx_gpu, REG_A6XX_CP_CONTEXT_SWITCH_CNTL, cntl=
, BIT(1), false);
>  }
>
>  static int preempt_init_ring(struct a6xx_gpu *a6xx_gpu,
>
> --
> 2.50.1
>

