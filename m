Return-Path: <linux-arm-msm+bounces-26391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8439333DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 666D1B254AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60C413D533;
	Tue, 16 Jul 2024 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CscDRBJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55BE13B2B1;
	Tue, 16 Jul 2024 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166646; cv=none; b=nvFikns9W6+vfIJ7YTzMbgZUBpq65P1BriQ4lm74+AntSc5hBWZUp9DnARKquFyLsexdmtvDzkNwz4E+asT6PQ61/WU07VWeIPdRBfXt1xtjZ3HfdB8hwRZ0qHVJLqqbjgKdO7xvOciOFD6nNKBoI94Hg06G7hAxfQY6PMZOA3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166646; c=relaxed/simple;
	bh=oZaZ+J/VYA0QCa/BxGjFnOMiEGioSJlREk4V60Z0nI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fooc2yIpD4kZAvqlg01anqX5WX7JlnWrpwbnXw9TX6gUeBTQ1XvYO9fW6cLryi+S2NBskZ3/N/hslJUUV+w4OG433ZOaSKrVYzu5smXUXEx8D1TOZXMq87yyIfcxNiCcJ64giVz+GZy8HKRK91r6MHIe03kN/GhTKzKdO6kK+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CscDRBJ9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so7711242a12.3;
        Tue, 16 Jul 2024 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721166643; x=1721771443; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyXvBuWkFl7+fBJpGUNnFM5Z57w9S40Q8xfHQuAIhyY=;
        b=CscDRBJ9pfyDwZjX+kHgS6mTOumlT8O2qRRA9HBAUYevvUdBIW3XuaIiBAY1B2VX5A
         v0gipHpDjqWwhg4XzKS+4kvzPXFS8UqX4fGKJv4kWsh6N/cxvpITXfQWKiSWYJqky2Ud
         A8tJkWdMHu6GHc7bP3cPycGHZxllGazSs9kuEwFgP+mornTR3nt/uGLXcXx8/DyLtyO/
         aTUu78Y5umZiXmEnTKrObOgzoYvXEfet4a4gpbD3+yvwbl42w2tQ+pR2wr3D9ohroBjy
         rfTzxhjzyC7F1pYZo+1ApoiL4u9OTG+YSGKeXcwDKKiz3GByq7cqN/mWoctoEbphvZuQ
         IyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721166643; x=1721771443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyXvBuWkFl7+fBJpGUNnFM5Z57w9S40Q8xfHQuAIhyY=;
        b=VQapLKpO0StM/Om0cNJoU6I6vrgCG1DLmZ5qTyAZAXmNiJ74qcXcKMRiWtDGTyjjVK
         hEBfGudu1cwNZPBgNEqL8oUuzbTqDXNQU16jJdfKrh2GYTZnM2rNWey7WlkCv3NbjEYk
         eZ7uQ9d6DqIO0y/DLWdTz/1/V996vWA6kVaSqJPVwD2KiCdDUj6yEJA234BrjoRi/uCY
         wT9QsCQCS5QL5vdqEfcVY8tHclca0UntFGmT/BjUjY4CqYpRf6bKrmivusW1lKy3S7Xc
         XpX6EfAUQdQeoIe5ZYOCz513euWZhwCWnLegS8RyUiG9owMvkhNVcJ5BG9z2bWCkTRJn
         KlNA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lKUP5TqQyLYk4l3W09FjssKFERevk2ic7f3BGIrxFKqdUxg4Cbti9LxwGRnS3IEXLFhGphrM7EsycrDMZe8vrqOwOB/ey70Cv6MM8Ihk7fLYE2OoHKCcu8oh2k8rWWWGW5at57kf6psh3g==
X-Gm-Message-State: AOJu0YwxmYanK402hVt6iDvej/LJxs9Vwei5CeNbFXyiZPZDVydno3Ss
	AZgTbHSv5MdDJl4eFhVJhGdSjJrHDpTC80FWhog29IZrk+Fj3mbGiafFvoEap6+ZkRNnptIgI7Z
	J/1whoeVS0xjTGG8s6j5LE5wPY3I=
