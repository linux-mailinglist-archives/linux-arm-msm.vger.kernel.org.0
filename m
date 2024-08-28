Return-Path: <linux-arm-msm+bounces-29777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A79628FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C12951C20977
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8212D187859;
	Wed, 28 Aug 2024 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibpr/7kI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB5D1EA65;
	Wed, 28 Aug 2024 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852596; cv=none; b=eugc+Kal8ZwreYy9W69PdZNmdp3R006/K+72UvWUeYQK2VmKtUiYCjaZDl2agzRMUBJHww4YcQztiXliVM+y8c3XZk9OHL+ocuAnWjacyfEwxslkRV1LJAO4SFf6EFWVGMvWvTs2exxkijUrDJIttRd0dLTCkrS82hzgnZxaL8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852596; c=relaxed/simple;
	bh=kF3HRqfj0eusvJuybUvGSzxnY9d8HWcoM0VIif9IBJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3D0XVeAeYwuHuvrKDxExrqGJT8OZMFQHuzs8CFuF4CEgp8RuXVd8Fxt6XUvIHcsgTIh3YvG3sMEZSJKdwsov/IjsAk21RiVcyIgBeBDtI5HA6nBJcFhf1HTKR5yuZczJqdBi41NXH40thvr/db6FOKqowEkP9xrvIMb857qhlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibpr/7kI; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86b64ebd8aso283708166b.1;
        Wed, 28 Aug 2024 06:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724852593; x=1725457393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pEqZjPIkfOrpkl6p6w9n8vu/E0lE1rdjJmvNSljER0=;
        b=Ibpr/7kIetBGxKgyQx4zmFxmtWUVhSyiETIJZJkChiMGxJf8obmkcpi9QX32Ewb9DJ
         Qv+pLy5e7DyiB1T3jmY7hUlmirsBcVCAsgJtpLNvJNeIy+P5+f+CFQRYM4LMjkkLv6/R
         Qzo10gN9RNtPU/ugdJ8/tXiVjZOGa9dWZ2ifjGeqsCH+AtgJOejIeQUEG4dvic+qSj0i
         9jZgy6NeECjfG8sNhFm+HoS9tUZtLW9prKE4LWvKFGEvyh9IdMEO4yETqvXkMzjOwe62
         ngwlURaeqCJoFTqhFfKYeF5KY9iXtv5cff33xCDpVee2McYXW32WnUwMZwxjFd5Rk2p8
         vWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724852593; x=1725457393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pEqZjPIkfOrpkl6p6w9n8vu/E0lE1rdjJmvNSljER0=;
        b=CM6Qkjs3TvQHovFT6tsEmKfygg7kd5PNMfITd95IofPKRH5evxb2vaD4QyBUoxDozw
         RSzbi/Y0leCN4PQkNXd12hbqvpqBABOLvgZfLZ2sedA3JR0euAl3dnAOsR2KkbJyAou6
         a/FASowZ5ShuvXeI+50Ilddg6G0YYUrdl1pI8CYOhMQKIVVc5mkvK6t1IasiNRg1O1Jo
         m1TiNFRSKP03SylsYTm3wMqNGtQ/dQ4du6M3oD+sH+PlTDkXidY2CpUYYQncEyAwwVYp
         t113NKtH3Bvgx6eGhmd7gRU4ZRAzIt1dZ8MMuKkZaN68bsBkAT4sUoe7I+SdEreMlu83
         mLQA==
X-Forwarded-Encrypted: i=1; AJvYcCUkBmxKvk/+UfgduxM+jENK+fdCeQfte0BkrUcrLC7FLZT3hvt0rjIVAsQItdiVzqaIOeMX/+u2SnspPbpn@vger.kernel.org, AJvYcCWWcxuu05pVdfIxKMssmMTqpP9dFn000zOb7SYhxzj3iGl4d7PBigpDoiKEvpvUvuF+L7ezbeaiYQMvOoHL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5wb5/Q1f7zrzNlg1x7MPHiCRmECu4oWAl18sVmqDpWmN4gFTl
	YzDSQfZTFE2/KMGhV21waKc1kYzPgdi2+EK8+TqIdQ1EkAoXscG4mw61+vmykiOluhX/T5FTIOb
	byqg7M3cX42rg4gAYZdbiPDfYbeY=
X-Google-Smtp-Source: AGHT+IF2LPaReCgiSF2wFWIOBSNIVsBhtFt72m4yvlauwvxjZPteZ9QiL/jsA4kYTxq7xW1WENObJdlA9yG8gXzfDdY=
X-Received: by 2002:a05:6402:3509:b0:5c0:c65f:819e with SMTP id
 4fb4d7f45d1cf-5c0c65f8230mr4586507a12.9.1724852592106; Wed, 28 Aug 2024
 06:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815-preemption-a750-t-v1-0-7bda26c34037@gmail.com>
 <20240815-preemption-a750-t-v1-4-7bda26c34037@gmail.com> <20240819200837.etzn7oaoamnceigr@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7E7FPJP-Ry64m257A7WrL3Q9jy8xMS9XpSBRNimBWzYUQ@mail.gmail.com>
 <20240822200534.fgugb3zmcp7hjyck@hu-akhilpo-hyd.qualcomm.com>
 <CACu1E7F068sAMFgn=D7qBGM81qvYP4iW1+hXpfXVKtQGWeyTKQ@mail.gmail.com>
 <CACu1E7EueMnte9e+yLEtRE9WmG0J5bVMj59VbPfkDeB7OHbsAw@mail.gmail.com>
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com>
 <d95ef763-7237-4080-b323-838ca337734a@gmail.com> <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
 <57064da3-190c-4554-b085-d56daf979933@gmail.com>
