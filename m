Return-Path: <linux-arm-msm+bounces-39999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7289E1244
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F845282978
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0112188701;
	Tue,  3 Dec 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mX9ReGUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F315FD01;
	Tue,  3 Dec 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199626; cv=none; b=cs0y/i5zxvuIQ9eG0NhVqFlC7i9jsTjaMVxQQPqybZjjAj+m2gfe8VbYKoRcOhKM2FVUa0Ah/6/Djtd/VRSGmGgA+5mJvhH1YD6msolkDbzklPXsiPG6QVDKkj1xtu5MP1t+M6+d0Lvv2Gg9D7d9xlCFylQVH6Pn15BigzCem1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199626; c=relaxed/simple;
	bh=4Ip/eYMJTKWmEjDinKD9UL0HIK6h/JR0O4OY7QZiKM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E2ofD8P9nuJav769KrWBhUZ5ZnJsdSaHqkJPtYiQ8HodlnooU3FPMiLENIyb4Rt2DlLFiaOvy04a+LJRq2cAyeoPoDBwC8wydmBH7zOq43jbqmzkBzgRTdWapDC5IM2rtOipZzkmrVmnk0eKl4DR2FCWoC8ZmCu9JAMMSvGxU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mX9ReGUt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2KfxWX011526;
	Tue, 3 Dec 2024 04:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pW94t0mQwR/YAdL0hlJgtjMU3iWcKHn55GbIYlcqUM=; b=mX9ReGUt+pO77iN5
	ouFA0Sdwe1RgQoC2CtHk8hoHo9v7rdB7Aa1x0KG2OZxJ8iknn/2Y8W3vnzQu6ROp
	mD5ZjS/eBWiNzlR37WKRbOHnowwAfdYorHNJ3vvt0NxCXQhcrUAiALFe0FSFaDNA
	Zs0s6RHtgQIwKVECB3/jZsTQVTXojn79b9af9bqYnnwUZdf24D6b9H3xqZQt54KW
	kXITdZL2sAgRJpZy3f0B8Vn4dgp07wyTFLQALyFJLjkBw7Nt5XTc9K6ZZ2vRI926
	Q2tBDLfNwErcULQqMkeRvmIaJdbth41n7TFl0slBNqtWNCRZxAoTa42iwrpk2xGQ
	lwiTKw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4393mpbqre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K7vE024250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:07 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:06 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Mon, 2 Dec 2024 20:19:22 -0800
Subject: [PATCH 06/10] qcomtee: add primordial object
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-6-f502ef01e016@quicinc.com>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wQdIXnWhvwQwx4MFC-ExCuKmECqWa2Vg
X-Proofpoint-GUID: wQdIXnWhvwQwx4MFC-ExCuKmECqWa2Vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030034

After booting, the kernel provides a static object known as the primordial
object. This object is utilized by QTEE for native kernel services such as
yield or privileged operations.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/qcomtee/Makefile          |  1 +
 drivers/tee/qcomtee/core.c            | 12 +++++--
 drivers/tee/qcomtee/primordial_obj.c  | 63 +++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  5 +++
 4 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 7dc5e6373042..108bc7fdabcb 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -2,5 +2,6 @@
 obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index a949ef4cceee..79f1181cf676 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -34,9 +34,11 @@ int qcom_tee_next_arg_type(struct qcom_tee_arg *u, int i, enum qcom_tee_arg_type
 }
 
 /* QTEE expects IDs with QCOM_TEE_MSG_OBJECT_NS_BIT set for object of
- * QCOM_TEE_OBJECT_TYPE_CB_OBJECT type.
+ * QCOM_TEE_OBJECT_TYPE_CB_OBJECT type. The first ID with QCOM_TEE_MSG_OBJECT_NS_BIT set is
+ * reserved for primordial object.
  */
-#define QCOM_TEE_OBJECT_ID_START	(QCOM_TEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOM_TEE_OBJECT_PRIMORDIAL	(QCOM_TEE_MSG_OBJECT_NS_BIT)
+#define QCOM_TEE_OBJECT_ID_START	(QCOM_TEE_OBJECT_PRIMORDIAL + 1)
 #define QCOM_TEE_OBJECT_ID_END		(UINT_MAX)
 
 #define QCOM_TEE_OBJECT_SET(p, type, ...) __QCOM_TEE_OBJECT_SET(p, type, ##__VA_ARGS__, 0UL)
@@ -118,7 +120,8 @@ EXPORT_SYMBOL_GPL(qcom_tee_object_get);
  */
 void qcom_tee_object_put(struct qcom_tee_object *object)
 {
-	if (object != NULL_QCOM_TEE_OBJECT &&
+	if (object != &qcom_tee_primordial_object &&
+	    object != NULL_QCOM_TEE_OBJECT &&
 	    object != ROOT_QCOM_TEE_OBJECT)
 		kref_put(&object->refcount, qcom_tee_object_release);
 }
@@ -209,6 +212,9 @@ static struct qcom_tee_object *qcom_tee_local_object_get(unsigned int object_id)
 {
 	struct qcom_tee_object *object;
 
+	if (object_id == QCOM_TEE_OBJECT_PRIMORDIAL)
+		return &qcom_tee_primordial_object;
+
 	/* We trust QTEE does not mess the refcounts.
 	 * It does not issue RELEASE request and qcom_tee_object_get(), simultaneously.
 	 */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..9065074b02e6
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+#include "qcomtee_private.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After the boot, REE provides a static object of type %QCOM_TEE_OBJECT_TYPE_CB_OBJECT
+ * called primordial object. This object is used for native REE services or privileged operations.
+ *
+ * We support
+ *  - %QCOM_TEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOM_TEE_OBJECT_OP_SLEEP to wait for period of time.
+ */
+
+#define QCOM_TEE_OBJECT_OP_YIELD	1
+#define QCOM_TEE_OBJECT_OP_SLEEP	2
+
+static int qcom_tee_primordial_object_dispatch(struct qcom_tee_object_invoke_ctx *oic,
+					       struct qcom_tee_object *primordial_object_unused,
+					       u32 op, struct qcom_tee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOM_TEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOM_TEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOM_TEE_OBJECT_OP_SLEEP op. */
+		if (qcom_tee_args_len(args) != 1 ||		/* Expect 1 argument. */
+		    args[0].type != QCOM_TEE_ARG_TYPE_IB ||	/* Time to sleep in ms. */
+		    args[0].b.size < sizeof(u32))		/* Buffer should hold a u32. */
+			return -EINVAL;
+
+		msleep(*(u32 *)(args[0].b.addr));
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	default:
+		err = -EINVAL;
+	}
+
+	return err;
+}
+
+static struct qcom_tee_object_operations qcom_tee_primordial_object_ops = {
+	.dispatch = qcom_tee_primordial_object_dispatch,
+};
+
+struct qcom_tee_object qcom_tee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+	.ops = &qcom_tee_primordial_object_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index e3e4ef51c0b2..c718cd2d8463 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -44,4 +44,9 @@ int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
 				struct qcom_tee_object *object, u32 op,	struct qcom_tee_arg *u,
 				int *result);
 
+/* OBJECTS: */
+
+/* (1) Primordial Object. */
+extern struct qcom_tee_object qcom_tee_primordial_object;
+
 #endif /* QCOM_TEE_PRIVATE_H */

-- 
2.34.1


