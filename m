Return-Path: <linux-arm-msm+bounces-64735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF3B033F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 02:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BBD4189A000
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 00:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23226207A2A;
	Mon, 14 Jul 2025 00:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxN63jZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7786A200132
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752454240; cv=none; b=ioNtZmeICtenqRDeJcjzQr4wpV4wW+gWNiL1btxIIdXmLI2PD+5qHFkRd4542vtQoPWBTLjAlWTSsZ2Ua9mfnVI6VXcHc6NTIg4DWP1CJatX61I9aDccaDvxyfauDvTzNp0c5esS6JCragJRhp7KCPFYouu4RZZbXz8MphiMnFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752454240; c=relaxed/simple;
	bh=xyC4ljT6KHH2oOYe61zsOgJHkbSxs7nTcBkLYACz68c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhMvVWp89kOc9XK//0tDsQ9HNcgq6orzGUuncBYyOhoUrk98piLi+vVCF8q6zrZaR3uxsMzbu1is5HRB4RP4tXuVTo/3vmaDDsMJ2BtQBLMzxcFmjhW5tBIeM5TBhsXBN4VdbXbyM/ro+pvS8AbKWg/8KKpcJTXZhPJ9QiawMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxN63jZn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLwNLr022366
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFKZ2Vv8rP8BW5x5RLW0X2t4wnUgLw4yB1fx44K8dqA=; b=KxN63jZncXng1ECz
	+Aik3IMs99j/hx2OYbL5OS+Jf5ExdSEVFS67ucHiPTAQ/Xb3tY+OmaH0Gn4p1+ef
	cCvkBKo9QyOUkL9YxZiIAZG3saqVUvw6lrp9SntR8qgDxEnr06O0adwSvQHDrEqn
	4wRvddDT2LYA8efFfNjG4tZM0X3IbFKCnk9aoozHRuFikHUAUUM5KTBhNag2F9F3
	zgiHsnMCDgPPFpUrXxwkLjHsziGu08bXfFCk8KcfjLre7xQfeYqqZohykOhxhyTj
	B78jkAzxANUnzZB64Uc8A//+4v/ULR3PMuW3l88aUCOd7NaUwAdwfLIcmLBc5yi6
	F8AQNA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvxauhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 00:50:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237f8d64263so37540385ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 17:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752454236; x=1753059036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFKZ2Vv8rP8BW5x5RLW0X2t4wnUgLw4yB1fx44K8dqA=;
        b=nZhRrpp3vYOcaizKECWAG00ZkM70bqWcM2UW8j59FvLfwpFiZIAFbHRGN3iAnIJX7h
         Lb9YcoTz9m2nkChUOu/u8J8rkCoVLnRtCTWKEshuXN8DBAqfpWsG8hAQ53sVxmGVDb+9
         27d0IlQPra04HqAiLH9u6xiMQSqYs+fCEBHGIlXUoUpBulbDTh5ZknFgtN67J0XQFhpJ
         mHgOMza2AD4FB+tJEgOScpfZudNMo3icw0RHcTDj3QZKh1HOpVAU25CSAmj+8TQ3iS4a
         uU2qFZ3B117diIwEKhSgigqTG7+TGfs6CqLPlvFsirrFEjcXvPWr1SxzQBmCQ/Q7AlzN
         Q5dA==
X-Forwarded-Encrypted: i=1; AJvYcCV74ERisbSADpl/yyq6e8izo5CZCniRO+p9wlRbVE0SI+2YsD2rvcKsqUWxttnvdjJFDE6BTP5LqkeOI6tC@vger.kernel.org
X-Gm-Message-State: AOJu0YweViUINvqu6bAbIYfL0vTzSVNxAdIQnJNkFwYb2WhnnkJN4Pdh
	H1LDOZFfxoj5ogUkn7p2odvV4vpy1RRaHhhM+MvpqdscEHCcYTecpEX6FPBZb27O/gqLwjHReBc
	RN8Pm8YaJ3tkrOOukYSrZcpbVDUGQSaHC42JtBbxtWs4fb799FtLQzEGT2YDA+b2SAyc=
