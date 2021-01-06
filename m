Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92172EBCD8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jan 2021 11:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbhAFKzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jan 2021 05:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbhAFKzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jan 2021 05:55:31 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3542C06135C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jan 2021 02:54:46 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p12so728712pju.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jan 2021 02:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EwM+W1oBVWAjW0INymQy6bkc7AKH9CaSUY4HLB+6Hkk=;
        b=V2DwEFqXDnKfGoWJ+9AMz79/JkgfvK4BDAY66Dwij6+EAdiq2lqkUXLoMV1MuD35rY
         g0HDKkw+ehw/Z22rT6lMTWdsgN/uoaykFCejbX9dRYotlx1BJBF6gjQVmRjWdxa53Ffd
         71djOdjhcd3//9JgtwLW9MM3+WkdWGtzSiDHvc3Ze5vQPl5MqsAT8qETgYbnCsIrKgFi
         uDDZrTXaTDOmEM/ScsCKapkmicQsAbnZKMwYtHE52QAskSEuA6Rg4ABfavtLpp00ql9o
         WfWEfhbVJ7zucvfryDdkTj8/ED8rTYmNncFFI/ZjIAYLfg3yKOX9uJy8x2im7gULSgRX
         cOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EwM+W1oBVWAjW0INymQy6bkc7AKH9CaSUY4HLB+6Hkk=;
        b=GlymvDSndpL5mCex1n+rNiLCLFEG/0HeCl2mW42kfolhUhIxJ7t7c9uxpQqG06A+qt
         mWfuhF/3yn/JwetcbVx3dVJIXk5Mr+CHQrQEcJjk4nxuXwXJjYswNQxuiFT+ESQCg7t2
         hsrRo+onox9bJPPZnhCUCdk7KZBD2BYEwuX6wbVka9A1QMumBZ7MXsbBt9HNx/XaIwoz
         6/Fen8nkLWW5bvxygRdGGounSHYzhhURk8XN/RHk8EDmUaDaLwUixVdtGvjS+Cm7XnuQ
         8RVuyqplPx9D0BjI5bupPaLKfhWcSKR9gOElF1KTEZXZRAeAhgWSu63Mb45HG1w+AHh1
         nNNw==
X-Gm-Message-State: AOAM532fx4ct9iVKXutxHDRXBebOyWzuRnV229gqAVuYze3+v9t0HEjW
        Ss+BjY7Zssr27iuGp7mfSIkQ
X-Google-Smtp-Source: ABdhPJxJpxXAvbw3WSkk0jhQ7EG1otw2lBHE7zb6U76OkPXbuBKwZdZbC8NMxB1qpNTD/WjJcZA4Tg==
X-Received: by 2002:a17:90b:2282:: with SMTP id kx2mr3656915pjb.77.1609930486361;
        Wed, 06 Jan 2021 02:54:46 -0800 (PST)
Received: from thinkpad ([2409:4072:6102:e7a2:51f0:bf72:bf80:ec88])
        by smtp.gmail.com with ESMTPSA id e29sm2279843pfj.174.2021.01.06.02.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 02:54:45 -0800 (PST)
Date:   Wed, 6 Jan 2021 16:24:40 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 18/18] ARM: dts: qcom: sdx55-mtp: Add regulator nodes
Message-ID: <20210106105440.GD3131@thinkpad>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-19-manivannan.sadhasivam@linaro.org>
 <X/Ss6ycyQF87cYxx@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/Ss6ycyQF87cYxx@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 05, 2021 at 12:16:11PM -0600, Bjorn Andersson wrote:
> On Tue 05 Jan 06:26 CST 2021, Manivannan Sadhasivam wrote:
> 
> > From: Vinod Koul <vkoul@kernel.org>
> > 
> > This adds the regulators found on SDX55 MTP.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-sdx55-mtp.dts | 179 +++++++++++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> > index 825cc7d0ba18..61e7d5d4bd48 100644
> > --- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> > +++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
> > @@ -6,6 +6,7 @@
> >  
> >  /dts-v1/;
> >  
> > +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >  #include "qcom-sdx55.dtsi"
> >  #include <arm64/qcom/pm8150b.dtsi>
> >  #include "qcom-pmx55.dtsi"
> > @@ -22,6 +23,184 @@ aliases {
> >  	chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> > +
> > +	vph_pwr: vph-pwr-regulator {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vph_pwr";
> > +		regulator-min-microvolt = <3700000>;
> > +		regulator-max-microvolt = <3700000>;
> > +	};
> > +
> > +	vreg_bob_3p3: pmx55-bob {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_bob_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vph_pwr>;
> > +	};
> > +
> > +	vreg_s7e_mx_0p752: pmx55-s7e {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_s7e_mx_0p752";
> > +		regulator-min-microvolt = <752000>;
> > +		regulator-max-microvolt = <752000>;
> > +
> > +		vin-supply = <&vph_pwr>;
> > +	};
> > +
> > +	vreg_vddpx_2: vddpx-2 {
> 
> Isn't this the name of the pad on the SoC, i.e. the consumer? Does the
> regulator output have a more suitable name?
>

The reference is from the downstream dts.
 
> I don't see any references to this node and you got it "boot-on", what
> happens when the regulator core tuns it off? Or this isn't an issue
> until we actually try to support sdhci (guessing based on the voltages)?
> 

I think we can ignore this regulator since there is no SDHCI support in MTP.

Thanks,
Mani

> Regards,
> Bjorn
> 
> > +		compatible = "regulator-gpio";
> > +		regulator-name = "vreg_vddpx_2";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <2850000>;
> > +		enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> > +		gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
> > +		states = <1800000 0>, <2850000 1>;
> > +		startup-delay-us = <200000>;
> > +		enable-active-high;
> > +		regulator-boot-on;
> > +
> > +		vin-supply = <&vph_pwr>;
> > +	};
> > +};
> > +
> > +&apps_rsc {
> > +	pmx55-rpmh-regulators {
> > +		compatible = "qcom,pmx55-rpmh-regulators";
> > +		qcom,pmic-id = "e";
> > +
> > +		vdd-s1-supply = <&vph_pwr>;
> > +		vdd-s2-supply = <&vph_pwr>;
> > +		vdd-s3-supply = <&vph_pwr>;
> > +		vdd-s4-supply = <&vph_pwr>;
> > +		vdd-s5-supply = <&vph_pwr>;
> > +		vdd-s6-supply = <&vph_pwr>;
> > +		vdd-s7-supply = <&vph_pwr>;
> > +		vdd-l1-l2-supply = <&vreg_s2e_1p224>;
> > +		vdd-l3-l9-supply = <&vreg_s3e_0p824>;
> > +		vdd-l4-l12-supply = <&vreg_s4e_1p904>;
> > +		vdd-l5-l6-supply = <&vreg_s4e_1p904>;
> > +		vdd-l7-l8-supply = <&vreg_s3e_0p824>;
> > +		vdd-l10-l11-l13-supply = <&vreg_bob_3p3>;
> > +		vdd-l14-supply = <&vreg_s7e_mx_0p752>;
> > +		vdd-l15-supply = <&vreg_s2e_1p224>;
> > +		vdd-l16-supply = <&vreg_s4e_1p904>;
> > +
> > +		vreg_s2e_1p224: smps2 {
> > +			regulator-min-microvolt = <1280000>;
> > +			regulator-max-microvolt = <1400000>;
> > +		};
> > +
> > +		vreg_s3e_0p824: smps3 {
> > +			regulator-min-microvolt = <800000>;
> > +			regulator-max-microvolt = <1000000>;
> > +		};
> > +
> > +		vreg_s4e_1p904: smps4 {
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1960000>;
> > +		};
> > +
> > +		ldo1 {
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo2 {
> > +			regulator-min-microvolt = <1128000>;
> > +			regulator-max-microvolt = <1128000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo3 {
> > +			regulator-min-microvolt = <800000>;
> > +			regulator-max-microvolt = <800000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo4 {
> > +			regulator-min-microvolt = <872000>;
> > +			regulator-max-microvolt = <872000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo5 {
> > +			regulator-min-microvolt = <1704000>;
> > +			regulator-max-microvolt = <1900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo6 {
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <1800000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo7 {
> > +			regulator-min-microvolt = <480000>;
> > +			regulator-max-microvolt = <900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo8 {
> > +			regulator-min-microvolt = <480000>;
> > +			regulator-max-microvolt = <900000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo9 {
> > +			regulator-min-microvolt = <800000>;
> > +			regulator-max-microvolt = <800000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo10 {
> > +			regulator-min-microvolt = <3088000>;
> > +			regulator-max-microvolt = <3088000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo11 {
> > +			regulator-min-microvolt = <1704000>;
> > +			regulator-max-microvolt = <2928000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo12 {
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo13 {
> > +			regulator-min-microvolt = <1704000>;
> > +			regulator-max-microvolt = <2928000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo14 {
> > +			regulator-min-microvolt = <600000>;
> > +			regulator-max-microvolt = <800000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo15 {
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +
> > +		ldo16 {
> > +			regulator-min-microvolt = <1704000>;
> > +			regulator-max-microvolt = <1904000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +		};
> > +	};
> >  };
> >  
> >  &blsp1_uart3 {
> > -- 
> > 2.25.1
> > 
