Return-Path: <linux-arm-msm+bounces-34563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 092769A0408
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E47341F2161D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 08:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9024C8C;
	Wed, 16 Oct 2024 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/QZHYEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6B18B473;
	Wed, 16 Oct 2024 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729066730; cv=none; b=mS1kPYnG9LMKZMt7Vc52dPARU2CMEFyVdr6m6wNQ1NuDD+HgEgGqs1HCh0Xcu9GI3d6Tvb24U8IFP8R69zigWggRWXolWvtK74lk5lBsUADnWafn672MhuwxBJUJ6aegt5f9WgFmsD86cyXCaCVcoojht1UZD3LpvSQM2kivouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729066730; c=relaxed/simple;
	bh=tBH2x36STqh9cmakWrafMF1EITxMLNBKUgffxuWsGkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHinS7yUeUJick+oHMh4lbMm2whRwsH3FYSzNWhPfCuDJOUb36QwLefsHzsZVlwa9wJ7xvCRZPEqv4FXUjldAstu5EzVdM0aKf36DkgITqi8ArW7xCR907zPqovv+Pmc+xZiXyqbEq6sHem7VrRVROInEAWaDteS1kpzAf0UZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/QZHYEt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E682C4CEC5;
	Wed, 16 Oct 2024 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729066729;
	bh=tBH2x36STqh9cmakWrafMF1EITxMLNBKUgffxuWsGkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/QZHYEt9gBF2rRTw3hPx8i9KLizmSxKmONfbw5yTvd2vwpg7tC4bae8nybvRltku
	 Kwnj7GheKAL+VnCCEw7nv8tde37YQ1UzcF168cSPnkdeNZeOBsQ+d8McQjbiuMhXT3
	 EPxFBziWcfUdbR+A+whmfOM59g8kWOCXe0B+11vOW2HkPk6GOoRvFke6U2gXIPnULf
	 3HhyjcIVdQDgH56NfeDLRHMx3bStDmYhsrVT1xTy84RkBi9hLX38HlllORntiZVgEg
	 53Bj4TxTRe5xRjCotL9rUHjQOely+3r3pwirgj28Od/RfinZgAK1SCZWhYdbWWBuHK
	 kX8hIZQS3RMqA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t0zF9-000000008Qe-3ZGc;
	Wed, 16 Oct 2024 10:18:55 +0200
Date: Wed, 16 Oct 2024 10:18:55 +0200
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
Message-ID: <Zw927-1-0xFm7xRi@hovoldconsulting.com>
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

pincfg missing

> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK3>;
> +		clock-names = "xo";
> +
> +		vdd15-supply = <&vreg_rtmr0_1p15>;
> +		vdd18-supply = <&vreg_rtmr0_1p8>;
> +		vdd33-supply = <&vreg_rtmr0_3p3>;
> +
> +		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;

Same here.

> +&i2c7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> +		clock-names = "xo";
> +
> +		vdd15-supply = <&vreg_rtmr1_1p15>;
> +		vdd18-supply = <&vreg_rtmr1_1p8>;
> +		vdd33-supply = <&vreg_rtmr1_3p3>;
> +
> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;

And here.

Johan

