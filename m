Return-Path: <linux-arm-msm+bounces-71050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB55B38E7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 00:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9B313ACEC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 22:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B8D2FD7AD;
	Wed, 27 Aug 2025 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GiMiXmZJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD064438B;
	Wed, 27 Aug 2025 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756334099; cv=none; b=H3mkSIKzhVDdPyfDzc8CByEMM5YhaPj5UGT2w+bLgaAK1fmFt/laH3TujPISJn5G3Iy+mn8RJ5ZzyeTkDVexEMjFgDPAdfcQlfmh/9X2or58GxgUjBbpS+tFi+b7dia5oPvnx+7ottZ3h6ztsZh8IOxBgo1kb4zCPX2m9zbQg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756334099; c=relaxed/simple;
	bh=i3u6/aj5Eue5VjcDEtYoQotYP3uJqs5m0GzEDZoBVPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRo6Uq810I9LBJm1czceBOtI0VPNfkKRq8gH23+faC1K46hwTVAiiTM14+eAAAlo9pbZX7EYE2fBksOzqZcboznI69fDe80btKek/mQQfDHqjlyX3ZaEaHZWUM64noJMlRMeTwuzERDaK47K6ffJKNPaVdKv/Aas5iulNkahZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GiMiXmZJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E466C4CEEB;
	Wed, 27 Aug 2025 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756334099;
	bh=i3u6/aj5Eue5VjcDEtYoQotYP3uJqs5m0GzEDZoBVPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GiMiXmZJcH+6lDg7zkqFB6PQ857v8PCKy7qky5AzXYzk9RTUmh0nUfbEz2HZj+xQk
	 TAwl2x3iWZYyjAxnaPxNqVuGSncy5mSSKZGM3Xg2iwhk8/aHQcJ0tS8Vk9HgQUhQW2
	 t8qZ0nkU0+GexXpe8tFtUnug9uhiF98B1J0WtzLPVmxP27FjE1CRrB6rWxEPUGpgjr
	 Csj2lKOHMBatJD0S7estipOgXFF8wNCVCHjTqaOOtV+D4Y1jYvMQgCtGVBDONM3MVf
	 bmH7WgWTdhVRR6+iPr4ywyhC3CEXy2CeFEPuAriLFwirVZFUenh+2jyeC1M5O+6V3J
	 xgmKb6JkJOZ9g==
Date: Wed, 27 Aug 2025 17:34:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Yingying Tang <quic_yintang@quicinc.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <gbdg5hkuzd2oynypnz2j6icauqthnweg4tjimeph4bqwvjdkuc@srkxskvxc6sm>
References: <20250827-hamoa_initial-v7-0-f9b81d564bb2@oss.qualcomm.com>
 <20250827-hamoa_initial-v7-2-f9b81d564bb2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827-hamoa_initial-v7-2-f9b81d564bb2@oss.qualcomm.com>

On Wed, Aug 27, 2025 at 10:52:19AM +0800, Yijie Yang wrote:
> The HAMOA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1e80100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> This change enables the following components:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Yingying Tang <quic_yintang@quicinc.com> # PCIe4 and WLAN
> Signed-off-by: Yingying Tang <quic_yintang@quicinc.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>

I'm sorry, but I can't merge this as checkpatch doesn't approve of the
way you write the Co-developed-by, and I don't like it either - in
particular when looking at the 3rd patch,

As this is all from Qualcomm, please change this such that one person
(the author) certifies the origin of the patch (in accordance with DCO
1.1 bullet a). You can attribute the additional authors by writing
"Written in collaboration with Yingying Tang <and other names for the
3rd patch>" above the tags.

