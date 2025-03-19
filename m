Return-Path: <linux-arm-msm+bounces-52032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50BA69ADE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 22:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA933AB1F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 21:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E001FF7DD;
	Wed, 19 Mar 2025 21:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4ZvwHe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC9158538;
	Wed, 19 Mar 2025 21:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419917; cv=none; b=rVsx+HkbxZMAZzGBhQH1wIvVDUgHV2fD2daSG617vsnyXzb8LdEXPAFqmNRedHvs/x434a++tCnXidlFLKQhAVLQh1Ok4pRHWdshOuYvRxsUuwmSb/Plv2NTvZS4pNw3mxAkUM5lSzkQ9mQLtntdfdkvdhDVstY4hjSfn5gHkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419917; c=relaxed/simple;
	bh=Wtc0/2DFHQ47q4fY+ozaPApJEHtqOC8tCA6mJYVsfOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBtaUGOfPpYaO3WcjKsQr/wAR/UHxGxp0JKCWvWJr17hh7zo0aVTTbGQ2v1oGOaecQQfe40jjqtCHXyKUGloH/06b+CzKKldw6wuBnCODKUzjJwyZ9JjeqQnBPzpTKSIwECeojFsFbcYgEkzQzGp/9gvP0KYN2yap1qeW9MTWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4ZvwHe8; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso801605ab.1;
        Wed, 19 Mar 2025 14:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742419915; x=1743024715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGXYnVlo4fA0RFIIo/kNFkQOG0FR1x2vD9pp9kcKWLQ=;
        b=l4ZvwHe8/5mHvrtz2lT4VEcVmVETFWyAxWAmJ3RnAiqq0vRu6Ttx3ZYGXzGGpzB03U
         tRPsVSCkjmjmrkSguHvR6FNpi7gdxO7IxrBvb5rEH3JKH4sXMucT9KGQHu/7qFHdkRTM
         cbZ3UJAO0IwZ2m5w2WYKK20kdDpvyA9x+XsPJaRO3OWS1pXvI0vQiuVnvC+1KlGo01Lo
         w/8r7uwUhFsQTClGy49f2IG3FYAHSabQZ6+6jsZ4GXXP6BqxLUPWy+3Kj8+YVubphl8D
         hjEy3FEWCG7FcZ0bXAh38vnpiJNYjGCZqt23SEGH8V0bkeiHA0Idr1RDTJhFYenB8vS9
         zKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419915; x=1743024715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGXYnVlo4fA0RFIIo/kNFkQOG0FR1x2vD9pp9kcKWLQ=;
        b=qA4qVXeAzT/YiKOs1kMHYhrNOhthT04V3/9VmAdJ223yZ7EHIdGcI3E3oDt2kQoGZn
         vplXEkjiKzyLU5LkDMg8xAF3zODgbjG8CEG2F4VoElRT5GakVdWH8nHR543SVbx2MQwb
         YE2UFD7UuVQQHZVj9KaScs2T6u527zQC8AVDpA+vRpwziWLBrG+eW5TuGsadqfqfidEN
         9xRYaJsyxUHyK2FxVp54sFz47bgjwmMxr6DSxnUcKq0KXollv+zW4+kcrkmmP6y8Q9u6
         CXb4NU9L6A216Y3dY1OFJFp3ZcDie2hIL4sYSK9EZB9DBjjMx42gF4VLI+v0gCRxnPGB
         wPVA==
X-Forwarded-Encrypted: i=1; AJvYcCVrvFsYxvuddYB2YxYc64Lk8pOdjg0V5hMaTHYtE7jKEQojTvHjjvc8oFWwYPa6LwMg7yh9a5a3qBpeSVM7@vger.kernel.org, AJvYcCXlIfJW6pha04X6xvXaoz+KXxQVT6mNVkKe+eX9IRsROi+LpHeiEYRKtv6B87RrRjxYWjEqI6NSbCSdWMsl@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX7z2m+RxlKmJJ/JOkpM4AKFWZWWhXkTCJ9HFw8LOAJiczoNL
	h7WHjpty7JBLnFOHpx2ljmv1ZqoKsHok6MgfhxSASCFH9TbpaJXmVMv8lCoM5RifmfVqwpiNDG7
	BsOOJ8sGA1V/dVdQmbLeaBi8h3zo=
X-Gm-Gg: ASbGncvtTvWDv/pVXP8RSafAEKC3iysVtdvvptgHClIV6Dfhhki99aCBao8IKvEoEnG
	PZW2WJ2RCpdj6i/p6ehvEWi9oFiIf64yiuV/EubsuPRu9Pcses4fgADXEy9EgUvzFWHxtu0ooCE
	4Jww83LMY2Xz3qN+UnKCc8r4GNp3QHm5f/Pn0+rwdp3vWkGtG883ew/fW9T+suSm/HYsMdHJg=
