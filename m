Return-Path: <linux-arm-msm+bounces-17252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D620E8A16A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 16:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 870DC28A541
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 14:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13B514C5BE;
	Thu, 11 Apr 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ReeX4tDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B6914F115
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844317; cv=none; b=nZJzQHfxZP/CSRndU2cVRjhl48pBviSEkKoT/VCmsnrljcTUd9BxOmKgtA9nUUUZAqbEfOphP4gZYWP8w6KxwwWjKDgWmCzdT3E59YPSUFbriDLa/lT0h1tbfnkpft0bCTH/HGeNWECe7k5+c5C7q1m8Mb0APrBktBzkwRuxEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844317; c=relaxed/simple;
	bh=Lx9cFcGpfk6s0y7+78RGZ89/Xxwo/ujlfeLUyEjs1Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JELuUrQ66nUJvPK+Mk7YblkTjL0+c/V7C+qHVecBMkbM/N6JjMkxIjrF+Q0G+IwnSrXYMjgrujLBleYN8l3jgFy2Gc4FH7CZo7af3HXwjH0bmCEnnLl+BzF+3LwxLqfifFw4WjU4p8wFfh/lN+dKQb62SIi+7QnDFSdWiIh+o/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ReeX4tDP; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcc7cdb3a98so7359834276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712844315; x=1713449115; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LdvAFQAqIyq8uAjQoCwRGvy8hAscGhG76lHWAd3Yfhc=;
        b=ReeX4tDPzLABnC5mcZ6qtfjWCWyG3xMukwMRg+cRwfPmhedtV5QKkpL/upDPMRjvZF
         KbspDAp9H4jnfz38f8JFm8c40evccJzO+z8sApEcDFadyuIQ+Yi365wpCtR8ppJtgTix
         Lc0CcgDbyGIjCteYIpH5jWWZftxgykDLQggsqLHGq/hdkGB4XryYDJ9d4BNbVTWvz6wm
         C+bcf9Ge1gM6UOgW0sAA9tQOTnpKUBx8V2gEV4PoVLHXldO0+FolCAnzajfG+WIkI82q
         LuANQBX1aZ6BydNkbg2aABFVY6kO66o8GE3rOlmaQMOmAWdkX1k2R3bH6NcchJeThv1I
         bA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712844315; x=1713449115;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdvAFQAqIyq8uAjQoCwRGvy8hAscGhG76lHWAd3Yfhc=;
        b=mOjLOQMFj+C1WmBmtai9asQByckhqIyFsA5TN1pYfBDBE5OuFhD4nUij5X2YnFp55l
         QEjj4QTia5bX6YrpRn3KcgULf0Lj+F2wLrGIJcl2QV4AMy1NBP0txYar12JAjKKGc4l7
         dP5gWKNnT5lB64cEQP0LEDcE9u/nKQT/qtODWvIh/3ca1oBJsjoFoFuyRfPy2eH2hJE5
         gIB7w+n0C8W7CaaTGaKHfVNU/ipHr8QuOmKsoW7/UzhZkGrEjz/3y9x9fjB6tlICCyOo
         wjs1pNaJ0PDiaie9Eor+c1ppKs1NWXiwwv58LCnvVsjpjaFxekH+Sc24Y4FCGp1+0wvO
         QzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCURGHbXMEt2lFC7naxeSG9zdtMskp71pd6d1ShbFWtSfes+B0hOhneobdTfEoUB0opdqAsYc7cpM3pH2F7Jfy4KYma9aCb4fd1J7eaS3Q==
X-Gm-Message-State: AOJu0YzEdp7YlzTk2MzcUYlPDXhUxJ8X+w1CgcSZI+KURR1qGK9tCFzZ
	/wHTFNr7csNNMC/6rIvpQh5lIV1uUhYuO/BdROyyyXDtDKu47sMPZbXdhXoapnP5s4h0GJgZLl2
	S02W+9J5vLXDNibT2NG5Y44HZ/svgyzy9/UDKpQ==
X-Google-Smtp-Source: AGHT+IEOP+y/Kkxt5waPfyW4BPcwQRgGo/wmVHJAZNTDym7NMYEkurssf0E0z3mRp6tY+g+sbEKMhK0YiGqkPhL1aB4=
X-Received: by 2002:a25:8403:0:b0:dcc:fea7:7f7b with SMTP id
 u3-20020a258403000000b00dccfea77f7bmr5635176ybk.11.1712844313731; Thu, 11 Apr
 2024 07:05:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240411-pm8xxx-vibrator-new-design-v9-0-7bf56cb92b28@quicinc.com>
 <20240411-pm8xxx-vibrator-new-design-v9-2-7bf56cb92b28@quicinc.com>
 <CAA8EJpoL9vCAUgWmHcoxppo_gJqaw_xqdYqcJkS6Xza-5aSh3A@mail.gmail.com> <fa6c8b30-11f3-bd80-67cb-713e4348eccf@quicinc.com>
