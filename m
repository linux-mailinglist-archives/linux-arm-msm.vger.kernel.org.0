Return-Path: <linux-arm-msm+bounces-30309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA2966A54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 22:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8892820BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 20:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322191BF32B;
	Fri, 30 Aug 2024 20:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7YJx/Md"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A11BDAA8;
	Fri, 30 Aug 2024 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725049176; cv=none; b=eJR9QlTihaAZD1htz5R/63QsR4gdGAEWlkSeDkgw4RtCfI5x6ll51+4ptuGchBduGAnuVasSS71zrcybQS+NqlquDYul3GIAE5fAANXosINBOr9azvtyPo7WXnPW8zOz5Vn4XB9+HpS3WtpKk745FKFKOvCik+edgnjNNt+HdX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725049176; c=relaxed/simple;
	bh=CA/8qwLC1gx9titJsX+DLlyoihYXtx4lY2lxiaQFbYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYJ/t8rY2kCCVkWGhKnexa1F0XgetClFPgLIxgkVEgjfMwcFJcA2vV0v983Vsu0Vy1eNkiGvYZVAGdEZY/gsdv7QTo+i9HWgKH5qdqZ1JNCMOOMmJq8/HT26wc7v2u54J67RBjeJd57SZg2uLQ+TWlPbXPaRoywoOXjgXLsKfuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7YJx/Md; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4567f52bf69so12698281cf.0;
        Fri, 30 Aug 2024 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725049173; x=1725653973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XF2CCk23AXoNXAR3JERc7dhnx9x0OQne16QxjEFvAk=;
        b=X7YJx/MdyZ1Qw6iua1KWQ3rok/0vOVUDn5sXh81a8yC+GeUnyVDP+Dg40HblKCeJ8t
         pVUPcWB6p9XrcBLmiZTcKUXyiZRWV1Dt9ISnJ1O96j0czBcZfqaCaxhhNGgrSMzhvpZa
         wvazlnJBfyPjIoVXIZIRqXtEmGslb0WczdtrbNM4bDJSOLnG1cftZkIwNvCY7J/EDDp0
         T6yRMz+Z2FMWoH+c6IQCHxf07d+o5Sy8DxgWC6daratg3OgrkrHUSISRzN6rAvIBgjls
         Xlpa1VEO5prkEcxz1R0k+GybiFE8qR/AIv8NLI1veBVNJarujuM7Bj6XQbuNLbnHGxT6
         zJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725049173; x=1725653973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XF2CCk23AXoNXAR3JERc7dhnx9x0OQne16QxjEFvAk=;
        b=NHlQBLOB6gMehsg1bxRKCtpzufnQtUTK7o2vyDZ60Vn/zaw+6w+Gb7Gadsy3IeMV6s
         28qfwnAWnWyNGuzg9Xoroi2F9ARri4IyYQh8dwbrTsiLQbHg7baVwW8EeVNSBq6NtIns
         ZxMvgrpioA8AfhjXjZiX2/owRkHVkvvafiYtrgVC5LHHEo8qdFzYUVwtzeS3FFhyZ+3a
         r6W2AIyybrFUlLsMTZFeDlgxzcGY7WM/S4aKmw25vCya2PcEwL2bxK+oiYYJdum0pUtP
         r42fbD2H7CW5YNL4HcqXTsFImdSidGA2lEXFfh90yPv86Au76jLOIcUvmqxmfZ92ojTJ
         kTIA==
X-Forwarded-Encrypted: i=1; AJvYcCUSbhC+CZvY8cWR2CA6sqt2tpAoyBNr2nc9xufqPLNa6LovA9RXoo8SRB811FXrs6eA0MWWs/eiAnyrdkmb@vger.kernel.org, AJvYcCXmAMrSDl/hL+uqF1kNn879QNwKwXc+vOKSPjQTt9S5WecWWGVw3VDDyp4WSqfBta3YVcvNmCIq4cQmwXK5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GhYTrZi748U/uuB3mXdXSF0S3xa+vY9NgUIaosk19lVRMn+H
	+euOc+TYjrrc0eSARJ2aTulXRw8AvAdv9SRsDTSOFADsV/AKRzARbFePg/0PWQ+2rfCOHRp75IC
	AyKf93G5MLbjl7ZaWuZ+VA1roIEA=
