Return-Path: <linux-arm-msm+bounces-8263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34D83C392
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D01AE1C22CDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6ACE4F218;
	Thu, 25 Jan 2024 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxXXE2RP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD150A61
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189137; cv=none; b=ke3Bvh6Afhx2DZoWjECax+cK/f3SSAWvm8YAbfrZhQg57Pe/oswN19lOayXegem22puKQ+IMLFNLpsJgbK07zqV8FnLl1pnA980/1FYh5c/iOWfz1Dz7pUQ35lqYydoO5qxSX1FMNH504uW1LwRoIUI4RoPj3gAX5xvQywftOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189137; c=relaxed/simple;
	bh=OvoXaMXr36HVggjnl+7s4lTA9aV8EnYdGkZVjVxpVKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0I05OZWDtdMckhpx+h1Pzd8w0iF8WxTz4zgq+ZIaw/mC/jr+S4k6fMSIFYrT0ElGlL5pH2m2emUfHprKJA0N4n9wEWWxK/bcW6Rk1Q7TUqZ56web97XYR09Rt6A+gkjoBm7XDYrVen8LPy1gnLpbxoFtPUB78N2GlvutfZGoHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxXXE2RP; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ff7ec8772dso59022537b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706189135; x=1706793935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=04Jj3gUDx4n1CBoXEYbBjPXj508msARL9j31AXuBtmw=;
        b=GxXXE2RP+LuGYO5Giqm01iaOYMLf6pQgx0zgXJSQ3Msyggftkc3XscIAsmacSlSXSc
         BoBXVEuP3JeCZ9oij20YDSAwjAPljJnRgiQepCA65HKhsvnCY7ObVk1npS1/J0aZO1ty
         dnz1GKzIWoLzxnKMLZDJYc229SCFg/3oEx5C1/TcdM3ksg0JirWRyaa8IgQ4Ut7l9bA6
         JiEnrcLm81b7oLCJKy/I5X3tmmluxp4v+Pb/w2H5p6d078ere3hlos+2ourSlyh/F3ZL
         XiRK0K2tHRu9H+VtWCFl0nvR6MSGDvg8x9qD3cDh6Fy+ax+q520IXS/U0/SpyBao348S
         FrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189135; x=1706793935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=04Jj3gUDx4n1CBoXEYbBjPXj508msARL9j31AXuBtmw=;
        b=NLHSaTFyJrqzHr+dStRtrts7GcGhp5KOmJE9ikSZ/yhkHvKsXSBlBodV7TRWNsywF/
         0Vp2V9/rlJMUUAVZ+HMxXNqLxp/Li+/tQt7ZnzDx3UhVpiMfmp1i2Hzs2jmWxyjVY1Rd
         MwC7h7zWjDpIRrw/q2zTPXGCyNNOehuhj/Gr+Mygr6oB0wZGERjZ6e8Wag3OmzYKYL7A
         1J7F7VO1cdTmPsLB3id29yVR5kKSpB17oHvrLy2qwXg6yVRgW/oWOcd3WvK2gJXXP2be
         OII3mWkZeh4ZbkM9iUZ5Ty6D7Xl3QacygBUz92lcFVEZzF/iyl+v6hhKDHRw1uEnW6zV
         42Dw==
X-Gm-Message-State: AOJu0YxUb4z07pFtrS/0iD5JIfKe1UxB5zQTFqRX4j6MXp3ECp/9Ws+I
	5/UZdcjP2G7qxSi4DOZJu9agnC5HivsVQk15GAaGhMocRg+EtlZAO0Yn+X8GcYPmEMPsYBZkvYj
	Q2um8yo/hfUgBYYKYi4vPhBcCiNyuO0SSTM25kQ==
X-Google-Smtp-Source: AGHT+IG6+X9niW1NY5fQ6o2t+WTz5uyI4s3lDJ8xJe97M8dmHTqQYap/HzcCJESE1QgHDasZvOUuWxtSszFwGIoMS8Q=
X-Received: by 2002:a0d:e801:0:b0:5ff:7cb4:d200 with SMTP id
 r1-20020a0de801000000b005ff7cb4d200mr639112ywe.17.1706189134373; Thu, 25 Jan
 2024 05:25:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org>
 <20240125130626.390850-2-krzysztof.kozlowski@linaro.org> <CAA8EJprfhZ3m6aKcPsQMAUjDFPPeqN_L-E6Tz604pYJqgSvDZA@mail.gmail.com>
In-Reply-To: <CAA8EJprfhZ3m6aKcPsQMAUjDFPPeqN_L-E6Tz604pYJqgSvDZA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:25:23 +0200
Message-ID: <CAA8EJpoEMsrEp02pLpceMx7fr-j9=xVDiUYt1SKHsF4YCmfvAQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 25 Jan 2024 at 15:07, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > Each group of MSI interrupts is mapped to the separate host interrupt.
> > Describe each of interrupts in the device tree for PCIe hosts.  Not
> > tested on hardware.
> >
> > PCIe0 was done already in commit f2819650aab5 ("arm64: dts: qcom:
> > sm8250: provide additional MSI interrupts").
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 760501c1301a..41f5e6eb2f6b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2248,8 +2248,16 @@ pcie1: pcie@1c08000 {
> >                         ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> >                                  <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> >
> > -                       interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
> > -                       interrupt-names = "msi";
> > +                       interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "msi0", "msi1", "msi2", "msi3",
> > +                                         "msi4", "msi5", "msi6", "msi7";
> >                         #interrupt-cells = <1>;
> >                         interrupt-map-mask = <0 0 0 0x7>;
> >                         interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
> > @@ -2349,8 +2357,16 @@ pcie2: pcie@1c10000 {
> >                         ranges = <0x01000000 0x0 0x00000000 0x0 0x64200000 0x0 0x100000>,
> >                                  <0x02000000 0x0 0x64300000 0x0 0x64300000 0x0 0x3d00000>;
> >
> > -                       interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> > -                       interrupt-names = "msi";
> > +                       interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names = "msi0", "msi1", "msi2", "msi3",
> > +                                         "msi4", "msi5", "msi6", "msi7";
>
> This part looks a bit suspicious. All other platforms have these
> interrupts in a continuous range.

Hmm, pcie1 interrupts are also not contiguous. Okay, fine then:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

