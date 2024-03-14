Return-Path: <linux-arm-msm+bounces-14111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04F87BA8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 10:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31BD0B2371A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F208F5D478;
	Thu, 14 Mar 2024 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUWeeBGl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92846A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710409016; cv=none; b=X17tw/ycaPf/ySebVhw7NihNt7blkvYECYyP31ZJnA2Lyx998yJuYBh5FJ4VB/+GUPyT/JTqq42ynKQNDIjim1Lg3TwI4SkruKLAaDhpXQj4QlAqeIDYN8tmp3ms6egBAoEQgPcYeZnuX15FXzfOUzVUsrPTdLuTHVBpJcSglqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710409016; c=relaxed/simple;
	bh=1kL2QN6WVKz8gSy0PyRVHEePyuYyXifXRN8NSSLj2C8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApeUdDc3/FXjaY/H5kg0F+JJAD/89qcQ5pIv92ggGuJ6r3TSL63Yl/z/HLBnRKBd5o5XssJbBF0RkwbtMv/aU/XeklBc21KpuvAdSMfZ4xO+rtIYZ6hbSvNZrgEzadWmB4tu8gShzkX8ZeNolkFEGqnUvlru6XCKpXq48weUc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUWeeBGl; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-47657316341so40226137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710409014; x=1711013814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFCyko4UygTC+eA1DqHkphcPHLw6z/FvgDsZ8y5K0hc=;
        b=CUWeeBGlWyiP6E1YQSxhVNq28+HtealEt6mX/CZk+e+9zIKM3GCsm0WjhPqrEBS+SN
         UVcZeMAdhCMXcNFNtkPDjhaFFcz5jrnIeSou1Oz6m0cp7RZjQsK807eXwTiME/19jAcO
         rHgbFOfE2sP1pmS2ZD+8T5B/50QNZ+liqwtIB/QZevwrMPNknIit6/ApGJz3vk9srFMp
         ttRsYjF56HllPhG9owIveuRS+fNwUhnErpWLyMqXCd0BmrdTTCidx42VJKiuJTkkS4jS
         WLYpcSXcmGUvL5DyzBNz1gmNANkQt/lptpEIuIqP1S1IBOpBwLoMmVzK0MpxMWkf3qFp
         lQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710409014; x=1711013814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFCyko4UygTC+eA1DqHkphcPHLw6z/FvgDsZ8y5K0hc=;
        b=XofW/7am+R1elclfGq3p10MCnrMOswKlWycPmjwrsRNEj9yERCSNyTCiSOsZMhurHv
         Yuz2mhjPhDQYCawfJJufy57Wdhws6FiUpPdO1RLCHPrtAda/k6YwNVI/Lpn645TwaFsg
         Jt8hTZLoe4BO5mfRfhe4OnP+RIs07KmLsNdaO4IVtwrRQbCPrJt2YF4yst+OwAIP0nmF
         SQ9mqqowQoR2nb1eKBoWjJbF/3rZCqIK5L88t5+yEN8Oa2HDblhR+b8W7x6lufc4x4SP
         KDrQx6ZS9fcLv64CYoW5J67Iuk7jm7ttImG8gM15N3r42/GnPOQA4a+VqEDvVfe6/tGZ
         XXSA==
X-Gm-Message-State: AOJu0YwO9xHotlqiIjg+102ikbSHkjqMR7Q3wGIkYGgkixnaKuXQswQD
	Lmm1FgXwPaQbMAoqJRBZiWASlMJPFZDIs9A+PgIUpMW2LB+KcNDYt9Vkfge8P1huocnTaADD9tA
	h942egZVBvXYr0BrBkuJSeBfKDHl8eAEoOI5ZzA==
X-Google-Smtp-Source: AGHT+IHVz12/u2D9Hz2azuqLhg23uk/LHlBlyaUz+qb/H6DQHAh+NCRPmis06EV6xo04zGds633tyOqTHvVrXys2qzU=
X-Received: by 2002:a67:f744:0:b0:475:fb4c:7945 with SMTP id
 w4-20020a67f744000000b00475fb4c7945mr1506021vso.26.1710409014054; Thu, 14 Mar
 2024 02:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313123017.362570-1-sumit.garg@linaro.org>
 <20240313123017.362570-4-sumit.garg@linaro.org> <4a0a8db7-a2bc-4c99-94b2-c13facbd1bef@linaro.org>
 <CAFA6WYPh5BS_Fpi6ksAC7bwoFEyqjj1Y3EahyQxCG9Pp=KDw=Q@mail.gmail.com>
 <9dc0415c-4138-4867-861a-38b45b636182@linaro.org> <CAFA6WYPFfL18acdZt6O-_=LWnH7J2MooDuf9cA3JCaQZdoLhVA@mail.gmail.com>
