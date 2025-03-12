Return-Path: <linux-arm-msm+bounces-51089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C576A5D6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 08:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7003116B20E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 07:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BDE1EB186;
	Wed, 12 Mar 2025 07:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oObvKTPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9481E9906;
	Wed, 12 Mar 2025 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763508; cv=none; b=Z4K8is64I2j+cS6+0oyo5aPxe2tQibHAEp0Wzju3Q+SHbaiVxDt+sOsdBpy797aSaO9h9KyMTJBlRSdMlTOuqjFtTl6Y9em4EKcp7dOwL5POcbF19Y5YIL80bc/oPL9Qh+tymGJuxfmocwZA/gQPHPJhCUqdqg4i4rRFeJX8A88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763508; c=relaxed/simple;
	bh=rM1Vd58sP9fFNsAsQOxqFvSc/jOS0Ipmr14ijSkTPtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GThgmecdfkcLT17JCUu0HrvjE1LG6uMMAXD6seD7vzl/c+BK1ALTi5V3KnpN8IiLdGQNnVPyWqAZhxvK5Ursxy9UByijrwpUTFyGiJeYojsR7jQpqzA2iwoIl/1nC0jD1VCdKaXNjB7r7r+jZNzWBIzl+SN0Ug04ZhWZMJ6tQY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oObvKTPn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHKmq023865;
	Wed, 12 Mar 2025 07:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5fF9eGrHHkUBqcAX9C2kIfOjhRJkpHLSy1YaTVYTok=; b=oObvKTPnoRiYoWWZ
	pQhZkMD7l5RmqCTPe7DcqBh+s8Z6dXKv0EvCB+8w5UuDCS3I5e7ATf+5x9VeT8Zu
	WKaOihHXlyYH2OtpHUWai3fwJdPJJzuD4kCUu3qalPyN2XNYPOaTpzFgbyVDRoWb
	BOFiBiIczkK5Xz8m04lGJd9YbFm0osIb1BuVv+PF/KAW7cuSunXpQg5VDuDecqPq
	chf0UZeMHQ6YmCRco5iUEzVa/7jQ5oo/Es5n0CAXj4tK5ZtryrgtypPEupyzDLBc
	bx3jiv1WnwwVDIwGwQRRnHLJX4acDQLE0yWtbeV7MveIye29c1Sz2+B83ncocw2O
	ozKvSg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mheu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:11:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C7BhiQ025593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 07:11:43 GMT
Received: from [10.218.5.175] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 00:11:40 -0700
Message-ID: <43450c5e-837c-4215-9bb4-69066b175832@quicinc.com>
Date: Wed, 12 Mar 2025 12:41:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Dmitry Baryshkov <lumag@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
 <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3zGtlQK5zO1syX5ivU070Gh8yq1te4RK
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d133b0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vlatggBPyhKtcxP6hQoA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3zGtlQK5zO1syX5ivU070Gh8yq1te4RK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=532 clxscore=1011
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120047


On 3/12/2025 12:23 PM, Dmitry Baryshkov wrote:
> On Thu, Feb 06, 2025 at 07:13:17PM +0530, Pratyush Brahma wrote:
>> Add the PCIe SMMU node to enable address translations
>> for pcie.
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 75 insertions(+)
>>
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
>
> Though I see a little benefit in having this SMMU node if it is not
> followed by the PCIe enablement.

Thanks for the review!

PCIe enablement changes for qcs8300 have been posted already [1] and [1] 
needs
this patch as mentioned in [2].

[1] 
https://lore.kernel.org/lkml/20250310063103.3924525-8-quic_ziyuzhan@quicinc.com
[2] 
https://lore.kernel.org/lkml/20250310063103.3924525-1-quic_ziyuzhan@quicinc.com

-- 
Thanks and Regards
Pratyush Brahma


