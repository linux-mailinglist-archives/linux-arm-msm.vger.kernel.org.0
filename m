Return-Path: <linux-arm-msm+bounces-29677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E82009618FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 23:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97AF32845EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 21:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152821D2F6C;
	Tue, 27 Aug 2024 21:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyKusRd5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25A156661;
	Tue, 27 Aug 2024 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792858; cv=none; b=QpGx1Z3trKzXRVnr0VyhfiNRIyA4GErZ8hCdahjGop+CV9JuNkxDsTYwgLZcEgESmt7INs8/69kp7ha6mIwC1ha9H+33Sj53NGa3k1qMcDnqlF/DmaxXLF8YtIxXtfpST6uIVOwrva4QZ298GqTBraMNg7Iz4vtqscIVjeEmXDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792858; c=relaxed/simple;
	bh=eOAnTmOnHe8ISWccwwZaFrwu31RfPaMAWI8/7kt2V+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP8j/n38AIN7iVEduI3WkDcQtDGGhNBRbxqQFce36LQryO5UzN71IIKcdmcBa21JASkO7rowHq4EJmeLR/KL+W0a0JWs8wlpDuKmuypth9zgYIfq3sahTekbB7jlATWA6vlHG6PJ5m+8T/4cHZjlcu7MZg4OI2OcM+xY28Cbooo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyKusRd5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c0aa376e15so1623969a12.1;
        Tue, 27 Aug 2024 14:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724792854; x=1725397654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOAnTmOnHe8ISWccwwZaFrwu31RfPaMAWI8/7kt2V+U=;
        b=FyKusRd52aBabBufLD8uSs3qEKOpeN7NoEKvuMp+oT1WjU1jfQ0iHU82M88oVCJNnb
         QgUJ4tE0ajGJgv8u99fEWJ7hdcmmkip5Ov3JI6QVoLJL5uOYCAgtlOAT67VdE2xGTZ0g
         Cw1Oc1ODBLwgexLkRbsePr+oS3NAFhqXDxoUz9gJyC1odbr6R0U4co+60CDOL8RPa2CJ
         HPJUqQ6KKvzpqMR5jg0XDBts9wMJNYW/ZjQnZ0xXpwtUyFrl19db3bbAKAVUIwDmTs+6
         YqIBU9d0EGjXphQmBfdjrMRkz8hDIsiKV0B492PkPwOy0iYUGwm2MmihcQGD/X3v6mQJ
         FiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724792854; x=1725397654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOAnTmOnHe8ISWccwwZaFrwu31RfPaMAWI8/7kt2V+U=;
        b=DDqMXApa5B0g0AezsK+LnQTPTitsPSmMp566o/i9KRegRvwOZIVnsJmGvFzjbsoFCZ
         TQIcrUOtAtILP0S8INjnst7kBY/zGejqGQpu+OFHL04fLv1thQ85mFY5wzq4UzkmyX8s
         Pm3tiELfGA26s+SLFKxIFERRcQ1ZD1CGOdEWTO76IixTgRe6VVvdsOeQsXh/4umqkI1a
         t47V8oSLyK0uWgxn0YqnB5/ow28u5qZp1Sm+h2u6riYRs0sOuXaxMQIDNO621XiMGIBE
         80jGfWeYdGk0sUlM4x98NZF8z8hhTPLgLzRnhwsRzoc5Og2eBAKtw1WWiv/AZmHsPy4G
         f1DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJVihPwXrGuffb6R7j6srzlUTIqAGfij4Nb7ZSBp68uDsIlaMXCJtMRBxGLFJnpraTAxSSe0MTSnZmcebZ@vger.kernel.org, AJvYcCWav5GvZf5C6BWNKCVPn8PsdcTv72I9EGRCGYm5qzWuCXaqYuqbPuxoG9PYNSAcpO3qUaAn3g83JmcB3S7h@vger.kernel.org
X-Gm-Message-State: AOJu0YySAtHAcWh7/MaIO38J0utuTRET7YfPnmvWUSLc9A1w1jtXWOq0
	FM5yBohZvsuYJqRjb/XQfPr6BkdTM5EDrxtNutNtmAVFp3g3BQSIjk0T8PlfJ+vwOCramHeduQn
	GM+YR1xhUlrtAg9k4teE5UO7lAFg=
