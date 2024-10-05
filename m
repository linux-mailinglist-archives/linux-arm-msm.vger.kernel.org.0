Return-Path: <linux-arm-msm+bounces-33178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6799171C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 266C42839AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989A215533B;
	Sat,  5 Oct 2024 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LB1erZTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9361547FF;
	Sat,  5 Oct 2024 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136931; cv=none; b=gcMETjxrTTfv2PkgSDg8jTI/b6jR9JRj8krzi/Sq8TVTZ8I67QV+0RykcRDKIbV5g+ZxAWlIEhNik/KPFVgsTFKr17/ctSRDjsyd37LLSrI16Q7fR0Cjk9CRbMT9HO9HNrYsbQFnsnWtY/BnhGmkVQgI26K5s9xEYVShayzxuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136931; c=relaxed/simple;
	bh=lk+ISCNCmH1iF4/xPxjP28h0dTFhg/544zB2DcJTjBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkPv4/eUcyYYXf+Yt6sbpRM4vD7egPANQPczxLRlnyUTGQ5OWzkgAVUFmDwToKCkNOvy1Kfo9x589TaB/FZuB4BLSCnwW8wFRGrpyK6w++JwhjJjXSc5W0wnB8Qi3mwpAhC+1E8H/vS/tjfETUmYdO5YSKXMlQ4HwEkjEU/1Fzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LB1erZTJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495DM1U3019670;
	Sat, 5 Oct 2024 14:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQGftwMcGvOmlPl/CIUlRZK1HjYdGHwKmgQbjwDqh6E=; b=LB1erZTJpXb7b7Gy
	jjiVDGKUa/4waJ3oJU2xuRrny9dj3bPf24OQYKWP6TzggEaDTRUxotz4tgoKa7/5
	+ZRvT/uSTLX1YZmxKd2a0VXOPe7ukXM4INVU+P/WYq+260GJ1T50ju7AzcI90GpQ
	ah/jR+5e6R+JG/R3FPUmpb90hlG/7aTZw46jmI/CAYqPIrfa4+63UpOAPcBTrXhZ
	FjR332ZrD/Dzh/QbBxsNoG3QMAqj4to9k+gPw6p0f6uA4PHs4f+34H87KY/AKUmd
	KkF3dESCE0xndSZH6v5M55LYKS9TisBftK9zrEDVX2up36lfHfvucbRJGqUMnhJZ
	Uy7NFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsngn6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 14:02:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495E24Sp027058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 14:02:04 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 07:02:02 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
Date: Sat, 5 Oct 2024 19:31:50 +0530
Message-ID: <20241005140150.4109700-3-quic_kuldsing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vog-XZC7Nudv1MND4PLtZr5F-Pg2ocLx
X-Proofpoint-ORIG-GUID: vog-XZC7Nudv1MND4PLtZr5F-Pg2ocLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410050103

The qcom_tzmem driver currently has multiple exposed APIs that lack
validations on input parameters. This oversight can lead to unexpected
crashes due to null pointer dereference when incorrect inputs are
provided.

To address this issue, add required sanity for all input parameters in
the exposed APIs.

Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..2f2e1f2fa9fc 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
 
 	might_sleep();
 
+	if (!config || !config->policy)
+		return ERR_PTR(-EINVAL);
+
 	switch (config->policy) {
 	case QCOM_TZMEM_POLICY_STATIC:
 		if (!config->initial_size)
@@ -316,6 +319,9 @@ devm_qcom_tzmem_pool_new(struct device *dev,
 	struct qcom_tzmem_pool *pool;
 	int ret;
 
+	if (!dev || !config)
+		return ERR_PTR(-EINVAL);
+
 	pool = qcom_tzmem_pool_new(config);
 	if (IS_ERR(pool))
 		return pool;
@@ -366,7 +372,7 @@ void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
 	unsigned long vaddr;
 	int ret;
 
-	if (!size)
+	if (!pool || !size)
 		return NULL;
 
 	size = PAGE_ALIGN(size);
@@ -412,6 +418,9 @@ void qcom_tzmem_free(void *vaddr)
 {
 	struct qcom_tzmem_chunk *chunk;
 
+	if (!vaddr)
+		return;
+
 	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
 		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
 					       (unsigned long)vaddr, NULL);
@@ -446,6 +455,9 @@ phys_addr_t qcom_tzmem_to_phys(void *vaddr)
 	void __rcu **slot;
 	phys_addr_t ret;
 
+	if (!vaddr)
+		return 0;
+
 	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
 
 	radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
@@ -466,6 +478,9 @@ EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
 
 int qcom_tzmem_enable(struct device *dev)
 {
+	if (!dev)
+		return -EINVAL;
+
 	if (qcom_tzmem_dev)
 		return -EBUSY;
 
-- 
2.34.1


