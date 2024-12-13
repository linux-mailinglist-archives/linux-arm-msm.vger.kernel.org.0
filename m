Return-Path: <linux-arm-msm+bounces-41962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801049F0989
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B418283C5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 10:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21A21BF311;
	Fri, 13 Dec 2024 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nkRdYOhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025F1BE251;
	Fri, 13 Dec 2024 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085898; cv=none; b=DsR5sBRD0c1MhxhZ6xLR58ZNtCHj9jQf1ht25NSjEcA8Hw8AC/FlPftdShBZXoQ0AlleUXtEftTn/+n56xbv2LR2vB5vWczrfV8VfTTV/tLWhNbMlJ3y/v1fGxsK29dEsNuSLVyJGPs+fOFn2aZg4ou/JjZddesGgwp7Hi31xLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085898; c=relaxed/simple;
	bh=jdFr0oQs25XV2DlplfS+NxPdPJxBe22JHlJIxZO55U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JDDiJd0fwVrzYayJyKBIYsZMFyNe7nFrIYIs37CYomy7WUhF41Ta9Gt1bHBRQZ9kreeJwBuOEq0BHDxpPwUsdRyIQxicU6ew9/c+fl+EfejCPUoE2FfgPykYC6TvXsljKucnXFt8GOWzrPo5ApWTcL+9UitfCcWtdzcCL49CTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nkRdYOhg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD8VoED022852;
	Fri, 13 Dec 2024 10:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3rNYuytu2BxN4xjDtZx2H8jmlNM1LEWyK6VRpxKEiY=; b=nkRdYOhgG0H810xi
	xcr15nmES22/10HJP2M0uBbSyDfCqgBW2waIVaTE/06u/Vmda9uFj9nVDIh4/2e5
	oaMRXueRhbSzYqrd4OJKNZhF8wbI1eBBW3AHdXG1KIwxaWCbvO9DDdHz+pDaRIYk
	rgoq6OUYpWpvjApIDnX9uYdCx0eXKIvGJ/OIv7MO7y2FIy9FUY/XBlbeMsS+raNn
	rJsm5dqtWWujWgiBC0pmkF+/aNrVjny0sdCAemy243O4WfqKxYtV7Am7dyrfSG5m
	x0bqPSHrHJDCOXDUtZnlK6g43j9M8Ww52xK78wshlLmebbxVJ1RjpCfpfbTm6v1G
	7h/MBA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g4wna4dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:31:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDAVWLE001908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 10:31:32 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 02:31:29 -0800
Message-ID: <f94d9935-885a-49f8-be53-4e218c144206@quicinc.com>
Date: Fri, 13 Dec 2024 18:31:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add DisplayPort support for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fange Zhang
	<quic_fangez@quicinc.com>,
        Li Liu <quic_lliu6@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com>
 <20241210-add-displayport-support-to-qcs615-devicetree-v1-1-02f84a92c44b@quicinc.com>
 <5tao3qowqb5av5bhvwn4l3bfdumbfgqcvzxl3doojhjtd4hxsa@yc6wzmx5zets>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <5tao3qowqb5av5bhvwn4l3bfdumbfgqcvzxl3doojhjtd4hxsa@yc6wzmx5zets>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q5D3BJphghfrvLJ5EFZ9WEyAoKGVj8ON
X-Proofpoint-GUID: q5D3BJphghfrvLJ5EFZ9WEyAoKGVj8ON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 mlxscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130072



