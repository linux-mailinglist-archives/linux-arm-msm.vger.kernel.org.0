Return-Path: <linux-arm-msm+bounces-55943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E032AA9F86E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449E01A83768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 18:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F582957B9;
	Mon, 28 Apr 2025 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivE2iaT6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922782951DF;
	Mon, 28 Apr 2025 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864640; cv=none; b=sQkOSvR1e3FWKodsfcR9bA7DlGy0m93Cw5Dzv/xn9Ph3O1pMdX2RvjNBPHoYixAl1lomRDKZ6+DF7oLNxqBtJJpQN07yUtaOqbcXDq51VvGqAwwVXCjrmf8RbNTbqw0Ps8ejetfbW0mUgcuDZSIuZRan0VkEGSBS0SxSK04gIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864640; c=relaxed/simple;
	bh=bfkSNuW9ZLA+zt1E4XJ6Y4jl13nx7BJaRR54OIX8urI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jsFwZ2PeLxH2XcMpWGwgUmSAzd6ydoe68BWF2Vt4lBB9K6N0MqspVv3nzjC7mrFOaYLKd/eyQ5nOM2+dOMWFkMGLQFeLDElnCiF7KApuLcXS50WlT80A0aDbRV9xnwNtAGnwgDWcr1KfpRHHISucBCbVj3oRx64nTmZf70Vpeek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivE2iaT6; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3949869f8f.2;
        Mon, 28 Apr 2025 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745864637; x=1746469437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bfkSNuW9ZLA+zt1E4XJ6Y4jl13nx7BJaRR54OIX8urI=;
        b=ivE2iaT69xIhxa6WVjG5FZso8P6OCIMankj/fpUFZ2EHqCs0hG899dGdPMLpMhcBzp
         KojucRQnJqApfqFWWIlAHsOSXVH/MjAkizDxJ/532l+k5kpIAE/zVcUw3ybtXSfA+uGp
         Y5UcDczTdHDUcjMEBi55K0+BySjYm1sIyKL3wSr4vVsN0Fck+9mLHePbYndIfFTBedAb
         R/1MVY5bWEhltvkU/WWTpeCiaRyMoH0sS5DFblMaRxt96fct4g+QD0KPlb4a9mjuutTX
         s9rQa8mWjp2oNMp2dyBbREScto8EWc80dpEUcwkTXqwTc68b9JFGGB2w7gDBvNE7i5x+
         rsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864637; x=1746469437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfkSNuW9ZLA+zt1E4XJ6Y4jl13nx7BJaRR54OIX8urI=;
        b=i20uSrioku9zyF/E5Hq3eSfFS2WtDV/n/dtyO+Vf1HqVBA7WHIXZBBwZQ2pHCE8+2M
         hsGBEnJ9Q/jRfe3wJHkI+7MJPE1UvMF95qOQEh0Gp1jPSwVeXIw7YsIS/JA8C7d8913a
         9JH9JDjLk1AhibTCqMEFdCtsNiY/Q9J0KK+dWPTIAMiyYawUfOhcBoZuP7EWsXI5OVEu
         pzBINhw5bRmoh10naOTneiPzM04imCThgFjC4g/IuwrZu2/jMeOuvoxD8Qzmbi0IVErO
         yn0q7l2E4pGv6ruwc8YbJU0a3MABaRhmcAD9D/dimxS/n4EqT6EZmpJT5W+B7XqsiX7v
         u0xg==
X-Forwarded-Encrypted: i=1; AJvYcCVJRaBtUBfsHqqTtpV++PxtzyNurSksk2r45aHL54bGdiTDgCwiLh6FRz9OqgP7khE7jVuucpzg7HtSVR3L@vger.kernel.org, AJvYcCVbb1/PDATTyH0d5FE+SuslmdFY29ExDZau6EegkBQqfKdbGr+TmnMojit+rf9rJQl7y34MFZmJXC0ljbS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxsY4GROt6TZvPNy8cQ2dHXPUvqgLZXwx6vE0jWIFkDUHs51yT5
	3GhiYUVQP80c6X9prFytDMlOr4prOB20mr1x4bYef3rzcHVoa/gyl5pfohK8GclHWdnPwgY79KP
	jaE47CtOWdLyJXUmdi9t9k8Uutw==
X-Gm-Gg: ASbGncvuHeTSxfo0YDdbPS5EN44yBlgPbHKkTKbClRrrQeWTOQ0tTjlyyoQ4CSUSeOc
	Sdm9Zyq9PTqiyOVtZusIrqJyvNiC/is6+4839YK06omqzWjiszWc130y5vKx6kXPHzg6L42lvXa
	fLmjI4l3zlyUrh3SdoeA4ldg==
