Return-Path: <linux-arm-msm+bounces-64638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FDCB0243A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 21:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF6616AF8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 19:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3012321504E;
	Fri, 11 Jul 2025 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzADCheh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9A1D6DB9;
	Fri, 11 Jul 2025 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752260710; cv=none; b=RiCQOITWVc1clivNQSn58PT4pI5cMvo45DPiE+wj4pUU+06B9NzoDB1o55Px4NP9luFVtegZHsn74p0h+hKPbq79PrzGjYbBknvDCvoN878mWbdNJAxawsvcng2/8WuyFBn8+fJvcyydN/airUHAYv2jYMN5UO1sp6r9FbRUwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752260710; c=relaxed/simple;
	bh=cKTQJqlbK5jLF7JDcnv5IFN2c5RvEhAGNKXwRnCLtUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhG11VGXREi/Zlb+gXtdJiGUD3SmlGrkAHrJuFuRYUjVFb09LzqnDntO6A7XcD9pZ0KhETW92yxMu6upQhz6wu7q/4AwSOGvs9b60jAh8Pv1fAcJI98BbwKNCKvtvhRmAgsXGPceMjyQhvNeENpJwc+ZbYQG7wd7d0NEhBNEHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzADCheh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F2AC4CEED;
	Fri, 11 Jul 2025 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752260709;
	bh=cKTQJqlbK5jLF7JDcnv5IFN2c5RvEhAGNKXwRnCLtUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzADChehhf6poYpejX3ebepi6BgHYHJDNqRW+uDGiZAgCyr5LI2u4tpV72V7/xkHT
	 KH2/n47bhU3f5eVKxngxhr8zzn/IuWRU7xfpDN2V6Dc2UShQYOj/Oad1UCqOvJkg+p
	 RnLGxFhXBJZAYNusTWChtF4walRxFFHTrsNGnSPfg/IkHQQKkYU6Zo/77hZkX6OdC/
	 NkqBK+EBnYoHARdpIzMZ0GjexvwhoZtcUo1eAu3LYTSDs1h1FVh3kzhiBWhSFasMTW
	 txVgKvfLXBEoYSnWM3R0TrGuOfUIOwQeoUBHQs2Oy8hmWEy08OXaAFTomZ8V9SitW4
	 gSU42qL/Am8Tg==
Date: Fri, 11 Jul 2025 14:05:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shashank Maurya <quic_ssmaurya@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs9075-iq-9075-evk: Enable Display
 Port
Message-ID: <iayioqm3tqutbjswt24p65o4demfdaqcakfbwohnaqueuuqtng@azhxjno4ofia>
References: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-enable-iq9-dp-v1-1-6d381e105473@oss.qualcomm.com>

On Fri, Jul 11, 2025 at 09:13:47PM +0530, Prahlad Valluru wrote:
> From: Shashank Maurya <quic_ssmaurya@quicinc.com>
> 
> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> qcs9075-iq-9075-evk platform.

I prefer that you actually describe what these are connected to. I
presume there will be more DPTX instances enabled for this board? If
that's the case, let's mention here that this is just a subset.

> 
> Signed-off-by: Shashank Maurya <quic_ssmaurya@quicinc.com>
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts | 52 ++++++++++++++++++++++++

Please wait with resubmitting this patch until the base dtsi has landed
(with its new name).

>  1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index ab161180d1d5a670a68c0903e85f24a91faa2b71..110e08db3ad82e3aa88aa4c4ed4b2beb607385ad 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -252,6 +252,44 @@ vreg_l8e: ldo8 {
>  	};
>  };
>  
> +&mdss0 {
> +	status = "okay";
> +};
> +
> +&mdss0_dp0 {
> +	status = "okay";

status last please.

> +	pinctrl-0 = <&dp0_hot_plug_det>;
> +	pinctrl-names = "default";

I prefer that you actually describe the connectors, like I did on
sa8295p-adp. In particular if there's a bunch of connectors on this
board.

Regards,
Bjorn

> +};
> +
> +&mdss0_dp0_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss0_dp0_phy {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l1c>;
> +	vdda-pll-supply = <&vreg_l4a>;
> +};
> +
> +&mdss0_dp1 {
> +	status = "okay";
> +	pinctrl-0 = <&dp1_hot_plug_det>;
> +	pinctrl-names = "default";
> +};
> +
> +&mdss0_dp1_out {
> +	data-lanes = <0 1 2 3>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss0_dp1_phy {
> +	status = "okay";
> +	vdda-phy-supply = <&vreg_l1c>;
> +	vdda-pll-supply = <&vreg_l4a>;
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> @@ -260,6 +298,20 @@ &sleep_clk {
>  	clock-frequency = <32768>;
>  };
>  
> +&tlmm {
> +	dp0_hot_plug_det: dp0-hot-plug-det-state {
> +		pins = "gpio101";
> +		function = "edp0_hot";
> +		bias-disable;
> +	};
> +
> +	dp1_hot_plug_det: dp1-hot-plug-det-state {
> +		pins = "gpio102";
> +		function = "edp1_hot";
> +		bias-disable;
> +	};
> +};
> +
>  &uart10 {
>  	compatible = "qcom,geni-debug-uart";
>  	pinctrl-0 = <&qup_uart10_default>;
> 
> ---
> base-commit: 7f3a635117b377cb90b67757cb46de12ce8aa24e
> change-id: 20250711-enable-iq9-dp-addc9c7195c9
> prerequisite-message-id: <20250612155437.146925-1-quic_wasimn@quicinc.com>
> prerequisite-patch-id: 22eee78c5507c3105e0c74d1128b3db803879d7a
> prerequisite-patch-id: cf52fc82e606ab87458339f71596ca31253e91ee
> prerequisite-patch-id: 3617ce3b1790bc5b8e50dca6c3ae482759dcc684
> 
> Best regards,
> -- 
> Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> 

