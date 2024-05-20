Return-Path: <linux-arm-msm+bounces-20069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD94B8C9D2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 618261F22A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84DCB54675;
	Mon, 20 May 2024 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dLTTahqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E856771;
	Mon, 20 May 2024 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207970; cv=none; b=GWQWJFv6lm2laZQqHbCqwl/tM5l9b90gS5MoHFv5CNJXJQPjwEwJ6Viv7ZQKl5v4alDvzVVeo69hhgNg01AUHaJl6yovE5vOIGGRrJP7jYPGy8yulyXW8kh1F8XbBDOMXHLEWB3Do5lxjrrLStwC7O3uisKZd4J0gLOMa8eWFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207970; c=relaxed/simple;
	bh=d7Y1ljsOCE7t6xm7XGN8IEteQpcaac3Sby7CXgtkK9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KqAsl7efIbP5OV+QjQ1Ounsvj6D9uVU0LwkmiHCZme3nYqJdWo7TLpCBBHhcbdKlLcbNe13oegHFAr8ECzDQIKkKbGxFTOZ+AqGVsWR+d9TiT+KrJselF85b9OfH/jbXL7tlI5ROUADCVTQGw9s61iJE6nGz4ULb4m3doBgSHp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dLTTahqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0cjP6028797;
	Mon, 20 May 2024 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=24G0fJbpP5ZtIf9WPSrIaKcIL6MEzJUu2OpwT2Cfhfc=; b=dL
	TTahqYFdb6CobcminT05NEnz7pW+TzCL1jfWnkhZCUjbw/w/XGDCvreZxjBwUUgo
	F6CHVXs0cPT/adbMcApDGCvzhd3r6vM9Ke9T7uKYcKK60hSop4b50E/mVjBeNhR1
	QHUridpLVIE9CjCZiqxHl2xkf6ySvLAz+nk94rYd9/rBcD4itCsYowFuOSQSzugT
	BKEzlwyGKr6QpYkV/XOg3rK8llRJGDOB2NTPgJEbUHFftUQ8yc1GEielRQTLG98u
	m+q/i5li/vU9TDc45OXLuZkWnZyPsZ/CoiYSWBCPnWWZlkfQlOUG7Um3wFw7TqBi
	SGaX7QYv6Y+r9EiyDApQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqak57k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 12:26:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KCQ3fN031330
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 12:26:03 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 05:26:01 -0700
Message-ID: <a39b3b85-8abe-52fd-e4b9-81720ffcd6a1@quicinc.com>
Date: Mon, 20 May 2024 17:55:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] firmware: qcom_scm: Give page_aligned size for dma api's
Content-Language: en-US
To: Elliot Berman <quic_eberman@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1715887976-1288-1-git-send-email-quic_mojha@quicinc.com>
 <20240516131759140-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <20240516131759140-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S5JlrgdeOYLzTLOnE-WQ0zTsYk_ODa7E
X-Proofpoint-ORIG-GUID: S5JlrgdeOYLzTLOnE-WQ0zTsYk_ODa7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405200104

Thanks for the review..

On 5/17/2024 1:58 AM, Elliot Berman wrote:
> On Fri, May 17, 2024 at 01:02:56AM +0530, Mukesh Ojha wrote:
>> If we disable CONFIG_ZONE_DMA32 to make the selection of DMA
>> memory from higher 4GB range. dma_alloc_coherant() api usage
>                                  dma_alloc_coherent()
>> inside qcom_scm_pas_init_image() which usage scm 32bit device
>> will fail for size of data passed less than PAGE_SIZE and
>> it will fallback to buddy pool to allocate memory from which
>> will fail.
> 
> I interpreted this as:
> 
> When CONFIG_ZONE_DMA32 is disabled, dma_alloc_coherent() fails when size
> is < PAGE_SIZE. qcom_scm_pas_init_image() will fail to allocate using > dma_alloc_coherent() and incorrectly fall back to buddy pool.
> 
> This justification seems incorrect to me. None of the other
> dma_alloc_coherent() users are page-aligning their requests in scm
> driver. Is something else going on?

For SCM protection, memory allocation should be physically contiguous, 
4K aligned and non-cacheable to avoid XPU violations as that is the
granularity of protection to be applied from secure world also what if,
there is a 32-bit secure peripheral is going to access this memory which 
  for some SoCs and some not.

So, we wanted to keep this common and align across multiple SoCs to do
the allocation from CMA and add a pad to the memory passed to secure 
world Also, this also enables us to keep CONFIG_ZONE_{DMA|DMA32} 
disabled which is a significant overhead.

> 
>>
>> Convert the size to aligned to PAGE_SIZE before it gets pass
>> to dma_alloc_coherant(), so that it gets coherant memory in
>       dma_alloc_coherent                    coherent
>> lower 4GB from linux cma region.
>>
>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>> ---
>>   drivers/firmware/qcom/qcom_scm.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 029ee5edbea6..6616048f1c33 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -562,6 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>>   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>   			    struct qcom_scm_pas_metadata *ctx)
>>   {
>> +	size_t page_aligned_size;
>>   	dma_addr_t mdata_phys;
>>   	void *mdata_buf;
>>   	int ret;
>> @@ -579,7 +580,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>>   	 * data blob, so make sure it's physically contiguous, 4K aligned and
>>   	 * non-cachable to avoid XPU violations.
>>   	 */
>> -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
>> +	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);
> 
> Isn't PAGE_ALIGN(size) good enough? Why do you need to round up to the
> 2nd page? Maybe you thought PAGE_ALIGN was PAGE_ALIGN_DOWN ?

No, this was intentional as there is a check inside
dma_alloc_contiguous() call for a size <= PAGE_SIZE .

-Mukesh

