Return-Path: <linux-arm-msm+bounces-39775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644879DF9F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 05:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1FB281A99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 04:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0870A1D4326;
	Mon,  2 Dec 2024 04:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+68QYjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24E528399;
	Mon,  2 Dec 2024 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114141; cv=none; b=RQGPprGjc4YDabEhXBQnWJdinALRhbNrNYQSSAB05Txzwen1tWVMdGvHtgCqVe9pOFsMdqgs8rYSlP7SKcQHUZH11AAUZ0FYPhHfmF71DhGBHeXEXUIzxSoKwOL5lMw/9AA86czDLQf3eL4ggWqEu0YPUD6EQMXVsG5O3lzAy3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114141; c=relaxed/simple;
	bh=4LW9gvNkk5SwLprkBeVa9iGAFVHl1x72N5pvfESSSHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxrXxCdkQ/fQ+cNJDTcwyyMVVGVxA0ZbDqbkeirbkAkrT3Urp0zcu3XJpKjmPfoSTUB/44HVgegnzSBL+4iu9Yyvh5r1wukXBfcOxdBVsOuHJNltZ4e9IehI12prP7kC5CYndXdiBybSbBoI0g3fZ06/jlpO8f0OLddLmAoqB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+68QYjG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA72EC4CED2;
	Mon,  2 Dec 2024 04:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733114141;
	bh=4LW9gvNkk5SwLprkBeVa9iGAFVHl1x72N5pvfESSSHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+68QYjGmnax3kgcnHDpRkL+mhMBscvfvH3YnchGyKBqXTdzi3JqyXCVp//q+lUBu
	 wYTcr/di4ak+Fe7w+1rEIZJ10jXaJ6WvCv9xvljy/IP2l8VvVsPPrWqCgPfXtr2yjU
	 zRMFUzo0/1OnIZq8PKUnGV7V3UJYb8vtCQfDMZSzofIclLRMvsB9gVF4+AuEE1y6R7
	 d1BZRqfOEb91tle0+xjbD18CrHSnwFsQpaDy5vO7kNdrPSU05fwvxuknfIoJ0jwWNt
	 cvdUIkGX069oV51w3fB4ZsOXND/emmtlYSxBEmVCVIwGTADEuN6Kfsg6TXUT0AjOPj
	 nwXr9B4vWqUaw==
Date: Sun, 1 Dec 2024 22:35:37 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	konradybcio@kernel.org, quic_tsoni@quicinc.com, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs615: enable pcie for qcs615
 platform dts
Message-ID: <ewjkbs2vtilbpbokt25tfypru6atpookv3iecl4465l64hgzym@f5d2bkbkpoae>
References: <20241122023314.1616353-1-quic_ziyuzhan@quicinc.com>
 <20241122023314.1616353-7-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122023314.1616353-7-quic_ziyuzhan@quicinc.com>

On Fri, Nov 22, 2024 at 10:33:14AM +0800, Ziyue Zhang wrote:

"arm64: dts: qcom: qcs615-ride: Enable PCIe interface"

Regards,
Bjorn

> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add platform configurations in devicetree for PCIe, board related
> gpios, PMIC regulators, etc.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 42 ++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6..18f131ae9e07 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,23 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&pcie {
> +	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> +
> +	pinctrl-0 = <&pcie_default_state>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie_phy {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> @@ -210,6 +227,31 @@ &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
>  
> +&tlmm {
> +	pcie_default_state: pcie-default-state {
> +		clkreq-pins {
> +			pins = "gpio90";
> +			function = "pcie_clk_req";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-pins {
> +			pins = "gpio101";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +
> +		wake-pins {
> +			pins = "gpio100";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> -- 
> 2.34.1
> 

