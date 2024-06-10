Return-Path: <linux-arm-msm+bounces-22174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5492901E2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7F011C20E78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597CA74079;
	Mon, 10 Jun 2024 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N4KT+G5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FC335A7;
	Mon, 10 Jun 2024 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011741; cv=none; b=nBmY92hU720pmEty/Uv0bbrdObwOEwWUS7uWc+rHCRnClmor1zF/iOTjC8vtVGz9MUpvEsfqfyDk83pyhockmOw6pQ1TNIDxfReTMKiLNj4WcTHthTMXcxyTPLIphNQGCJtzGiW5gp3hFB/JqoeczNa1TiXZv1NsvI34iZ8ANFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011741; c=relaxed/simple;
	bh=/WH+ExYe/9bMBwnadBA1MJUD9kMCbMTSgIC2MuwuliY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OYouO3hYLr/A31hSkzJovaovr0/mk9uqq8SwuFQ/ONnBgAgj8c6wcfszRT0gtJzmYdqlry01GNlygGJc+n5vkIW6b71tlCOfndNfESkWylEfBGKUBTq6MDlLtYvJXUApMg84UUfuXMSBcWlP+yUPSGxOVKQApwm4ig99aA+F32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N4KT+G5l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1jYSb008263;
	Mon, 10 Jun 2024 09:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iy7Jv0+jFBJtZNmM1uaxm2TqZZOmCB9aF0GGU+TYbeY=; b=N4KT+G5lUkRA9osZ
	Iz5f19h4jrCLt5PIgB4RRaaUIgYhcbNkkKGZoQV0ljHKMBl1SSUcMFoTy8BPmv3o
	fBM6nlp4LXiIxZdY8nsjcppmxz+HgR+UwbqqoF8Kksf6s9pNAS9KZKKqz4+sPHCL
	2gEaFVZljgXmun8GNMgJxmaZ+tMALXoM9oilCHXdOhVHsmi7/y7BihOmgqmafNcv
	wddFd1fyRZiqcjiedo+LKft0P7i9bjS9dCov3e4RX3RkdyzZpnq4wvwdKvWhCWla
	AoOKLveAoFJKYZSnbNl/KkYfXdqY+hAWQ4+su7htPZ7QN3MRSnxoLBdHUwX8fQkJ
	5ER7xA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymd0ebh8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:28:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A9StU8027059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 09:28:55 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 02:28:51 -0700
Message-ID: <c8886c9e-7a75-4e57-b802-309e1beb56e8@quicinc.com>
Date: Mon, 10 Jun 2024 14:58:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] arm64: dts: qcom: Add support for multimedia clock
 controllers
To: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-14-quic_tdas@quicinc.com>
 <zheryfbthco5ngjam7dtchjp5rez2mdmvdbdclvrc3h4laxlaq@eudxnu7lkott>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <zheryfbthco5ngjam7dtchjp5rez2mdmvdbdclvrc3h4laxlaq@eudxnu7lkott>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SJSR9W5C8mQGUnuxytZpZZALPQLWJrf7
X-Proofpoint-ORIG-GUID: SJSR9W5C8mQGUnuxytZpZZALPQLWJrf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100072



On 6/2/2024 9:47 AM, Bjorn Andersson wrote:
> On Fri, May 31, 2024 at 02:32:49PM GMT, Taniya Das wrote:
>> Add support for camera, display0, display1 and video clock
>> controllers on SA8775P platform. While at it, update the
>> sleep_clk frequency.
> 
> Whenever you feel like starting a sentence with "While at it", it's
> probably a separate commit - and indeed so in this case. This will also
> give you the opportunity to claim why you're changing its value...

I will split the changes to take care in next series.
> 
> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dts |  2 +-
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 59 +++++++++++++++++++++++
>>   2 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>> index 26ad05bd3b3f..4684da376565 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
>> @@ -542,7 +542,7 @@
>>   };
>>   
>>   &sleep_clk {
>> -	clock-frequency = <32764>;
>> +	clock-frequency = <32000>;
>>   };
>>   
>>   &spi16 {
>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> index eae0de9720b5..7f62738671da 100644
>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>> @@ -6,8 +6,11 @@
>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>   #include <dt-bindings/clock/qcom,rpmh.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> +#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
>>   #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -2904,6 +2907,47 @@
>>   			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>>   
>> +		videocc: clock-controller@abf0000 {
>> +			compatible = "qcom,sa8775p-videocc";
>> +			reg = <0x0 0x0abf0000 0x0 0x10000>;
>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,sa8775p-camcc";
>> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>> +		dispcc0: clock-controller@af00000 {
>> +			compatible = "qcom,sa8775p-dispcc0";
>> +			reg = <0x0 0x0af00000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>   		pdc: interrupt-controller@b220000 {
>>   			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
>>   			reg = <0x0 0x0b220000 0x0 0x30000>,
>> @@ -3424,6 +3468,21 @@
>>   			#freq-domain-cells = <1>;
>>   		};
>>   
>> +		dispcc1: clock-controller@22100000 {
>> +			compatible = "qcom,sa8775p-dispcc1";
>> +			reg = <0x0 0x22100000 0x0 0x20000>;
>> +			clocks = <&gcc GCC_DISP_AHB_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&rpmhcc RPMH_CXO_CLK_A>,
>> +				 <&sleep_clk>,
>> +				 <0>, <0>, <0>, <0>,
>> +				 <0>, <0>, <0>, <0>;
>> +			power-domains = <&rpmhpd SA8775P_MMCX>;
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +		};
>> +
>>   		ethernet1: ethernet@23000000 {
>>   			compatible = "qcom,sa8775p-ethqos";
>>   			reg = <0x0 0x23000000 0x0 0x10000>,
>> -- 
>> 2.17.1
>>

-- 
Thanks & Regards,
Taniya Das.

