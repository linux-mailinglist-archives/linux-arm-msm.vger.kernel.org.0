Return-Path: <linux-arm-msm+bounces-81300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF73C4ED7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 16:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBA2A3A4C33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 15:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF55366566;
	Tue, 11 Nov 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKJRcjaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA82BFC73;
	Tue, 11 Nov 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875820; cv=none; b=Vlt5CkLVXQ/6C+m/BlkafdqrL5/2aIMsn5jKk4S8XGBw0dExuxbvJbUeBJWD0IxR1419NlE99Cn5xbSllALVcWoRddGNVtTjQrQ8+54uawfLD3u8ExD9Vm/IzM1GWwuan/N8Z7hTxOdEKOWD61pCxoPoLTqSZ2lF5pXYKa4VRhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875820; c=relaxed/simple;
	bh=xWDbsZYIVwXrVCrD5vZBMA/fbJ/gB3Vml4KM+4PsPEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HF9q4Cix3afJyiwiDyRkyTBQeFF2hNVTl7PHKiV3OMlPacZLXQETC6m55tEL/TeDdq0EtpCFphmMDu2HPJv4LLcOkyhVaZ1LlBQOq/RPj5uTKzFgcOPOXsbIW1IOi3StYI1n+xdZqCuVnG89mi+JnH6E8smQetuWjCw9xQusKuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKJRcjaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B513C113D0;
	Tue, 11 Nov 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762875820;
	bh=xWDbsZYIVwXrVCrD5vZBMA/fbJ/gB3Vml4KM+4PsPEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UKJRcjaHPidhLdYhpTaDjeksqXh7B+3vmx/zd7ZDB8o3n7m4VL97k0et0ubpuxXvm
	 du9HaPjGJQoNVrvihO3uGvNZztPyheGSFDlk0KP1Mi2ChKaFJm+RxKCV/dhSdEsSMZ
	 m5osohE75AxwSWtdO3A2A6xRdFbFGjB7rZG4RIO3fq+DqfB2vhKXq9qKcQoBfj5CIg
	 OyMRZSKDmQvlrb7IZFWcbSkeVr2k6PHZ0cz9yWq6PkoW8jO7+8e+MAhFJrQdKhdSkE
	 qBK9sdEbvWphUZMReUpDPq7zVsLnv8dXurx0VKO5esUJVEOPI7k+P2OecP40uvWwI2
	 RoSVRuYnz0PyA==
Date: Tue, 11 Nov 2025 09:47:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ziyue.zhang@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1 on
 monaco-evk
Message-ID: <tbs6b6pl4j3tukv6z7wbz3bmbfeadw7t7kox7vvk7az5cimyg3@grx2bccboco6>
References: <20251111-monaco-evk-pci-v1-1-8013d0d6a7ca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-monaco-evk-pci-v1-1-8013d0d6a7ca@quicinc.com>

On Tue, Nov 11, 2025 at 03:38:16PM +0530, Sushrut Shree Trivedi wrote:

You don't need the "on monaco-evk"-suffix in $subject, because you
already have the (correct) subject prefix.

> Enables PCIe0 and PCIe1 controller and phy-nodes.
> 
> PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Flip these two paragraphs, so that you first have the "problem
description" and then the "solution".

> 
> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>

Please move to @oss.qualcomm.com if you can.

> ---
> This patch depends on the series:
> https://lore.kernel.org/all/20251024095609.48096-1-ziyue.zhang@oss.qualcomm.com/

There's a request for change on patch 5, so I expect that to be
resubmitted. Please send this patch together with that one, so that I
don't have to solve your dependency problems.

> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 84 +++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index e72cf6725a52..70739f71dd5c 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -408,6 +408,44 @@ &qupv3_id_1 {
>  	status = "okay";
>  };
>  
> +&pcie0 {

"pcie0" < "qup3_id_1" 

> +	pinctrl-0 = <&pcie0_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcieport0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&pcie0_phy {

"pcie0_phy" < "pcieport0"

> +	vdda-phy-supply = <&vreg_l6a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
> +&pcie1 {

"pcie1" < "pcieport0"

Please sort these alphanumerically.

> +	pinctrl-0 = <&pcie1_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcieport1 {
> +	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l6a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +
> +	status = "okay";
> +};
> +
>  &remoteproc_adsp {
>  	firmware-name = "qcom/qcs8300/adsp.mbn";
>  
> @@ -449,6 +487,52 @@ ethernet0_mdio: ethernet0-mdio-pins {
>  		};
>  	};
>  
> +	pcie0_default_state: pcie0-default-state {

And please keep the pinctrl state nodes sorted on first "gpioNN".

Regards,
Bjorn

> +		wake-pins {
> +			pins = "gpio0";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio1";
> +			function = "pcie0_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
> +	pcie1_default_state: pcie1-default-state {
> +		wake-pins {
> +			pins = "gpio21";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		clkreq-pins {
> +			pins = "gpio22";
> +			function = "pcie1_clkreq";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio23";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +
>  	qup_i2c1_default: qup-i2c1-state {
>  		pins = "gpio19", "gpio20";
>  		function = "qup0_se1";
> 
> ---
> base-commit: b89214826b1ab0e527303464d6c90e53d290c4f1
> change-id: 20251110-monaco-evk-pci-85c9459ce9a2
> 
> Best regards,
> -- 
> Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> 

