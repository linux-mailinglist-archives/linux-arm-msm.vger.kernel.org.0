Return-Path: <linux-arm-msm+bounces-79012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C995C10210
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4C2A34D8A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF23732C934;
	Mon, 27 Oct 2025 18:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adrHCve0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59CC32C33A;
	Mon, 27 Oct 2025 18:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761590672; cv=none; b=ZGSUjOu6nZ4wAGrs5pf/IpH2CduZdrYfB6FskaKuDyI8zyw+4URFRl0ymJE4OVzomPw+/Tfw5GFWc1OJy1Ly8VWQfO2n84/HePa6NiYCkmqn1AoqfMKsKG6/m8BxtamYYhoMVAzOQOpNVq0LDdD39sO/KXs8sk29SRZci9G/NZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761590672; c=relaxed/simple;
	bh=RvUxiEGFeW3NMtfz/dRup2oPdxZ5E6k0VP0dKpiXn0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9Cj+rrwL+t8ryR/D/P5M6eY5U+PX3DT8GBRDN4XqwKN7lXpz1m/VKP+yeug06p1Rn47tFtBbIr7NeuxcaufwaTOGO1tBBGecAp2nL9/qqmINIDd7FBSRhXYsLhCO9BIuWvysaR1+1PLjDmbUWChqFlITH0lh2mKPFJC1LYTtGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adrHCve0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB83FC116C6;
	Mon, 27 Oct 2025 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761590672;
	bh=RvUxiEGFeW3NMtfz/dRup2oPdxZ5E6k0VP0dKpiXn0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adrHCve0oH8U/FiBIAqdGZn/1mq1SHOWzy/ikWGq0Q3uRrBQbArugdE8T5xknY0KD
	 QSpFpaXnCy11T4f164BZNc2vWRhZ5aak9TIOQr6tojS+ofdciBa9cFHZY7rIfCO+T6
	 pVMobUrfx1qsAVTcT5zTO8K+1RNquDT1y7gSgEc5H9wPbVI9pef6mJcWg4pYG5MvES
	 XKCo9y4B95EiJdoVJjamk28P4sF4JjgPHBofsfMT8JRcITrS0wJCYpGGd+poaxIiNm
	 0SdHoXcCFpN/Ez5WScIz5AKMdmSv7SLz3RUmEwoMFpk1nMgGY3lT7jEOYKsRdtIkkh
	 TxMLN1+bI6WIg==
Date: Mon, 27 Oct 2025 13:47:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com, 
	kathiravan.thirumoorthy@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU
 thermal zones
Message-ID: <lnabvjseahtfgc32zuvnd47vwv7fefpvmubgqo3rfpl7mr4k53@fprkvzsimgim>
References: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>

On Thu, Oct 23, 2025 at 10:08:38AM +0530, Manikanta Mylavarapu wrote:
> Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
> passive trip points with CPU cooling devices. This enables proper
> thermal mitigation by allowing the thermal framework to throttle CPUs
> based on temperature thresholds. Also, label the trip points to allow
> referencing them in the cooling maps.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Please use oss.qualcomm.com going forward.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 61 +++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index ef2b52f3597d..e4a51eeefeac 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
>  #include <dt-bindings/interconnect/qcom,ipq5424.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	#address-cells = <2>;
> @@ -57,6 +58,7 @@ cpu0: cpu@0 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
>  			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
> +			#cooling-cells = <2>;
>  
>  			l2_0: l2-cache {
>  				compatible = "cache";
> @@ -82,6 +84,7 @@ cpu1: cpu@100 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
>  			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
> +			#cooling-cells = <2>;
>  
>  			l2_100: l2-cache {
>  				compatible = "cache";
> @@ -101,6 +104,7 @@ cpu2: cpu@200 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
>  			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
> +			#cooling-cells = <2>;
>  
>  			l2_200: l2-cache {
>  				compatible = "cache";
> @@ -120,6 +124,7 @@ cpu3: cpu@300 {
>  			clock-names = "cpu";
>  			operating-points-v2 = <&cpu_opp_table>;
>  			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
> +			#cooling-cells = <2>;
>  
>  			l2_300: l2-cache {
>  				compatible = "cache";
> @@ -1235,18 +1240,28 @@ cpu0-thermal {
>  			thermal-sensors = <&tsens 14>;
>  
>  			trips {
> -				cpu-critical {
> +				cpu0_crit: cpu-critical {
>  					temperature = <120000>;
>  					hysteresis = <9000>;
>  					type = "critical";
>  				};
>  
> -				cpu-passive {
> +				cpu0_alert: cpu-passive {
>  					temperature = <110000>;
>  					hysteresis = <9000>;
>  					type = "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu1-thermal {
> @@ -1254,18 +1269,28 @@ cpu1-thermal {
>  			thermal-sensors = <&tsens 12>;
>  
>  			trips {
> -				cpu-critical {
> +				cpu1_crit: cpu-critical {
>  					temperature = <120000>;
>  					hysteresis = <9000>;
>  					type = "critical";
>  				};
>  
> -				cpu-passive {
> +				cpu1_alert: cpu-passive {
>  					temperature = <110000>;
>  					hysteresis = <9000>;
>  					type = "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu1_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu2-thermal {
> @@ -1273,18 +1298,28 @@ cpu2-thermal {
>  			thermal-sensors = <&tsens 11>;
>  
>  			trips {
> -				cpu-critical {
> +				cpu2_crit: cpu-critical {
>  					temperature = <120000>;
>  					hysteresis = <9000>;
>  					type = "critical";
>  				};
>  
> -				cpu-passive {
> +				cpu2_alert: cpu-passive {
>  					temperature = <110000>;
>  					hysteresis = <9000>;
>  					type = "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu2_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		cpu3-thermal {
> @@ -1292,18 +1327,28 @@ cpu3-thermal {
>  			thermal-sensors = <&tsens 13>;
>  
>  			trips {
> -				cpu-critical {
> +				cpu3_crit: cpu-critical {
>  					temperature = <120000>;
>  					hysteresis = <9000>;
>  					type = "critical";
>  				};
>  
> -				cpu-passive {
> +				cpu3_alert: cpu-passive {
>  					temperature = <110000>;
>  					hysteresis = <9000>;
>  					type = "passive";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu3_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		wcss-tile2-thermal {
> 
> base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
> -- 
> 2.34.1
> 

