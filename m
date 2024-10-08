Return-Path: <linux-arm-msm+bounces-33606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C449957D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 21:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC99AB21D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 19:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670FD212D3E;
	Tue,  8 Oct 2024 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ik4UzACq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E52F9C0;
	Tue,  8 Oct 2024 19:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728416806; cv=none; b=gCGc3C7+ldpXBpyq0YXM82UXQaRoXgLb0YLqxkhaS8+AEepfcQ8hUlPMIb59rcW5HRX7ipM4URtd5tC5VnwZRL7FA0YXAwwGTTaNN5w/3snKKDEHqLmmnvhqeyuEQwCN/ymK32lPnhmUe11cJv3dF2hT2z1DT1nxnGMFowxn6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728416806; c=relaxed/simple;
	bh=vTQ93XUpOUKF6OTPDRe2FpgaOt0EU8TN1/c5J7zUW7g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q7Jc6y6E0ibNnUDUKdHYPxIRZDNYxDRTmV+Qft2/p1U4UqmZI299ynzMs6ki3KaepodLq/IIdVGJgoHvqQZMmnYB2o6R6XUEuSLN1WorU0HGTCQKZ0w4q9BnPJ8IbNTLxc6ZbeAt+JZWwIROykyNKBbn9v/vnyFxOm6s1HyRVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ik4UzACq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498ET5Mu025622;
	Tue, 8 Oct 2024 19:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UTKztLeRZ5Zeh58cINrurW5qOVBYrEVcmjr
	tJ5gkR7Q=; b=ik4UzACqPZpfNhW7zZMJW1DEPlLZaW2uqeASEb3PbABTzgTWnNn
	PGfPflEKVENUoI5SV9FV+wy2Pvx21gtjl+9R44kdGisZXfhfBR9jrOyjZ1zHUY4R
	2IziO9caZAF4zyollAIvXieWfKC4TZhZiuZqIpbq5p2piD3wnMuuFMBZY8Vi7XiB
	6poJfb06y24mmTWmdqg/SyYy2EsvmYlRDjCEsVjMcl5X2YsG+Wrl3ll/gMtv+z5G
	9eraEJWgZQQ85PjNArLN4k7Mk+GIt2rjxdih08ZFxFijBSNbSjOxRjkSobltKxeA
	iDljb1MyACGNYzQOAFerFgYQHkEolfeNrIw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4252wssk93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 19:46:40 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 498JedqQ004700;
	Tue, 8 Oct 2024 19:46:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 424xwbpp9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 19:46:40 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 498Jf3Ui005037;
	Tue, 8 Oct 2024 19:46:40 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-uchalich-lv.qualcomm.com [10.81.89.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 498JkdSG011613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 19:46:39 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4184210)
	id B878039C; Tue,  8 Oct 2024 12:46:39 -0700 (PDT)
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
Subject: [PATCH] soc: qcom: llcc: Add per slice counter and common llcc slice descriptor
Date: Tue,  8 Oct 2024 12:46:36 -0700
Message-Id: <20241008194636.3075093-1-quic_uchalich@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: mQFo6onQZ8gFcNkKp9opHcySav8pY819
X-Proofpoint-GUID: mQFo6onQZ8gFcNkKp9opHcySav8pY819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080127

Introduce atomic per-slice counter to keep track of the
activate/deactivate count per slice and a common llcc slice
descriptor to maintain accurate count.

In case a client driver calls llcc_slice_getd more than once,
it will get the same descriptor for given use case. And if two
client drivers are voting for same slice, this count variable
will help track enable/disable of slice accurately.

Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 50 +++++++++++++++++++++---------
 include/linux/soc/qcom/llcc-qcom.h |  4 +++
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8fa4ffd3a9b5..0cb4fd18fd2c 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -813,7 +813,6 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 {
 	const struct llcc_slice_config *cfg;
-	struct llcc_slice_desc *desc;
 	u32 sz, count;
 
 	if (IS_ERR(drv_data))
@@ -826,17 +825,10 @@ struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 		if (cfg->usecase_id == uid)
 			break;
 
-	if (count == sz || !cfg)
+	if (count == sz || !cfg || IS_ERR_OR_NULL(drv_data->desc))
 		return ERR_PTR(-ENODEV);
 
-	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
-	if (!desc)
-		return ERR_PTR(-ENOMEM);
-
-	desc->slice_id = cfg->slice_id;
-	desc->slice_size = cfg->max_cap;
-
-	return desc;
+	return &drv_data->desc[count];
 }
 EXPORT_SYMBOL_GPL(llcc_slice_getd);
 
