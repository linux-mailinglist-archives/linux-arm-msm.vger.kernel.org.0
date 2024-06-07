Return-Path: <linux-arm-msm+bounces-22014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DE58FFC7A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 08:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC46E1C28B04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 06:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C182115357A;
	Fri,  7 Jun 2024 06:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BXcsw8sK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0EF5336A;
	Fri,  7 Jun 2024 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717743107; cv=none; b=VoycggGTejDVsrr//+7NKCBQ9TGUMtPN1tbz8f4vWLhWI/cwYu054uuEd8L1G3I+AfcURHt5/S8y1svZ1V73jJA+sbAQiKV6PdSPl0gcinE2e5kTvnyfwSi/Ymycy/ZVQ33EGIkVbrIsmQe7vAo64p0+FbpviuYZ2LSrvDfxUgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717743107; c=relaxed/simple;
	bh=ApvfQgtq23tfdbbfL4earCVKBRWM4vSoJHJ/Wgkzuk4=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=T7415JfKzJbLcRTgyJS1d7rKn2VTcNnfURwG/Vm1KjVmEJTdkPuMxOOo6rpUANvdrZGyE+0jmbPlNVKuP/naJN6yN9NwhY1U5e69JpUiRx1AVQOV8sa3Qp67Jm/xuD//U/VcS2Dy0kZkHEsm3FpDVhyg/Isnchjdrcy/CclrWws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BXcsw8sK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456IKQY9013971;
	Fri, 7 Jun 2024 06:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPsji9VDaiIc4QBTtWsUNU07pLzwRJlb2lTmicfrLVA=; b=BXcsw8sKw9C0sLip
	dHo9n2YAVWbW+NWPJDAUd6c8hiZu1SYbSJOoQo02oPk2XtBNwz1Zxl4qkQFf+Jca
	pbLy4GC7muJeR5wm4l222W2aO63fZ2S5C2Xvr3dNk7ZK4lZFoFKwN6yAAlC0pEp5
	YDWktR6MQxiWEp8RpRMXjm6ozlc6c2yTbPQK+ewibwE6UYh2EskF87NyJb7amQRM
	hPQmB+kXRNPlYniqcor/kho8HEW6ZbpcDhkzvJ1+FiVFaUVQbXfDpBM+19QCRzIw
	DbgWlWhza5MjhizO9a9dc85qXzQNv1XPVaJNDG8KSdM2i/MVVxXS1fR5IltlzTQ0
	aqPKjw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxyc1ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 06:51:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4576pZoY004642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 06:51:35 GMT
Received: from [10.214.66.219] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 23:51:31 -0700
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdx75: add missing qlink_logging
 reserved memory for mpss
To: Krzysztof Kozlowski <krzk@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <konrad.dybcio@linaro.org>,
        <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
 <20240606143858.4026-4-quic_nainmeht@quicinc.com>
 <c22e20f5-5ca9-485c-991f-9b45e35cd75a@kernel.org>
From: Naina Mehta <quic_nainmeht@quicinc.com>
Message-ID: <da06a758-5239-42d6-e4f8-c78418d9529d@quicinc.com>
Date: Fri, 7 Jun 2024 12:21:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <c22e20f5-5ca9-485c-991f-9b45e35cd75a@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NdYHxGU6YDPDWTxK0HVJpnfeLYvgIPNe
X-Proofpoint-GUID: NdYHxGU6YDPDWTxK0HVJpnfeLYvgIPNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070047

On 6/6/2024 8:20 PM, Krzysztof Kozlowski wrote:
> On 06/06/2024 16:38, Naina Mehta wrote:
>> The qlink_logging memory region is also used by the modem firmware,
>> add it to reserved memory regions.
>> Also split MPSS DSM region into 2 separate regions.
>>
>> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdx75.dtsi | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> index 9b93f6501d55..9349b1c4e196 100644
>> --- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
>> @@ -366,7 +366,12 @@
>>   			no-map;
>>   		};
>>   
>> -		qdss_mem: qdss@88800000 {
>> +		qdss_mem: qdss@88500000 {
>> +			reg = <0x0 0x88500000 0x0 0x300000>;
>> +			no-map;
>> +		};
>> +
>> +		qlink_logging_mem: qlink_logging@88800000 {
> 
> Sorry, no downstream code.
> 
> Please follow DTS coding style - no underscores in node names. This
> applies to all work sent upstream.
> 

Thanks for pointing this out. I will update in next revision.

Regards,
Naina

> 
> 
> Best regards,
> Krzysztof
> 

