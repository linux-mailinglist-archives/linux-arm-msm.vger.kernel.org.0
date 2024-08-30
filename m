Return-Path: <linux-arm-msm+bounces-30303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094896693E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 21:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C19B20915
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F1014E2D7;
	Fri, 30 Aug 2024 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC2fczw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3733CD1;
	Fri, 30 Aug 2024 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725044451; cv=none; b=WmMvUTypZeY7blSkB0Ra3sXrMwcCWRyv4eNV59L5kS8m4pCydYAjw4xhzM9swsETnzKaqRi4slHww4ML4f0oGmM1eq8qSiFtWu+21J2ne5ZF+aHFnYXl4qvRYRANnwMvvlTiCqhCNNrKYxJpvdpFsAJaRhzD/TowRzAv3VVx20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725044451; c=relaxed/simple;
	bh=s7W88PvdY/6775loK98Kr9xKb553tdvJ/HQpH8hUb1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocS9YsVwhtZWj1UNmn3MFSJO1/EEUY9IsDp3Mcoiheruiyywq0cFP2kBaeUIK4hhfgioBmcoiiJsC3Y651UIoP8ACn2rd94QrC/RYO2AtPbvpngnp0nMIMqaN8rac3KSz7818DkK+rHwy0zcpqzagkHwtN5zlAmbNwTnqKCMWP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC2fczw7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-45680233930so12487481cf.3;
        Fri, 30 Aug 2024 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725044449; x=1725649249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLPvj6w0gEc8mCFgVE5r9Jj0f3XZAzsMpKmYbHHmj8o=;
        b=nC2fczw7IxdnGtIDtxwc44xojWjNLN7K3cPEP2+80c8Q5UjOd0eSMOeF4XGgLpzsIP
         qKIuhgV11EMwoWJXu2FBV+4LizOfUQi0xj7r6A2Hn/dQlIJwYGQSdRGEFaV/OqqiBO4L
         WFamuUsJjnV84lT1wyR2xkJk6bb91910fWpxsK0b4E6aLFDefoFxgyUaWBL+yPz5vqSG
         gDgRpvRl/Eu7qaKMvX5ukYcGQnKNs4+jKvh2B9epLw3FJEf6r7PpTjqAuJmOiVuBYjc0
         oWcQiKXTGYe2Sun4lFusNDCOr/5IIIEJRbNbZQat28/IW7SeUtpB8GVMICTuMA5IykYj
         NWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725044449; x=1725649249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLPvj6w0gEc8mCFgVE5r9Jj0f3XZAzsMpKmYbHHmj8o=;
        b=ZEeZcoIvhturySO4wqIz1t1QpmYPouO6+AdTh9GJXxAgDso/sz7595tnEQzvHAQC4k
         Is400zm0Njv9xjAbO/EUuGS2cpc9Oc4FAdm5Z0Y/C+Ax98BfFy4ZeMNQp/11fu2Nw9t9
         EEf/oPLc5Sfb6EACz+SWap9PYNm3PiYvqt0i/GmCYoHA1cRhhONQ93nXzUy+YIbV/smT
         LEe1/XlanveFvXOUffrPHjEGvSc7CfTlFas+wlrVN8K2YeYbRLqV4nBz16cRSyPbaK4x
         IOLm2tzG8IWxfeFl1FJI8qKkQffcTBHUQYqkOIXyfuE5KMGVqlvZTL7TqMyiRd00DIVH
         h5XA==
X-Forwarded-Encrypted: i=1; AJvYcCUKnsfi5fwjhMJl3fS2ewSlu/BSTzB9dki+CBeuqI1b/uP7GvY784rHVUQUmfoeDsXPn/eg6BUaYlYx1qgy@vger.kernel.org, AJvYcCWECH/DP3w4HIDubt5eKGr2HEbFamBaHxmJADvteBN+fnVvR+gtvtYDGqrPmRqU7V2cq7PaSr0udu58H4wc@vger.kernel.org
X-Gm-Message-State: AOJu0YzPDYjWDIVyQNrxF7q5w+KWHkHLiJrCry8nKV3B8Wy3kPY3/fuU
	6fVWdmdqQZWY3OfACA29vyQtHcb5fraghs5k3aT2ZLl08jqN62SF9MfDCMYNZxAwcvqmSnfSW1t
	EgUJJYFnj6w4CzUu4as5SDm9ZiHyqog==
X-Google-Smtp-Source: AGHT+IG7BzqCJAFLYH5hdFShA8TVao8xjBCkuIovRv9X/O/I8VS/E8Amrg/M0L3DSdI4Dp1DxAl24sQ4SVRYqRn87y4=
X-Received: by 2002:a05:622a:4a14:b0:456:75c0:63ae with SMTP id
 d75a77b69052e-4567f6df3cemr90762171cf.54.1725044447385; Fri, 30 Aug 2024
 12:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com> <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
In-Reply-To: <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 12:00:34 -0700
Message-ID: <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> > >
> > > This patch implements preemption feature for A6xx targets, this allow=
s
> > > the GPU to switch to a higher priority ringbuffer if one is ready. A6=
XX
> > > hardware as such supports multiple levels of preemption granularities=
,
> > > ranging from coarse grained(ringbuffer level) to a more fine grained
> > > such as draw-call level or a bin boundary level preemption. This patc=
h
> > > enables the basic preemption level, with more fine grained preemption
> > > support to follow.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> > > ---
> > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++=
++++++++++
> > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > >
> >
> > [snip]
> >
> > > +
> > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > +               struct msm_gpu_submitqueue *queue)
> > > +{
> > > +       void *ptr;
> > > +
> > > +       /*
> > > +        * Create a per submitqueue buffer for the CP to save and res=
tore user
> > > +        * specific information such as the VPC streamout data.
> > > +        */
> > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RECORD=
_SIZE,
> > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queue->b=
o_iova);
> >
> > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeable)
> > by other proceess's userspace generated cmdstream.
> >
> > And a similar question for the scratch_bo..  I'd have to give some
> > thought to what sort of mischief could be had, but generall kernel
> > mappings that are not MAP_PRIV are a thing to be careful about.
> >
>
> It seems like the idea behind this is that it's supposed to be
> per-context. kgsl allocates it as part of the context, as part of the
> userspace address space, and then in order to know which user record
> to use when preempting, before each submit (although really it only
> needs to be done when setting the pagetable) it does a CP_MEM_WRITE of
> the user record address to a scratch buffer holding an array of the
> current user record for each ring. Then when preempting it reads the
> address for the next ring from the scratch buffer and sets it. I think
> we need to do that dance too.

Moving it into userspace's address space (vm) would be better.

I assume the preempt record is where state is saved/restored?  So
would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
after saving state but before restoring?

BR,
-R

> Connor
>
> > BR,
> > -R

