Return-Path: <linux-arm-msm+bounces-59569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E6AC51DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C3173BEAC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8AA27AC32;
	Tue, 27 May 2025 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="darZk/+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E08027A477
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359274; cv=none; b=YdW04dtM/wlTgC8HX9oIqypvSh/ENzbJRHm0r/HVs/vBaATQKyGSg76u7+7KSMHXGUa0dvl93K9znXZ5T2A5j01Psw5MXo7SNta+9U2gSaZyf9v92yBZ9gIeuIXznIpBt9Fd8MGL3bAtexA2+YbSbRlt/a39CP5seRZrSmwLm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359274; c=relaxed/simple;
	bh=feIER1n2xpsKQNWpl7k2prOZxEPU3dBw7oweJY7flpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QQn4eVg816LzD6uq4aqkfKEWlSgnLnJS3DKo6Sp2L6I9L/IY34XevIVt8CS8xfDQfjYVrM9XZxLk17tCSkhwJJXxpg+wKhUgpBKE+nAU0uoiKLFwm4UciE4iFlAgs4yhuDG3aFDek+q33mfhNzaBjuTyl8cwthFDgu/PQ6dqC6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=darZk/+w; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e75668006b9so2798249276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748359269; x=1748964069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T26QWxsDYRdwe+jygmvaCGYR4lil1tNS/Sd5gdRh8Tw=;
        b=darZk/+wewl644jbli4CtHccJ+9GocoWKZSJrDWbc5cF1+h48qxzTCdt7wjmS1ZHLq
         d0p6T9FaLyvo3zZoR4E/qRtTG9e5CA0JKOMfxOstaI3eg1LIuIIOBMpKVxWx5YAO6g6j
         eNEOIbTmGnK2RKngkHI8OtDogpx04I01BcPwWI0JHqdJqOHJrQ6Jolh00t9l2NJs19Oi
         PiEkvmmup7Dp8Y/0z0Omsu6imgiEZ6xmsidbDfuSQ+jUW9hyJvkbfvveFOL0D/tBWdt4
         M09+qnzmVnZYo1oztkmfs9hixO43fD1a+G5iiO9vCHzq1l9LCns+MBH4DL1fCx3a7clY
         C4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359269; x=1748964069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T26QWxsDYRdwe+jygmvaCGYR4lil1tNS/Sd5gdRh8Tw=;
        b=db+Vn+itRydGBDGbLBt+++2cbPIbN/Wx+9R2ha0i363fkPzzN4qcobwMmOFrUSh5Qm
         76DzRDB3dGYoFFMbMLaRv0J+umA7w7+uNnuDt6CMOdJBD9iq1RCd0VhJTP1NRuY2Hu+m
         tfVxNslAGFh8A83D2MkwyWKrvQQYM6X9Gr2uEUSmvsvuH6qQRCweCxOgRe2BE9Ur1dsk
         /d2qBSKb5FYdpDxN6t0FZApYyzGUwsQ7zcGU/1hgcntvBrS3qH+98SPMDExuPiCMbf1I
         R7uoNVnusFpL6coFtOMriIpN6dLK7kHJYd0UCh5NwovWWIhDR05lTGgPK82jyEoAo3Hw
         HdPg==
X-Forwarded-Encrypted: i=1; AJvYcCVxI1D8eu8tWo2uIdjOkuag3o5Aa+qUOU7m3E+aC0EGp0CFrdeJh2yc9oFIvQKg9kv4KDS7NaUBWdS3JXj3@vger.kernel.org
X-Gm-Message-State: AOJu0YysvQAjGqjCBCNcadX1YOUASWBEPeOvn19bE1DN1criFyzvkr94
	vK8L0Oir6mfusBamusdKdoI/ZE7a2ZyBMgZ9FO8XgF55M62A23FVhVFKJ0gJt5nUpU0rHyWkBet
	IfMFNQQmvUboujz2wuzP6zbwQKiT3L3A90ciKCi4/zg==
X-Gm-Gg: ASbGnct9yEAMmR84QFCfCYm4W2oB7t2fm15YzGXsK+a7u/qCH6UBR+9jVGllAPrb2Nh
	AmZTQ2BTPMo42HxyxHAmysZYmmuDJz2+VyvY2J8yH9Ebu3FgieLJHqqNhwBqPYdxpPqetILZjSD
	F9pS/OLEOM4RSCQatrwaTyscsHsXgwM6Oyvw==
