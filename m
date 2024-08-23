Return-Path: <linux-arm-msm+bounces-29347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A7995C9CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 11:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE211F261D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35544185B79;
	Fri, 23 Aug 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4+iLpm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67917DFFC;
	Fri, 23 Aug 2024 09:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406889; cv=none; b=JeTDKf/dKQyaWXeC3kJ4Wvp7wP2rEYX9JWBV4ZTVSGyYpBeAuMcnwpAaGn25cZlvcXn9FaSpaUka2NJq2lRmR52owgBZ5YgyCv089MV2zFD14JgU4+ffMvQ7O2J1jt33u/aFPjpF3f6v2B6plWDsmIWfP9IkFCiYNAal0XgVEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406889; c=relaxed/simple;
	bh=mNpqaZEJj0E/otrpKHpE9Qh6U2sfPn/VXuSZ63+Hlbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZiVal+sgzCrN4QsnfrpyjWo7sFuWNzhg8RgYm+dGvs6ZehwM/+vdtO4Guuf2ARgHO9O4MEcRf8NcIbzRhhzijiYtc7DQ27FcnZ2Xn2IdvTQsSppnjCC1WY02XRg7E8r0kC+ZdXrhOyKkzhSOhyWjP7QV09y6TqcBGnIF59QpuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4+iLpm8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d3badec49eso258252a91.1;
        Fri, 23 Aug 2024 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724406887; x=1725011687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4bN9IfcVP0Js1Ho+sT05Ee5/YCq3s77Z8TA53IzYiQ=;
        b=V4+iLpm8873FzVEklHvFL4t39/0ay0w0cEg46RNh3KqzcNSfp4hrnF159W3VJFkrF5
         1Ib5MUs6wT9C1sJI7e7MHvL9hsznA/i4qqvpUnJQdO+TzPKibHAtsdwl2NsPbFCvFoZs
         /X9dTYKRBtZ4zWnk3bzA61IhllrnamWnp4uVH+35tm2dDtvSpup4nCXnBWYj0w1qZARH
         StsRA12Pj7sK7dThBlg4OOMhnz4omhtQT7LkdrvAjG077ldcKz0XRQpvM4fKyZ2n67uq
         g4/yUAXRww8iMTry+v12mCf+c9QB722Y7ychup4Fpo6t5tUAIklqFf8aWmowroZDF2gR
         VOwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724406887; x=1725011687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4bN9IfcVP0Js1Ho+sT05Ee5/YCq3s77Z8TA53IzYiQ=;
        b=Q1BWiRvBBKVwkeTNW8/l9Y0eIp7ZcKLSz+nmTg2TW+0iogFjIdKeAS+UY3jhTXl/ux
         lIKoIqsaYPdcVqT0DIR5FrDN9ONOvYyGhQKzaX/VTwS4QNfaZtng7Zcl+4DnF1t7eYEJ
         3uO0wWBNH7Nuqc1BOEbpn/07bVU0JCIrM36XhT+OFVOiUEwllC7HdzEffSrrcuysZZE0
         aSmJ8ySEEl8JQFgxCpjmB8sXDxszQeC1kbH+XFR0cnxsYpNHRWIfJ9Y10AsNQfd5JByY
         C+bYvFz1AuEPSdVVzFVuJCwYVFI8R05Pc2OC0AVZvG/bJTnupUUCSor6ZUQodACSo9fK
         djiA==
X-Forwarded-Encrypted: i=1; AJvYcCVg64MCJNmJcvpOE236i/e8ld+aTa6ucnpQMsRzGrMNpDQ6u82pVmFubuccXx1LiXxNjdOSD57VwPwp0LjK@vger.kernel.org, AJvYcCWE6bDQtwQ01YyjEfgarMtCVO60eglTfzD6HEQE5d/rV7EpR4/MMN6e8krr8+yfo3z8+r7ncomsJ3hnoIG0@vger.kernel.org
X-Gm-Message-State: AOJu0YxBM0cKKjA/7SIJs9J/B5n2qcrl3Q7dkNMmILHKwNiVvxk/B8Jd
	52MpsRsr6b5Gsn3+Ju0lxt7MwoaQZbIsHLYuBem+cAgdLe2FpFMye0dlRIQf2rsrjUrMNTev1Tx
	q2BPFlVjPgMbO63maCed2uCgqNAQ=
