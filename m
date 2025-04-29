Return-Path: <linux-arm-msm+bounces-56040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FA5AA047D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F66A8401A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 07:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB96276029;
	Tue, 29 Apr 2025 07:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjfb3z7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1433A8F49;
	Tue, 29 Apr 2025 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745911763; cv=none; b=CoFqTUeSDdRYbQBd+NPVQXh70hTk06y0r0sI8OdKDGurZzTLOVTeNxtA57+pyLF5YMOCXgmDL9c/Pg8jLXxykgVXK7zh/vRweiKtN4Mqjm26lKeOgE8JKYEeYmyNEmer3Ae32OXpSkHrrHsmjCh1qlJM+KILC2z21tagOa20mcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745911763; c=relaxed/simple;
	bh=nB16d46ObHB8u6nVtTntzLBupJconoj9kwzJ3jXfuGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnR7NjjStLtya25qdT48ARkkQo4p5Y9ts0W/nGRx1bX0WCPHhLTTHKyUqTSG6yaivyavf+H1kwW1ezDBH+VywUrNLpGFrJhJPnMJUPxg/2Gv69mJClFmMOs5hK2wS8tYA9NEPUpmhHkDgx+qsSKiFb1wJjmW9dCZ61k+yXA49EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjfb3z7H; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2844631f8f.3;
        Tue, 29 Apr 2025 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745911760; x=1746516560; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nB16d46ObHB8u6nVtTntzLBupJconoj9kwzJ3jXfuGc=;
        b=cjfb3z7HgVlMwTSZR0xxtVAY8DtxyXxYQmZ/FDFrvM84bDjGXOo2IdSu4EV7cLv2/d
         csOpQI6azrpIQJxl+MTfTTYU01aZR38Wcg7h8n7aZ5MUlqixidFDsBHuPWTguuY/oFUT
         Zz5q7fh27/wHN0ZW929ZhyDlNZngBxVtRVGBPss4mKLikVqy6SnJy6OpdO0dhRV0ynaj
         dYaDc/CSg8URRpDbva2arP8M04Q+wylDc9csQvMymCmwcLRYn0IlChhWHLIBGVGJtly/
         CyWB4C1lwg129CySWVQ/Tm4gQewTnGMUD3vnl+MfGHLB845eAtfRQedCswaxtQUhKIRR
         CEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745911760; x=1746516560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB16d46ObHB8u6nVtTntzLBupJconoj9kwzJ3jXfuGc=;
        b=Q+DZ1xGSLzkm0sHK/AhVTI6HOUgIQdfgHb5hYeyOZMm1tDIqvVHPRUPNk1TRia6xrK
         On8LhNrq0HHQyqO8aXM7fDJKPyiSLk5DK/pj9X4BfhXkt92dxvCtmOQ3U8YSPlLhwGOZ
         u6ybSle/r1BwFtgxeyg8cU6l09JWFZaH/hn6KDx9+17RpEPuPXFdNTe+M2WwlgKM2hgM
         knBrzpKLzfloNqKPKeH9rpok+t4KfILlOYk8tDs7NdzxqU8bSbnsv5rj1LX2CYakHCDv
         H5P9QlI8/3IpIutN3Z2dkHWXPva0/Fl8ItQCY0rzTRJlYslVV39Z5XuqLa9DacEIPe5y
         anRA==
X-Forwarded-Encrypted: i=1; AJvYcCVrjJFEQX+WZXnbr3VXiIaHolz+3xTnHWKuwOp2L7IX5GhVfb0F84bUQm1F3htZorufwRAHzCJEYjZgS60q@vger.kernel.org, AJvYcCWHkHZspCQMf6FzWhgrV9qI6cnO8CP8m8r1XdozXKjerHkVJzJVwj8/45pi5bd2UnO4bixsu4S/LiWNGVH+@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVgHPrRnBuZLP/MezfGVUCc/MRGXRzt8vbuT/VylZ3bf55CmT
	OR+MoNycHagJDTgYIdIfTprNAklQwTbWwSHEpDU9jZFX4K5Ohh0KQiQFREG2/wZlm5gwIpwp+Z5
	4Byb+S/35aLTq47Pt5YR3UMkZ/Q==
