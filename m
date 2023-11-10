Return-Path: <linux-arm-msm+bounces-449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A46097E7B7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 11:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20796B20DE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA001D272;
	Fri, 10 Nov 2023 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dC+Y1ys0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890486FB7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 10:47:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E67D2A27B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Nov 2023 02:47:56 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7pLnW006310;
	Fri, 10 Nov 2023 10:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QDVz94vag4zIm9p9PwGHZPwlSBS4dfUzXFFPEkRjOZw=;
 b=dC+Y1ys0ipAEYODK7OeMbJUzituN3YexyDOJMm/JGVgNvmls/z1jsFPlacUc6CqxfsbU
 U17WC67VftfNO+L4uufffB97yE5vQBALyeTFKlwGE8gnzKHs2+OOMkQduXZm41OjXpoR
 tK+m0Ajrxrl3LspUBdLkTTkUfRx1bJiargPTx5T310wJJ5p8w6onwpeK+4vmM9gCgpok
 8nc1+E3EstaKD00s4w8VIU4ZxEGQgwIPO5mdp0GLzM+JQiEM2NPAGnzKrSJ9U1iNLPdf
 6QB7A6PcGrPaPWdFiEXmLg+RY+EG9ye5ivLK3qYfvBfGhlbnbj1eOI19PshLLs0naFbm vQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8u2budqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 10:47:33 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AAAlWsg021646
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 10:47:32 GMT
Received: from [10.217.240.120] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 10 Nov
 2023 02:47:29 -0800
Message-ID: <38274eb8-296e-c9c4-7eb1-232b852107cc@quicinc.com>
Date: Fri, 10 Nov 2023 16:17:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/2] iommu: Allow passing custom allocators to pgtable
 drivers
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
        Joerg Roedel
	<joro@8bytes.org>, <iommu@lists.linux.dev>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Rob Clark <robdclark@gmail.com>, Steven Price <steven.price@arm.com>,
        <linux-arm-msm@vger.kernel.org>
References: <20231110094352.565347-1-boris.brezillon@collabora.com>
From: Gaurav Kohli <quic_gkohli@quicinc.com>
In-Reply-To: <20231110094352.565347-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vxwRI1lRRORGRMs03SXsFrKvJNLoom6Z
X-Proofpoint-ORIG-GUID: vxwRI1lRRORGRMs03SXsFrKvJNLoom6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_07,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100087



On 11/10/2023 3:13 PM, Boris Brezillon wrote:
> Hello,
> 
> This patchset is an attempt at making page table allocation
> customizable. This is useful to some GPU drivers for various reasons:
> 
> - speed-up upcoming page table allocations by managing a pool of free
>    pages
> - batch page table allocation instead of allocating one page at a time
> - pre-reserve pages for page tables needed for map/unmap operations and
>    return the unused page tables to some pool
> 
> The first and last reasons are particularly important for GPU drivers
> wanting to implement asynchronous VM_BIND. Asynchronous VM_BIND requires
> that any page table needed for a map/unmap operation to succeed be
> allocated at VM_BIND job creation time. At the time of the job creation,
> we don't know what the VM will look like when we get to execute the
> map/unmap, and can't guess how many page tables we will need. Because
> of that, we have to over-provision page tables for the worst case
> scenario (page table tree is empty), which means we will allocate/free
> a lot. Having pool a pool of free pages is crucial if we want to
> speed-up VM_BIND requests.
> 
> There might also be other good reasons to want custom allocators, like
> fine-grained memory accounting and resource limiting.
> 
> A real example of how such custom allocators can be used is available
> here[1]. v2 of the Panthor driver is approaching submission, and I
> figured I'd try to upstream the dependencies separately, which is
> why I submit this series now, even though the user of this new API
> will come afterwards. If you'd prefer to have those patches submitted
> along with the Panthor driver, let me know.
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/blob/panthor/drivers/gpu/drm/panthor/panthor_mmu.c#L441
> 
> Boris Brezillon (2):
>    iommu: Allow passing custom allocators to pgtable drivers
>    iommu: Extend LPAE page table format to support custom allocators
> 
>   drivers/iommu/io-pgtable-arm.c | 55 ++++++++++++++++++++++++----------
>   drivers/iommu/io-pgtable.c     | 23 ++++++++++++++
>   include/linux/io-pgtable.h     | 31 +++++++++++++++++++
>   3 files changed, 93 insertions(+), 16 deletions(-)
> 

Tested patches and reviewed also, both looks good , please feel free to 
add in case of merging:

Reviewed-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Tested-by: Gaurav Kohli <quic_gkohli@quicinc.com>

