Return-Path: <linux-arm-msm+bounces-29264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56F95B30E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43A0B1C22F3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 10:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2796183CAB;
	Thu, 22 Aug 2024 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JfS5wt5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A514A0B8;
	Thu, 22 Aug 2024 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724323145; cv=none; b=T4PgDdno+uad9enXEosMRYMZzChTNXCcDjtqrGU+YJQ4U+SteGLjJhx8QylkF0VQzoXMMKeUqY7hQn6ClOLclqVL+n5hldgzePULy5QHcm0M5SmbzkpXC+G1Lletwf7DST/wZG0UjYqHuZx62Iu2y2OZyBRD/VJNasNHCO6jyD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724323145; c=relaxed/simple;
	bh=73U3oxAgVvHOaMzR1QpVTyqEX8IRtnR3bzMy3tyiFOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HikgG/UlQUhdy8c6L00dn6osKkqTCp//H1mTgq1CPFgPxH3bNIMWakWnYfcxefbaQIUjVFRqE7MPStqMHJDrKBFabM5a3eESPTJ+cDKzIEWtrI5WXzB7OIc4Snyoh+o1a01OgG4E++k7DzQMLljtqZROhSWd12ebO6xn+NXdDB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JfS5wt5d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MA3RXO031491;
	Thu, 22 Aug 2024 10:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A1xhamwPcK8kSkzkJ4K90mqhrkcwsBHMWhpVZtpwV98=; b=JfS5wt5dcnfQvMcl
	oVEdUWOooKtEGPYYmrgJgHCSgDRcPIN0B53Ld+VQDX20+/8CNtMrXMRrA0FJ7x0l
	egHZQwOruVA7U/FRhP/vayayqGq5t1PJ7uL3KNNeoUjjEOsiAJeeBguBYdiZPB2v
	U6jg0/T/iNYWVe7DsCHvU3f0qKPoh44vLsyP/DykHhrEcYfpfHZVMtotwWPaqFaw
	0MU8Rw8VGHi7ud8QKyjjZH8UojYWr/JQwlCddbyeZFpsMiXlLq1PCB//e3pGYydK
	BfeNjM416v9HfRxXyTLzFMe5C9pErB11Gie+qCWZGGb1rujTXJ172xwmQd0RzDM4
	J+EjCw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415ck9c1mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:39:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MAd0wC031825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 10:39:00 GMT
Received: from [10.152.201.37] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 03:38:56 -0700
Message-ID: <0af53810-4148-4330-9d7c-063114cdb455@quicinc.com>
Date: Thu, 22 Aug 2024 16:08:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: ipq5332: add nodes to bringup q6
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-4-quic_gokulsri@quicinc.com>
 <f6g2bvosd7y5zyufel73lm6xr2otf25q7ut6tz3vnphtlqotk6@uftsnu4z6xql>
Content-Language: en-US
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
In-Reply-To: <f6g2bvosd7y5zyufel73lm6xr2otf25q7ut6tz3vnphtlqotk6@uftsnu4z6xql>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UzHyG1PBKN7CbETfglDktEDyeUbVGmYa
X-Proofpoint-ORIG-GUID: UzHyG1PBKN7CbETfglDktEDyeUbVGmYa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_03,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=787
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220079


On 8/20/2024 4:51 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 02:25:16PM +0530, Gokul Sriram Palanisamy wrote:
>> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>
>> Enable nodes required for q6 remoteproc bring up.
>>
>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 62 +++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> index 0a74ed4f72cc..ec93e7b64b9e 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
>> @@ -145,6 +145,11 @@ smem@4a800000 {
>>   
>>   			hwlocks = <&tcsr_mutex 3>;
>>   		};
>> +
>> +		q6_region: wcnss@4a900000 {
> Why here it is wcnss...
will change it to wcss.
>> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
>> +			no-map;
>> +		};
>>   	};
>>   
>>   	soc@0 {
>> @@ -476,6 +481,39 @@ frame@b128000 {
>>   				status = "disabled";
>>   			};
>>   		};
>> +
>> +		q6v5_wcss: remoteproc@d100000 {
> but everywhere else is wcss?
yes, will stick to wcss everywhere.
>
>> +			compatible = "qcom,ipq5332-wcss-sec-pil";
>> +			reg = <0xd100000 0x4040>;
>> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
> It's one firmware independent of board?

Yes, we have only one firmware across all our boards.

Regards,

Gokul

>
> Best regards,
> Krzysztof
>

