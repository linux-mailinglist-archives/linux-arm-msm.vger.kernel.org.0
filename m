Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFBD63035D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Nov 2022 00:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbiKRX2o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 18:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235714AbiKRX2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 18:28:09 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386FCBFF41;
        Fri, 18 Nov 2022 15:15:50 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIMfj0R027519;
        Fri, 18 Nov 2022 23:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=v94/6KGvX5mWWucF39w0yI2pXPd6eeb+//iSZLz3HUE=;
 b=b0QRLy93Z9gl98LCgrx/Yow9Nm/uMeV2Hy6HA0SK7jf8VRUEyd8p0tHxBMDS/e/GWZqR
 gXWGt9EkmtlHX1yrC7h03pXynWafl1UfuBAJt08c93alOrRTqi/REbkzVzx7cFiG2xrR
 k2uTNlMeh0V39hTf8GUaI5g2T+woHBEEamKwp8LV8zfqgqTYNaSDOLRNBg7Ld8HMdKLe
 i4pU20ywDMaiZ95Y19zmHmBDMX+1Ep0G2bap3UnmAz0S/0fkrMoUlRJP4CjYEzk9qOuE
 Ko7ZXscbAIwMnKJh73FHhst9Jrkoy84f4Aty1SvH4MZCiJojd53wqssMWGDgyN1efnRF Uw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kx0rab54b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 23:15:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AINFacM009684
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 18 Nov 2022 23:15:36 GMT
Received: from [10.110.10.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 15:15:34 -0800
Message-ID: <528e0921-73d7-655e-c3dc-ac3ebb3a5979@quicinc.com>
Date:   Fri, 18 Nov 2022 15:15:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 10/12] arm64: dts: qcom: sc8280xp: Define some of the
 display blocks
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
CC:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-11-quic_bjorande@quicinc.com>
Content-Language: en-US
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <20221026032624.30871-11-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XidQF4c5Bu-yiac3VhUdLEtKaNqapi0S
X-Proofpoint-GUID: XidQF4c5Bu-yiac3VhUdLEtKaNqapi0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_08,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180139
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/25/2022 8:26 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Define the display clock controllers, the MDSS instances, the DP phys
> and connect these together.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>
> Changes since v2:
> - New patch on list
>
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 838 +++++++++++++++++++++++++
>   1 file changed, 838 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index ed806a6e20f6..8526ed74b7be 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4,6 +4,7 @@
>    * Copyright (c) 2022, Linaro Limited
>    */
>   
> +#include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/interconnect/qcom,sc8280xp.h>
> @@ -1245,6 +1246,44 @@ usb_1_ssphy: usb3-phy@8903400 {
>   			};
>   		};
>   
> +		mdss1_dp0_phy: phy@8909a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x08909a00 0 0x19c>,
> +			      <0 0x08909200 0 0xec>,
> +			      <0 0x08909600 0 0xec>,
> +			      <0 0x08909000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		mdss1_dp1_phy: phy@890ca00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x0890ca00 0 0x19c>,
> +			      <0 0x0890c200 0 0xec>,
> +			      <0 0x0890c600 0 0xec>,
> +			      <0 0x0890c000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>   		system-cache-controller@9200000 {
>   			compatible = "qcom,sc8280xp-llcc";
>   			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
> @@ -1360,6 +1399,326 @@ usb_1_dwc3: usb@a800000 {
>   			};
>   		};
>   
> +		mdss0: display-subsystem@ae00000 {
> +			compatible = "qcom,sc8280xp-mdss";
> +			reg = <0 0x0ae00000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc0 MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			resets = <&dispcc0 DISP_CC_MDSS_CORE_BCR>;
> +
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x1000 0x402>;
> +
> +			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss0_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sc8280xp-dpu";
> +				reg = <0 0x0ae01000 0 0x8f000>,
> +				      <0 0x0aeb0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&gcc GCC_DISP_SF_AXI_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc0 DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc0 DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <460000000>,
> +						       <19200000>;
> +
> +				operating-points-v2 = <&mdss0_mdp_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_MMCX>;
> +
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@5 {
> +						reg = <5>;
> +						mdss0_intf5_out: endpoint {
> +							remote-endpoint = <&mdss0_dp3_in>;
> +						};
> +					};
> +
> +					port@6 {
> +						reg = <6>;
> +						mdss0_intf6_out: endpoint {
> +							remote-endpoint = <&mdss0_dp2_in>;
> +						};
> +					};
> +				};
> +
> +				mdss0_mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +
just curious, where are mdss0_dp0 and mdss0_dp1?. Are two dp/usb combo 
phys not going used?
> +			mdss0_dp2: displayport-controller@ae9a000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0xae9a000 0 0x200>,
> +				      <0 0xae9a200 0 0x200>,
> +				      <0 0xae9a400 0 0x600>,
> +				      <0 0xae9b000 0 0x400>;
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <14>;
> +				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> +						  <&dispcc0 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp2_phy 0>, <&mdss0_dp2_phy 1>;
> +
> +				phys = <&mdss0_dp2_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss0_dp2_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_CX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss0_dp2_in: endpoint {
> +							remote-endpoint = <&mdss0_intf6_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss0_dp2_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss0_dp3: displayport-controller@aea0000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0xaea0000 0 0x200>,
> +				      <0 0xaea0200 0 0x200>,
> +				      <0 0xaea0400 0 0x600>,
> +				      <0 0xaea1000 0 0x400>;
> +				interrupt-parent = <&mdss0>;
> +				interrupts = <15>;
> +				clocks = <&dispcc0 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
> +					 <&dispcc0 DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc0 DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
> +						  <&dispcc0 DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp3_phy 0>, <&mdss0_dp3_phy 1>;
> +
> +				phys = <&mdss0_dp3_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss0_dp3_opp_table>;
> +				power-domains = <&dispcc0 MDSS_GDSC>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss0_dp3_in: endpoint {
> +							remote-endpoint = <&mdss0_intf5_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss0_dp3_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mdss0_dp2_phy: phy@aec2a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x0aec2a00 0 0x19c>,
> +			      <0 0x0aec2200 0 0xec>,
> +			      <0 0x0aec2600 0 0xec>,
> +			      <0 0x0aec2000 0 0x1c8>;
> +
> +			clocks = <&dispcc0 DISP_CC_MDSS_DPTX2_AUX_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		mdss0_dp3_phy: phy@aec5a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x0aec5a00 0 0x19c>,
> +			      <0 0x0aec5200 0 0xec>,
> +			      <0 0x0aec5600 0 0xec>,
> +			      <0 0x0aec5000 0 0x1c8>;
> +
> +			clocks = <&dispcc0 DISP_CC_MDSS_DPTX3_AUX_CLK>,
> +				 <&dispcc0 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		dispcc0: clock-controller@af00000 {
> +			compatible = "qcom,sc8280xp-dispcc0";
> +			reg = <0 0x0af00000 0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&mdss0_dp2_phy 0>,
> +				 <&mdss0_dp2_phy 1>,
> +				 <&mdss0_dp3_phy 0>,
> +				 <&mdss0_dp3_phy 1>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			power-domains = <&rpmhpd SC8280XP_MMCX>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			status = "disabled";
> +		};
> +
>   		pdc: interrupt-controller@b220000 {
>   			compatible = "qcom,sc8280xp-pdc", "qcom,pdc";
>   			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
> @@ -1972,6 +2331,485 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>   				qcom,remote-pid = <12>;
>   			};
>   		};
> +
> +		mdss1: display-subsystem@22000000 {
> +			compatible = "qcom,sc8280xp-mdss";
> +			reg = <0 0x22000000 0 0x1000>;
> +			reg-names = "mdss";
> +
> +			power-domains = <&dispcc1 MDSS_GDSC>;
> +
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_MDP_CLK>;
> +			clock-names = "iface",
> +				      "ahb",
> +				      "core";
> +
> +			resets = <&dispcc1 DISP_CC_MDSS_CORE_BCR>;
> +
> +			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +
> +			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 0 &mc_virt SLAVE_EBI1 0>,
> +					<&mmss_noc MASTER_MDP_CORE1_1 0 &mc_virt SLAVE_EBI1 0>;
> +			interconnect-names = "mdp0-mem", "mdp1-mem";
> +
> +			iommus = <&apps_smmu 0x1800 0x402>;
> +
> +			status = "disabled";
> +
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +
> +			mdss1_mdp: display-controller@22001000 {
> +				compatible = "qcom,sc8280xp-dpu";
> +				reg = <0 0x22001000 0 0x8f000>,
> +				      <0 0x220b0000 0 0x2008>;
> +				reg-names = "mdp", "vbif";
> +
> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
> +					 <&gcc GCC_DISP_SF_AXI_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_MDP_LUT_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_MDP_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_VSYNC_CLK>;
> +				clock-names = "bus",
> +					      "nrt_bus",
> +					      "iface",
> +					      "lut",
> +					      "core",
> +					      "vsync";
> +
> +				assigned-clocks = <&dispcc1 DISP_CC_MDSS_MDP_CLK>,
> +						  <&dispcc1 DISP_CC_MDSS_VSYNC_CLK>;
> +				assigned-clock-rates = <460000000>,
> +						       <19200000>;
> +
> +				operating-points-v2 = <&mdss1_mdp_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_MMCX>;
> +
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <0>;
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss1_intf0_out: endpoint {
> +							remote-endpoint = <&mdss1_dp0_in>;
> +						};
> +					};
> +
> +					port@4 {
> +						reg = <4>;
> +						mdss1_intf4_out: endpoint {
> +							remote-endpoint = <&mdss1_dp1_in>;
> +						};
> +					};
> +
> +					port@5 {
> +						reg = <5>;
> +						mdss1_intf5_out: endpoint {
> +							remote-endpoint = <&mdss1_dp3_in>;
> +						};
> +					};
> +
> +					port@6 {
> +						reg = <6>;
> +						mdss1_intf6_out: endpoint {
> +							remote-endpoint = <&mdss1_dp2_in>;
> +						};
> +					};
> +				};
> +
> +				mdss1_mdp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-200000000 {
> +						opp-hz = /bits/ 64 <200000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-300000000 {
> +						opp-hz = /bits/ 64 <300000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +					opp-600000000 {
> +						opp-hz = /bits/ 64 <600000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +
> +			mdss1_dp0: displayport-controller@22090000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0x22090000 0 0x200>,
> +				      <0 0x22090200 0 0x200>,
> +				      <0 0x22090400 0 0x600>,
> +				      <0 0x22091000 0 0x400>;
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <12>;
> +				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>;
> +
> +				phys = <&mdss1_dp0_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss1_dp0_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_CX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp0_in: endpoint {
> +							remote-endpoint = <&mdss1_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss1_dp0_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +
> +			};
> +
> +			mdss1_dp1: displayport-controller@22098000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0x22098000 0 0x200>,
> +				      <0 0x22098200 0 0x200>,
> +				      <0 0x22098400 0 0x600>,
> +				      <0 0x22099000 0 0x400>;
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <13>;
> +				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_AUX_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>;
> +
> +				phys = <&mdss1_dp1_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss1_dp1_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_CX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp1_in: endpoint {
> +							remote-endpoint = <&mdss1_intf4_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss1_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss1_dp2: displayport-controller@2209a000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0x2209a000 0 0x200>,
> +				      <0 0x2209a200 0 0x200>,
> +				      <0 0x2209a400 0 0x600>,
> +				      <0 0x2209b000 0 0x400>;
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <14>;
> +				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp2_phy 0>, <&mdss1_dp2_phy 1>;
> +
> +				phys = <&mdss1_dp2_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss1_dp2_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_CX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp2_in: endpoint {
> +							remote-endpoint = <&mdss1_intf6_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss1_dp2_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +			mdss1_dp3: displayport-controller@220a0000 {
> +				compatible = "qcom,sc8280xp-dp";
> +				reg = <0 0x220a0000 0 0x200>,
> +				      <0 0x220a0200 0 0x200>,
> +				      <0 0x220a0400 0 0x600>,
> +				      <0 0x220a1000 0 0x400>;
> +				interrupt-parent = <&mdss1>;
> +				interrupts = <15>;
> +				clocks = <&dispcc1 DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
> +					 <&dispcc1 DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
> +				clock-names = "core_iface", "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface", "stream_pixel";
> +
> +				assigned-clocks = <&dispcc1 DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
> +						  <&dispcc1 DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss1_dp3_phy 0>, <&mdss1_dp3_phy 1>;
> +
> +				phys = <&mdss1_dp3_phy>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&mdss1_dp3_opp_table>;
> +				power-domains = <&rpmhpd SC8280XP_CX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						mdss1_dp3_in: endpoint {
> +							remote-endpoint = <&mdss1_intf5_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +					};
> +				};
> +
> +				mdss1_dp3_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +
> +		mdss1_dp2_phy: phy@220c2a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x220c2a00 0 0x19c>,
> +			      <0 0x220c2200 0 0xec>,
> +			      <0 0x220c2600 0 0xec>,
> +			      <0 0x220c2000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX2_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		mdss1_dp3_phy: phy@220c5a00 {
> +			compatible = "qcom,sc8280xp-dp-phy";
> +			reg = <0 0x220c5a00 0 0x19c>,
> +			      <0 0x220c5200 0 0xec>,
> +			      <0 0x220c5600 0 0xec>,
> +			      <0 0x220c5000 0 0x1c8>;
> +
> +			clocks = <&dispcc1 DISP_CC_MDSS_DPTX3_AUX_CLK>,
> +				 <&dispcc1 DISP_CC_MDSS_AHB_CLK>;
> +			clock-names = "aux", "cfg_ahb";
> +
> +			power-domains = <&rpmhpd SC8280XP_MX>;
> +
> +			#clock-cells = <1>;
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		dispcc1: clock-controller@22100000 {
> +			compatible = "qcom,sc8280xp-dispcc1";
> +			reg = <0 0x22100000 0 0x20000>;
> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <0>,
> +				 <&mdss1_dp0_phy 0>,
> +				 <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>,
> +				 <&mdss1_dp1_phy 1>,
> +				 <&mdss1_dp2_phy 0>,
> +				 <&mdss1_dp2_phy 1>,
> +				 <&mdss1_dp3_phy 0>,
> +				 <&mdss1_dp3_phy 1>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			power-domains = <&rpmhpd SC8280XP_MMCX>;
> +			required-opps = <&rpmhpd_opp_nom>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +
> +			status = "disabled";
> +		};
>   	};
>   
>   	thermal-zones {
