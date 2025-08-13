Return-Path: <linux-arm-msm+bounces-68858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1398B23D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 02:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0E96E5236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 00:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D983514EC62;
	Wed, 13 Aug 2025 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dyRUUEtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D141F4703
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755045436; cv=none; b=PCvjYWzlUw2NXBtVhbAXgqoEAM7ScX7Bbrx7CkhtPLYoKZjtIahg2+KNr/k9vEGXeRlzqitk4gV7faRHGE1y2PTP68gDF437qHaYbHP6WMpwi4NjwL7GMUqhIF7rZJwQim9Ntw7tTN9UoFinYbaVjSop/uUaeSDhfcD/0lrqQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755045436; c=relaxed/simple;
	bh=O53oCjVOWFRQhjWHjt+4P5FEAFT625NmeW0TBuS/Eqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSFv0loQrogWjEygBetqbrFt8XRhX/V7iuCuszqVulDnc5tiaSUN2uTKoLgrU22nAGjLhZbCjR3g/zsEZtMJI4orUwHSdGNcbB12ld0PpA9uu0vTOnXu8M8iLv0807xYc3aj2l9HfHtCUc82KGe8zWT2vNbiYg3eraZmPz1jliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dyRUUEtl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CKATRf012913
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6+xxwSKNpqZLnnngK2iH6cMzG+P3jkkyP7YphG9EiKQ=; b=dyRUUEtlpPiZfYXI
	B4QwBXfkzetvoj3MJXwTKVIl3KvQHjI+fxcu/pToqwBwZ171o3NbiyXXYQSFgfhW
	tvHopc6Vzp/7xoZ/M7/sRHu4w3oI9Y5mmAQXWj7O+ib3IGs+dSBai9FucSr7MV/c
	Hb3/vLosfqt2o1J+Zhhgha8WPv0GE8Lyb4rshh18XNBwVkhYA2aStbL5AgPkAJrY
	GOLJ7mrS8miHdXNmmoO6hoyU48FTNHO/ukoqhBMJC5ltRRWtr9TqGnWauyzyU5LY
	Kr3/qvOgM0UcSQ4aOuwHLJm8IzT+XVTU7i/GmD+B2FqEt1dtXHBP8zPjx37nS91b
	o2k8rg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbd356-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:37:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-321a3669ba4so4157687a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 17:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755045433; x=1755650233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+xxwSKNpqZLnnngK2iH6cMzG+P3jkkyP7YphG9EiKQ=;
        b=tegeIVeas6EFa1mDhtGIsnGsMUn6pxwWjNJw0h9VYhis1HQmpavT/LvPpQIz3OO+Q6
         EnuwGWBQsteeJFZ2YGZ0CJL0eXhMPJtJhDTBXtOI2HQgZydJt0MbuMNMOuz8OyQ2L93V
         f4zAoh5LAAebmbTX8qWgcfkuMVNTv5gjNyk8NknqIX646/cItpJEGuX+BYHGOgJkmjkL
         9umkQIecMDpTGnfBMlhcRD283mrnobe5vVKSm20JNKLwykgYX+/SQo1VHE5c+ePAMjK7
         KzFJ4acffjhr2QNvD5u+251CMtiFqHv878lrmtiDrvw/Kj2tjY/iFLwEv0fn2rZ1Lbv3
         X3PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpCsCyTSY33WaIdtlclIbMbkq+1xhceOVs6maX8xZ0knpK5jVk/ivPs1HAsdEaPuNBvJ05/AXYtDWXxfes@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOWbPp24EAcAbxwjhuyDzcciifSb5sIjX/1532QtUT52LGlvA
	/rXoquAXSBXfhgyyds9vFKpl1c0HSihnqwJATOyWt8o2zBXBjRYmOnG4aEjLizFEuvzY1bx0CbB
	cQltY22MNXnryV+SIRpi18x+MauaX0qt5nwExXtLiIJLcJACWr0ruzTs5haGgFjMK7Yo=
X-Gm-Gg: ASbGncv60NnS5RC0KNXjE5QphXFdAwjxiYzWbL6sSwh+2pqfP8fxjkI0ZKYbLdRA7ep
	Zv2LSe2yXeSuVU7bWr/jmz55iAXAL0D0oCUSdGdF821DqkKt5EJD4TIuYwiAC/VJkZSWEK+gpqr
	Elh+LZl6Jliwg76xC18I+tPyPWvP49B096DfSNtKYLRN6kDulGNDuZrVUeb3P6XYv6P9n/BoTKj
	osq6QOWqBmBQXEXSNLZ2V3H9dXcvHfA6ttMQJ6dTo1xxB4hM63l6VVLCUT/U+MdeXN0Q8T9msYn
	0LRvaqQapjhO8c/vpDbyZtgwqO04Pz1nq0GfllIbL/VVomcYxFewJTVxuMNbEwLvbNjxWy/0eZ4
	00fkkfmpSw8yQ7ug0AbN7dmI=
X-Received: by 2002:a17:902:d48d:b0:240:80f:228e with SMTP id d9443c01a7336-2430d21d507mr16719425ad.52.1755045433469;
        Tue, 12 Aug 2025 17:37:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8i8EynRFCyIKJFpe6TlZ6plHoRJ1fRFvTsjRThmN5ggZyOGDgU+lkaJqS2YMALD+4ZNq6rQ==
X-Received: by 2002:a17:902:d48d:b0:240:80f:228e with SMTP id d9443c01a7336-2430d21d507mr16718925ad.52.1755045433001;
        Tue, 12 Aug 2025 17:37:13 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8975c89sm308781585ad.96.2025.08.12.17.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 17:37:12 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 17:35:38 -0700
