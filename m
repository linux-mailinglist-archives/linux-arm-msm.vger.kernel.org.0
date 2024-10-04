Return-Path: <linux-arm-msm+bounces-33156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56547991161
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64EBB24271
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39A01D8A18;
	Fri,  4 Oct 2024 21:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cfYViryI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236DD1D8A15;
	Fri,  4 Oct 2024 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077083; cv=none; b=VBHvluC0Ot3xBma6qpKV17ZrBerWmWa3QB8+Qc12uFyudjD6+f1BGH9w8tUS/XP+eFmBl1Q3C9OQ+9m5XPJBzUL7qTQsA+BXgAPfIDc93ripQrpJAScvZzPYIJqiO4mX6fykgQd0nyrD6AwKpR3YD5negMagfw4auOTRvVbwPCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077083; c=relaxed/simple;
	bh=0EYUUr0ga26pPFqLI/gkRjikkRomIkXGXxPFRBVM+VQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hrbm1ynyZhAtutjeOK3WQV6qzQeK0aFL12IC4XYxjVfxlpIKTeQaNRuFL93rw/IoYYGHsL7rkx7c7Vxp+pZQl21Ld3KBnQIKaKqofWMzz0TFmzh62lf/TdHkhYSAFmd6VWqDqiyDgI0FdRe+9MAYabqRqstwqnytG9nb/0BQ1ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cfYViryI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ACKOs029088;
	Fri, 4 Oct 2024 21:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhUfVFbtnu+c6GRfGQsDfS33AtdycGH7V0BwwMUaqrI=; b=cfYViryIIqhMplzT
	FJvSKa1k9qvflmvQ7G4spq6loH4KB2a4gpRS6Oq2lQPnmkd3v+2aOkYF+Kx0xJtD
	9grebunBJqUONH0KFUU79/u9j740Bs26o7nXu2IiCwOfgpoWH/UBEPZcCn6K8/Lf
	4nLTz9+y232lI4jXxD1q5GOiKJ8YhK3D0a0pTP5yCutb5eAzT3EJqEACZE2VukRw
	sdGaabqbuIBF2/82984jnlaZ669yrgjloUcYRHCFWwUVnNSrLrJODf51pYSzgj2B
	7EqRWEjlFV4GJlsq2U/MCUKSYFcHdgCPCNKPjizxLW1ym71W2He80OxR1ER2k1ae
	YZ2ODg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205hba74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:38 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOb7a007294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:37 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:33 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha
	<quic_mojha@quicinc.com>
Subject: [PATCH 5/6] remoteproc: qcom: Add support of SHM bridge to enable memory protection
Date: Sat, 5 Oct 2024 02:53:58 +0530
Message-ID: <20241004212359.2263502-6-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004212359.2263502-1-quic_mojha@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZWoBSKDGp8hdkpCoVnrK_PgM9lMswc_F
X-Proofpoint-ORIG-GUID: ZWoBSKDGp8hdkpCoVnrK_PgM9lMswc_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040148

Qualcomm SoCs running with the Qualcomm EL2 hypervisor(QHEE) have been
utilizing the Peripheral Authentication Service (PAS) from its TrustZone
(TZ) firmware to securely authenticate and reset via sequence of SMC
calls like qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
qcom_scm_pas_auth_and_reset().

Memory protection need to be enabled for both meta data memory region and
remoteproc carveout memory region.

For memory passed to Qualcomm TrustZone, the memory should be part of
SHM bridge memory. However, when QHEE is present, PAS SMC calls are
getting trapped in QHEE, which create or gets memory from SHM bridge for
both meta data memory and for remoteproc carve out regions before it get
passed to TZ.  However, in absence of QHEE hypervisor, Linux need to
create SHM bridge for both meta data in qcom_scm_pas_init_image() and
for remoteproc memory before the call being made to
qcom_scm_pas_auth_and_reset().

For qcom_scm_pas_init_image() call, metadata content need to be copied
to the buffer allocated from SHM bridge before making the SMC call.

For qcom_scm_pas_auth_and_reset(), remoteproc memory region need to be
protected and for that SHM bridge need to be created. Make
qcom_tzmem_init_area() and qcom_tzmem_cleanup_area() exported symbol so
that it could be used to create SHM bridge for remoteproc region.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c         | 29 +++++++++++-----
 drivers/firmware/qcom/qcom_tzmem.c       | 14 +++-----
 drivers/remoteproc/qcom_q6v5_pas.c       | 44 ++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h   |  1 +
 include/linux/firmware/qcom/qcom_tzmem.h | 10 ++++++
 5 files changed, 80 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..dafc07dc181f 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -591,15 +591,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	 * data blob, so make sure it's physically contiguous, 4K aligned and
 	 * non-cachable to avoid XPU violations.
 	 *
-	 * For PIL calls the hypervisor creates SHM Bridges for the blob
-	 * buffers on behalf of Linux so we must not do it ourselves hence
-	 * not using the TZMem allocator here.
+	 * For PIL calls the hypervisor like Gunyah or older QHEE creates SHM
+	 * Bridges for the blob buffers on behalf of Linux so we must not do it
+	 * ourselves hence use TZMem allocator only when these hypervisors are
+	 * not present.
 	 *
 	 * If we pass a buffer that is already part of an SHM Bridge to this
 	 * call, it will fail.
 	 */
