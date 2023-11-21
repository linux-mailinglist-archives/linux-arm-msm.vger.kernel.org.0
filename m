Return-Path: <linux-arm-msm+bounces-1265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C457F22A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF28D1F26421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB4517D9;
	Tue, 21 Nov 2023 00:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UoXGJzpe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566C7D9;
	Mon, 20 Nov 2023 16:56:23 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0CGSn017609;
	Tue, 21 Nov 2023 00:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DG0DOD/Ur8LEpT71nNXs+yj0tAEtVwOJygjIn4QE5J4=;
 b=UoXGJzpeMBIIufhhG876Od63WUlrYKEjQQ+iUpYZh4eBN1HuKSNqZ7L41UTuuiT3wUKd
 Y4SbesJxH33NA8GTbOeWDtdFyVEvaes2AhVtpzY5SZnpu2qBbdxVNzFZitklGqyNaiOr
 7UyeEZ+g88STzD7zRHzBV0t4TsYfF1ztxny/w7+u3ZNzc/NG83NoVLJZ+uQ+Xj5N7B3i
 276/cqmv/FVuPGYPD3s+7f550K4Up55xWJPaluxUiaq3ChvMGdVFgQAHtWjIUIkfwemR
 ecq+UtCfgJuETxKRZonfi8is/hxflWy4XpPZlMIByY12Ga4lYn5zOfrDsrVJ8Zr0/2eM 5A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug37mj6ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:56:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0uG7A014608
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:56:17 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:56:14 -0800
Message-ID: <f547dfb5-eda8-4bc8-b34a-daa40d9a6e8d@quicinc.com>
Date: Tue, 21 Nov 2023 08:56:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] arm64: dts: qcom: sm8550-aim300: add display and
 panel
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-11-quic_tengfan@quicinc.com>
 <a1672479-ca5f-4d96-8583-014d3adfc37c@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <a1672479-ca5f-4d96-8583-014d3adfc37c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S6TVRe9kPCQMGZ8b9xxaZxVFkNzrgDhF
X-Proofpoint-ORIG-GUID: S6TVRe9kPCQMGZ8b9xxaZxVFkNzrgDhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311210003



在 11/17/2023 6:30 PM, Dmitry Baryshkov 写道:
> On 17/11/2023 12:18, Tengfei Fan wrote:
>> Enable Display Subsystem with Visionox VTDR6130 Panel.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 68 ++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> index cafddc02aef0..9b568ae9581e 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> @@ -432,6 +432,46 @@
>>            <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
>>   };
>> +&mdss {
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dsi0 {
>> +    vdda-supply = <&vreg_l3e_1p2>;
>> +    status = "okay";
>> +
>> +    panel@0 {
>> +        compatible = "visionox,vtdr6130";
>> +        reg = <0>;
>> +
>> +        pinctrl-0 = <&sde_dsi_active>, <&sde_te_active>;
>> +        pinctrl-1 = <&sde_dsi_suspend>, <&sde_te_suspend>;
>> +        pinctrl-names = "default", "sleep";
>> +
>> +        reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
>> +
>> +        vci-supply = <&vreg_l13b_3p0>;
>> +        vdd-supply = <&vreg_l11b_1p2>;
>> +        vddio-supply = <&vreg_l12b_1p8>;
>> +
>> +        port {
>> +            panel0_in: endpoint {
>> +                remote-endpoint = <&mdss_dsi0_out>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&mdss_dsi0_out {
>> +    remote-endpoint = <&panel0_in>;
>> +    data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&mdss_dsi0_phy {
>> +    vdds-supply = <&vreg_l1e_0p88>;
>> +    status = "okay";
>> +};
>> +
>>   &pcie_1_phy_aux_clk {
>>       status = "disabled";
>>   };
>> @@ -533,6 +573,34 @@
>>   &tlmm {
>>       gpio-reserved-ranges = <32 8>;
>> +    sde_dsi_active: sde-dsi-active-state {
> 
> sde is the name from the other kernel branch. Drop it please. Just 'dsi' 
> is enough.
sure, I wil drop sde in next new version patch series.
> 
>> +        pins = "gpio133";
>> +        function = "gpio";
>> +        drive-strength = <8>;
>> +        bias-disable;
>> +    };
>> +
>> +    sde_dsi_suspend: sde-dsi-suspend-state {
>> +        pins = "gpio133";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-pull-down;
>> +    };
>> +
>> +    sde_te_active: sde-te-active-state {
>> +        pins = "gpio86";
>> +        function = "mdp_vsync";
>> +        drive-strength = <2>;
>> +        bias-pull-down;
>> +    };
>> +
>> +    sde_te_suspend: sde-te-suspend-state {
>> +        pins = "gpio86";
>> +        function = "mdp_vsync";
>> +        drive-strength = <2>;
>> +        bias-pull-down;
>> +    };
>> +
>>       wcd_default: wcd-reset-n-active-state {
>>           pins = "gpio108";
>>           function = "gpio";
> 

-- 
Thx and BRs,
Tengfei Fan