X-Gm-Gg: ASbGncvPT8D1jPlTG4Uazjq2Mvos0cgcsXdI2e4zPv8rLN0If0w+TPCZSGjO3aajHMd
	QA6AeAvag1cKgd9zpzmbKkfTPogToESTnaEuZmJWGNtiqRB4s1ItZQzzwbKlnsVkks+km8cWFiy
	Qc9dEn4beiX+n4gVQMoCytKrwodHlQZ9kZTaVgvyJSNN7PneAAZwBYA5D64rUQWXApuBGZ3wY/k
	Um1L0GdJsyUp6UJGJu3PMIwcsO+5uSgt142hY22EAXg+X4ALLlj2m7lpcYnJn5+WrZO0YimopC4
	JegzshW99oHPoc7W0yh/iL2pGiiqK3enPFTQo7Q7YDsswpoQZF3Ek5/Bx/reaQKxNx12BaS+/n8
	JIjy3/HXhU0teNwGEZBIy8Z8=
X-Received: by 2002:a17:903:1987:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23df083b061mr146286165ad.21.1752454235569;
        Sun, 13 Jul 2025 17:50:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWE63CUT+mV4eFI/L/OI3mlg28dVXCWxHTZWUfahh4Pbw8pKLIOS3+I2QJimL01ku9B4lVgQ==
X-Received: by 2002:a17:903:1987:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23df083b061mr146285835ad.21.1752454235146;
        Sun, 13 Jul 2025 17:50:35 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de428473fsm87562605ad.13.2025.07.13.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 17:50:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 17:49:22 -0700
Subject: [PATCH v6 10/12] qcomtee: add primordial object
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-10-697fb7d41c36@oss.qualcomm.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-0-697fb7d41c36@oss.qualcomm.com>
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
X-Proofpoint-GUID: oKXlqnROlIqQ0p1DkHS6mKP_ULQRFkpG
X-Proofpoint-ORIG-GUID: oKXlqnROlIqQ0p1DkHS6mKP_ULQRFkpG
X-Authority-Analysis: v=2.4 cv=achhnQot c=1 sm=1 tr=0 ts=6874545c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAwMiBTYWx0ZWRfX0xU+FKKaE9hX
 XQPMoJn25S2q+B6jF/sP1ho6IARHZdXjePDVb87sxfnJguy5Dvg26rQ9Kxn9Ptgn/n5t//IpSWd
 npAk6bXttpQ4sVkXwspsyRsq384JjOWsu+nzKIt8IWGa2mnbtCYhifzxXa+94zKVSvm61C2p7WA
 KRdYwemAjirodD95zC6KfhkuJlfHkha3HG6Ml657CrKxVa54eboxm1JPHhfDvqUFbOTu6vuc35H
 q34MlwDkac25bHoVDSW2AoU9niK2IkHp3fOJ2lbA784f7ISlrge/tUvoEyo0XknJykT1Z2pyGv3
 cdG56XXtJR5KlXIZFctgW+Cgg5cznqnmlyyBzbKEU0BTU1w+FUVj/mE93EIBtgVMCo+HTwlun5S
 t9vQHUO7taQ4byei8K8XkY0MJG4szWE6rHqxbTmo3qsABJ+AxROlnRrbBGv8pHuKGK5s7B0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140002

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
index 46a5ca95b7a9..9491f5aae4e1 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -30,10 +30,12 @@ int qcomtee_next_arg_type(struct qcomtee_arg *u, int i,
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
@@ -156,7 +158,9 @@ static void qcomtee_object_release(struct kref *refcount)
  */
 int qcomtee_object_get(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		return kref_get_unless_zero(&object->refcount);
 
 	return 0;
@@ -168,7 +172,9 @@ int qcomtee_object_get(struct qcomtee_object *object)
  */
 void qcomtee_object_put(struct qcomtee_object *object)
 {
-	if (object != NULL_QCOMTEE_OBJECT && object != ROOT_QCOMTEE_OBJECT)
+	if (object != &qcomtee_primordial_object &&
+	    object != NULL_QCOMTEE_OBJECT &&
+	    object != ROOT_QCOMTEE_OBJECT)
 		kref_put(&object->refcount, qcomtee_object_release);
 }
 
@@ -260,6 +266,9 @@ qcomtee_local_object_get(struct qcomtee_object_invoke_ctx *oic,
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
index 000000000000..025346cde835
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
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
index ae82e7747c90..4253bf49f31b 100644
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