@@ -847,7 +839,8 @@ EXPORT_SYMBOL_GPL(llcc_slice_getd);
 void llcc_slice_putd(struct llcc_slice_desc *desc)
 {
 	if (!IS_ERR_OR_NULL(desc))
-		kfree(desc);
+		WARN(atomic_read(&desc->refcount), " Slice %d is still active\n",
+					desc->slice_id);
 }
 EXPORT_SYMBOL_GPL(llcc_slice_putd);
 
@@ -923,6 +916,12 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
+	if ((atomic_read(&desc->refcount)) >= 1) {
+		atomic_inc_return(&desc->refcount);
+		mutex_unlock(&drv_data->lock);
+		return 0;
+	}
+
 	if (test_bit(desc->slice_id, drv_data->bitmap)) {
 		mutex_unlock(&drv_data->lock);
 		return 0;
@@ -937,6 +936,7 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
+	atomic_inc_return(&desc->refcount);
 	__set_bit(desc->slice_id, drv_data->bitmap);
 	mutex_unlock(&drv_data->lock);
 
@@ -963,6 +963,12 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
+	if ((atomic_read(&desc->refcount)) > 1) {
+		atomic_dec_return(&desc->refcount);
+		mutex_unlock(&drv_data->lock);
+		return 0;
+	}
+
 	if (!test_bit(desc->slice_id, drv_data->bitmap)) {
 		mutex_unlock(&drv_data->lock);
 		return 0;
@@ -976,6 +982,7 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
+	atomic_dec_return(&desc->refcount);
 	__clear_bit(desc->slice_id, drv_data->bitmap);
 	mutex_unlock(&drv_data->lock);
 
@@ -1020,7 +1027,7 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	u32 attr1_val;
 	u32 attr0_val;
 	u32 max_cap_cacheline;
-	struct llcc_slice_desc desc;
+	struct llcc_slice_desc *desc;
 
 	attr1_val = config->cache_mode;
 	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
@@ -1165,8 +1172,11 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	}
 
 	if (config->activate_on_init) {
-		desc.slice_id = config->slice_id;
-		ret = llcc_slice_activate(&desc);
+		desc = llcc_slice_getd(config->usecase_id);
+		if (PTR_ERR_OR_ZERO(desc))
+			return -EINVAL;
+
+		ret = llcc_slice_activate(desc);
 	}
 
 	return ret;
@@ -1183,6 +1193,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
+	for (i = 0; i < sz; i++) {
+		drv_data->desc[i].slice_id = llcc_table[i].slice_id;
+		drv_data->desc[i].slice_size = llcc_table[i].max_cap;
+		atomic_set(&drv_data->desc[i].refcount, 0);
+	}
+
 	for (i = 0; i < sz; i++) {
 		ret = _qcom_llcc_cfg_program(&llcc_table[i], cfg);
 		if (ret)
@@ -1331,6 +1347,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	llcc_cfg = cfg->sct_data;
 	sz = cfg->size;
 
+	drv_data->desc = devm_kzalloc(dev, sizeof(struct llcc_slice_desc) * sz, GFP_KERNEL);
+	if (IS_ERR_OR_NULL(drv_data->desc)) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
 	for (i = 0; i < sz; i++)
 		if (llcc_cfg[i].slice_id > drv_data->max_slices)
 			drv_data->max_slices = llcc_cfg[i].slice_id;
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 9e9f528b1370..5eca861e2837 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -60,10 +60,12 @@
  * struct llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
  * @slice_size: Size allocated for the llcc slice
+ * @refcount: Counter to track activate/deactivate slice count
  */
 struct llcc_slice_desc {
 	u32 slice_id;
 	size_t slice_size;
+	atomic_t refcount;
 };
 
 /**
@@ -126,6 +128,7 @@ struct llcc_edac_reg_offset {
  * @bitmap: Bit map to track the active slice ids
  * @ecc_irq: interrupt for llcc cache error detection and reporting
  * @version: Indicates the LLCC version
+ * @desc: Array pointer of llcc_slice_desc
  */
 struct llcc_drv_data {
 	struct regmap **regmaps;
@@ -140,6 +143,7 @@ struct llcc_drv_data {
 	unsigned long *bitmap;
 	int ecc_irq;
 	u32 version;
+	struct llcc_slice_desc *desc;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
-- 
2.34.1


