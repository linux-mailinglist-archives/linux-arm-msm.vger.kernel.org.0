Return-Path: <linux-arm-msm+bounces-22818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4971690A978
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C586B1F211D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B718191487;
	Mon, 17 Jun 2024 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb2sg47Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9B41C93;
	Mon, 17 Jun 2024 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616267; cv=none; b=E+Z36UiXSNKhvVvm10peZXDKDUFmhESTc/P1LYf1xp66L6t4kNGJMDe7pGi5a8GG3kSfSzIF+6Krx+OniHHBruMSmsWA2AGdQaXk1TdRanzJsT0ECDzDh2WG+LGaUdOt8qZgV2kFJXiGBHR2LxXBQ8iGWbSSe6KUIcYENKcfyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616267; c=relaxed/simple;
	bh=9TH45R9i/G9Oz07Ivh80UmsdcTZLOinzkILdKhSrrD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7Bf1tovnqhLrMYpOKo/kMp1Ocyrl9hCTSVBNM53n4jNvleU2WZClw+iHABTTjOeg7F9E6XMeIT07yN4X0ah2+KnJgYqv7RAqVUDbwQt+/2Dy1gx8VfDVW3k4h2ofMj+8uDHhrxOsWzwJh+q3sAhii8CF41ueBYQrJ8ITZD1dk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb2sg47Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B780C2BD10;
	Mon, 17 Jun 2024 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718616265;
	bh=9TH45R9i/G9Oz07Ivh80UmsdcTZLOinzkILdKhSrrD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hb2sg47ZBmlA3GwQ6X8LBpbsGgk+RhS3I0PBVVDdLfCezpCgUjz7pHQTwlpnW5Pp0
	 r+F0BANkYlpcKIm3fQpIvUY99kTz32U1QQtnEaMnQ8rkplSuGiIIyDojN6nswSLGJ7
	 5t87RDzt5TxCus+Z4YzJSjZAE56w1020qFqrvEWS+ZrMjD9Ad+/eB7BG39W38Z8X2r
	 UWBLewN89keamUHMpknZxCOBMMsKH4x9Q8G0tWSyYnKymPuKKdW1l/FebiLkiwCGtu
	 4n51DOWjZ/rWinMcJCBxykhBFM824jcTgWkv7KOM+4g+t8FWUMNY4U+kM2tD1AeAiN
	 XcfjhwOaTccUA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sJ8b8-0000000053S-1JXM;
	Mon, 17 Jun 2024 11:24:22 +0200
Date: Mon, 17 Jun 2024 11:24:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Enable tsens and thermal
 zone nodes
Message-ID: <ZnAAxlH6yhlJf6fV@hovoldconsulting.com>
References: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614-x1e80100-dts-thermal-v2-1-4d4f9effacc6@linaro.org>

On Fri, Jun 14, 2024 at 01:50:07PM +0300, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add tsens and thermal zones nodes for x1e80100 SoC.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Dropped the thermal engine nodes.
> - Dropped comments from tsens nodes.
> - Droppd the polling-delay entirely and polling-delay-passive where not
>   necessary.
> - Added top/bottom location to all sensors (where applicable).
> - Fixed trip points with duplicate values for same temp.
> - Marked as critical the 125°C throughout all trip points.
> - Link to v1: https://lore.kernel.org/r/20240527-x1e80100-dts-thermal-v1-1-ea13b8fa6ffc@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1176 ++++++++++++++++++++++++++++++++
>  1 file changed, 1176 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9944c654851e..df13df7967db 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi

> +		cpu0-0-bottom-thermal {
> +			thermal-sensors = <&tsens0 2>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <90000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				trip-point1 {
> +					temperature = <95000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cpu-critical {
> +					temperature = <110000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};

The CPU bottom thermal zones fail to register with v2:

[    0.146219] thermal_sys: Thermal zone name (cpu0-0-bottom-thermal) too long, should be under 20 chars
[    0.146241] thermal_sys: Failed to register thermal zone cpu0-0-bottom-thermal: -22
[    0.146474] thermal_sys: Thermal zone name (cpu0-1-bottom-thermal) too long, should be under 20 chars
[    0.146495] thermal_sys: Failed to register thermal zone cpu0-1-bottom-thermal: -22
[    0.146753] thermal_sys: Thermal zone name (cpu0-2-bottom-thermal) too long, should be under 20 chars
[    0.146774] thermal_sys: Failed to register thermal zone cpu0-2-bottom-thermal: -22
[    0.147024] thermal_sys: Thermal zone name (cpu0-3-bottom-thermal) too long, should be under 20 chars
[    0.147045] thermal_sys: Failed to register thermal zone cpu0-3-bottom-thermal: -22
[    0.147297] thermal_sys: Thermal zone name (cpuss0-bottom-thermal) too long, should be under 20 chars
[    0.147319] thermal_sys: Failed to register thermal zone cpuss0-bottom-thermal: -22
[    0.149401] thermal_sys: Thermal zone name (cpu1-0-bottom-thermal) too long, should be under 20 chars
[    0.149423] thermal_sys: Failed to register thermal zone cpu1-0-bottom-thermal: -22
[    0.149765] thermal_sys: Thermal zone name (cpu1-1-bottom-thermal) too long, should be under 20 chars
[    0.149787] thermal_sys: Failed to register thermal zone cpu1-1-bottom-thermal: -22
[    0.150098] thermal_sys: Thermal zone name (cpu1-2-bottom-thermal) too long, should be under 20 chars
[    0.150119] thermal_sys: Failed to register thermal zone cpu1-2-bottom-thermal: -22
[    0.150437] thermal_sys: Thermal zone name (cpu1-3-bottom-thermal) too long, should be under 20 chars
[    0.150458] thermal_sys: Failed to register thermal zone cpu1-3-bottom-thermal: -22
[    0.150775] thermal_sys: Thermal zone name (cpuss1-bottom-thermal) too long, should be under 20 chars
[    0.150796] thermal_sys: Failed to register thermal zone cpuss1-bottom-thermal: -22
[    0.152838] thermal_sys: Thermal zone name (cpu2-0-bottom-thermal) too long, should be under 20 chars
[    0.152859] thermal_sys: Failed to register thermal zone cpu2-0-bottom-thermal: -22
[    0.153211] thermal_sys: Thermal zone name (cpu2-1-bottom-thermal) too long, should be under 20 chars
[    0.153232] thermal_sys: Failed to register thermal zone cpu2-1-bottom-thermal: -22
[    0.153603] thermal_sys: Thermal zone name (cpu2-2-bottom-thermal) too long, should be under 20 chars
[    0.153624] thermal_sys: Failed to register thermal zone cpu2-2-bottom-thermal: -22
[    0.153994] thermal_sys: Thermal zone name (cpu2-3-bottom-thermal) too long, should be under 20 chars
[    0.154015] thermal_sys: Failed to register thermal zone cpu2-3-bottom-thermal: -22
[    0.154386] thermal_sys: Thermal zone name (cpuss2-bottom-thermal) too long, should be under 20 chars
[    0.154407] thermal_sys: Failed to register thermal zone cpuss2-bottom-thermal: -22

Johan