In-Reply-To: <57064da3-190c-4554-b085-d56daf979933@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:42:59 -0700
Message-ID: <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Connor Abbott <cwabbott0@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 3:56=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/27/24 11:07 PM, Rob Clark wrote:
> > On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
> > <antomani103@gmail.com> wrote:
> >>
> >> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> >>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> >>>> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@gm=
ail.com> wrote:
> >>>>>
> >>>>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> >>>>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wr=
ote:
> >>>>>>>>> This patch implements preemption feature for A6xx targets, this=
 allows
> >>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is rea=
dy. A6XX
> >>>>>>>>> hardware as such supports multiple levels of preemption granula=
rities,
> >>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine gr=
ained
> >>>>>>>>> such as draw-call level or a bin boundary level preemption. Thi=
s patch
> >>>>>>>>> enables the basic preemption level, with more fine grained pree=
mption
> >>>>>>>>> support to follow.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >>>>>>>>> ---
> >>>>>>>>
> >>>>>>>> No postamble packets which resets perfcounters? It is necessary.=
 Also, I
> >>>>>>>> think we should disable preemption during profiling like we disa=
ble slumber.
> >>>>>>>>
> >>>>>>>> -Akhil.
> >>>>>>>
> >>>>>>> I don't see anything in kgsl which disables preemption during
> >>>>>>> profiling. It disables resetting perfcounters when doing system-w=
ide
> >>>>>>> profiling, like freedreno, and in that case I assume preempting i=
s
> >>>>>>> fine because the system profiler has a complete view of everythin=
g and
> >>>>>>> should "see" preemptions through the traces. For something like
> >>>>>>> VK_KHR_performance_query I suppose we'd want to disable preemptio=
n
> >>>>>>> because we disable saving/restoring perf counters, but that has t=
o
> >>>>>>> happen in userspace because the kernel doesn't know what userspac=
e
> >>>>>>> does.
> >>>>>>>
> >>>>>>
> >>>>>> KGSL does some sort of arbitration of perfcounter configurations a=
nd
> >>>>>> adds the select/enablement reg configuration as part of dynamic
> >>>>>> power up register list which we are not doing here. Is this someth=
ing
> >>>>>> you are taking care of from userspace via preamble?
> >>>>>>
> >>>>>> -Akhil
> >>>>>
> >>>>> I don't think we have to take care of that in userspace, because Me=
sa
> >>>>> will always configure the counter registers before reading them in =
the
> >>>>> same submission, and if it gets preempted in the meantime then we'r=
e
> >>>>> toast anyways (due to not saving/restoring perf counters). kgsl set=
s
> >>>>> them from userspace, which is why it has to do something to set the=
m
> >>>>
> >>>> Sorry, should be "kgsl sets them from the kernel".
> >>>>
> >>>>> after IFPC slumber or a context switch when the HW state is gone.
> >>>>> Also, because the upstream approach doesn't play nicely with system
> >>>>> profilers like perfetto, VK_KHR_performance_query is hidden by defa=
ult
> >>>>> behind a debug flag in turnip. So there's already an element of "th=
is
> >>>>> is unsupported, you have to know what you're doing to use it."
> >>>
> >>> But when you have composition on GPU enabled, there will be very freq=
uent
> >>> preemption. And I don't know how usable profiling tools will be in th=
at
> >>> case unless you disable preemption with a Mesa debug flag. But for th=
at
> >>> to work, all existing submitqueues should be destroyed and recreated.
> >>>
> >>> So I was thinking that we can use the sysprof propertry to force L0
> >>> preemption from kernel.
> >>>
> >>> -Akhil.
> >>>
> >>
> >> Right but when using a system profiler I imagined the expectation woul=
d
> >> be to be able to understand how applications and compositor interact. =
An
> >> use case could be measuring latency and understanding what contributes
> >> to it. That is actually the main reason I added traces for preemption.
> >> Disabling preemption would make it less useful for this type of
> >> analysis. Did you have an use case in mind for a system profiler that
> >> would benefit from disabling preemption and that is not covered by
> >> VK_KHR_performance_query (or equivalent GL ext)?
> >
> > I would think that we want to generate an event, with GPU timestamp
> > (ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
> > could display multiple GPU timelines and where the switch from one to
> > the other happens.
> >
> > I'm a bit curious how this is handled on android, with AGI/etc.. I
> > don't see any support in perfetto for this.
> >
> > BR,
> > -R
> >
> >> Best regards,
> >> --
> >> Antonino Maniscalco <antomani103@gmail.com>
> >>
>
> Looking at KGSL they seem to use ftrace and I don't see it doing
> anything to get a timestamp from some GPU timer, really not sure how
> that would be put in a gpu timeline.

I suspect it would require some work on perfetto trace-processor.  It
can ingest ftrace events (but those would end up being something
driver specific).  Maybe with u_trace and some tracepoints in the
'ambles something could be done that would be more driver agnostic
(but idk if that would work for gpu's where preemption happens more
autonomously in the fw)

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>

