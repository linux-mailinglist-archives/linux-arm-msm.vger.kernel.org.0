Return-Path: <linux-arm-msm+bounces-26785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AAA938D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29F46B23BB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5516D4EC;
	Mon, 22 Jul 2024 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ct2/RU+F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE6016D336;
	Mon, 22 Jul 2024 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642685; cv=none; b=MAfoKN7+tXg26Jc5vtyxLsHw9A4gAOB8zyFWNeNv0XooQj6XP7HxUAV6shH/96f0f4fi+UM453ZD70YZjiskADF8bhgXT2iOZ9OWX5xApj+gRwe2DlfaZAuJabR1wiaZNdH0HFxWBYxPBVnKNSW0lq7V4IBb0Y9iXLIJb020CoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642685; c=relaxed/simple;
	bh=YctD+j54Jric6KHIWunPY0O4zTHfa6aPQMrSRTfecJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQDR3iNRYSrmFhzFqgLuPRFvE9B5/xdjFX4t2H67lC8j17i+eq5XGTddQbD9EeD6GpxruHhplMVCaUaky9jzWMbjxyfhZa5hEZ3IRqQ49h2aGvgg/PGHCnfphxwygKJzRdpwciYuAKlZ8S2km/cCAxfOwjUOAOQ6i6Au6Tiz4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct2/RU+F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5812FC116B1;
	Mon, 22 Jul 2024 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721642685;
	bh=YctD+j54Jric6KHIWunPY0O4zTHfa6aPQMrSRTfecJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ct2/RU+FYVDEP8DAjhkWga7l+BHrsvtyXS9z2csdUIbwrFJS+xj4gQf0BpdDe+YOc
	 ORQkv+c7gd97XCJN3d0Wkf2OJFVxOl3Mq/Cka78M8oD7Q5aEqOhyKZgZKp5Y8lKsaY
	 u68PaI2AChxbln9Qhcr/uGN94t6QdnuCqRTyX94MTy6HIHvBIscnLvUtMhYHiU6bMe
	 WXHdrk2d9ECI4PD6WkLaIa5A2VhXo1NGrviT0LEG0QyPDj04OYGhO4IsDVy4eUju1a
	 R5boyhICJs3iPUOseka5seHS3MyquoDRjmqo+Mn94J8xwFlATM9GptWe7qSQ61GbgW
	 /9KXbRcDNy1Eg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sVpuO-000000007H4-1gdU;
	Mon, 22 Jul 2024 12:04:44 +0200
Date: Mon, 22 Jul 2024 12:04:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
Message-ID: <Zp4uvPVx33P3g_yb@hovoldconsulting.com>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>

On Fri, Jul 19, 2024 at 10:16:38PM +0200, Konrad Dybcio wrote:

> +/ {
> +	model = "Lenovo ThinkPad T14s Gen 6";
> +	compatible = "lenovo,thinkpad-t14s", "qcom,x1e78100", "qcom,x1e80100";
> +
> +	aliases {
> +		serial0 = &uart21;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};

I don't think this machine has a serial console.

> +&pcie4 {

Missing perst and wake gpios and pin configuration.

> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;

This should most likely be vreg_l3i as on the CRD reference design.

> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};

> +	pcie6a_default: pcie2a-default-state {

copy-pasta: pcie6a-default-state

> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie6a_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;

bias-disable

> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};

> +&uart21 {
> +	compatible = "qcom,geni-debug-uart";
> +
> +	status = "okay";
> +};

Likely not present / accessible so no need to slow down boot by printing
logs at 115200.

Johan

