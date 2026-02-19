Return-Path: <linux-arm-msm+bounces-93394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ci3EAoRl2n7uAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:32:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A3C15F19A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89F7C3019F10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4473B2DF128;
	Thu, 19 Feb 2026 13:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7vGE277"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E877207A38;
	Thu, 19 Feb 2026 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507970; cv=none; b=EV1kKChrhSMt+Ieuk8QT2FjLpKiKnFrjN+8823nu2oMcjKVnKLueXF4Xha5jOeKXOgVP869hzAQyRwMsgSzqv9EMHv9F4rr265nUh7IcDsWC+umMVRe/kMddYozp70iWO7rRB0ncgXGl+L5MVfJqXaBpaNQI5ABidDZ/6De5zYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507970; c=relaxed/simple;
	bh=xubPgEjow0TizE8o5NeAP/MEDqvu12cgLPciyFrs9Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+9eUypJQ8OUyqWkU+jISySeaKAd7tVX9Z8SEsn0Np3GUpCoUVpCYGNcGWac+TS1BhM4fbioU5RTzcr/bLtYPbm0ZzxRpDkfjuULHuOxMfc4//qbJnsqCQx9NjSZm40A9Y2yDLT6skFkWjqu0Hom9jJDLmedQTrCVgMZjbeqiUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7vGE277; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94E5C4CEF7;
	Thu, 19 Feb 2026 13:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771507969;
	bh=xubPgEjow0TizE8o5NeAP/MEDqvu12cgLPciyFrs9Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7vGE277u0YfNvguXG10mPOay6VZsHLJw4G6Vb4DFf60vTaB02xLyhU8gfJpHULGW
	 WkhGpUNwfKnmVP4euPLrc0uCDmSKuQFKOhdLlnYKS6iVgR6OqviWsYGexkUZ/qN7hC
	 csJ840PucxUKZRjQrp8v1y+uqfokGnp+vsMYpcOFCQ5rpTtyw3x2lbsiBsQdd2MMm+
	 8j9Sd6dzLhHQx92Z9IWKEm4Q80N13M9HvrIAQD6XYJfcD9ykkBNTDtX8LhqXpnkDhi
	 m718lW52gAHbN4TtfcydhMEU5m1o5gbzqSuSXEh8PUOx6iwkG1R6D69dM9DImcGu5L
	 Phmv/mmntj3Mw==
Date: Thu, 19 Feb 2026 07:32:46 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Enable PCIe1
Message-ID: <j64qo4pnfviycyb32fuva46j54sb72djapjk2thqho4j5cbalt@4qykle6nrizo>
References: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-qcm6490-idp-v1-1-80a45bd46ac5@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93394-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 97A3C15F19A
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 05:36:29PM +0530, Sushrut Shree Trivedi wrote:
> Remove PCIe1 clocks from protected-list and enable PCIe1 controller
> and its corresponding PHY nodes on qcm6490-idp platform.
> 

Does this mean that the firmware has changed or does it mean that the
protected-clocks list has been wrong all along? Is the remaining part
of the list correct?

> PCIe1 is used to connect NVMe based SSD's on this platform.
> 

"used to connect" sounds like it's optional. If the NVMe is soldered to
the board then say that in the commit message.

> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 39 +++++++++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 089a027c57d5..1fac051ab3e7 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -533,12 +533,7 @@ vreg_bob_3p296: bob {
>  };
>  
>  &gcc {
> -	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> -			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> -			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> -			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> -			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> -			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +	protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
>  			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
>  			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> @@ -615,6 +610,22 @@ &mdss_dsi_phy {
>  	status = "okay";
>  };
>  
> +&pcie1 {
> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +};
> +
>  &pm7250b_gpios {
>  	lcd_disp_bias_en: lcd-disp-bias-en-state {
>  		pins = "gpio2";
> @@ -920,6 +931,22 @@ &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
>  
> +	pcie1_reset_n: pcie1-reset-n-state {
> +		pins = "gpio2";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		output-low;
> +		bias-disable;
> +		};

That doesn't look right.

> +
> +	pcie1_wake_n: pcie1-wake-n-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +

Extra white space.

Thanks,
Bjorn

>  	sd_cd: sd-cd-state {
>  		pins = "gpio91";
>  		function = "gpio";
> 
> ---
> base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
> change-id: 20260212-qcm6490-idp-24f7b6a1812d
> 
> Best regards,
> -- 
> Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> 

