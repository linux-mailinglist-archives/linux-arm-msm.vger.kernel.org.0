Return-Path: <linux-arm-msm+bounces-29487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0C95EF60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D357AB236A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 11:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B32B146D45;
	Mon, 26 Aug 2024 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F/KgYEcc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811813B2A4;
	Mon, 26 Aug 2024 11:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724670231; cv=none; b=mSsBdW+qPzTPa1UieB/j5aObo/ZjKJvs0FQWyMsjdsbyraNSYCmC3QCulF2AjAXNjMMyFBHxac9b8CV4Yt/RRqhXCw5vTTDphlSs1jCSmznkWCrc2llrZAVxLMyj8m/pNTAhWLS5rrj38ASrNUnIm4W52VonZR1E/Tc7/Lb2NVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724670231; c=relaxed/simple;
	bh=+vDsdr+fHuxjLCuFoS2Jj0hfjJBpJnyy/vTwVccFwLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tw1LEss5Fy5gXlC+7zxOwVCB1Aq0BQSEACrDAeHiHC8tGI/nWDDQjOI2H7P+EnKQraq2xRVxVccU/mWye+RaSQsAabWXyBSC4EbrDL2QMDucFQjtJy4Ow6IkvsSrhhsBPrGmqehA8upPV6EpAr7J1yT7rvazcMCDy0dd2KvqaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F/KgYEcc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47Q8MPlT027697;
	Mon, 26 Aug 2024 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlryMtIXtCFNJgY00ybIkwqNG4ZgR9rFfWBNfKzZTy4=; b=F/KgYEcc3nNZxeAd
	zuESat2HCmjbSdaHTxHMCVvjaxG0YV1B7FColZEwdybzic+QUs8AZvD+QY9o2UVq
	SHACZ7EJaUDaA6hOC9A5oD2uVulN0xJWDff72H3J9HHzZ3ePevE8b25jTE8RCMlZ
	qXdrmb0cKNBNA4I/bLnZ4mpvdm9/F6ugrk9V4zvn4SjtQqq7BX0seqVI7D3/uqZR
	xoc8ZZwA/TW2PwkhH1bzAnZJBgkyeXw/MkHi0+FjYaj6mEn5+ZgKsJ24CKe0+5eJ
	4DI7f+XZKhsI1/+rV4JSUQTBgQ+GDxEt+gBVijS1jhLMZwA0vLJOyOx+zrT1NbdG
	OwI1JQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980ue44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 11:03:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47QB3WfN024371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Aug 2024 11:03:32 GMT
Received: from [10.214.66.253] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 Aug
 2024 04:03:27 -0700
Message-ID: <3ae75a75-1717-40b6-9149-bc3673d520d6@quicinc.com>
Date: Mon, 26 Aug 2024 16:33:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/6] iommu/arm-smmu: add ACTLR data and support for
 SC7280
To: Will Deacon <will@kernel.org>
CC: <robdclark@gmail.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <konrad.dybcio@linaro.org>,
        <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240816174259.2056829-1-quic_bibekkum@quicinc.com>
 <20240816174259.2056829-6-quic_bibekkum@quicinc.com>
 <20240823155918.GD525@willie-the-truck>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20240823155918.GD525@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5tvz7XhcxbIi504X4lWhmChqtAytZNRa
X-Proofpoint-ORIG-GUID: 5tvz7XhcxbIi504X4lWhmChqtAytZNRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_08,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408260086



On 8/23/2024 9:29 PM, Will Deacon wrote:
> On Fri, Aug 16, 2024 at 11:12:58PM +0530, Bibek Kumar Patro wrote:
>> Add ACTLR data table for SC7280 along with support for
>> same including SC7280 specific implementation operations.
>>
>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 +++++++++++++++++++++-
>>   1 file changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index dc143b250704..a776c7906c76 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -31,6 +31,55 @@
>>   #define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
>>   #define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
>>
>> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
>> +	{ 0x0800, 0x04e0, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x0900, 0x0402, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x0901, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x0d01, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x1181, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1182, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1183, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1184, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1185, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1186, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1187, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1188, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x1189, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x118b, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x118c, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x118d, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x118e, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x118f, 0x0420, PREFETCH_DEEP | CPRE | CMTLB },
>> +	{ 0x2000, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2040, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2062, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2080, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x20c0, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2100, 0x0020, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2140, 0x0000, PREFETCH_DEFAULT | CMTLB },
>> +	{ 0x2180, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x2181, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x2183, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x2184, 0x0020, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +	{ 0x2187, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
>> +};
>> +
>> +static const struct actlr_config sc7280_gfx_actlr_cfg[] = {
>> +	{ 0x0000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
>> +};
> 
> It's Will "stuck record" Deacon here again to say that I don't think
> this data belongs in the driver.
> 

Hi Will,

It will be difficult to reach a consensus here, with Robin and the DT 
folks okay to keep it in the driver, while you believe it doesn't belong 
there.

Robin, Rob, could you please share your thoughts on concluding the 
placement of this prefetch data?

As discussed earlier [1], the prefetch value for each client doesn’t 
define the hardware topology and is implementation-defined register 
writes used by the software driver.

We're okay with either approach, but these points [2] also raised in the
RFC led us to believe that switching from DT to the driver is the
right approach.


[1]:https://lore.kernel.org/all/2b0d8c5b-7e79-41ff-bc57-003d1b947c16@quicinc.com/
[2]:https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/


> Have a great weekend!
> 
> Will

