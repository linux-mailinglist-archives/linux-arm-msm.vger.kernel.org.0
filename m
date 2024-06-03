Return-Path: <linux-arm-msm+bounces-21481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A668D82E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 14:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F073A1F26E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CAA12C550;
	Mon,  3 Jun 2024 12:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIUDWMUB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55012D742;
	Mon,  3 Jun 2024 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717419169; cv=none; b=BVTowF2xmPO3d1Qxfe1Zyxj/3TFQ+tHR3Av1l4PItyVPRLii9uPBfV+dV+mMYeuqXi/I/9DPyJv8++MyVKnVXhEqWI7ovxgIZt64iFMXAHtlHG1MpAXEBT9WU2P7SnhFvk5Yw+X0HWHzYOs1jenlP0pQhBtrShudeFu4bEvWpcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717419169; c=relaxed/simple;
	bh=ywpaA1EH3oNy9EEn3g4JabojjmcP8mrY7cp3FkFdaz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gN1hG+izQEqpxYZM9o0dd5iE1GjZKMjAWwJOtoVhFT+t8qh/7rjO4zCDM5gFfBVHR7ZCzbani3Tql8JHYmTr9eXS1kdI3Imeg45v6PtBYdHPGsrR6xQ44GXnl+RXHPRrxS4kztGnX5OBNH0NPopbxmp4EMitBMVO9vgSNvVzSoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIUDWMUB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCE6C2BD10;
	Mon,  3 Jun 2024 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717419168;
	bh=ywpaA1EH3oNy9EEn3g4JabojjmcP8mrY7cp3FkFdaz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIUDWMUBnfcAJ28QxhZIYAQWijx7MXKlOCQwvau55PtvY0v3JysjrqkHToHEsLJOz
	 Zy+TrfIrXPDbkkk8TM10LoSvA/JdL33yKUFPj1ESFYLxPy3up44tzsZKrmUY5DF4Dt
	 t+QmmCredUCOVuiN5ZC/38n70eVsL+dpmQevX8ceeKNUCjnoiFf1K6QoQ7oU27monU
	 ZuH+RNyX8T8QWQwHXE8dN5x+wOtfgfTauzGuQn4O2tNW4LogD+rNza2/ebroDf4yLW
	 LUCVP4k+bY3fm3Jj6LlYMsjekANUYWpHNSlUwV+RS7YG4ci3FN9cHGXe34z8kURd3l
	 VM7M9e66Clklg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sE7B8-000000000po-12ID;
	Mon, 03 Jun 2024 14:52:46 +0200
Date: Mon, 3 Jun 2024 14:52:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Make the PCIe 6a PHY
 support 4 lanes mode
Message-ID: <Zl28nvnpGFRsYpGh@hovoldconsulting.com>
References: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
 <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>

On Fri, May 31, 2024 at 08:00:32PM +0300, Abel Vesa wrote:
> So the PCIe 6 can be configured in 4-lane mode or 2-lane mode. For

s/So the PCIe 6/The PCIe 6a controller and PHY/

> 4-lane mode, it fetches the lanes provided by PCIe 6b. For 2-lane mode,

s/fetches/uses/

> PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2 lanes. Configure
> it in 4-lane mode and then each board can configure it depending on the
> design. Both the QCP and CRD boards, currently upstream, use the 6a for

s/use the/use PCIe 6a/

> NVMe in 4-lane mode. Also, mark the controller as 4-lane as well.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> @@ -2903,19 +2903,21 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  		};
>  
>  		pcie6a_phy: phy@1bfc000 {
> -			compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy";
> -			reg = <0 0x01bfc000 0 0x2000>;
> +			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
> +			reg = <0 0x01bfc000 0 0x2000>,
> +			      <0 0x01bfe000 0 0x2000>;
>  
>  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
>  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
> -				 <&gcc GCC_PCIE_6A_PIPE_CLK>;

This one should not be removed as was already pointed out.

> +				 <&gcc GCC_PCIE_6A_PIPEDIV2_CLK>;
>  			clock-names = "aux",
>  				      "cfg_ahb",
>  				      "ref",
>  				      "rchng",
> -				      "pipe";
> +				      "pipe",
> +				      "pipediv2";
>  
>  			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
>  				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
> @@ -2927,6 +2929,8 @@ pcie6a_phy: phy@1bfc000 {
>  
>  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
>  
> +			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
> +
>  			#clock-cells = <0>;
>  			clock-output-names = "pcie6a_pipe_clk";

As I just mentioned in my reply on the PHY patch, this does not seem to
work on the CRD were the link still come up as 2-lane (also with the
clocks fixed):

	qcom-pcie 1bf8000.pci: PCIe Gen.4 x2 link up

So something appears to be wrong here or in the PHY changes.

Johan

