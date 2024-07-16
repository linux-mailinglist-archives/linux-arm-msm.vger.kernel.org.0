Return-Path: <linux-arm-msm+bounces-26403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BC69334A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 01:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66C761F22EA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA841411EB;
	Tue, 16 Jul 2024 23:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqqXO6vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737D13DDD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 23:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721173381; cv=none; b=hWJsJJd3Cx7QFi1mh+n3wMsDrvUoXhj6N1bI9UMPazSadPe+wy2Q47sthzZjSFGjMIpMlaJMxDLzYvDI3ejcguJD6VsqZzFLgzibgo8SkRQeedEDU0oL0+KlLsvjjy6qGbT5JBrHVmojizepe9r+QyqfGkMHdfpFU66jexSq82c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721173381; c=relaxed/simple;
	bh=U4CreDnCs9YPeisW/eCWgyMYBTlTYVg5mz6bOZK23wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NV8dQGvEeLgWQqSK+tdcyLdLqXZ48Rj05TSrWZpbylfeW0u9cCwoh5jUEJToRS48iCxuBeWJ4QvIogImzaqSWQ+2Tz/TJrdMxZdWQt7qtGfYsZRCwoKe4fhZTqzM04N6JgPAIsoAstg95HSp3gmybmk/3WxWGh60ipjTaFz4Yog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqqXO6vt; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-65cd720cee2so55564307b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721173378; x=1721778178; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdx0WrTJA3HLe4B/c0rt0W2OYcQp3lvzc1IIRVfiSI0=;
        b=eqqXO6vtV6sj5Z0Ng7E6GVqeqXvbKfjFkyAUES5FbaeRRU29vTRKbGH7cR6Jbbwnrj
         Jqq5EbgUBnFaYmvR1mBoc+38yU5ZQSR/yHwLBqsGVlMBwqA7BqcdfT60YvGTjQpSyfwE
         CnAvsq/CK9Wd4Jkby07T8fEINPLiTC3fQP3AB8+dvSSB4SVCz01hI2dcBxysS14Qfew7
         fZvlH1iyggvK4lWGVXQYN5xxrds5Nw/wYYahs0WZmlU3PeApSqggZTNlSeJJ0JWmHMun
         97sV6jQDgVNDK64vt24KjZ6OGPxsPpgCSAVolKgoMGSxbMsI902y7M2qWOKB1Cc4o9jj
         GGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721173378; x=1721778178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdx0WrTJA3HLe4B/c0rt0W2OYcQp3lvzc1IIRVfiSI0=;
        b=EfCIl7MrzbPfTrlJ2Ybsm9ZAo1qzytePJXrFThPnN9FQw4L/cSZ7mrEHL3RitiDNLi
         rkbRSS6v5T/MWAAl5TLcCt80dB+2qzCiwjph/0jB43cT1WrUUNzFrCv4aZ/El0DT2z9F
         ArL/qBeMhdN29Tn44ShJsaqxWbh2sEHmhIJiAouD2M7ZK55R9HtTy0T/9lILWgGeb8Ci
         /S47SPSxpZZJK3qHOjvFAqARuQaRmtfTWqOE2ivrxvRMhebFvtBDIt7ORHc+AtLWUSjd
         lSkyRibzXCmyqEY1i+Uyvy0mAEE5UCWbDt0gycjbYl0B4rHBBGMKQzkUfeBftN2N88Ev
         WABQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5A7WcuMgQ55R91SZbAcux4M0VeIi65KUTm6P1YnCvRX3ZROv+DWbOtvWWG72bejLNclm6u6hY82PuZNq5R5WcJqdG1gvWNvDNkI2i7Q==
X-Gm-Message-State: AOJu0YzhYXxPhsWgux56cGBuDdb7tKeCQq5eRRkohTyCvBS7s/klG2HL
	6M6RPqfaHvxcToTCZ7jqUUd1iEM8IGU7UjFptf+BwQyq1klTjnLdGb9jGcIYE1CEtr4F/33kjOr
	9EUUUP0aGYyWCq84lM9Sc+pdpc+VZjp44lsegzw==
