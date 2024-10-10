Return-Path: <linux-arm-msm+bounces-33917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FA998F61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 20:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDD391F25B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17F2C1E1A04;
	Thu, 10 Oct 2024 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tEX/jNJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E81D014B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583614; cv=none; b=bZP4yfTOk3uwRGBPU9mBWutp38rX2DX0j7/O0K0Ng2H0kiQgT8f2u21GQCEYR61sXT5GiNi+iHf5PwMu8q1W/HepguEedLafB9V2A6wAP0NqyVUQLZVKrqGUT2X+4varU9V5E3+w7XYkAGVPAVFQ435XLiMLYOzlZqPYcBh7UZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583614; c=relaxed/simple;
	bh=h8BjPOZv9B+DRVbjP5a4tgXLmIQbttswYogT1kWyKhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8+fqtETlDnvWJZpP2SUd/pcx4hYvo9RNUDVuDqh0lcd7IaulP0/0jH6Zb+tog0T8kANDoZ3sSWMD/MnkYCUwx39YweXqW/62N58WDJrhTLFj86FfdL5DQWSsJarzHrXuVI5tXG1J88GXlPrqITCjWd28k6vJmXci/WviX8AtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tEX/jNJh; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e330a7b120so10389957b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 11:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583610; x=1729188410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TKJGIOYTkNAdci0wFNHO08w6f6IiJsi0Xb5L2McNQqM=;
        b=tEX/jNJh0GkG1brrAQMCXtCnKqTe/pVG26cr87u6yFyt07eKvXQELnxjgSvtluj6wt
         /BAa9AZ8vLfjEHdSisKtjsvVmmKKLKGpWT8w00a6tHPR9ikZMdJ9qTxU8ys3tbdG5sRg
         xoOSm7jb/LhsE5bdPo0pBzoYtj3jv56YaUVKEhoQ9aErSmIstIgx0Pw5/aYEIIlnkPwY
         g3jkAX7UIfv4yVpoJvpbPmFljVvAmlBz1p1cKDrz1mJnwa5tCKpLL6evHNpQChoL+cmG
         k8YLb8YafIVw8pHqPQMSDEDkhAt9knfiJQWOC0WKjF8MgO5uGFN/GcA5T4+nz5n5FEBh
         We3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583610; x=1729188410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TKJGIOYTkNAdci0wFNHO08w6f6IiJsi0Xb5L2McNQqM=;
        b=LbnBOxN9tyYhOiy5JNw7nQJjwRxUEXVP0etIq/JfvqKCJxWG8WXnnXVP112Idhq6Wu
         whzVmUQNWTu9lKn2AF27x+BsuNYZ4vGyA2I1DQ7kkSJErpkZh/LQmqIzOAfHDJ1U6AGV
         2sFSFR022F01bvRNbBVEEyYz8p5ePyfguR1ULDTAu9JnoyUGiuDjvRp8mvRRisIwxLQ3
         5/cceBBTdw7xE4t3FevJrgBGjbKB22VLHktzosYAAz7AoSMmwL/gAVJ2PW+AY34h/+Kp
         J0oYizcU0Oh083NZz7QDiZgi3FKCpFgd/kWsFBi0Nks+/i9STmkwisyDY9Ymwy30j6a/
         VRew==
X-Forwarded-Encrypted: i=1; AJvYcCWx5SeZMGrx7JrKZmAAQSa5iwuwpnaIlE5z2y8SMPe2XKiUSLgC9KySfxjIGaCEv+GuUn1+kNwhK6tTCkf0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3KG0mCrl0EBmjrQv3igAAdeew6B0F540H5A7Qogx4rjUI2Cuq
	XVvf6HC63l47L1iY7PiK5lZRkWy0ytyy4+WopPAU7Y740o316k4Cyfv+jK41EhYjVhwq3wLFLPo
	X40ulhtZin1kB5dAr8jvgb7D+FQxXf3auNw8pSg==
X-Google-Smtp-Source: AGHT+IFEGkRdIx6wLXAlJbZ04RtX0q1KzGpmDy37x6R1MrTP+tdlouVgHe0CwTggSg5yzslDUzKn8wKSgIAKi/CD2H8=
X-Received: by 2002:a05:690c:3382:b0:6b0:d9bc:5a29 with SMTP id
 00721157ae682-6e3224d33dbmr78728787b3.32.1728583610220; Thu, 10 Oct 2024
 11:06:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-3-quic_kriskura@quicinc.com> <iycqvw5ztqufcu3hgtpvrrir2anurjeckgmj6ll6twwsmotxhf@v72pwnmvq6yx>
 <41f436be-e75b-41aa-ae75-ab6337a6e51a@quicinc.com>
In-Reply-To: <41f436be-e75b-41aa-ae75-ab6337a6e51a@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 21:06:38 +0300
Message-ID: <CAA8EJppchH52gA6raXK0=+fYz_XwU6oBFAA-nNaTY4E5s_aTkA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Enable USB controllers for QCS8300
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 19:28, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 10/10/2024 9:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 01:26:36AM GMT, Krishna Kurapati wrote:
> >> Enable primary USB controller on QCS8300 Ride platform and
> >> set the dr mode to peripheral mode.
> >>
> >> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> index 7eed19a694c3..3e925228379c 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> >> @@ -265,3 +265,26 @@ &ufs_mem_phy {
> >>      vdda-pll-supply = <&vreg_l5a>;
> >>      status = "okay";
> >>   };
> >> +
> >> +&usb_1_hsphy {
> >> +    vdda-pll-supply = <&vreg_l7a>;
> >> +    vdda18-supply = <&vreg_l7c>;
> >> +    vdda33-supply = <&vreg_l9a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_qmpphy {
> >> +    vdda-phy-supply = <&vreg_l7a>;
> >> +    vdda-pll-supply = <&vreg_l5a>;
> >> +
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1 {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&usb_1_dwc3 {
> >> +    dr_mode = "peripheral";
> >
> > Is it actually USB peripheral only? Or USB-C which isn't handled yet?
> >
>
> It is DRD capable. This platform has Type-A ports. I didn't see any way
> of role switching. So I hardcoded it to peripheral like on SA8775P and
> SA8540P ride platforms.

Type-A are usually host rather than peripheral. Please describe your
decisions in the commit message.

>
> Regards,
> Krishna,
>
> >> +};
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry

