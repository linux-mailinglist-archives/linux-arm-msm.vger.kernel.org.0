Return-Path: <linux-arm-msm+bounces-41877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A3C9F0268
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 02:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A216A285580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 01:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A0286A1;
	Fri, 13 Dec 2024 01:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PTRrlbN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0617C60;
	Fri, 13 Dec 2024 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734054185; cv=none; b=dy9jPtyLs51HPIcW1IhXxXAEV3FMTgCAtJs8Nc6bzUbOSH4fQhpDf5RUXOdyilBEL7voa2XR5XqdnTcxhC3e7eqNwZIaF7VMx4Xub7jHF88RxTvEsYXN3bp21XViL0DQqjdmkwZPMHstWHLqdVH64YSFJfSrUMoJjdqQ4nv+uh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734054185; c=relaxed/simple;
	bh=1oiUqvrncY2Yr11Fob0HEMwESXO57uFrf9aYMBqQpNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kJbsc0YY16tJVxN15ivqE81RXhFr2sh1PML7qRJfvb+8OWXlJdz4FclZ3SWINAiFLx23fH58QDU8+KrSA+A5eFPZuOzw6gDo+0uBbKBLrQqzaZeV6GcEFTJyDI4XkAgvJii8wML34B1YvFrICeSWnk+WOXhymi1kUKEGhLb3u9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PTRrlbN4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCH6Sqv002093;
	Fri, 13 Dec 2024 01:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iP0Gu0h9qxvwSP97c21KOwd0MwILv2ly/FR0/lF7tEI=; b=PTRrlbN4ExDu/y6O
	psuCcTzCF+vRVd4xYAveUxOVi607Wy2oWlmnI2o+Vgco4h0dDO8QvJ542OoHkVjE
	nBvnaMMrceUXxZ8h/KjW/lbSZKnYhRNyaNYyUr36MpmzHrLMszcTfc5nvtaUTQpk
	xIs3XZCvedirCebi7GXnpVr/QYnpsM+IBo8oR7N9WR8oAw1Cb37io8zl+FHMpDK5
	AHTisR/MAdGnoxm8cHExGuyydXtLrKm63VQLaqCFnsYlPTlZXmrLjOQIRsMnkN8r
	TYCE5Ky9S2TxE3KkMl85TTg9aic/o6Lrjnj9Gu4tM73hRhFCpHW225iIZ7j7qB1R
	vpESoA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9y5me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 01:42:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BD1gwBa010080
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 01:42:58 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 17:42:55 -0800
Message-ID: <409678b0-339e-4d93-86f1-117d358a2d33@quicinc.com>
Date: Fri, 13 Dec 2024 09:42:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: Add coresight nodes for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Aiqun Yu (Maria)"
	<quic_aiquny@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241205084418.671631-1-quic_jiegan@quicinc.com>
 <16efb6a8-ecaf-4097-ac5f-368ebab177a8@quicinc.com>
 <25a410a7-2418-45bd-be06-3672a9fb1928@quicinc.com>
 <04d23c55-9167-4e8a-9e5b-6dcf66b02b8f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <04d23c55-9167-4e8a-9e5b-6dcf66b02b8f@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: til3tEG194fQ4v9Ifs8D-Y5HdreVy-So
X-Proofpoint-GUID: til3tEG194fQ4v9Ifs8D-Y5HdreVy-So
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=934
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130012



On 12/13/2024 8:35 AM, Konrad Dybcio wrote:
> On 9.12.2024 3:01 AM, Jie Gan wrote:
>>
>>
>> On 12/8/2024 12:28 AM, Aiqun Yu (Maria) wrote:
>>>
>>>
>>> On 12/5/2024 4:44 PM, Jie Gan wrote:
>>>> Add following coresight components for QCS8300 platform.
>>>> It includes CTI, dummy sink, dynamic Funnel, Replicator, STM,
>>>> TPDM, TPDA and TMC ETF.
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>> Changes in V2:
>>>> 1. Rebased on tag next-20241204.
>>>> 2. Padding the register address to 8 bits.
>>>> Link to V1 - https://lore.kernel.org/linux-arm-msm/20240929-add_coresight_devices_for_qcs8300-v1-1-4f14e8cb8955@quicinc.com/
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2150 +++++++++++++++++++++++++
>>>>    1 file changed, 2150 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> index 73abf2ef9c9f..eaec674950d8 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> @@ -293,6 +293,18 @@ system_sleep: domain-sleep {
>>>>            };
>>>>        };
>>>>    +    dummy_eud: dummy-sink {
>>>> +        compatible = "arm,coresight-dummy-sink";
>>>> +
>>>> +        in-ports {
>>>> +            port {
>>>> +                eud_in: endpoint {
>>>> +                    remote-endpoint = <&swao_rep_out1>;
>>>> +                };
>>>> +            };
>>>> +        };
>>>> +    };
>>>> +
>>
>> [...]
>>
>>>> +
>>>> +        tpdm@482c000 {
>>>> +            compatible = "qcom,coresight-tpdm", "arm,primecell";
>>>> +            reg = <0x0 0x0482c000 0x0 0x1000>;
>>>> +
>>>> +            clocks = <&aoss_qmp>;
>>>> +            clock-names = "apb_pclk";
>>>> +
>>>> +            qcom,dsb-element-bits = <32>;
>>>> +            qcom,dsb-msrs-num = <32>;
>>>> +            status = "disabled";
>>>
>>> Could you please provide more detailed information on why some TPDM
>>> nodes are disabled by default while others are not?
>> Some of TPDM nodes are disabled by default because the one of the following reasons:
>> 1. TPDM device are designed to generate HW events, it needs a clock source to read&write its registers. Coresight driver cannot control the clock source ouside AP core, so those TPDM devices without enabled clock source will crash device in probe.
>> 2. Some of TPDM devices can't bootup with fused devices.
>> 3. Some of TPDM devices have known hardware issues that not resolved.
>>
>> I put those disabled TPDM devices in DT in case some of them may be "fixed" in future.
> 
> Please mark them as
> 
> /* Hardware issues */
> status = "fail";
> 

Maybe I should remove these devices, to avoid confusion. Is that ok?

> Konrad

Thanks,
Jie



