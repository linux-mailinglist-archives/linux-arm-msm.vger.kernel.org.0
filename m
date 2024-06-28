Return-Path: <linux-arm-msm+bounces-24582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39E91B967
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 475431F22A91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057E4143C4A;
	Fri, 28 Jun 2024 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AqEK5PJ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2C4436A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719561909; cv=none; b=T7aQhNZDGXn36xAqVzBG+U/hK9xNcsbNdL7p8gDkdCkvBdoGLTj5tCp5NFKgv18n+omUqfNygbB79WJdjkKvAYy0vSZk07f7MvIREsGK2Y47XsKl1C8oJdA+/7a2HJir3orsPxXMjmszwtYB4N0ltSVwmAPp1HejkMMZjBH2+Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719561909; c=relaxed/simple;
	bh=JzJrqoFrrLlYjlFvyfWzcuywlzt232DBEfu3youbBSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdZGwEI6JpJ3JBqrJdxOoiqa+mM/1zV/Urw2nL0G6BTG4wCUMAJQNOEG6Zg5W0CY+AdEEAiBUMG1tz1c7cBAgj5psFllmN5vPEvni9rrA2zQwi9rtkB3U27gTYqHt8lnj5Pa+bHfBhHKb0a5rHDJkIViPcrJuliDsWsXS/dBrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AqEK5PJ2; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-44644b8db9dso1671491cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719561907; x=1720166707; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JzJrqoFrrLlYjlFvyfWzcuywlzt232DBEfu3youbBSY=;
        b=AqEK5PJ2rxoIIIVQwXxRwNtPUpvxZNTbk3bFdnjTil6t4j9gHmOO9f6sn6LomA1z73
         2If5fklFrF6ABz0j9aH8I+qYOdcIV9Ny9JHROITlwzF3UqtzcsTTjRfUPgl/DASBPTgf
         L/eMf0v/jdf8UYw+9NiH/V4Yy1xyqDuFwpBBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719561907; x=1720166707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzJrqoFrrLlYjlFvyfWzcuywlzt232DBEfu3youbBSY=;
        b=eUsbhLWHURRtRnk56NXn2MPtBj0FkqkARSyXEBJs/LbbE1BTrdp1dFELodmfSvJLbK
         iF4Ymor96LP1Mq3Qkdnks1qbu7voixok0M/TC3CDZKPFE6Sk+Zlgt1BgZPl192yiBFHw
         2sz7+yPqu8X/YMgUMoncNWgYG+LHg9UEmUgbw4jGVUlqdCfaDDtukuK5dd44lQAPenRC
         ofECNaQsqvhRV3iVbH1uPq1ITP0jrUx86YY+xlcDUf13zSo3He9HFwAiS/Spe+AbIuie
         U3Hz5GGlvvrSm1sgj9Rm1VCSvZtifndyDLRsn2RKVTOhdnoAzq3M9GGij2dyAMjf1ZM1
         62kw==
X-Forwarded-Encrypted: i=1; AJvYcCU8SVsInnIxooDUWTn3VKMYF2Ut+Lqv7xTcpql8SiZFYcsuT9RhREUcKEI+CzxgeJ4gPxAM5SNzxWewPxkmQI5kZ8U48lGHzQjmfVYTew==
X-Gm-Message-State: AOJu0YxhAxGj1inPs0pvGAtZdNxNWkrL6gWmyeqFXIkKrb0UDzI6Q/wh
	uv/jPrwd2poc4zlL2nNHyIJh4PElpRX0Wgc/IRCYYQhHGofbFtYz9EaPu6p/SP8BL4dFeWSIG5k
	Dcbed0TmFvd4tfm2WklFCBpdK80fVPsSip7L4
