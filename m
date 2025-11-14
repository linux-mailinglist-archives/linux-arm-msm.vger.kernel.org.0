Return-Path: <linux-arm-msm+bounces-81809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7ECC5C0A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2CF164EDD2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A895301499;
	Fri, 14 Nov 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhm5hrYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C52FE04F;
	Fri, 14 Nov 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109725; cv=none; b=Mmovb0rD72c/aGp4dxk1OI1TUN5P0I0CcvSaPN520o8a6pxROveu8zM3dSDr3CDXV9N7jTw5h3qdYcM5kHf0YWu8IlZ7e0XUHhoyzC5/uDgm3XUbMSfgkULl3ld66jjL4OliyuEwdV5vXZQSzRxsvPWTjmpqLKgiHgE5Ro+aWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109725; c=relaxed/simple;
	bh=xqh1PGbSktcu1rRVxMikpD77A97eiExQQTvYxP8flDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K1lM1/PNtg0Mii0fgwkzyu368svdLw1PxNJMnFEYaRm29OPaM6t6cpzUFtyJswz5fPY6GpjqDrJvQcANaEIkvhCfdOooKxR3d6a7emHqRSloAc5Tc01DZtGl2Tq4CtrstJmNnfq7LQZMmYqPnqRcel4/Syvwz0F4q3TN9QN7Xc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhm5hrYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8T7Gw1595897;
	Fri, 14 Nov 2025 08:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J4ZWsQG2t13
	Qf04qjd/yY/QujuoMGp7M2ND0bS3hTSM=; b=nhm5hrYkpZfSRnjdKLevUFeizeJ
	mMLcKt9XBSGVWvtpQ4/Mo7VyE8h/2o38L4fWZMHJ40ywcaqmMFWDuoY7+D2zBDu6
	t7r5GQwnnsWV8udkruNe5vuftpg/stxl2j2z2WYow4MRQhZJ3ds3hW43ve0wBdIC
	R281N6fOmK1EhFb3XIi4KSKV+NEvm/foZfn9ML4WcrXQB4kEhi4vHPt+au0Yiqv6
	nryY+TNene8vgdgGy4JukoUc51646DD3rWmZUU0vGVoid0NsJ2CIVYp9/N7A/wWZ
	z0D53aSqITE0AGwigrYE9gKyUNW+8ZZpuqKWhJBeyg46K57L5ji09yicHyw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fsfuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE8fkbF001442;
	Fri, 14 Nov 2025 08:41:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4a9xxn3dmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AE8foJC001473;
	Fri, 14 Nov 2025 08:41:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AE8fn7r001467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 08:41:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 14760576; Fri, 14 Nov 2025 14:11:49 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA formatting
Date: Fri, 14 Nov 2025 14:11:41 +0530
Message-Id: <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916eb52 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-4e2_yvRbxqkDXL5fRYA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: XbyKJeKSxhWXX_ugCP-kr85FQahxskJg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2OCBTYWx0ZWRfX7qH/j1z9YbRz
 C1iCTPPShBMsRg4iZX/+G0+QZSklZyG0TGE/Ak/kXjknBESfsxI5t12XrM/Z4qW0ephL3xoC4FQ
 4OhRneUsL/DT9LIFaMJ1Qx9kOBHKQuD2lzcIhUlvd/tojxwASghDwAOt9+5xTQazerk7sQhH5Rk
 7LOhpe5jA3crLCjlKKLYE0snCQS2TOsXgEGgEEHAy+RPZxAjzD2SccJyBxNBlVKyvF5Pyx7H/gJ
 QsSBcNtt2gM0UOyOtYNR1k9i0WmdDET6wnl5zgTfUDfUSn7niELO2Or8qmyZ86vYTusgpCe3OJ/
 lLBrvVuR+ETm/bNeicrD2ORQlolBmjlmBrmgBcoSgWTYLj6y+eTGSmF4Oz8a0e8B36k85/Vo0Lw
 WPIuc7IzX030HBkk0GbyP1NEZb3zxA==
X-Proofpoint-ORIG-GUID: XbyKJeKSxhWXX_ugCP-kr85FQahxskJg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140068

Implement the new IOVA formatting required by the DSP architecture change
on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
physical address. This placement is necessary for the DSPs to correctly
identify streams and operate as intended.
To address this, set SID position to bit 56 via OF matching on the fastrpc
node; otherwise, default to legacy 32-bit placement.
This change ensures consistent SID placement across DSPs.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d6a7960fe716..bcf3c7f8d3e9 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -33,7 +33,6 @@
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
 #define FASTRPC_MAX_CRCLIST	64
-#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
 #define FASTRPC_CTX_MAX (256)
 #define FASTRPC_INIT_HANDLE	1
 #define FASTRPC_DSP_UTILITIES_HANDLE	2
@@ -105,6 +104,15 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Extract smmu pa from consolidated iova */
+#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
+/*
+ * Prepare the consolidated iova to send to dsp by prepending the sid
+ * to smmu pa at the appropriate position
+ */
+#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
+       (phys += sid << sid_pos)
+
 struct fastrpc_phy_page {
 	u64 addr;		/* physical or dma address */
 	u64 size;		/* size of contiguous region */
@@ -257,6 +265,10 @@ struct fastrpc_session_ctx {
 	bool valid;
 };
 
+struct fastrpc_soc_data {
+	u32 sid_pos;
+};
+
 struct fastrpc_channel_ctx {
 	int domain_id;
 	int sesscount;
@@ -278,6 +290,7 @@ struct fastrpc_channel_ctx {
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
+	const struct fastrpc_soc_data *soc_data;
 };
 
 struct fastrpc_device {
@@ -390,7 +403,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->dma_addr));
+			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
 	kfree(buf);
 }
 
@@ -440,7 +453,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->dma_addr += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid, buf->dma_addr,
+				 fl->cctx->soc_data->sid_pos);
 
 	return 0;
 }
@@ -685,7 +699,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
+			      IPA_TO_DMA_ADDR(buffer->dma_addr,
+			      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -734,7 +749,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->dma_addr), size);
+				 IPA_TO_DMA_ADDR(buf->dma_addr,
+				 buf->fl->cctx->soc_data->sid_pos), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -789,7 +805,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		map->dma_addr = sg_phys(map->table->sgl);
 	} else {
 		map->dma_addr = sg_dma_address(map->table->sgl);
-		map->dma_addr += ((u64)fl->sctx->sid << 32);
+		IOVA_FROM_SID_PA((u64)fl->sctx->sid,
+				 map->dma_addr, fl->cctx->soc_data->sid_pos);
 	}
 	for_each_sg(map->table->sgl, sgl, map->table->nents,
 		sgl_index)
@@ -2289,6 +2306,14 @@ static int fastrpc_get_domain_id(const char *domain)
 	return -EINVAL;
 }
 
+static const struct fastrpc_soc_data kaanapali_soc_data = {
+	.sid_pos = 56,
+};
+
+static const struct fastrpc_soc_data default_soc_data = {
+	.sid_pos = 32,
+};
+
 static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct device *rdev = &rpdev->dev;
@@ -2297,6 +2322,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const char *domain;
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
+	const struct fastrpc_soc_data *soc_data = NULL;
+
+	soc_data = device_get_match_data(rdev);
+	if (!soc_data)
+		soc_data = &default_soc_data;
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
@@ -2349,6 +2379,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
+	data->soc_data = soc_data;
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2486,7 +2517,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 }
 
 static const struct of_device_id fastrpc_rpmsg_of_match[] = {
-	{ .compatible = "qcom,fastrpc" },
+	{ .compatible = "qcom,kaanapali-fastrpc", .data = &kaanapali_soc_data },
+	{ .compatible = "qcom,fastrpc", .data = &default_soc_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, fastrpc_rpmsg_of_match);
-- 
2.34.1