-	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
-				       GFP_KERNEL);
+	if (ctx && ctx->shm_bridge_needed)
+		mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
+	else
+		mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys, GFP_KERNEL);
+
 	if (!mdata_buf)
 		return -ENOMEM;
 
@@ -613,7 +617,10 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (ctx && ctx->shm_bridge_needed)
+		desc.args[1] = qcom_tzmem_to_phys(mdata_buf);
+	else
+		desc.args[1] = mdata_phys;
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
@@ -625,8 +632,11 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
+		if (ctx->shm_bridge_needed)
+			ctx->phys = qcom_tzmem_to_phys(mdata_buf);
+		else
+			ctx->phys = mdata_phys;
 		ctx->ptr = mdata_buf;
-		ctx->phys = mdata_phys;
 		ctx->size = size;
 	}
 
@@ -643,7 +653,10 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	if (!ctx->ptr)
 		return;
 
-	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
+	if (ctx->shm_bridge_needed)
+		qcom_tzmem_free(ctx->ptr);
+	else
+		dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
 	ctx->phys = 0;
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..66aba2fc979d 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -22,14 +22,6 @@
 
 #include "qcom_tzmem.h"
 
-struct qcom_tzmem_area {
-	struct list_head list;
-	void *vaddr;
-	dma_addr_t paddr;
-	size_t size;
-	void *priv;
-};
-
 struct qcom_tzmem_pool {
 	struct gen_pool *genpool;
 	struct list_head areas;
@@ -107,7 +99,7 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
 	int ret;
@@ -133,8 +125,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(qcom_tzmem_init_area);
 
-static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
+void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
@@ -144,6 +137,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
 	kfree(handle);
 }
+EXPORT_SYMBOL_GPL(qcom_tzmem_cleanup_area);
 
 #endif /* CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE */
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index bdb071ab5938..ac339145e072 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -20,6 +20,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -120,6 +121,7 @@ struct qcom_adsp {
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
 
 	struct qcom_devmem_table *devmem;
+	struct qcom_tzmem_area *tzmem;
 };
 
 static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
@@ -262,6 +264,43 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static int adsp_create_shmbridge(struct qcom_adsp *adsp)
+{
+	struct qcom_tzmem_area *rproc_tzmem;
+	struct rproc *rproc = adsp->rproc;
+	int ret;
+
+	if (!rproc->has_iommu)
+		return 0;
+
+	rproc_tzmem = devm_kzalloc(adsp->dev, sizeof(*rproc_tzmem), GFP_KERNEL);
+	if (!rproc_tzmem)
+		return -ENOMEM;
+
+	rproc_tzmem->size = PAGE_ALIGN(adsp->mem_size);
+	rproc_tzmem->paddr = adsp->mem_phys;
+	ret = qcom_tzmem_init_area(rproc_tzmem);
+	if (ret) {
+		dev_err(adsp->dev,
+			"failed to create shmbridge for carveout: %d\n", ret);
+		return ret;
+	}
+
+	adsp->tzmem = rproc_tzmem;
+
+	return ret;
+}
+
+static void adsp_delete_shmbridge(struct qcom_adsp *adsp)
+{
+	struct rproc *rproc = adsp->rproc;
+
+	if (!rproc->has_iommu)
+		return;
+
+	qcom_tzmem_cleanup_area(adsp->tzmem);
+}
+
 static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = rproc->priv;
@@ -317,6 +356,10 @@ static int adsp_start(struct rproc *rproc)
 
 	qcom_pil_info_store(adsp->info_name, adsp->mem_phys, adsp->mem_size);
 
+	ret = adsp_create_shmbridge(adsp);
+	if (ret)
+		goto release_pas_metadata;
+
 	ret = qcom_scm_pas_auth_and_reset(adsp->pas_id);
 	if (ret) {
 		dev_err(adsp->dev,
@@ -324,6 +367,7 @@ static int adsp_start(struct rproc *rproc)
 		goto release_pas_metadata;
 	}
 
+	adsp_delete_shmbridge(adsp);
 	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(adsp->dev, "start timed out\n");
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab..25243cd889bb 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -70,6 +70,7 @@ struct qcom_scm_pas_metadata {
 	void *ptr;
 	dma_addr_t phys;
 	ssize_t size;
+	bool shm_bridge_needed;
 };
 
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..e0a57cc8f74b 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -39,6 +39,14 @@ struct qcom_tzmem_pool_config {
 	size_t max_size;
 };
 
+struct qcom_tzmem_area {
+	struct list_head list;
+	void *vaddr;
+	dma_addr_t paddr;
+	size_t size;
+	void *priv;
+};
+
 struct qcom_tzmem_pool *
 qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config);
 void qcom_tzmem_pool_free(struct qcom_tzmem_pool *pool);
@@ -48,6 +56,8 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 
 void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
 void qcom_tzmem_free(void *ptr);
+int qcom_tzmem_init_area(struct qcom_tzmem_area *area);
+void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area);
 
 DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
-- 
2.34.1