On 12/10/2024 6:38 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 05:11:05PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller and phy configuration for QCS615 platform.
>>
>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 107 ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 105 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> index 0a629c44e960e38891f48a8a021b86a6c1dadea1..dbd6eae267d7470d9b9a6c303eac03b64c3df3fc 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>> @@ -17,6 +17,7 @@
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>>  
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -2889,6 +2890,7 @@ ports {
>>  					port@0 {
>>  						reg = <0>;
>>  						dpu_intf0_out: endpoint {
>> +							remote-endpoint = <&mdss_dp0_in>;
>>  						};
>>  					};
>>  
>> @@ -3002,6 +3004,107 @@ mdss_dsi0_phy: phy@ae94400 {
>>  
>>  				status = "disabled";
>>  			};
>> +
>> +			mdss_dp0: displayport-controller@ae90000 {
> 
> Which order should nodes follow in DT?
> 
OK, WIll sort by node address.
>> +				compatible = "qcom,sm6150-dp";
>> +
>> +				reg = <0x0 0xae90000 0x0 0x200>,
>> +				      <0x0 0xae90200 0x0 0x200>,
>> +				      <0x0 0xae90400 0x0 0x600>,
>> +				      <0x0 0xae90a00 0x0 0x600>;
> 
> 0x0ae90000, etc. If it is not written in your company's "upstreaming"
> document, please update it. If it is written there, why didn't you
> follow it?
> 
Will fix padding in next patch and update our upstreaming documents.
>> +
>> +				interrupt-parent = <&mdss>;
>> +				interrupts = <12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> +				assigned-clock-parents = <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +				phys = <&mdss_dp_phy QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +				power-domains = <&rpmhpd RPMHPD_CX>;
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +						mdss_dp0_out: endpoint {
>> +						};
>> +					};
>> +				};
>> +
>> +				dp_opp_table: opp-table {
>> +					compatible = "operating-points-v2";
>> +
>> +					opp-160000000 {
>> +						opp-hz = /bits/ 64 <160000000>;
>> +						required-opps = <&rpmhpd_opp_low_svs>;
>> +					};
>> +
>> +					opp-270000000 {
>> +						opp-hz = /bits/ 64 <270000000>;
>> +						required-opps = <&rpmhpd_opp_svs>;
>> +					};
>> +
>> +					opp-540000000 {
>> +						opp-hz = /bits/ 64 <540000000>;
>> +						required-opps = <&rpmhpd_opp_svs_l1>;
>> +					};
>> +				};
>> +			};
>> +
>> +			mdss_dp_phy: phy@88e9000 {
> 
> Also misplaced node.
> 
Ok, will fix in next patch.
>> +				compatible = "qcom,qcs615-qmp-dp-phy";
>> +
>> +				reg = <0x0 0x88e9000 0x0 0x200>,
>> +				      <0x0 0x88e9400 0x0 0x10c>,
>> +				      <0x0 0x88e9800 0x0 0x10c>,
>> +				      <0x0 0x88e9c00 0x0 0x200>;
> 
> 0x088e9000, etc.
> 
Ok, will fix address padding.
>> +
>> +				clocks = <&gcc GCC_AHB2PHY_WEST_CLK>,
>> +					 <&gcc GCC_USB3_SEC_CLKREF_CLK>;
>> +				clock-names = "cfg_ahb",
>> +					      "ref";
>> +				clock-output-names = "dp_phy_link_clk",
>> +						     "dp_phy_vco_div_clk";
>> +
>> +				resets = <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
>> +				reset-names = "phy";
>> +
>> +				qcom,tcsr-reg = <&tcsr 0xb24c>;
>> +
>> +				#clock-cells = <1>;
>> +				#phy-cells = <1>;
>> +
>> +				status = "disabled";
>> +			};
>>  		};
>>  
>>  		dispcc: clock-controller@af00000 {
>> @@ -3013,8 +3116,8 @@ dispcc: clock-controller@af00000 {
>>  				 <&mdss_dsi0_phy 0>,
>>  				 <&mdss_dsi0_phy 1>,
>>  				 <0>,
>> -				 <0>,
>> -				 <0>;
>> +				 <&mdss_dp_phy QMP_USB43DP_DP_LINK_CLK>,
>> +				 <&mdss_dp_phy QMP_USB43DP_DP_VCO_DIV_CLK>;
>>  
>>  			#clock-cells = <1>;
>>  			#reset-cells = <1>;
>>
>> -- 
>> 2.34.1
>>
> 


