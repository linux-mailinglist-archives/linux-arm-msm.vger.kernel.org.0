Return-Path: <linux-arm-msm+bounces-31323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D30971B57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 15:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D71D282A6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308D71BA279;
	Mon,  9 Sep 2024 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxTyWhe+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0F1B9B57;
	Mon,  9 Sep 2024 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725889392; cv=none; b=ig1xb0HlYm7BM9TXBwhUcPA6WSplIqqVa+mcrG4VqoeoBRUBFPZrIt7fTrUQcpzAgdeUG9im+KjXZCfC0uesBGCwJEHzQEzIAvWDQ5n05AACHKA8fDXTlu+XccI+44RRR+YjR55+YQbKiVXOAJowgBXGS4w+Lcwfkd4xN8FJz2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725889392; c=relaxed/simple;
	bh=OPdOYsMpEcSugFnrADfFiGDCQagXK3eE4jUQlB0aoWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRKkMoNwOOHz9sPPH2MiiGz2OHvrNY/rIr82nqz4b5m/r3B1QOFJeo9LBn9w8dhc0RkVTh0v/XCpdYz0GEMTU0xzzTWorrK1TFtgiqbotIYPk4waPSW620GBONy97LuvGkMKw40TdpFS9DCa22DmFXlpWadgDeSh3/dg45KXq3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxTyWhe+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d8afdd62e8so490310a91.3;
        Mon, 09 Sep 2024 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725889390; x=1726494190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgDu7K8tlaL91YL3Tof02NsN1tNN3lVywAWATfL7mwQ=;
        b=lxTyWhe+1N96dhgx+aA6ousfQE47t5vcJoX86XrkAcV07sSy2fGRWffUuRODkylWez
         yMVt1MeL+aaZpkeDLNrqtrUhB190i5MmfJsWi78mzYL2TA+/aAwarp3v9I8yXVYiKuTj
         hTR6SDAOyMKNubEtVGb0sQG0kpbafEegcKUYx1ot+Ichn4rb3LJ+g+NB/c/7O4GiPDd8
         ekD4lCSAjz7vITM0gkEflH65HdD4y2daTUOx2HCnRfFg+xEa09s+lUKBU4gf7OTpPeRP
         39wwlbgHMosofBTJZmJCSGUSCXJtuHgtrGKZfTQvaih0vUi5Rog/SH7r72PVe4D378x7
         eAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889390; x=1726494190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgDu7K8tlaL91YL3Tof02NsN1tNN3lVywAWATfL7mwQ=;
        b=cu4ZV0FYPUh6qhRuDMyH/v+AdjBkhTeeZgGkyptnyu7zPg8G/IN09wHlplfpvoVe7u
         RgKt9ZTjXeljjzTBgyJkMlfp44iESKeKhRS5bi7Ffn3Yi0ZgwHGR1++Uj6VFzNZp4swV
         yn5EB6uXU6bBn3unm9Mz2NZ31h4N4lps9Vb93MG2+h+Z7M+XWoDSNNq0uHPUw2ZWgiZw
         Nbr3XF52enyU2a4xXy2AW3UI169XPszR0q9Y5zAAB5W5lLxBrUiUoFOdn8HVhlBSCGnM
         3yEdgsFbVumSVr1M3y3c7lQWtQyh0Zhq3mF49/tCUg734fZMqvnqYtYZDKxr1DlzfFt5
         OX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8IlV3Q8ZkiwF84nYW78XR1Ej3QCcueidIoEes0V0TBNdFhmFehlTQiIChsg1FEccl+r5bY5NeOH2p4HCk@vger.kernel.org, AJvYcCVqSQDxtAf58NoCZd0nmjEKOi0nN1uWuHxFXlj0GxfWTcPwHro/3v3giSKtzrlkrSZo5M0JESqAKWvU@vger.kernel.org, AJvYcCWfmQENxWrkGOWL8IUcLZPlUds8svLhKUuF7LM8y9PFJfcYcsERdC1xVfgK4Jrn5ZA4aW2ojFQzv1FmQEfp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz0me2GhyWVeTCIkDBt9kZXFx5qlasEzmcpnD7ui4ecp1kSiVY
	908Nmt5UEsNox1t8H4CIPlvpXMD8cZ+aRf/T+Yc+yDv5E0aPmo5kQORV2iKVf2L3HMKfYKoNC/t
	K/s6KE36RSIimcxXN1JarGAdtEoM=
X-Google-Smtp-Source: AGHT+IEpNKUplvobMAHwQsNd4YEbne1nahgYb4SFmj2oqMNm+eujaQfMJOdRxTAMDlx5AnDhOx/g4PUGM0s/XNhIBfc=
X-Received: by 2002:a17:902:c409:b0:206:b6db:49a2 with SMTP id
 d9443c01a7336-206f0652f64mr54765785ad.8.1725889389597; Mon, 09 Sep 2024
 06:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com> <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
