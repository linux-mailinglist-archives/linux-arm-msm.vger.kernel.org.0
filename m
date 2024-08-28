Return-Path: <linux-arm-msm+bounces-29780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1C96292A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D1E283979
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF14828373;
	Wed, 28 Aug 2024 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF6cANEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B441DFE3;
	Wed, 28 Aug 2024 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724852813; cv=none; b=TS2Rez5S/AHlNFj4Hd7hX5Szr86AOrjEZ4nfCT2wdSM2Z0y/T5diKTE/U0EILr9rm8xJsvBKbRaHXp/Zcj/4Gy3kSevthkmuAy1hHMpeRpM0DNG96dtSlM82cs5YwV5E6PG2mEYC1RdTfKESEfUatDf+X2ZZ5fKkEoxItOHkcQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724852813; c=relaxed/simple;
	bh=ZqGiglr5qTsH/eaZrjdB3mtpUrARzIsL4NVsTp2REno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMrLhlYaleCbgDVRfBvNZDn3pMq7B8E26ls31aUrq13lb+O9uMQCHYAJWseDtbw25tbIoLNOo+pcTlxWCQVQAPcBEELhoUpReidxoRH/I8/7wLPJdHBxNGRkrcLemkfbJlvz14EUadXtqVY9bCUdAnisT27On5mLJewcE23q0Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF6cANEY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53351642021so8029188e87.3;
        Wed, 28 Aug 2024 06:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724852810; x=1725457610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK1lhMw3IsSWwXgKEhgbn5qag7aMlRwtX6PSIQDNdLw=;
        b=HF6cANEYuFtNL4dDhu8D4Lj+EXkYuXl9DWzNRV5VbT96YYfSbO3NdHD26oy7g9yBMS
         7WS9mHAhv/69U0easRuoIHcV6tGkVJCRhPMSvcWucA+LESewj64G6keB7/1+2YUuzH60
         p/8nxdCFs4Wr9XqbHb+S7Iy8/aUnbw8H4kG5YwMkmOiOmFECz8usDAD4bSj0gtu5lb8w
         R18lItJISMcMSPSAuQ4zBtnITMu26+DIcsDSryLXRXtlhHfAUSWTqUzfw/y6WQ9zLjg2
         W+ptvWcfE0OKPh/Yh/4zGP+lgIT6jsjlJvK++dITcNHpRLhDBr68Rd3DrE6ewm+uTcvs
         oF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724852810; x=1725457610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zK1lhMw3IsSWwXgKEhgbn5qag7aMlRwtX6PSIQDNdLw=;
        b=ToKPzXntSjIQvuJcprNs0Td2UDB+FHd9KE4kxbE6f177laEuMeWINKURrniOaSbsma
         Tw8JaIIE4NyweVLV21hUxz1eFqDVc/oSdmrjQ4qgquImp1bdffIYYU+gJNuE1NdtATdQ
         p7r/ij5QKpssaP3PNSvEQP23d4N07Zx/c/Vgk7jCIAHWoTioX60e2ggoInahdCRL21Hn
         6Wbr80Er+E8vvlMxQgoL4j17ZneSqB6scMk8oZGsb+z/WVPIy1iyzY2K3ZdVJHQFrsM/
         CxycDz8+ey3SdCz1QHS9xwRjDzdv3OE/0A9puEK0C6YXO4W/ITW6UnNMYdwdBFl8PLN3
         8wTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHgoNHUSa143xxwyTClBvaHolVZluEebbpMX9sWPm0SRg2p1sncK+9FIbd33iP+GYRiI/vNgSz7KuhjcgW@vger.kernel.org, AJvYcCXFLWZ63J3OapNe+lQhvsMabsd2x6ZGt1cMEqxyA6Bl7cnZZQvfba7LA/44IzQdXQygMPNR7A928BSxXDLS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzip3l9bmr/Fu6UlJucoigPFtc1G0gYBaNCQ3+wDy9ip/Fh1W5j
	PCTm5WpwRmz6PdwlxUeBN9BLgxX0z4VkfKXlwm4urNwvfA1Cere4sSy90bRllG/iFW2L6/5UBzP
	GBX+m6Knr/nABvlJ2twdcrNlE7fs=