Subject: [PATCH v7 09/11] qcomtee: add primordial object
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-9-ce7a1a774803@oss.qualcomm.com>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689bde3a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX2QJ6mmHfUgeX
 Y3IAMAP+kSiaEZ4nWPGQJy5jYpgeKHAb7gE1Q1s8y8TpRTjxruXHyjBinJoFh3J4iyV7QipTG+/
 qpOHbcYYFt9KrhQc6b1NADtYVdrz/2vK8L35kPphBlorhJ0TEXacjQXZwQjJhNLcriqB3dJD3Nt
 wBjv1kVhlzsxtFZGFJJEcgDb2YXwNjBiwR4xcUxA/aze8ExDNIaeH+5TCEDMPk5k3FFuDQaOPc/
 M0tgwE6v25eCLJaAScO9Effz6vZbCdkWQABHVnGBVlp8HwbryB910eGp43mV2DFWCW1HV84qy0e
 OBjZmrC1BhU1FwMYQ04MYM+aAPO8fCZN9pePL2duXkSO+YmQL3AUDEVgT+KA+4N8c8COtakaquq
 V1ciuWGS
X-Proofpoint-ORIG-GUID: hQ57lw62b8PKfy3pngxgHh2H0xYehxpO
X-Proofpoint-GUID: hQ57lw62b8PKfy3pngxgHh2H0xYehxpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

After booting, the kernel provides a static object known as the
primordial object. This object is utilized by QTEE for native
kernel services such as yield or privileged operations.

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile         |  1 +
 drivers/tee/qcomtee/core.c           | 19 ++++++++---
 drivers/tee/qcomtee/primordial_obj.c | 66 ++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  3 ++
 4 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 600af2b8f1c1..78f8e899d143 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,5 +3,6 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += primordial_obj.o
 qcomtee-objs += shm.o
 qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 6d28138ef266..e1ea2c5eaff5 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -31,10 +31,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
 }
 
 /*
- * QTEE expects IDs with the QCOMTEE_MSG_OBJECT_NS_BIT set for objects
- * of the QCOMTEE_OBJECT_TYPE_CB type.
+ * QTEE expects IDs with QCOMTEE_MSG_OBJECT_NS_BIT set for objects of
+ * QCOMTEE_OBJECT_TYPE_CB type. The first ID with QCOMTEE_MSG_OBJECT_NS_BIT
+ * set is reserved for the primordial object.
  */
-#define QCOMTEE_OBJECT_ID_START (QCOMTEE_MSG_OBJECT_NS_BIT + 1)
+#define QCOMTEE_OBJECT_PRIMORDIAL (QCOMTEE_MSG_OBJECT_NS_BIT)
+#define QCOMTEE_OBJECT_ID_START (QCOMTEE_OBJECT_PRIMORDIAL + 1)
 #define QCOMTEE_OBJECT_ID_END (U32_MAX)
 
 #define QCOMTEE_OBJECT_SET(p, type, ...) \
@@ -157,7 +159,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -169,7 +173,9 @@ int qcomtee_object_get(struct qcomtee_object *object)
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 
@@ -261,6 +267,9 @@ qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
 	struct qcomtee *qcomtee = tee_get_drvdata(oic->ctx->teedev);
 	struct qcomtee_object *object;
 
+	if (object_id == QCOMTEE_OBJECT_PRIMORDIAL)
+		return &qcomtee_primordial_object;
+
 	guard(rcu)();
 	object = xa_load(&qcomtee->xa_local_objects, object_id);
 	/* It already checks for %NULL_QCOMTEE_OBJECT. */
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
new file mode 100644
index 000000000000..df94fbf5f141
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/delay.h>
+
+#include "qcomtee.h"
+
+/**
+ * DOC: Primordial Object
+ *
+ * After boot, the kernel provides a static object of type
+ * %QCOMTEE_OBJECT_TYPE_CB called the primordial object. This object is used
+ * for native kernel services or privileged operations.
+ *
+ * We support:
+ *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
+ *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
+ */
+
+#define QCOMTEE_OBJECT_OP_YIELD 1
+#define QCOMTEE_OBJECT_OP_SLEEP 2
+
+static int
+qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				struct qcomtee_object *primordial_object_unused,
+				u32 op, struct qcomtee_arg *args)
+{
+	int err = 0;
+
+	switch (op) {
+	case QCOMTEE_OBJECT_OP_YIELD:
+		cond_resched();
+		/* No output object. */
+		oic->data = NULL;
+		break;
+	case QCOMTEE_OBJECT_OP_SLEEP:
+		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
+		if (qcomtee_args_len(args) != 1 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_IB ||
+		    args[0].b.size < sizeof(u32))
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
+static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
+	.dispatch = qcomtee_primordial_obj_dispatch,
+};
+
+struct qcomtee_object qcomtee_primordial_object = {
+	.name = "primordial",
+	.object_type = QCOMTEE_OBJECT_TYPE_CB,
+	.ops = &qcomtee_primordial_obj_ops
+};
diff --git a/drivers/tee/qcomtee/qcomtee.h b/drivers/tee/qcomtee/qcomtee.h
index f34be992e68b..084b3882017e 100644
--- a/drivers/tee/qcomtee/qcomtee.h
+++ b/drivers/tee/qcomtee/qcomtee.h
@@ -140,4 +140,7 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 			       struct tee_param *params, int num_params,
 			       int req_id, int errno);
 
+/* (2) Primordial Object. */
+extern struct qcomtee_object qcomtee_primordial_object;
+
 #endif /* QCOMTEE_H */

-- 
2.34.1


