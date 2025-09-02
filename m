Return-Path: <linux-arm-msm+bounces-71487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF8B3F402
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1DCB189C1FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 04:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286132E5B1F;
	Tue,  2 Sep 2025 04:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7Jx23P4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A13E2E54BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 04:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756788989; cv=none; b=PSA29VSN5mmr5rcULygXpvKauiZEW0Jfk+FZA3ojS+fvBiMax6GLp4iArPZTXJOtyFEB85Y3WRN3xnQ+y9g5DMMITcZsi5fTGFpzahGrc79xRDlHt0KxabyxRL2p9sFnnrm4ipLx8vOHWIn2zqFxJIeAZnKSnPVE19CJIgLOGnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756788989; c=relaxed/simple;
	bh=+8dSfgrMG4eFIFtqJ20ROAswX13YmpqsL2XfyfUksAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gz0Znjp78IlY3iFOGZBGdYqvCckMTblZ6XH7ufQ0Gn7s86s+eaXZ4dKOW3aTbSB93S5xp8j8/ARn5HCnJ8+RlXfJuRt5fkjFpPyxldE11X8yQJK1Jvke2PHVWQCpAVEgO/sarMegjzNAILrFes5Y8gTcldPo9U8vp/SVchtFC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7Jx23P4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5oh025161
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 04:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=; b=K7Jx23P4OZAQr2fo
	AoDZTIxkFNqDxtNAi4dl7V0k7NeD4Eb6KdixcLg8/OUoqdtDP7JLVGnbLl/bwANz
	UX2DCly6R5Tlhv87gPz1UdXeDt7Nv5AssN5h1JbRr/N4FYXd6QNElXtYySA97Qbw
	6b8VACBFKswkoiMFzyOmDsgGli5tBf29DZZfJiTc7/Jyq9j8KrUoaf5NaLCEU2To
	rco9g2JAjBGq4Z2hpX/Uw+zt6h/j4l3SSBMky8HqSHRFfGy3UMx+g+rxx2Zh6FmJ
	lPhJ9SQAsHl+x+Z9SZho9uZSqswFN5et+9bOv/Z26VRGK5mywWYnItMgAZ9Tzxf2
	5W1d7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxjuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 04:56:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24925f21966so62031825ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 21:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756788985; x=1757393785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaTc6vdim5GJ1OsrX7tFizDxK1+T66nxGle441QICfs=;
        b=g0BCPxfFX8Q7OM17ww/lSve3leZCq9jaNavbX4qUZ6wxVDG35qG39qFP7tRtoSw74n
         mwpoiSRZedobe9jNmdNfgjqkBKBsAouThvTwWmuZz3rPbOKflYDgfvtZmQQ99kNw5O/4
         6IeY6JqGcrbXj5nyHdzQuh8oOSfyb+IJStabRKknISJJro2ccYoryJidf9BgR2hCreN9
         52FV398DB4dgd3juyMA5x4FW2jrhwV80/2bdbq1OSoaTUzkcZjpq3+5SOZD6reAVp/Jy
         8M7vdIg56/gANjmTVaeW6DsOIlU18Jhn6PEsHVtjNvvM0qabcDpLgUZ03eYrcy+Pk4VP
         AJEw==
X-Forwarded-Encrypted: i=1; AJvYcCWfgVLI9EGCNp8pQcuIkfPOJQBdJ8c2R8wkS4COSx3woGdsaq/6XkehHfGUAhhEHziVv/RYUiL8acJOiSfv@vger.kernel.org
X-Gm-Message-State: AOJu0YzjsEyI1dLDhMLMgVfuFMIDjF+wy5tPWk0v6z4EpHWkQjNiYRDe
	H0EMqSRCNvw12ifPOFeI6CLV9bVwdWDpe02r7Npcs24biPr8ZIUyMJr++LA8XfMg6UMQKUMkzax
	vUrYDQ63s/MbO7AsicCSe8EUNHew/RJaoXoEu4UWhtj9l8KLBNPc7ABkpcLHk76vzxIE=
X-Gm-Gg: ASbGncvhPsXNODBqVJc4RTGn5n8MXK384P4/RYK5cDtFtaJBq/iZ9r4KdhBsNKb98lg
	UKutPquMl5QgQtZxNMAlteknRmxwYhOs0kqOqi08YhCLzQwiHFMYYe8pZTyv3p9kybI/jHKPQ6O
	F9vnHIjl1WCfgjDdAgZXaEIwy9drKafA2Z9etKZw2/aS37F9RTaYgpd/3LA8M2bkMvnTNeJ7xgQ
	EHkZm1+y+V+P51I4dSF1xZnTFOwR2q5/KfpgXVmSk0s8W2L2NbzwxpkfuSu/3ZBd83hTysOZA9G
	Cd//m2A+jm6laV3rPwpbUi5i7jIAW0enBYfWzZ7zq4vi2gxPE27qpaYZf1KOKW+ogkFmYlQj5O3
	g3W88c+yMYdnKFvxIqw7qWcs=
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id d9443c01a7336-249448de13fmr111598165ad.13.1756788985030;
        Mon, 01 Sep 2025 21:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXaX1HfNEFgce/CqpAqiFLPHSgKmmTTu1lgTlIqGkApoJFe4/E3D7TAwWkW5ibXkmVnGac2g==
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id d9443c01a7336-249448de13fmr111597865ad.13.1756788984558;
        Mon, 01 Sep 2025 21:56:24 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b1f30a63asm1795345ad.66.2025.09.01.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 21:56:24 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 01 Sep 2025 21:55:56 -0700
Subject: [PATCH v9 09/11] tee: qcom: add primordial object
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-9-a2af23f132d5@oss.qualcomm.com>
References: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
In-Reply-To: <20250901-qcom-tee-using-tee-ss-without-mem-obj-v9-0-a2af23f132d5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX2K0pNlURoTum
 IJCpUUxNRs8aR6S6TLrWO4zMeyKtMBN757T5e7G0BwJ88CmL5+x0flb/mjYrnTOODm9UpWzh5VU
 iYfKK3zUtMvtSlcLvgjX/pMpKau34RgUtckv+tsinJ1ZfqbQr+j0nQKVlnzQ46x/58Vjg3f66ip
 CYnXZoAOeOy1bUHwE/8MRPdaeUXXy8yvb/O0qkDURJ8wBAxKWVEX672NZ5C3updEzQ/TwvhRTaF
 7PI09NYHTCfaIDm3eBoSfsWdJ1CV0QPTOSEfkFTMH+kXHtc/yBk5yJw6OkZMnqbrQSVMrJldyc5
 RxIuOxq01jvQJ8ssD+4xYQXGHkivYRSXuAVZjkNIj4pjODBR4+UntAOdKN4FoIbXZhu0O2ljmsP
 DGopDsgn
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b678fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=6dJEewf6gjddJ4Qna_sA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FeiNUZyehBP-pScvgnbvhf7iogCv3GrT
X-Proofpoint-GUID: FeiNUZyehBP-pScvgnbvhf7iogCv3GrT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

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
 drivers/tee/qcomtee/primordial_obj.c | 63 ++++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/qcomtee.h        |  3 ++
 4 files changed, 81 insertions(+), 5 deletions(-)

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
index b6931ed6f200..783acc59cfa9 100644
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
index 000000000000..0e43f04493e2
--- /dev/null
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
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