X-Google-Smtp-Source: AGHT+IG6eJdQijicuz0JhXeewGnZhBud8RVqN+j9v9xBQdOBT2axAWMn8vRd7OQcpT6RTCan1DoKTU3vvrEEu2tAwIQ=
X-Received: by 2002:a05:6e02:1a47:b0:3d3:ff09:432c with SMTP id
 e9e14a558f8ab-3d586b24451mr38482965ab.4.1742419915226; Wed, 19 Mar 2025
 14:31:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319145425.51935-1-robdclark@gmail.com> <20250319145425.51935-17-robdclark@gmail.com>
 <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
In-Reply-To: <CACu1E7FduhsXY22BKpjt5WcnAcVtGu01eUiLc9T47OUR+yp_0Q@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 19 Mar 2025 14:31:43 -0700
X-Gm-Features: AQ5f1JoLQDinqTeGHJh8TxkwUkgoOW697Nl89kftPZ83P_IL6WWPoVNwetQQV1s
Message-ID: <CAF6AEGvkKhx2JLpNsDgYigX41QhbhXt4VvSP9n-QmO=cAvTxHw@mail.gmail.com>
Subject: Re: [PATCH v2 16/34] drm/msm: Mark VM as unusable on faults
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Konrad Dybcio <konradybcio@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 9:15=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Wed, Mar 19, 2025 at 10:55=E2=80=AFAM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If userspace has opted-in to VM_BIND, then GPU faults and VM_BIND error=
s
> > will mark the VM as unusable.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.h        | 17 +++++++++++++++++
> >  drivers/gpu/drm/msm/msm_gem_submit.c |  3 +++
> >  drivers/gpu/drm/msm/msm_gpu.c        | 16 ++++++++++++++--
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index acb976722580..7cb720137548 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -82,6 +82,23 @@ struct msm_gem_vm {
> >
> >         /** @managed: is this a kernel managed VM? */
> >         bool managed;
> > +
> > +       /**
> > +        * @unusable: True if the VM has turned unusable because someth=
ing
> > +        * bad happened during an asynchronous request.
> > +        *
> > +        * We don't try to recover from such failures, because this imp=
lies
> > +        * informing userspace about the specific operation that failed=
, and
> > +        * hoping the userspace driver can replay things from there. Th=
is all
> > +        * sounds very complicated for little gain.
> > +        *
> > +        * Instead, we should just flag the VM as unusable, and fail an=
y
> > +        * further request targeting this VM.
> > +        *
> > +        * As an analogy, this would be mapped to a VK_ERROR_DEVICE_LOS=
T
> > +        * situation, where the logical device needs to be re-created.
> > +        */
> > +       bool unusable;
> >  };
> >  #define to_msm_vm(x) container_of(x, struct msm_gem_vm, base)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index 9731ad7993cf..9cef308a0ad1 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -668,6 +668,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >         if (args->pad)
> >                 return -EINVAL;
> >
> > +       if (to_msm_vm(ctx->vm)->unusable)
> > +               return UERR(EPIPE, dev, "context is unusable");
> > +
> >         /* for now, we just have 3d pipe.. eventually this would need t=
o
> >          * be more clever to dispatch to appropriate gpu module:
> >          */
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index 503e4dcc5a6f..4831f4e42fd9 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -386,8 +386,20 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >
> >         /* Increment the fault counts */
> >         submit->queue->faults++;
> > -       if (submit->vm)
> > -               to_msm_vm(submit->vm)->faults++;
> > +       if (submit->vm) {
> > +               struct msm_gem_vm *vm =3D to_msm_vm(submit->vm);
> > +
> > +               vm->faults++;
> > +
> > +               /*
> > +                * If userspace has opted-in to VM_BIND (and therefore =
userspace
> > +                * management of the VM), faults mark the VM as unusuab=
le.  This
> > +                * matches vulkan expectations (vulkan is the main targ=
et for
> > +                * VM_BIND)
>
> The bit about this matching Vulkan expectations isn't exactly true.
> Some Vulkan implementations do do this, but many will also just ignore
> the fault and try to continue going, and the spec allows either. It's
> a choice that we're making.

As mentioned on IRC, this is actually about GPU hangs rather then smmu
faults.   I guess the $subject is a bit misleading.

BR,
-R

> Connor
>
> > +                */
> > +               if (!vm->managed)
> > +                       vm->unusable =3D true;
> > +       }
> >
> >         get_comm_cmdline(submit, &comm, &cmd);
> >
> > --
> > 2.48.1
> >

