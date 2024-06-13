Return-Path: <linux-arm-msm+bounces-22580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B3906BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 13:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A671C20FD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 11:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5114D143883;
	Thu, 13 Jun 2024 11:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y/mJtWng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1F2143739;
	Thu, 13 Jun 2024 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278995; cv=none; b=XsruuVINglLnZAq9WUkkrfN8l6nRQMFaiVN9fOBcPiKxyWOQFZaaueVZoEF4nWPIE5DjXbZiebiq9A/BSN0cXWiX3skRd4/BnDjftJ6gTogms75c70+RWmgeXfTX1Xf/0WT7jc25VC+C7IaVdgudDqHC2MENS2riJhNQ0Gthua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278995; c=relaxed/simple;
	bh=Sl6Q994P6KdybGgbkrd7+FkQLji0wO4s5jeRzGjmcaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rlCKv02Havss+kr/nPXpUlNtw1oEcNwy8yvAkHzDXsSTgscg+UwW6XOMuyRtrlpGWlwnZ1dEuxIAkgn0t/6YMKJcWuTe06s/Hmd5BqfKcpDIQqudy8BhdKOpHO7MiNPCd76Uziwsct2C+7+/asLFq6nltHlMohMgL7MsD7OnF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y/mJtWng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D6WXn8001036;
	Thu, 13 Jun 2024 11:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNHN8uPWdd2diztoGqQ+ipEKFFhFDhhlcgB10an2TG0=; b=Y/mJtWngPxaCHiA6
	LWUMSO9PSU0Uw8ETAp7qZXrceubKQXnHF/5FWIRPiArLJfPmiTKPQZyvh/CHry3H
	1nFE8JPPm8dRjWM/nMITB9FYo66ecbRrfyY3nPTJaYAlqjqrar8JqHsWRBMFusoq
	qirevnUglzSNvbf9eqgnWZvlOKxzdK2BoMaaEASutHeXtOORfCGK78DQX249hBXm
	KmXiMVheRvApNuugRkWLRcL4ToL6TihoCUmmD32K+WrnU0gsOHiRlvJnSkL+xLNh
	/po8GnjMeM9WEzVH37QbHg6jJqTShp0YeZakfZwCr2QH9fFivfcsfW0RNUo43RxC
	U8B7jQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqukc8sjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 11:43:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45DBh6hS000714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 11:43:06 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Jun
 2024 04:43:03 -0700
Message-ID: <ae289c19-2701-d00f-3f6f-5e87ec37e475@quicinc.com>
Date: Thu, 13 Jun 2024 17:13:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage
 setting
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240524082236.24112-1-quic_kbajaj@quicinc.com>
 <CAA8EJpp9U-ucMAiNmVvWDuupd=OR_fLK9fQ+n21SVmktWMxhmA@mail.gmail.com>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <CAA8EJpp9U-ucMAiNmVvWDuupd=OR_fLK9fQ+n21SVmktWMxhmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SKpvDaWuGHoBarKphQBoBZjq_r8LLgC6
X-Proofpoint-ORIG-GUID: SKpvDaWuGHoBarKphQBoBZjq_r8LLgC6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_03,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=498 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130084



On 5/24/2024 2:59 PM, Dmitry Baryshkov wrote:
> On Fri, 24 May 2024 at 11:23, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>>
>> While adding the USB support, it was found that the configuration
>> for regulator smps5 was incorrectly set. Upon cross verifying for
>> all the regulators, found that smps4, smps6 and smps8 are also
>> incorrectly configured. This patch fixes the same.
> 
> Nit: see Documentation/process/submitting-patches.rst, "This patch..."

Will update the commit message.

> 
>> In particular -
>> - smps4 is 1.574V min and 2.04V max
>> - smps5 is 1.2V min and 1.4V max
>> - smps6 is 0.382V min and 1.12V max
> 
> Just for my understanding, will anything further constraint these values?

As far as i know, this is going to be final.
currently, usb device is not working without this min/max change.

Thanks
Komal

