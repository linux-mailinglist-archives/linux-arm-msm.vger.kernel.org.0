Return-Path: <linux-arm-msm+bounces-37651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80E9C5C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 16:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A762826B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 15:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D362040B2;
	Tue, 12 Nov 2024 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWVGjLo4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864C22040AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 15:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731427025; cv=none; b=rZR4yOp9r7GhkZkuWZW3jf6fxXNVWtCa9LAUOgKjad0g+JZ05dgH2XF8Kh50pNUQ89NV3T7Qc2NNbW90qFZpPDLoSuPLJ7GhIpem+OIQqYyLaMSMLZ8G3YkfxrgFEGAhgoWM+J79OP85tU9C12LR4UPqNsMZ1nt0M+nKhcAc8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731427025; c=relaxed/simple;
	bh=VAA1g9rl5BaF/kPLFoBaEIyM0NZnhRw8AObDrZkEUk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mVQOkkcEs0v1agwWKtLD6M7t2TBwcr3A3ogiiq96jXcSLKYAgLAHTu0hvOfsa1h+o7aad4jzbiIyWrv0eKjXsoOTGYcZTGm6RCs50nBVQu54NJwzYWxF1WrwI938QPnET3YAATb2ERL1nU2KIOuW0yY4aDFmCjVsKf02XKZ3Q6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWVGjLo4; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e38ebcc0abso61236457b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 07:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731427022; x=1732031822; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvLeNnoi9Q/2tIEpsYYZ7QLjjHPm2C2yqmvXawnq7e4=;
        b=TWVGjLo437KtZ1N0ot1zyu62Sx8PpjHsiGo+8LrlwBzdvuaPjwkwn55aFkeTNWfMdo
         nbyfMEGrnsX60ddYxvqJKEppHssAh2UGoGgxUd1P3YE3qHgwTidc58bZi1BRaUb4RS9h
         WAWsZ/58I8+wM9xhwpVg+aCbyDBUylz+tr4MUugA4sIo/XwMlGH8t5aw6y8V3gY8AubF
         F3wZ7eeV+TUcVP+uJ8fP7eWBxXXoCTmVn0dDfnJUd+bqPnWAohQxwJVXw+r7kbY+Occ3
         ngNlmMr+dZa/foW8TqfyH6w9PFpGrOapgn/mMOtv9zTvLdR2y3OncvXOyr+zF4OQyfVw
         eO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731427022; x=1732031822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvLeNnoi9Q/2tIEpsYYZ7QLjjHPm2C2yqmvXawnq7e4=;
        b=JZhIYDkVCCooEqMSGPQyhAPeU97qmiv6/I4ShbSEBdlKZ48zSJ2JkRvTXcOlP0qGLQ
         iL55h6/gYbCpPlYuCOJdztRREV0L1mhyiLzbV5gsSu0QdovafU+dJkEys8N0WLjQwBYb
         9pMU+LKTHnv/1xlrm0lDCsvPQsT2TlOBNipKO+3ufXzdkFlk5rJmH8G4sinDMS+ZlzGv
         eSz3n/ucBXfQ6P181jJTwj+Xl3gPkPUXMhrn3CB5T+MlSbKCAnvGxRQBB+EvD1Kx6t+C
         J2Blo4fXXq/4OQMKGlYABk/gnjkGUWwPnTsepxDREIgk73TZ9yg495x6RqdM6flN5lf4
         TD6w==
X-Forwarded-Encrypted: i=1; AJvYcCXnOScE6eiBdACEqWh2nI9Mo92+Sje7M7pGwdT7ViWRGBgsjXo5q/+O2rh0doPP9r+6padfVFA4vsH7AXid@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/sfRud+ceKo2HnAYsacPHbZVjx476cOvcz04vmEc6X/wXNqYC
	IOQ0SThAwwYPwXIKcaqaYmIj24+FXXSnaf8wfBvoSnXKK48jjV+EKqsWGDjE1s7ioqrCbAYWHoR
	xnEPPBhWH1kzM6/HvMnJLQ49LY6B18Kq52QND4g==
X-Google-Smtp-Source: AGHT+IH5CCJQlrbtWhzwNwEuVmBy3c+bpgonBaiqCiIcyBRut8a95C/Hq3VyL3SXBBf4iw9gPiN+f3nxmL1sUxWUun4=
X-Received: by 2002:a05:690c:c96:b0:6ea:85ee:b5d4 with SMTP id
 00721157ae682-6eaddd86d12mr164461237b3.6.1731427022576; Tue, 12 Nov 2024
 07:57:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <CAPDyKFoY8CnxF7JXzkT9_WXyM-TJhW4kmTw=H8NEzch32N1_7Q@mail.gmail.com>
 <ZyJeuVIbWkohymW5@pluto> <20241106071215.jhnzcn4vkdfr3peg@bogus>
In-Reply-To: <20241106071215.jhnzcn4vkdfr3peg@bogus>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Nov 2024 16:56:26 +0100
Message-ID: <CAPDyKFr-pmXEhgUgCapzQX3Hn_UAM632TaG8SdkQXaCn5-y42g@mail.gmail.com>
Subject: Re: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
To: Sudeep Holla <sudeep.holla@arm.com>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, johan@kernel.org, jassisinghbrar@gmail.com, 
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, 
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Nov 2024 at 08:12, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Wed, Oct 30, 2024 at 04:28:41PM +0000, Cristian Marussi wrote:
> > On Wed, Oct 30, 2024 at 05:19:39PM +0100, Ulf Hansson wrote:
> > > On Wed, 30 Oct 2024 at 13:55, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > >
> > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > are required to X1E cpufreq device tree changes to land.
> > > >
> > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > >
> > > > Duplicate levels:
> > > > arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
> > > > arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
> > > > arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
> > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15
> > > >
> > > > ^^ exist because SCP reports duplicate values for the highest sustainable
> > > > freq for perf domains 1 and 2. These are the only freqs that appear as
> > > > duplicates and will be fixed with a firmware update. FWIW the warnings
> > > > that we are addressing in this series will also get fixed by a firmware
> > > > update but they still have to land for devices already out in the wild.
> > > >
> > > > V4:
> > > > * Rework debugfs node creation patch [Ulf/Dmitry]
> > > > * Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
> > > > * Add cc stable and err logs to patch 1 commit message [Johan]
> > >
> > > Patch4 and patch5 applied for fixes to my pmdomain tree - and by
> > > adding a stable tag to them, thanks!
> > >
> > > Potentially I could help to take the other patches too, to keep things
> > > together, but in that case I need confirmation that's okay to do so.
> >
> > SCMI patches in these series are all reviewed (all but one even by Sudeep)
> > so it is really up to Sudeep preference...(who is travelling now so it could
> > take a bit to reply)
>
> I have added my reviewed by now.
>
> > ...moreover I am not sure if the SCMI patches in this
> > series could end up with wome trivial conflicts against the scmi patches
> > already queued at
> >
> >       sudeep/for-next/scmi/updates
> >
> > (at least the perf related ones 2 and 3 probably not)
> >
>
> I did a quick check and no conflicts were observed. Let me know if you need
> a branch with first 3 patches, but I need to do that today or after Sunday
> as I will away from my computer for few more days again from tomorrow.
>
> Let me know ASAP.
>
> --
> Regards,
> Sudeep

Sorry for the delay. I have picked up the remaining patches from this
series. All applied for fixes and by adding stable tags to them,
thanks!

Kind regards
Uffe

