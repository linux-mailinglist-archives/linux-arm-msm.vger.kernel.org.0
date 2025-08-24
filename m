Return-Path: <linux-arm-msm+bounces-70514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CBDB32D5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 05:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A791B6190C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Aug 2025 03:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EA3823DD;
	Sun, 24 Aug 2025 03:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYuZG3Ih"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BEA946C;
	Sun, 24 Aug 2025 03:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756005360; cv=none; b=Ax1McMKdgGEggrb8MM4JaUvTvOvW9UnX24fzvbmhZYCbJj+OdQqlkW4aATMZt7mwUBVAi6AnQWL0B5IBbPqhv2795crw1zr+QTLTtdhVrNeHOEj9YXYw0YPnXFtp7vZLIcjh2ZZQ5XNIqogEHcw9hMZEKocOd3sS8CczkVxSeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756005360; c=relaxed/simple;
	bh=News6Sh290TSfF9NDn3++bnHHyva2RckbaFDqIvmwno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktjJS8t6R9V6wvnc/vk+a7TIrrphoUlck30BxYVlZMfAGrg8oOXNBpYe7eT5AC9MXs4to7a2lAtIYm9lYDF9ByAEiHgoiXGQv2pqO2exeW5Zm5Fsc/Cjce5oTEJxU0lST3rRLn8YuyHKgl3Jnx3savWubeI6i5lF8hzhq9oZjsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYuZG3Ih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C570EC113D0;
	Sun, 24 Aug 2025 03:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756005359;
	bh=News6Sh290TSfF9NDn3++bnHHyva2RckbaFDqIvmwno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYuZG3Ihp/U5bZJ3SlwlU7b9rBv957aaP94M9tQ7KQOQZ6De/cpZrKmqQABVZFRhP
	 +twYuVC4rJd/5f4gFhT4smBNYJMWtPxsww57qV9QpX0fc/RoCux3ohErBf7iNFh2BD
	 WCW/M/ePSZaBbYBafNA/fwJY9CHOqTwCRzuumUozy4NRYzk1gVWGkpt0guV/3folCt
	 r3k0pEIWzyQq9J3X14CO5TNGOcxtBPnVj9Up11+WmlWPrKpH/bd6CaeFP04K9IpFny
	 JBW4eHmAHiC1772W/O7MAecxC/bbkYPQiOdCnt5sq5flIWQ8s6cdZiGgv4wCqOq1jq
	 LIsQgdTUAStaQ==
Date: Sat, 23 Aug 2025 22:15:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Fange Zhang <fange.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Li Liu <quic_lliu6@quicinc.com>, dmitry.baryshkov@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, xiangxu.yin@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Message-ID: <hlajupt4mwb27j4kbygdk5rifthnbnyv4ypcrqd2jk4vvdytoy@fef26rluqkxi>
References: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
 <20250818-add-display-support-for-qcs615-platform-v6-2-62aad5138a78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-add-display-support-for-qcs615-platform-v6-2-62aad5138a78@oss.qualcomm.com>

On Mon, Aug 18, 2025 at 12:39:21PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add display MDSS and DSI configuration for QCS615 RIDE board.
> QCS615 has a DP port, and DP support will be added in a later patch.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>

Running dtb checker after applying your patch gives me the following:
> $ make qcom/qcs615-ride.dtb CHECK_DTBS=1
>   UPD     include/config/kernel.release
>   HOSTCC  scripts/basic/fixdep
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
> Documentation/devicetree/bindings/net/nfc/ti,trf7970a.yaml: ti,rx-gain-reduction-db: missing type definition
> Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml: fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: missing type definition
>   DTC [C] arch/arm64/boot/dts/qcom/qcs615-ride.dtb
> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#

Taniya is looking at this one.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: gpio@3e: $nodename:0: 'gpio@3e' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
>         from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#

This is from your patch.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bridge@58: 'vdd10-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#

This is from your patch.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bridge@58: 'vdd18-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#

This is from your patch.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bridge@58: 'vdd33-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#

This is from your patch.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: bridge@58: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/display/bridge/analogix,anx7625.yaml#

This is from your patch.

> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: phy@ae94400: Unevaluated properties are not allowed ('vdds-supply' was unexpected)
>         from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#

This is from your patch.


Am I missing something? Is there any reason why these 6 new errors
should be added?

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 90 ++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 59582d3dc4c49828ef4a0d22a1cbaba715c7ce8c..39c757b66f47579d9bc7cc5c4d703f7af4434df4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -39,6 +39,18 @@ xo_board_clk: xo-board-clk {
>  		};
>  	};
>  
> +	dp-dsi0-connector {
> +		compatible = "dp-connector";
> +		label = "DSI0";
> +		type = "mini";
> +
> +		port {
> +			dp_dsi0_connector_in: endpoint {
> +				remote-endpoint = <&dsi2dp_bridge_out>;
> +			};
> +		};
> +	};
> +
>  	vreg_conn_1p8: regulator-conn-1p8 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_conn_1p8";
> @@ -294,6 +306,84 @@ &gcc {
>  		 <&sleep_clk>;
>  };
>  
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	io_expander: gpio@3e {
> +		compatible = "semtech,sx1509q";
> +		reg = <0x3e>;
> +		interrupts-extended = <&tlmm 58 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		semtech,probe-reset;
> +	};
> +
> +	i2c-mux@77 {
> +		compatible = "nxp,pca9542";
> +		reg = <0x77>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			bridge@58 {
> +				compatible = "analogix,anx7625";
> +				reg = <0x58>;
> +				interrupts-extended = <&io_expander 0 IRQ_TYPE_EDGE_FALLING>;
> +				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> +				wakeup-source;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						dsi2dp_bridge_in: endpoint {
> +							remote-endpoint = <&mdss_dsi0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						dsi2dp_bridge_out: endpoint {
> +							remote-endpoint = <&dp_dsi0_connector_in>;
> +						};
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&dsi2dp_bridge_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> +
>  &pcie {
>  	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> 
> -- 
> 2.34.1
> 

