Return-Path: <linux-arm-msm+bounces-87717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB489CF92F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6983D30089BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42721DED63;
	Tue,  6 Jan 2026 15:56:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAEC3B28D;
	Tue,  6 Jan 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714965; cv=none; b=Qp+F6JmMlkHEA97aNS61tuQNTS1Pp+8e0Nvg/4rGPpmludniaSVtuCdqJc3v45uA2N7NNflhTakdVY9S1ys1jGP647imUzrOuyly7L9NKzh6BaiKWO0kpUmf2q6LRfDEKIR++Ez4wUU5gJI8AiCUxMQcTABMVh+Sm0nZvq4zLUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714965; c=relaxed/simple;
	bh=T2uGbtWx6bDmY/1ikp3WDsc86XTjx3XhYtdjuLxBTlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZQJKRlmIEfOHX6g1Fiu6YhpgXHDwKBQVxB808wnSVoofoL80844tAcDv6g0bJjo1/RoF3XcuvnT/nMArWtMi2j+gS07do68YGVYCfdzr/KXC79JqxRCP283bDlUo0Mgi+Znp0m8KxIt2In9Tsseol1BRc+bPbAuxDR/Irg5+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2605FC16AAE;
	Tue,  6 Jan 2026 15:56:02 +0000 (UTC)
Message-ID: <a2149736-a0e5-44a4-916f-c8a915f7c38b@nxsw.ie>
Date: Tue, 6 Jan 2026 15:56:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260106-b4-sm8750-iris-dts-v4-0-97db1d1df3dd@oss.qualcomm.com>
 <Hxa0Kxik05DGidPKFVzZPdG8DOWufi_Cmt8Z7t3nbNq76GDa3jd-oH1o0zJ53ftFq8vofPdUbRUP18HjiPOF6A==@protonmail.internalid>
 <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20260106-b4-sm8750-iris-dts-v4-1-97db1d1df3dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/01/2026 09:07, Krzysztof Kozlowski wrote:
> Add Iris video codec to SM8750 SoC, which comes with significantly
> different powering up sequence than previous SM8650, thus different
> clocks and resets.  For consistency keep existing clock and clock-names
> naming, so the list shares common part.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 121 +++++++++++++++++++++++++++++++++++
>   1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 0a6f2a449c20..a76bf5193a70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>   #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +#include <dt-bindings/clock/qcom,sm8750-videocc.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interconnect/qcom,icc.h>
> @@ -2811,6 +2812,126 @@ usb_dwc3_ss: endpoint {
>   			};
>   		};
> 
> +		iris: video-codec@aa00000 {
> +			compatible = "qcom,sm8750-iris";
> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
> +
> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_CLK>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +			clock-names = "iface",
> +				      "core",
> +				      "vcodec0_core",
> +				      "iface1",
> +				      "core_freerun",
> +				      "vcodec0_core_freerun";
> +
> +			dma-coherent;
> +			iommus = <&apps_smmu 0x1940 0>,
> +				 <&apps_smmu 0x1947 0>;
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "cpu-cfg",
> +					     "video-mem";
> +
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			memory-region = <&video_mem>;
> +
> +			operating-points-v2 = <&iris_opp_table>;
> +
> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +					<&videocc VIDEO_CC_MVS0_GDSC>,
> +					<&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mxc",
> +					     "mmcx";
> +
> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +			reset-names = "bus0",
> +				      "bus1",
> +				      "core",
> +				      "vcodec0_core";
> +
> +			/*
> +			 * IRIS firmware is signed by vendors, only
> +			 * enable in boards where the proper signed firmware
> +			 * is available.
> +			 */
> +			status = "disabled";
> +
> +			iris_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +							<&rpmhpd_opp_low_svs_d1>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_low_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-420000000 {
> +					opp-hz = /bits/ 64 <420000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-533333334 {
> +					opp-hz = /bits/ 64 <533333334>;
> +					required-opps = <&rpmhpd_opp_nom>,
> +							<&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-570000000 {
> +					opp-hz = /bits/ 64 <570000000>;
> +					required-opps = <&rpmhpd_opp_nom_l1>,
> +							<&rpmhpd_opp_nom_l1>;
> +				};
> +
> +				opp-630000000 {
> +					opp-hz = /bits/ 64 <630000000>;
> +					required-opps = <&rpmhpd_opp_turbo>,
> +							<&rpmhpd_opp_turbo>;
> +				};
> +			};
> +		};
> +
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,sm8750-videocc";
> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_VIDEO_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		pdc: interrupt-controller@b220000 {
>   			compatible = "qcom,sm8750-pdc", "qcom,pdc";
>   			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;
> 
> --
> 2.51.0
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

