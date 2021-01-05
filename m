Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B9E2EB24E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 19:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbhAESRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 13:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbhAESRB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 13:17:01 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9E0C061796
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 10:16:14 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id p5so503234oif.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eypK+a9k4AhqTQKBYAjt8ConurAUlnSiRNRuKWaLj9I=;
        b=nD1251zserGTwVPNPOfHy6I7qh7rA5QHIuTn3KMZ0318EdA4m3b0gq8do1g6ZVkck8
         Etg8yj0FCaUqkd0TcldOcDBVuemDC2zz1mJ2GSXsgh7DkfeCaK4zDa3JeCkpHWkEe6eE
         5tl42mIPsr622GLRJHPF6cOHKId1Kl+0iyxLP/gO4BzifKOTYBmZVUDZm+UQ2y4hxwHQ
         vGqlKoi8T1dm6I26e6yFaud94Ap6Fs2ypXOLKK5onfQ3nNqpZJeV9kVNkw9w4VTLuppB
         McYaPKt4Jqcw1IujIP382SOonr9eIPf4PmKajtjvNxHK6Hbo8ysbCE8a/iXfRjLuoQt5
         DctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eypK+a9k4AhqTQKBYAjt8ConurAUlnSiRNRuKWaLj9I=;
        b=NbooDL9jFemF9VHx+3S0fAjj05P8mu33qqiuSknkkCDmWf0+1lz7afc7e2gBeAJMLo
         ISziKDEnFr3EV7Reykone1ZI+j5y+YwcpYDKXf2iUQLaJqzjCl0J+zdM+O7h+Jf3nOuY
         1Dq+TWBWCaaWAnpyS/42R0928U0HqvjlMiYoAIayFYoYtb7u1kLpcZFv8Tfkhz0jDe6J
         V/kW9mOTjlyIdbMhXdHctnDk4XqnhmCg7UkLsxBb+kOeURXWuAu66ItbtkgLsaR3Sk13
         +MCI+Qc3eDkFFHNzjtXbzvFVMc5qWuVMkJI8GWUVu5eROY+Iu4TAYXY+WahhFtlXFSdw
         b2Pg==
X-Gm-Message-State: AOAM533jyGduvf9XukBPooaKs+cf6dOmDrIa3CwMpvLY12OlioAk3mYM
        G5M5U5CS5nq8EG7AXJaeC2Sqyg==
X-Google-Smtp-Source: ABdhPJztol+v4E4HgB3l8tdDE/6CeJoLr8cVk5Zuyyssij8FW1qpWsVikjMQ5Ba1Om26Wc1b9By05g==
X-Received: by 2002:a05:6808:91a:: with SMTP id w26mr564997oih.159.1609870573757;
        Tue, 05 Jan 2021 10:16:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x72sm37087oia.16.2021.01.05.10.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 10:16:13 -0800 (PST)
Date:   Tue, 5 Jan 2021 12:16:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 18/18] ARM: dts: qcom: sdx55-mtp: Add regulator nodes
Message-ID: <X/Ss6ycyQF87cYxx@builder.lan>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-19-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-19-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:

> From: Vinod Koul <vkoul@kernel.org>
> 
> This adds the regulators found on SDX55 MTP.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55-mtp.dts | 179 +++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> index 825cc7d0ba18..61e7d5d4bd48 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> @@ -6,6 +6,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "qcom-sdx55.dtsi"
>  #include <arm64/qcom/pm8150b.dtsi>
>  #include "qcom-pmx55.dtsi"
> @@ -22,6 +23,184 @@ aliases {
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
> +	vreg_bob_3p3: pmx55-bob {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_bob_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	vreg_s7e_mx_0p752: pmx55-s7e {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s7e_mx_0p752";
> +		regulator-min-microvolt = <752000>;
> +		regulator-max-microvolt = <752000>;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	vreg_vddpx_2: vddpx-2 {

Isn't this the name of the pad on the SoC, i.e. the consumer? Does the
regulator output have a more suitable name?

I don't see any references to this node and you got it "boot-on", what
happens when the regulator core tuns it off? Or this isn't an issue
until we actually try to support sdhci (guessing based on the voltages)?

Regards,
Bjorn

> +		compatible = "regulator-gpio";
> +		regulator-name = "vreg_vddpx_2";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <2850000>;
> +		enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> +		gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> +		states = <1800000 0>, <2850000 1>;
> +		startup-delay-us = <200000>;
> +		enable-active-high;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&apps_rsc {
> +	pmx55-rpmh-regulators {
> +		compatible = "qcom,pmx55-rpmh-regulators";
> +		qcom,pmic-id = "e";
> +
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +		vdd-s7-supply = <&vph_pwr>;
> +		vdd-l1-l2-supply = <&vreg_s2e_1p224>;
> +		vdd-l3-l9-supply = <&vreg_s3e_0p824>;
> +		vdd-l4-l12-supply = <&vreg_s4e_1p904>;
> +		vdd-l5-l6-supply = <&vreg_s4e_1p904>;
> +		vdd-l7-l8-supply = <&vreg_s3e_0p824>;
> +		vdd-l10-l11-l13-supply = <&vreg_bob_3p3>;
> +		vdd-l14-supply = <&vreg_s7e_mx_0p752>;
> +		vdd-l15-supply = <&vreg_s2e_1p224>;
> +		vdd-l16-supply = <&vreg_s4e_1p904>;
> +
> +		vreg_s2e_1p224: smps2 {
> +			regulator-min-microvolt = <1280000>;
> +			regulator-max-microvolt = <1400000>;
> +		};
> +
> +		vreg_s3e_0p824: smps3 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <1000000>;
> +		};
> +
> +		vreg_s4e_1p904: smps4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1960000>;
> +		};
> +
> +		ldo1 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo2 {
> +			regulator-min-microvolt = <1128000>;
> +			regulator-max-microvolt = <1128000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo3 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo4 {
> +			regulator-min-microvolt = <872000>;
> +			regulator-max-microvolt = <872000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo5 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo7 {
> +			regulator-min-microvolt = <480000>;
> +			regulator-max-microvolt = <900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo8 {
> +			regulator-min-microvolt = <480000>;
> +			regulator-max-microvolt = <900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo9 {
> +			regulator-min-microvolt = <800000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo10 {
> +			regulator-min-microvolt = <3088000>;
> +			regulator-max-microvolt = <3088000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo11 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo12 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo13 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <2928000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo14 {
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo15 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +
> +		ldo16 {
> +			regulator-min-microvolt = <1704000>;
> +			regulator-max-microvolt = <1904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +		};
> +	};
>  };
>  
>  &blsp1_uart3 {
> -- 
> 2.25.1
> 