In-Reply-To: <CAFA6WYPFfL18acdZt6O-_=LWnH7J2MooDuf9cA3JCaQZdoLhVA@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 14 Mar 2024 15:06:43 +0530
Message-ID: <CAFA6WYNo73S5ROHCMK0ZQSiU0DDbuDadptmaPL+GPCocE0h-mA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC
 board DTS
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, stephan@gerhold.net, 
	caleb.connolly@linaro.org, neil.armstrong@linaro.org, 
	laetitia.mariottini@se.com, pascal.eberhard@se.com, abdou.saker@se.com, 
	jimmy.lalande@se.com, benjamin.missey@non.se.com, daniel.thompson@linaro.org, 
	linux-kernel@vger.kernel.org, Jagdish Gediya <jagdish.gediya@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 14:47, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On Thu, 14 Mar 2024 at 14:00, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > >>> +
> > >>> +             compatible = "gpio-leds";
> > >>> +             #address-cells = <1>;
> > >>> +             #size-cells = <0>;
> > >>
> > >> That's not a bus.
> > >>
> > >> It does not look like you tested the DTS against bindings. Please run
> > >> `make dtbs_check W=1` (see
> > >> Documentation/devicetree/bindings/writing-schema.rst or
> > >> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> > >> for instructions).
> > >
> > > I assumed earlier that W=1 is sufficient for DT schema checks but it
> >
> > W=1 as in make? No, it is not. It's flag changing the build process.
> > dtbs_check is separate target.
> >
> > > looks like those are two different entities. However, I added these
> > > address and size cells properties only to get rid of warnings reported
> > > by W=1, see below:
> > >
> > > $ make qcom/apq8016-schneider-hmibsc.dtb W=1
> > >   DTC     arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb
> > > arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts:96.9-103.5:
> > > Warning (unit_address_vs_reg): /leds/led@5: node has a unit name, but
> > > no reg or ranges property
> > > arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts:105.9-112.5:
> > > Warning (unit_address_vs_reg): /leds/led@6: node has a unit name, but
> > > no reg or ranges property
> >
> > Wait, so you saw the warnings and ignored them?
>
> Sorry but you are ignoring what I am trying to say.
>
> > These are legitimate
> > warnings, although they don't give you full answer.
> >
> > > <snip>
> > >
> > > So it looks like W=1 is reporting false warnings and we should rather
> >
> > Warnings were true.
> >
>
> That's was my initial impression too and I fixed them via following diff:
>
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> index 8f9cacf8de89..a366d3aff3c5 100644
> --- a/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> +++ b/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts
> @@ -92,8 +92,11 @@ leds {
>                 pinctrl-0 = <&pm8916_mpps_leds>;
>
>                 compatible = "gpio-leds";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
>
>                 led@5 {
> +                       reg = <5>;
>                         label = "apq8016-hmibsc:green:wlan";
>                         function = LED_FUNCTION_WLAN;
>                         color = <LED_COLOR_ID_YELLOW>;
> @@ -103,6 +106,7 @@ led@5 {
>                 };
>
>                 led@6 {
> +                       reg = <6>;
>                         label = "apq8016-hmibsc:yellow:bt";
>                         function = LED_FUNCTION_BLUETOOTH;
>                         color = <LED_COLOR_ID_BLUE>;
>
> But it then broke dtbs_check.

See following breakage afterwards:

$ make qcom/apq8016-schneider-hmibsc.dtb dtbs_check
<snip>
/home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
leds: led@5: Unevaluated properties are not allowed ('reg' was
unexpected)
from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
/home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
leds: led@6: Unevaluated properties are not allowed ('reg' was
unexpected)
from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
/home/sumit/build/upstream/linux/arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
leds: '#address-cells', '#size-cells' do not match any of the regexes:
'(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
<snip>

> Are you aware of any other saner way to
> fix those warnings properly?
>

-Sumit

