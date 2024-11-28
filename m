Return-Path: <linux-arm-msm+bounces-39400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A4F9DB4C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8455D167AA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9F9156F5F;
	Thu, 28 Nov 2024 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f71sVHf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D186156641;
	Thu, 28 Nov 2024 09:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732786155; cv=none; b=Vt4O6Y8J6FIyuSJliSmsjpIymqz6jmpdthcNr/IN5D6+B2bFwGVce4VCqT9cuMSzo0CEcYiUbeuP/Lrg2GEdVYXEfgXU9csrgOeD4C4EcZmeDb6qNxtWYjNCmtw4Mj/A2WmTyOjKG+YpH39ZKHpokLglZqSmer/B4UIMB5j+UrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732786155; c=relaxed/simple;
	bh=upCQtSlUOsTztfoi0CLP3BRX1O//n6uCqGj8Qk+cluE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qj5ND9TqHYMAoQfhg5g1keHWizuxKCru+FbnNgF4vuC1sNeANACF2Bu6FM8y2iiBgg9MUe72Z/T2O/3CCFtNI+olsekjDRB2Q+oCBD4pF1T8C1SASi2rZSbNqaSYQWS+Ll7SDU3cCijnVsFef2RIWRL1Y1kEf3C1Sa5YwkQTjOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f71sVHf2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8GKOs023673;
	Thu, 28 Nov 2024 09:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o0ElDpRGgCnPG7YnYQBB8MKL41lzlMS/R5QgQeumBWc=; b=f71sVHf2cd8rh4fD
	bRYSCrl4IOEnp/spMo4kVlZeKVRX5G5F7RwEv4L/GLIInMlp6ZnQtDEcNCLcvLeO
	8PgFiRKXLQu4HqNZfxHQahIRz1Vghi9gu0wP8h0K6dwf7nSiuOPzCXiGlbYO0Tqp
	yPreX+NKpH6NV/onJY29IzuvbFMuBCOaiXaqKUy4l2xC8KZH0vek1ia8tmWIMzfN
	46cex6eT5kjz3al3LaDon8UUdhhr8p9sOdhy8Dtyj4Y5RIfoigcm2VC510M4yrob
	bs6tPxZpV3XpMa5sU3SXTW0R9HCfDDFWjDgSd/TmG91I5FrwxSfQAjpJm8/eSxHt
	lSra6g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw21tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:29:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS9T9xq018478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:29:09 GMT
Received: from [10.231.207.28] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 01:29:02 -0800
Message-ID: <aa6899d0-81ab-44ce-a61e-495eb03beb6c@quicinc.com>
Date: Thu, 28 Nov 2024 17:29:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
 <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
 <hk3tkj3nka4kslq5nwvu4xj7yzydgdtz3fru2cazy67z3qortb@4c3uxktl36jo>
Content-Language: en-US
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
In-Reply-To: <hk3tkj3nka4kslq5nwvu4xj7yzydgdtz3fru2cazy67z3qortb@4c3uxktl36jo>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jhjoqYUDW7zOnMcnMIJqvq7CoqUIE4xN
X-Proofpoint-ORIG-GUID: jhjoqYUDW7zOnMcnMIJqvq7CoqUIE4xN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280075



On 11/26/2024 7:54 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 26, 2024 at 05:35:06PM +0800, Tingguo Cheng wrote:
>> Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
>> 300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
>> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
>>
>> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c39dbe791afb6a991db65acb37e597..9447efb9cd01654b74ec4c18dec58b1956ffe710 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -9,6 +9,7 @@
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   
>>   #include "qcs8300.dtsi"
>> +#include "sa8775p-pmics.dtsi"
>>   / {
>>   	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
>>   	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
>> @@ -223,6 +224,28 @@ &gcc {
>>   		 <0>;
>>   };
>>   
>> +&pmm8654au_0_pon_resin{
> 
> Missing space between the curve bracket (here and in all other entries).
Added a space here in next version:v2
> 
>> +	linux,code = <KEY_VOLUMEDOWN>;
>> +
>> +	status = "okay";
>> +};
>> +
>> +&pmm8654au_2{
>> +	status = "disabled";
>> +};
>> +
>> +&pmm8654au_2_thermal{
>> +	status = "disabled";
> 
> Does it work this way?
Yes, it works. functions are all working as expected. The result is the 
same as the way from writing the DTS nodes from scratch.
> 
>> +};
>> +
>> +&pmm8654au_3{
>> +	status = "disabled";
>> +};
>> +
>> +&pmm8654au_3_thermal{
>> +	status = "disabled";
>> +};
>> +
>>   &qupv3_id_0 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Thank you & BRs
Tingguo