X-Google-Smtp-Source: AGHT+IFUTMrOZvhdOzhyEhoAcvZyzQa9INgHinlfjZc1gSs77VWpaj/Y9vJhrfrFiAuGjUoshzpAbZ/M20KY6vVjT+Q=
X-Received: by 2002:a05:651c:2121:b0:2ef:dd45:8755 with SMTP id
 38308e7fff4ca-2f4f48ec79fmr120483011fa.9.1724852809216; Wed, 28 Aug 2024
 06:46:49 -0700 (PDT)
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
 <57064da3-190c-4554-b085-d56daf979933@gmail.com> <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
In-Reply-To: <CAF6AEGtYh6jnYcFLcUnEobjQqKmqxuX29wO1qqnGYFQJ+EUBxw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:46:37 -0700
Message-ID: <CAF6AEGuBMiQft4SCrf=xTQ76q8=+-OS3SEKMmw7TGT5rb=Sygw@mail.gmail.com>
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

On Wed, Aug 28, 2024 at 6:42=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Aug 27, 2024 at 3:56=E2=80=AFPM Antonino Maniscalco
> <antomani103@gmail.com> wrote:
> >
> > On 8/27/24 11:07 PM, Rob Clark wrote:
> > > On Tue, Aug 27, 2024 at 1:25=E2=80=AFPM Antonino Maniscalco
> > > <antomani103@gmail.com> wrote:
> > >>
> > >> On 8/27/24 9:48 PM, Akhil P Oommen wrote:
> > >>> On Fri, Aug 23, 2024 at 10:23:48AM +0100, Connor Abbott wrote:
> > >>>> On Fri, Aug 23, 2024 at 10:21=E2=80=AFAM Connor Abbott <cwabbott0@=
gmail.com> wrote:
> > >>>>>
> > >>>>> On Thu, Aug 22, 2024 at 9:06=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> > >>>>>>
> > >>>>>> On Wed, Aug 21, 2024 at 05:02:56PM +0100, Connor Abbott wrote:
> > >>>>>>> On Mon, Aug 19, 2024 at 9:09=E2=80=AFPM Akhil P Oommen <quic_ak=
hilpo@quicinc.com> wrote:
> > >>>>>>>>
> > >>>>>>>> On Thu, Aug 15, 2024 at 08:26:14PM +0200, Antonino Maniscalco =
wrote:
> > >>>>>>>>> This patch implements preemption feature for A6xx targets, th=
is allows
> > >>>>>>>>> the GPU to switch to a higher priority ringbuffer if one is r=
eady. A6XX
> > >>>>>>>>> hardware as such supports multiple levels of preemption granu=
larities,
> > >>>>>>>>> ranging from coarse grained(ringbuffer level) to a more fine =
grained
> > >>>>>>>>> such as draw-call level or a bin boundary level preemption. T=
his patch
> > >>>>>>>>> enables the basic preemption level, with more fine grained pr=
eemption
> > >>>>>>>>> support to follow.
> > >>>>>>>>>
> > >>>>>>>>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > >>>>>>>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > >>>>>>>>> ---
> > >>>>>>>>
> > >>>>>>>> No postamble packets which resets perfcounters? It is necessar=
y. Also, I
> > >>>>>>>> think we should disable preemption during profiling like we di=
sable slumber.
> > >>>>>>>>
> > >>>>>>>> -Akhil.
> > >>>>>>>
> > >>>>>>> I don't see anything in kgsl which disables preemption during
> > >>>>>>> profiling. It disables resetting perfcounters when doing system=
-wide
> > >>>>>>> profiling, like freedreno, and in that case I assume preempting=
 is
