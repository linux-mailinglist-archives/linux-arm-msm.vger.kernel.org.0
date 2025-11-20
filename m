Return-Path: <linux-arm-msm+bounces-82636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A59B2C72FEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A85D634296C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A3C30E836;
	Thu, 20 Nov 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eJSg2uQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BB127587D;
	Thu, 20 Nov 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629062; cv=none; b=toC7rOxO81AE3/9cSu1p9XVj5BknR+Y4xR82keMqQzSrfBXr+ok85HNfe6koAOvl+R0uTkAiTAUGktMdGeN6EifI5pczrW6c0eUQNk6EJmfrr7k+SGvzuqsDnH33X4xL6ykUhbQVvsiswmf4qtJLg+Ko+cMhM/igqyr5jw5m3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629062; c=relaxed/simple;
	bh=MOcglVKUWHnK0PvtJyxOOUtARGytatIl63YQJYjSxP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IX1RZEdZEGm4yQh/tU3MlTEOQ1ihd690svs9liG4KXJZTzAxuJENZDB6GKa8i+zjUzgim5edKsovlIaMeDT26d1ZoDJ8JQIBbpEY4EQSvY9bh4MZ0iRqZQaRrmqnXZIjymfvh9hmUZPmY5MErU0/jsWI7xsprlZHh1SrVEke6BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eJSg2uQB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pcKd3407842;
	Thu, 20 Nov 2025 08:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vdyhnm7V1htoyU0Wm/p71kj6fEKj48K34jJr10G3hXg=; b=eJSg2uQB0TO1WfiA
	Gp6R4adIB0vBfaUwfVKmSALvAXIBzjBNSYtxYyk2qpWEYvfyYd94gYHrdP/F0WEk
	XC1XhRpd+dKEDck5a7uE+puNrbhc5Jwk988tFcGXNIe1O7xdgwHIZ9QL2MBB5V60
	0DwAcvBPHwOLTxLwIqUkXVtjZgF4EznvbUU+3bFwypCeZEnPoXj+yyfo7b6qktUm
	tc6L0qDltvDbgOEyRznLhQjvBgrw2/UPN9UDsyqu9nBzU3Qz+U08E/ysNJBaaMZq
	718w2r4btATGz+IFvd6VEJ1DddxHozSQlZeNwm1J1Gat/b/8kPiHTUPsl0I1G3OJ
	neUXoA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm8121fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 08:57:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK8vFbN008715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 08:57:15 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 00:55:04 -0800
Message-ID: <5f52beba-fca6-4dc1-ac6d-ec0a771a291e@quicinc.com>
Date: Thu, 20 Nov 2025 14:25:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <dmitry.baryshkov@oss.qualcomm.com>, <marijn.suijten@somainline.org>,
        <swboyd@chromium.org>, <mripard@kernel.org>, <abel.vesa@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <robin.clark@oss.qualcomm.com>, <jessica.zhang@oss.qualcomm.com>,
        <abhinav.kumar@linux.dev>, <sean@poorly.run>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <alex.vinarskis@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
        <quic_riteshk@quicinc.com>, <quic_amitsi@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qcN9EioFOCcCyE2iMFKt35Fk6xa20tlT
X-Proofpoint-GUID: qcN9EioFOCcCyE2iMFKt35Fk6xa20tlT
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691ed7eb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=c-1eStOGazR1lmZwCp8A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1MiBTYWx0ZWRfX0Up9kgzvlJqZ
 4vQ6SWNC7gXdR9RQXwV3kMoPh5FMyVrqwgMNnPG7XOhmJnF7xOKmczjlykc1TynQUgt9b8iBjR7
 L34xk7ReBRzdQCAKa3M4JsrZAuJ7oi2RYLmXnZdcoAMTQ6VhB1Nn8eaaBwcMY4a3vDuEbJ7of45
 5LftA37GnEQOCXUtBiSWQNhWklWTN/KmX4SEt8iO7O46O2rr7dG6i2vSkiY/RiTsSSZMazvnfxD
 OEq/GA5iMIeCFsTOH5gx8ANqYZ0PSxjrJAhwfYqYaYWJdWGbDID+SBdir0NZZtbN+VKFOdR4a/q
 2ywClCFA5my1XWd6Ztu0KEKcz9dAf/095DBNRAPjZzhU1lF0fW0yFAgP7yzvuZSHumd4uGCVgmK
 XUcUN6iH0PoqYwwD4ykIu3lTNs7Neg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200052



On 10/8/2025 6:10 PM, Konrad Dybcio wrote:
> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>> with their corresponding PHYs.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
> 
> [...]
> 
>> +			mdss1_dp0: displayport-controller@22154000 {
>> +				compatible = "qcom,sa8775p-dp";
>> +
>> +				reg = <0x0 0x22154000 0x0 0x104>,
> 
> sz = 0x200
> 
>> +				      <0x0 0x22154200 0x0 0x0c0>,
> 
> sz = 0x200
> 
>> +				      <0x0 0x22155000 0x0 0x770>,
> 
> sz = 0xc00> +				      <0x0 0x22156000 0x0 0x09c>,
>> +				      <0x0 0x22157000 0x0 0x09c>,
>> +				      <0x0 0x22158000 0x0 0x09c>,
>> +				      <0x0 0x22159000 0x0 0x09c>,
> 
> sz = 0x400 for all 0x9c
> 
>> +				      <0x0 0x2215a000 0x0 0x23c>,
>> +				      <0x0 0x2215b000 0x0 0x23c>;
> 
> 0x23c -> 0x600
> 
> [...]
> 
> 
>> +			mdss1_dp1: displayport-controller@2215c000 {
>> +				compatible = "qcom,sa8775p-dp";
>> +
>> +				reg = <0x0 0x2215c000 0x0 0x104>,
>> +				      <0x0 0x2215c200 0x0 0x0c0>,
>> +				      <0x0 0x2215d000 0x0 0x770>,
>> +				      <0x0 0x2215e000 0x0 0x09c>,
>> +				      <0x0 0x2215f000 0x0 0x09c>,
>> +				      <0x0 0x22160000 0x0 0x09c>,
>> +				      <0x0 0x22161000 0x0 0x09c>,
>> +				      <0x0 0x22162000 0x0 0x23c>,
>> +				      <0x0 0x22163000 0x0 0x23c>;
> 
> 0x2216_2000 and _3000 don't exist, there's no MST2/3
> 
> sizes should be changed similarly

MST2/3 is supported for MDSS1 DPTX0.

> 
> [...]
> 
>>   		dispcc1: clock-controller@22100000 {
>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
>>   				 <&rpmhcc RPMH_CXO_CLK>,
>>   				 <&rpmhcc RPMH_CXO_CLK_A>,
>>   				 <&sleep_clk>,
>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>>   				 <0>, <0>, <0>, <0>,
> 
> You need to remove the same amount of zeroes that you added
> 

Sure, Will update this in the next version.

> Konrad
> 
>>   				 <0>, <0>, <0>, <0>;
>>   			power-domains = <&rpmhpd SA8775P_MMCX>;


