Return-Path: <linux-arm-msm+bounces-34317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1A99C926
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 72F54B21853
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F801AAE2E;
	Mon, 14 Oct 2024 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YpNkJ+u/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C1B1AAE1C;
	Mon, 14 Oct 2024 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904548; cv=none; b=A82V6y/G0M0eq/AmZlblYPYys09LqLli1SpyzxgGn0RNUuyYg8zyyjsxjFUWazQKElJvKQtig0NQMZ0ijtL/maE1UfTlNF1ZJ1u+5sEWVBfzM2g8LkL5q4v2uyn+WJcwEatqdehZ5MBXe4l0qT0EPo3MvNolCnCpT9NgLVAF6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904548; c=relaxed/simple;
	bh=xr45fFqc1gMer3lDp6WwB/kdB92RxiFR6kohxICAQrk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdWFoTwQIKNafdN0VZNQJ85uvoH2Vsr98UpXlslwGvgqDh6rXtJ8NP0n1PvpLLjQuhC5AVdoRtAzDjwasOVQWLMkOCDM+ZKjvFIQucfsXXF1QhfjOEy688CvC6yDly9PEsMa8YWMSz+78LusWsIduDYu8znZxIQHMVPdY4y0RmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YpNkJ+u/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAXPu3013148;
	Mon, 14 Oct 2024 11:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLWb6Om8R2ZyMoHQGhEblj//9SZFIkymB14rtGCcFro=; b=YpNkJ+u/NWHbNOHE
	ack2M1dBkhk0vmrP+LGA7A9KJU2L9kIpZ57Ox2Oc4kb5JAwbdfuydFsmQ49jIjdb
	+1vPpzxRmBewHGRber+wSMyipFfX2HC3LnSH858triVjB7hKkImL595IAR8cxT20
	R1bsVHCqgDCA1uDBW1HFnPSikn/1cCnUpaytdEHNC/0pPmoCpnxTj724ZqcHAFbQ
	gWql9GpLRIZ5wPnlldA/MTduc73aNc2+wnDiqF5h80mLCJVOPN1lI0Vczh0stKQD
	BZ1CCEaObJ3drEIiY3z1DK/7NxW6SaN6xk6o7nrJZE16u1OT2aHTRYPUwAv5pFtd
	GUZcUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427efncdkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EBFgxh030960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:42 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 04:15:40 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] firmware: qcom: qcom_tzmem: Implement sanity checks
Date: Mon, 14 Oct 2024 16:45:27 +0530
Message-ID: <20241014111527.2272428-3-quic_kuldsing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SZc445PLYuEnqjRQ7YqfjwymXp8YfFGH
X-Proofpoint-ORIG-GUID: SZc445PLYuEnqjRQ7YqfjwymXp8YfFGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140081

The qcom_tzmem driver currently has exposed APIs that lack validations
on required input parameters. This oversight can lead to unexpected null
pointer dereference crashes.

To address this issue, add sanity for required input parameters.

Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
---
 drivers/firmware/qcom/qcom_tzmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..977e48fec32f 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -203,6 +203,9 @@ qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
 
 	might_sleep();
 
+	if (!config->policy)
+		return ERR_PTR(-EINVAL);
+
 	switch (config->policy) {
 	case QCOM_TZMEM_POLICY_STATIC:
 		if (!config->initial_size)
@@ -412,6 +415,9 @@ void qcom_tzmem_free(void *vaddr)
 {
 	struct qcom_tzmem_chunk *chunk;
 
+	if (!vaddr)
+		return;
+
 	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
 		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
 					       (unsigned long)vaddr, NULL);
-- 
2.34.1


