Return-Path: <linux-arm-msm+bounces-38586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE929D45D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 03:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A682DB23B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 02:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E4243ACB;
	Thu, 21 Nov 2024 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FEz1SJ7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168B841C79
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 02:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732156904; cv=none; b=bERztwceuKFHfz+PTKLEmXm/4zGZhmVfBzu2l4rOUGyemJ1xnKvBR+BcLykj87SPMmx1jdHYUWnl3v9xrLl4rx05R+Du3gXBuuOvUPHiJvL8WEItVXkWH56K/eYXUCZmdFpONxhPhLaR0jE4wwtByJW2g8rwzur3KBtzvxfHbBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732156904; c=relaxed/simple;
	bh=AEzgMOlDOWx9BJ3aNiI2wW6jHZC5Bes92efKhNw9/Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IwpwjPOQdLgzXdSCgL5aodJRT25aS7wrwKigJA0qJKgJAkiMn2ns6kRb2sx8LPRtNZQyzbWbfKB4+zSyxRZMmmJD11KC0cDhs3UUsk9AO4H7VmTo6+smvBVjW0aOPwmv7uQOclxJYby7xxk9FKNCtFAwuuyC79WLX9WJ7JZIRkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FEz1SJ7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKMc9g026025;
	Thu, 21 Nov 2024 02:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3WAgkoG5Hv//hMOmUX9u0Y/yGExsZRHZtaenYTsM/g=; b=FEz1SJ7oXkRW1cqW
	jD3JQXeTo4C+KgKuxxhjTu1BJ4j8naufshkdYf0uLETlOF1E+vQSehLuFxJ8mOCb
	m4MVVOtM/1XDcAEieV4HTk1Mvw08sUFIIrBUyGYZuGM48M2kap/rywLT/Y4sTeVd
	YQteXsAaohGH30FFHQjtRSh4Dcb3lBkfI7zliA3XT+reCr5yjToprHfXtPpCZGw3
	s4T3JOWGIzeLXdhJvJ2GROD9KufOirBuz1iyO+OJ8xQuN+AB3ORvqU/W6z14obzh
	kN+Pp43jWxDD9rM1Q83yKD7Frp7bLAT3hUBecJjmjDlNLw7CvzrRvELHsBQ61Gzr
	uwIxvw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjjjsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 02:41:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL2fUMd005250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 02:41:30 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 18:41:26 -0800
Message-ID: <ea4a48bd-3c40-496b-afd0-9f4b4c584435@quicinc.com>
Date: Thu, 21 Nov 2024 10:41:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: qcom: qcs615: Add display mdss and dsi
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kernel@quicinc.com>, <quic_lliu6@quicinc.com>,
        <quic_xiangxuy@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-2-4efa191dbdd4@quicinc.com>
 <ypdgy77jreyqqdylwcmj2inl3ddxfg6iqoefv6g6hzofn6t73l@n6upddhckqeu>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <ypdgy77jreyqqdylwcmj2inl3ddxfg6iqoefv6g6hzofn6t73l@n6upddhckqeu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Ks9n53U62_64C75_W5k7S0FkciZcQdT
X-Proofpoint-ORIG-GUID: 5Ks9n53U62_64C75_W5k7S0FkciZcQdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210021



On 2024/10/14 18:27, Dmitry Baryshkov wrote:
> On Mon, Oct 14, 2024 at 05:47:28PM +0800, fangez via B4 Relay wrote:
>> From: lliu6 <quic_lliu6@quicinc.com>
> 
> This is not a name.
fixed in v2
> 
>>
>> Add display mdss and dsi configuration for QCS615 SoC.
> 
> MDSS, DSI
> 
> separate Ride configuration to a separate commit
> 
> Patch order is wrong.
> - dt-bindings
> - driver changes
> - dtsi
> - dts
> 
ok will fix it in next version
it will be:
- dtb
dt-bindings: display/msm: Add SM6150 DSI phy
dt-bindings: display/msm: dsi-controller-main: Document SM6150
dt-bindings: display/msm: Add SM6150 MDSS & DPU

- driver
drm/msm: mdss: Add SM6150 support
drm/msm/dpu: Add SM6150 support
drm/msm/dsi: Add dsi phy support for SM6150
drm/msm/dsi: Add support for SM6150

- dtsi
arm64: dts: qcom: Add display support for QCS615
- dts
arm64: dts: qcom: Add display support for QCS615 RIDE board

