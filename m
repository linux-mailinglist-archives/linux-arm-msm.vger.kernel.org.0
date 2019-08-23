Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 954989A75D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 08:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392254AbfHWGFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 02:05:38 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53206 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391107AbfHWGFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 02:05:38 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B651360E3E; Fri, 23 Aug 2019 06:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566540336;
        bh=SY0gmXeD0p+hxMu2r0jocsjgZ0t2cnl55WBHZv6QUbU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mMcdIYG0Nr2EywLw0vThN7DAFLNE6ccDq0kG/5zX+osawjEdnT5tB8mH1N2Ye+DHD
         PrbzwVA1qWw2OS+YlK2R6EgHAEOvHiR9zFAUEnOE8YZh3Qq6vWr2HzXK9oNxCQHsUR
         AlpYeNnMP1GZA/aHCcdowv/dn152Vi97NyDJ2i80=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 50714602CA;
        Fri, 23 Aug 2019 06:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566540335;
        bh=SY0gmXeD0p+hxMu2r0jocsjgZ0t2cnl55WBHZv6QUbU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lPw6M1noxvftRIxx0lgjILLR4C+dtoOfAlQByFBlzcLzCRziKn8vZZHisrZNlSQXg
         Gx4mqwnxjLvqnuYpu8ZL1eTAtYYe3zQRtayomeSazKM/qTKurjzPJN4+pAlzdlHohY
         Upf1z7eHNbi2YA3obJLiC4gAcwqZyfS01bNWJ3eo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Aug 2019 11:35:35 +0530
From:   kgunda@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: sm8150-mtp: Add regulators
In-Reply-To: <20190821184239.12364-7-vkoul@kernel.org>
References: <20190821184239.12364-1-vkoul@kernel.org>
 <20190821184239.12364-7-vkoul@kernel.org>