X-Google-Smtp-Source: AGHT+IH/iWKlaJIOwwRRhHBUl6rn1YTO9wfSe6HoJ7K+FHwMi4NybUGi3rIIMKVONDR+tqmdCwj/bwwpq7pLo5d6Rg4=
X-Received: by 2002:a05:6902:20c7:b0:e7d:d151:e556 with SMTP id
 3f1490d57ef6-e7dd151e722mr592915276.32.1748359268966; Tue, 27 May 2025
 08:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
 <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com> <CAA8EJpoLLDXFQk-ViuaioKrECzMV0aUrcOj4v+Ufs4oHY53mrw@mail.gmail.com>
 <064d3eed-c2ea-4b41-85b2-d2a5a922f8c7@quicinc.com> <ehgjdszjr34xppmkrkicb4pnq326nor26tqu2ekop6ew2j3y3h@pm45aiipzuc5>
 <48c73675-a73f-46f1-81a9-f701a2cf00a5@quicinc.com> <c1ebdaf1-92bb-4f73-bca9-35246d7c10e1@oss.qualcomm.com>
 <ca83b841-aea0-4233-93fe-02a7b5985af4@quicinc.com> <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
In-Reply-To: <1a0a5178-fcf0-49b6-8e4c-1393c0f4f229@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 May 2025 17:20:31 +0200
X-Gm-Features: AX0GCFtNeoZFAdW7ml0tNasl6TrIjJWlidTZH10tWfMXfVPVyLDdbwWdfrkKgJc
Message-ID: <CAPDyKFo9gUOB0VhQn=zD0RDM0=8wO08=VmA6XkHv0EN7M89bjg@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_cang@quicinc.com, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 May 2025 at 17:41, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 21/05/2025 18:36, Sarthak Garg wrote:
> >
> >
> > On 5/21/2025 8:19 PM, Dmitry Baryshkov wrote:
> >> On 21/05/2025 17:35, Sarthak Garg wrote:
> >>>
> >>>
> >>> On 5/21/2025 6:25 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, May 21, 2025 at 12:46:49PM +0530, Sarthak Garg wrote:
> >>>>>
> >>>>>
> >>>>> On 11/15/2024 6:53 PM, Dmitry Baryshkov wrote:
> >>>>>> On Fri, 15 Nov 2024 at 12:23, Sarthak Garg
> >>>>>> <quic_sartgarg@quicinc.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>> On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> >>>>>>>> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> >>>>>>>>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> >>>>>>>>> This enables runtime PM for eMMC/SD card.
> >>>>>>>>
> >>>>>>>> Could you please mention, which platforms were tested with this
> >>>>>>>> patch?
> >>>>>>>> Note, upstream kernel supports a lot of platforms, including
> >>>>>>>> MSM8974, I
> >>>>>>>> think the oldest one, which uses SDHCI.
> >>>>>>>>
> >>>>>>>
> >>>>>>> This was tested with qdu1000 platform.
> >>>>>>
> >>>>>> Are you sure that it won't break other platforms?
> >>>>>>
> >>>>>
> >>>>> Thanks for your valuable comment.
> >>>>> I am not sure about the older platforms so to avoid issues on older
> >>>>> platforms we can enable this for all SDCC version 5.0 targets ?
> >>>>
> >>>> No, there are still a lot of platforms. Either explain why this is
> >>>> required for all v5 platforms (and won't break those) or find some
> >>>> other
> >>>> way, e.g. limit the change to QDU1000, explaining why it is _not_
> >>>> applicable to other platforms.
> >>>>
> >>>
> >>> Thanks for your comment.
> >>
> >> No need to.
> >>  >> I agree with your concern but for me also its not possible to test on
> >>> all the platforms.
> >>
> >> Sure.
> >> >> Lets say if I want to enable this caps for QDU1000 for which it has
> >>> been tested and on any other upcoming target after testing, then how
> >>> can I proceed to enable?
> >>
> >> Let's start from the beginning: why do you want to enable it on QDU1000?
> >>
> >
> > QDU1000 is one latest available target where we have enabled this and
> > tested. This has been enabled to save power.
>
> Isn't it a powered device? How much power is the save? Is it worth it?

Just wanted to share my view around this, in a slightly more generic
way. My answer to the above, would be, yes, for any battery driven
platform, it should be worth it.

Unfortunately, I don't have any fresh numbers to share for eMMC/SD,
but just searching for some vendor specific information about their
eMMC/SD cards, should tell us I think. In fact, this problem isn't
even limited to eMMC/SD, but rather applies to most flash based
storage (UFS/NVMe etc) that are used on these types of platforms.

How much there is to gain, obviously depends on the internal behaviour
of the storage device. Of course, the number of cards being attached
is important too.

That said, enabling this feature (MMC_CAP_AGGRESSIVE_PM) needs to be
done by taking into account that being *too* aggressive (too
frequently) with turning off the power to the card, may cause a
potential wear-out/brake of the card if we end up preventing it from
doing internal house-keeping for too long.

The current default autosuspend timeout
(pm_runtime_set_autosuspend_delay()) is set to 3s in mmc_blk_probe().
That seems way too aggressive in my opinion, so perhaps increasing
that value to ~180s could allow us to enable this, even if 180s is
just a guesstimate from my side.

Also note that, during system wide suspend we always turn off the
power to the card - and we really don't know if that is too frequent
too. It depends on how the platform is used, compare a laptop with a
smartphone, the frequency greatly differs.

Kind regards
Uffe

