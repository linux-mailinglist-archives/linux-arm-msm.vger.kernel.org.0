Return-Path: <linux-arm-msm+bounces-81805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75095C5C08F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56B284E0F78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38E92FE075;
	Fri, 14 Nov 2025 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh60oeBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52398132117;
	Fri, 14 Nov 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109719; cv=none; b=sHC1d52yp50IAvPGLjBLR7eJ4q0/zeKi77HPmRbLRcqed5SajmGZwTkoJ07qMTjZBgQD7ISLZQ0aPYJCHuMtsrf17zyWsR5cK7mjkXoHTXhFpWU3h6busP8jeEiOmcXbLLy6dNtTXx/Xe0N0saVQcnoq2aQHTVhwgAADnklx2+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109719; c=relaxed/simple;
	bh=3iW7IiCWXDImHCoSp6O2Ri8MEOcoGvCToLTTlrkCdbU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JoT2WZe25HgQ+dYzPXnDnMLOaxmgpthCkTsKal8oL4+91x4wdqBDDxeQTtTPe52X4Oea5zIl/lIG5iT7hhKNvEjJzVWCV3YSY/JHeTgY2UB/b7Zj9Nzn+EDXdISb9m1f8vvrkbqbceZC7rGOWHYnlWjM15jJs2lP7EF0VZqeJs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh60oeBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8UlPU1620946;
	Fri, 14 Nov 2025 08:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=faRmBI6MvBat95N+ckKLUb
	d37ZL964ezj74YdT6EbkU=; b=kh60oeBRZrObZT6/N/F2+wg7oTZd9k39+1qAho
	33g+bNgVrg+Krlqi2L8fnqYGdmXQExo3Y3yT5qH+njaNpSJdv/WZFfQyQllYdH+S
	sq9UxviR+FdshEzMTV1NUuSZxY8Ejp1I7ad9Zqh2pQlEWE2RBuIUAgHETjLlMeGK
	4tZg6/W9I4a1X/srO7ilERjFhyazR9S+R2guK1cT4Sma03HLu7PjApmXZKpVqoLL
	l0iLcIqqK1sFoXTnzhBuiClLpUf8dkxxHXLc4APOZXYNFqmsnwGj0X6sWrZRF2wU
	+NnYYn0yx4ofFLUB74gm0USsJv9nVJc0x6KVqGlsSKwCK2uA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h1edf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8fkYV001437;
	Fri, 14 Nov 2025 08:41:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn3dkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8fjpB001425;
	Fri, 14 Nov 2025 08:41:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8fjjb001421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 62212534; Fri, 14 Nov 2025 14:11:44 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v3 0/4] Add ADSP and CDSP support on Kaanapali SoC
Date: Fri, 14 Nov 2025 14:11:38 +0530
Message-Id: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FKw1HgpbZxETQMnJsC1bIBWkj9hKWKiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OCBTYWx0ZWRfX4DdbDm/+QN0b
 yUxMfi9H7zipnrrIS6yy9i/pZVq9GbUbt8+PztXVXbnSdu4jONHkKX2o3K6tBB5fjIPt7x3npWM
 z9UWRzihNcbnJ8G2Pxl/oD0UeoKCXpaVA7OOMBMgq0izMC686Lo88kAoNBFx9kczD4OlI8vAG26
 +SsRkqZj2nqwIatu2wdKheSrlYQBu44g59ZOtGumyHNe02aee8RCR0AXHN1nyLTKm73IV8sQ7Fq
 13BeT2mrwBwga5rumGE0SVSF9ctgQsGIQb3K8hsq2AOKRahb2+wyZjiYImEaWKiLk8nCO39pewm
 00sLmEqvgx+VGsjpxXsWQBb+H1FxWRWwfozN5NGXxE4YV4kTBKIF5dBHnr9NsnXGZymdWBl3pAb
 lgwsMqcZZ/pGpan5Bt9goVZqvf6q2g==
X-Proofpoint-GUID: FKw1HgpbZxETQMnJsC1bIBWkj9hKWKiX
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=6916eb4e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KXkd8hKGogo_UzYOO18A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140068

Introduces support for new DSP IOVA formatting and hardware-specific
configuration required to enable ADSP and CDSP functionality on the
Kaanapali SoC.

Add support for a new IOVA formatting scheme by adding a sid_pos to the DSP
driver. Sid_pos standardizes the placement of the stream ID (SID) within the
physical address, which is required for DSPs to operate correctly on
Kaanapali. DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
both Q6 and user DMA (uDMA) access.
This is being upgraded to 34-bit PA + 4-bit SID due to a hardware revision
in CDSP for Kaanapali SoC, which expands the DMA addressable range.
To support CDSP operation, this series updates the DMA mask configuration
to reflect the expanded DMA addressable range.

Patch [v2]:https://lore.kernel.org/all/20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com/

Changes in v3:
  - dt-bindings documentation update to support Kaanapali Soc
  - update comments to ensure clarity
  - Read SoC-specific data by matching the SoC’s .compatible field
    in the driver’s of_device_id match table instead of root node
  - Rename the dma_mask to the dma_bits for more clarity and set it's
    value based on the dsp_default_dma_bits instead of hardcode to 32

Kumari Pallavi (4):
  dt-bindings: misc: qcom,fastrpc: Add compatible for Kaanapali
  misc: fastrpc: Rename phys to dma_addr for clarity
  misc: fastrpc: Add support for new DSP IOVA formatting
  misc: fastrpc: Update dma_bits for CDSP support on Kaanapali SoC

 .../bindings/misc/qcom,fastrpc.yaml           |   5 +-
 drivers/misc/fastrpc.c                        | 127 ++++++++++++------
 2 files changed, 91 insertions(+), 41 deletions(-)

-- 
2.34.1