X-Google-Smtp-Source: AGHT+IEbVq+/79QI8yiA1p0TDT2cuUCFuQUZF7ZEmD+/cAnli7i1ZZyhRnvuKVZ0QWlKpg7d3md068N+yPyRH4s8AN8=
X-Received: by 2002:a05:622a:1f06:b0:44f:f14c:6a63 with SMTP id
 d75a77b69052e-4574e7e9540mr5395701cf.11.1725049173223; Fri, 30 Aug 2024
 13:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com> <CAF6AEGtxCnoyrEHPknV7C9XO3OcTpSOmGq-j2K7UDKXF1j0ssA@mail.gmail.com>
 <CACu1E7FC_gPXHm4g7f0iv551orxfh=V_sJF47=6TC+nWdMyTMg@mail.gmail.com>
 <CAF6AEGvkds04G1XzVr8433S1Za_xZZSkmrWNaH-gUw6cH+cSUw@mail.gmail.com> <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
In-Reply-To: <CACu1E7HC_u0WZ5ayXhm3z-Q5Do7tnwQLGdJ5feD99aOB52H1ug@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:19:19 -0700
Message-ID: <CAF6AEGve5AiOujFUjnwhaXwu6VDU0rLBfDzSJn66+h12dG1haA@mail.gmail.com>
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

On Fri, Aug 30, 2024 at 12:09=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com=
> wrote:
>
> On Fri, Aug 30, 2024 at 8:00=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Fri, Aug 30, 2024 at 11:54=E2=80=AFAM Connor Abbott <cwabbott0@gmail=
.com> wrote:
> > >
> > > On Fri, Aug 30, 2024 at 7:08=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
> > > > <antomani103@gmail.com> wrote:
> > > > >
> > > > > This patch implements preemption feature for A6xx targets, this a=
llows
> > > > > the GPU to switch to a higher priority ringbuffer if one is ready=
. A6XX
> > > > > hardware as such supports multiple levels of preemption granulari=
ties,
> > > > > ranging from coarse grained(ringbuffer level) to a more fine grai=
ned
> > > > > such as draw-call level or a bin boundary level preemption. This =
patch
> > > > > enables the basic preemption level, with more fine grained preemp=
tion
> > > > > support to follow.
> > > > >
> > > > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > > > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > > > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650=
-QRD
> > > > > ---
> > > > >  drivers/gpu/drm/msm/Makefile              |   1 +
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 ++++++++++++++++=
+++++-
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
> > > > >  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++=
++++++++++++++
> > > > >  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
> > > > >  5 files changed, 921 insertions(+), 9 deletions(-)
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +int a6xx_preempt_submitqueue_setup(struct msm_gpu *gpu,
> > > > > +               struct msm_gpu_submitqueue *queue)
> > > > > +{
> > > > > +       void *ptr;
> > > > > +
> > > > > +       /*
> > > > > +        * Create a per submitqueue buffer for the CP to save and=
 restore user
> > > > > +        * specific information such as the VPC streamout data.
> > > > > +        */
> > > > > +       ptr =3D msm_gem_kernel_new(gpu->dev, A6XX_PREEMPT_USER_RE=
CORD_SIZE,
> > > > > +                       MSM_BO_WC, gpu->aspace, &queue->bo, &queu=
e->bo_iova);
> > > >
> > > > Can this be MSM_BO_MAP_PRIV?  Otherwise it is visible (and writeabl=
e)
> > > > by other proceess's userspace generated cmdstream.
> > > >
> > > > And a similar question for the scratch_bo..  I'd have to give some
> > > > thought to what sort of mischief could be had, but generall kernel
> > > > mappings that are not MAP_PRIV are a thing to be careful about.
> > > >
> > >
> > > It seems like the idea behind this is that it's supposed to be
> > > per-context. kgsl allocates it as part of the context, as part of the
> > > userspace address space, and then in order to know which user record
> > > to use when preempting, before each submit (although really it only
> > > needs to be done when setting the pagetable) it does a CP_MEM_WRITE o=
f
> > > the user record address to a scratch buffer holding an array of the
> > > current user record for each ring. Then when preempting it reads the
> > > address for the next ring from the scratch buffer and sets it. I thin=
k
> > > we need to do that dance too.
> >
> > Moving it into userspace's address space (vm) would be better.
> >
> > I assume the preempt record is where state is saved/restored?  So
> > would need to be in kernel aspace/vm?  Or is the fw changing ttbr0
> > after saving state but before restoring?
> >
> > BR,
> > -R
>
> The preempt record is split into a number of pieces, each with their
> own address. One of those pieces is the SMMU record with ttbr0 and
> other SMMU things. Another piece is the "private" context record with
> sensitive things like RB address/rptr/wptr, although actually the bulk
> of the registers are saved here. Then the user or "non-private" record
> is its own piece, which is presumably saved before switching ttbr0 and
> restored after the SMMU record is restored and ttbr0 is switched.
>

Ok, and all these are offsets in the preempt record.. but that part is
allocated with MAP_PRIV, so that part should be ok.

Why is the VPC streamout state handled differently?

BR,
-R

