Return-Path: <linux-arm-msm+bounces-31342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FD971CE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 16:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BC43B21AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 14:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168E51BAEE7;
	Mon,  9 Sep 2024 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e811aRvq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673071BAEE0;
	Mon,  9 Sep 2024 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892822; cv=none; b=pA0FnQVwezSiHUSUoEaGjR6DBMV5gkDyPmPmCNwMnfvSnd5z9G8L36V4vqH01LveVDLOPjYpmZs5N8bd7nRE51Ujotgt/PiQsGBhuTnFRiHseJKt++lZYOO0pgMXLX2ZVJfxdG98Cfy7fTwRSizq9kHRc/Ovc278D8pt4fDzVQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892822; c=relaxed/simple;
	bh=Jc+ZsSx86eZg9sUzrN9bm8FO1FtzH3dV9nqloyRxL7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RuZz9epid71T2tek6lAhXZ64V7MFVI2t4hx7rlIMKqrHMF179Mqf3/+eG7hwBFSp01rtBCaWUmwMZ3cSH5bTjbGzXFNYRGHFwqMFrpG+517qXpNbsg/ktL2wXIh1jR9mMBqt9UPjYQwF1Anrg808zsq8zd0QSRg+u/ZTWD+yE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e811aRvq; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-82ade877fbeso87552539f.0;
        Mon, 09 Sep 2024 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725892819; x=1726497619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yADGgFh0Qr9khviAqSL4T0j/ayR5ihAosN0nFeWJtFw=;
        b=e811aRvqFQ8cLujjZjd/rCaZL4xPeseRISEj6++0WfqLJl7LKhMX5ndMmZXI9cGnLp
         S/ITxGYj56RIYmY0PU/dla1oySpIpVnlPwK2UrgLjw0a9PQ7Mn73hRrH4zBF0/4G1Y9C
         7EuXPcXGqFEo1WVF7JxbQ7N54i2hUK4U41RnLOJR2N3i8G0MZR9Jjz/guw7yUbd7ARwU
         YMacT+XKN61stEMv3qzcZ0LOiYcMCjBeH4JDGepKmUtHG0JAqBgeUWZBHHbFjTEf2Bgz
         SO6858VXXgXaVG//kWas0p2UIxbtIW5NPZHGpkfh5s4KIAaF8TXjIlYvTe0sJf34HxOh
         uxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725892819; x=1726497619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yADGgFh0Qr9khviAqSL4T0j/ayR5ihAosN0nFeWJtFw=;
        b=f5PmAm1cBngFv/0G0SMe/KXB40lbnI2mmcqXlwqM1RPGV4/NiuqxEXg+BpYfGKN6tT
         4kUaXA3TpA4Jcs8s8KmpDj+1K6iGWAAWzKEnFpl4o89dg4TmXFH6ocn5+N6Ao+yXJvTe
         /EJWK1o0FF3LFEljrahHMJBke95Z5gBaHRnhrN0lGJWnEI+emgzRxftaQ3iizxoa31Mf
         immdw5h8AR39bkoOfXnN7iftr9q+29R69kfxk+00upSjlD6BeW/1Qd/cHmLDy5hqXfac
         COMm5kSK59co+0wQinOPv7fNsNw1RF831jUezj9uWtVK6QkLYibol1tAQ2GAx+LrvKhT
         ig7w==
X-Forwarded-Encrypted: i=1; AJvYcCVBu/YFzYIqvGmTl265kGx/ucNUZjK8Nabt9Mw+/SFD6pp6/vnXNpS2LwcUKkubApsHPeRfsp1vTtUWyk4w@vger.kernel.org, AJvYcCVlNB6Z9GQoXNQ/oiosVrEx4bGeGos9lsoLQFkJ9YHFOeH3K7tlWkYn36x58X9qGjXdslFC7fhxzwWRdPFA@vger.kernel.org, AJvYcCWBQRRVGoRSl47mZfxOag7fqif3NlKfzqwFNEkTEP8S0JHgYJO+vm8WXTLnTc7+tG0n99bFgBrpUbYq@vger.kernel.org
X-Gm-Message-State: AOJu0YzTD0r78y0s3bo5lrhLrlAOpSIt/OWrEuLDVFzfwEr3Q58CIqBd
	RPpyxB11AkL31uKOlVZX/l4x1QRrKlTUB/Z4TIjonAEPsWeizNuVS/LjlEd78eSNL0Yuz+CNsnO
	3GnB3Ji1wnyeXRtWg7UtsnK5EG8A=
