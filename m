Return-Path: <linux-arm-msm+bounces-1271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C27F22DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 02:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E287F1C20ED0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FCE1C04;
	Tue, 21 Nov 2023 01:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oyfh7+Tx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D02BD8;
	Mon, 20 Nov 2023 17:06:46 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKNwcKu029934;
	Tue, 21 Nov 2023 01:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UwAYIf5p+WLjnwn3eKwLrouIcWGRo+xC1JjFirfVDEg=;
 b=Oyfh7+TxWttcdAB9C9eplnCDhx4u+k4PziNPKzw4K4+4XxcATUDq4juRLsoCB3gIkwLu
 0fI6WIbCnqMEYBBKDVAmAWZuUhM2HX4yk1Rx5i1uhausc1sLwmbGhueUIsEWIWvU4xzg
 cxMMScDs5RmWL+9hT7d+p6iGhR5Os39L51zNwUUPhSEYLj5T1FFuQintEUG48gHYrP2D
 xJ2n6ahpn1bIqKsHTEHIiPrE/1WfYnxc+y17lD840vurdflG6z0NY3Z1q2o2FzbnwNqV
 1COv7UIo8RO2tOk3cA3BbWbrrXrxMX6gnjMwIP5SaluTLeAIGAgKK/Z2OHvRIVnETIGL mQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugdxmggdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 01:06:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL16eO7028004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 01:06:40 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 17:06:38 -0800
Message-ID: <9d8558ad-51ef-41a6-aa7e-b8a0b694ce95@quicinc.com>
Date: Tue, 21 Nov 2023 09:06:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/16] arm64: dts: qcom: sm8550-aim300: add pmic glink
 port/endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-16-quic_tengfan@quicinc.com>
 <e3e27fec-8ab9-4331-a5aa-2958dd630b11@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <e3e27fec-8ab9-4331-a5aa-2958dd630b11@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2FGLFD7WBnF9rI0GqAKmOiWDmc9T-jnK
X-Proofpoint-ORIG-GUID: 2FGLFD7WBnF9rI0GqAKmOiWDmc9T-jnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxlogscore=928 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311210004



在 11/17/2023 6:32 PM, Dmitry Baryshkov 写道:
> On 17/11/2023 12:18, Tengfei Fan wrote:
>> Add nodes to support Type-C USB/DP functionality.
>>
>> On this platform, a Type-C redriver is added to the SuperSpeed graph.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 88 +++++++++++++++++++++-
>>   1 file changed, 87 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts 
>> b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> index 6dc3040b9f76..f3c558dd40f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
>> @@ -100,7 +100,15 @@
>>                       reg = <1>;
>>                       pmic_glink_ss_in: endpoint {
>> -                        remote-endpoint = <&usb_1_dwc3_ss>;
>> +                        remote-endpoint = <&redriver_ss_out>;
>> +                    };
>> +                };
>> +
>> +                port@2 {
>> +                    reg = <2>;
>> +
>> +                    pmic_glink_sbu: endpoint {
>> +                        remote-endpoint = <&fsa4480_sbu_mux>;
>>                       };
>>                   };
>>               };
>> @@ -519,6 +527,62 @@
>>       };
>>   };
>> +&i2c_master_hub_0 {
>> +    status = "okay";
>> +};
>> +
>> +&i2c_hub_2 {
>> +    status = "okay";
>> +
>> +    typec-mux@42 {
>> +        compatible = "fcs,fsa4480";
>> +        reg = <0x42>;
>> +
>> +        vcc-supply = <&vreg_bob1>;
>> +
>> +        mode-switch;
>> +        orientation-switch;
>> +
>> +        port {
>> +            fsa4480_sbu_mux: endpoint {
>> +                remote-endpoint = <&pmic_glink_sbu>;
>> +            };
>> +        };
>> +    };
>> +
>> +    typec-retimer@1c {
>> +        compatible = "onnn,nb7vpq904m";
>> +        reg = <0x1c>;
>> +
>> +        vcc-supply = <&vreg_l15b_1p8>;
>> +
>> +        orientation-switch;
>> +        retimer-switch;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                redriver_ss_out: endpoint {
>> +                    remote-endpoint = <&pmic_glink_ss_in>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +
>> +                redriver_ss_in: endpoint {
>> +                    data-lanes = <3 2 1 0>;
>> +                    remote-endpoint = <&usb_dp_qmpphy_out>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +};
>> +
>>   &gcc {
>>       clocks = <&bi_tcxo_div2>, <&sleep_clk>,
>>            <&pcie0_phy>,
>> @@ -552,6 +616,16 @@
>>       status = "okay";
>>   };
>> +&mdss_dp0 {
>> +    status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +    data-lanes = <0 1>;
> 
> Why? Are you really limited to two lanes for DP by the hardware?
I will ask my internal colleagues to comfirm this configuration, and the 
I will share the confimed result with you.
> 
>> +    remote-endpoint = <&usb_dp_qmpphy_dp_in>;
>> +};
>> +
>> +
>>   &mdss_dsi0 {
>>       vdda-supply = <&vreg_l3e_1p2>;
>>       status = "okay";
>> @@ -861,6 +935,18 @@
>>       status = "okay";
>>   };
>> +&usb_dp_qmpphy_dp_in {
>> +    remote-endpoint = <&mdss_dp0_out>;
>> +};
>> +
>> +&usb_dp_qmpphy_out {
>> +    remote-endpoint = <&redriver_ss_in>;
>> +};
>> +
>> +&usb_dp_qmpphy_usb_ss_in {
>> +    remote-endpoint = <&usb_1_dwc3_ss>;
>> +};
>> +
>>   &xo_board {
>>       clock-frequency = <76800000>;
>>   };
> 

-- 
Thx and BRs,
Tengfei Fan

