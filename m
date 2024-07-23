Return-Path: <linux-arm-msm+bounces-26880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D8B939F7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7211C21FF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A51A14F9E1;
	Tue, 23 Jul 2024 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAeVsB6U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BE314F9DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721733133; cv=none; b=azkPnSK74VUnAfqM15NG0auqlP5rlMW0wlYWQrkDuTB5G04c+S0MH01IiSrePM9zEGVw3IF3LuY8z48XvKMHhi8Hf0UvTnL72ek7JVJJXEzFm+oQh/7nazKRcC7egh5OswHZDBoRtuMF3qa2bWY82KxNN/Yf8DU3X2xQlY0qVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721733133; c=relaxed/simple;
	bh=IvzIW2clA3I7GZ4v4J56J8ja6IwCiuGy9Lu+qz6Lwgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PV4D89DFeKwl/Sch6pypWl2FlQauOauqg9JyoG4N1vcuGkk6j2YzjwKxjoYyOSSMNoYKqhhhUuM77vPtBGij2+fEdNzmG+6kzUvb2tUiP/oRaP4o+omAvaRDZ51QI2eHWG5+FBk64He3HKMGu50EiRVxOY1aJrMBQIOgiph8k+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAeVsB6U; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6519528f44fso50192087b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721733130; x=1722337930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VY9kR9+u3xGnZyuvPfUJwJjyKQqZEzEIXFGJcOyXF/A=;
        b=HAeVsB6UidUpRNiP3gzF9maf0b/iZHaEbQisFR31OJY3ZdLhIe4h42cYfkeSrTMD2C
         EioCdv0zT7DwBefyplv5gMlbEjbrrThrzMOaw85mnGFXeb/rnOeEIKo0t90FcbMSi5n3
         66CyABxcc3Z4yijmvqiW053d5cka6QDsnBrfHW4SlgJOjW1P0l5J5qh9rSYlcDWMAb3x
         WXXN/z22SPY9HeGSSKAaAmw6fK4mm4AIhgS6bBwMwrZDGNxcB28ehygWU12dISY9sl9t
         RmrNLYcEq++EG7vWsUTC3EWcrvRNaJlsDCijBHWlUlzWEb5878R0bKWvBBv3n+wAB61e
         0TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721733130; x=1722337930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY9kR9+u3xGnZyuvPfUJwJjyKQqZEzEIXFGJcOyXF/A=;
        b=uoHd1uUhW37dAt94ASp0wB4JanOFDLXn0pKjtxaXJwRT4wbO2x2UMfnW535FR0VWRl
         HIziv9OQkrftzirGe8D/UPKY9kdZi1mz+roJMFSSLpyLUlUYc0QAogM+Fk72S7hsH+AD
         gdIaae6YNRYUgRrr3gURnUqNA01o875JB/wFtGA4soGP9VuMdNdMcRa62qK2wDU7SWZC
         YAUyDxX+fXRWZM8ea1cBSdnITBTS0UX0lW76qcygxjcZTLghwVxmg1KTYtC7ntroa0LO
         ceSm1ex5KHMdJoiRh7z/mv34JOCjRIx5IrORgfNRFYn/sekZ2cqwk1pxK3c05HmQ/4M8
         crlw==
X-Forwarded-Encrypted: i=1; AJvYcCW+WIlurOiB46uSjF8RJqpJAKpoRkCgTf152OZQLXW2cCwOIq9psiwtvJMeUkFRfcb+oKs7qFZxx4Klb+NWAUgCa+Aq2in8NtCOss3SGA==
X-Gm-Message-State: AOJu0YyIy3mmHtcLBN1l0GKkVFzUVQT9GB3Dbxa13W5SH4o1PqfpsnLk
	sU2Oyrr2OVHAlp0Q7xZOfxF6a1b7mzaQ6I9oBwfA3A6FsY/JEQx0IScr8drLT77RkcgW8QC+1T5
	RbPQHpKYhDSamWeComSNgAqu9ZSKamU/GYkJLfA==
X-Google-Smtp-Source: AGHT+IFMnTFT7vPcY+Zxr0a0QqBAxxsVv2qmTLZ+m/AsVwQAEBYUMa+4mr/VFc2Y7CyYP17aKtDXJGa2I0EwFghD4fk=
X-Received: by 2002:a05:690c:f94:b0:64a:5ff5:73ef with SMTP id
 00721157ae682-66a654aa5d7mr128979387b3.0.1721733129835; Tue, 23 Jul 2024
 04:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-3-a6483cfe8674@linaro.org> <3a257754-2118-4a7f-9753-f1a2392f9279@linaro.org>
In-Reply-To: <3a257754-2118-4a7f-9753-f1a2392f9279@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 14:11:58 +0300
Message-ID: <CAA8EJppvwXEiNs-6orVMSkkjJu4nYY4ZNdshbB1sUM=z4ouYXg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 VolumeUp button
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 02:24, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> > Add gpio-keys device, responsible for a single button: Volume Up.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 25 ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > index f585bc8ba2ce..bca309ac0cb8 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> > @@ -3,12 +3,27 @@
> >
> >  /dts-v1/;
> >
> > +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include "msm8998-clamshell.dtsi"
> >
> >  / {
> >       model = "Lenovo Miix 630";
> >       compatible = "lenovo,miix-630", "qcom,msm8998";
> >       chassis-type = "convertible";
> > +
> > +     gpio-keys {
> > +             compatible = "gpio-keys";
> > +             autorepeat;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&vol_up_pin_a>;
>
> property-n
> property-names
>
> > +
> > +             key-vol-up {
> > +                     label = "Volume Up";
> > +                     linux,code = <KEY_VOLUMEUP>;
> > +                     gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
>
> No debounce-interval?

Strangely enough, no. See existing defines.



-- 
With best wishes
Dmitry

