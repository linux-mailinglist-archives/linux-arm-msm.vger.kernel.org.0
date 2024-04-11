Return-Path: <linux-arm-msm+bounces-17155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4138A06BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 05:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C01C61C2218A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 03:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A801F176;
	Thu, 11 Apr 2024 03:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ATpRGJts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C723BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806282; cv=none; b=ms8qV+v+VLoraSDhBUs/g38o3wIhlt5J903rvq4+ooJMkeDh0q4IIvkjDVaFlAREWbbmzqOt6caOJ7e7gvBANDmZ2/CHMsCLcgget1xkCsbrGiuyqTWo1MwZRksITRZhy3Gca/kogqUD7I2pfbESwoinAiNva7bsxv20aAwbh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806282; c=relaxed/simple;
	bh=heYo1a1KOC8Rr+IsuUKInwPc+wv9TtCW14Y/0qZpIaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gm/56wYrSYf8jroMlH4Ic/6hmCazuBtn5pEcIWoKEN6jo3kqFeTMD7so5esJJOmMVWDrA0gsbjL5ZFeV6PJ2qla/fvGx5aL8hyeZMAREWPAT9M3RPgq168fYmKE8nmXNj1IN59BcR9mykV5tyRt0/sXZ4cn2LzJartWovJBEzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ATpRGJts; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-617f8a59a24so41243917b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 20:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712806279; x=1713411079; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Moa4MA1KkX6UMmh8Sv0cr8Q+5qJYYe3aKfMwl7lChAQ=;
        b=ATpRGJtsg4fu/Ia1MhHTZwFW0i+u5segnxHvGxQiYw7YWqcLzWq2NzPKnO+RtUrj7y
         5oSM81O0usLgVlpg8icXiXAeFugSGRrCPcQwbaxg706XHWtd1Ny7wr2dNb5BKgfnCgt+
         A7Ip0Pf5ARwwgUBytB4LwzpbXVzumLNBfiNQItrjXXauzjBF2lpv1XGNrlaUZ9xQ6Cho
         86f24h4Bfkk7GMj/gEc0mDd02mk29sSHU9sNGLnQwLZIYgAsjel3HphPEpd/lEeXyiwo
         o4KC8QbrPK9wGz9MnTi56AVdobI8Xn1iqgpL/gCpvcjKmSLO/3eiMmoA6P9POJdE8zdL
         0Mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712806279; x=1713411079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Moa4MA1KkX6UMmh8Sv0cr8Q+5qJYYe3aKfMwl7lChAQ=;
        b=MKAcBOuVyS/rXR+idkafE5Y3hMFjIfFWovfexpiNDP9VxsHoQARdU3a2mN8PGxd81e
         qO6HO+lN5ZZ2kclSU2Qo9SLVYJL5vWwBiUqPTJ92ZIRAmXZ5PRDgi3pzy+6srEYB4qFz
         pjoytjA0ADtl6KcfQGA/bP+iFjeOnA+AfNjUoEC1MRX4p18W0vyrFU3rOhaM1EdA9AiQ
         WMBes8rFKJKHICET8mA9wMAMwRVOWrxEco6fXE2DrbqTLpouacr1cZG4pMryfhpEjUln
         HdWLAARAfxKqbxIP8tYdsBL1GuvDSpVir2iqrKoSmEASpWGLONRtElijxf1Q2jPGczmq
         7HWA==
X-Forwarded-Encrypted: i=1; AJvYcCW3cZAdFtEqpjXA3xpqLO+wKjeQ1U0lk4RLfV3iVoWm0p05bDa/BZyQeRiLR4p7b5i4PD8ZEMYq79v3fWDR9wivBg06hKr2lMQ3IEQn+Q==
X-Gm-Message-State: AOJu0YzE8MMCNmglAcy3B7GnfmRu3aUhko1pInT0RlfOPhl+7U5MPce4
	wMi8UOJwxlFUDWFHshpIj/NTaqzs9iPP0zheSV28Vsvy+6GjTI/2k44Plhi4vt9V6rcXoTwsE7t
	ko2ZaYZJBW6ezcdjvXEde41Hrc49wfvymP1QWNw==
X-Google-Smtp-Source: AGHT+IH+gm7IY0Pw6dKRRmPysnxF+cTGu33/iz4367xCj73QpeV2TdIRr2pZ0EcBeg2WRYVVYFbmys0uKxd2VYn9ta8=
X-Received: by 2002:a05:6902:2b84:b0:dcb:ad22:1b1 with SMTP id
 fj4-20020a0569022b8400b00dcbad2201b1mr4561471ybb.3.1712806279384; Wed, 10 Apr
 2024 20:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org>
 <a1aa0f4a-868c-4386-ba6a-9962f827bb2b@linaro.org> <CAA8EJpoinJ999jYsEhBqoV=J0fB+0_odO_EEXveQdjB3+GfJkg@mail.gmail.com>
 <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
In-Reply-To: <xzb37tt5e23pbsi2usdvtaamxqbjgivwfgd3lbpukoahkcziox@5mwat7kaicjl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 06:31:08 +0300
Message-ID: <CAA8EJppAw9F8OnSW35xmYv_abzYaHp_EKtDgo7hgtE00-UmAFg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: build INTERCONNECT_QCOM_SM6115 as module
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 06:19, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Apr 10, 2024 at 01:12:15AM +0300, Dmitry Baryshkov wrote:
> > On Tue, 9 Apr 2024 at 23:02, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > > On 4/9/24 20:27, Dmitry Baryshkov wrote:
> > > > Enable CONFIG_INTERCONNECT_QCOM_SM6115 as module to enable the
> > > > interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > >
> > > =y for console?
> >
> > I think with pinctrl being set to m it won't reach the console anyway.
> > And earlycon should work w/o ICC driver if I'm not mistaken.
> >
> > Several other Qualcomm platforms also have interconnects built as
> > modules in defconfig. I really suppose that we should move all such
> > drivers to =m and force using initrd. But this sounds like a topic for
> > plumbers.
> >
>
> That currently does not work very well, because if you probe defer the
> UART into the future e.g. systemd will open /dev/console before it
> exist - with no interest in reopening that later.
>
> So, if you care about UART, that is suboptimal.
>
> Resolve this, and I'd be happy to see them all go =m.

Doesn't /dev/console handle switching between earlycon and actual
console? I'll take a look at some point in the future.

But I can't help but notice that currently we have 5 ICC drivers built
as modules (out of 21 mentioned in the defconfig). Should we fix them
too?

CONFIG_INTERCONNECT_QCOM_MSM8916=m
CONFIG_INTERCONNECT_QCOM_MSM8996=m
CONFIG_INTERCONNECT_QCOM_QCS404=m
CONFIG_INTERCONNECT_QCOM_SM8150=m
CONFIG_INTERCONNECT_QCOM_SM8350=m


-- 
With best wishes
Dmitry