>>
>> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 101 ++++++++++++++++
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi     | 195 +++++++++++++++++++++++++++++++
>>   2 files changed, 296 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index d05a881d7ffeca9de175af2a9062f5bccadcbdfd..f275145c395aedb71bdcd8a88b82917db53e7167 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -207,6 +207,107 @@ &gcc {
>>   		 <&sleep_clk>;
>>   };
>>   
>> +&i2c2 {
>> +	clock-frequency = <400000>;
>> +	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
> 
> empty line
fixed in v2
> 
>> +	ioexp: gpio@3e {
>> +		#gpio-cells = <2>;
>> +		#interrupt-cells = <2>;
>> +		compatible = "semtech,sx1509q";
>> +		reg = <0x3e>;
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <58 0>;
>> +		gpio-controller;
>> +		interrupt-controller;
>> +		semtech,probe-reset;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&dsi0_hpd_cfg_pins &dsi0_cdet_cfg_pins &dp_hpd_cfg_pins>;
> 
> No, these pins are not used by the IO expander. Please moved them to the
> corresponding devices.
will remove pinctrl part
- pinctrl-names = "default";
- pinctrl-0 = <&dsi0_hpd_cfg_pins &dsi0_cdet_cfg_pins &dp_hpd_cfg_pins>;

> 
> 
> empty line
fixed in v2
> 
>> +		dsi0_hpd_cfg_pins: gpio0-cfg {
> 
> What exactly is DSI HPD?
> 
>> +			pins = "gpio0";
>> +			bias-pull-up;
>> +		};
> 
> and here (and you'll guess all other relevant places, I hope it's
> obvious).
> 
>> +		dsi0_cdet_cfg_pins: gpio1-cfg {
>> +			pins = "gpio1";
>> +			bias-pull-down;
>> +		};
>> +		dp_hpd_cfg_pins: gpio8-cfg {
>> +			pins = "gpio8";
>> +			bias-pull-down;
>> +		};
>> +	};
will remove dsi0_hpd_cfg_pins, dsi0_cdet_cfg_pins and dp_hpd_cfg_pins
>> +
>> +	i2c-mux@77 {
>> +		compatible = "nxp,pca9542";
>> +		reg = <0x77>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		i2c@0 {
>> +			reg = <0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			anx_7625_1: anx7625@2c {
> 
> Are there more than one?
fixed in v2
change anx_7625_1 to anx_7625
> 
>> +				compatible = "analogix,anx7625";
>> +				reg = <0x58>;
>> +				interrupt-parent = <&ioexp>;
>> +				interrupts = <0 0>;
>> +				enable-gpios = <&tlmm 4 0>;
> 
> Use defines for the GPIO flags instead of 0
fixed in v2
change 0 to GPIO_ACTIVE_HIGH botin in enable and reset gpios
> 
>> +				reset-gpios = <&tlmm 5 0>;
>> +				wakeup-source;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&anx_7625_1 {
> 
> No need to, keep it in the same node.
fixed in v2
> 
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		port@0 {
>> +			reg = <0>;
>> +			anx_7625_1_in: endpoint {
>> +				remote-endpoint = <&mdss_dsi0_out>;
>> +			};
>> +		};
> 
> Missing port@1 and the connector node.
fixed in v2
> 
>> +	};
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +	status = "okay";
> 
> Status is the last property.
> 
>> +	vdda-supply = <&vreg_l11a>;
>> +};
>> +
>> +&mdss_dsi0_out {
>> +	remote-endpoint = <&anx_7625_1_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +	status = "okay";
>> +	vdds-supply = <&vreg_l5a>;
>> +};
>> +
>> +&tlmm {
>> +	ioexp_intr_active: ioexp_intr_active {
> 
> This doesn't seem to be validated. Please check your patches before
> sending.
will remove tlmm for this part
> 
>> +		pins = "gpio58";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +	ioexp_reset_active: ioexp_reset_active {
>> +		pins = "gpio3";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 8e2199bb180d85a86a882c4253778c7e8f34798b..2a6c08220e6c4ded49861754d81d0924389dd93e 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -1266,6 +1266,201 @@ camcc: clock-controller@ad00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		mdss: display-subsystem@ae00000 {
>> +			compatible = "qcom,qcs615-mdss";
>> +			reg = <0 0x0ae00000 0 0x1000>;
>> +			reg-names = "mdss";
>> +
>> +			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>,
> 
> QCOM_ICC_TAG_ALWAYS
fixed in v2
> 
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					&config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "mdp0-mem",
>> +					     "cpu-cfg";
>> +
>> +			power-domains = <&dispcc MDSS_CORE_GDSC>;
>> +
>> +			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&gcc GCC_DISP_HF_AXI_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_MDP_CLK>;
>> +
>> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-controller;
>> +			#interrupt-cells = <1>;
>> +
>> +			iommus = <&apps_smmu 0x800 0x0>;
>> +
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			status = "disabled";
>> +
>> +			mdss_mdp: display-controller@ae01000 {
>> +				compatible = "qcom,qcs615-dpu";
>> +				reg = <0 0x0ae01000 0 0x8f000>,
>> +				      <0 0x0aeb0000 0 0x2008>;
>> +				reg-names = "mdp", "vbif";
>> +
>> +				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_MDP_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
> 
> Please indent lists so that the values are one under another, starting
> at the same column.
sorry, fixed in v2
> 
>> +				clock-names = "bus",
>> +							  "iface",
>> +							  "lut",
>> +							  "core",
>> +							  "vsync";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
>> +				assigned-clock-rates = <19200000>;
>> +
>> +				operating-points-v2 = <&mdp_opp_table>;
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <0>;
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						dpu_intf0_out: endpoint {
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						dpu_intf1_out: endpoint {
>> +							remote-endpoint = <&mdss_dsi0_in>;
>> +						};
>> +					};
>> +				};
>> +
>> +				mdp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-375000000 {
>> +						opp-hz = /bits/ 64 <375000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-500000000 {
>> +						opp-hz = /bits/ 64 <500000000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +
>> +					opp-575000000 {
>> +						opp-hz = /bits/ 64 <575000000>;
>> +						required-opps = <&rpmhpd_opp_turbo>;
>> +					};
>> +
>> +					opp-650000000 {
>> +						opp-hz = /bits/ 64 <650000000>;
>> +						required-opps = <&rpmhpd_opp_turbo_l1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss_dsi0: dsi@ae94000 {
>> +				compatible = "qcom,qcs615-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>> +				reg = <0 0x0ae94000 0 0x400>;
>> +				reg-names = "dsi_ctrl";
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <4>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
>> +						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +						 <&gcc GCC_DISP_HF_AXI_CLK>;
>> +				clock-names = "byte",
>> +							  "byte_intf",
>> +							  "pixel",
>> +							  "core",
>> +							  "iface",
>> +							  "bus";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
>> +							 <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
>> +							 <&mdss_dsi0_phy 1>;
>> +
>> +				operating-points-v2 = <&dsi0_opp_table>;
>> +
>> +				phys = <&mdss_dsi0_phy>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				dsi0_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-164000000 {
>> +						opp-hz = /bits/ 64 <164000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-187500000 {
>> +						opp-hz = /bits/ 64 <187500000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-225000000 {
>> +						opp-hz = /bits/ 64 <225000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +
>> +					opp-262500000 {
>> +						opp-hz = /bits/ 64 <262500000>;
>> +						required-opps = <&rpmhpd_opp_nom>;
>> +					};
>> +				};
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dsi0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf1_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dsi0_out: endpoint {
>> +						};
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss_dsi0_phy: phy@ae94400 {
>> +				compatible = "qcom,qcs615-dsi-phy-14nm";
>> +				reg = <0 0x0ae94400 0 0x100>,
>> +				      <0 0x0ae94500 0 0x300>,
>> +				      <0 0x0ae94800 0 0x188>;
>> +				reg-names = "dsi_phy",
>> +					    "dsi_phy_lane",
>> +					    "dsi_pll";
>> +
>> +				#clock-cells = <1>;
>> +				#phy-cells = <0>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&rpmhcc RPMH_CXO_CLK>;
>> +				clock-names = "iface", "ref";
>> +
>> +				status = "disabled";
>> +			};
> 
> Does QCS615 have a DP controller? Please mention it in the commit
> message.
yes, have DP. it's another big change, will upload in next patch series
fixed in v2, added comments in commit message
> 
>> +		};
>> +
>>   		dispcc: clock-controller@af00000 {
>>   			compatible = "qcom,qcs615-dispcc";
>>   			reg = <0 0xaf00000 0 0x20000>;
>>
>> -- 
>> 2.25.1
>>
>>
> 