X-Gm-Gg: ASbGnct2OlNBCC6wbvz4Tz3MDLRGs5P+sLpkA+58eW2DeS74gQvtWS0nINFI4aMK4NP
	vuV/yG59OvzVjjArlMbfckIA+xxPRRSUjTLLw18oNKCWO7OgljY9yLZTyY3CXajqzTN701dJSWQ
	ieTTl6dzWJTSKHjC4S+6Lb/A==
X-Google-Smtp-Source: AGHT+IGYH+/K1GZOU/QSl1r2kiF4KEFaj1inSbQnOFj14BW9qXm19tT4T3PO/rKmu2OgA58JjsRPNok7uGYGfI+sRlY=
X-Received: by 2002:a05:6000:144b:b0:390:d6b0:b89 with SMTP id
 ffacd0b85a97d-3a0894a3cbdmr2251940f8f.50.1745911759877; Tue, 29 Apr 2025
 00:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com> <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
 <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com> <aBB3ElgEoCF6yYNY@linaro.org>
In-Reply-To: <aBB3ElgEoCF6yYNY@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 29 Apr 2025 09:29:08 +0200
X-Gm-Features: ATxdqUG_WUVY9yNmdKHgJ7MZ0Rv5ZBxNNJhPW4Q15-XQGQ2pSpWhkKi8ojC-FfY
Message-ID: <CAMcHhXpstN-g5idywuJbUxeKNqMUTTV=HQ6qvo0_Ann+-mEUbA@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 08:52, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-04-28 20:23:45, Aleksandrs Vinarskis wrote:
> > On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > The change itself makes sense though and I think makes sense to be marked as a fix.
> >
> > Just to confirm, you mean to mark as fix only the 1st patch, correct?
> > Since it's obvious now that the currently present partial LTTPR
> > support did not break anything that used to work.
>
> Well, the way I see it, the LTTPR support is broken on some specific
> docks, even if it works in most cases. And since this fix improves
> the already working cases and fixes broken ones, yes, add the Fixes tag
> to the 1st patch only.

That is not entirely correct. Current LTTPR initialization [1] does
properly set LTTPR to transparent, and then non transparent [2]. In
this case LTTPRs are expected to be trained per link, but are not. It
is reasonable that LTTPR(s) may not work as expected, as they are not
link trained as expected, and now they are not in transparent mode
(anymore).

It does work with X1E onboard LTTPR and a simple external display, but
that is about it. It does not work with _any_ dock that has LTTPR. Or
basically anything that has yet another LTTPR in its way. Given that
max length of DP cable at full bandwidth is 2m, and docks typically
have 50-100cm built in cable for PC connection, not counting outgoing
video connection, this basically means that any DP1.4 and onwards
docking station (not an adapter/dongle) does not work.
Additionally, it appears some fancy monitors with Thundebolt/DP alt
mode ports instead of just DP alt mode also have a retimer onboard
(might have to do with particular monitor support DP-Out for MST), and
also do not work in current setup.
Additionally, it was recently found out that without this series, rhs
USB Type-C on Lenovo Yoga Slim7x does not work either, which likely
implies that IO board on the flex cable for that connector features
yet another retimer.

I wouldn't say it's broken on some specific docks, rather the other
way around, current LTTPR support is limited to 1x LTTPR onboard X1E
devices and nothing else.

Not disagrees wrt to Fixes tag, just wanted to clarify current state
and the impact of this change as it is not limited to just 'specific
docks'.

[1] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/msm/dp/dp_display.c#L378
[2] https://github.com/torvalds/linux/blob/v6.15-rc4/drivers/gpu/drm/display/drm_dp_helper.c#L2926

>
> I'd even send that first patch separately to ease the merging, but that's
> probably just me.
>
> >
> > Thanks,
> > Alex
> >
>
> Abel

