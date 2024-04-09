Return-Path: <linux-arm-msm+bounces-16963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD71D89E291
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 20:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 192C71C20E20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 18:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEF9156C76;
	Tue,  9 Apr 2024 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgGRlbcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F3156C63
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712687485; cv=none; b=UKg9vekDoplqBCFG9F+TjBvrlie//tni0WrJDT6xfGwKFTDUzILJVMO27lUUsYFGHJge9ntxXmQF7uN40PF8FBsSeLpr3gDGQNTyqtsCdR6fn4BuQR18DWc5TLv7IBDvLrNqsQNJRzTw6Jy80rHOsjC+qWKwCxbasmoywD2Styc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712687485; c=relaxed/simple;
	bh=bGu7XtJhzUW0frfAhJWk/dFj2iy5sTHLiNWC4LsP98o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZSkbFmKRSIX7SOgPbJkTw/qqptIrpef8TPlICKOJcZKNsZ3RO+MsDhp9zHUd07NR/0qyarQX8glsO899V0hku6RJUADuge0pne5m6yeRjQ78OB9YnPEaXqAkCDtIgb4oII1cgCzFcr7gx4NzVUry2Rbi4HfOymSDyp/Ez5cUsjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgGRlbcQ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-615826815c2so68920207b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 11:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712687482; x=1713292282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGu7XtJhzUW0frfAhJWk/dFj2iy5sTHLiNWC4LsP98o=;
        b=TgGRlbcQXGO7LYBw+WIr5cEKVEEYJD7HwprMeHjNuZlwHjxo3mfa4Z9GrBR8Leyxnx
         rMbsM2JbWzWE3w/Wd6CVmDaMBaTITcStu8y7KxY1VZ+3pnJnwtAs7oe8Lww/RfsADMl9
         PTdHK7gSDYrtDnQEN2Cf2eyh1kFwpJpVXwmVv5BfnrWhx518htNZxGXQZXhUy2tlxrjq
         vPPsP0TjGEqI5FDTWmncRhhRXiH/F+Hy7VByA5ixL4NiGawtst4BhtFAcPSktaI8qF3E
         kPwqbPPFzNwZM7KRq9EpHA1Y/QshVfthbvO8kk4gF8QgRE/gDzeY+RpXUq+dHvnxqgnR
         XOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712687482; x=1713292282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGu7XtJhzUW0frfAhJWk/dFj2iy5sTHLiNWC4LsP98o=;
        b=Pz8G7ch0Xdt+q3gavaGhiP4f/PmmHxNWCABnk8pC36cLrKLYsqsTH8uMCDFwqY2wHF
         5vBn3BojvuSaBiyj/AUwtu/37GY4PNl57AS5fc/ekOYRnJTF038VGqnuX/ykQOJHnHf0
         L46YXt9VOuftblp0PxP6zkN4EXBy5OuZVk1LtVmSFtxR0eHNzBf67DRePCPwek8k6S+X
         s9RidntUhObp9cdtOpPau6FZDsd9TvlZOyJYacImmyrpqwGhSM805I/DcDxGXC0QX4TS
         9S+6buUnm7ydGWXheHSKjJZ/Wy/wH7jbHNVGFBe1GAp1N79bbmMJ/s/5sI8mHnnSFfgC
         W10Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0BpmeHOMftq8M0O7D5DJutwEQH4rGj/ESnT3Soean9hKBNvTpL+Zg1k9d1Il/9X8M1T1FtAKqeqOU9iH7zIFZpNdPVA8JNUG4bdd7Kg==
X-Gm-Message-State: AOJu0Yyj8sQBvlM86Iv7UQsToZeDSlrKYDe7GIA2HRULVNCMZAig8TEh
	k46H2f3GqVmBMZvANAet8TQwBeEaT55A1fBkeHg5zCeA06WA5jZDuOX+KsbGGxEjk0Y9Ox1gfY5
	LMFhu1ewmNqPyZqpQOyvC1mDbxqIerKnMi+NqZA==
X-Google-Smtp-Source: AGHT+IHQ5KjmBJchef7/auhgtlXjWlZR2v0LxhUQqslvpL6mHG6C3quz50vKHwZLs2B3MGSIY40CMKEa96p0+lotDMw=
X-Received: by 2002:a25:8403:0:b0:dcc:fea7:7f7b with SMTP id
 u3-20020a258403000000b00dccfea77f7bmr631031ybk.11.1712687482548; Tue, 09 Apr
 2024 11:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org> <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
 <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
 <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org> <x4sgmdodoacsu6culbjjsw52ucaylpqj2ll6tkeppllzhfqiqn@lysclxogvcfq>
 <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
In-Reply-To: <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Apr 2024 21:31:11 +0300
Message-ID: <CAA8EJprAcBDEwYeGJZ=JX2qkS4wQEraXsgCiCyZU3z1ksuxivw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin value
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Apr 2024 at 21:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote=
:
>
>
>
> On 4/9/24 20:15, Dmitry Baryshkov wrote:
> > On Tue, Apr 09, 2024 at 08:07:56PM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 4/9/24 20:04, Dmitry Baryshkov wrote:
> >>> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
> >>>> On Tue, Apr 9, 2024 at 8:23=E2=80=AFAM Dmitry Baryshkov
> >>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>
> >>>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
> >>>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> >>>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>>>>
> >>>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can =
clock
> >>>>>>>> the highest. Falling back to it when things go wrong is largely
> >>>>>>>> suboptimal, as more often than not, the top frequencies are not
> >>>>>>>> supposed to work on other bins.
> >>>>>>>
> >>>>>>> Isn't it better to just return an error here instead of trying to=
 guess
> >>>>>>> which speedbin to use?
> >>>>>>
> >>>>>> Not sure. I'd rather better compatibility for e.g. booting up a ne=
w
> >>>>>> laptop with just dt.
> >>>>>
> >>>>> New speedbin can have lower max speed, so by attempting to run it a=
t
> >>>>> higher freq you might be breaking it.
> >>>>
> >>>> Usually there are some OPPs in common to all speedbins, so picking a
> >>>> freq from that set would seem like the safe thing to do
> >>>
> >>> Well, the issue is about an uknown speed bin. So in theory we know
> >>> nothing about the set of speeds itsupports. My point is that we shoul=
d
> >>> simplfy fail in such case.
> >>
> >> Or we could allow e.g. the lowest frequency (or 2) which if often shar=
ed
> >> across the board to work, giving a compromise between OOBE and sanity
> >
> > That's also an option. But we should not be using existing speed table =
for
> > the unknown bin.
>
> I derived this logic from msm-5.15 where it's "intended behavior".. I
> suppose we can do better as you said though
>
> There have been cases in the past where the default speed bin ended up
> having a higher max freq than subsequent ones, and I don't think I can
> trust this product/feature code approach to guarantee this never
> happening again.
>
> So. I think sticking to a single lowest freq and printing a big red line
> in dmesg makes sense here

Make 0x80 the default supported-hw, make sure that the lowest freq has
0xff. Plus big-red-line.
And hope that we'll never see 16 speed bins for the hardware.


--=20
With best wishes
Dmitry

