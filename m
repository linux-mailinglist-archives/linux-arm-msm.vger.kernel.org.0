Return-Path: <linux-arm-msm+bounces-28352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901E94FBDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 04:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FAD01F2242A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 02:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A15C17999;
	Tue, 13 Aug 2024 02:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WzEhSdfj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80897FF;
	Tue, 13 Aug 2024 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723516677; cv=none; b=kUAxC/7BDFOz2SRMrqSEvHgA64KVvrfmBZvZWWHNjgvjZLJ2q5jbXdh7556Z1UH1ecYnQU4Xx4C86q38eI3EWXqVgOFz2CVkollxmYA1vAhOsgs+yZe1neMk/uoOT9Qs4TXvCuvMu4WvkEjxLGU463ULLQTdBIHQCiHeYCqfCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723516677; c=relaxed/simple;
	bh=3TEkG/S6m/l0YZcrBi6hA9rK/D6GOMmTVrvWfedznw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZlYJK9LNoNABeJeURzyPrfC9iW0eGQeKhXPjK8xyXfi73jwiUjHF3T/3F0FDy6f05GrevBMK2u2P8KMdzagF4B9pZXjTeFWXuxRwRcR6O7PYcbkS/UFiyIBWsoPYPUAHbXD/P75hylTw/3mRsylZdfsuNG4S8uz3DJjR3yWUGvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WzEhSdfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CNhHvu031258;
	Tue, 13 Aug 2024 02:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BBuOAur3CIypSLJ+F7UP9tA5nCL3SQLzzzQyaM4UmQ=; b=WzEhSdfj/extuyKE
	351bSkICOMvonSUwipZPaaOJlSNUPLL5FDux2SulDct1P0u6lWYHxysx1BfP6s6p
	7aAmxwhqVT8oQhwCWK6MtJbZDTRYiuEfg5quTbuGCVell+q4xhIMtumveczQscCC
	1lzUOfLQlsKoaVKY25qcea5GEzPmzPFKz1agSA0AmI3KfrpD6TbUHUQmW6Bdwu1b
	5iLyZV4CSq/3VzIpxbw11sE5QYHZaARAGYyrvgUQRWVQE9+IbT+Nw+4p4nguIBQg
	yHssJkGdxdokLVg+W3HcCTyo+J9HiH4GlQulT5tEeB/WYVG4TIzvvdFyHNpKGpWp
	z0SzsA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x17se3q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 02:37:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47D2bePT031901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 02:37:40 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 19:37:37 -0700
Message-ID: <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>
Date: Tue, 13 Aug 2024 10:37:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
To: Pranjal Shrivastava <praan@google.com>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
 <ZroNUGkKuC1L7Qfr@google.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <ZroNUGkKuC1L7Qfr@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uddxDccuw8tEYXxdyqmGAh5kNHjN0Jtw
X-Proofpoint-ORIG-GUID: uddxDccuw8tEYXxdyqmGAh5kNHjN0Jtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130016



On 2024/8/12 21:25, Pranjal Shrivastava wrote:
> On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
>> TBU driver has no runtime pm support now, adding pm_runtime_enable()
>> seems to be useless. Remove it.
>>
>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 36c6b36ad4ff..aff2fe1fda13 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
>>   
>>   static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>>   {
>> -	struct device *dev = &pdev->dev;
>>   	int ret;
>>   
>>   	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
>> @@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
>>   			return ret;
>>   	}
>>   
>> -	if (dev->pm_domain) {
>> -		pm_runtime_set_active(dev);
>> -		pm_runtime_enable(dev);
> 
> I assumed that this was required to avoid the TBU from being powered
> down? If so, then I think we shall move it under the

Hi Pranjal,

In my sense, this was giving the TBU ability to power down when 
necessary(through pm callbacks)? While I haven't seen any RPM impl for 
TBU device.. hence having the doubt..

Thanks,
Zhenhua

> previous if condition, i.e. CONFIG_ARM_SMMU_QCOM_DEBUG?
> 
> If not, we can remove it give that the TBU would be powered ON as needed
> 
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.7.4
>>
>>
> 
> Thanks,
> Pranjal