X-Google-Smtp-Source: AGHT+IHkKd6W3yLC8UO7e6tYlcg+yxaTXlITfiFbSzWQxEydP7NfUV7YDnPSBqBENI+EV62HFZxca1DdRI9a5B+97vI=
X-Received: by 2002:a17:90a:1f07:b0:2c9:6920:d2b2 with SMTP id
 98e67ed59e1d1-2d646b9d9bfmr949904a91.1.1724406886880; Fri, 23 Aug 2024
 02:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com> <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
In-Reply-To: <95f0517a-ed86-4905-85e5-a123880c6fa8@linaro.org>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 23 Aug 2024 10:54:34 +0100
Message-ID: <CACu1E7FxE3rLN8SV1-5Zg7=+LqCAwHuiCcXroikS4=yRPsdnMQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] Preemption support for A7XX
To: neil.armstrong@linaro.org
Cc: Antonino Maniscalco <antomani103@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:30=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 15/08/2024 20:26, Antonino Maniscalco wrote:
> > This series implements preemption for A7XX targets, which allows the GP=
U to
> > switch to an higher priority ring when work is pushed to it, reducing l=
atency
> > for high priority submissions.
> >
> > This series enables L1 preemption with skip_save_restore which requires
> > the following userspace patches to function:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30544
> >
> > A flag is added to `msm_gem_submit` to only allow submissions from comp=
atible
> > userspace to be preempted, therefore maintaining compatibility.
> >
> > Some commits from this series are based on a previous series to enable
> > preemption on A6XX targets:
> >
> > https://lkml.kernel.org/1520489185-21828-1-git-send-email-smasetty@code=
aurora.org
> >
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> > Antonino Maniscalco (7):
> >        drm/msm: Fix bv_fence being used as bv_rptr
> >        drm/msm: Add submitqueue setup and close
> >        drm/msm: Add a `preempt_record_size` field
> >        drm/msm/A6xx: Implement preemption for A7XX targets
> >        drm/msm/A6xx: Add traces for preemption
> >        drm/msm/A6XX: Add a flag to allow preemption to submitqueue_crea=
te
> >        drm/msm/A6xx: Enable preemption for A7xx targets
> >
> >   drivers/gpu/drm/msm/Makefile              |   1 +
> >   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |   3 +
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 339 +++++++++++++++++++++=
+-
> >   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> >   drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 441 +++++++++++++++++++++=
+++++++++
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
> >   drivers/gpu/drm/msm/msm_gpu.h             |   7 +
> >   drivers/gpu/drm/msm/msm_gpu_trace.h       |  28 ++
> >   drivers/gpu/drm/msm/msm_ringbuffer.h      |   8 +
> >   drivers/gpu/drm/msm/msm_submitqueue.c     |  10 +
> >   include/uapi/drm/msm_drm.h                |   5 +-
> >   11 files changed, 995 insertions(+), 16 deletions(-)
> > ---
> > base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> > change-id: 20240815-preemption-a750-t-fcee9a844b39
> >
> > Best regards,
>
> For what is worth, I've tested it on the SM8650 QRD with the Mesa 30544 M=
R & vkcube
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
>
> If you think of more tests to run, please tell me.
>
> Neil

Hi Neil,

I think it would help to test this on SM8550 and SM8450 too. I don't
have SM8450 to test with. Maybe also worth mentioning that there are
now vulkan CTS tests that try to test L1 preemption:
https://github.com/KhronosGroup/VK-GL-CTS/commit/7e0e4a000f34e748bb527b39f7=
30f78b595140b9
although it's not in a released version yet.

Connor

