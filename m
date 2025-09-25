Return-Path: <linux-arm-msm+bounces-75161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E250DBA0C0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 19:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7243B9B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 17:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3F630BB91;
	Thu, 25 Sep 2025 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uo2KfWBr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB0730B527;
	Thu, 25 Sep 2025 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820168; cv=none; b=JY1hClZHCVRNFgKe2eEkxV0YY8xhwqfAQcQ6vi9TyKYM7HXeuyhlph8r0e5J31g1sROJ7I8qO1CRvFFpjs6uQLpM/lX7n7XnOqpqefktZSB83xXs0DYWjyS2zg83iN0BCujttJ+l50Jcnxted95yOSyByysfUX7zMR75ILTWONA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820168; c=relaxed/simple;
	bh=XDxPM6jflzJUIZwXDJYFUZz4XlIBk/qtwe3fVUXPTD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGbvIPdv8Ns44iTyQfdeVK+CeRBXPB6kcjSTUQ9/ziYDu1Itp7AphgB2+K8q7kihQQTizPNOL0vUdHcasW+ScpsuyOvBAoU0klH6yEcRZOBKT7OnzsCXzSj+WF3tuBn7fWnrGvZ+aGHcNZ2W95UYMF71ynU17sR6m97etEKqdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uo2KfWBr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF0BC4CEF0;
	Thu, 25 Sep 2025 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758820167;
	bh=XDxPM6jflzJUIZwXDJYFUZz4XlIBk/qtwe3fVUXPTD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uo2KfWBr261HqEGuBWaHjFXtLnSXRrnavsybCrV5hzGIys/0qlL5nOaj6zex3vdQH
	 TIhhdep/ojwk/8oX9Iat5B5/0dLFvNKQPHZpeMA0E0B2ggw0u2uqHPr0N6AUXaDIo5
	 UuRHgxh99juiH+6mRos3y/6VVybtoYf63ZlAlkB40Xhhsa6hR3yfe2mQ8v2ptRTh/w
	 2LLPVO04OIyA3piw0QY1mCUNNPte5TN1RlhRL5pT2DPPVn3EviQOPQRUbkuqdaux8I
	 gHo6IItOoSf2rJGvFrKEkkD1rr7ulNyQe2l8KhviSFYSRk5PjP6ww4ySTUIhDLhern
	 iRVqT0hOjtWgA==
Date: Thu, 25 Sep 2025 12:09:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 09/24] arm64: dts: qcom: glymur-crd: Add RPMH regulator
 rails
Message-ID: <pqulydlgdjrbgv2l2wgienn6bdzvmf7lafriwt6d3aqabkolkj@5jrjv4jnqyyz>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-9-24b601bbecc0@oss.qualcomm.com>

On Thu, Sep 25, 2025 at 12:02:17PM +0530, Pankaj Patil wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> Add RPMH regulator rails for Glymur CRD.
> 

Please don't sprinkle board-specific changes throughout the series.

It's useful to introduce the dts early on, so that any dtsi changes gets
compiled, but you can then group the board-specific changes at the end
of the series; and squash them into one.

Regards,
Bjorn

> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 332 ++++++++++++++++++++++++++++++++
>  1 file changed, 332 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 4561c0b87b017cba0a1db8814123a070b37fd434..e89b81dcb4f47b78307fa3ab6831657cf6491c89 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -6,6 +6,7 @@
>  /dts-v1/;
>  
>  #include "glymur.dtsi"
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. Glymur CRD";
> @@ -66,3 +67,334 @@ chosen {
>  &tlmm {
>  	gpio-reserved-ranges = <4 4>, <10 2>, <44 4>; /*Security SPI (TPM)*/
>  };
> +
> +&apps_rsc {
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	regulators-0 {
> +		compatible = "qcom,pmh0101-rpmh-regulators";
> +		qcom,pmic-id = "B_E0";
> +
> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +		vdd-l1-l10-l15-supply = <&vreg_s9f_e0_1p9>;
> +		vdd-l2-l7-l8-l9-l16-supply = <&vreg_bob1_e0>;
> +		vdd-l11-l12-l18-supply = <&vreg_s7f_e0_1p32>;
> +		vdd-l17-supply = <&vreg_bob2_e0>;
> +
> +		vreg_bob1_e0: bob1 {
> +			regulator-name = "vreg_bob1_e0";
> +			regulator-min-microvolt = <2200000>;
> +			regulator-max-microvolt = <4224000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_bob2_e0: bob2 {
> +			regulator-name = "vreg_bob2_e0";
> +			regulator-min-microvolt = <2540000>;
> +			regulator-max-microvolt = <3600000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
> +
> +		vreg_l1b_e0_1p8: ldo1 {
> +			regulator-name = "vreg_l1b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2b_e0_2p9: ldo2 {
> +			regulator-name = "vreg_l2b_e0_2p9";
> +			regulator-min-microvolt = <2900000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7b_e0_2p79: ldo7 {
> +			regulator-name = "vreg_l7b_e0_2p79";
> +			regulator-min-microvolt = <2790000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8b_e0_1p50: ldo8 {
> +			regulator-name = "vreg_l8b_e0_1p50";
> +			regulator-min-microvolt = <1504000>;
> +			regulator-max-microvolt = <3544000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9b_e0_2p7: ldo9 {
> +			regulator-name = "vreg_l9b_e0_2p7";
> +			regulator-min-microvolt = <2700000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10b_e0_1p8: ldo10 {
> +			regulator-name = "vreg_l10b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11b_e0_1p2: ldo11 {
> +			regulator-name = "vreg_l11b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12b_e0_1p14: ldo12 {
> +			regulator-name = "vreg_l12b_e0_1p14";
> +			regulator-min-microvolt = <1140000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15b_e0_1p8: ldo15 {
> +			regulator-name = "vreg_l15b_e0_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17b_e0_2p4: ldo17 {
> +			regulator-name = "vreg_l17b_e0_2p4";
> +			regulator-min-microvolt = <2400000>;
> +			regulator-max-microvolt = <2700000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l18b_e0_1p2: ldo18 {
> +			regulator-name = "vreg_l18b_e0_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E0";
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +
> +		vreg_s1c_e0_0p3: smps1 {
> +			regulator-name = "vreg_s1c_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8c_e0_0p3: smps8 {
> +			regulator-name = "vreg_s8c_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-2 {
> +		compatible = "qcom,pmcx0102-rpmh-regulators";
> +		qcom,pmic-id = "C_E1";
> +
> +		vdd-l2-supply = <&vreg_s7f_e0_1p32>;
> +		vdd-l1-l3-l4-supply = <&vreg_s8f_e0_0p95>;
> +
> +		vreg_l1c_e1_0p82: ldo1 {
> +			regulator-name = "vreg_l1c_e1_0p82";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <958000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c_e1_1p14: ldo2 {
> +			regulator-name = "vreg_l2c_e1_1p14";
> +			regulator-min-microvolt = <1140000>;
> +			regulator-max-microvolt = <1300000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3c_e1_0p89: ldo3 {
> +			regulator-name = "vreg_l3c_e1_0p89";
> +			regulator-min-microvolt = <890000>;
> +			regulator-max-microvolt = <980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c_e1_0p72: ldo4 {
> +			regulator-name = "vreg_l4c_e1_0p72";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-3 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l3-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l4-supply = <&vreg_s8f_e0_0p95>;
> +
> +		vreg_s7f_e0_1p32: smps7 {
> +			regulator-name = "vreg_s7f_e0_1p32";
> +			regulator-min-microvolt = <1320000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8f_e0_0p95: smps8 {
> +			regulator-name = "vreg_s8f_e0_0p95";
> +			regulator-min-microvolt = <952000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9f_e0_1p9: smps9 {
> +			regulator-name = "vreg_s9f_e0_1p9";
> +			regulator-min-microvolt = <1900000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s10f_e0_0p3: smps10 {
> +			regulator-name = "vreg_s10f_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e0_0p82: ldo2 {
> +			regulator-name = "vreg_l2f_e0_0p82";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_e0_0p72: ldo3 {
> +			regulator-name = "vreg_l3f_e0_0p72";
> +			regulator-min-microvolt = <720000>;
> +			regulator-max-microvolt = <980000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e0_0p3: ldo4 {
> +			regulator-name = "vreg_l4f_e0_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-4 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "F_E1";
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-l1-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l4-supply = <&vreg_s8f_e0_0p95>;
> +
> +		vreg_s1f_e1_0p3: smps1 {
> +			regulator-name = "vreg_s1f_e1_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5f_e1_0p3: smps5 {
> +			regulator-name = "vreg_s5f_e1_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6f_e1_0p3: smps6 {
> +			regulator-name = "vreg_s6f_e1_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7f_e1_0p3: smps7 {
> +			regulator-name = "vreg_s7f_e1_0p3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1f_e1_0p82: ldo1 {
> +			regulator-name = "vreg_l1f_e1_0p82";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <950000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2f_e1_0p83: ldo2 {
> +			regulator-name = "vreg_l2f_e1_0p83";
> +			regulator-min-microvolt = <830000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4f_e1_1p08: ldo4 {
> +			regulator-name = "vreg_l4f_e1_1p08";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1320000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-5 {
> +		compatible = "qcom,pmh0110-rpmh-regulators";
> +		qcom,pmic-id = "H_E0";
> +
> +		vdd-l1-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l2-supply = <&vreg_s8f_e0_0p95>;
> +		vdd-l3-supply = <&vreg_s9f_e0_1p9>;
> +		vdd-l4-supply = <&vreg_s7f_e0_1p32>;
> +
> +		vreg_l1h_e0_0p89: ldo1 {
> +			regulator-name = "vreg_l1h_e0_0p89";
> +			regulator-min-microvolt = <825000>;
> +			regulator-max-microvolt = <950000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2h_e0_0p72: ldo2 {
> +			regulator-name = "vreg_l2h_e0_0p72";
> +			regulator-min-microvolt = <830000>;
> +			regulator-max-microvolt = <920000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3h_e0_0p32: ldo3 {
> +			regulator-name = "vreg_l3h_e0_0p32";
> +			regulator-min-microvolt = <320000>;
> +			regulator-max-microvolt = <2000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4h_e0_1p2: ldo4 {
> +			regulator-name = "vreg_l4h_e0_1p2";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1320000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> 
> -- 
> 2.34.1
> 