> > >>>>>>> fine because the system profiler has a complete view of everyth=
ing and
> > >>>>>>> should "see" preemptions through the traces. For something like
> > >>>>>>> VK_KHR_performance_query I suppose we'd want to disable preempt=
ion
> > >>>>>>> because we disable saving/restoring perf counters, but that has=
 to
> > >>>>>>> happen in userspace because the kernel doesn't know what usersp=
ace
> > >>>>>>> does.
> > >>>>>>>
> > >>>>>>
> > >>>>>> KGSL does some sort of arbitration of perfcounter configurations=
 and
> > >>>>>> adds the select/enablement reg configuration as part of dynamic
> > >>>>>> power up register list which we are not doing here. Is this some=
thing
> > >>>>>> you are taking care of from userspace via preamble?
> > >>>>>>
> > >>>>>> -Akhil
> > >>>>>
> > >>>>> I don't think we have to take care of that in userspace, because =
Mesa
> > >>>>> will always configure the counter registers before reading them i=
n the
> > >>>>> same submission, and if it gets preempted in the meantime then we=
're
> > >>>>> toast anyways (due to not saving/restoring perf counters). kgsl s=
ets
> > >>>>> them from userspace, which is why it has to do something to set t=
hem
> > >>>>
> > >>>> Sorry, should be "kgsl sets them from the kernel".
> > >>>>
> > >>>>> after IFPC slumber or a context switch when the HW state is gone.
> > >>>>> Also, because the upstream approach doesn't play nicely with syst=
em
> > >>>>> profilers like perfetto, VK_KHR_performance_query is hidden by de=
fault
> > >>>>> behind a debug flag in turnip. So there's already an element of "=
this
> > >>>>> is unsupported, you have to know what you're doing to use it."
> > >>>
> > >>> But when you have composition on GPU enabled, there will be very fr=
equent
> > >>> preemption. And I don't know how usable profiling tools will be in =
that
> > >>> case unless you disable preemption with a Mesa debug flag. But for =
that
> > >>> to work, all existing submitqueues should be destroyed and recreate=
d.
> > >>>
> > >>> So I was thinking that we can use the sysprof propertry to force L0
> > >>> preemption from kernel.
> > >>>
> > >>> -Akhil.
> > >>>
> > >>
> > >> Right but when using a system profiler I imagined the expectation wo=
uld
> > >> be to be able to understand how applications and compositor interact=
. An
> > >> use case could be measuring latency and understanding what contribut=
es
> > >> to it. That is actually the main reason I added traces for preemptio=
n.
> > >> Disabling preemption would make it less useful for this type of
> > >> analysis. Did you have an use case in mind for a system profiler tha=
t
> > >> would benefit from disabling preemption and that is not covered by
> > >> VK_KHR_performance_query (or equivalent GL ext)?
> > >
> > > I would think that we want to generate an event, with GPU timestamp
> > > (ie. RB_DONE) and which ring we are switching to, so that perfetto/et=
c
> > > could display multiple GPU timelines and where the switch from one to
> > > the other happens.
> > >
> > > I'm a bit curious how this is handled on android, with AGI/etc.. I
> > > don't see any support in perfetto for this.
> > >
> > > BR,
> > > -R
> > >
> > >> Best regards,
> > >> --
> > >> Antonino Maniscalco <antomani103@gmail.com>
> > >>
> >
> > Looking at KGSL they seem to use ftrace and I don't see it doing
> > anything to get a timestamp from some GPU timer, really not sure how
> > that would be put in a gpu timeline.
>
> I suspect it would require some work on perfetto trace-processor.  It
> can ingest ftrace events (but those would end up being something
> driver specific).  Maybe with u_trace and some tracepoints in the
> 'ambles something could be done that would be more driver agnostic
> (but idk if that would work for gpu's where preemption happens more
> autonomously in the fw)

btw how to handle tracing preemption probably shouldn't hold up
sending the next iteration of this series.  There isn't that much more
time to get this in v6.12, and I think better visualization of
preemption is going to take some work outside of the kernel.

BR,
-R