X-Google-Smtp-Source: AGHT+IF0otSsDTnS1XWFIT01k1cgVlGvDRjEaZz815q/WnFkdlw4tS8NYw01YMmeU5bEvep9bbqcDylPNPoaN8d4UEU=
X-Received: by 2002:a0c:f10b:0:b0:6b5:4b10:7849 with SMTP id
 6a1803df08f44-6b54b107986mr143489446d6.1.1719561907384; Fri, 28 Jun 2024
 01:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <CAFLszTjexpNEjo1sGVs67L0CAgGZLNkyn9RGfHRD7iHak_mtmg@mail.gmail.com>
 <20240605100246481-0700.eberman@hu-eberman-lv.qualcomm.com>
 <CAFLszThbe_aUAq_5rCCiPV-bj60oq9UCc=vdDHwM3i6t44ohLw@mail.gmail.com>
 <20240621142054973-0700.eberman@hu-eberman-lv.qualcomm.com> <CAFLszThO1doxsXSYTrTTPy9QCW4hrBb07k0VdSNWip=4MKtTnA@mail.gmail.com>
In-Reply-To: <CAFLszThO1doxsXSYTrTTPy9QCW4hrBb07k0VdSNWip=4MKtTnA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 28 Jun 2024 09:04:56 +0100
Message-ID: <CAFLszTiACk98KaqA4Aa65d8ck9iJZevQyeFfq90JjsyZhx_HjA@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/9] dt-bindings: hwinfo: Introduce board-id
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amrit Anand <quic_amrianan@quicinc.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Julius Werner <jwerner@chromium.org>, "Humphreys, Jonathan" <j-humphreys@ti.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	boot-architecture@lists.linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Jun 2024 at 08:33, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Elliot,
>
> On Fri, 21 Jun 2024 at 23:40, Elliot Berman <quic_eberman@quicinc.com> wrote:
> >
> > Hi Simon,
> >
> > On Thu, Jun 06, 2024 at 10:00:54AM -0600, Simon Glass wrote:
> > > On Wed, 5 Jun 2024 at 11:17, Elliot Berman <quic_eberman@quicinc.com> wrote:
> > > > On Wed, Jun 05, 2024 at 07:17:35AM -0600, Simon Glass wrote:
> > > > > Hi Elliot,
> > > > >
> > > > > I am just picking up the discussion here, which was started on another thread.
> > > > >
> > > > > I can't see why this new feature is needed. We should be able to use
> > > > > compatible strings, as we do now. I added a 'usage' section to the FIT
> > > > > spec [1] which might help. I also incorporated the board revision and
> > > > > variant information and some notes on how to add to the available
> > > > > suffixes.
> > > > >
> > > > > Does that handle your use case?
> > > >
> > > > -rev and -sku don't fit the versioning scheme for QTI devices, so this
> > > > isn't a generic enough approach. Patch 5 in this series describes the
> > > > versioning scheme for us.
> > > >
> > > > In the other thread, we had talked about using some regex based approach
> > > > for matching the root node compatible. I haven't had chance to work on
> > > > that proposal and will try to get to it in the next couple weeks.
> > >
> > > OK, I look forward to it. Please do check the FIT best match approach
> > > and see how it might be extended to handle your requirements. So far I
> > > have not seen a need for regexes, but it is certainly a possibility.
> > >
> >
> > I spent some time collecting feedback from the team on using compatible
> > strings + regex-style approach and we're not able to add a regex library
> > into firmware, so this approach unfortunately won't work for us.
> > Because we have more axes of board identification than chromebook, using
> > FIT's compatible strings isn't a scalable solution for us. I don't think
> > we have incompatible problems, we only have more than 2-3 axes of
> > information.
>
> I understand that. I assume that you have a lot of devices that use
> the same SoC but different PMICs, displays, etc. Some of these can be
> handled in the bootloader, e.g. by detecting hardware and applying an
> overlay, or enabling/disabling a node in the DT. It can be useful to
> have a hardware-readable ID to indicate things which cannot be probed,
> e.g. with GPIOs or ADC + resistors.
>
> Another option is to give names to your projects, so that machines
> with the same SoC but major hardware differences end up with a
> different name (see rk3399-xx.dts for examples).
>
> I'm sure you are already doing some/all of these things. I still feel
> (so far) that you don't need to invent something new here.
>
> Re "FIT's compatible strings isn't a scalable solution for us", how is
> what you are doing different from other vendors? Is it the sheer
> number of variations, or something else?

Here I am referring to the actual number of separate boards which
appear in the wild, not the multiplication of the number of axes which
produced them.

