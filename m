Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DA395E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 14:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfHTM0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 08:26:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41940 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbfHTM0K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 08:26:10 -0400
Received: by mail-lj1-f195.google.com with SMTP id m24so4920651ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Aug 2019 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Np0RDuGampyEiLh9WESFKwplIA52fSuFtyQ4TS4tA6M=;
        b=xqeOxIyYhZbU8CL5ALolj9+KcwhUvUujLTdvOyPBOSFEKk2Jyl4GZNqBBpZvfrrm0l
         3YQLZojbkC0x1hhVo16AP82OIaDpIJ3JCo9AQ/POfaquAA5OUML6s/8uxdr6OQEkxSV5
         bAPlTpDh9YZDgjc2BW3G7sDHj7gvFpg9tB1sk+sMZ7kqFriHKBr63cgo+dwrQ9RXHJ2P
         F/d27RBQg4CeeDPGDyx0QxalsEQq86CmIedWiGlOpCTeY5YElAqAaWWti4d382jPcCQI
         3byuTZXxlIeDSgCtMYk39PgOFEpfXNVz4ncMX6usNJHxvt7j3sx79bPem5PXjeUVqPfJ
         9jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Np0RDuGampyEiLh9WESFKwplIA52fSuFtyQ4TS4tA6M=;
        b=s55Q2wyipJLlDXNny0/RNrQti3vziaDE5m2mWdhYkMJceEZpHJQeyzQ85IQ2vmfXUG
         +xJkM67YKKfBFuPFiJheNYilOTrglD6wB489r2cbZOlbWosr3FpZphR9J75rknCfz82f
         Zaq+Cxf/3O4EItnHIRjMCL4XOJyXwPIM7R6Zir5YkkD/6FpQispGKIN2+x92dzVWDxmP
         LlekCbalG6R7BFZOPQsG1IcDRI5/s4kw1obO42O7Yfd3uSmHOrlEHasjBDB9Z/qNzQnC
         xjiVaZ0WfWKnMf5BqbAT5jfaC9YOGQadPTw8NHLWuW8FnLMigbooEKahyrWrg6vshP6F
         HnMg==
X-Gm-Message-State: APjAAAVgpfJ5pAuhacyEfWM/ZnqOtiitRGBtbDbdONfbKtq4jip014Xt
        n0RY7EANsVPn2bI3OAL6O8LcVg==
X-Google-Smtp-Source: APXvYqx7oRhJTmbeW1kuVydnISScKV+AkaDcmxAhwmwRt8pARa3YdlraDW14t7PEaa5h1FOtJoE1eQ==
X-Received: by 2002:a2e:3c12:: with SMTP id j18mr15005198lja.50.1566303966830;
        Tue, 20 Aug 2019 05:26:06 -0700 (PDT)
Received: from centauri (ua-84-219-138-247.bbcust.telenor.se. [84.219.138.247])
        by smtp.gmail.com with ESMTPSA id s26sm2789263ljs.77.2019.08.20.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 05:26:06 -0700 (PDT)
Date:   Tue, 20 Aug 2019 14:26:04 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150-mtp: Add regulators
Message-ID: <20190820122604.GA31261@centauri>
References: <20190820064216.8629-1-vkoul@kernel.org>
 <20190820064216.8629-7-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820064216.8629-7-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 20, 2019 at 12:12:14PM +0530, Vinod Koul wrote:
> Add the regulators found in the mtp platform. This platform consists of
> pmic PM8150, PM8150L and PM8009.

Is there a reason not to squash this this patch 5/8 ?

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 327 ++++++++++++++++++++++++
>  1 file changed, 327 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> index 80b15f4f07c8..0513b24496f6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
> @@ -4,6 +4,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8150.dtsi"
>  #include "pm8150.dtsi"
>  #include "pm8150b.dtsi"
> @@ -20,6 +21,332 @@
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
> +
>  };
>  
>  &qupv3_id_1 {
> -- 
> 2.20.1
> 
