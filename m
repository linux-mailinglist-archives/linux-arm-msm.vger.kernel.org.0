Return-Path: <linux-arm-msm+bounces-41896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301C9F0416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 06:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72D38161C89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 05:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7F7188580;
	Fri, 13 Dec 2024 05:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcnIoA+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBB0187858
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734067225; cv=none; b=Dd/XGjwXJHwyOCFHQE4L0dCt9wU3i5z+9O4IzQkf0UHzcn2jDOQ+4YdztCGeTmltBCTyFZBgc3b3cBg3KC83P1opAsetAeVh3VqzUDm3kyxRC+4XZXU7z7qdP4qFCR5OPEckWxsRwL4qwHGnIZ71YUmPAp8NfxATUThEmE4UnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734067225; c=relaxed/simple;
	bh=ijQqiQx39a34E+zUxQPwt279N6b3F/EZYkp457t1zaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUnBKjBNMT2Uc+aVMmFmTjNKQMrckk9RWrNbtWWyvJNXzME02Mj1ed3Wq5+mgUPxf2uMVWNaHk1Qboh5wVgwHu7mw4j6eIm26THqtJaJA2kOy2cec6chznyYAmm8Y63K/4AD+/HR6HLyv+GkYtjkrObZcRgU51mwbI6/RW+VyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcnIoA+2; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3002c324e7eso13628731fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 21:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734067221; x=1734672021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xiz6ukFw9DSCPef3k+S6Ii3ZGWR6/g7hmh8hbZiwQWs=;
        b=hcnIoA+2RO2u98ss/RODlfV78qL/DiMzxWt3N7SoS8DgVW6QMBWRDoY53Ce7+Ae9hT
         v9/dKFBJQNkscf+cYaJY3QLCQN27CmZWd2Lh0gvmYoylLTyfy5CHCqeEKjFGOHbfUz65
         KGxgBOoOWLTdsDlp3JAfjiYuQllLM64HutyFUMYrVGgSwVcFO+SbFbWQzPeunVMc/kpi
         VkXyHqUNYf5GOBomJcMh71kbeA78v9VBMcpbbkglQ/SH6KTPCTQVcY98eP4Ba6Z4/1Er
         X/mMPdM81dRgjGIjG3afXnQt1udTYndQa6fBrXIMn5wdmYrrQ69eDFDFXfgE6QQrZBKH
         ePJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067221; x=1734672021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xiz6ukFw9DSCPef3k+S6Ii3ZGWR6/g7hmh8hbZiwQWs=;
        b=fLRx9JWnbsdE7moV1Y02yjFXOAdR1aZPvuH3GRyHYR/oZCgc+BrhRiXXMxUQlEcSqH
         oahXsFUSGTKvHrCJU/dkpRG7RmqXymdE2JeKInmvpMaROOKKYA1nA24e98X75fNrsvF6
         /QA57Ob/u+oY8QSEZzKFjqGWqlD0QemAnmO957HQSwlPptTsDVbP8gIBvbq6JzmD0HmL
         bya68BNSxPRywmT29Aid8WMFg2GY86RAvJrJ21A+g8cI9FiOHK6ZnWzPWnmRN2kT3LkV
         +Nrqdba6XrdHhe/sbvuqVPYg/yrmXmQxb6DqbVvqSSB/jKuOi46Kp4P6sry8BcrEVJP0
         5LVw==
X-Forwarded-Encrypted: i=1; AJvYcCXXsH57pQqV5VxNKiNL13HlUUf73xZW0BnZ8S4vc2XyYE+ERurK9V0W6Fv4g5g7fZZyQJLx0ZuMUJHhlxVK@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHhHG3ArV2S787N0AoRtGs/LiOkiz/DaW8VLyPQ2x88748MWh
	rpIvAoHRpgXriepjjGCpSrSOLqO3eFZ9nS5q8O+Dfd3oYDFN60HxRSIpZKJQ30o=
X-Gm-Gg: ASbGncsnN8GzyMOSUJuPnp/Mi8qRJq4xMpg/FXtbTzThrYP7BCVWJEjXCIqGe9pxokU
	bdaFheasoqpKxH565RLJlCd/csAyNB4yZHZ3xxvv6vyBT2moIS7n4/zK0hO2SnEyEAEgdbCMs8s
	ZRNySLpUEFjJOR5Hdz0Q43LA7wp051mB+koFVW/wyOS44onqaVjUW4LR3hGeh6RG9nPI5Q+syTI
	9XW1lM6NerXbroZCOMBL823tGHhbU2kZ39qKav2jajIYAjHrHnj1kCt+OvGsN3SHTlOvuK3kByp
	gmV0++uuryXuj7uP54hlMYwbzpQwgOxdwT1F
X-Google-Smtp-Source: AGHT+IHOJupQxEawtaa7cDYeQAk5vSL5tMs4fYXQcgwGIrxsMhJTKZ4dQJrjbPiYB5lxSiGNzIoQyA==
X-Received: by 2002:a2e:a781:0:b0:302:4a4e:67da with SMTP id 38308e7fff4ca-302545b94ddmr3231881fa.36.1734067221232;
        Thu, 12 Dec 2024 21:20:21 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30227d58ca3sm13077291fa.5.2024.12.12.21.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 21:20:19 -0800 (PST)
Date: Fri, 13 Dec 2024 07:20:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Song Xue <quic_songxue@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
Message-ID: <lqscul6yal5mmztup23rcgmyqhfj3vt45rxxsw6ocrnumwfpfe@g3at5zqvtd5u>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
 <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>

On Thu, Dec 12, 2024 at 07:14:22PM +0100, Konrad Dybcio wrote:
> On 11.12.2024 9:26 AM, Song Xue wrote:
> > From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > 
> > Enable secondary USB controller on QCS615 Ride platform. The secondary
> > USB controller is made "host", as it is a Type-A port.
> > 
> > Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > Co-developed-by: Song Xue <quic_songxue@quicinc.com>
> > Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> > @@ -203,6 +203,15 @@ &gcc {
> >  		 <&sleep_clk>;
> >  };
> >  
> > +&pm8150_gpios {
> > +	usb2_en_state: usb2-en-state {
> > +		pins = "gpio10";
> > +		function = "normal";
> > +		output-high;
> > +		power-source = <0>;
> > +	};
> 
> Does this go to an enable pin of a vreg / switch?
> 
> I think we settled on describing such cases as fixed regulators
> (that are always-on for now) - would you remember, +Dmitry?

You are right. Usually it's a fixed regulator. At least there should be
an explanation for that pin.

> 
> The rest looks good.
> 
> Konrad

-- 
With best wishes
Dmitry

