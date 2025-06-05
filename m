Return-Path: <linux-arm-msm+bounces-60265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE95ACE861
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 04:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF1047A9104
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 02:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C9676C61;
	Thu,  5 Jun 2025 02:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxLEmR5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1D2C324C;
	Thu,  5 Jun 2025 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091358; cv=none; b=KWPebckcrW0N3pdL7MN/gVFWoMmo3QsBQA2/Y0tlhCwVlyO0sg9hsm4RjzbjFG+ySESJwXKCOfGNzWenGbqcFJM+6L18Dk6H2CxCeIl+aYSA0Ct7rLEXmBnt+Ouyj700kY1TLJW1WDNV7sQ/RtuxwLMP8awV2Y2VNZTZrSlfSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091358; c=relaxed/simple;
	bh=gH40Ixbi074S5DghIAnw5tgeKF6M/YiIzrDl41K3k04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThqtQ5fy2oAqYMFO3Xu2DLDw1PAthXPOnwUSXB21Vkj9mqJqLoHmb3KOsj5Q/N6Z5gBW8+bNgDpbIQzwToTdzC3PitUHp6S0Ryycd9ts7QSgA2dm3ZQ0+Me1vmgiucwV5AWNWJootPPcd9pKkK4foGCepD3M8HZqfvzfr1TttGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxLEmR5x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B338BC4CEE4;
	Thu,  5 Jun 2025 02:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749091357;
	bh=gH40Ixbi074S5DghIAnw5tgeKF6M/YiIzrDl41K3k04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxLEmR5xy4Pt9amdeKCX8nyT0j61W8rcx1mdwLGoyPOVDKpWHYA6nqV1vDqSHlgoE
	 hV6Im0BHzFQtN62Rqqu169Y6INYdLars1dYI03nonxgO62t5j6v3NrDsCcvCRMdcij
	 IzJdXwuYvcLThcUPQoHDfyI9ZoiKzZftMY3yz2bBJq+uWdpDipy4yXVDDonGmv6TTf
	 4H/PNx6EzROfiMIcwGwTOJYIm5EDAszqxnFCroqWGC2ZCuuhzWZUqXRF/gtt3vRR9h
	 8y9IkURIJWIE7mSyBiKybG4JV0SLVWjonBystA3wZeXEktCSPncdQ/V/7LACgquV/D
	 Cp/Gnu4Pk+hRQ==
Date: Wed, 4 Jun 2025 21:42:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	david.collins@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Correct the max voltage for
 vreg_l6n_3p3
Message-ID: <4tqlrfqevkb4t5rygcikbnx4auxhn2ahzx3tsbobvraacmpil6@sq2diovqalta>
References: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>

On Wed, Jun 04, 2025 at 11:57:22AM +0530, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> logs:
> 
> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> 
> regulator summary:
> 
> regulator     use open bypass  opmode   voltage current  min     max
> ---------------------------------------------------------------------
> ..
> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> ..
> 
> Correct the max value to 3200000uV, so that it is aligned to voltages
> allowed by the regulator.
> 
> Also, correct the phandle name of 'vreg_l6n_3p3' to 'vreg_l6n_3p2',
> so it reflect this change in settings.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 6 +++---
>  arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 6 +++---
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..fe46699804b3a8fb792edc06b58b961778cd8d70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -857,10 +857,10 @@ vreg_l5n_1p8: ldo5 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {

Please follow the naming from the board's schematics for the label and
regulator-name.

> +			regulator-name = "vreg_l6n_3p2";
>  			regulator-min-microvolt = <2800000>;

The name of this regulator indicates that it's a 3.3V (or 3.2V, although
unlikely) rail. But regulator framework will use the min/max from
DeviceTree combined with any regulator_set_voltage() requests (if there
are any) and pick the lowest possible value in the resulting range.

As we regulator_set_voltage() votes tends to be the exception, this
looks like a 2.8V rail. Can you please confirm what voltage is expected
here?

If 2.8V is correct, please make max (a valid variant of) 2.8V.

Regards,
Bjorn

> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 5648ab60ba4c4bfaf5baa289969898277ee57cef..1e95a2849146e3eeea9f68085ac504e32b63fdaf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -624,10 +624,10 @@ vreg_l5n_1p8: ldo5 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>  			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 3a6cb279130489168f8d20a6e27808647debdb41..5a33d7d7ac923c7c0bf6aeb51d0db728e65883ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -700,10 +700,10 @@ vreg_l5n_1p8: ldo5 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>  			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> index 7d29a57a2b540708fa88fb59e821406f400a3174..073040fbd7ba215169adbe3862d3e1f6d2c786e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> @@ -485,10 +485,10 @@ vreg_l5n_1p8: ldo5 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>  			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> 
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294
> 
> Best regards,
> -- 
> Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 

