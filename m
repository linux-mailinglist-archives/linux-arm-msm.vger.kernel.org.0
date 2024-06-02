Return-Path: <linux-arm-msm+bounces-21396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8A8D73C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE2F81C20E7D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5231018AEA;
	Sun,  2 Jun 2024 04:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIomnF28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719618026;
	Sun,  2 Jun 2024 04:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717301824; cv=none; b=mUxbCIWKamZ3obxBSTC4AJJmUds6tGJqkfxPcbGhv7wSl5rcSEtqwOsH/r/bThN/JU39YHgh82AjHSeMVOlQEnh2g6PohpprPLOqPTLr3ZsHNrhctJSDStDYYLa8q38p8KEKF0TpiXEcpIpS5Ejr7DXOOAjVWVV/1AYdZ4z+Gb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717301824; c=relaxed/simple;
	bh=pFzVliexukYVMzuAmF3jByk9BbrXHNnhdUcuGLAVzAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atUH6yyV/wAg7wRHLQGIE5ILP4VoGnsJaQgdh4KDxHrxFPpimlcRjDTVSwntv2XgYSsx6kZ/N6QKrVkM1zKhx2s6U1sp0ux22jPuoDakDiOYf9yMvReKHvARDoLTXXnMz2ClTEiFt2YQ7JJ0J9Ky6jA4pv8IbsLNcaD2AmcPmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIomnF28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B671AC2BBFC;
	Sun,  2 Jun 2024 04:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717301823;
	bh=pFzVliexukYVMzuAmF3jByk9BbrXHNnhdUcuGLAVzAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIomnF28y6JtnviYS8vNBnC/DedBJnF6DGVi/L4MR0dQksLtQXHbZE6+7zWz0YYjn
	 5ZmxxLs+yEupWQMKjvJYjHoSGzfuOUXW48uws41DVqa2wlw0GYv1q6zvixiOkBywet
	 r1nBTzg6kG3mwg5PAcLfxL62rrVZNN6X9bGccTO8s9p/qJBfvHcS0/NGL8/gnTF7My
	 JcYpzLomSk4Fp8zsEj2cYK8uyEecoqZHJijAHKumyhyb4ZsREUiv+lbbHA0JkfKEku
	 1R9ppLm80nccKyMEDznv8fZQP6NodCu+HEuJ4H2HVUq/ij2QlObQYdQTTrSefPla/d
	 RVZCBrpjfQkoA==
Date: Sat, 1 Jun 2024 23:17:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/13] arm64: dts: qcom: Add support for multimedia clock
 controllers
Message-ID: <zheryfbthco5ngjam7dtchjp5rez2mdmvdbdclvrc3h4laxlaq@eudxnu7lkott>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-14-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531090249.10293-14-quic_tdas@quicinc.com>

On Fri, May 31, 2024 at 02:32:49PM GMT, Taniya Das wrote:
> Add support for camera, display0, display1 and video clock
> controllers on SA8775P platform. While at it, update the
> sleep_clk frequency.

Whenever you feel like starting a sentence with "While at it", it's
probably a separate commit - and indeed so in this case. This will also
give you the opportunity to claim why you're changing its value...

Regards,
Bjorn

> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts |  2 +-
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 59 +++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index 26ad05bd3b3f..4684da376565 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -542,7 +542,7 @@
>  };
>  
>  &sleep_clk {
> -	clock-frequency = <32764>;
> +	clock-frequency = <32000>;
>  };
>  
>  &spi16 {
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index eae0de9720b5..7f62738671da 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6,8 +6,11 @@
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>  #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>  #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -2904,6 +2907,47 @@
>  			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		videocc: clock-controller@abf0000 {
> +			compatible = "qcom,sa8775p-videocc";
> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sa8775p-camcc";
> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		dispcc0: clock-controller@af00000 {
> +			compatible = "qcom,sa8775p-dispcc0";
> +			reg = <0x0 0x0af00000 0x0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>  			reg = <0x0 0x0b220000 0x0 0x30000>,
> @@ -3424,6 +3468,21 @@
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		dispcc1: clock-controller@22100000 {
> +			compatible = "qcom,sa8775p-dispcc1";
> +			reg = <0x0 0x22100000 0x0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>, <0>, <0>, <0>,
> +				 <0>, <0>, <0>, <0>;
> +			power-domains = <&rpmhpd SA8775P_MMCX>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		ethernet1: ethernet@23000000 {
>  			compatible = "qcom,sa8775p-ethqos";
>  			reg = <0x0 0x23000000 0x0 0x10000>,
> -- 
> 2.17.1
> 