X-Google-Smtp-Source: AGHT+IH4yUpOnbf3fiViQzG0Q9MrI/HhazmQh5j6snorZhGmpjGr45lt2u3lI5d4clmzogam6vZBbvXWL5kVYKZYj9E=
X-Received: by 2002:a05:6402:40c5:b0:5be:f363:633b with SMTP id
 4fb4d7f45d1cf-5c08915b2admr15388230a12.1.1724792853603; Tue, 27 Aug 2024
 14:07:33 -0700 (PDT)
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
 <20240827194828.jxwelq4xr2wsdxos@hu-akhilpo-hyd.qualcomm.com> <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
In-Reply-To: <d95ef763-7237-4080-b323-838ca337734a@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 14:07:20 -0700
Message-ID: <CAF6AEGuASw0YO8b0X24-iq1pqTnBEpr0Tm3Scmt4-T+HeCMY_A@mail.gmail.com>
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

On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> > On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> >> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> >>>
> >>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> >>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_akhilp=
o@quicinc.com> wrote:
> >>>>>>
> >>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco wrot=
e:
> >>>>>>> This patch implements preemption feature for A6xx targets, this a=
llows
> >>>>>>> the GPU to switch to a higher priority ringbuffer if one is ready=
. A6XX
> >>>>>>> hardware as such supports multiple levels of preemption granulari=
ties,
> >>>>>>> ranging from coarse grained(ringbuffer level) to a more fine grai=
ned
> >>>>>>> such as draw-call level or a bin boundary level preemption. This =
patch
> >>>>>>> enables the basic preemption level, with more fine grained preemp=
tion
> >>>>>>> support to follow.
> >>>>>>>
> >>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >>>>>>> ---
> >>>>>>
> >>>>>> No postamble packets which resets perfcounters? It is necessary. A=
lso, I
> >>>>>> think we should disable preemption during profiling like we disabl=
e slumber.
> >>>>>>
> >>>>>> -Akhil.
> >>>>>
> >>>>> I don't see anything in kgsl which disables preemption during
> >>>>> profiling. It disables resetting perfcounters when doing system-wid=
e
> >>>>> profiling, like freedreno, and in that case I assume preempting is
> >>>>> fine because the system profiler has a complete view of everything =
and
> >>>>> should "see" preemptions through the traces. For something like
> >>>>> VK_KHR_performance_query I suppose we'd want to disable preemption
> >>>>> because we disable saving/restoring perf counters, but that has to
> >>>>> happen in userspace because the kernel doesn't know what userspace
> >>>>> does.
> >>>>>
> >>>>
> >>>> KGSL does some sort of arbitration of perfcounter configurations and
> >>>> adds the select/enablement reg configuration as part of dynamic
> >>>> power up register list which we are not doing here. Is this somethin=
g
> >>>> you are taking care of from userspace via preamble?
> >>>>
> >>>> -Akhil
> >>>
> >>> I don't think we have to take care of that in userspace, because Mesa
> >>> will always configure the counter registers before reading them in th=
e
> >>> same submission, and if it gets preempted in the meantime then we're
> >>> toast anyways (due to not saving/restoring perf counters). kgsl sets
> >>> them from userspace, which is why it has to do something to set them
> >>
> >> Sorry, should be "kgsl sets them from the kernel".
> >>
> >>> after IFPC slumber or a context switch when the HW state is gone.
> >>> Also, because the upstream approach doesn't play nicely with system
> >>> profilers like perfetto, VK_KHR_performance_query is hidden by defaul=
t
> >>> behind a debug flag in turnip. So there's already an element of "this
> >>> is unsupported, you have to know what you're doing to use it."
> >
> > But when you have composition on GPU enabled, there will be very freque=
nt
> > preemption. And I don't know how usable profiling tools will be in that
> > case unless you disable preemption with a Mesa debug flag. But for that
> > to work, all existing submitqueues should be destroyed and recreated.
> >
> > So I was thinking that we can use the sysprof propertry to force L0
> > preemption from kernel.
> >
> > -Akhil.
> >
>
> Right but when using a system profiler I imagined the expectation would
> be to be able to understand how applications and compositor interact. An
> use case could be measuring latency and understanding what contributes
> to it. That is actually the main reason I added traces for preemption.
> Disabling preemption would make it less useful for this type of
> analysis. Did you have an use case in mind for a system profiler that
> would benefit from disabling preemption and that is not covered by
> VK_KHR_performance_query (or equivalent GL ext)?

I would think that we want to generate an event, with GPU timestamp
(ie. RB_DONE) and which ring we are switching to, so that perfetto/etc
could display multiple GPU timelines and where the switch from one to
the other happens.

I'm a bit curious how this is handled on android, with AGI/etc.. I
don't see any support in perfetto for this.

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>
>

