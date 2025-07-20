Return-Path: <linux-arm-msm+bounces-65760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB661B0B34B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 05:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FADF189E1FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 03:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9723A1917D0;
	Sun, 20 Jul 2025 03:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYdpVBwv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6838D2A1C9;
	Sun, 20 Jul 2025 03:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752982098; cv=none; b=XeqNkMvue8YEtnPr2uGMFAnwoXwOnKh9xOg8imATHH7YFUPpGkq46Ug7PU9EfZvva81fJ+sjW1/pgKQeX/bjc2hSOJF/x7sw6VPMwznDgie0BM3knY9OijI3EfypbQ/iZSwLv549Sru+yOjmoqg2U5fBM+xnUWsjHBmL4m7Pw9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752982098; c=relaxed/simple;
	bh=YgRnU1KJPYy/KuZnKf/Ckin0rak5CKm1oTwho/kRIUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNBTJWXe6pdLmZ7sO/s1874JaxN+CdB80W88tj7I7UQwLWIM7AWXJSLWZov7sPHF3FtuP2xlhkRl6RptmDvjL1+KwX0mWeycfQzHL6/7fbA06QuaF05QIuWpmX4SA822v6JkllBLc1OjAmU7pulci+SgGDma7N0dugEoeX1ucwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYdpVBwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E208FC4CEF4;
	Sun, 20 Jul 2025 03:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752982097;
	bh=YgRnU1KJPYy/KuZnKf/Ckin0rak5CKm1oTwho/kRIUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OYdpVBwvCT6eOflLR212+hQCIwCtDJjf0wjadSFyLwn8LwNKYbcvI9l7LfVYySpTr
	 OGxhOAZAMSuvmkksMa2Tm+FcmDr3WzRXzsYf2sgbjOhtug+0G1V/+SJBq6xQaEQi6O
	 X7Y7RD7LDdaIixyxcjN6nkQaCmuAGBa4F2l0izilQUnWAGHoKIDpmZcU1qefWU9i76
	 EVF5b80gl51mxYAqBU1ckIz15idWrzHWU9yORyx0ZDRFqoBFq0Ptko1se+05oD1ul1
	 kd2WLJn/og1HDzVZ1gf3D8PtQO0wgw5YoBanXydn3DdWHJyofW01B+7PMTQhSx4jSW
	 FhB5/cf8e+/5g==
Date: Sat, 19 Jul 2025 22:28:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ling Xu <quic_lxu5@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain
 indices
Message-ID: <q2zrfllvtvnrzfxie5oswe5epthvdadvz3ki3n3gb6thbn7vek@ef6ble5vbfbm>
References: <20250718-fix-rpmhpd-abi-v2-0-0059edb9ddb3@oss.qualcomm.com>
 <20250718-fix-rpmhpd-abi-v2-1-0059edb9ddb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718-fix-rpmhpd-abi-v2-1-0059edb9ddb3@oss.qualcomm.com>

On Fri, Jul 18, 2025 at 06:25:38PM +0300, Dmitry Baryshkov wrote:
> On SA8775P power domains device doesn't use unufied (RPMHPD_foo) ABI,

"unified"

> but it uses SoC-specific indices (SA8775P_foo). Consequently, all DSP on
> that platform are referencing random PDs instead of the expected ones.
> 
> Correct indices used for that platform.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9997a29901f57d7894dc1eacb6a809caa427c6c4..214e2c0e74ef53e8bc57acb8ee88901ef1006298 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -17,7 +17,6 @@
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/firmware/qcom,scm.h>
> -#include <dt-bindings/power/qcom,rpmhpd.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  
> @@ -6055,8 +6054,8 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd RPMHPD_CX>,
> -					<&rpmhpd RPMHPD_MXC>;
> +			power-domains = <&rpmhpd SA8775P_CX>,
> +					<&rpmhpd SA8775P_MXC>;
>  			power-domain-names = "cx", "mxc";
>  
>  			interconnects = <&gpdsp_anoc MASTER_DSP0 0
> @@ -6098,8 +6097,8 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd RPMHPD_CX>,
> -					<&rpmhpd RPMHPD_MXC>;
> +			power-domains = <&rpmhpd SA8775P_CX>,
> +					<&rpmhpd SA8775P_MXC>;
>  			power-domain-names = "cx", "mxc";
>  
>  			interconnects = <&gpdsp_anoc MASTER_DSP1 0
> @@ -6239,9 +6238,9 @@ remoteproc_cdsp0: remoteproc@26300000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd RPMHPD_CX>,
> -					<&rpmhpd RPMHPD_MXC>,
> -					<&rpmhpd RPMHPD_NSP0>;
> +			power-domains = <&rpmhpd SA8775P_CX>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_NSP0>;
>  			power-domain-names = "cx", "mxc", "nsp";
>  
>  			interconnects = <&nspa_noc MASTER_CDSP_PROC 0
> @@ -6371,9 +6370,9 @@ remoteproc_cdsp1: remoteproc@2a300000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd RPMHPD_CX>,
> -					<&rpmhpd RPMHPD_MXC>,
> -					<&rpmhpd RPMHPD_NSP1>;
> +			power-domains = <&rpmhpd SA8775P_CX>,
> +					<&rpmhpd SA8775P_MXC>,
> +					<&rpmhpd SA8775P_NSP1>;
>  			power-domain-names = "cx", "mxc", "nsp";
>  
>  			interconnects = <&nspb_noc MASTER_CDSP_PROC_B 0
> @@ -6527,8 +6526,8 @@ remoteproc_adsp: remoteproc@30000000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "xo";
>  
> -			power-domains = <&rpmhpd RPMHPD_LCX>,
> -					<&rpmhpd RPMHPD_LMX>;
> +			power-domains = <&rpmhpd SA8775P_LCX>,
> +					<&rpmhpd SA8775P_LMX>;
>  			power-domain-names = "lcx", "lmx";
>  
>  			interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
> 
> -- 
> 2.39.5
> 

