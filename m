Return-Path: <linux-arm-msm+bounces-21038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEB8D4250
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 02:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA23B1C21493
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95EB23A9;
	Thu, 30 May 2024 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HsvZMt/e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF94DDA0;
	Thu, 30 May 2024 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717028608; cv=none; b=O/zh4SFFTojc8/wUc6vuZ3UvUe2851YtuKTqjawGiIia2ViqzVyvlstqvTeRIKQeCxpgYJ68NpP2oj2D5CSSfiOYAgMcLaS3TY9384TkvlGDq+mBHtwNqTC5G1GG9bXB/Ele2ASoQSpHCRk+r9xha94Lywh8zDMBz/76ekrYHQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717028608; c=relaxed/simple;
	bh=QZpWvBQm5wa1ZfmIbuhChOcTaeWGKOXgUukqfa9ROgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OASLG2jtcElILIQhPX04ep32BzYmwGOFXUEFDeeAma5wDBYVTiDyE801hxJ58FajKcBYK3LWftzC3b1pcUpALbiYG5UwAF+vVkFBCH+3v7vWERuyUeHFUbMRSCpILMOyO6+Un8/iJATJvzltvfyGfEMVJC7H71O3L7vxUONPDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HsvZMt/e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TJElIn023423;
	Thu, 30 May 2024 00:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnCcEVcIOLG+Va5Q/fAdIlKwhUCGBARo+6jRoxzbDbw=; b=HsvZMt/eQMLXHu2U
	7ZFLrBT1WxlzrIQI2C5jOKmwXjAqu4wpd8NJQgwwjGxAcCUh61m9LlMvCYkTnMcp
	OVe3SvtHDU57MFb5rKP9WR9j5jpOzOo8T3n5StJybsJI0SjLhtTR5yzcgWa1MbhA
	uzOTiGHP9ezIzkvV4CbTCqTF36mR0PHapnS42sfbEZIRGhSM4MzwTxbv89GXTcPM
	fcww1uj/7bTkFc7MWdPzu35MQDVIKiYNNW0EeWwu+WGnBOKgZhJipsqebKgP56Vv
	TExx5gApDUK2qot4X+ngslbNW49C+o+cqr1z03q2+DhxeH1gC3thihOJdyr7hlCY
	tYwTYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjaqxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:23:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U0NLRN010008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 00:23:21 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 17:23:16 -0700
Message-ID: <2701e669-3dc3-43c5-93e3-c64dbb2344a9@quicinc.com>
Date: Thu, 30 May 2024 08:23:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8550: Remove usb default
 dr_mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20240529100256.3158447-1-quic_tengfan@quicinc.com>
 <20240529100256.3158447-3-quic_tengfan@quicinc.com>
 <ugrhu62zhh5u6bdhnik3sphwvnwrttyin3kd2ae7i7g5mahcsj@hiimi2uorauh>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <ugrhu62zhh5u6bdhnik3sphwvnwrttyin3kd2ae7i7g5mahcsj@hiimi2uorauh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4P3HXBKjVYB0jOxYF-eFGw1rE_sLynp9
X-Proofpoint-ORIG-GUID: 4P3HXBKjVYB0jOxYF-eFGw1rE_sLynp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=502 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300000



On 5/29/2024 8:49 PM, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 06:02:56PM +0800, Tengfei Fan wrote:
>> Otg is default usb dr_mode, so this property can be removed.
> 
> OTG, not Otg.

I will update Otg to OTG.

> 
> With that fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 4 ----
>>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 4 ----
>>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 4 ----
>>   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 4 ----
>>   4 files changed, 16 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> index 411de3451db8..e0dc03a97771 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
>> @@ -1253,10 +1253,6 @@ &usb_1 {
>>   	status = "okay";
>>   };
>>   
>> -&usb_1_dwc3 {
>> -	dr_mode = "otg";
>> -};
>> -
>>   &usb_1_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> index 84d16227ef80..26dfca0c3e05 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
>> @@ -946,10 +946,6 @@ &usb_1 {
>>   	status = "okay";
>>   };
>>   
>> -&usb_1_dwc3 {
>> -	dr_mode = "otg";
>> -};
>> -
>>   &usb_1_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> index e20c6240f76d..d27820fb5fc0 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
>> @@ -1115,10 +1115,6 @@ &usb_1 {
>>   	status = "okay";
>>   };
>>   
>> -&usb_1_dwc3 {
>> -	dr_mode = "otg";
>> -};
>> -
>>   &usb_1_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> index 6dd5232da9f9..85d487ef80a0 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
>> @@ -737,10 +737,6 @@ &usb_1 {
>>   	status = "okay";
>>   };
>>   
>> -&usb_1_dwc3 {
>> -	dr_mode = "otg";
>> -};
>> -
>>   &usb_1_dwc3_hs {
>>   	remote-endpoint = <&pmic_glink_hs_in>;
>>   };
>> -- 
>> 2.25.1
>>
> 

-- 
Thx and BRs,
Tengfei Fan