X-Google-Smtp-Source: AGHT+IG/zidy3pUha3J4vBn+TgE6JlPVQqsYOcZPn1/PZgtYteEn9j/NJ/+ZfxxiFMsg3wdTfHQX1c5/CxyHbAkt+Ic=
X-Received: by 2002:a05:6e02:1d06:b0:3a0:4a63:e7ac with SMTP id
 e9e14a558f8ab-3a04f0ccccfmr140661735ab.18.1725892819444; Mon, 09 Sep 2024
 07:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
 <20240905-preemption-a750-t-v3-4-fd947699f7bc@gmail.com> <20240906195444.owz4eralirekr7r7@hu-akhilpo-hyd.qualcomm.com>
 <df85bf24-651c-4a35-929b-4de6c05555a1@gmail.com> <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
In-Reply-To: <CACu1E7GSMQHa6258hV2OwS5nTGh+kTeZ-qQPMfGTy5YVP5kX3g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Sep 2024 07:40:07 -0700
Message-ID: <CAF6AEGvv60CS43dCijsUCzELLn=t1PJQVCzMx01cFJsNJ1Uk9g@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] drm/msm/A6xx: Implement preemption for A7XX targets
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
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

On Mon, Sep 9, 2024 at 6:43=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com> =
wrote:
>
> On Mon, Sep 9, 2024 at 2:15=E2=80=AFPM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > On 9/6/24 9:54 PM, Akhil P Oommen wrote:
> > > On Thu, Sep 05, 2024 at 04:51:22PM +0200, Antonino Maniscalco wrote:
> > >> This patch implements preemption feature for A6xx targets, this allo=
ws
> > >> the GPU to switch to a higher priority ringbuffer if one is ready. A=
6XX
> > >> hardware as such supports multiple levels of preemption granularitie=
s,
> > >> ranging from coarse grained(ringbuffer level) to a more fine grained
> > >> such as draw-call level or a bin boundary level preemption. This pat=
ch
> > >> enables the basic preemption level, with more fine grained preemptio=
n
> > >> support to follow.
> > >>
> > >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QR=
D
> > >> ---
> > >>   drivers/gpu/drm/msm/Makefile              |   1 +
> > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 293 ++++++++++++++++++=
+++-
> > >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 161 ++++++++++++
> > ...
> > >
> > > we can use the lighter smp variant here.
> > >
> > >> +
> > >> +            if (a6xx_gpu->cur_ring =3D=3D ring)
> > >> +                    gpu_write(gpu, REG_A6XX_CP_RB_WPTR, wptr);
> > >> +            else
> > >> +                    ring->skip_inline_wptr =3D true;
> > >> +    } else {
> > >> +            ring->skip_inline_wptr =3D true;
> > >> +    }
> > >> +
> > >> +    spin_unlock_irqrestore(&ring->preempt_lock, flags);
> > >>   }
> > >>
> > >>   static void get_stats_counter(struct msm_ringbuffer *ring, u32 cou=
nter,
> > >> @@ -138,12 +231,14 @@ static void a6xx_set_pagetable(struct a6xx_gpu=
 *a6xx_gpu,
> > >
> > > set_pagetable checks "cur_ctx_seqno" to see if pt switch is needed or
> > > not. This is currently not tracked separately for each ring. Can you
> > > please check that?
> >
> > I totally missed that. Thanks for catching it!
> >
> > >
> > > I wonder why that didn't cause any gpu errors in testing. Not sure if=
 I
> > > am missing something.
> > >
> >
> > I think this is because, so long as a single context doesn't submit to
> > two different rings with differenr priorities, we will only be incorrec=
t
> > in the sense that we emit more page table switches than necessary and
> > never less. However untrusted userspace could create a context that
> > submits to two different rings and that would lead to execution in the
> > wrong context so we must fix this.
>
> FWIW, in Mesa in the future we may want to expose multiple Vulkan
> queues per device. Then this would definitely blow up.

This will actually be required by future android versions, with the
switch to vk hwui backend (because apparently locking is hard, the
solution was to use different queue's for different threads)

https://gitlab.freedesktop.org/mesa/mesa/-/issues/11326

BR,
-R

