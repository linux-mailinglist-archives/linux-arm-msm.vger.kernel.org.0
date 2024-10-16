Return-Path: <linux-arm-msm+bounces-34561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E989A03B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457881C28C35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 08:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FDD1D3187;
	Wed, 16 Oct 2024 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKwYCLZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C991D27A6;
	Wed, 16 Oct 2024 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729065984; cv=none; b=o4bDEEhOLpurE1BnD2wpcqyN9rUiTNzpnB7qTjgFaylRXnexrVElQz7GCOa7DYq/DnCekn4IT82IS4mGHfGyCl3SZcxW8XJdgVNJwDyTIGYK4RUZBUUzFjCSLmselNrJbpfJW6tQb8eGq4iodCI5cvyHy/aASn0wVmlzajFdaIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729065984; c=relaxed/simple;
	bh=pzArP/VpObOqR91KFoBIcmgbhgqoCPFChRvzLj7s5PI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbXK6HeQPZfhRPpF6EFhFcYbMhBKasUUBQjdahtKBSdAQHMBgOJI6kaKqRPStF7qArcxyUa0I1gj41IZC2I9cZswyL3GVmTDExCjSg0POIFQJDjgR0fJ16qiqKvEU7cI0EIcVGar0gUzZEjv3FosX5H+FUyEG94gcm7WDEiojek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKwYCLZx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A378C4CEC5;
	Wed, 16 Oct 2024 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729065984;
	bh=pzArP/VpObOqR91KFoBIcmgbhgqoCPFChRvzLj7s5PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKwYCLZxWggsUl2VB4ZIUyCJ9iPgO1K+3Mrm5baY+5MfmdlX8erQ/F86Nn+PbDdDj
	 vft51Y8MeOA+7EJyEYpClrHf/eQWofWyW7EGFtSPAj5akOK9CThjfkbY9Qd6J205D9
	 Ml+VFBo8C+mWHOcNGP3nOjxssg1Bn71pqavMJOdFtpSlrZJo4QsHk24xJAUCd4Poro
	 QdLPFvCVnPpb64A3JOjINz+WE4IKgxaGs1sUjhAn9nEovBMLt3EK4n7cngWlZUHfQD
	 jSGnCySBXRNTezaJZRMYb0VvU2lpsWg2Yfn6cvmeMRDT2I0Ja0pi3/7yEUa4kxjT+1
	 cgpY/EiGYmvlw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0z38-000000006gZ-12xk;
	Wed, 16 Oct 2024 10:06:30 +0200
Date: Wed, 16 Oct 2024 10:06:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Enable external DP
 support
Message-ID: <Zw90BlPCopp-Tp49@hovoldconsulting.com>
References: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-0-899c264c0eb7@linaro.org>
 <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-x1e80100-crd-dts-add-external-dp-support-v1-1-899c264c0eb7@linaro.org>

On Mon, Sep 02, 2024 at 06:01:35PM +0300, Abel Vesa wrote:
> The Qualcomm Snapdragon X Elite CRD board has 3 USB Type-C ports,
> all of them supporting external DP altmode. Between each QMP
> combo PHY and the corresponding Type-C port, sits one Parade PS8830
> retimer which handles both orientation and SBU muxing. Add nodes for
> each retimer, fix the graphs between connectors and the PHYs accordingly,
> add the voltage regulators needed by each retimer and then enable all
> 3 remaining DPUs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
 
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&pm8550ve_8_gpios 8 GPIO_ACTIVE_HIGH>;

When reviewing the schematics yesterday, I noticed that this is wrong
and that this enable GPIO comes from pmc8380_5_gpios.

Fortunately the above gpio is unused, but please double check the other
as well (I think the rest are correct).

You need to fix the pincfg as well.

> +		enable-active-high;
> +
> +		pinctrl-0 = <&rtmr0_1p15_reg_en>;

Please rename the enable pins according to the schematics too (e.g.
"usb0_pwr_1p15_en").

> +		pinctrl-names = "default";
> +	};

> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK5>;
> +		clock-names = "xo";
> +
> +		vdd15-supply = <&vreg_rtmr2_1p15>;
> +		vdd18-supply = <&vreg_rtmr2_1p8>;
> +		vdd33-supply = <&vreg_rtmr2_3p3>;
> +
> +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_HIGH>;

As I mentioned elsewhere, the reset lines are active low.

> +&pm8550_gpios {
> +	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
> +		pins = "gpio11";
> +		function = "func1";

And this should be "normal" for gpio function, right? Same below.

> +		input-disable;
> +		output-enable;

And I don't think you need to provide these.

> +	};
> +};

Johan

