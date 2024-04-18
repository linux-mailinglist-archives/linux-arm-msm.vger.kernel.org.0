Return-Path: <linux-arm-msm+bounces-17860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61548A9D9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 16:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 157F21C20AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 14:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD23168B0F;
	Thu, 18 Apr 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZzHALMOV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C13161933
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713451906; cv=none; b=C6CiSFwHjQj9dI31WEjtg6FF4o9mLL5YyxpD9lc9G9/qM/WTMr0l5wThb11em+xEheuvRAr6tnHSRkcpXO2z+MUUfx6Bi5sHOoNWQLIY2aHozrzAqGpKj8JWXbY/VS76K0d0vziGp8avx5KhA0LzYsyVgpo/eLoqQjqc/0IrQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713451906; c=relaxed/simple;
	bh=CbuQk1PghdDnmrxhojCwmpRorta2iCVuoxXGBVbnZE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sj6sboMvqvmR1HWP4VCv4wljKkZD82CdwNHhTzHnEQPFgnsoxR3It4XCM0DUz/pgHF8jPCRxoHE2loyr2aIozx/W+QiYKVidUJPyGm7zaupc7Gg0L3l+dfYava3DCze+w5a5S8LJ+QCy4w/jYDrb7Uu9LkGuGW8IoQU4PIArq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZzHALMOV; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-47bb81424adso454995137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 07:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713451904; x=1714056704; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=ZzHALMOVA9TRqzfRqObLBbDmonwDulpNU26i/BDKA6JOpES3l348SzWHsUzq8slbZf
         JZKpsxVxPjPcG08/vM036ufmiB9vg+yQ6VJH3nfKet/NIlmiPyMI1JUpxdRYZZ0gWa5d
         Mrgo0YwNlZLoiG3VikvLUq96PCNJAjx1BYUTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451904; x=1714056704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMqAEiiN7av4J6wM+O4afdcaiaOjYq8V1FKf5PLPclI=;
        b=EiMxJlLBK/jWczriHmdWH5ufcyamksEkJubnCGqgL/Wix2mGu8FdDFWpa0uayhqTgH
         cgZrbcyTJxF4dK8iY+fefscrs75WcwD0pkZKOxA+7O2MoqGVT1D7mLEpnDtjknQr/mfg
         q4iLGjFW44IUXSUJT5eFg970OMx9zMURqqKkmvtFYOemzL5M3j8D/Nb1l8EJY2U9WU3L
         9Rw5yqG/LAMRlMw0frxFk3TEUf2hRkFZL/qLvXjp+OYJypuuA5dUIrp/oU6RE3EPqnXr
         /svJlusGxK9qs7re4psgg8hbBqLTeNSKT9hMePBA9SrJAiqyVeqrdyOARek0Wv9WSjnm
         hQKg==
X-Forwarded-Encrypted: i=1; AJvYcCVpqwW+KMgb1/avBfyDDLPKBPwUKmDD66L/Rk5PQYjR4ZPv2DYAGnvZb1cLhLXLWnkNgZVgZrskSMkosLIyG6Xxl8RnSz1OQNLLU6RV0A==
X-Gm-Message-State: AOJu0YxJ1hsU2OKCOVykHMhkFf99Hunnel6CfHklX/Pr/zJaaxzCqWP4
	umsHaUFgExAV3ETYvR+IQHJIbrXY7It+COPeuo+ofPKe4KDJ7OrgjqYIMWuFitridw3XzpmGMp8
	=
X-Google-Smtp-Source: AGHT+IFeuUa0HYrUgVsdgS/4PnrqSEUGQQ9LRKJbrtpjdkfgiKDDv4X+yx7kcKYs818nvrAzYCDnlg==
X-Received: by 2002:a67:af17:0:b0:47b:a6ef:bb3e with SMTP id v23-20020a67af17000000b0047ba6efbb3emr3608783vsl.2.1713451904043;
        Thu, 18 Apr 2024 07:51:44 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id k23-20020ab07557000000b007e11335302bsm167716uaq.12.2024.04.18.07.51.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-47bb81424adso454958137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 07:51:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzLaaVuMxDOzefwsgvveYaZgnS0CUz9pcAHUVXOXPBe00tLrAHL4d9znqamduaCkdkFGvqE2C12IpRuF86QFDu+xzBGG/BzmvWDSYkjg==
X-Received: by 2002:a05:6214:4a5b:b0:6a0:4571:e0c8 with SMTP id
 ph27-20020a0562144a5b00b006a04571e0c8mr3999896qvb.18.1713451882078; Thu, 18
 Apr 2024 07:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
 <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com> <20240418105310.GV12561@pendragon.ideasonboard.com>
In-Reply-To: <20240418105310.GV12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 18 Apr 2024 16:51:06 +0200
X-Gmail-Original-Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Message-ID: <CANiDSCuS3KQK9H37sDZJ+mcqheNSh7NBwchS3dPccVXcPTSNRA@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Oleg Drokin <green@linuxhacker.ru>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Thu, 18 Apr 2024 at 12:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Wed, Apr 17, 2024 at 06:19:14PM +0200, Ricardo Ribalda wrote:
> > On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart wrote:
> > > On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > > > In my opinion, it's better to just ignore old warnings.
> > >
> > > I agree. Whatever checkers we enable, whatever code we test, there will
> > > always be false positives. A CI system needs to be able to ignore those
> > > false positives and only warn about new issues.
> >
> > We already have support for that:
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads
>
> Those are manually written filters. Would it be possible to reduce the
> manual step to flagging something as a false positive, and have a
> machine build the filters ?
>

Do you expect that the list of exceptions will grow?

I hope that once the CI is in place we will fix the warnings before
they land in the tree.


> > But it would be great if those lists were as small as possible:
> >
> > - If we have a lot of warnings, two error messages can be combined and
> > will scape the filters
> > eg:
> > print(AAAA);
> > print(BBBB);
> > > AABBBAAB
> >
> > - The filters might hide new errors if they are too broad
> >
> >
> > Most of the patches in this series are simple and make a nicer code:
> > Eg the non return minmax() ,
> > Other patches show real integer overflows.
> >
> > Now that the patches are ready, let's bite the bullet and try to
> > reduce our technical debt.
> >
> > > > When code is new the warnings are going to be mostly correct.  The
> > > > original author is there and knows what the code does.  Someone has
> > > > the hardware ready to test any changes.  High value, low burden.
> > > >
> > > > When the code is old only the false positives are left.  No one is
> > > > testing the code.  It's low value, high burden.
> > > >
> > > > Plus it puts static checker authors in a difficult place because now
> > > > people have to work around our mistakes.  It creates animosity.
> > > >
> > > > Now we have to hold ourselves to a much higher standard for false
> > > > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > > > Drokin has told me previously that I spend too much time trying to
> > > > silence false positives instead of working on new code.  He's has a
> > > > point which is that actually we have limited amount of time and we have
> > > > to make choices about what's the most useful thing we can do.
> > > >
> > > > So what I do and what the zero day bot does is we look at warnings one
> > > > time and we re-review old warnings whenever a file is changed.
> > > >
> > > > Kernel developers are very good at addressing static checker warnings
> > > > and fixing the real issues...  People sometimes ask me to create a
> > > > database of warnings which I have reviewed but the answer is that
> > > > anything old can be ignored.  As I write this, I've had a thought that
> > > > instead of a database of false positives maybe we should record a
> > > > database of real bugs to ensure that the fixes for anything real is
> > > > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