Message-ID: <2000d2ae8b0c3ee079cce75233b53330@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-08-22 00:12, Vinod Koul wrote:
> Add the regulators found in the mtp platform. This platform consists of
> pmic PM8150, PM8150L and PM8009.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 324 ++++++++++++++++++++++++
>  1 file changed, 324 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 6f5777f530ae..aa5de42fcae4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -6,6 +6,7 @@
> 
>  /dts-v1/;
> 
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8150.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -22,6 +23,329 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	/*
> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8150-s4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&apps_rsc {
> +	pm8150-rpmh-regulators {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +		vdd-s9-supply = <&vph_pwr>;
> +		vdd-s10-supply = <&vph_pwr>;
> +
> +		vdd-l1-l8-l11-supply = <&vreg_s6a_0p9>;
> +		vdd-l2-l10-supply = <&vreg_bob>;
> +		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p9>;
You no need to vote for the parent supply from the Linux driver. The 
parent/child dependency is completely taken care by the
AOP/RPMh. Voting on the parent will create unnecessary additional RPMh 
transactions, which may degrade the performance.
> +		vdd-l6-l9-supply = <&vreg_s8c_1p3>;
> +		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p0>;
> +		vdd-l13-l16-l17-supply = <&vreg_bob>;
> +
> +		vreg_s5a_2p0: smps5 {
> +			regulator-min-microvolt = <1904000>;
> +			regulator-max-microvolt = <2000000>;
> +		};
> +
> +		vreg_s6a_0p9: smps6 {
> +			regulator-min-microvolt = <920000>;
> +			regulator-max-microvolt = <1128000>;
> +		};
> +
> +		vdda_wcss_pll:
> +		vreg_l1a_0p75: ldo1 {
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_pdphy:
> +		vdda_usb_hs_3p1:
> +		vreg_l2a_3p1: ldo2 {
> +			regulator-min-microvolt = <3072000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a_0p8: ldo3 {
> +			regulator-min-microvolt = <480000>;
> +			regulator-max-microvolt = <932000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_usb_hs_core:
> +		vdda_csi_0_0p9:
> +		vdda_csi_1_0p9:
> +		vdda_csi_2_0p9:
> +		vdda_csi_3_0p9:
> +		vdda_dsi_0_0p9:
> +		vdda_dsi_1_0p9:
> +		vdda_dsi_0_pll_0p9:
> +		vdda_dsi_1_pll_0p9:
> +		vdda_pcie_1ln_core:
> +		vdda_pcie_2ln_core:
> +		vdda_pll_hv_cc_ebi01:
> +		vdda_pll_hv_cc_ebi23:
> +		vdda_qrefs_0p875_5:
> +		vdda_sp_sensor:
> +		vdda_ufs_2ln_core_1:
> +		vdda_ufs_2ln_core_2:
> +		vdda_usb_ss_dp_core_1:
> +		vdda_usb_ss_dp_core_2:
> +		vdda_qlink_lv:
> +		vdda_qlink_lv_ck:
> +		vreg_l5a_0p875: ldo5 {
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a_1p2: ldo6 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p8: ldo7 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_10:
> +		vreg_l9a_1p2: ldo9 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a_2p5: ldo10 {
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a_0p8: ldo11 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdd_qfprom:
> +		vdd_qfprom_sp:
> +		vdda_apc_cs_1p8:
> +		vdda_gfx_cs_1p8:
> +		vdda_usb_hs_1p8:
> +		vdda_qrefs_vref_1p8:
> +		vddpx_10_a:
> +		vreg_l12a_1p8: ldo12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a_2p7: ldo13 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l14a_1p8: ldo14 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a_1p7: ldo15 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1704000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a_2p7: ldo16 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a_3p0: ldo17 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3008000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pm8150l-rpmh-regulators {
> +		compatible = "qcom,pm8150l-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-s8-supply = <&vph_pwr>;
> +
> +		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
> +		vdd-l2-l3-supply = <&vreg_s8c_1p3>;
> +		vdd-l4-l5-l6-supply = <&vreg_bob>;
> +		vdd-l7-l11-supply = <&vreg_bob>;
> +		vdd-l9-l10-supply = <&vreg_bob>;
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +		vdd-flash-supply = <&vreg_bob>;
> +		vdd-rgb-supply = <&vreg_bob>;
> +
> +		vreg_bob: bob {
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <4000000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +			regulator-allow-bypass;
> +		};
> +
> +		vreg_s8c_1p3: smps8 {
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +		};
> +
> +		vreg_l1c_1p8: ldo1 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_wcss_adcdac_1:
> +		vdda_wcss_adcdac_22:
> +		vreg_l2c_1p3: ldo2 {
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1304000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vdda_hv_ebi0:
> +		vdda_hv_ebi1:
> +		vdda_hv_ebi2:
> +		vdda_hv_ebi3:
> +		vdda_hv_refgen0:
> +		vdda_qlink_hv_ck:
> +		vreg_l3c_1p2: ldo3 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_5:
> +		vreg_l4c_1p8: ldo4 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_6:
> +		vreg_l5c_1p8: ldo5 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vddpx_2:
> +		vreg_l6c_2p9: ldo6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c_3p0: ldo7 {
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <3104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c_1p8: ldo8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c_2p9: ldo9 {
> +			regulator-min-microvolt = <2704000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10c_3p3: ldo10 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11c_3p3: ldo11 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	pm8009-rpmh-regulators {
> +		compatible = "qcom,pm8009-rpmh-regulators";
> +		qcom,pmic-id = "f";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vreg_bob>;
> +
> +		vdd-l2-supply = <&vreg_s8c_1p3>;
> +		vdd-l5-l6-supply = <&vreg_bob>;
> +
> +		vreg_l2f_1p2: ldo2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5f_2p85: ldo5 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6f_2p85: ldo6 {
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-min-microvolt = <2856000>;
> +			regulator-max-microvolt = <2856000>;
> +		};
> +	};
>  };
> 
>  &qupv3_id_1 {