X-Google-Smtp-Source: AGHT+IFwDSjFDsXFqDEajGlCEG2JWphdEKba/Sl0xJc1WhGDflX1dA0OlyRMRIVd6p09uVXAOpHTVyL0aAWfZUYjs78=
X-Received: by 2002:a05:6000:4310:b0:3a0:8549:302 with SMTP id
 ffacd0b85a97d-3a08a371450mr255248f8f.35.1745864636424; Mon, 28 Apr 2025
 11:23:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com> <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
In-Reply-To: <aA+N8YHX0DZ6h9Uj@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 28 Apr 2025 20:23:45 +0200
X-Gm-Features: ATxdqUFJV2eKUF6Ib5_rQijD8ZDNXLbxDy4yxnBcyxEjzsLTAojaiverpqjEJgQ
Message-ID: <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-04-28 14:47:04, Johan Hovold wrote:
> > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> > > > On Thu, Apr 17, 2025 at 04:10:31AM +0200, Aleksandrs Vinarskis wrote:
> > > > > Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
> > > > > to non-transparent mode to enable video output on X1E-based devices
> > > > > that come with LTTPR on the motherboards. However, video would not work
> > > > > if additional LTTPR(s) are present between sink and source, which is
> > > > > the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
> > > > > some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
> > > >
> > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > adapters or docks with retimers in transparent mode?
> > >
> > > I am actually not 100% sure.
> > > - If without LTTPR initialization, they default to transparent mode,
> > > then yes, incomplete LTTPR support sets them to non-transparent
> > > without per-segment training and breaks docks with retimers, while it
> > > would've worked if LTTPR(s) would've been left in default transparent
> > > mode. Note that in this case, X1E devices with ps883x are somehow an
> > > exception, because without LTTPR initialization at all the training
> > > always fails.
> >
> > Right, I'm concerned about breaking working setups for users of machines
> > like the X13s.
> >
> > > - If LTTPR has to be initialized either way, and explicitly set to
> > > transparent mode if we do not want non-transparent, then no,
> > > incomplete LTTPR support in 6.15-rcX did not explicitly break docks
> > > with retimers, as those never worked in the first place. As per my
> > > understanding, this is the case, unless something (firmware?) has
> > > already placed LTTPR to transparent mode before the driver takes over
> > > - then 1st case would be applicable.
> > >
> > > Docks with retimers do not work in 6.15-rcX, but I am unable to verify
> > > if it did work before, as I do not have a Qualcomm based device
> > > without LTTPR on the baseboard.
> >
> > Abel (or anyone else), do you have one of these docks that you could
> > test with the X13s to confirm whether this series fixes a regression or
> > not?
>
> Before the support for LTTPRs has been merged, if you would have one of
> those docks (I do not own one) with LTTPRs, link training would've just
> failed if the LTTPRs were not by default in transparent mode, which IIRC
> is what the standard dictates.
>
> X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> would return 0 and none of the of the transparent/non-transparent setup
> would happen. Now, as already mentioned, DP would be considered already
> broken (or rather not supported) if you would connect a dock with LTTPRs in it.
>
> With the support in, if one such dock is used, the training should be
> successful as all LTTPRs are set in transparent mode. This I was not
> able to test myself as I do not own such a dock.
>
> >
> > > > You describe at least one of this patches as a fix but I'm not seeing
> > > > any Fixes tags or indication that these need to go into 6.15-rc to fix
> > > > a regression.
> > >
> > > You are right, I will add Fixes tag to the 1st patch to make it clear:
> > > Fixes 72d0af4accd (drm/msm/dp: Add support for LTTPR handling)
> > >
> > > Or should I mark the entire series with Fixes, so that the docking
> > > stations with retimers can be fixed in 6.15 already? Landing only the
> > > 1st patch will fix inconsistency with DP spec, but will not fix
> > > docking stations with retimers. I guess this comes down to whether
> > > existing LTTPR (but not multiple LTTPRs) support is considered a bug
> > > (and patches 2,3,4 are a fix) or lack of functionality (and patches
> > > 2,3,4 are a new feature).
> >
> > Indeed. If LTTPR support broke existing setups, then I think all should
> > be marked with a Fixes tag and merged for 6.15. If we can't get it into
> > 6.15 we may consider just disabling LTTPR support in 6.15 to address the
> > regression and then enable it again once fixed in 6.16.
>
> The LTTPR support did not break existing (working) setups because on these
> setups, LTTPR count would read 0 and would be basically a no-op.
>
> >
> > But if this series is just enabling support for docks (and USB-C ports)
> > that did not used to work, then I guess this can all wait for 6.16.
>
> I'm not sure about what this actually fixes. It might be that is
> specific to a dock or something. But as far as X Elite boards go, even
> without this "fix" display has been working fine.
>
> The change itself makes sense though and I think makes sense to be marked as a fix.

Just to confirm, you mean to mark as fix only the 1st patch, correct?
Since it's obvious now that the currently present partial LTTPR
support did not break anything that used to work.

Thanks,
Alex

>
> >
> > Johan
>
> Abel