PS. Please run checkpatch before sending your patches.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 609 ++++++++++++++++++++++++++++
>  1 file changed, 609 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> new file mode 100644
> index 000000000000..5facc5544c3d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "x1e80100.dtsi"
> +#include "x1e80100-pmics.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +/ {
> +	compatible = "hamoa-iot-som", "qcom,x1e80100";
> +
> +	reserved-memory {
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			size = <0x0 0x8000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	/* PMC8380C_B */
> +	regulators-0 {
> +		compatible = "qcom,pm8550-rpmh-regulators";
> +		qcom,pmic-id = "b";
> +
> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
> +		vdd-l2-l13-l14-supply = <&vreg_bob1>;
> +		vdd-l5-l16-supply = <&vreg_bob1>;
> +		vdd-l6-l7-supply = <&vreg_bob2>;
> +		vdd-l8-l9-supply = <&vreg_bob1>;
> +		vdd-l12-supply = <&vreg_s5j_1p2>;
> +		vdd-l15-supply = <&vreg_s4c_1p8>;
> +		vdd-l17-supply = <&vreg_bob2>;
> +
> +		vreg_bob1: bob1 {
> +			regulator-name = "vreg_bob1";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_bob2: bob2 {
> +			regulator-name = "vreg_bob2";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1b_1p8: ldo1 {
> +			regulator-name = "vreg_l1b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_3p0: ldo2 {
> +			regulator-name = "vreg_l2b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5b_3p0: ldo5 {
> +			regulator-name = "vreg_l5b_3p0";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6b_1p8: ldo6 {
> +			regulator-name = "vreg_l6b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_2p8: ldo7 {
> +			regulator-name = "vreg_l7b_2p8";
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_3p0: ldo8 {
> +			regulator-name = "vreg_l8b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_2p9: ldo9 {
> +			regulator-name = "vreg_l9b_2p9";
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_1p2: ldo12 {
> +			regulator-name = "vreg_l12b_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l13b_3p0: ldo13 {
> +			regulator-name = "vreg_l13b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14b_3p0: ldo14 {
> +			regulator-name = "vreg_l14b_3p0";
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +		};
> +
> +		vreg_l16b_2p9: ldo16 {
> +			regulator-name = "vreg_l16b_2p9";
> +			regulator-min-microvolt = <2912000>;
> +			regulator-max-microvolt = <2912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_2p5: ldo17 {
> +			regulator-name = "vreg_l17b_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380VE_C */
> +	regulators-1 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-l1-supply = <&vreg_s5j_1p2>;
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +		vdd-s4-supply = <&vph_pwr>;
> +
> +		vreg_s4c_1p8: smps4 {
> +			regulator-name = "vreg_s4c_1p8";
> +			regulator-min-microvolt = <1856000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c_1p2: ldo1 {
> +			regulator-name = "vreg_l1c_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_0p8: ldo2 {
> +			regulator-name = "vreg_l2c_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_0p8: ldo3 {
> +			regulator-name = "vreg_l3c_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380_D */
> +	regulators-2 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "d";
> +
> +		vdd-l1-supply = <&vreg_s1f_0p7>;
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s4c_1p8>;
> +		vdd-s1-supply = <&vph_pwr>;
> +
> +		vreg_l1d_0p8: ldo1 {
> +			regulator-name = "vreg_l1d_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2d_0p9: ldo2 {
> +			regulator-name = "vreg_l2d_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3d_1p8: ldo3 {
> +			regulator-name = "vreg_l3d_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380_E */
> +	regulators-3 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "e";
> +
> +		vdd-l2-supply = <&vreg_s1f_0p7>;
> +		vdd-l3-supply = <&vreg_s5j_1p2>;
> +
> +		vreg_l2e_0p8: ldo2 {
> +			regulator-name = "vreg_l2e_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3e_1p2: ldo3 {
> +			regulator-name = "vreg_l3e_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380_F */
> +	regulators-4 {
> +		compatible = "qcom,pmc8380-rpmh-regulators";
> +		qcom,pmic-id = "f";
> +
> +		vdd-l1-supply = <&vreg_s5j_1p2>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s5j_1p2>;
> +		vdd-s1-supply = <&vph_pwr>;
> +
> +		vreg_s1f_0p7: smps1 {
> +			regulator-name = "vreg_s1f_0p7";
> +			regulator-min-microvolt = <700000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_1p0: ldo1 {
> +			regulator-name = "vreg_l1f_1p0";
> +			regulator-min-microvolt = <1024000>;
> +			regulator-max-microvolt = <1024000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_1p0: ldo2 {
> +			regulator-name = "vreg_l2f_1p0";
> +			regulator-min-microvolt = <1024000>;
> +			regulator-max-microvolt = <1024000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_1p0: ldo3 {
> +			regulator-name = "vreg_l3f_1p0";
> +			regulator-min-microvolt = <1024000>;
> +			regulator-max-microvolt = <1024000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380VE_I */
> +	regulators-6 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "i";
> +
> +		vdd-l1-supply = <&vreg_s4c_1p8>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +
> +		vreg_s1i_0p9: smps1 {
> +			regulator-name = "vreg_s1i_0p9";
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2i_1p0: smps2 {
> +			regulator-name = "vreg_s2i_1p0";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1i_1p8: ldo1 {
> +			regulator-name = "vreg_l1i_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2i_1p2: ldo2 {
> +			regulator-name = "vreg_l2i_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3i_0p8: ldo3 {
> +			regulator-name = "vreg_l3i_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMC8380VE_J */
> +	regulators-7 {
> +		compatible = "qcom,pm8550ve-rpmh-regulators";
> +		qcom,pmic-id = "j";
> +
> +		vdd-l1-supply = <&vreg_s1f_0p7>;
> +		vdd-l2-supply = <&vreg_s5j_1p2>;
> +		vdd-l3-supply = <&vreg_s1f_0p7>;
> +		vdd-s5-supply = <&vph_pwr>;
> +
> +		vreg_s5j_1p2: smps5 {
> +			regulator-name = "vreg_s5j_1p2";
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1j_0p8: ldo1 {
> +			regulator-name = "vreg_l1j_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2j_1p2: ldo2 {
> +			regulator-name = "vreg_l2j_1p2";
> +			regulator-min-microvolt = <1256000>;
> +			regulator-max-microvolt = <1256000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3j_0p8: ldo3 {
> +			regulator-name = "vreg_l3j_0p8";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&pcie4 {
> +	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie4_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie4_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a {
> +	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&pcie6a_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&pcie6a_phy {
> +	vdda-phy-supply = <&vreg_l1d_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&qupv3_0 {
> +	status = "okay";
> +};
> +
> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&qupv3_2 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/x1e80100/adsp.mbn",
> +			"qcom/x1e80100/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/x1e80100/cdsp.mbn",
> +			"qcom/x1e80100/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* TPM LP & INT */
> +			       <44 4>; /* SPI (TPM) */
> +
> +	pcie4_default: pcie4-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio147";
> +			function = "pcie4_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio146";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio148";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	pcie6a_default: pcie6a-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie6a_clk";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +
> +		};
> +	};
> +};
> +
> +&usb_1_ss0 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss0_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l1j_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss1_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2 {
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	vdd-supply = <&vreg_l3j_0p8>;
> +	vdda12-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss2_qmpphy {
> +	vdda-phy-supply = <&vreg_l2j_1p2>;
> +	vdda-pll-supply = <&vreg_l2d_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&usb_2 {
> +	status = "okay";
> +};
> +
> +&usb_2_dwc3 {
> +	dr_mode = "host";
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy1 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy1 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.34.1
> 

