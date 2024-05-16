Return-Path: <linux-arm-msm+bounces-19948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4618C7D4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 21:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170C31F21A09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 19:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2ABC156F2E;
	Thu, 16 May 2024 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JT4i7Pbt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B40156F3F;
	Thu, 16 May 2024 19:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715887996; cv=none; b=Ma+n1YeQAGejMK3DWKjmgaoDDQ7jdelPOTdw0cN0FlZ8NwrFp0eNGQuMmG19en1LUxlAQieL3EE8zMNLQK7e8QuaX1QAjYYpVX2ko4ucGQpJ1T0b31YklAar7GEC8Wp1tX1xArge9LyT8GpYkWOOwLBmQvQC8WljVC0SUaeT/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715887996; c=relaxed/simple;
	bh=2RLBuXLDeBGykBwHX4TUPifwsGmu3TrmnuOTycRoN80=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AloUJAqrVw9Ti6bmeieD3k2M+YBEX40OW2niKRqPYoaOtdxoXvASaeBrX9z4fkvU3umUevGBJGqH1VfTc3UjsgCReNplIlOAKPUziEO1BGYtmvaVnAN7EVrNoB1qNxRLP4V6opZfSsigco+4s5sZZtdySxOZ+SM/sIDfexY3DDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JT4i7Pbt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G9eqxp009225;
	Thu, 16 May 2024 19:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=jIzEufB93XSG68Y3vP5iP3PLwrRpyZR6/pPz6SSwHkg=; b=JT
	4i7Pbt5XnAYzS7Rxlns/EL/wcxaGQLCs3i/3Qohe0rD8DDn2MEkeaLYmLcicDuf1
	pPFe6WemHIkNd7suhEGGAZqxmHM552+kQ8/8rVQ8IzcZSGDIW2QMfiaxlSAR20x1
	21Ahxl5WGS1QiJnD6rtfw/CmVk19lJjEW1CZh/BTjGXGSJTQypIZi5dvSZQLuSlA
	vJQ8RZQeLaCw8xwRHNGMc/V+QHaaWRl9CeFl1EooGlOqM9gOFmrI5CFD71trDcDN
	hhbv2dq7A0Ab6rTvAn58hhYl9HbPn+lPU1YkxcWTjqykeNQFf1vWwZZWE+I4jEMp
	wI+I9kcmgNZaSY0OlSxA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51qkrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:33:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GJX65v026899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 19:33:06 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 12:33:04 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mukesh
 Ojha" <quic_mojha@quicinc.com>
Subject: [PATCH] firmware: qcom_scm: Give page_aligned size for dma api's
Date: Fri, 17 May 2024 01:02:56 +0530
Message-ID: <1715887976-1288-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NKCPjsTsV4HruYoVoJsC7pOsDcptlcpX
X-Proofpoint-ORIG-GUID: NKCPjsTsV4HruYoVoJsC7pOsDcptlcpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160140

If we disable CONFIG_ZONE_DMA32 to make the selection of DMA
memory from higher 4GB range. dma_alloc_coherant() api usage
inside qcom_scm_pas_init_image() which usage scm 32bit device
will fail for size of data passed less than PAGE_SIZE and
it will fallback to buddy pool to allocate memory from which
will fail.

Convert the size to aligned to PAGE_SIZE before it gets pass
to dma_alloc_coherant(), so that it gets coherant memory in
lower 4GB from linux cma region.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 029ee5edbea6..6616048f1c33 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -562,6 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx)
 {
+	size_t page_aligned_size;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
@@ -579,7 +580,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
 	 */
-	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
+	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);
+	mdata_buf = dma_alloc_coherent(__scm->dev, page_aligned_size, &mdata_phys,
 				       GFP_KERNEL);
 	if (!mdata_buf)
 		return -ENOMEM;
@@ -604,11 +606,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 
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


