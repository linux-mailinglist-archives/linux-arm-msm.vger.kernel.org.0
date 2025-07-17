Return-Path: <linux-arm-msm+bounces-65543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B29D1B0958E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 22:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9156A4A5459
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 20:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAC5224AE8;
	Thu, 17 Jul 2025 20:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyAPQtYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133D7346F
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 20:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752783299; cv=none; b=QH7TvYZRcREhV1nU4/v+255+jPeuEL3Yskpyx7KAiRmDRKkGbupBERqTjrVnXT7yzU1sCpnsfJG/oxGVBrLKCPWTLSAYMUBQsHKZEbKVFSKOVxo/awZiN5g6+T01AtGUiVgv/ICvU+wOS7rtAtmgDlx6HXRYZuoBJmZ2sZl8WOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752783299; c=relaxed/simple;
	bh=EZ7R4fXfaFdjoYQZtZgAZc+o879chScvSGulDHql0zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOqf/T2cj93FabYmj5EAiWZ2aPc4uslp2wjMME/J8QuAFiDBzaMZacK7iKK87/tm91yCO8Pkd2rwRfZH/AVP/obYducfC2R6UerMndw8CFXDqtr0iJAOTiGRJ85Zq51o05QGcstiSoEIoMBZT0PML0lWHRRPt5uUiIkLrCRf+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyAPQtYq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so10783805e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 13:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752783296; x=1753388096; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQcFq4q/rgMi8StIxps2pQbAEzlQ/dOXwDCfS0g08qI=;
        b=UyAPQtYqpQyufenz3raH4JVwu0fiejqLCUwB3Ml/Uui3EYEAsodOG30tESLAVQ4cns
         Ln6jXE5tyPnDZDyB/p16HWOAtVF4Esh26u/YA3mR78vILac2wAYu22igpT7AqEpeokKA
         FLpqH68VoglCj0FwW/gVwnqpkh0FtZe1g6Umagf3pMpo1hRUiYJykp6S+o+EUGkrpS+o
         VAzARsM1kg7ACCuPshUk1eQaKQc3I0WGLC8kt7rNXf2wQ5DZKHoNBSiHsA0ZYiGlHvKm
         tVHLlvFK1AxEg5dOJ1fi5OtIFskY09uCZbpC9R73t30K6sS9mckxA6ljnqm8LffMKCq8
         feZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783296; x=1753388096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQcFq4q/rgMi8StIxps2pQbAEzlQ/dOXwDCfS0g08qI=;
        b=wns0DJX4O17Wj5LuiH5dsgw8EyOyRlnlkag936DbOPRUO5dEIenRK2DwTy7TS304IM
         i8/Gpp9fshK771eJN3DHXCIrpD2zU0m467POOk1qukHrXzm0A/HtSRu36gyzxSVTumtg
         Facv8tzD3FDdddhgFJHxrzsq8xon9jglfr0HInxpPocxGhhHQacw9VaFoJrnwXmAsLpK
         kvtVlX2x+QFY0UEBli58iVpmLAHjJz2DjnG/OPrN9zD+bN0taFHqKQU4UGEULFEc9MQM
         xnh0Q9WyrIC1Mlb14WYFVR7eWPiLCLa6jh0bmLNMS+JdWb6AR79B4mg7W4PLjRzkPVz9
         KDmw==
X-Forwarded-Encrypted: i=1; AJvYcCXpN92q7CENeAakfBU0Gh+bDVv3EuvLI7LGN5ZyvplVWRbZcSyIZED0SVSOgu1E4YUo2CTIgRSQLjdFL+20@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsm7rqzhGYwh8N0AJTHdfssxs23N6cq7LkeOylG6ABq9HsLygd
	vL7QNjHwM36x/LoJLnnUSTM0UedXmsawpu3XeVe4eedGkh0ozJNZgLknAL1Yes8dTx4=
