Return-Path: <linux-arm-msm+bounces-49815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B168A49142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 989B016FAAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 06:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32EC1BD9C5;
	Fri, 28 Feb 2025 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fhl5q+8f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2E155A25
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740722429; cv=none; b=A/YA8LnxAjKGX3GG1DXtBVA9Yjm9HT1rBXbFQUJTU1jIoVjQA2ueSTCMK2w25fTpaLHSEcco6WZ9f20qVoYMu6UunA+VukkUGDrqbtoxATKY/QxNmN0r63V/7HC1Rh98l62DjAUhDbN11tlFqGrG2AqZeAKTBKT6O0IU4EgaKb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740722429; c=relaxed/simple;
	bh=AWvYiQoiMEDKzx0UJ2Y6eQ9AejEWiZPRdpZdb1d0FeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3GwjLkwEZPJVmgr69pJn1rLHDEYvNewHq/aobguerzWz+VrFqIYcbl97mTPF0uvviEEqAAAymBulhg09n1iw72Q/l1cN0QV33wSg2bLasWSY/oce8xJEkKv+KlAcHIDmNucFL2d4Frzrob92j6in8K01zkrvCDjyhTWMQUtzG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fhl5q+8f; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5494e7ad57fso493019e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 22:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740722426; x=1741327226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PHiWqrIN5nYCcFqaUNMMfDdBtNQ/qJHg5lRmt2lqcUk=;
        b=Fhl5q+8fvuccE8qFszZM/a67mpalbARjcXLFzfWMVEq2HGVYkPr0FqZz+eFUJluRsB
         A08bU5rWlUvpfW0n5XcnXy0wL5Fp749qZicHUxUKwg2jCECDQkzbGHsb5M2splnQGG95
         Zm7iVDalZ5WMcrkT+EP7DRWRtSBHy4LpN6yUXugsaqIqjGeuz3lQNWD5a2uLnJpyGrMz
         zIWrWfs3z0og/OZscRYlW2AnxxA3E05Pw1tq0DCndqg6UmawRZQJRmzx+OS5unW5tCVb
         YxVuDlbRnjYc3Hs2CRZb+PxosT2Vm3In55gloNSYn6vCgDDdZyR4KQpwEQJLiQLeiItH
         4yQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740722426; x=1741327226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHiWqrIN5nYCcFqaUNMMfDdBtNQ/qJHg5lRmt2lqcUk=;
        b=j3ZUDAQ6e0At2zMS1Z4/1ddHIoBcTCwtjCvRjWyDefh1jNmoLjuJipNJl2xMY/VXe5
         ChmTuF/1xuOz6Phv3g+7AaNbmqzGWTlhQwIVTLMTAfB/S4ZbelCxUp4EV5SVLylalGRD
         eLRTevcsA14COcWaq1ZzHYk+vhHLzRWOiAPuAHjhvghjQxLb9SjyuM7wRW3KudfZWHZy
         KNQqxw5/CYfKntqcs35tPaDY8XZtDhKP0esCxtVj3x39bQTYlZJjakaKF23yPjejN8rM
         QhYZ7+655EaJ3uJHRHcqFDo6CGXGmJmGn23s65p7+u5prfyp2h3GkPPvm1C80yIl0rxb
         ufvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYY+Lz73Kf2Y5HrU3va2B+JeBlxGTniJ0E3foPeCgpiRkxSQUhwqDDsYRXPHsPek/Uz0U1+THH9yI3mhnK@vger.kernel.org
X-Gm-Message-State: AOJu0YwmU4oDAjr7UIEsx+e6AI/xzF0PkHv48Eji0OS6hi55GVG4fktu
	x1IDviLJciu0p6acd/xOmo1Jj4t6Q5RNXkUG8LNZsvvnojoP0OCQV787AUqzCD7/tIJgENVhQap
	7yFI=
X-Gm-Gg: ASbGnctoNQlQu0c/xZ+lWpEprMNMeHD58X7YBZqZ/hZSkRvkIAsJwDvQo9OF9ODsKc4
	/HNQWCLWVaxFWh/vJlYM/d3mmW3rpgNENuzvzbXFgB/zmEUHGGMCpv27PlPBQiA16EEZPd/6JH1
	fVBUPgum/db/rr7LrCeyjkaoqkKhraAWBKRvNYzNj160lQMETvrYr9rSSIrZ1d+l1q07vKUNcG0
	7EZATMUxLU/QrEjrKp4bm3uuGQX0iViax/JLCgjtvH2txqYDcSvyXgZMXJBHMVgSKwAIyGKsABd
	E6E4BfFKe/Ef4BMfdNoBY76iFSMvMt+XWoItA7pGnLtPIZVsIo+yZcYFsmyHIE0qn/ra5aGmH6d
	W6kC8Pw==
X-Google-Smtp-Source: AGHT+IEJbAhpdFbd4rtOwGQdCPsbiJf2wgXOzhz7clbflWZVUZhxS3wxngsZE4mhVM5oJfAGvDSH+g==
X-Received: by 2002:a05:6512:2011:b0:549:4def:a24d with SMTP id 2adb3069b0e04-5494defa388mr465403e87.35.1740722426200;
        Thu, 27 Feb 2025 22:00:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417a3absm371442e87.53.2025.02.27.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:00:24 -0800 (PST)
Date: Fri, 28 Feb 2025 08:00:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: Enable MMC
Message-ID: <pikuqtpk3mvxc5pdmympzebzi3kvl63mipdenkhgdoy77tb6e2@phflnxgfudum>
References: <20250227094226.2380930-1-quic_varada@quicinc.com>
 <ryfawl6uykry5ds5kovujvepkwffdwitbqltx75wnnrqrbl4b2@i2pjwegs3u4n>
 <Z8FE8nmYm8uqya6k@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8FE8nmYm8uqya6k@hu-varada-blr.qualcomm.com>

On Fri, Feb 28, 2025 at 10:39:06AM +0530, Varadarajan Narayanan wrote:
> On Thu, Feb 27, 2025 at 05:03:10PM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 27, 2025 at 03:12:26PM +0530, Varadarajan Narayanan wrote:
> > > Enable MMC and relevant pinctrl entries.
> > >
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > > index b6e4bb3328b3..252687be9dc3 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > > @@ -69,6 +69,14 @@ &qusb_phy_1 {
> > >  	status = "okay";
> > >  };
> > >
> > > +&sdhc {
> > > +	pinctrl-0 = <&sdc_default_state>;
> >
> > Where is it defined?
> 
> Few lines below [1] in the same dts file.

Ack, I missed it somehow.

> 
> >
> > > +	pinctrl-names = "default";
> > > +	supports-cqe;
> >
> > This property should be a part of the SoC dtsi.
> 
> Will move it.
> 
> Thanks
> Varada
> 
> 1 - https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts#n128
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > >  &sleep_clk {
> > >  	clock-frequency = <32000>;
> > >  };
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

