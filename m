Return-Path: <linux-arm-msm+bounces-84036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A21C9A31D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8DC884E2AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6073009CA;
	Tue,  2 Dec 2025 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZA9UEzM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09832FFF89;
	Tue,  2 Dec 2025 06:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655624; cv=none; b=sahwQqVlToTBmT3qloyQxf3MNr/qSIzqp6Zd5QYSnOPBb75S1n2fCb/t7zSF8rvQTvcettus1TQ6u3PPZocyikzvtABB0aUv8vlTOzPfKTtdk9Zs2heNWH+zp2zcqZJpUt8alAUvTI8W76+OLpccBHR/m8sUa5jKNtLMl8Qx1M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655624; c=relaxed/simple;
	bh=u5202HZgDV8KRchXyqj/DPdnGt9psaoQWXO+M7o0w9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hi3NPAsIyR4OA25Cz50GoAGBy+4POpintABN6/G2j7FVWB9x2/heSdzrU2QTM5ui+HcfKAP5PzTBvlxPDALTDYdBliF12uGFCjfSNG1+0Li4pRoVrAczzNA2i8JMwavgNisB/Y6MQIlvZfMM9mOeH44/+133WyS59j4YJGpY268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZA9UEzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KrrYo1372280;
	Tue, 2 Dec 2025 06:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Pne03yccr+
	UluwM45ewx+lwS4zfOBfj67awgleuil0=; b=XZA9UEzM8TcPJmk6o6phOVn4st7
	AXo0NWk+5YVoFqJET33cekOM/XD8kwoiftQOlLRe0t4NThGkRqbB3Ys8fEqdgtm2
	djJJiAXBzFLfiJGmVAoD+ux6ujG8dlI0PiWiiO7aKdqhQI3lVN+4dvdN3fx7ioAd
	1n5T2BmEuMVLIZ7C9GDKFxJuWTLpNdMj+rNLP/IHU05qP3zWfR6bUkUJiifsz7xY
	D5AGUQY57gRUGhVSTNJYlT6Y24moYbvYrIEsPe4QHRVk95dAFp4f+zlK67JHxl2U
	8pxmnp7Oka4SppvdyNJUzq60spHpbBnsZfTeubsLOWtmlDU3DpPr21NhrlA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asjf79c72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B266mbS002102;
	Tue, 2 Dec 2025 06:06:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswkhqey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:48 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B266lJB002096;
	Tue, 2 Dec 2025 06:06:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kpallavi-hyd.qualcomm.com [10.147.243.7])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B266leB002086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 06:06:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4720299)
	id 67B8F57E; Tue,  2 Dec 2025 11:36:46 +0530 (+0530)
From: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
To: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ktadakam@qti.qualcomm.com
Subject: [PATCH v5 3/4] misc: fastrpc: Add support for new DSP IOVA formatting
Date: Tue,  2 Dec 2025 11:36:27 +0530
Message-Id: <20251202060628.1869967-4-kumari.pallavi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
References: <20251202060628.1869967-1-kumari.pallavi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: lalUmRWBw8neHRhSP71pnP8kxNXiJ5zL
X-Authority-Analysis: v=2.4 cv=VfH6/Vp9 c=1 sm=1 tr=0 ts=692e81fb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=-4e2_yvRbxqkDXL5fRYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA0NiBTYWx0ZWRfX0Q+xOynGsWgg
 fYkMnj1d8vwnKywZxLKETP+DPeXQgD50HQmUqUk0Og9qQKgQ/i6L1L1/OqukPWuB/jveSQyHnXT
 z/OmL+4xCKb6xaU02t6bdwIIZJJQU+yiN6R5DdgDZgIR+c4CSp2NWSPPMPfqaW3N7Cory4jFAok
 ZAuH4+pAEzH1mEh48TRCR8saSk1iXJIrVlC7QxeabNOVdOso2Jy+nWpIVC3IEDO7cCHz09Fyhrj
 dN9INOYr94NzES9ivIL1zPqZUzzQM81CLX8pHCSZ8qBCL9NpMYjl1l8U38h3Iw5WIyDOL7FRU7n
 jGVbTaMRm+VUxZ0I8e4O/1qMUaWn4HD8MZMy4KPXBEl7OWLFyvHA5fbPbL1Z5NFlYbISmf5lA8T
 GpQ4A0MrfpqX267/dk/UmiIwy+mrSA==
X-Proofpoint-GUID: lalUmRWBw8neHRhSP71pnP8kxNXiJ5zL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020046

Implement the new IOVA formatting required by the DSP architecture change
on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
physical address. This placement is necessary for the DSPs to correctly
identify streams and operate as intended.
To address this, set SID position to bit 56 via OF matching on the fastrpc
node; otherwise, default to legacy 32-bit placement.
This change ensures consistent SID placement across DSPs.

Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index eb9501fe79bc..6a67daafeaa1 100644
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
@@ -105,6 +104,17 @@
 
 #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
 
+/* Extract smmu pa from consolidated iova */
+#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
+/*
+ * Prepare the consolidated iova to send to dsp by prepending the sid
+ * to smmu pa at the appropriate position
+ */
+static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
+{
+	return sid << sid_pos;
+}
+
 struct fastrpc_phy_page {
 	dma_addr_t addr;	/* dma address */
 	u64 size;		/* size of contiguous region */
@@ -257,6 +267,10 @@ struct fastrpc_session_ctx {
 	bool valid;
 };
 
+struct fastrpc_soc_data {
+	u32 sid_pos;
+};
+
 struct fastrpc_channel_ctx {
 	int domain_id;
 	int sesscount;
@@ -278,6 +292,7 @@ struct fastrpc_channel_ctx {
 	bool secure;
 	bool unsigned_support;
 	u64 dma_mask;
+	const struct fastrpc_soc_data *soc_data;
 };
 
 struct fastrpc_device {
@@ -390,7 +405,7 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
-			  FASTRPC_PHYS(buf->dma_addr));
+			  IPA_TO_DMA_ADDR(buf->dma_addr, buf->fl->cctx->soc_data->sid_pos));
 	kfree(buf);
 }
 
@@ -440,7 +455,8 @@ static int fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
 	buf = *obuf;
 
 	if (fl->sctx && fl->sctx->sid)
-		buf->dma_addr += ((u64)fl->sctx->sid << 32);
+		buf->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
+				 fl->cctx->soc_data->sid_pos);
 
 	return 0;
 }
@@ -685,7 +701,8 @@ static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
 		return -ENOMEM;
 
 	ret = dma_get_sgtable(buffer->dev, &a->sgt, buffer->virt,
-			      FASTRPC_PHYS(buffer->dma_addr), buffer->size);
+			      IPA_TO_DMA_ADDR(buffer->dma_addr,
+					      buffer->fl->cctx->soc_data->sid_pos), buffer->size);
 	if (ret < 0) {
 		dev_err(buffer->dev, "failed to get scatterlist from DMA API\n");
 		kfree(a);
@@ -734,7 +751,8 @@ static int fastrpc_mmap(struct dma_buf *dmabuf,
 	dma_resv_assert_held(dmabuf->resv);
 
 	return dma_mmap_coherent(buf->dev, vma, buf->virt,
-				 FASTRPC_PHYS(buf->dma_addr), size);
+				 IPA_TO_DMA_ADDR(buf->dma_addr,
+						 buf->fl->cctx->soc_data->sid_pos), size);
 }
 
 static const struct dma_buf_ops fastrpc_dma_buf_ops = {
@@ -789,7 +807,8 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
 		map->dma_addr = sg_phys(map->table->sgl);
 	} else {
 		map->dma_addr = sg_dma_address(map->table->sgl);
-		map->dma_addr += ((u64)fl->sctx->sid << 32);
+		map->dma_addr += fastrpc_compute_sid_offset((u64)fl->sctx->sid,
+				 fl->cctx->soc_data->sid_pos);
 	}
 	for_each_sg(map->table->sgl, sgl, map->table->nents,
 		sgl_index)
@@ -2290,6 +2309,14 @@ static int fastrpc_get_domain_id(const char *domain)
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
@@ -2298,6 +2325,11 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	const char *domain;
 	bool secure_dsp;
 	unsigned int vmids[FASTRPC_MAX_VMIDS];
+	const struct fastrpc_soc_data *soc_data;
+
+	soc_data = device_get_match_data(rdev);
+	if (!soc_data)
+		soc_data = &default_soc_data;
 
 	err = of_property_read_string(rdev->of_node, "label", &domain);
 	if (err) {
@@ -2350,6 +2382,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 
 	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
 	data->secure = secure_dsp;
+	data->soc_data = soc_data;
 
 	switch (domain_id) {
 	case ADSP_DOMAIN_ID:
@@ -2487,7 +2520,8 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
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


