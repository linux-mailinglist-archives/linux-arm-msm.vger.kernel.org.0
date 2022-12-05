Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF879642DF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 17:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbiLEQvh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 11:51:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232060AbiLEQu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 11:50:57 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2F6CE34
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 08:49:57 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id l11so16652484edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmbRhFoEX+2zLzyBtDeN3v1+jbWEErrwHpEUGgptp/s=;
        b=AKa7bBrXUFLEo7+yTlrl43wgFvRNWWkV/Oj65/9/+1YnvHZTc+WJ0k2vMjmgRSzL8/
         mA5bGTfRdoJpS+SKKk5AKd9GrO4IOASpNnpk8E5/plwvWjdGvTQvkFf5PWIy7K6AXDvh
         +XY5UHN099TZISLy+svWHn9s15kI2+kVsmg9qYt5plmPFTM2ngb2uzrMuSMYGOL7kNcG
         BNc3u89omhfkSToSE8ZgbSvmJY1cnch4+prEHR80dzCZMBxhADoJPAyXDpwZJ8Y1Fn6w
         en7FcksBtb8w5kKXN+jIsD6JpsR+zasnPe52nZh5rQPH4haozYxV9oruTF19X/zpUvJS
         03EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmbRhFoEX+2zLzyBtDeN3v1+jbWEErrwHpEUGgptp/s=;
        b=nR1BCVXcJmx0nBxxZqVMDxm4eaUKezYYvyVb3uzt2fsObA+fwejjztWqWDJBqWwkdc
         b4I67i7931W+GtYvz2xG5OV/g/L1tzMWNl5h8RhZlKpWaLrN2ebmTS4G95iI6w+D8MFM
         uDiZ+PMBOLhw3cBfQSdSYg54wBDgpeF90dQcWjcbwOqj4zMnl1X/csHk7modDydFBSQp
         ogr6KzwFQBOWjxRvddxOtQSWtiyW5R+gJiwcLjp6mLOpf5XZmbokbP7zMoV51MSDdLr8
         xhItttl3YSHn3DEo/I93Sroj/8fUijTy0HL29JSCPqe3Gy3+3EDoRhgwhKsn15Nagqqk
         hgaw==
X-Gm-Message-State: ANoB5pnFsk4UgAvM64YhZDiJj0pPVhiLhAGFRZKmvctke0tDDqkvdlw3
        XOiiGUaxlggrknn5hpm3kpJalQ==
X-Google-Smtp-Source: AA0mqf5VU9XSaeM55klchfdUEM78X31MeC820ny7k7ADhRph1/Zd+ruLYwdKvh0Y6mNhHK1R4eoTwA==
X-Received: by 2002:aa7:d659:0:b0:46b:1687:2e5d with SMTP id v25-20020aa7d659000000b0046b16872e5dmr33667281edr.136.1670258996422;
        Mon, 05 Dec 2022 08:49:56 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id ku11-20020a170907788b00b007c0c91eae04sm3900313ejc.151.2022.12.05.08.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 08:49:55 -0800 (PST)
Message-ID: <5aea6717-8a16-0316-ae6e-d89082d390a8@linaro.org>
Date:   Mon, 5 Dec 2022 17:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sm8350: Add display system
 nodes
To:     Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_kalyant@quicinc.com, angelogioacchino.delregno@somainline.org,
        loic.poulain@linaro.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-10-robert.foss@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221205163754.221139-10-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/12/2022 17:37, Robert Foss wrote:
> Add mdss, mdss_mdp, dsi0, dsi0_phy nodes. With these
> nodes the display subsystem is configured to support
> one DSI output.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 199 ++++++++++++++++++++++++++-
>   1 file changed, 195 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 434f8e8b12c1..fb1c616c5e89 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2020, Linaro Limited
>    */
>   
> +#include <dt-bindings/interconnect/qcom,sm8350.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/qcom,dispcc-sm8350.h>
>   #include <dt-bindings/clock/qcom,gcc-sm8350.h>
> @@ -2536,14 +2537,203 @@ usb_2_dwc3: usb@a800000 {
>   			};
>   		};
>   
> +		mdss: mdss@ae00000 {
> +			compatible = "qcom,sm8350-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			power-domains = <&dispcc MDSS_GDSC>;
> +			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +
> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&gcc GCC_DISP_HF_AXI_CLK>,
> +				 <&gcc GCC_DISP_SF_AXI_CLK>,
> +				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface", "bus", "nrt_bus", "core";
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x820 0x402>;
> +
> +			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sm8350-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					<&gcc GCC_DISP_SF_AXI_CLK>,
> +					<&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
> +					<&dispcc DISP_CC_MDSS_MDP_CLK>,
> +					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <19200000>;
> +
> +				operating-points-v2 = <&mdp_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
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
> +						dpu_intf1_out: endpoint {
> +							remote-endpoint = <&dsi0_in>;
> +						};
> +					};
> +				};
> +			};
> +
> +			dsi0: dsi@ae94000 {
With the 8280 patchset [1], it was decided that mdss nodes should now 
have a mdss_ prefix in their labels, to keep them near each other when 
referencing them in device DTSes.


> +				compatible = "qcom,mdss-dsi-ctrl";
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
> +					 <&gcc GCC_DISP_HF_AXI_CLK>;
> +				clock-names = "byte",
> +					      "byte_intf",
> +					      "pixel",
> +					      "core",
> +					      "iface",
> +					      "bus";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&dsi0_phy 0>,
> +							 <&dsi0_phy 1>;
> +
> +				operating-points-v2 = <&dsi_opp_table>;
> +				power-domains = <&rpmhpd SM8350_MMCX>;
> +
> +				phys = <&dsi0_phy>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						dsi0_in: endpoint {
> +							remote-endpoint = <&dpu_intf1_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						dsi0_out: endpoint {
> +						};
> +					};
> +				};
> +
> +				mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					/* TODO: opp-200000000 should work with
/*
  * TODO:

and the wrapping looks rather weird.. or is that my email client?


Other than that, lgtm!

Konrad

[1] 
https://lore.kernel.org/linux-arm-msm/20221130200739.ube7hvobythkbhuy@builder.lan/T/#m93e15b290b40c2d2c2ec6f639135ffa38882d0b2
> +					 * &rpmhpd_opp_low_svs, but one some of
> +					 * sm8350_hdk boards reboot using this
> +					 * opp.
> +					 */
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-345000000 {
> +						opp-hz = /bits/ 64 <345000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-460000000 {
> +						opp-hz = /bits/ 64 <460000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,dsi-phy-5nm-8350";
> +				reg = <0 0x0ae94400 0 0x200>,
> +				      <0 0x0ae94600 0 0x280>,
> +				      <0 0x0ae94900 0 0x260>;
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
> +
> +				dsi_opp_table: dsi-opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-187500000 {
> +						opp-hz = /bits/ 64 <187500000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-358000000 {
> +						opp-hz = /bits/ 64 <358000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		dispcc: clock-controller@af00000 {
>   			compatible = "qcom,sm8350-dispcc";
>   			reg = <0 0x0af00000 0 0x10000>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> -				 <0>,
> +				 <&dsi0_phy 0>, <&dsi0_phy 1>,
> +				 <0>, <0>,
>   				 <0>,
>   				 <0>;
>   			clock-names = "bi_tcxo",
> @@ -2558,6 +2748,7 @@ dispcc: clock-controller@af00000 {
>   			#power-domain-cells = <1>;
>   
>   			power-domains = <&rpmhpd SM8350_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
>   		};
>   
>   		adsp: remoteproc@17300000 {