In-Reply-To: <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Mon, 9 Sep 2024 14:42:58 +0100
Message-ID: <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Sharat Masetty <smasetty@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 2:15=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> > On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> >> This patch implements preemption feature for A6xx targets, this allows
> >> the GPU to switch to a higher priority ringbuffer if one is ready. A6X=
X
> >> hardware as such supports multiple levels of preemption granularities,
> >> ranging from coarse grained(ringbuffer level) to a more fine grained
> >> such as draw-call level or a bin boundary level preemption. This patch
> >> enables the basic preemption level, with more fine grained preemption
> >> support to follow.
> >>
> >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> >> ---
> >>   drivers/gpu/drm/msm/Makefile              |   1 +
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 ++++++++++++++++++++=
+-
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> ...
> >
> > we can use the lighter smp variant here.
> >
> >> +
> >> +            if (a6xx_gpu->cur_ring =3D=3D ring)
> >> +                    gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> >> +            else
> >> +                    ring->skip_inline_wptr =3D true;
> >> +    } else {
> >> +            ring->skip_inline_wptr =3D true;
> >> +    }
> >> +
> >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> >>   }
> >>
> >>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 count=
er,
> >> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu *=
a6xx_gpu,
> >
> > set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> > not. This is currently not tracked separately for each ring. Can you
> > please check that?
>
> I totally missed that. Thanks for catching it!
>
> >
> > I wonder why that didn't cause any gpu errors in testing. Not sure if I
> > am missing something.
> >
>
> I think this is because, so long as a single context doesn't submit to
> two different rings with differenr priorities, we will only be incorrect
> in the sense that we emit more page table switches than necessary and
> never less. However untrusted userspace could create a context that
> submits to two different rings and that would lead to execution in the
> wrong context so we must fix this.

FWIW, in Mesa in the future we may want to expose multiple Vulkan
queues per device. Then this would definitely blow up.

Connor

>
> >>
> >>      /*
> >>       * Write the new TTBR0 to the memstore. This is good for debuggin=
g.
> >> +     * Needed for preemption
> >>       */
> >> -    OUT_PKT7(ring, CP_MEM_WRITE, 4);
> >> +    OUT_PKT7(ring, CP_MEM_WRITE, 5);
> >>      OUT_RING(ring, CP_MEM_WRITE_0_ADDR_LO(lower_32_bits(memptr)));
> >>      OUT_RING(ring, CP_MEM_WRITE_1_ADDR_HI(upper_32_bits(memptr)));
> >>      OUT_RING(ring, lower_32_bits(ttbr));
> >> -    OUT_RING(ring, (asid << 16) | upper_32_bits(ttbr));
> >> +    OUT_RING(ring, upper_32_bits(ttbr));
> >> +    OUT_RING(ring, ctx->seqno);
> >>
> >>      /*
> >>       * Sync both threads after switching pagetables and enable BR onl=
y
> >> @@ -268,6 +363,43 @@ static void a6xx_submit(struct msm_gpu *gpu, stru=
ct msm_gem_submit *submit)
> >>      a6xx_flush(gpu, ring);
> >>   }
> ...
> >> +    struct a6xx_preempt_record *record_ptr =3D
> >> +            a6xx_gpu->preempt[ring->id] + PREEMPT_OFFSET_PRIV_NON_SEC=
URE;
> >> +    u64 ttbr0 =3D ring->memptrs->ttbr0;
> >> +    u32 context_idr =3D ring->memptrs->context_idr;
> >> +
> >> +    smmu_info_ptr->ttbr0 =3D ttbr0;
> >> +    smmu_info_ptr->context_idr =3D context_idr;
> >> +    record_ptr->wptr =3D get_wptr(ring);
> >> +
> >> +    /*
> >> +     * The GPU will write the wptr we set above when we preempt. Rese=
t
> >> +     * skip_inline_wptr to make sure that we don't write WPTR to the =
same
> >> +     * thing twice. It's still possible subsequent submissions will u=
pdate
> >> +     * wptr again, in which case they will set the flag to true. This=
 has
> >> +     * to be protected by the lock for setting the flag and updating =
wptr
> >> +     * to be atomic.
> >> +     */
> >> +    ring->skip_inline_wptr =3D false;
> >> +
> >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> >> +
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO,
> >> +            a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_SMMU_IN=
FO);
> >> +
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR,
> >> +            a6xx_gpu->preempt_iova[ring->id] + PREEMPT_OFFSET_PRIV_NO=
N_SECURE);
> >> +
> >> +    preempt_offset_priv_secure =3D
> >> +            PREEMPT_OFFSET_PRIV_SECURE(adreno_gpu->info->preempt_reco=
rd_size);
> >> +    gpu_write64(gpu,
> >> +            REG_A6XX_CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR,
> >> +            a6xx_gpu->preempt_iova[ring->id] + preempt_offset_priv_se=
cure);
> >
> > Secure buffers are not supported currently, so we can skip this and the
> > context record allocation. Anyway this has to be a separate buffer
> > mapped in secure pagetable which don't currently have. We can skip the
> > same in pseudo register packet too.
> >
>
> Mmm it would appear that not setting it causes an hang very early. I'll
> see if I can find out more about what is going on.
>
> >> +
> >> +    a6xx_gpu->next_ring =3D ring;
> >> +
> ...
> >>
> >>   struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int i=
d,
> >>
> >> --
> >> 2.46.0
> >>
>
> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>

