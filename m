Return-Path: <linux-arm-msm+bounces-30328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18922966EF4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 04:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1CE91F2322E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 02:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF40736AE0;
	Sat, 31 Aug 2024 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gt53W1py"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033281E;
	Sat, 31 Aug 2024 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725071903; cv=none; b=FGR7iyVkW+0o/IIVi56Q9mZS1BeSu7+zvvfkt2BiHlaYPKDbtZXqLqn7P6pZsbqL2J6U06H9lZ8KWzc8c5DiejLF8GYbboU7iUZWpEDM6+fCt4Dq1gI3Npq0j/TP3zKmSGbe+tcQEtWHKc+vEm4HqvbT16UogxLFVJW14DClZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725071903; c=relaxed/simple;
	bh=09wuZwLkeAuUG+knuKJeEJ22l9k09JG9Ts/nZj/hyfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLW5nyzs43R0kfzIxS3+106RXOwUsXVekVW8OazhLScN5ljV8z3jF9EPytw2pYiENmuaQ2YoJe4RBhrWIGG0oQp+kaZ0D8/z9nibMprxAZzvdYP946JHbPQ0LWqsOGc1iVdBgr8y7TusVwAzxQ0QzBIjgTV5J6PgCjWQomKy2ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gt53W1py; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11880C4CEC2;
	Sat, 31 Aug 2024 02:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725071903;
	bh=09wuZwLkeAuUG+knuKJeEJ22l9k09JG9Ts/nZj/hyfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gt53W1pyUH4FpPg0m1ZHdu00yrRucXBWqZ4xtdnL641T+y5hC/tjEZZnjA5Jfx1jr
	 tIv1cCFcNKOXnJ7MYNdZIYmcUEtneaJAgN2/yKZ+wAR0u/AHnsoN7r4x6chmxl6z4I
	 3UkUuz73bJrHpgsFP6rBzxb41VhVV0no2JQM9D+1ghZs/expDCJrweIpaH3UJAFXx3
	 cCZqcjjzNHFarThyQ3dg0yGVqL1+vs/t9eyPg8srTl1RG4eNDK5Z4q9WZpLSVLUhQt
	 PuSnC2hIlEhchCistFYqobpn/B6qLIO8PXTDi+fn5rDPAuLT7YnivTYBc6XKSy+qjd
	 ResWxUuhNug3g==
Date: Fri, 30 Aug 2024 21:38:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_narepall@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com, 
	quic_mapa@quicinc.com, quic_cang@quicinc.com, quic_nguyenb@quicinc.com
Subject: Re: [PATCH V2] arm64: dts: qcom: Add SD Card node for qcm6490-idp
Message-ID: <u5nufa6tjpzbk333ybgiq2h6ykjpjr7cwmqq6gjpejcmb7fxmo@tmpgd75nxqba>
References: <20240829114748.9661-1-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829114748.9661-1-quic_sachgupt@quicinc.com>

On Thu, Aug 29, 2024 at 05:17:48PM GMT, Sachin Gupta wrote:

> Add SD Card node for Qualcomm qcm6490-idp Board.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
> 
> Changes from v1:
>  - Define sd_cd node. (Thanks Dmitry)
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 33 ++++++++++++++++++++++++

The subject for other changes to this file starts with:
  arm64: dts: qcom: qcm6490-idp:

Fixing it up while applying the patch, but please run a "git log
--oneline -- <file>" next time to make sure.

Regards,
Bjorn

>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index a0668f767e4b..95d5cf2d9bcd 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -641,6 +641,21 @@
>  	status = "okay";
>  };
>  
> +&sdc2_clk {
> +	bias-disable;
> +	drive-strength = <16>;
> +};
> +
> +&sdc2_cmd {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
> +&sdc2_data {
> +	bias-pull-up;
> +	drive-strength = <10>;
> +};
> +
>  &sdhc_1 {
>  	non-removable;
>  	no-sd;
> @@ -655,12 +670,30 @@
>  &tlmm {
>  	gpio-reserved-ranges = <32 2>, /* ADSP */
>  			       <48 4>; /* NFC */
> +
> +	sd_cd: sd-cd-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		bias-pull-up;
> +	};
>  };
>  
>  &uart5 {
>  	status = "okay";
>  };
>  
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
> +	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
> +
> +	vmmc-supply = <&vreg_l9c_2p96>;
> +	vqmmc-supply = <&vreg_l6c_2p96>;
> +
> +	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
> +};
> +
>  &usb_1 {
>  	status = "okay";
>  };
> -- 
> 2.17.1
> 

