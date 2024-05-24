Return-Path: <linux-arm-msm+bounces-20409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B8A8CE81F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B13E6281F92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFA712E1C6;
	Fri, 24 May 2024 15:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W3n5POMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E112C558;
	Fri, 24 May 2024 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716564728; cv=none; b=H7DATTNl+LfL6cW4U7JAL9R30STA7GOxw5fL9BD5EuQKFmHgHeYWu/AQo1NQbXlexO9nBXg/TYq5Rms9eN9lbhWZDaQDHoOmefjBb+DYKWeTAKgf4sOYNGQMjxFwRJuUALGjO55K0aPVrg0Pu0b7Ke7LVlKCzF1R+VK6Frf0Fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716564728; c=relaxed/simple;
	bh=9AsFZqMTQMjN2f7buN7052ky1Z6+0Ab+zctac6p8vHM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=glUtUWbVAKw4kwGesVKbRUvsqoM5WOupDwpotoYk0B0K6lkvMIw0k31FBBq7Zdf9IK+hzVoB1NhfWhJdfBuXv74yDTpwQoKDviP/OBgasTVEpMOzTbIhfZ08gUUrkwXC4x7DCpqneQl6H2VY/ZmBnyqqVuZHSzuBudHGudO7jEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W3n5POMM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9ngVu004282;
	Fri, 24 May 2024 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=o3uOyfEp9tUJAnBisc/9G8q/+Ktt9b3bIHBHYx2I1dI=; b=W3
	n5POMMbWmD+LVSwmKHKF7WluJPvK88V/vU2y30VzT4MtsVV6uorwk1mI+cSekA02
	RbRnFg9qLbygV9L7wQ/iDMlzaF6uizO4beukn6tiz/Edl+bnCOxD57aUTnzrt1dz
	fghgCqfLkQ/FynPMHdLyI94LT73asPF38y08RIK5h3H8dWUpTxiW5aR1BFPzh6GC
	PSeTIUlAIGDThD49EswLAsnCL6TmYmBfPZ4s02bLbdCW2iqo/drrdgPZT83K8zgx
	hukZGkYN683MwHWKw1aNAJY+YNaEe3+PuY+gr0zsB7LuBgSHg6RdfD4/E/9BYCMP
	pFEK4xVX62uERqTT6pSA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaabq2um6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 15:32:02 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OFW0cU028288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 15:32:00 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 08:31:58 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA memory from lower 4GB
Date: Fri, 24 May 2024 21:01:45 +0530
Message-ID: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Qg8iIiRArdJ0fnXQDy03eEdsi1Wn4jFo
X-Proofpoint-ORIG-GUID: Qg8iIiRArdJ0fnXQDy03eEdsi1Wn4jFo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240108

For SCM protection, memory allocation should be physically contiguous,
4K aligned, and non-cacheable to avoid XPU violations. This granularity
of protection applies from the secure world. Additionally, it's possible
that a 32-bit secure peripheral will access memory in SoCs like
sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
pool can be used with dma_alloc APIs.

However, dma_alloc APIs will fall back to the buddy pool if the requested
size is less than or equal to PAGE_SIZE. It's also possible that the remote
processor's metadata blob size is less than a PAGE_SIZE. Even though the
DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
is disabled.

To address this issue, use an extra page as padding to ensure allocation
from the CMA region. Since this memory is temporary, it will be released
once the remote processor is up or in case of any failure.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
Changes in v2:
 - Described the issue more clearly in commit text.

 drivers/firmware/qcom/qcom_scm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 520de9b5633a..0426972178a4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -538,6 +538,7 @@ static void qcom_scm_set_download_mode(bool enable)
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
+	size_t page_aligned_size;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
@@ -555,7 +556,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
 	 */
-	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
+	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);
+	mdata_buf = dma_alloc_coherent(__scm->dev, page_aligned_size, &mdata_phys,
 				       GFP_KERNEL);
 	if (!mdata_buf) {
 		dev_err(__scm->dev, "Allocation of metadata buffer failed.\n");
@@ -580,11 +582,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
 out:
 	if (ret < 0 || !ctx) {
-		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
+		dma_free_coherent(__scm->dev, page_aligned_size, mdata_buf, mdata_phys);
 	} else if (ctx) {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
-		ctx->size = size;
+		ctx->size = page_aligned_size;
 	}
 
 	return ret ? : res.result[0];
-- 
2.7.4


