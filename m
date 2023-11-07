Return-Path: <linux-arm-msm+bounces-67-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4797E3B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 12:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0782F1F21758
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292E02D7B0;
	Tue,  7 Nov 2023 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J6D4ypX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8331A1FA6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 11:53:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED72C6
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 03:53:33 -0800 (PST)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A7BVBjL029518;
	Tue, 7 Nov 2023 11:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nZZFZb3VRRpNXPsD8B9l5rB67sf+q++7CLEPRBmJPi8=;
 b=J6D4ypX+hmqQhDDfQ9ZTFSIjR1AfxK5jUsm03CoF7dV6o/WGWNoQH/3mQ7UDah+nLrw3
 Iao/c4xt1D6r5+C71dYq8JZqwYGWxk7sFykl7WwiJZ+OXwDaf8VMYT1rJMVRcaaK2ql+
 95OLB4aOptbHdoZou1EA6SrRvXR+GbnsmpRpXVBQ6x4E3uY4e92eYY04rQgDw5Gym9T7
 jypxvdam6X8DvXlQ/SCTolg5dh1bmYQOt8ZiNt4iZiaea7m7EiXV16lrlaR2L+2N+ngH
 2a5t2hy5jSHGT8rcLm6q/fhzCpHaeyapXwySU6DVkudWvrBV0+CcP97SC0GQNXJ5FmDr GQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u7agf1b4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 11:53:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A7BrDZK029424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 11:53:13 GMT
Received: from [10.216.7.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Tue, 7 Nov
 2023 03:53:10 -0800
Message-ID: <84277a5c-a33f-a412-6dec-2ab786b1a47d@quicinc.com>
Date: Tue, 7 Nov 2023 17:22:39 +0530
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
To: Rob Clark <robdclark@gmail.com>, Steven Price <steven.price@arm.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>,
        Joerg Roedel
	<joro@8bytes.org>, <iommu@lists.linux.dev>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20230809121744.2341454-1-boris.brezillon@collabora.com>
 <f72e5ab1-c6f2-ec03-68d6-1686145f3a4d@arm.com>
 <CAF6AEGtDxkiiM5NNT7Y9-sY5eCQX15ij=RzU-NX2Mvf6kNk2nA@mail.gmail.com>
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <CAF6AEGtDxkiiM5NNT7Y9-sY5eCQX15ij=RzU-NX2Mvf6kNk2nA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nO1C1-ozksi6qBb04UrR0woa_qnmcAF9
X-Proofpoint-GUID: nO1C1-ozksi6qBb04UrR0woa_qnmcAF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-07_02,2023-11-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070098



On 10/24/2023 2:32 AM, Rob Clark wrote:
> On Wed, Sep 20, 2023 at 6:12 AM Steven Price <steven.price@arm.com> wrote:
>>
>> On 09/08/2023 13:17, Boris Brezillon wrote:
>>> Hello,
>>>
>>> This patchset is an attempt at making page table allocation
>>> customizable. This is useful to some GPU drivers for various reasons:
>>>
>>> - speed-up upcoming page table allocations by managing a pool of free
>>>    pages
>>> - batch page table allocation instead of allocating one page at a time
>>> - pre-reserve pages for page tables needed for map/unmap operations and
>>>    return the unused page tables to some pool
>>>
>>> The first and last reasons are particularly important for GPU drivers
>>> wanting to implement asynchronous VM_BIND. Asynchronous VM_BIND requires
>>> that any page table needed for a map/unmap operation to succeed be
>>> allocated at VM_BIND job creation time. At the time of the job creation,
>>> we don't know what the VM will look like when we get to execute the
>>> map/unmap, and can't guess how many page tables we will need. Because
>>> of that, we have to over-provision page tables for the worst case
>>> scenario (page table tree is empty), which means we will allocate/free
>>> a lot. Having pool a pool of free pages is crucial if we want to
>>> speed-up VM_BIND requests.
>>>
>>> A real example of how such custom allocators can be used is available
>>> here[1]. v2 of the Panthor driver is approaching submission, and I
>>> figured I'd try to upstream the dependencies separately, which is
>>> why I submit this series now, even though the user of this new API
>>> will come afterwards. If you'd prefer to have those patches submitted
>>> along with the Panthor driver, let me know.
>>>
>>> This approach has been discussed with Robin, and is hopefully not too
>>> far from what he had in mind.
>>
>> The alternative would be to embed a cache of pages into the IOMMU
>> framework, however kmem_cache sadly doesn't seem to support the
>> 'reserve' of pages concept that we need. mempools could be a solution
>> but the mempool would need to be created by the IOMMU framework as the
>> alloc/free functions are specified when creating the pool. So it would
>> be a much bigger change (to drivers/iommu).
>>
>> So, given that so far it's just Panthor this seems like the right
>> approach for now - when/if other drivers want the same functionality
>> then it might make sense to revisit the idea of doing the caching within
>> the IOMMU framework.
> 
> I have some plans to use this as well for drm/msm.. but the reasons
> and requirements are basically the same as for panthor.  I think I
> prefer the custom allocator approach, rather than tying this to IOMMU
> framework.  (But ofc custom allocators, I guess, does not prevent the
> iommu driver from doing it's own caching.)
> 
> BR,
> -R
> 

We have also posted one RFC patch series which is based on this current 
patches by Boris and helping us to define our custom alloc and free 
pgtable call. For our side usecase we have a requirement to create 
pgtable from HLOS and then share it to different entity(VMID) and 
basically that also requires few smc calls and for that we need
custom alloc/free callbacks.

https://lore.kernel.org/all/20231101071144.16309-1-quic_gkohli@quicinc.com/


So custom allocator and free ops is helping for us also. Is there any 
plan to merge these patches from Boris.




>> Robin: Does this approach sound sensible?
>>
>> FWIW:
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Steve
>>
>>> Regards,
>>>
>>> Boris
>>>
>>> [1]https://gitlab.freedesktop.org/panfrost/linux/-/blob/panthor/drivers/gpu/drm/panthor/panthor_mmu.c#L441
>>>
>>> Boris Brezillon (2):
>>>    iommu: Allow passing custom allocators to pgtable drivers
>>>    iommu: Extend LPAE page table format to support custom allocators
>>>
>>>   drivers/iommu/io-pgtable-arm.c | 50 +++++++++++++++++++++++-----------
>>>   drivers/iommu/io-pgtable.c     | 31 +++++++++++++++++++++
>>>   include/linux/io-pgtable.h     | 21 ++++++++++++++
>>>   3 files changed, 86 insertions(+), 16 deletions(-)
>>>
>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