X-Gm-Gg: ASbGncs575aoYrR15D2H4yML2oc8UQv6P4y3+Xf5vlJXpHwv9UTkIgf7DxoGZ8x5+jg
	4ijjneKWacCErkypTWOF2vB/R3Tsjrw9kdNWM/+gytmbGKz4v1akWr5t7sBIeLXa4zkMsli8kLY
	ZFAfe7j4KoYyFP+YFZkNNIYXMSlGyE8J70zXMVkMPqcJhhVfE5ZnQZAI5PlqUT7KEha0dmb6aC7
	8hrD/beSea9IAsV61hbbVSgxMf8udiGavXmwEPVw8JYX1SGsulzWj4uTnIWHRwzn42dnt7Z02fU
	lTKMFu4cB5jO36wan24Owch1WTLuwgUxblUap5oJItaWRwa3iuvtGJwARX1IcgTqmwL6V19Wv6+
	+9+GCH5dri6dtaA17VsjLD8uXVrceqUcdvw==
X-Google-Smtp-Source: AGHT+IGQilkklE42NQVVUMSQg0/6rx4ntL9WzEJ6KKvvTMvU3maPMt1KBsu/PrQAyHQBlcdljD0c6Q==
X-Received: by 2002:a05:600c:190e:b0:456:173c:8a53 with SMTP id 5b1f17b1804b1-4562e330eb7mr98060425e9.2.1752783296213;
        Thu, 17 Jul 2025 13:14:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:3ca4:32ec:fe95:8c72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b5b8941sm1556205e9.11.2025.07.17.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 13:14:55 -0700 (PDT)
Date: Thu, 17 Jul 2025 22:14:51 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <aHlZu51tYDSsyFTh@linaro.org>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <aHkhcUVBnrwadKfa@linaro.org>
 <3a381014-cfe4-4b3c-a3c7-df688c1e87cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a381014-cfe4-4b3c-a3c7-df688c1e87cc@oss.qualcomm.com>

On Thu, Jul 17, 2025 at 10:10:05PM +0200, Konrad Dybcio wrote:
> On 7/17/25 6:14 PM, Stephan Gerhold wrote:
> > On Wed, Jul 16, 2025 at 05:08:41PM +0800, Yijie Yang wrote:
> >> The HAMOA-IOT-SOM is a compact computing module that integrates a System
> >> on Chip (SoC) — specifically the x1e80100 — along with essential
> >> components optimized for IoT applications. It is designed to be mounted on
> >> carrier boards, enabling the development of complete embedded systems.
> >>
> >> This change enables and overlays the following components:
> >> - Regulators on the SOM
> >> - Reserved memory regions
> >> - PCIe6a and its PHY
> >> - PCIe4 and its PHY
> >> - USB0 through USB6 and their PHYs
> >> - ADSP, CDSP
> >> - WLAN, Bluetooth (M.2 interface)
> 
> [...]
> 
> >> +&usb_mp_hsphy0 {
> >> +	vdd-supply = <&vreg_l2e_0p8>;
> >> +	vdda12-supply = <&vreg_l3e_1p2>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_mp_hsphy1 {
> >> +	vdd-supply = <&vreg_l2e_0p8>;
> >> +	vdda12-supply = <&vreg_l3e_1p2>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_mp_qmpphy0 {
> >> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> >> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> >> +
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usb_mp_qmpphy1 {
> >> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> >> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> >> +
> >> +	status = "okay";
> >> +};
> >>
> > 
> > Assuming the USB ports are located on the carrier board and not the
> > SoM(?):
> > 
> > Are carrier boards required to make use of all these USB
> > ports/interfaces? In my experience it's not unusual that embedded
> > carrier boards use only the functionality that they need. Maybe this
> > should just set the common properties and enabling individual ports for
> > PCIe and USB should be up to the carrier boards.
> 
> The PHYs are on the SoC and if the kernel is told they're "disabled",
> they may possibly be left dangling from the bootloader
> 

How is this different from any of the laptops we have upstream? If we're
worried about firmware keeping unused PHYs on, then we should probably
enable all the PHY nodes by default in the SoC .dtsi?

Thanks,
Stephan

