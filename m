Return-Path: <linux-arm-msm+bounces-33361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CA1992C56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91C1E1F22F65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 12:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5041D279F;
	Mon,  7 Oct 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dl443a54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAC31D3185
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728305234; cv=none; b=fV7D5nHAwKwds3RG5SindNx2a7c6xNEwA1Vk/+DyrCcqhqtDE1Z/X7mKT4Z6ak2tz/Lib61z5y9ZqDqXR6yGNIHd7nABaDkN/vUh/SKGncIBLZuvdhdFZTovssUgJIX60gE1zRQH2t2tnGuXhaQ06Bqp37JKbNUGdEpQkjVnYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728305234; c=relaxed/simple;
	bh=jo6zA17WYEVKD4kAqrD5bI/uK/hqU/C2jgKYXrjvDXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H0cWO8VIi3iV/e60HWDwL8JogcRJ/YSLFvv/YTZFiWKG4z3TeLLMmAg2RG0UZ3Goyng5UanGYqooV4Rc4GclS4PG6VbRfLtOXb67u+eZ3XxPW9Aa8BpFApgv8KNj1ogh5m/iGAOEKUwuWd55fIp6fmeh2ZrGIS8ZEVVwVLrL1B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dl443a54; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2e4237da4so13685487b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728305231; x=1728910031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OCFd3AswX/UvsHDjGk8fmcWJKuiqqQyLNfZu18RpBKc=;
        b=dl443a54a0VaC4qwaIDne7ufYge0BK6G6DjDTACR6ZyR40oJpVBnQk0FVnC05L9qkB
         lpGH8K1T92tCZ1mnQmfFPlIybdYCQOM+RGg+9pyiqL51qBUDxOJ64H196UVcA2YxgknA
         TybBNuK3rD3KUD5ltU6pItFrBxi1eHVL/SNgMuveGP3w1i3XM4Z8oCcSQn8KE6HYc2tz
         UsmGb+difN4H6wAvvW/DoO3BcUmrw7vqFDJzhQ3nOmr/WQZwnpLkBMkIh6w+VdRqvWiJ
         zlMVrf7E1kjXcWUXweGAh3uYZDr47J+xIcz2WIt5Yylkwmzt6/bOzPtC+huJCEOHYjt1
         rVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728305231; x=1728910031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCFd3AswX/UvsHDjGk8fmcWJKuiqqQyLNfZu18RpBKc=;
        b=to8VG1sV3NqtrtsNp2mM5A4f27iz/5TdhgpzDd6VozCt3QyHc9pXULFm8hJqyEjDJW
         iiiQTGQ7IW3ioer+ldBlgC0iLti3jBJehAtgQCj6vQ2IC5/t+RPgNDQ79yCkAlpNtvwt
         /reH/PEXsSQHorCo2f0GosFKU9jakIN/Pn5Su0oaXOJr5RGHtc7iUUZ70KLTjMQSLlPf
         Pccha25Ly+VPZHZE9H0sTinZvpeCy0EFAxw+CpD9UyzJuwbZ7z9gsjjY1yIwCNxEYBV7
         vkyfdA4BctpCa1xU1LHtRTNKAtVU7phuPNU32tH04jNz/QgPqM40bRg/55ft7h1wSAb0
         EF9A==
X-Forwarded-Encrypted: i=1; AJvYcCUYJ08+ZN3pV43ToThMaMCUM7M6m7LrZyW0fJYREYzY+4jynfFYRpwVDBiz6aZ4kwHdRVbgeeWcXWWj7JBI@vger.kernel.org
X-Gm-Message-State: AOJu0YxguBNMa+JOJ6J1yMLwZwtITHlBpxMFNP2AMU01WcqHT8V5V9dU
	V3JmmDYAxKQGbp6AqLcZu8/zC5Dtbq3Jcp7ZnFqy4mh+PVhc81oczwLYAmDx4gNLYIDYWPNDp4n
	pyUtThtD7Tw0mMdGHWVyAtRKruwYrz58kxXvWmg==
X-Google-Smtp-Source: AGHT+IHcN86fNTn9NJS9sEdYsHveChw5c5a4u8Q17Bg6k1OV8AmiweKXXUKwE6aCQZaVkcm5WHu+zP0RnPEZbICAVoo=
X-Received: by 2002:a05:690c:6609:b0:6d1:41:5b35 with SMTP id
 00721157ae682-6e2c6ff649amr82400577b3.13.1728305230862; Mon, 07 Oct 2024
 05:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
 <fshhw6lknar4z36rc2sjjcgkiixpp7hak7gq3j373mjvbokax3@7s7kmzlmtjal> <D4PE64JTYDCL.3MC81CYK49TI0@fairphone.com>
In-Reply-To: <D4PE64JTYDCL.3MC81CYK49TI0@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Oct 2024 14:46:59 +0200
Message-ID: <CAA8EJpoYpiuVkD3ohoVhd9VXvCxpHPPfXfY0YqrQhABUc3WPdw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor
 for UFS/RAM
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Oct 2024 at 09:22, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> On Sun Oct 6, 2024 at 10:26 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Oct 02, 2024 at 03:01:08PM GMT, Luca Weiss wrote:
> > > Configure the ADC and thermal zone for the thermistor next to the
> > > UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
> > > measure the temperature of that area of the PCB.
> > >
> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 40 ++++++++++++++++++++++
> > >  1 file changed, 40 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > index 8ab30c01712e0b7c0cc1b403e0fe01650315b9e2..fdc62f1b1c5a398abaa71818fdf2858fdc445d28 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > > @@ -207,6 +207,20 @@ active-config0 {
> > >                     };
> > >             };
> > >
> > > +           mem-thermal {
> > > +                   polling-delay-passive = <0>;
> > > +
> > > +                   thermal-sensors = <&pm7250b_adc_tm 2>;
> > > +
> > > +                   trips {
> > > +                           active-config0 {
> > > +                                   temperature = <125000>;
> > > +                                   hysteresis = <1000>;
> > > +                                   type = "passive";
> >
> > Is it really just "passive"? Especially with no cooling devices it
> > sounds more like "critical". LGTM otherwise.
>
> Hi Dmitry,
>
> To be clear, I'm adding the thermal zones now as a first step so that
> that they are declared and that they show up in /sys.
>
> This is for sure not the complete thermal configuration. Most other
> thermal zones in this dts also currently have 125 degC "passive" trip
> point, which I'd hope the device would never ever reach.

Sounds sane.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

