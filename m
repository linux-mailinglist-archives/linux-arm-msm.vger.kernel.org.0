Return-Path: <linux-arm-msm+bounces-22282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE8903808
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 11:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F0C280C0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 09:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CF217624A;
	Tue, 11 Jun 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QFz/CVcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92180174EE1;
	Tue, 11 Jun 2024 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098889; cv=none; b=YP3/ZRbsl+ngp6Nd3r4dfgb55Dyz28PYAkx61AH2FFHO5TIowkBno1KbXadYnNvdUeWF4GEnoS7J3hnf3H85sgz71WtRGquyhcplJWTNdchYXctQiWOgmky2ES4Y/dWS1SHGp7fFRaEG2EHWiv0g9y40DfexhbJdYzZ5dWd8dSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098889; c=relaxed/simple;
	bh=dQOULWqezeuww7ejUoLFCnXbf5SwY0YY1vbl1I/nVJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iyYN7BfP65ACbQX8vHqBl3nyPgvuHrfwE+ZEVup6YCDE45v/g3CBFaPCG0ISPEAFkZdk3El4fdzLH4EWJIt2KcpQ5RtBigQe6p7wqD/A5IRuujkvQWuVv7hYTdqj+mzq7GF8MK7BcF8k2C1sCeYk69B/iqbdjL72AIRge4wJxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QFz/CVcp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2CSKP003044;
	Tue, 11 Jun 2024 09:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Rmyjmkwoc5tiGZhzDVQgcWabQ/ZklcnHsQ39AywqZk=; b=QFz/CVcpXH8M3WRk
	tuLpJdcJ8ECJPa7mcvleOvPFHvcO+yg85k6klWyyLBLAtEHs+guh/blXVsUrif+m
	ztZU9Y1RNqGjvKvQiluCBooSicQnt/UNF7M4oSAgSiJFt3CtBfQt2Kog/6HskRj9
	lRG0zbzfLkhxfIabqfX2Pb0S5MgXIEcf1Qvg7wI/m0Srlp1qUnvAh1leWkwfxtmM
	eyAn5/hIrmnMDuSLe4vtaRyzBBy35KaB5r0tCP/tNCtcdTJ7WtQDccZl4W3NyW+9
	kVRipiXPH8n/fG+pxbiMwte3EqSYmFZBa/4c/90cLEnJqLdpKhQJcc5qzDc4je2h
	Gqzwlw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfcv603w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:41:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B9fJb0017772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:41:19 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 02:41:17 -0700
Message-ID: <cf6f8b58-858a-1000-2f23-9e91c16e1c9a@quicinc.com>
Date: Tue, 11 Jun 2024 15:11:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: qdu1000: Add secure qfprom node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240607113445.2909-1-quic_kbajaj@quicinc.com>
 <mjkxgytrdzm7gz6jjjbe3tjemussrcqyvz52n4o4cwhdr6y557@h4im5qv4itpc>
Content-Language: en-US
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <mjkxgytrdzm7gz6jjjbe3tjemussrcqyvz52n4o4cwhdr6y557@h4im5qv4itpc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PlJ77QrDwh8t7hweF0lVF1SJSSdyHebz
X-Proofpoint-GUID: PlJ77QrDwh8t7hweF0lVF1SJSSdyHebz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_05,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxlogscore=748 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110073



On 6/7/2024 5:22 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 07, 2024 at 05:04:45PM +0530, Komal Bajaj wrote:
>> Add secure qfprom node and also add properties for multi channel
>> DDR. This will be required for LLCC driver to pick the correct
>> LLCC configuration.
> 
> 
> 'will be' or 'is' ?

Sure, will update like that.

Thanks
Komal

> 
>>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> index 7a77f7a55498..d8df1bab63d5 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
>> @@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
>>   			reg-names = "llcc0_base",
>>   				    "llcc_broadcast_base";
>>   			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			nvmem-cell-names = "multi-chan-ddr";
>> +			nvmem-cells = <&multi_chan_ddr>;
>> +		};
>> +
>> +		sec_qfprom: efuse@221c8000 {
>> +			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
>> +			reg = <0 0x221c8000 0 0x1000>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			multi_chan_ddr: multi-chan-ddr@12b {
>> +				reg = <0x12b 0x1>;
>> +				bits = <0 2>;
>> +			};
>>   		};
>>   	};
>>
>> --
>> 2.42.0
>>
> 

