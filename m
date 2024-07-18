Return-Path: <linux-arm-msm+bounces-26524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E639347E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B63B2834E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2D2E40856;
	Thu, 18 Jul 2024 06:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GBhPF+CU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127CF55E58
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283257; cv=none; b=uruDnrC4Z9uw6mjfy+lx4lgrkyyO/FX0ykQMyEbUZ7JS9Gb3HNYG3AB7UlAap0vM5KZbaS44SSzFCnl/ciqYKh/kz25Uyz0CkmwthBqRcglGoxRKAPSP5nYZKAqov9sZQIARJtykb2naAXSlZ2f84oFm08qWWQBfVk6+PXZugQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283257; c=relaxed/simple;
	bh=AMLabTprOE+b/0Mf4f8+EuiTx0x4CHg+uCxUzrAs0js=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfLem/koPgfYrjmn5gQ23haLxRoClyYYXF3XIYiNIkLTg99HxYXpnv0AU5wllOLGyINkN+yF/1zwLU/E60Sctqx7/RjMOgPc3pJnAZB7LOh6FqwCkYxGksBVL+s3UrrqllTsnNrIYWu6FDGCpuLsL02hG31HcZWjdhRtsESCQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GBhPF+CU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I6Ar9a003865;
	Thu, 18 Jul 2024 06:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKrj9HrdsIhFLgUAL4hpIqspup4DkR1b1EGnkz8RQvY=; b=GBhPF+CUa/CCmlVs
	1F52jNVZH9C7kntDVwErcENa9gf2ybjrXmxLO/Pb73oVl5a6zZUN6IBdq6AkFXXS
	iBtkTzDNTkEnDJL+RTCLy4gLDJDTqXbbXGAQ8NOtcuR1L+UtIhxr5lbWALbfAgzr
	uMtjUG33ZgLAcljTzIQV5mWQIbrFOm94WKzkyll0+DiFrjRdHXBI0kwrK7SOVdAL
	XsABz1soB67l1O8uvatEf0VGE37Fx8s8oj7en6ZgQd+ryWSWkOzzSyvf2LspjdeL
	yeGWJQmNWS+TMxG8L2q0tp1WC/96zrtNZV+TuZgDVns6QKJIc9ZeALgvkHheB2lN
	KUxGyA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfpcjg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6E5Vk017496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:05 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:03 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 1/6] drivers: bus: mhi: Added shared-dma-pool support for mhi_dev
Date: Thu, 18 Jul 2024 11:43:39 +0530
Message-ID: <20240718061344.575653-2-quic_gokulsri@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 02IdnW0nXZmBCMTaw1gIX3xqNXhg2Hux
X-Proofpoint-GUID: 02IdnW0nXZmBCMTaw1gIX3xqNXhg2Hux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407180040

When using default memory for coherent memory allocation without
reservation, memory gets fragmented after several mhi
register/unregister cycles and no coherent reservation was possible.

Client driver registering MHI shall reserve a dedicated region as
shared-dma-pool for mhi to help avoid this situation. On boards
which doesn't reserve this memory, it will continue to allocate
memory from default memory.

DMA pool is reserved for coherent allocations of size SZ_512K
(mhi_cntrl->seg_len) to avoid fragmentation and always ensure
allocations of SZ_512K succeeds. Allocations of lower order from the
reserved memory would lead to fragmentation on multiple alloc/frees.
So use dma_alloc_coherent from mhi_cntrl->cntrl_dev for allocations
lower than mhi_cntrl->seg_len. If coherent pool is not reserved, all
reservations go through mhi_cntrl->cntrl_dev.

Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/boot.c     | 19 ++++++------
 drivers/bus/mhi/host/init.c     | 51 +++++++++++++++++++++++++++++++++
 drivers/bus/mhi/host/internal.h | 26 +++++++++++++++++
 include/linux/mhi.h             |  5 ++++
 4 files changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index dedd29ca8db3..ca842facf820 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -303,8 +303,8 @@ void mhi_free_bhie_table(struct mhi_controller *mhi_cntrl,
 	struct mhi_buf *mhi_buf = image_info->mhi_buf;
 
 	for (i = 0; i < image_info->entries; i++, mhi_buf++)
-		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
-				  mhi_buf->buf, mhi_buf->dma_addr);
+		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
+				     mhi_buf->buf, mhi_buf->dma_addr);
 
 	kfree(image_info->mhi_buf);
 	kfree(image_info);
@@ -340,9 +340,9 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 			vec_size = sizeof(struct bhi_vec_entry) * i;
 
 		mhi_buf->len = vec_size;
-		mhi_buf->buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev,
-						  vec_size, &mhi_buf->dma_addr,
-						  GFP_KERNEL);
+		mhi_buf->buf = mhi_fw_alloc_coherent(mhi_cntrl, vec_size,
+						     &mhi_buf->dma_addr,
+						     GFP_KERNEL);
 		if (!mhi_buf->buf)
 			goto error_alloc_segment;
 	}
@@ -355,8 +355,8 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
 
 error_alloc_segment:
 	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
-		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
-				  mhi_buf->buf, mhi_buf->dma_addr);
+		mhi_fw_free_coherent(mhi_cntrl, mhi_buf->len,
+				     mhi_buf->buf, mhi_buf->dma_addr);
 
 error_alloc_mhi_buf:
 	kfree(img_info);
@@ -452,8 +452,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	fw_sz = firmware->size;
 
 skip_req_fw:
-	buf = dma_alloc_coherent(mhi_cntrl->cntrl_dev, size, &dma_addr,
-				 GFP_KERNEL);
+	buf = mhi_fw_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firmware);
 		goto error_fw_load;
