Return-Path: <linux-arm-msm+bounces-38298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348D9D230F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159C2281DD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC921C2334;
	Tue, 19 Nov 2024 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Qjh2tP42"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6A1C1F3A;
	Tue, 19 Nov 2024 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732010987; cv=none; b=h1Rmi1fTI8WrfovGQOu1GRP3/H4KqdgcfPp/HJpdptGDfxAYwrnJ9re4l9Q7a1rvgip/ziWpcYp+HZ0l75uznKiMiWOBP/3XIR903/7QmkjKR5lNunIBMVJRPYSU8Wz8gQajBX3JLQWMdiZT1djRzkjnVn0kIPUI8UhxY5Ua/7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732010987; c=relaxed/simple;
	bh=qCM/BD2d2XRDO+xHm4vYlmulmyGGTG6JrTkNggCYSjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=S4I7eW466qWURpUX1pPHyqggORsLY4ov5rnWufHLFT0aH1lyJV21+xiZQbv6moEd5S+r0t9VWJd2D0m25uHH88NtE6ie2ZLAEuQwKh3ULWUdXVKO6XvfoTHuiARFoIThAhu6SQvIdsM/aD1Cd1DHVeWSLoozxay4d92AXLJAT+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Qjh2tP42; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ82xHe027204;
	Tue, 19 Nov 2024 10:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9c34ss6wN9Ih/urztOFDrG4TB01mnTTGNmvdN4JQ800=; b=Qjh2tP42zbjK8Xi/
	gBEMYaGToScFLIL3pC4IS+zVHgNQRF3nABAl/+DGc9vrmkJmj185QMpy4uNTeMDG
	4BVMtnbAdcCtSpDibEqii7mMWsDcKponMDH+E1Y3sO6kMhCxV1W9dCVR2grfjWQM
	blmT7wZVU1P63B52zGWWpTnM6hWN6cyKOdLxCMjGA0wnuiwa1wHEzvq3/0gvQAio
	1xy/ThZeNJ9K5X+jlUMA2e1rqPXRA1+ESYXLRTj25+V5H2b05yIlTUNRpuSA2+cL
	gR8rvQ0bjle+BnTau0myvdleDTsbOeH1zHn9mECHWB9tSwqfo9gY4he4zQjEuSrC
	/6CJGg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7t7ab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:09:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJA9cvc005240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 10:09:38 GMT
Received: from [10.253.15.8] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 02:09:35 -0800
Message-ID: <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
Date: Tue, 19 Nov 2024 18:09:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
Content-Language: en-US
From: Yijie Yang <quic_yijiyang@quicinc.com>
In-Reply-To: <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UkIQBjkpsTakiHMRX2lZ8nhElW8FNiVO
X-Proofpoint-GUID: UkIQBjkpsTakiHMRX2lZ8nhElW8FNiVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=697 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190071



On 2024-11-19 09:27, Andrew Lunn wrote:
> On Mon, Nov 18, 2024 at 02:44:02PM +0800, Yijie Yang wrote:
>> Enable the ethernet node, add the phy node and pinctrl for ethernet.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 106 +++++++++++++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index ee6cab3924a6d71f29934a8debba3a832882abdd..299be3aa17a0633d808f4b5d32aed946f07d5dfd 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -5,6 +5,7 @@
>>   /dts-v1/;
>>   
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>   #include "qcs615.dtsi"
>>   / {
>>   	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>> @@ -196,6 +197,60 @@ vreg_l17a: ldo17 {
>>   	};
>>   };
>>   
>> +&ethernet {
>> +	status = "okay";
>> +
>> +	pinctrl-0 = <&ethernet_defaults>;
>> +	pinctrl-names = "default";
>> +
>> +	phy-handle = <&rgmii_phy>;
>> +	phy-mode = "rgmii";
> 
> That is unusual. Does the board have extra long clock lines?

Do you mean to imply that using RGMII mode is unusual? While the EMAC 
controller supports various modes, due to hardware design limitations, 
only RGMII mode can be effectively implemented.

> 
>> +	max-speed = <1000>;
> 
> Why do you have this property? It is normally used to slow the MAC
> down because of issues at higher speeds.

According to the databoot, the EMAC in RGMII mode can support speeds of 
up to 1Gbps.

> 
> 	Andrew

-- 
Best Regards,
Yijie


