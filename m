Return-Path: <linux-arm-msm+bounces-68-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962C7E3B67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B37F280FB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D512D7B3;
	Tue,  7 Nov 2023 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BnRXp13b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48148651
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 12:02:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587E9113
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 04:02:22 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A79gEep019554;
	Tue, 7 Nov 2023 12:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=em+ugaoVK2qVG9P/FFyBDT7joZQnLbDf7hMigjmUsE4=;
 b=BnRXp13b4lxA1YkCFWOFfGlTUeMK074CGlT/WW525uK3fsHT7+ECY3n4x+Ggqr9KnF3A
 /+fjjJq/Fb2CIM5Jko+FQEYLqIV/bvYKhKGgEXrya0I6or6bWxFYYOR/gUAuzd1+y/63
 HARF1T8n9jIPFPWT0Ji/JdCnIefKjyI6E7/pgKKMXi0Z1VnVArJTBOi6UuwV6cztZUX4
 dvIvKmOCFB6tQgWbUhRtRF0h4MrGPPXMbBN8jgR4Rt0WpMkb+pZWo6eNP5feySzp5B2L
 t9wu69e9rRjMK2bN5St9VpxZmW6YA0vYXH7EWJjI8Ov1qJmWWN1HW6pFllXhZQyYlYEX Zg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u7agf1bmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 12:02:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A7C251L030180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 12:02:05 GMT
Received: from [10.216.7.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 04:02:02 -0800
Message-ID: <fa26357f-c742-651c-20f1-c1815437f6f7@quicinc.com>
Date: Tue, 7 Nov 2023 17:31:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] iommu: Allow passing custom allocators to pgtable
 drivers
Content-Language: en-US
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Steven Price <steven.price@arm.com>,
        Will
 Deacon <will@kernel.org>
CC: Boris Brezillon <boris.brezillon@collabora.com>,
        Joerg Roedel
	<joro@8bytes.org>, <iommu@lists.linux.dev>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230809121744.2341454-1-boris.brezillon@collabora.com>
 <f72e5ab1-c6f2-ec03-68d6-1686145f3a4d@arm.com>
 <CAF6AEGtDxkiiM5NNT7Y9-sY5eCQX15ij=RzU-NX2Mvf6kNk2nA@mail.gmail.com>
 <84277a5c-a33f-a412-6dec-2ab786b1a47d@quicinc.com>
In-Reply-To: <84277a5c-a33f-a412-6dec-2ab786b1a47d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o5y6EHRsmXIWtCPTUCdWzhMDLyOGriFp
X-Proofpoint-GUID: o5y6EHRsmXIWtCPTUCdWzhMDLyOGriFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_02,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070099



On 11/7/2023 5:22 PM, Gaurav Kohli wrote:
> 
> 
> On 10/24/2023 2:32 AM, Rob Clark wrote:
>> On Wed, Sep 20, 2023 at 6:12 AM Steven Price <steven.price@arm.com> 
>> wrote:
>>>
>>> On 09/08/2023 13:17, Boris Brezillon wrote:
>>>> Hello,
>>>>
>>>> This patchset is an attempt at making page table allocation
>>>> customizable. This is useful to some GPU drivers for various reasons:
>>>>
>>>> - speed-up upcoming page table allocations by managing a pool of free
>>>>    pages
>>>> - batch page table allocation instead of allocating one page at a time
>>>> - pre-reserve pages for page tables needed for map/unmap operations and
>>>>    return the unused page tables to some pool
>>>>
>>>> The first and last reasons are particularly important for GPU drivers
>>>> wanting to implement asynchronous VM_BIND. Asynchronous VM_BIND 
>>>> requires
>>>> that any page table needed for a map/unmap operation to succeed be
>>>> allocated at VM_BIND job creation time. At the time of the job 
>>>> creation,
>>>> we don't know what the VM will look like when we get to execute the
>>>> map/unmap, and can't guess how many page tables we will need. Because
>>>> of that, we have to over-provision page tables for the worst case
>>>> scenario (page table tree is empty), which means we will allocate/free
>>>> a lot. Having pool a pool of free pages is crucial if we want to
>>>> speed-up VM_BIND requests.
>>>>
>>>> A real example of how such custom allocators can be used is available
>>>> here[1]. v2 of the Panthor driver is approaching submission, and I
>>>> figured I'd try to upstream the dependencies separately, which is
>>>> why I submit this series now, even though the user of this new API
>>>> will come afterwards. If you'd prefer to have those patches submitted
>>>> along with the Panthor driver, let me know.
>>>>
>>>> This approach has been discussed with Robin, and is hopefully not too
>>>> far from what he had in mind.
>>>
>>> The alternative would be to embed a cache of pages into the IOMMU
>>> framework, however kmem_cache sadly doesn't seem to support the
>>> 'reserve' of pages concept that we need. mempools could be a solution
>>> but the mempool would need to be created by the IOMMU framework as the
>>> alloc/free functions are specified when creating the pool. So it would
>>> be a much bigger change (to drivers/iommu).
>>>
>>> So, given that so far it's just Panthor this seems like the right
>>> approach for now - when/if other drivers want the same functionality
>>> then it might make sense to revisit the idea of doing the caching within
>>> the IOMMU framework.
>>
>> I have some plans to use this as well for drm/msm.. but the reasons
>> and requirements are basically the same as for panthor.  I think I
>> prefer the custom allocator approach, rather than tying this to IOMMU
>> framework.  (But ofc custom allocators, I guess, does not prevent the
>> iommu driver from doing it's own caching.)
>>
>> BR,
>> -R
>>
> 
> We have also posted one RFC patch series which is based on this current 
> patches by Boris and helping us to define our custom alloc and free 
> pgtable call. For our side usecase we have a requirement to create 
> pgtable from HLOS and then share it to different entity(VMID) and 
> basically that also requires few smc calls and for that we need
> custom alloc/free callbacks.
> 
> https://lore.kernel.org/all/20231101071144.16309-1-quic_gkohli@quicinc.com/
> 
> 
> So custom allocator and free ops is helping for us also. Is there any 
> plan to merge these patches from Boris.
> 
> 
> 
> 

Please use below tested by tag, if you are planning to merge patches by 
Boris:

Tested-by: Gaurav Kohli <quic_gkohli@quicinc.com>

>>> Robin: Does this approach sound sensible?
>>>
>>> FWIW:
>>>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>>
>>> Steve
>>>
>>>> Regards,
>>>>
>>>> Boris
>>>>
>>>> [1]https://gitlab.freedesktop.org/panfrost/linux/-/blob/panthor/drivers/gpu/drm/panthor/panthor_mmu.c#L441
>>>>
>>>> Boris Brezillon (2):
>>>>    iommu: Allow passing custom allocators to pgtable drivers
>>>>    iommu: Extend LPAE page table format to support custom allocators
>>>>
>>>>   drivers/iommu/io-pgtable-arm.c | 50 
>>>> +++++++++++++++++++++++-----------
>>>>   drivers/iommu/io-pgtable.c     | 31 +++++++++++++++++++++
>>>>   include/linux/io-pgtable.h     | 21 ++++++++++++++
>>>>   3 files changed, 86 insertions(+), 16 deletions(-)
>>>>
>>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

