Return-Path: <linux-arm-msm+bounces-3176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C710802AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 05:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37DA4280C15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 04:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEC64688;
	Mon,  4 Dec 2023 04:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="atXaMwGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36ADB197;
	Sun,  3 Dec 2023 20:14:36 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B43Qtqk000570;
	Mon, 4 Dec 2023 04:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=u/SrorPZafxayYbjMxackuDqOb8tJdzY5SKThHKYPTQ=;
 b=atXaMwGTCFuU1GhHCX9S847/qPlv09oby5Bf17bmZncDQazdxnskOvot8jR6otczVj7Y
 KVmgF1RnpzWc6iKwS4eFVgfSKO+bdjGBOtVC66V4CA2qEq70JPXxI6x70q4wPwXsYZ4J
 Bepb90SP4/+MfvHNnFaEhqS8Fn1Hr3uv473PEDNHJ/CPtwfVc/eta5Ck3Y0uPyMeRcs+
 k/BGHfPsKqCFj+95EK3HrTjzOvYPF+ISpqrZp9IFSW1GIhok6fRZVFkA8+ou9W4uZ3sg
 KGSUq3u+dc9URV9JT16Zh0jvfnHvXOWixzDtwr+Zj/Z+PpdJKbckHQW9EBiAC7EqRU9r fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uqukg2yf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 04:13:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B44Dwvj026135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 04:13:58 GMT
Received: from hu-obabatun-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 3 Dec 2023 20:13:55 -0800
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <robh+dt@kernel.org>,
        <frowand.list@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <kernel@quicinc.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Subject: [RFC PATCH v2 0/6] Dynamic allocation of reserved_mem array.
Date: Sun, 3 Dec 2023 20:13:33 -0800
Message-ID: <20231204041339.9902-1-quic_obabatun@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f_xxp2rLqRz6X5iR4o4sfT7j4thv-3e_
X-Proofpoint-ORIG-GUID: f_xxp2rLqRz6X5iR4o4sfT7j4thv-3e_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=754 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040029

The reserved_mem array is used to store the data of the different
reserved memory regions specified in the DT of a device.
The array stores information such as the name, node, starting address,
and size of a reserved memory region.

The array is currently statically allocated with a size of
MAX_RESERVED_REGIONS(64). This means that any system that specifies a
number of reserved memory regions greater than MAX_RESERVED_REGIONS(64)
will not have enough space to store the information for all the regions.

Therefore, this series extends the use of a static array for
reserved_mem, and introduces a dynamically allocated array using
memblock_alloc() based on the number of reserved memory regions
specified in the DT.

Memory gotten from memblock_alloc() is only writable after paging_init()
is called, but the reserved memory regions need to be reserved before
then so that the system does not create page table mappings for them.

Reserved memory regions can be divided into 2 groups.
i) Statically-placed reserved memory regions
i.e. regions defined in the DT using the @reg property.
ii) Dynamically-placed reserved memory regions.
i.e. regions specified in the DT using the @alloc_ranges
    and @size properties.

It is possible to call memblock_reserve() and memblock_mark_nomap() on
the statically-placed reserved memory regions and not need to save them
to the array until after paging_init(), but this is not possible for the
dynamically-placed reserved memory because the starting address of these
regions need to be stored somewhere after they are allocated.

Therefore, this series achieves the allocation and population of the
reserved_mem array in two steps:

1. Before paging_init()
   Before paging_init() is called, iterate through the reserved_mem
   nodes in the DT and do the following:
   - Allocate memory for dynamically-placed reserved memory regions and
     store their starting address in the static allocated reserved_mem
     array.
   - Call memblock_reserve() and memblock_mark_nomap() on all the
     reserved memory regions as needed.
   - Count the total number of reserved_mem nodes in the DT.

2. After paging_init()
   After paging_init() is called:
   - Allocate new memory for the reserved_mem array based on the number
     of reserved memory nodes in the DT.
   - Transfer all the information that was stored in the static array
     into the new array.
   - Store the rest of the reserved_mem regions in the new array.
     i.e. the statically-placed regions.

The static array is no longer needed after this point, but there is
currently no obvious way to free the memory. Therefore, the size of the
initial static array is now defined using a config option.
Because the array is used only before paging_init() to store the
dynamically-placed reserved memory regions, the required size can vary
from device to device. Therefore, scaling it can help get some memory
savings.

A possible solution to freeing the memory for the static array will be
to mark it as __initdata. This will automatically free the memory once
the init process is done running.
The reason why this is not pursued in this series is because of
the possibility of a use-after-free.
If the dynamic allocation of the reserved_mem array fails, then future
accesses of the reserved_mem array will still be referencing the static
array. When the init process ends and the memory is freed up, any
further attempts to use the reserved_mem array will result in a
use-after-free.

Note:

- The limitation to this approach is that there is still a limit of
  64 for dynamically reserved memory regions.
- Upon further review, the series might need to be split up/duplicated
  for other archs.


Oreoluwa Babatunde (6):
  of: reserved_mem: Change the order that reserved_mem regions are
    stored
  of: reserved_mem: Swicth call to unflatten_device_tree() to after
    paging_init()
  of: resevred_mem: Delay allocation of memory for dynamic regions
  of: reserved_mem: Add code to use unflattened DT for reserved_mem
    nodes
  of: reserved_mem: Add code to dynamically allocate reserved_mem array
  of: reserved_mem: Make MAX_RESERVED_REGIONS a config option

 arch/loongarch/kernel/setup.c      |   2 +-
 arch/mips/kernel/setup.c           |   3 +-
 arch/nios2/kernel/setup.c          |   4 +-
 arch/openrisc/kernel/setup.c       |   4 +-
 arch/powerpc/kernel/setup-common.c |   3 +
 arch/sh/kernel/setup.c             |   5 +-
 arch/um/kernel/dtb.c               |   1 -
 arch/um/kernel/um_arch.c           |   2 +
 arch/xtensa/kernel/setup.c         |   4 +-
 drivers/of/Kconfig                 |  13 +++
 drivers/of/fdt.c                   |  39 +++++--
 drivers/of/of_private.h            |   6 +-
 drivers/of/of_reserved_mem.c       | 175 +++++++++++++++++++++--------
 include/linux/of_reserved_mem.h    |   8 +-
 kernel/dma/coherent.c              |   4 +-
 kernel/dma/contiguous.c            |   8 +-
 kernel/dma/swiotlb.c               |  10 +-
 17 files changed, 205 insertions(+), 86 deletions(-)

-- 
2.17.1