X-Google-Smtp-Source: AGHT+IGOSFeYk5lokiAb+SUTHo13Ke4nMwkSdDmfplMaIf2MiIKKsehlw3Da3JwlhmTGBLrNwWhX77liKSLSBtoAOaw=
X-Received: by 2002:a05:6402:5106:b0:57c:5eed:4ebf with SMTP id
 4fb4d7f45d1cf-59eeec2c4f1mr2945406a12.19.1721166642931; Tue, 16 Jul 2024
 14:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com> <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com> <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
In-Reply-To: <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 16 Jul 2024 14:50:30 -0700
Message-ID: <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 2:45=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicin=
c.com> wrote:
>
>
>
> On 7/15/2024 12:51 PM, Rob Clark wrote:
> > On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> >>> There is no recovery mechanism in place yet to recover from mmu
> >>> faults for DPU. We can only prevent the faults by making sure there
> >>> is no misconfiguration.
> >>>
> >>> Rate-limit the snapshot capture for mmu faults to once per
> >>> msm_kms_init_aspace() as that should be sufficient to capture
> >>> the snapshot for debugging otherwise there will be a lot of
> >>> dpu snapshots getting captured for the same fault which is
> >>> redundant and also might affect capturing even one snapshot
> >>> accurately.
> >>
> >> Please squash this into the first patch. There is no need to add code
> >> with a known defficiency.
> >>
> >> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> >
> > So, in some ways devcoredump is ratelimited by userspace needing to
> > clear an existing devcore..
> >
>
> Yes, a new devcoredump device will not be created until the previous one
> is consumed or times out but here I am trying to limit even the DPU
> snapshot capture because DPU register space is really huge and the rate
> at which smmu faults occur is quite fast that its causing instability
> while snapshots are being captured.
>
> > What I'd suggest would be more useful is to limit the devcores to once
> > per atomic update, ie. if display state hasn't changed, maybe an
> > additional devcore isn't useful
> >
> > BR,
> > -R
> >
>
> By display state change, do you mean like the checks we have in
> drm_atomic_crtc_needs_modeset()?
>
> OR do you mean we need to cache the previous (currently picked up by hw)
> state and trigger a new devcores if the new state is different by
> comparing more things?
>
> This will help to reduce the snapshots to unique frame updates but I do
> not think it will reduce the rate enough for the case where DPU did not
> recover from the previous fault.

I was thinking the easy thing, of just resetting the counter in
msm_atomic_commit_tail().. I suppose we could be clever filter out
updates that only change scanout address.  Or hash the atomic state
and only generate devcoredumps for unique states.  But I'm not sure
how over-complicated we should make this.

BR,
-R

>
> >>
> >>>
> >>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
> >>>   drivers/gpu/drm/msm/msm_kms.h | 3 +++
> >>>   2 files changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_=
kms.c
> >>> index d5d3117259cf..90a333920c01 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.c
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.c
> >>> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsi=
gned long iova, int flags, void
> >>>   {
> >>>        struct msm_kms *kms =3D arg;
> >>>
> >>> -     msm_disp_snapshot_state(kms->dev);
> >>> +     if (!kms->fault_snapshot_capture) {
> >>> +             msm_disp_snapshot_state(kms->dev);
> >>> +             kms->fault_snapshot_capture++;
> >>
> >> When is it decremented?
> >>
> >>> +     }
> >>>
> >>>        return -ENOSYS;
> >>>   }
> >>> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace=
(struct drm_device *dev)
> >>>                mmu->funcs->destroy(mmu);
> >>>        }
> >>>
> >>> +     kms->fault_snapshot_capture =3D 0;
> >>>        msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_hand=
ler);
> >>>
> >>>        return aspace;
> >>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_=
kms.h
> >>> index 1e0c54de3716..240b39e60828 100644
> >>> --- a/drivers/gpu/drm/msm/msm_kms.h
> >>> +++ b/drivers/gpu/drm/msm/msm_kms.h
> >>> @@ -134,6 +134,9 @@ struct msm_kms {
> >>>        int irq;
> >>>        bool irq_requested;
> >>>
> >>> +     /* rate limit the snapshot capture to once per attach */
> >>> +     int fault_snapshot_capture;
> >>> +
> >>>        /* mapper-id used to request GEM buffer mapped for scanout: */
> >>>        struct msm_gem_address_space *aspace;
> >>>
> >>> --
> >>> 2.44.0
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry

