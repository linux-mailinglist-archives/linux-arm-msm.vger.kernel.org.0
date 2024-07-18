Return-Path: <linux-arm-msm+bounces-26526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A4D9347E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05A5AB222BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953755FB8A;
	Thu, 18 Jul 2024 06:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ImLmM/+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42B257CB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283260; cv=none; b=bxYori4oRRx8eL+5buSuT6Ta3URUZCt5WbaFX4+8MMXUmo8CqGM0UlCDnadL+oRQLrfpPFqVJTCYnafP1G7X5g1wH5p+ENHm+ONd+2kPBo9x2zN7b6SmVPKmywYUGLQ2hzNKb2CCokZ57v4dumqToAPJGLWO/HZ83xsFgZcky0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283260; c=relaxed/simple;
	bh=q0mgliHoIKEqp4+Stv9yrgBt5RnVVrN8g583ADHICig=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r/PVT2RqdPDMU1PlSgYTpcOzw36mVVHpgVx1XCKXjAL/8ny31NBdQoO9i8sVW8NpVyU84q1pzQW8he/DOtS9f5FZOfh5ObHCilZgcaqMIZia0Cf0m1TXfSwswejRoErWWnevMz2AkW1k7U/xjeBugKFxLRcNqek+0iWkiamZLa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ImLmM/+K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I1FLGf001753;
	Thu, 18 Jul 2024 06:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5blhZ/+WdFLqRJHB3m6RS8yYPpdp/X0qIQeSi2Ld8DQ=; b=ImLmM/+KSQ4BBSSF
	tuprFXSTgm+ouA3EAvcZpxldsRSgYjEekleEVpu6MeZtNW0T+ByIg8GY0L4+UEvk
	kgBM6GKGzFLmP4MBRjXwqevwNJB22s33EJyY17mypDsztSNzxlK44bQqPlxY7xZ4
	v0tnWGqXbSfcgj/gi1aFQ92W1wTV3s9r6xkuZu85jK8YKv4uG/9OhOfOCZkH6sKi
	nX/Iur8AncY7bH/2Ed0ianommwHpc/n/z6A/j0/m9qtyvBv3yblfky+OuhE+Q3Ki
	55izUE0KeASCpX6MPiIhUSKSkXMmRa2CtMiOe6KK+P/yEMFLCxPbHTm+60Kn0I5K
	mpy15Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40es1wrg38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6E8RI016046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:08 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:05 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 2/6] bus: mhi: add support to allocate rddm memory during crash time
Date: Thu, 18 Jul 2024 11:43:40 +0530
Message-ID: <20240718061344.575653-3-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5fbezZwkYwd5iMAqMWg-pIQiXPlLDRN0
X-Proofpoint-ORIG-GUID: 5fbezZwkYwd5iMAqMWg-pIQiXPlLDRN0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180040

From: Ram Kumar D <quic_ramd@quicinc.com>

Currently, MHI bus pre-allocates the RDDM buffer for crash dump
collection during MHI power up.

To avoid carving out memory for RDDM buffers even if it is unutilized,
add support to allocate memory at runtime during the RDDM download
after target crash.

This feature can be controlled by the client driver registering the MHI
controller by setting the rddm_prealloc flag to false in mhi_cntrl.
By default rddm_prealloc is true, retaining the existing behaviour.

By default, rddm_seg_len will be same as seg_len. The client driver
can override the mhi_cntrl->rddm_seg_len.

Signed-off-by: Ram Kumar D <quic_ramd@quicinc.com>
Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/boot.c     | 149 +++++++++++++++++++++++++++-----
 drivers/bus/mhi/host/init.c     |  19 ++--
 drivers/bus/mhi/host/internal.h |  11 ++-
 drivers/bus/mhi/host/main.c     |   4 +-
 drivers/bus/mhi/host/pm.c       |   2 +-
 include/linux/mhi.h             |   2 +
 6 files changed, 156 insertions(+), 31 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index ca842facf820..1a918e340424 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -35,6 +35,16 @@ int mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
 		bhi_vec->size = mhi_buf->len;
 	}
 
+	if (!mhi_cntrl->rddm_prealloc) {
+		mhi_buf->dma_addr = dma_map_single(mhi_cntrl->cntrl_dev,
+						   mhi_buf->buf, mhi_buf->len,
+						   DMA_TO_DEVICE);
+		if (dma_mapping_error(mhi_cntrl->cntrl_dev, mhi_buf->dma_addr)) {
+			dev_err(dev, "dma mapping failed\n");
+			return -ENOMEM;
+		}
+	}
+
 	dev_dbg(dev, "BHIe programming for RDDM\n");
 
 	mhi_write_reg(mhi_cntrl, base, BHIE_RXVECADDR_HIGH_OFFS,
@@ -158,10 +168,35 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	struct mhi_buf *mhi_buf = NULL;
 	u32 rx_status;
+	int ret;
 
-	if (in_panic)
-		return __mhi_download_rddm_in_panic(mhi_cntrl);
+	/*
+	 * Allocate RDDM table if specified, this table is for debugging purpose
+	 */
+	if (!mhi_cntrl->rddm_prealloc && mhi_cntrl->rddm_size) {
+		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
+					   mhi_cntrl->rddm_size, IMG_TYPE_RDDM);
+		if (ret) {
+			dev_err(dev, "Failed to allocate RDDM table memory\n");
+			return ret;
+		}
+
+		/* setup the RX vector table */
+		ret = mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
+		if (ret) {
+			dev_err(dev, "Failed to prepare RDDM\n");
+			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image,
+					    IMG_TYPE_RDDM);
+			return ret;
+		}
+	}
+
+	if (in_panic) {
+		ret = __mhi_download_rddm_in_panic(mhi_cntrl);
+		goto out;
+	}
 
 	dev_dbg(dev, "Waiting for RDDM image download via BHIe\n");
 
@@ -173,7 +208,16 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 					      &rx_status) || rx_status,
 			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-	return (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
+	ret = (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
+
+out:
+	mhi_buf = &mhi_cntrl->rddm_image->mhi_buf[mhi_cntrl->rddm_image->entries - 1];
+
+	if (!mhi_cntrl->rddm_prealloc)
+		dma_unmap_single(mhi_cntrl->cntrl_dev, mhi_buf->dma_addr,
+				 mhi_buf->len, DMA_TO_DEVICE);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
 
@@ -297,14 +341,25 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 }
 
 void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
-			 struct image_info *image_info)
+			 struct image_info *image_info,
+			 enum image_type img_type)
 {
 	int i;
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
-	for (i = 0; i < image_info->entries; i++, mhi_buf++)
-		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
-				     mhi_buf->buf, mhi_buf->dma_addr);
+	for (i = 0; i < image_info->entries; i++, mhi_buf++) {
+		if (img_type == IMG_TYPE_RDDM && !mhi_cntrl->rddm_prealloc) {
+			if (i == (image_info->entries - 1))
+				dma_unmap_single(mhi_cntrl->cntrl_dev,
+						 mhi_buf->dma_addr,
+						 mhi_buf->len,
+						 DMA_FROM_DEVICE);
+			kfree(mhi_buf->buf);
+		} else {
+			mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
+					     mhi_buf->buf, mhi_buf->dma_addr);
+		}
+	}
 
 	kfree(image_info->mhi_buf);
 	kfree(image_info);
@@ -312,21 +367,31 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 
 int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			 struct image_info **image_info,
-			 size_t alloc_size)
+			 size_t alloc_size, enum image_type img_type)
 {
 	size_t seg_size = mhi_cntrl->seg_len;
-	int segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
+	int segments;
 	int i;
 	struct image_info *img_info;
 	struct mhi_buf *mhi_buf;
+	/* Masked __GFP_DIRECT_RECLAIM flag for non-interrupt context
+	 * to avoid rcu context sleep issue in kmalloc during kernel panic
+	 */
+	gfp_t gfp = (in_interrupt() ? GFP_ATOMIC :
+		((GFP_KERNEL | __GFP_NORETRY) & ~__GFP_DIRECT_RECLAIM));
+
+	if (img_type == IMG_TYPE_RDDM)
+		seg_size = mhi_cntrl->rddm_seg_len;
 
-	img_info = kzalloc(sizeof(*img_info), GFP_KERNEL);
+	segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
+
+	img_info = kzalloc(sizeof(*img_info), gfp);
 	if (!img_info)
 		return -ENOMEM;
 
 	/* Allocate memory for entries */
 	img_info->mhi_buf = kcalloc(segments, sizeof(*img_info->mhi_buf),
-				    GFP_KERNEL);
+				    gfp);
 	if (!img_info->mhi_buf)
 		goto error_alloc_mhi_buf;
 
@@ -340,11 +405,42 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			vec_size = sizeof(struct bhi_vec_entry) * i;
 
 		mhi_buf->len = vec_size;
-		mhi_buf->buf = mhi_fw_alloc_coherent(mhi_cntrl, vec_size,
-						     &mhi_buf->dma_addr,
-						     GFP_KERNEL);
-		if (!mhi_buf->buf)
-			goto error_alloc_segment;
+
+		if (img_type == IMG_TYPE_RDDM && !mhi_cntrl->rddm_prealloc) {
+			/* Vector table is the last entry */
+			if (i == segments - 1) {
+				mhi_buf->buf = kzalloc(PAGE_ALIGN(vec_size),
+						       gfp);
+				if (!mhi_buf->buf)
+					goto error_alloc_segment;
+
+				/* Vector table entry will be dma_mapped during
+				 * rddm prepare with DMA_TO_DEVICE and unmapped
+				 * once the target completes the RDDM XFER.
+				 */
+				continue;
+			}
+			mhi_buf->buf = kmalloc(vec_size, gfp);
+			if (!mhi_buf->buf)
+				goto error_alloc_segment;
+
+			mhi_buf->dma_addr = dma_map_single(mhi_cntrl->cntrl_dev,
+							   mhi_buf->buf,
+							   vec_size,
+							   DMA_FROM_DEVICE);
+			if (dma_mapping_error(mhi_cntrl->cntrl_dev,
+					      mhi_buf->dma_addr)) {
+				kfree(mhi_buf->buf);
+				goto error_alloc_segment;
+			}
+		} else {
+			mhi_buf->buf = mhi_fw_alloc_coherent(mhi_cntrl,
+							     vec_size,
+							     &mhi_buf->dma_addr,
+							     GFP_KERNEL);
+			if (!mhi_buf->buf)
+				goto error_alloc_segment;
+		}
 	}
 
 	img_info->bhi_vec = img_info->mhi_buf[segments - 1].buf;
@@ -354,9 +450,18 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 	return 0;
 
 error_alloc_segment:
-	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
-		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
-				     mhi_buf->buf, mhi_buf->dma_addr);
+	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--) {
+		if (img_type == IMG_TYPE_RDDM && !mhi_cntrl->rddm_prealloc) {
+			dma_unmap_single(mhi_cntrl->cntrl_dev,
+					 mhi_buf->dma_addr, mhi_buf->len,
+					 DMA_FROM_DEVICE);
+			kfree(mhi_buf->buf);
+
+		} else {
+			mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
+					     mhi_buf->buf, mhi_buf->dma_addr);
+		}
+	}
 
 error_alloc_mhi_buf:
 	kfree(img_info);
@@ -485,7 +590,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (mhi_cntrl->fbc_download) {
-		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
+		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz,
+					   IMG_TYPE_FBC);
 		if (ret) {
 			release_firmware(firmware);
 			goto error_fw_load;
@@ -510,7 +616,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 error_ready_state:
 	if (mhi_cntrl->fbc_download) {
-		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image,
+				    IMG_TYPE_FBC);
 		mhi_cntrl->fbc_image = NULL;
 	}
 
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index c1e1412c43e2..8a47c3354560 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -1058,6 +1058,9 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
 	}
 
+	mhi_cntrl->rddm_prealloc = true;
+	mhi_cntrl->rddm_seg_len = mhi_cntrl->seg_len;
+
 	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
 	if (mhi_cntrl->index < 0) {
 		ret = mhi_cntrl->index;
@@ -1224,14 +1227,18 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 		/*
 		 * Allocate RDDM table for debugging purpose if specified
 		 */
-		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
-				     mhi_cntrl->rddm_size);
+		if (mhi_cntrl->rddm_prealloc)
+			mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
+					     mhi_cntrl->rddm_size,
+					     IMG_TYPE_RDDM);
+
 		if (mhi_cntrl->rddm_image) {
 			ret = mhi_rddm_prepare(mhi_cntrl,
 					       mhi_cntrl->rddm_image);
 			if (ret) {
 				mhi_free_bhie_table(mhi_cntrl,
-						    mhi_cntrl->rddm_image);
+						    mhi_cntrl->rddm_image,
+						    IMG_TYPE_RDDM);
 				goto error_reg_offset;
 			}
 		}
@@ -1254,12 +1261,14 @@ EXPORT_SYMBOL_GPL(mhi_prepare_for_power_up);
 void mhi_unprepare_after_power_down(struct mhi_controller *mhi_cntrl)
 {
 	if (mhi_cntrl->fbc_image) {
-		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image,
+				    IMG_TYPE_FBC);
 		mhi_cntrl->fbc_image = NULL;
 	}
 
 	if (mhi_cntrl->rddm_image) {
-		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
+		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image,
+				    IMG_TYPE_RDDM);
 		mhi_cntrl->rddm_image = NULL;
 	}
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index 41ce100d87d2..c7946f81be38 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -176,6 +176,11 @@ enum mhi_er_type {
 	MHI_ER_TYPE_VALID = 0x1,
 };
 
+enum image_type {
+	IMG_TYPE_FBC,
+	IMG_TYPE_RDDM,
+};
+
 struct db_cfg {
 	bool reset_req;
 	bool db_mode;
@@ -314,9 +319,11 @@ int mhi_destroy_device(struct device *dev, void *data);
 void mhi_create_devices(struct mhi_controller *mhi_cntrl);
 
 int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
-			 struct image_info **image_info, size_t alloc_size);
+			 struct image_info **image_info, size_t alloc_size,
+			 enum image_type img_type);
 void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
-			 struct image_info *image_info);
+			 struct image_info *image_info,
+			 enum image_type img_type);
 
 /* Power management APIs */
 enum mhi_pm_state __must_check mhi_tryset_pm_state(
diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
index 4de75674f193..2f44f11fa5a6 100644
--- a/drivers/bus/mhi/host/main.c
+++ b/drivers/bus/mhi/host/main.c
@@ -503,13 +503,13 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	if (pm_state != MHI_PM_SYS_ERR_DETECT)
+	if (pm_state != MHI_PM_SYS_ERR_DETECT && ee != MHI_EE_RDDM)
 		goto exit_intvec;
 
 	switch (ee) {
 	case MHI_EE_RDDM:
 		/* proceed if power down is not already in progress */
-		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
+		if (mhi_cntrl->rddm_size && mhi_is_active(mhi_cntrl)) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			mhi_cntrl->ee = ee;
 			wake_up_all(&mhi_cntrl->state_event);
diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
index 11c0e751f223..68524e27e76c 100644
--- a/drivers/bus/mhi/host/pm.c
+++ b/drivers/bus/mhi/host/pm.c
@@ -767,7 +767,7 @@ void mhi_pm_sys_err_handler(struct mhi_controller *mhi_cntrl)
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 
 	/* skip if controller supports RDDM */
-	if (mhi_cntrl->rddm_image) {
+	if (mhi_cntrl->rddm_size) {
 		dev_dbg(dev, "Controller supports RDDM, skip SYS_ERROR\n");
 		return;
 	}
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index c788c12039b5..ce229a6a2b9a 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -452,6 +452,8 @@ struct mhi_controller {
 	struct device_node *cma_node;
 	phys_addr_t cma_base;
 	size_t cma_size;
+	bool rddm_prealloc;
+	u32 rddm_seg_len;
 };
 
 /**
-- 
2.34.1