> 
>> - smps8 is fixed at 0.752V
>>
>> Fixes: d1f2cfe2f669 ("arm64: dts: qcom: Add base QDU1000/QRU1000 IDP DTs")
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>> Changes in v2-
>> * Updated the commit message as suggested by Krzysztof
>> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240514131038.28036-1-quic_kbajaj@quicinc.com/
>> ---
>>
>>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 16 ++++++++--------
>>   arch/arm64/boot/dts/qcom/qru1000-idp.dts | 16 ++++++++--------
>>   2 files changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> index 6e129dc123ed..89b84fb0f70a 100644
>> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
>> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
>>
>>                  vreg_s4a_1p8: smps4 {
>>                          regulator-name = "vreg_s4a_1p8";
>> -                       regulator-min-microvolt = <1800000>;
>> -                       regulator-max-microvolt = <1800000>;
>> +                       regulator-min-microvolt = <1574000>;
>> +                       regulator-max-microvolt = <2040000>;
>>                  };
>>
>>                  vreg_s5a_2p0: smps5 {
>>                          regulator-name = "vreg_s5a_2p0";
>> -                       regulator-min-microvolt = <1904000>;
>> -                       regulator-max-microvolt = <2000000>;
>> +                       regulator-min-microvolt = <1200000>;
>> +                       regulator-max-microvolt = <1400000>;
>>                  };
>>
>>                  vreg_s6a_0p9: smps6 {
>>                          regulator-name = "vreg_s6a_0p9";
>> -                       regulator-min-microvolt = <920000>;
>> -                       regulator-max-microvolt = <1128000>;
>> +                       regulator-min-microvolt = <382000>;
>> +                       regulator-max-microvolt = <1120000>;
>>                  };
>>
>>                  vreg_s7a_1p2: smps7 {
>> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
>>
>>                  vreg_s8a_1p3: smps8 {
>>                          regulator-name = "vreg_s8a_1p3";
>> -                       regulator-min-microvolt = <1352000>;
>> -                       regulator-max-microvolt = <1352000>;
>> +                       regulator-min-microvolt = <752000>;
>> +                       regulator-max-microvolt = <752000>;
>>                  };
>>
>>                  vreg_l1a_0p91: ldo1 {
>> diff --git a/arch/arm64/boot/dts/qcom/qru1000-idp.dts b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> index 2a862c83309e..258483af065b 100644
>> --- a/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/qru1000-idp.dts
>> @@ -96,20 +96,20 @@ vreg_s3a_1p05: smps3 {
>>
>>                  vreg_s4a_1p8: smps4 {
>>                          regulator-name = "vreg_s4a_1p8";
>> -                       regulator-min-microvolt = <1800000>;
>> -                       regulator-max-microvolt = <1800000>;
>> +                       regulator-min-microvolt = <1574000>;
>> +                       regulator-max-microvolt = <2040000>;
>>                  };
>>
>>                  vreg_s5a_2p0: smps5 {
>>                          regulator-name = "vreg_s5a_2p0";
>> -                       regulator-min-microvolt = <1904000>;
>> -                       regulator-max-microvolt = <2000000>;
>> +                       regulator-min-microvolt = <1200000>;
>> +                       regulator-max-microvolt = <1400000>;
>>                  };
>>
>>                  vreg_s6a_0p9: smps6 {
>>                          regulator-name = "vreg_s6a_0p9";
>> -                       regulator-min-microvolt = <920000>;
>> -                       regulator-max-microvolt = <1128000>;
>> +                       regulator-min-microvolt = <382000>;
>> +                       regulator-max-microvolt = <1120000>;
>>                  };
>>
>>                  vreg_s7a_1p2: smps7 {
>> @@ -120,8 +120,8 @@ vreg_s7a_1p2: smps7 {
>>
>>                  vreg_s8a_1p3: smps8 {
>>                          regulator-name = "vreg_s8a_1p3";
>> -                       regulator-min-microvolt = <1352000>;
>> -                       regulator-max-microvolt = <1352000>;
>> +                       regulator-min-microvolt = <752000>;
>> +                       regulator-max-microvolt = <752000>;
>>                  };
>>
>>                  vreg_l1a_0p91: ldo1 {
>> --
>> 2.42.0
>>
>>
> 
> 

