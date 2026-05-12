Return-Path: <linux-arm-msm+bounces-107169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FcqJQaKA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:13:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2A0528FCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F65D301157D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB493AC0C6;
	Tue, 12 May 2026 20:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipbr2QOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE653AB29B;
	Tue, 12 May 2026 20:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616831; cv=none; b=UTAtGGb44pGssaMUyic4F6Q64Wdlr3pKfkPFWAPtPn9HQNtVv+colcoD8Pf9v44E+Sab4/S8u/1E6RuhBmXSjQdudjOLh96HmcAp8HNRcSPZ00Uk+jfsSsYNC55q3b1JqdejXZLtQGYh5ghDh7xZZhJQP0Y6gDG1MSDQ290WyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616831; c=relaxed/simple;
	bh=XvB3gabDoBtEZDsoQE+oOCgIII/QrOVRQO8RyhFRouM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFODBaJ0cWHgVxGa89VaxIrokJpIgC3mlFX/VVnQNjSU5fLPmsOUlsmAetPT444ozHFnP8pODH78D3xwmJ6RYc0q5PlxDyla5+C8ONzYsx+CIzz2U0D+/aG2JcLg9tIR25RcN0GL0Tehsxc5X76G5HyKcZQ3TVJYvstHrZqumbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipbr2QOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019D5C2BCB0;
	Tue, 12 May 2026 20:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778616830;
	bh=XvB3gabDoBtEZDsoQE+oOCgIII/QrOVRQO8RyhFRouM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipbr2QOBXC73RkC+UYQpb8prJLPRYxG4rD8FmmM01iI/XOR6Id90XPw+sgjk06rd1
	 dNCZ1Hcyp73yMvqYzM5jPzBRQxOM9vTep0KZ/MdNowC+vHcL+6FKwxWTojXlWJPc6T
	 0mqoHV9sr6Y7osZIv9v/rgBMnApnPqx6rauMP1MlWzS9b40447Gg/08cWvS22/I4f3
	 kfUgnkOvBvkV9cLEo85Kx/tj/yg1PABSasFr7LM6xmprJmWTrbIQ6hvkSnGDIPoBG6
	 aDi3wYY8O9Fh3Jf/Tv+E/fJ9zwpHugl2bPG+/vESfcQ0WkNKwHBTcNHWFsuadsi2L+
	 c5AiMjZ4r+blQ==
Date: Tue, 12 May 2026 15:13:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Imran Shaik <imran.shaik@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sm8750: Add camera clock controller
Message-ID: <agOHPTif98-gTk8_@baldur>
References: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-sm8750_camcc_dt-v4-1-eab4b6c3eaea@oss.qualcomm.com>
X-Rspamd-Queue-Id: 9F2A0528FCD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107169-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.27.41.32:email,0.25.240.160:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ade0000:email,0.26.219.0:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 03:45:43PM +0530, Taniya Das wrote:
> The camera clock controller is split into cambistmclk and camcc. The
> cambist clock controller handles the mclks and the rest of the clocks of
> camera are part of the camcc clock controller.
> Add the camcc clock controller device node for SM8750 SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v4:
> - Fix Stray space before the ',' in cambistcc node [Konrad]
> - Link to v3: https://lore.kernel.org/r/20260225-sm8750_camcc_dt-v3-1-a19d3173a160@oss.qualcomm.com
> 
> Changes in v3:
> - Update the Mx phandle to use MXC for camcc node as it is a always ON
>   rail and can sustain this usecase.
> - Link to v2: https://lore.kernel.org/r/20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com
> 
> Changes in v2:
> - Update the MxC phandle to use MX for camcc node.
> - Add RB tag [Abel Vesa] and update the commit message.
> - Link to v1: https://lore.kernel.org/r/20251203-sm8750_camcc_dt-v1-1-418e65e0e4e8@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 37 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3f0b57f428bbb388521c27d9ae96bbef3d62b2e2..dabff4518867df88d8e4cdc233ef6325635b7ae9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2,7 +2,8 @@
>  /*
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
> -
> +#include <dt-bindings/clock/qcom,sm8750-cambistmclkcc.h>
> +#include <dt-bindings/clock/qcom,sm8750-camcc.h>

I had to fix the sort order, but the merge conflict tells me that you
didn't rebase this on v7.1-rc1 (or later).

Regards,
Bjorn

>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> @@ -2046,6 +2047,23 @@ aggre2_noc: interconnect@1700000 {
>  			clocks = <&rpmhcc RPMH_IPA_CLK>;
>  		};
>  
> +		cambistmclkcc: clock-controller@1760000 {
> +		       compatible = "qcom,sm8750-cambistmclkcc";
> +		       reg = <0x0 0x1760000 0x0 0x6000>;
> +		       clocks = <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
> +				<&bi_tcxo_div2>,
> +				<&bi_tcxo_ao_div2>,
> +				<&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		mmss_noc: interconnect@1780000 {
>  			compatible = "qcom,sm8750-mmss-noc";
>  			reg = <0x0 0x01780000 0x0 0x5b800>;
> @@ -2740,6 +2758,23 @@ usb_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8750-camcc";
> +			reg = <0x0 0xade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> 
> ---
> base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
> change-id: 20251203-sm8750_camcc_dt-350a8d217376
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