X-Google-Smtp-Source: AGHT+IEbqyDEFCrlR4xZQuknxtqbab+UfGCCmomcF2ZpZpJc3MJzA97KvniYAqlPDbzdPnbRG9F/Ih49/ciL+gHMBnE=
X-Received: by 2002:a0d:d387:0:b0:65c:2536:bea2 with SMTP id
 00721157ae682-664fe357ac1mr1641717b3.19.1721173378606; Tue, 16 Jul 2024
 16:42:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com> <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com> <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
 <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com> <CAA8EJprmi9zxEipq=0LyBi4nJ59BrLgN1sL+3u7-n9kJ3yQcRg@mail.gmail.com>
 <d7905aa1-67fa-4468-b3ce-69c7aa4ec5e5@quicinc.com>
In-Reply-To: <d7905aa1-67fa-4468-b3ce-69c7aa4ec5e5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 02:42:47 +0300
Message-ID: <CAA8EJprFNXpO568hwNwJvHY_NmcHJxJECe4v3O+ONp17v1Q_iw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jul 2024 at 02:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 7/16/2024 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jul 2024 at 01:43, Abhinav Kumar <quic_abhinavk@quicinc.com>=
 wrote:
> >>
> >>
> >>
> >> On 7/16/2024 2:50 PM, Rob Clark wrote:
> >>> On Tue, Jul 16, 2024 at 2:45=E2=80=AFPM Abhinav Kumar <quic_abhinavk@=
quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/15/2024 12:51 PM, Rob Clark wrote:
> >>>>> On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
> >>>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>>
> >>>>>> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> >>>>>>> There is no recovery mechanism in place yet to recover from mmu
> >>>>>>> faults for DPU. We can only prevent the faults by making sure the=
re
> >>>>>>> is no misconfiguration.
> >>>>>>>
> >>>>>>> Rate-limit the snapshot capture for mmu faults to once per
> >>>>>>> msm_kms_init_aspace() as that should be sufficient to capture
> >>>>>>> the snapshot for debugging otherwise there will be a lot of
> >>>>>>> dpu snapshots getting captured for the same fault which is
> >>>>>>> redundant and also might affect capturing even one snapshot
> >>>>>>> accurately.
> >>>>>>
> >>>>>> Please squash this into the first patch. There is no need to add c=
ode
> >>>>>> with a known defficiency.
> >>>>>>
> >>>>>> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> >>>>>
> >>>>> So, in some ways devcoredump is ratelimited by userspace needing to
> >>>>> clear an existing devcore..
> >>>>>
> >>>>
> >>>> Yes, a new devcoredump device will not be created until the previous=
 one
> >>>> is consumed or times out but here I am trying to limit even the DPU
> >>>> snapshot capture because DPU register space is really huge and the r=
ate
> >>>> at which smmu faults occur is quite fast that its causing instabilit=
y
> >>>> while snapshots are being captured.
> >>>>
> >>>>> What I'd suggest would be more useful is to limit the devcores to o=
nce
> >>>>> per atomic update, ie. if display state hasn't changed, maybe an
> >>>>> additional devcore isn't useful
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>
> >>>> By display state change, do you mean like the checks we have in
> >>>> drm_atomic_crtc_needs_modeset()?
> >>>>
> >>>> OR do you mean we need to cache the previous (currently picked up by=
 hw)
> >>>> state and trigger a new devcores if the new state is different by
> >>>> comparing more things?
> >>>>
> >>>> This will help to reduce the snapshots to unique frame updates but I=
 do
> >>>> not think it will reduce the rate enough for the case where DPU did =
not
> >>>> recover from the previous fault.
> >>>
> >>> I was thinking the easy thing, of just resetting the counter in
> >>> msm_atomic_commit_tail().. I suppose we could be clever filter out
> >>> updates that only change scanout address.  Or hash the atomic state
> >>> and only generate devcoredumps for unique states.  But I'm not sure
> >>> how over-complicated we should make this.
> >>>
> >>> BR,
> >>> -R
> >>
> >> Its a good idea actually and I would also like to keep it simple :)
> >>
> >> One question, is it okay to assume that all compositors will only issu=
e
> >> unique commits? Because we are assuming thats the case with resetting
> >> the counter in msm_atomic_commit_tail().
> >
> > The compositors use drm_mode_atomic_ioctl() which allocates a new
> > state each time. It is impossible to re-submit the same
> > drm_atomic_state from userspace.
> >
>
> No, what I meant was, is it okay to assume that a commit is issued only
> when display configuration has changed?

No.

> Like if we get multiple commits for the same frame for some reason,
> thats also spam and this approach will not avoid that.

I'd say, new commit means that userspace thinks that something
changed. So if the driver got another hang / issue / etc, it should
try capturing a new state.

--=20
With best wishes
Dmitry

