Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9815A7BB74C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 14:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjJFMFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 08:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbjJFMFc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 08:05:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C452C2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 05:05:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bffc55af02so24194011fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 05:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593928; x=1697198728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKGN/3KNoOHL+3DdMSpq20pMTcvXAuH1Oi51FJKpSEM=;
        b=jJWyLAsplODZJVUOjAii29bVfK417SBEd2TxoT5ZCAVLtJ0bFE+fDbKgl9cEvtaqP0
         a94ftPKIHv8PPVkfRGd3oiZm1eZ09nTRHXADyBdVBH/Q7G9U5nSNpC8N58vyybUg+vOw
         3D7lOAiwfZa9GZYNuQBI7FI5fXBwhg4wuNd7jkDDzB1hL3zbTPncxImvFprVJ1sXYnSA
         3l4SOc1JHJayrLLIoRokaptFSKBxAYACJkQWfH3vbBG+7EkP8COlyfT9Sl6iMIQoT2s/
         PIeK3gO8vd8BAe5534pjwYCU/0KNDrZaQUksyLCUPr9w3/2rXvSVc3xDFyzoZXJh0nyQ
         u7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593928; x=1697198728;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKGN/3KNoOHL+3DdMSpq20pMTcvXAuH1Oi51FJKpSEM=;
        b=v7/exZBBWh4Yx1E5UIMH/Ayq863pCG4bC74nd/oPisE5Duzdpur9Nnwz/CHyoxxDle
         wQUTU4cKh9XLsLPtZRAdfEXYpvOuoBk3m59LaGM+qdDptirI54K8v+gbGA5RfMf5gGGC
         XpnQ+go+ySeDmlyKYHRh6KlR/ju6bLWYJAllK2/mDxBoXZuKstZh1cLeV3g140Cv3o/0
         x6khpd+4cbZkbC+RDrpQoqyxJickWj8hzpDzznnV7tHX/awLh6fn4VAsTG0RtVphgkGP
         25z53zaZGRvPPP6fhRIVDscxRdfYLNzKgT+xUvekxzWs2EiRpr8f/L+bQfkGtzyLI9nj
         6uZw==
X-Gm-Message-State: AOJu0YyIzX2G+NHditUAG9z/SKE6B5PdNecvltYlHY4EhTCzzTQz4NZ/
        hq66is0nCN6UYtrYYO+eVY54jg==
X-Google-Smtp-Source: AGHT+IECuUQ1H0FgTSbhY4if5apHz6Rb38ge6HTlR9+uTU5/EPh9bJoZXwl/lGgH/f8r2p/xwrIIUg==
X-Received: by 2002:a2e:8883:0:b0:2ba:8127:a2c3 with SMTP id k3-20020a2e8883000000b002ba8127a2c3mr6847215lji.34.1696593928337;
        Fri, 06 Oct 2023 05:05:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e8e8d000000b002b702dfb510sm753373ljk.39.2023.10.06.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:05:27 -0700 (PDT)
Message-ID: <a2085853-8793-4ea0-96f7-4bdf9972d0d1@linaro.org>
Date:   Fri, 6 Oct 2023 15:05:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sdm670: add display subsystem
Content-Language: en-GB
To:     Richard Acayan <mailingradian@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20231003012119.857198-9-mailingradian@gmail.com>
 <20231003012119.857198-15-mailingradian@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20231003012119.857198-15-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2023 04:21, Richard Acayan wrote:
> The Snapdragon 670 has a display subsystem for controlling and
> outputting to the display. Add support for it in the device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 294 +++++++++++++++++++++++++++
>   1 file changed, 294 insertions(+)