In-Reply-To: <fa6c8b30-11f3-bd80-67cb-713e4348eccf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 17:05:01 +0300
Message-ID: <CAA8EJpqa=5yaTRHuEiYynTDFy53YPFk4R3q_EV8rmsBN1iR5fA@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] input: pm8xxx-vibrator: refactor to support new
 SPMI vibrator
To: Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: kernel@quicinc.com, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Apr 2024 at 16:45, Fenglin Wu <quic_fenglinw@quicinc.com> wrote:
>
>
>
> On 2024/4/11 18:58, Dmitry Baryshkov wrote:
> > On Thu, 11 Apr 2024 at 11:32, Fenglin Wu via B4 Relay
> > <devnull+quic_fenglinw.quicinc.com@kernel.org> wrote:
> >>
> >> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> >>
> >> Currently, vibrator control register addresses are hard coded,
> >> including the base address and offsets, it's not flexible to
> >> support new SPMI vibrator module which is usually included in
> >> different PMICs with different base address. Refactor it by using
> >> the base address defined in devicetree.
> >>
> >> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> >> ---
> >>   drivers/input/misc/pm8xxx-vibrator.c | 42 ++++++++++++++++++++++++------------
> >>   1 file changed, 28 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> >> index 89f0f1c810d8..2959edca8eb9 100644
> >> --- a/drivers/input/misc/pm8xxx-vibrator.c
> >> +++ b/drivers/input/misc/pm8xxx-vibrator.c
> >> @@ -20,26 +20,26 @@
> >>   #define MAX_FF_SPEED           0xff
> >>
> >>   struct pm8xxx_regs {
> >> -       unsigned int enable_addr;
> >> +       unsigned int enable_offset;
> >>          unsigned int enable_mask;
> >>
> >> -       unsigned int drv_addr;
> >> +       unsigned int drv_offset;
> >>          unsigned int drv_mask;
> >>          unsigned int drv_shift;
> >>          unsigned int drv_en_manual_mask;
> >>   };
> >>
> >>   static const struct pm8xxx_regs pm8058_regs = {
> >> -       .drv_addr = 0x4A,
> >> +       .drv_offset = 0x4A,
> >
> > If the DT already has reg = <0x4a> and you add drv_offset = 0x4a,
> > which register will be used by the driver?
> >
> > Also, while we are at it, please downcase all the hex numbers that you
> > are touching.
> >
> For SSBI vibrator, the "reg" value defined in DT is not used, see below.
>
>
> >>          .drv_mask = 0xf8,
> >>          .drv_shift = 3,
> >>          .drv_en_manual_mask = 0xfc,
> >>   };
> >>
> >>   static struct pm8xxx_regs pm8916_regs = {
> >> -       .enable_addr = 0xc046,
> >> +       .enable_offset = 0x46,
>
> [...]
>
> >> @@ -170,7 +173,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
> >>          struct pm8xxx_vib *vib;
> >>          struct input_dev *input_dev;
> >>          int error;
> >> -       unsigned int val;
> >> +       unsigned int val, reg_base = 0;
> >>          const struct pm8xxx_regs *regs;
> >>
> >>          vib = devm_kzalloc(&pdev->dev, sizeof(*vib), GFP_KERNEL);
> >> @@ -190,13 +193,24 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
> >>
> >>          regs = of_device_get_match_data(&pdev->dev);
> >>
> >> +       if (regs->enable_offset != 0) {
> >> +               error = fwnode_property_read_u32(pdev->dev.fwnode, "reg", &reg_base);
> >> +               if (error < 0) {
> >> +                       dev_err(&pdev->dev, "Failed to read reg address, rc=%d\n", error);
> >> +                       return error;
> >> +               }
> >> +       }
> >> +
> >> +       vib->enable_addr = reg_base + regs->enable_offset;
> >> +       vib->drv_addr = reg_base + regs->drv_offset;
>
> The reg_base is initialized as 0 and it is assigned as the "reg" value
> defined in DT only for SPMI vibrators.

Please don't. This is counterintuitive. We have reg in DT. We should
be using it.

>
> >> +
> >>          /* operate in manual mode */
> >> -       error = regmap_read(vib->regmap, regs->drv_addr, &val);
> >> +       error = regmap_read(vib->regmap, vib->drv_addr, &val);
> >>          if (error < 0)
> >>                  return error;
> >>
> >>          val &= regs->drv_en_manual_mask;
> >> -       error = regmap_write(vib->regmap, regs->drv_addr, val);
> >> +       error = regmap_write(vib->regmap, vib->drv_addr, val);
> >>          if (error < 0)
> >>                  return error;
> >>
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

