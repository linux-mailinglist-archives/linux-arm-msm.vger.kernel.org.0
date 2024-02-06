Return-Path: <linux-arm-msm+bounces-9952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA6784B65D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 14:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50F9F1C2434B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69567131734;
	Tue,  6 Feb 2024 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IPBgApog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E6130E55
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707226246; cv=none; b=jAKV4SiHCM/sh89icZTAXI9nKoL0dzSY+vBiaDeG6BSTWxosEYUxXl/zvtx5hH/+o/J5G9CatlCOab8NkFYgLCGB92iidUIq8DBqlIHVwxU6jjQLoc5kD6Au6VFrPAMFurTVM2bCND1ghk8AKWU+tIyOxa9cM+0oSpwGSCyQEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707226246; c=relaxed/simple;
	bh=6VbChb8VlwrzRgsUUaCn3bmmMTjtrFKEcChykrRRa7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJVgCJI1pyEwmOJTDD9K41iOaFxK6IDbPzvpwqcL2186LE1Yhn1/BmPcjVu67odipSvxFN54aC25j2F9c4x7l5dbm43HrwgCM2iRN9TSs0YsaDlEzomxoFGwGpVbNflVjJ0a/i1vV42UXm3jGnHTfB/1C7LcWFylw7pRbP3z18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IPBgApog; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-60482a5a570so3003377b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 05:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707226243; x=1707831043; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=syfT8eZHmDCYmUwPnVQwDnxlPKhwhANY4vE7QqK4U6k=;
        b=IPBgApogxKt23uKUqzYjJ8luOCVRwvnK7NNr5xG1vV+1yKc+JNv8uaj7F4y3eFdYYR
         6WvMtuXWsBPO1jYEX1/7KReRT2C8+BTtsDxYLyMJLO3mG1tdMujPKMXcvORnI+OLGm+u
         kUNlOMOfRhsu4DF/nlvq29GrbsXZAQ9STpXyBLYj+uBViGIUaMITj76+rRrEfFa3Wu9i
         /WISxRLgOA6xElvpGBPLDWF6bix0cPYvSxSpkgJNR3hwzWf+W3lit+tUO2g8YG+KStXt
         w9Cg/vKOlcZCcu9GxisAy36S07jrbDC6afC8p5tHUS11T8c2gaNrpwKXSPLUYcm0jBso
         XmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707226243; x=1707831043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syfT8eZHmDCYmUwPnVQwDnxlPKhwhANY4vE7QqK4U6k=;
        b=P4C67sCWf5+fIAJKw8pIyoUbYpARdvEICdFJNydMjulq0Lq3DZhdpoXF5a/lCrIWpw
         z/68wvLTW59L5+lzMz9f/zHPN5DFwTyJRfNKbhqeN4HKI6SlJH+CKWGVJp35OXts7C+6
         91OcOEudsj1vYGXAJ3n6xAicUFqhLutR3YmtJ87g0bl/IQNt6jCP9dcjICAP5YUzNIaA
         DmK3McFNm56w0iMFeIm7JS6+sqwEzgoghgELC3AK+SIhzlhNu9uOLjay1NOUqqdIG2Av
         uBUSWDt8tWBW1fvkw/oLWAdyHCMsM9SoeaSq5kSexttLkxoIfD7c3rNexiliu+o/Ur+Z
         PNuQ==
X-Gm-Message-State: AOJu0Yz2JhNoXZyreGvTArSpn8i+ZY+ItnOMjd3lM3sLf8E5rao+L3rc
	4I6CJagGMY91mNm8U6CDFHUuA7yK00R17P8kR2mmpkzWK7+Apk4F6OZYAXonS8RLgpkxU9DZqXY
	MZ2yuotjqmELv1bHLccIECNVeo7H6hNR5fCBEAg==
X-Google-Smtp-Source: AGHT+IE+A6XGfktoN6cav/aXNcdoQV3nEH/WbzUebIM5l2a1eOc8bsPqnC8A2xG+TIos9NyM514FTU6z1fXPxsLUJMw=
X-Received: by 2002:a81:b349:0:b0:604:2c8:e49f with SMTP id
 r70-20020a81b349000000b0060402c8e49fmr1309737ywh.50.1707226243569; Tue, 06
 Feb 2024 05:30:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206114745.1388491-1-quic_kriskura@quicinc.com>
 <20240206114745.1388491-4-quic_kriskura@quicinc.com> <23824242-1b37-4544-ae9a-0a5a0582580e@linaro.org>
In-Reply-To: <23824242-1b37-4544-ae9a-0a5a0582580e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 15:30:32 +0200
Message-ID: <CAA8EJpqbXvKMQktGsxMFJnR+fXoOz8hFmm+E3ROPTjjiD0QLvg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sa8540-ride: Enable first port of
 tertiary usb controller
To: neil.armstrong@linaro.org
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com, 
	Andrew Halaney <ahalaney@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 15:28, <neil.armstrong@linaro.org> wrote:
>
> On 06/02/2024 12:47, Krishna Kurapati wrote:
> > From: Andrew Halaney <ahalaney@redhat.com>
> >
> > There is now support for the multiport USB controller this uses so
> > enable it.
> >
> > The board only has a single port hooked up (despite it being wired up to
> > the multiport IP on the SoC). There's also a USB 2.0 mux hooked up,
> > which by default on boot is selected to mux properly. Grab the gpio
> > controlling that and ensure it stays in the right position so USB 2.0
> > continues to be routed from the external port to the SoC.

What is connected to the other port of the MUX?

> >
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > Co-developed-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > ---
> >   arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > index b04f72ec097c..eed1ddc29bc1 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > @@ -503,6 +503,18 @@ &usb_2_qmpphy0 {
> >       status = "okay";
> >   };
> >
> > +&usb_2 {
> > +     pinctrl-0 = <&usb2_en>;
> > +     pinctrl-names = "default";
> > +
> > +     status = "okay";
> > +};
> > +
> > +&usb_2_dwc3 {
> > +     phy-names = "usb2-port0", "usb3-port0";
> > +     phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
> > +};
> > +
> >   &xo_board_clk {
> >       clock-frequency = <38400000>;
> >   };
> > @@ -655,4 +667,13 @@ wake-pins {
> >                       bias-pull-up;
> >               };
> >       };
> > +
> > +     usb2_en: usb2-en-state {
> > +             /* TS3USB221A USB2.0 mux select */
> > +             pins = "gpio24";
> > +             function = "gpio";
> > +             drive-strength = <2>;
> > +             bias-disable;
> > +             output-low;
> > +     };
> >   };
>
> Isn't gpio-hog the preferred way to describe that ?

That depends. As this pinctrl describes board configuration, I'd agree
with Neil.


-- 
With best wishes
Dmitry