Two minor issues below. With them fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 84cd2e39266f..427415ed4e4a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -6,6 +6,7 @@
>    * Copyright (c) 2022, Richard Acayan. All rights reserved.
>    */
>   
> +#include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/dma/qcom-gpi.h>
> @@ -400,6 +401,30 @@ cpu6_opp10: opp-1996800000 {
>   		};
>   	};
>   
> +	dsi_opp_table: opp-table-dsi {
> +		compatible = "operating-points-v2";
> +
> +		opp-19200000 {
> +			opp-hz = /bits/ 64 <19200000>;
> +			required-opps = <&rpmhpd_opp_min_svs>;
> +		};
> +
> +		opp-180000000 {
> +			opp-hz = /bits/ 64 <180000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-275000000 {
> +			opp-hz = /bits/ 64 <275000000>;
> +			required-opps = <&rpmhpd_opp_svs>;
> +		};
> +
> +		opp-358000000 {
> +			opp-hz = /bits/ 64 <358000000>;
> +			required-opps = <&rpmhpd_opp_svs_l1>;
> +		};
> +	};
> +
>   	psci {
>   		compatible = "arm,psci-1.0";
>   		method = "smc";
> @@ -1352,6 +1377,275 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		mdss: display-subsystem@ae00000 {
> +			compatible = "qcom,sdm670-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface", "core";
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP_PORT0 0 &mem_noc SLAVE_EBI_CH0 0>,
> +					<&mmss_noc MASTER_MDP_PORT1 0 &mem_noc SLAVE_EBI_CH0 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x880 0x8>,
> +				 <&apps_smmu 0xc80 0x8>;
> +
> +			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sdm670-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AXI_CLK>,
> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd SDM670_CX>;
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dpu_intf0_out: endpoint {
> +							remote-endpoint = <&mdss_dsi0_in>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&mdss_dsi1_in>;
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-19200000 {
> +						opp-hz = /bits/ 64 <19200000>;
> +						required-opps = <&rpmhpd_opp_min_svs>;
> +					};
> +
> +					opp-171428571 {
> +						opp-hz = /bits/ 64 <171428571>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-430000000 {
> +						opp-hz = /bits/ 64 <430000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0: dsi@ae94000 {
> +				compatible = "qcom,sdm670-dsi-ctrl",
> +					     "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae94000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <4>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SDM670_CX>;
> +
> +				phys = <&mdss_dsi0_phy>;
> +				phy-names = "dsi";

Not necessary anymore

> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,dsi-phy-10nm";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94a00 0 0x1e0>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +
> +			mdss_dsi1: dsi@ae96000 {
> +				compatible = "qcom,sdm670-dsi-ctrl",
> +					     "qcom,mdss-dsi-ctrl";
> +				reg = <0 0x0ae96000 0 0x400>;
> +				reg-names = "dsi_ctrl";
> +
> +				interrupt-parent = <&mdss>;
> +				interrupts = <5>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SDM670_CX>;
> +
> +				phys = <&mdss_dsi1_phy>;
> +				phy-names = "dsi";

Not necessary anymore

> +
> +				status = "disabled";
> +
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss_dsi1_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						mdss_dsi1_out: endpoint {
> +						};
> +					};
> +				};
> +			};
> +
> +			mdss_dsi1_phy: phy@ae96400 {
> +				compatible = "qcom,dsi-phy-10nm";
> +				reg = <0 0x0ae96400 0 0x200>,
> +				      <0 0x0ae96600 0 0x280>,
> +				      <0 0x0ae96a00 0 0x10e>;
> +				reg-names = "dsi_phy",
> +					    "dsi_phy_lane",
> +					    "dsi_pll";
> +
> +				#clock-cells = <1>;
> +				#phy-cells = <0>;
> +
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&rpmhcc RPMH_CXO_CLK>;
> +				clock-names = "iface", "ref";
> +
> +				status = "disabled";
> +			};
> +		};
> +
> +		dispcc: clock-controller@af00000 {
> +			compatible = "qcom,sdm845-dispcc";
> +			reg = <0 0x0af00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> +				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi1_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "bi_tcxo",
> +				      "gcc_disp_gpll0_clk_src",
> +				      "gcc_disp_gpll0_div_clk_src",
> +				      "dsi0_phy_pll_out_byteclk",
> +				      "dsi0_phy_pll_out_dsiclk",
> +				      "dsi1_phy_pll_out_byteclk",
> +				      "dsi1_phy_pll_out_dsiclk",
> +				      "dp_link_clk_divsel_ten",
> +				      "dp_vco_divided_clk_src_mux";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		apps_smmu: iommu@15000000 {
>   			compatible = "qcom,sdm670-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>   			reg = <0 0x15000000 0 0x80000>;

-- 
With best wishes
Dmitry

