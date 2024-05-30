Return-Path: <linux-arm-msm+bounces-21037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A352D8D4249
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FB9285E3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884E92579;
	Thu, 30 May 2024 00:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QsWAEZ1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686BE56C;
	Thu, 30 May 2024 00:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028444; cv=none; b=TvyNkpa+W2ELrpEWGk71TTDfpBm9G0FaJ1uJbsoaR9wnB28kEO84y2+ST6N5ITR18K3hpFRLtat+85MZFaqg6cpWC0R7bGL6yBPdgoHprg+qX1ETsadQ+neEEpUVNO3cEhvA3ZwCDacJL/vUpqoIWOGEIuZbhJga3SapWS1verg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028444; c=relaxed/simple;
	bh=aWEnvu8sJL8uDFRFJIWrECI5b1uUf7IRnJRCxH7hT7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bz+e/hbm7gf/bqKRwLU4DNfu0PjyZD/h9bw1L8mFW3GdKdDoVrgrd49maKdrUF3Wy9C+MGG3r+rvXTDlJJABsJQu9eaJZNPxJvUJ8oz1aIBo2i0W9MBl5XIcsd/EQZlmNMEDH8eEQ3Eidb3/PKXc3B3Dti3XNVS81hM2CrahI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QsWAEZ1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44THt71J006624;
	Thu, 30 May 2024 00:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i6Bhr1ye9mTgoR0sRcNIZMsLpnxADZSDNNH60SjYE/0=; b=QsWAEZ1XZvsxmv8D
	aMMw7WkLiCDmbIDnYFHQ5zKq5s0MF6T35x9d9M5ZiMmCe2jJZaeQ7BNBiRl5YN4J
	8w68QvKhwhH1wK8uU2HSEV1hApzum0H+bPFY3yGX9CzrtN+/7rpzqk5QamdlQJD8
	FwUbYXAvX7yjCHMzQywaLPz1ELfjTosk6Vxb8nnStiRIuxhU0t/z6SUzzh1p2zZB
	mfzYfjXc+oAFkjWpAonx4L1XZrwaiBSiCNsI2JR3eSdI/VTY7J5HIRhAhnCYM1Zt
	rEldUu5KJVB2xIyyqW0KAhguzjoIuri2AqOpuprpc0Ew4NeSg9Msmc+HN2WKYqkr
	FvbcOw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ye96bgvet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:20:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U0KaO4021288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:20:36 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 17:20:31 -0700
Message-ID: <e07d10d2-b73e-45ff-a2b2-ebe85306ddf9@quicinc.com>
Date: Thu, 30 May 2024 08:20:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8550: Move usb-role-switch to
 SoC dtsi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
 <20240529100256.3158447-2-quic_tengfan@quicinc.com>
 <ljwkn7ilsixrww4vt7cmnmtot6qgihqglasoaftuil6i37qsxi@ia4bpqhkulwo>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <ljwkn7ilsixrww4vt7cmnmtot6qgihqglasoaftuil6i37qsxi@ia4bpqhkulwo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0j-haoehV0dzyMFINNe3gCvd1i025S0X
X-Proofpoint-ORIG-GUID: 0j-haoehV0dzyMFINNe3gCvd1i025S0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=582 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300001



On 5/29/2024 8:47 PM, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 06:02:55PM +0800, Tengfei Fan wrote:
>> The usb-role-switch is SA8775p SoC property, so move it from board dts
>> to SA8775p SoC dtsi.
> 
> The commit message doesn't match patch contents. Other than that LGTM

I will update this commit message. I work on the sa8775p platform 
lately, so I wrote this commit message incorrectly.

> 
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 -
>>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 -
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 1 -
>>   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 -
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
>>   5 files changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> index 31f52df6b67e..411de3451db8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> @@ -1255,7 +1255,6 @@ &usb_1 {
>>   
>>   &usb_1_dwc3 {
>>   	dr_mode = "otg";
>> -	usb-role-switch;
>>   };
>>   
>>   &usb_1_dwc3_hs {
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> index 42d4d558b7aa..84d16227ef80 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> @@ -948,7 +948,6 @@ &usb_1 {
>>   
>>   &usb_1_dwc3 {
>>   	dr_mode = "otg";
>> -	usb-role-switch;
>>   };
>>   
>>   &usb_1_dwc3_hs {
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index 2ed1715000c9..e20c6240f76d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -1117,7 +1117,6 @@ &usb_1 {
>>   
>>   &usb_1_dwc3 {
>>   	dr_mode = "otg";
>> -	usb-role-switch;
>>   };
>>   
>>   &usb_1_dwc3_hs {
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> index 92a88fb05609..6dd5232da9f9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> @@ -739,7 +739,6 @@ &usb_1 {
>>   
>>   &usb_1_dwc3 {
>>   	dr_mode = "otg";
>> -	usb-role-switch;
>>   };
>>   
>>   &usb_1_dwc3_hs {
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index 79311a6bd1ad..8e3ce1152211 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3264,6 +3264,7 @@ usb_1_dwc3: usb@a600000 {
>>   				snps,has-lpm-erratum;
>>   				tx-fifo-resize;
>>   				dma-coherent;
>> +				usb-role-switch;
>>   
>>   				ports {
>>   					#address-cells = <1>;
>> -- 
>> 2.25.1
>>
> 

-- 
Thx and BRs,
Tengfei Fan

