Return-Path: <linux-arm-msm+bounces-34865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1679A3631
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE75F2816E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 06:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4ADC17E472;
	Fri, 18 Oct 2024 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p5Yq2OIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B162905;
	Fri, 18 Oct 2024 06:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234514; cv=none; b=iLrlQihHcEw/hIiSs+MRzp+hTB+oC6n+YvhY3PhHXmv4lMT6Ym/+U2vkKsVSsDO7NntD+2+3LTKUmi7w2aG8DTdSVxLkvYl0ImBWJx6CqGaYKRH5DQZdHfACTX2O6vIjEqDwv7p4j3YTgd3VJRCQpiaIcJqzsgDEW4QGHmeW5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234514; c=relaxed/simple;
	bh=xFoVyEWiStOFawhqce2oYddqczGRAxBGatxKF2Ya1JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S+dCB8P1Zl3fUW6zSPVagwDrKLfdFNYUzgCcbJ1KXgIw0NZTdxVCxmXd/oeO2eWJKh1OpWcE3ZVmnkBmP/8np9xrgzUnD2novLTwo5N0frh+kyibtGMwmK8P3Rc7rJeyJQ0H/rmrrc9kVakLuSwfYDeFf2MqghUCr/XWRU4GfD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p5Yq2OIB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4ABDI007525;
	Fri, 18 Oct 2024 06:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQcOAipVIsYrN5qxd1arZz8nEnSrE8tr7nFeXJ2ibpI=; b=p5Yq2OIBt3wh0T+s
	0ZCgdN5Qcl4ifgeBUKqY7ovBnAhLpMIyQ0ikhQdn2eauGuTQnkxq3y13qhsHmOK3
	D+IO6mf1cvKfjpdprKwNGiz0JgXNR3oS/yU55CobcO5AUjSHDBIOOpcKVCdsXHlB
	td3PtIIgA5a2pEWeIYbi68Z0bP5WM257Oz4+fylJ3GFQGKzZdf3pfnq1IjBN/zXs
	b9WbHZfD/ouAobAiU1KBBs3oM7yPS1fCHocFE8r6ab9BMzASDaWeCnoUz6wh7gE5
	l1g8xwKqHZfo7sAvWJS+1L4SC/k5fURMMOQPcAeGxWEJjNFPxAfzG+GzWwbNqXuL
	xyQJXw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc42m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:54:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I6svSa023780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 06:54:57 GMT
Received: from [10.253.38.177] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 23:54:52 -0700
Message-ID: <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
Date: Fri, 18 Oct 2024 14:54:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
 <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c5Or9K_MdDIhJ7_y1VP9h5_obojfo7KE
X-Proofpoint-ORIG-GUID: c5Or9K_MdDIhJ7_y1VP9h5_obojfo7KE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180042



On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
> On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
>> The CMN PLL clock controller allows selection of an input
>> clock rate from a defined set of input clock rates. It in-turn
>> supplies fixed rate output clocks to the hardware blocks that
>> provide ethernet functions such as PPE (Packet Process Engine)
>> and connected switch or PHY, and to GCC.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
>>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
>>   2 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> index 91e104b0f865..77e1e42083f3 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
>> @@ -3,7 +3,7 @@
>>    * IPQ9574 RDP board common device tree source
>>    *
>>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   /dts-v1/;
>> @@ -164,6 +164,10 @@ &usb3 {
>>   	status = "okay";
>>   };
>>   
>> +&cmn_pll_ref_clk {
>> +	clock-frequency = <48000000>;
>> +};
>> +
>>   &xo_board_clk {
>>   	clock-frequency = <24000000>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> index 14c7b3a78442..93f66bb83c5a 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
>> @@ -3,10 +3,11 @@
>>    * IPQ9574 SoC device tree source
>>    *
>>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>   
>>   #include <dt-bindings/clock/qcom,apss-ipq.h>
>> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
>>   #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>>   #include <dt-bindings/interconnect/qcom,ipq9574.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> @@ -19,6 +20,11 @@ / {
>>   	#size-cells = <2>;
>>   
>>   	clocks {
>> +		cmn_pll_ref_clk: cmn-pll-ref-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +		};
> 
> Which block provides this clock? If it is provided by the external XO
> then it should not be a part of the SoC dtsi.

The on-chip WiFi block supplies this reference clock. So keeping it in
the SoC DTSI is perhaps appropriate.

> 
>> +
>>   		sleep_clk: sleep-clk {
>>   			compatible = "fixed-clock";
>>   			#clock-cells = <0>;
>> @@ -243,6 +249,18 @@ mdio: mdio@90000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		cmn_pll: clock-controller@9b000 {
>> +			compatible = "qcom,ipq9574-cmn-pll";
>> +			reg = <0x0009b000 0x800>;
>> +			clocks = <&cmn_pll_ref_clk>,
>> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
>> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
>> +			clock-names = "ref", "ahb", "sys";
>> +			#clock-cells = <1>;
>> +			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
>> +			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
>> +		};
>> +
>>   		qfprom: efuse@a4000 {
>>   			compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
>>   			reg = <0x000a4000 0x5a1>;
>>
>> -- 
>> 2.34.1
>>
> 


