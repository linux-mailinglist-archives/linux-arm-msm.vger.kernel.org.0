Return-Path: <linux-arm-msm+bounces-30313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A6966ABF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0518B284A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0551BF7FD;
	Fri, 30 Aug 2024 20:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQUVzpUS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B71BD00F;
	Fri, 30 Aug 2024 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050235; cv=none; b=IrJWyp37IotElfTV3/aQzpj+Bdi4NpzebeM9Fp8mdtdSy/IHmpTzPX+4f2GVAZxUoKclXiUtGSGYPtQE5gb3i5+oNO8vZ0SRxxqWF7xqtOtQ8J/Jvmvftrs40aQWMVPhQUfQBynPlPPez9rUh30UJuety3WagZsHRhGFUBZJ8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050235; c=relaxed/simple;
	bh=c3WCB+XMKHkIhwbiRpzvW51j6lByBKQZ9lpJoC1uMRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBCO68Hfa+O7i70QAkU2lvCpSm+rc7SM5K+DVb5D/F/7qlNboBYTzkyXPvTXfTOXc5w7bLlYhEppUKqs1znkOnRTFBsjLjgXFCN4eC8kmjgkh7fVLvryJBDrWodPk77rawhbaS5Wz177RXvl8KIEMRmqaCEkmvX9CQCPFXdCAhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQUVzpUS; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3de13126957so1443653b6e.0;
        Fri, 30 Aug 2024 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725050232; x=1725655032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+kQe6VsLr0w8NPho0fLf/Dst/MLp8Ox6OpvKwqHs6A=;
        b=LQUVzpUSt+zTPdpk8JdEpd+f3doxiaIIaKDNxViiQp0jsBdJ19n1IdsMYap2L+ROog
         uv+q1JEKmNDr2FTNFfJI06osT118lzUTv4sxqkrpg0rilompUy6P0EiF530cv2CDicLZ
         szjnZ0jK5bjx/TiJ3Szt/3QZz/I/8UM3NEpwJb+mesK3U5xkBpHWEmxCYeHxwdMtLP4Z
         M6FnfqSQUc7Uqb8HjdSa35WL1jD2MEu0I2CUEQ21Utdix5TGjSRxfnq9EQZiIQfeycz6
         IXVoJ/2r3zX4A+CFDTU25vwk8JsIyeXzvkPXPRsGKrLakput1VBIozDyqyrdNltAfP9j
         x6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725050232; x=1725655032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+kQe6VsLr0w8NPho0fLf/Dst/MLp8Ox6OpvKwqHs6A=;
        b=F4IVQg0c+HlVjaQ5BOuMEVXq5Gl10sZNLARyhslIM4fLnhfETxokrk6xJQTZvfQoYA
         1g/BaU86iVJQW4xXYGFL9uRGrXmtG4zFrvS265J0EfmXD+07YH2lACwehHRek/cwfngg
         ENuWiRqtkV5pLkZrdBokpe3nLYEDWiejyTuIAxg1Bu1KcMbJzpCwwcbMR1rmLa89RlDk
         tY86VZaL9K3AFPeQVm3V1PkoEXGBofuEo84tEfTSsxBCN2XvKO4trEsN5kN9iGpSRjba
         Lp6OsztNtchNQi9mW6fo0D72tXxW3mI3Q1N6ky6qGH6r748y11zhCOqSN3Zj0id0N+0u
         ciGA==
X-Forwarded-Encrypted: i=1; AJvYcCV+vdjSO11vvjqG2XaNKvuZn410bZ5Htxt78pSBp+LF+8EmmZ5x6VsR870djo7bR60xdIFkyb/J/OzIoQmv@vger.kernel.org, AJvYcCWwdY8EcR6DrtKoN/edvdDvvh5fvEluy4PyrKGi+vp/3a6cfETgern3/+Jijhay+NDILhnTd9f2qcxysMEg@vger.kernel.org
X-Gm-Message-State: AOJu0YydbZj7Ng0xHTerIB3cECz4AiWpt1vYAr+OdZsfOl9tRxkcjK9J
	sc5VvplcQwo0cLmoMc6pxnyewYpEZHcOAjgpm/xQpchAcozlUK4DEfq2oZA+1L6oJN9wv5lT5xC
	BiY5Zs2xgDZ71+xHhHEvD5KKOXZ8=
X-Google-Smtp-Source: AGHT+IGBK5VzsLTg+8hHTDlEwYoRoCMP3HK0fagxgjtTycr60ZVf6Hnz+b7BKk+/0NUyK2hlKcW4jKAotktIaq2r89c=
X-Received: by 2002:a05:6808:144c:b0:3da:bc80:b233 with SMTP id
 5614622812f47-3df05d6e387mr8639762b6e.17.1725050232471; Fri, 30 Aug 2024
 13:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com> <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:36:59 -0700
Message-ID: <CAF6AEGuMah=C_i1qqaAP+Pz5t=bX5+Tq4Mq6HXoSeyWpaj7Cqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 921 insertions(+), 9 deletions(-)
>

[snip]

> +void a6xx_preempt_trigger(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> +       u64 preempt_offset_priv_secure;
> +       unsigned long flags;
> +       struct msm_ringbuffer *ring;
> +       uint64_t user_ctx_iova;
> +       unsigned int cntl;
> +
> +       if (gpu->nr_rings =3D=3D 1)
> +               return;
> +
> +       /*
> +        * Lock to make sure another thread attempting preemption doesn't=
 skip it
> +        * while we are still evaluating the next ring. This makes sure t=
he other
> +        * thread does start preemption if we abort it and avoids a soft =
lock.
> +        */
> +       spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
> +
> +       /*
> +        * Try to start preemption by moving from NONE to START. If
> +        * unsuccessful, a preemption is already in flight
> +        */
> +       if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
> +               spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> +               return;
> +       }
> +
> +       cntl =3D (((a6xx_gpu->preempt_level << 6) & 0xC0) |
> +               ((a6xx_gpu->skip_save_restore << 9) & 0x200) |
> +               ((a6xx_gpu->uses_gmem << 8) & 0x100) | 0x1);

nit, could we define these fields in the xml, and not open-code
register building?

BR,
-R

