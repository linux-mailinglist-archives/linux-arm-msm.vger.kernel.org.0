Return-Path: <linux-arm-msm+bounces-25474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D28929FCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 12:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EB0284447
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 10:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5487E5589B;
	Mon,  8 Jul 2024 10:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SNhNnXbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C4B66F;
	Mon,  8 Jul 2024 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433049; cv=none; b=B55ezsV3GvPMp8bSdRTw5E6UTJhIJt2FriZhkese9Tn5bAcPpSBhi/edYsL9JVgWIT67oY6qPigyIWZ+uEhVpe8aRgEVDVqaXSJ1BnvRS1EMUjPJbYgRMhAFYIMcCCG8YJo4sNyfrgeKw40nFVc4AaVxroK8msSRZGo9Vlt7OKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433049; c=relaxed/simple;
	bh=J+Z6jMXhU/yw+wHs214cID6sbP15ukU/eqWQzLC8dOE=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OFTCf6FDS8Mz2kPAIPrmfCLp7Xo5sPRV16qsUx99LKUvU6TReqexvcMbPUQHRnWvoUpULjgsi/tqBZkHn9aHspBqQO7Iq6XBpr3sg1KojKQD8LNRBPruvqbcuMiTYvnj9peODMxcT/udUupwjBjdNz5mkDpMcdeU0kO3pLSy1Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SNhNnXbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4681PbDv009360;
	Mon, 8 Jul 2024 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9OU9NZ4RxDV8X4ZhAcTVOT9q0olNCw16TW0+r0rOjEU=; b=SNhNnXbM5/3F2BUB
	SWtxeC1RNI3Dg8+jmSBrP8BtD9fW2ccb4m8eQ4Tnd41xbRnDh1vkWqKgmbEtpnAY
	kEyDVQLwphbjoTSgAV8bhFf8qSa7SywBZlIKhm0d8yzk1Yh1a83H8PGIbixPttpB
	XJUDOIDQfs1R6YiInRrdiugKqmhPTJA2pYR5bzIkmR0z9YgAm6e8i8PgqqS5XtrY
	dAE4k42guzasEDkI4JRBesjaMiO06lDItHd00D7+lXA098uRbfJe277QNGNRYwjp
	05bZ9HtkiUV93LejVP/lGFrWpr1bTgnFcHhmNDaLyrj8uxV9q8EffwtVWqKUMyCj
	hsFGpQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t38kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 10:04:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468A42wP031947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 10:04:02 GMT
Received: from [10.214.67.176] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 03:04:00 -0700
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
To: Mukesh Ojha <quic_mojha@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
 <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
 <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>
 <jcvu2irnung4u6v6ticafrqze73kqenpqpy6le6du2q6ag734u@jeqxv5y7pumm>
 <ZnmK7Nc50gM3HbVI@hu-mojha-hyd.qualcomm.com>
From: Prakash Gupta <quic_guptap@quicinc.com>
Message-ID: <b645a400-a932-f7e0-de03-e88833541538@quicinc.com>
Date: Mon, 8 Jul 2024 15:33:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZnmK7Nc50gM3HbVI@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XL5FmoLoaI5xb4UH78wBCIL6YqFdreXi
X-Proofpoint-ORIG-GUID: XL5FmoLoaI5xb4UH78wBCIL6YqFdreXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_05,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080078



On 6/24/2024 8:34 PM, Mukesh Ojha wrote:
> On Sun, Jun 23, 2024 at 07:25:23PM -0500, Bjorn Andersson wrote:
>> On Wed, May 29, 2024 at 05:24:29PM GMT, Mukesh Ojha wrote:
>>>
>>>
>>> On 5/27/2024 2:16 AM, Bjorn Andersson wrote:
>>>> On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
>>>>> For SCM protection, memory allocation should be physically contiguous,
>>>>> 4K aligned, and non-cacheable to avoid XPU violations. This granularity
>>>>> of protection applies from the secure world. Additionally, it's possible
>>>>> that a 32-bit secure peripheral will access memory in SoCs like
>>>>> sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
>>>>> needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
>>>>> pool can be used with dma_alloc APIs.
>>>>>
>>>>> However, dma_alloc APIs will fall back to the buddy pool if the requested
>>>>> size is less than or equal to PAGE_SIZE. It's also possible that the remote
>>>>> processor's metadata blob size is less than a PAGE_SIZE. Even though the
>>>>> DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
>>>>> back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
>>>>> is disabled.
>>>>
>>>> Does "fail" here mean that the buddy heap returns a failure - in some
>>>> case where dma_alloc would have succeeded, or that it does give you
>>>> a PAGE_SIZE allocation which doesn't meeting your requirements?
>>>
>>> Yes, buddy will also try to allocate memory and may not get PAGE_SIZE memory
>>> in lower 4GB(for 32bit capable device) if CONFIG_ZONE_{DMA|DMA32} is
>>> disabled.
>>
>> Is that -ENOMEM or does "not get" mean that the buddy fallback will
>> provide an allocation above 4GB?
> 
> dma_alloc_coherent() returns NULL in that situation.
> 
> https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/direct.c#L142
> 
> -Mukesh
> 

scm device is using DMA mask as 32b. With size <= PAGE_SIZE, call to 
dma_alloc_contiguous() at [1] will return NULL.

With DMA mask as 32b and CONFIG_ZONE_{DMA|DMA32} disabled, the allocation 
can't be guaranteed within 32b with buddy. Hence will return page as NULL.

Adding a padded page should allow allocation from CMA region.

Thanks,
Prakash

[1] https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/direct.c#L131
>>
>> Regards,
>> Bjorn
>>
>>> However, DMA memory would have successful such case if
>>> padding is added to size to cross > PAGE_SIZE.
>>>
>>>>
>>>>  From this I do find the behavior of dma_alloc unintuitive, do we know if
>>>> there's a reason for the "equal to PAGE_SIZE" case you describe here?
>>>
>>> I am not a memory expert but the reason i can think of could be, <=
>>> PAGE_SIZE can anyway possible to be requested outside DMA coherent api's
>>> with kmalloc and friends api and that could be the reason it is falling
>>> back to buddy pool in DMA api.
>>>
>>> -Mukesh
> 

> 