@@ -462,7 +461,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	/* Download image using BHI */
 	memcpy(buf, fw_data, size);
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
-	dma_free_coherent(mhi_cntrl->cntrl_dev, size, buf, dma_addr);
+	mhi_fw_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
index ce7d2e62c2f1..c1e1412c43e2 100644
--- a/drivers/bus/mhi/host/init.c
+++ b/drivers/bus/mhi/host/init.c
@@ -8,9 +8,12 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
+#include <linux/dma-map-ops.h>
 #include <linux/dma-mapping.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/list.h>
 #include <linux/mhi.h>
 #include <linux/mod_devicetable.h>
@@ -929,6 +932,51 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 	return ret;
 }
 
+static void mhi_init_fw_coherent_memory(struct mhi_controller *mhi_cntrl,
+					struct mhi_device *mhi_dev)
+{
+	struct reserved_mem *mhi_rmem = NULL;
+	struct device *dev = &mhi_dev->dev;
+	struct device_node *cma_node = mhi_cntrl->cma_node;
+	int ret;
+
+	dev->coherent_dma_mask = mhi_cntrl->cntrl_dev->coherent_dma_mask;
+
+	if (!cma_node) {
+		dev_err(mhi_cntrl->cntrl_dev, "mhi coherent pool is not reserved");
+		return;
+	}
+
+	mhi_rmem = of_reserved_mem_lookup(cma_node);
+	of_node_put(cma_node);
+
+	if (!mhi_rmem) {
+		dev_err(mhi_cntrl->cntrl_dev, "Failed to get DMA reserved memory");
+		return;
+	}
+
+	mhi_cntrl->cma_base = mhi_rmem->base;
+	mhi_cntrl->cma_size = mhi_rmem->size;
+
+	ret = dma_declare_coherent_memory(dev, mhi_cntrl->cma_base,
+					  mhi_cntrl->cma_base,
+					  mhi_cntrl->cma_size);
+	if (ret)
+		dev_err(mhi_cntrl->cntrl_dev, "Failed to declare dma coherent memory");
+	else
+		dev_info(mhi_cntrl->cntrl_dev, "DMA Memory initialized at %pa, size %ld MiB",
+			 &mhi_cntrl->cma_base,
+			 (unsigned long)mhi_cntrl->cma_size / SZ_1M);
+}
+
+static void mhi_deinit_fw_coherent_memory(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+
+	dma_release_coherent_memory(&mhi_dev->dev);
+	mhi_dev->dev.dma_mem = NULL;
+}
+
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_controller_config *config)
 {
@@ -1028,6 +1076,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		goto error_setup_irq;
 	}
 
+	mhi_init_fw_coherent_memory(mhi_cntrl, mhi_dev);
 	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
 	mhi_dev->mhi_cntrl = mhi_cntrl;
 	dev_set_name(&mhi_dev->dev, "mhi%d", mhi_cntrl->index);
@@ -1053,6 +1102,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	return 0;
 
 err_release_dev:
+	mhi_deinit_fw_coherent_memory(mhi_cntrl);
 	put_device(&mhi_dev->dev);
 error_setup_irq:
 	mhi_deinit_free_irq(mhi_cntrl);
@@ -1095,6 +1145,7 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 	}
 	vfree(mhi_cntrl->mhi_chan);
 
+	mhi_deinit_fw_coherent_memory(mhi_cntrl);
 	device_del(&mhi_dev->dev);
 	put_device(&mhi_dev->dev);
 
diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
index aaad40a07f69..41ce100d87d2 100644
--- a/drivers/bus/mhi/host/internal.h
+++ b/drivers/bus/mhi/host/internal.h
@@ -396,6 +396,32 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 void mhi_reset_chan(struct mhi_controller *mhi_cntrl,
 		    struct mhi_chan *mhi_chan);
 
+static inline void *mhi_fw_alloc_coherent(struct mhi_controller *mhi_cntrl,
+					  size_t size, dma_addr_t *dma_handle,
+					  gfp_t gfp)
+{
+	if (size < mhi_cntrl->seg_len || !mhi_cntrl->cma_base) {
+		return dma_alloc_coherent(mhi_cntrl->cntrl_dev,
+					  size, dma_handle, gfp);
+	} else {
+		return dma_alloc_coherent(&mhi_cntrl->mhi_dev->dev,
+					  size, dma_handle, gfp);
+	}
+}
+
+static inline void mhi_fw_free_coherent(struct mhi_controller *mhi_cntrl,
+					size_t size, void *vaddr,
+					dma_addr_t dma_handle)
+{
+	if (size < mhi_cntrl->seg_len || !mhi_cntrl->cma_base) {
+		dma_free_coherent(mhi_cntrl->cntrl_dev, size, vaddr,
+				  dma_handle);
+	} else {
+		dma_free_coherent(&mhi_cntrl->mhi_dev->dev, size, vaddr,
+				  dma_handle);
+	}
+}
+
 /* Event processing methods */
 void mhi_ctrl_ev_task(unsigned long data);
 void mhi_ev_task(unsigned long data);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 059dc94d20bb..c788c12039b5 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -362,6 +362,8 @@ struct mhi_controller_config {
  * @wake_set: Device wakeup set flag
  * @irq_flags: irq flags passed to request_irq (optional)
  * @mru: the default MRU for the MHI device
+ * @cma_base: Base address of the cohernet memory pool reserved
+ * @cma_size: Size of the cohernel memory pool reserved
  *
  * Fields marked as (required) need to be populated by the controller driver
  * before calling mhi_register_controller(). For the fields marked as (optional)
@@ -447,6 +449,9 @@ struct mhi_controller {
 	bool wake_set;
 	unsigned long irq_flags;
 	u32 mru;
+	struct device_node *cma_node;
+	phys_addr_t cma_base;
+	size_t cma_size;
 };
 
 /**
-- 
2.34.1


