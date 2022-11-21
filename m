Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDAEA632FB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 23:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbiKUWTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 17:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbiKUWTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 17:19:08 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1C322BD9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 14:18:53 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id d3so16042365ljl.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 14:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wAQRdrdV00phLY8N36kua85vc+/setQukWx+l5eXBVU=;
        b=zOxr2gVpyr/iUyvFxNoYEfnPXcY0Egd5iHYtQttPLX5cr3HlSpiETAYF+nZB/DFBW/
         OPoLKx03h61tSw1W5M7TBm22+avuGqSyuyyicZ/8Z6GjS9iHcqrfEPX/VpFUhljzpxIE
         D/SelkZeP3TM0sTyO7hfI/bBJltiXGrMFdplUCwpwuEfmDwMmNvnYxfgrKs63uCdT2Kx
         tjnM6Q8lcoWuYobb9la59e8Q0rNDZc1MOgtR+s3Y2j3uhukWUsBNnuJSYGON+JMfqufS
         4+1NwHWNiOar7DDZmhVD5cdRnEH5XwQhiQKnPbItIZkHEm33Ihp4Kq0XielN6OOaQmXz
         D1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAQRdrdV00phLY8N36kua85vc+/setQukWx+l5eXBVU=;
        b=tEpKswfxxXqoBUPrISvfkGuoczZdOoMXJaI5uk7A4/kunRMIGYP2rb2x3jlwFBdSRw
         Icpg4EOf/++gftrGiRKRSDJE8TxbyvjQypngjusRAc4Ue3Ph14qTGbK3YHCAv/PAVXZV
         nxAh6R1+EMVwDhXo97NbfVl1coJ4cwEQji4+2hnCKkP5SCVkU2kNpy05cPlDbEvz/koX
         193k6wHDN7MksDtDC23dlfJ10KwOPl1Xizdd8bUhejjcAOUk7ugqz5sw0K3zW8DfHOEU
         Rzx7faDAybJHjmDXQpY8qzDBz+cOKLv2eZ4c9W/Rj2xnhBnSVxJ/XY7yBpzwLR5x5dVi
         ARXQ==
X-Gm-Message-State: ANoB5pmAiNo+0xGXHHBc9miaJm7GdyBUKUMM47coOIMwR34kvFXvJY8T
        jQwh/bhuey5LfJc1sXpR+mk7ZA==
X-Google-Smtp-Source: AA0mqf5ie04BySiNFwk+Wl13qQg80Hb7cTmXym/3/e9HcRc3Q7pnbplUCRoqNKtrsCiVlCZKePUUAQ==
X-Received: by 2002:a2e:9103:0:b0:278:fa62:bc90 with SMTP id m3-20020a2e9103000000b00278fa62bc90mr6845922ljg.360.1669069132091;
        Mon, 21 Nov 2022 14:18:52 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id s5-20020a056512314500b004a1e7216131sm2184259lfi.116.2022.11.21.14.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 14:18:51 -0800 (PST)
Message-ID: <cc7f7fde-cf38-6334-dd8c-9a4f492316c1@linaro.org>
Date:   Mon, 21 Nov 2022 23:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221118192241.29384-1-quic_molvera@quicinc.com>
 <20221118192241.29384-3-quic_molvera@quicinc.com>
 <fed1d538-d133-6987-12d4-3f1516d519e5@linaro.org>
 <85b7060c-4f52-b8bf-cb19-29068a0a9083@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <85b7060c-4f52-b8bf-cb19-29068a0a9083@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.11.2022 23:15, Melody Olvera wrote:
> 
> 
> On 11/21/2022 5:07 AM, Konrad Dybcio wrote:
>>
>> On 18.11.2022 20:22, Melody Olvera wrote:
>>> Add DTs for Qualcomm IDP platforms using the QDU1000 and QRU1000
>>> SoCs.
>>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile        |   2 +
>>>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 266 +++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/qru1000-idp.dts | 266 +++++++++++++++++++++++
>>>  3 files changed, 534 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>>>  create mode 100644 arch/arm64/boot/dts/qcom/qru1000-idp.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index afe496a93f94..da66d4a0a884 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -53,7 +53,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>>> new file mode 100644
>>> index 000000000000..5aed483201fa
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>>> @@ -0,0 +1,266 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>> +#include "qdu1000.dtsi"
>>> +#include "pm8150.dtsi"
>>> +
>>> +/ {
>>> +	model = "Qualcomm Technologies, Inc. QDU1000 IDP";
>>> +	compatible = "qcom,qdu1000-idp", "qcom,qdu1000";
>> Missing chassis-type
> 
> Sorry, not sure what you mean here... Do you mean like QRD, HDK, MTP, etc.?
> If so, then IDP is the chassis type.
It's a way to describe the type of the board, you probably want "embedded" here.

Check page 30 of the PDF here:

https://buildmedia.readthedocs.org/media/pdf/devicetree-specification/latest/devicetree-specification.pdf

Konrad
> 
>>
>>> +
>>> +	aliases {
>>> +		serial0 = &uart7;
>>> +	};
>>> +
>>> +	clocks {
>>> +		xo_board: xo-board {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <19200000>;
>>> +			clock-output-names = "xo_board";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		sleep_clk: sleep-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <32000>;
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		pcie_0_pipe_clk: pcie-0-pipe-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "pcie_0_pipe_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		pcie_0_phy_aux_clk: pcie-0-phy-aux-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "pcie_0_phy_aux_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		usb3_phy_wrapper_pipe_clk: usb3-phy-wrapper-pipe-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "usb3_phy_wrapper_pipe_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>> Do these pipe clocks not come from QMPPHY?
> 
> Yes they do; I just don't have those phys ready yet. I can put a TODO here to
> move them if necessary.
> 
>>
>>> +	};
>>> +
>>> +	chosen {
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	ppvar_sys: ppvar-sys-regulator {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "ppvar_sys";
>> Any chance you could add the voltage of this regulator here,
>> so the DT can better represent the hardware?
> 
> Sure.
> 
> Thanks,
> Melody
>> Konrad
>>> +		regulator-always-on;
>>> +		regulator-boot-on;
>>> +	};
>>> +
>>> +	vph_pwr: vph-pwr-regulator {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vph_pwr";
>>> +		regulator-min-microvolt = <3700000>;
>>> +		regulator-max-microvolt = <3700000>;
>>> +
>>> +		regulator-always-on;
>>> +		regulator-boot-on;
>>> +
>>> +		vin-supply = <&ppvar_sys>;
>>> +	};
>>> +};
>>> +
>>> +&apps_rsc {
>>> +	regulators {
>>> +		compatible = "qcom,pm8150-rpmh-regulators";
>>> +		qcom,pmic-id = "a";
>>> +
>>> +		vdd-s1-supply = <&vph_pwr>;
>>> +		vdd-s2-supply = <&vph_pwr>;
>>> +		vdd-s3-supply = <&vph_pwr>;
>>> +		vdd-s4-supply = <&vph_pwr>;
>>> +		vdd-s5-supply = <&vph_pwr>;
>>> +		vdd-s6-supply = <&vph_pwr>;
>>> +		vdd-s7-supply = <&vph_pwr>;
>>> +		vdd-s8-supply = <&vph_pwr>;
>>> +		vdd-s9-supply = <&vph_pwr>;
>>> +		vdd-s10-supply = <&vph_pwr>;
>>> +
>>> +		vdd-l1-l8-l11-supply = <&vreg_s6a_0p9>;
>>> +		vdd-l2-l10-supply = <&vph_pwr>;
>>> +		vdd-l3-l4-l5-l18-supply = <&vreg_s5a_2p0>;
>>> +		vdd-l6-l9-supply = <&vreg_s6a_0p9>;
>>> +		vdd-l7-l12-l14-l15-supply = <&vreg_s4a_1p8>;
>>> +		vdd-l13-l16-l17-supply = <&vph_pwr>;
>>> +
>>> +		vreg_s2a_0p5: smps2 {
>>> +			regulator-name = "vreg_s2a_0p5";
>>> +			regulator-min-microvolt = <320000>;
>>> +			regulator-max-microvolt = <570000>;
>>> +		};
>>> +
>>> +		vreg_s3a_1p05: smps3 {
>>> +			regulator-name = "vreg_s3a_1p05";
>>> +			regulator-min-microvolt = <950000>;
>>> +			regulator-max-microvolt = <1170000>;
>>> +		};
>>> +
>>> +		vreg_s4a_1p8: smps4 {
>>> +			regulator-name = "vreg_s4a_1p8";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <1800000>;
>>> +		};
>>> +
>>> +		vreg_s5a_2p0: smps5 {
>>> +			regulator-name = "vreg_s5a_2p0";
>>> +			regulator-min-microvolt = <1904000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +		};
>>> +
>>> +		vreg_s6a_0p9: smps6 {
>>> +			regulator-name = "vreg_s6a_0p9";
>>> +			regulator-min-microvolt = <920000>;
>>> +			regulator-max-microvolt = <1128000>;
>>> +		};
>>> +
>>> +		vreg_s7a_1p2: smps7 {
>>> +			regulator-name = "vreg_s7a_1p2";
>>> +			regulator-min-microvolt = <1200000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +		};
>>> +
>>> +		vreg_s8a_1p3: smps8 {
>>> +			regulator-name = "vreg_s8a_1p3";
>>> +			regulator-min-microvolt = <1352000>;
>>> +			regulator-max-microvolt = <1352000>;
>>> +		};
>>> +
>>> +		vreg_l1a_0p91: ldo1 {
>>> +			regulator-name = "vreg_l1a_0p91";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l2a_2p3: ldo2 {
>>> +			regulator-name = "vreg_l2a_2p3";
>>> +			regulator-min-microvolt = <2970000>;
>>> +			regulator-max-microvolt = <3300000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l3a_1p2: ldo3 {
>>> +			regulator-name = "vreg_l3a_1p2";
>>> +			regulator-min-microvolt = <920000>;
>>> +			regulator-max-microvolt = <1260000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l5a_0p8: ldo5 {
>>> +			regulator-name = "vreg_l5a_0p8";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l6a_0p91: ldo6 {
>>> +			regulator-name = "vreg_l6a_0p91";
>>> +			regulator-min-microvolt = <880000>;
>>> +			regulator-max-microvolt = <950000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l7a_1p8: ldo7 {
>>> +			regulator-name = "vreg_l7a_1p8";
>>> +			regulator-min-microvolt = <1650000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +
>>> +		};
>>> +
>>> +		vreg_l8a_0p91: ldo8 {
>>> +			regulator-name = "vreg_l8a_0p91";
>>> +			regulator-min-microvolt = <888000>;
>>> +			regulator-max-microvolt = <925000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l9a_0p91: ldo9 {
>>> +			regulator-name = "vreg_l8a_0p91";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l10a_2p95: ldo10 {
>>> +			regulator-name = "vreg_l10a_2p95";
>>> +			regulator-min-microvolt = <2700000>;
>>> +			regulator-max-microvolt = <3544000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l11a_0p91: ldo11 {
>>> +			regulator-name = "vreg_l11a_0p91";
>>> +			regulator-min-microvolt = <800000>;
>>> +			regulator-max-microvolt = <1000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l12a_1p8: ldo12 {
>>> +			regulator-name = "vreg_l12a_1p8";
>>> +			regulator-min-microvolt = <1504000>;
>>> +			regulator-max-microvolt = <1504000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l14a_1p8: ldo14 {
>>> +			regulator-name = "vreg_l14a_1p8";
>>> +			regulator-min-microvolt = <1650000>;
>>> +			regulator-max-microvolt = <1950000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l15a_1p8: ldo15 {
>>> +			regulator-name = "vreg_l15a_1p8";
>>> +			regulator-min-microvolt = <1504000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l16a_1p8: ldo16 {
>>> +			regulator-name = "vreg_l16a_1p8";
>>> +			regulator-min-microvolt = <1710000>;
>>> +			regulator-max-microvolt = <1890000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l17a_3p3: ldo17 {
>>> +			regulator-name = "vreg_l17a_3p3";
>>> +			regulator-min-microvolt = <3000000>;
>>> +			regulator-max-microvolt = <3544000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l18a_1p2: ldo18 {
>>> +			regulator-name = "vreg_l18a_1p2";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&qupv3_id_0 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&uart7 {
>>> +	status = "okay";
>>> +};
>>> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>>> new file mode 100644
>>> index 000000000000..42eb0c33e7ba
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>>> @@ -0,0 +1,266 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>> +#include "qru1000.dtsi"
>>> +#include "pm8150.dtsi"
>>> +
>>> +/ {
>>> +	model = "Qualcomm Technologies, Inc. QRU1000 IDP";
>>> +	compatible = "qcom,qru1000-idp", "qcom,qru1000";
>>> +
>>> +	aliases {
>>> +		serial0 = &uart7;
>>> +	};
>>> +
>>> +	clocks {
>>> +		xo_board: xo-board {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <19200000>;
>>> +			clock-output-names = "xo_board";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		sleep_clk: sleep-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <32000>;
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		pcie_0_pipe_clk: pcie-0-pipe-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "pcie_0_pipe_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		pcie_0_phy_aux_clk: pcie-0-phy-aux-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "pcie_0_phy_aux_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		usb3_phy_wrapper_pipe_clk: usb3-phy-wrapper-pipe-clk {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000>;
>>> +			clock-output-names = "usb3_phy_wrapper_pipe_clk";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +	};
>>> +
>>> +	chosen {
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	ppvar_sys: ppvar-sys-regulator {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "ppvar_sys";
>>> +		regulator-always-on;
>>> +		regulator-boot-on;
>>> +	};
>>> +
>>> +	vph_pwr: vph-pwr-regulator {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "vph_pwr";
>>> +		regulator-min-microvolt = <3700000>;
>>> +		regulator-max-microvolt = <3700000>;
>>> +
>>> +		regulator-always-on;
>>> +		regulator-boot-on;
>>> +
>>> +		vin-supply = <&ppvar_sys>;
>>> +	};
>>> +};
>>> +
>>> +&apps_rsc {
>>> +	regulators {
>>> +		compatible = "qcom,pm8150-rpmh-regulators";
>>> +		qcom,pmic-id = "a";
>>> +
>>> +		vdd-s1-supply = <&vph_pwr>;
>>> +		vdd-s2-supply = <&vph_pwr>;
>>> +		vdd-s3-supply = <&vph_pwr>;
>>> +		vdd-s4-supply = <&vph_pwr>;
>>> +		vdd-s5-supply = <&vph_pwr>;
>>> +		vdd-s6-supply = <&vph_pwr>;
>>> +		vdd-s7-supply = <&vph_pwr>;
>>> +		vdd-s8-supply = <&vph_pwr>;
>>> +		vdd-s9-supply = <&vph_pwr>;
>>> +		vdd-s10-supply = <&vph_pwr>;
>>> +
>>> +		vdd-l1-l8-l11-supply = <&vreg_s6a_0p9>;
>>> +		vdd-l2-l10-supply = <&vph_pwr>;
>>> +		vdd-l3-l4-l5-l18-supply = <&vreg_s5a_2p0>;
>>> +		vdd-l6-l9-supply = <&vreg_s6a_0p9>;
>>> +		vdd-l7-l12-l14-l15-supply = <&vreg_s4a_1p8>;
>>> +		vdd-l13-l16-l17-supply = <&vph_pwr>;
>>> +
>>> +		vreg_s2a_0p5: smps2 {
>>> +			regulator-name = "vreg_s2a_0p5";
>>> +			regulator-min-microvolt = <320000>;
>>> +			regulator-max-microvolt = <570000>;
>>> +		};
>>> +
>>> +		vreg_s3a_1p05: smps3 {
>>> +			regulator-name = "vreg_s3a_1p05";
>>> +			regulator-min-microvolt = <950000>;
>>> +			regulator-max-microvolt = <1170000>;
>>> +		};
>>> +
>>> +		vreg_s4a_1p8: smps4 {
>>> +			regulator-name = "vreg_s4a_1p8";
>>> +			regulator-min-microvolt = <1800000>;
>>> +			regulator-max-microvolt = <1800000>;
>>> +		};
>>> +
>>> +		vreg_s5a_2p0: smps5 {
>>> +			regulator-name = "vreg_s5a_2p0";
>>> +			regulator-min-microvolt = <1904000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +		};
>>> +
>>> +		vreg_s6a_0p9: smps6 {
>>> +			regulator-name = "vreg_s6a_0p9";
>>> +			regulator-min-microvolt = <920000>;
>>> +			regulator-max-microvolt = <1128000>;
>>> +		};
>>> +
>>> +		vreg_s7a_1p2: smps7 {
>>> +			regulator-name = "vreg_s7a_1p2";
>>> +			regulator-min-microvolt = <1200000>;
>>> +			regulator-max-microvolt = <1200000>;
>>> +		};
>>> +
>>> +		vreg_s8a_1p3: smps8 {
>>> +			regulator-name = "vreg_s8a_1p3";
>>> +			regulator-min-microvolt = <1352000>;
>>> +			regulator-max-microvolt = <1352000>;
>>> +		};
>>> +
>>> +		vreg_l1a_0p91: ldo1 {
>>> +			regulator-name = "vreg_l1a_0p91";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l2a_2p3: ldo2 {
>>> +			regulator-name = "vreg_l2a_2p3";
>>> +			regulator-min-microvolt = <2970000>;
>>> +			regulator-max-microvolt = <3300000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l3a_1p2: ldo3 {
>>> +			regulator-name = "vreg_l3a_1p2";
>>> +			regulator-min-microvolt = <920000>;
>>> +			regulator-max-microvolt = <1260000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l5a_0p8: ldo5 {
>>> +			regulator-name = "vreg_l5a_0p8";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l6a_0p91: ldo6 {
>>> +			regulator-name = "vreg_l6a_0p91";
>>> +			regulator-min-microvolt = <880000>;
>>> +			regulator-max-microvolt = <950000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l7a_1p8: ldo7 {
>>> +			regulator-name = "vreg_l7a_1p8";
>>> +			regulator-min-microvolt = <1650000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +
>>> +		};
>>> +
>>> +		vreg_l8a_0p91: ldo8 {
>>> +			regulator-name = "vreg_l8a_0p91";
>>> +			regulator-min-microvolt = <888000>;
>>> +			regulator-max-microvolt = <925000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l9a_0p91: ldo9 {
>>> +			regulator-name = "vreg_l8a_0p91";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l10a_2p95: ldo10 {
>>> +			regulator-name = "vreg_l10a_2p95";
>>> +			regulator-min-microvolt = <2700000>;
>>> +			regulator-max-microvolt = <3544000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l11a_0p91: ldo11 {
>>> +			regulator-name = "vreg_l11a_0p91";
>>> +			regulator-min-microvolt = <800000>;
>>> +			regulator-max-microvolt = <1000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l12a_1p8: ldo12 {
>>> +			regulator-name = "vreg_l12a_1p8";
>>> +			regulator-min-microvolt = <1504000>;
>>> +			regulator-max-microvolt = <1504000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l14a_1p8: ldo14 {
>>> +			regulator-name = "vreg_l14a_1p8";
>>> +			regulator-min-microvolt = <1650000>;
>>> +			regulator-max-microvolt = <1950000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l15a_1p8: ldo15 {
>>> +			regulator-name = "vreg_l15a_1p8";
>>> +			regulator-min-microvolt = <1504000>;
>>> +			regulator-max-microvolt = <2000000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l16a_1p8: ldo16 {
>>> +			regulator-name = "vreg_l16a_1p8";
>>> +			regulator-min-microvolt = <1710000>;
>>> +			regulator-max-microvolt = <1890000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l17a_3p3: ldo17 {
>>> +			regulator-name = "vreg_l17a_3p3";
>>> +			regulator-min-microvolt = <3000000>;
>>> +			regulator-max-microvolt = <3544000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +
>>> +		vreg_l18a_1p2: ldo18 {
>>> +			regulator-name = "vreg_l18a_1p2";
>>> +			regulator-min-microvolt = <312000>;
>>> +			regulator-max-microvolt = <1304000>;
>>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&qupv3_id_0 {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&uart7 {
>>> +	status = "okay";
>>> +};
> 
