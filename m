Return-Path: <linux-arm-msm+bounces-52704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB3A7428F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 03:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54803BF42D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 02:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88E76212FA3;
	Fri, 28 Mar 2025 02:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7/A1kF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF2120E318
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130117; cv=none; b=TNDnhScu9ahq1IsZ+EjAUWxpPbQaOUVwtQMp2ayqhGQzNYqaTs6PfOaCuuC1iRPhnegYFO4PCMDSIKvi7QV3LPYrMDG4oYYFzkduputxz7cTMCb4Jhu/FcOTJ3zPJ8tNuMsqLgw6Jj4MDiVzUoXOxnS3tLLXNXiKWEqfrE6ed2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130117; c=relaxed/simple;
	bh=JAfFICI1h2E0m0ZLZgjQaouuv3KPSX6GNQ9RcCRg7L0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTp9TAZSVMW/TcrDEfUO3jwTmpIPDZPcEQvgi6p9ETyb39p+XbA6DuRWQO4TGTMcruh1rcJpv8wcGiCzObPyxZdtXY9sgFM2AxNzmE0xuo5gAljmEr2IhOc19KyMrXSQ8n84KV9o8Vvrf2LWN1STsRV6dIxaDCk6E6U/mwzdCB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h7/A1kF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RF5Lc2002244
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cywCV0UI/99cMUcGzgtZIV7OPV4G7gmWrKgmTHP4Do0=; b=h7/A1kF97af9XQ8/
	wmrIH8P0wG54WJ9w43448QTiU1jG9S8ruwPNfabSDG2vzcH/evu1WdKyh/bfi6hI
	B/+XiOwYlyeem5QKqu93P8xyWXbfBLMzRGEHmXqqq5OfIZA6+pgwjVsZe32esEi1
	EjTmuHuRS0hJ0VoZ8qUd0AoaACKBlzzakXOFhDwERVjjswAKOOAT/YlZDBaXmfar
	P05HllDJJ8w/sQpw6ZGMp0mw0he4Su840qCPOfMro/hRxSPuQi0V9eeuSs5gg116
	qA9h4IzPh4pETgRIuWQPQDbVEBtUCsq8X/tdSZ/goVnvEQXyu+fjXJMddkmOErW1
	/ZEmhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe03x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a96112fso49898015ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 19:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130113; x=1743734913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cywCV0UI/99cMUcGzgtZIV7OPV4G7gmWrKgmTHP4Do0=;
        b=QgMowShSxZYoUzSm5abRRDBecrK3TSD9FNXAO8zWXkY1XNhk2O7wis6GbP5dYwQ4c7
         cnmVnc2A0eYnXnyPnH094qcXTYr9swEyO+KR9IUrP0xodvUS95FvoSaRACVKJxvIyKeK
         DJNSf+uOe3NEOV6JxCQtESNZWPtAoO6yXmvrns2OSTlFKWMfs3JalsnUuPPV7rqP5GoN
         X6Cl6sB03jZCKxLYH+1Ni4PeK7e6gQY7H9iSNnokp/DVYDghU24BUfKmHCSIwhU09JjF
         /Qzf1vSUu8iePQ5OIZHXYLl6Vd+G7Nz6J+rXmHSvMqKl7z2bU7ChXl44hS6g2nCjd0N9
         ndAA==
X-Gm-Message-State: AOJu0Yxf99uEZ5JGZ9neo5HvsjjYe/S1lG1iE5M1PbJEDGNm3bVEk//q
	OlVIM44rcSus5CG7i+jEBx81vZlIvuHN3A6gdK39DMWyjZAADmy3CBq+4yheHfV0Z7NAGjMSj/L
	XhX0Z1Ncs0WSEJKMZGz2FeSL2GgIouz5SJWuYSCSH/LayJJxCTt/TjCUvpwlXgCs=
X-Gm-Gg: ASbGncuZCOqxfp5CgX3X8crlNNMEVmikN7daRty598gZ05HveNRSQEsSZHDd7HtNblB
	VQG3r/jjZdmepPHXk1tTT7OHQpa9cd4n5uEWhrQC87VW64koAoXl3q7LlW+cI7T+BoLEc2Y06Du
	NGJQSnyIwc+IUEMzskvH6S+WOjnMs/1p/pedI6roA8qUeqCMlj4aCGnWPDH9nSKA+V3amL5Ak+U
	4lkBP5AwCIMnRkpV0zIxi9Djy7XwFLSDpvPeG6aVbhST46/hhWLWwuc7ISegvLeo47pwb3+5HEP
	DHm6lqjqQ97NxXaW/nKog3ozbqXxw1jSzg562jYbSwXVC3vauBAwvihvlwaLDxodMAwrgiJCqh4
	=
X-Received: by 2002:a17:903:22c4:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22804851debmr92298235ad.15.1743130112535;
        Thu, 27 Mar 2025 19:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERwvnEI1xM4UEFmvVzBOxWuyTmtVuWMhqVc0CEuOJFL1SoTg8xXZ7LidVdO3cvboLaF+3+3A==
X-Received: by 2002:a17:903:22c4:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22804851debmr92297705ad.15.1743130111860;
        Thu, 27 Mar 2025 19:48:31 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:31 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:32 -0700
Subject: [PATCH v3 10/11] qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-10-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: FaSxy3YpFXXAtp1T-rl3wsK5lVBnuzhP
X-Proofpoint-GUID: FaSxy3YpFXXAtp1T-rl3wsK5lVBnuzhP
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e60e02 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=OR1utrCcES5rRZ7Z870A:9 a=GAZ-Hd6mDwwK4bQw:21 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

Enable userspace to allocate shared memory with QTEE. Since
QTEE handles shared memory as object, a wrapper is implemented
to represent tee_shm as an object. The shared memory identifier,
obtained through TEE_IOC_SHM_ALLOC, is transferred to the driver using
TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT/OUTPUT.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/qcomtee/Makefile          |   1 +
 drivers/tee/qcomtee/call.c            |   8 +-
 drivers/tee/qcomtee/mem_obj.c         | 172 ++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/primordial_obj.c  |  51 ++++++++++
 drivers/tee/qcomtee/qcomtee_private.h |  39 ++++++++
 drivers/tee/qcomtee/shm.c             |   3 -
 6 files changed, 270 insertions(+), 4 deletions(-)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index a3a2d00e83f0..6cb9fd38dc67 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
 qcomtee-objs += call.o
 qcomtee-objs += core.o
+qcomtee-objs += mem_obj.o
 qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index f7f5c2c0bebb..6b0380a26419 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -136,8 +136,11 @@ int qcomtee_objref_to_arg(struct qcomtee_arg *arg, struct tee_param *param,
 	/* param is a QTEE object: */
 	} else if (param->u.objref.flags & QCOMTEE_OBJREF_FLAG_TEE) {
 		err = qcomtee_context_find_qtee_object(&object, param, ctx);
+
 	} else {
-		err = -EINVAL;
+		err = qcomtee_memobj_param_to_object(&object, param, ctx);
+		if (!err)
+			qcomtee_object_get(object);
 	}
 
 	arg->o = err ? NULL_QCOMTEE_OBJECT : object;
@@ -181,6 +184,9 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
 		if (is_qcomtee_user_object(object))
 			err = qcomtee_user_param_from_object(param, object,
 							     ctx);
+		else if (is_qcomtee_memobj_object(object))
+			err = qcomtee_memobj_param_from_object(param, object,
+							       ctx);
 		else
 			err = -EINVAL;
 
diff --git a/drivers/tee/qcomtee/mem_obj.c b/drivers/tee/qcomtee/mem_obj.c
new file mode 100644
index 000000000000..27af9ee946cb
--- /dev/null
+++ b/drivers/tee/qcomtee/mem_obj.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/mm.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#include "qcomtee_private.h"
+
+/**
+ * DOC: Memory and Mapping Objects
+ *
+ * QTEE uses memory objects for memory sharing with Linux.
+ * A memory object can be a standard dma_buf or a contiguous memory range,
+ * e.g., tee_shm. A memory object should support one operation: map. When
+ * invoked by QTEE, a mapping object is generated. A mapping object supports
+ * one operation: unmap.
+ *
+ *  (1) To map a memory object, QTEE invokes the primordial object with
+ *      %QCOMTEE_OBJECT_OP_MAP_REGION operation; see
+ *      qcomtee_primordial_obj_dispatch().
+ *  (2) To unmap a memory object, QTEE releases the mapping object which
+ *      calls qcomtee_mem_object_release().
+ *
+ * The map operation is implemented in the primordial object as a privileged
+ * operation instead of qcomtee_mem_object_dispatch(). Otherwise, on
+ * platforms without shm_bridge, a user can trick QTEE into writing to the
+ * kernel memory by passing a user object as a memory object and returning a
+ * random physical address as the result of the mapping request.
+ */
+
+struct qcomtee_mem_object {
+	struct qcomtee_object object;
+	struct tee_shm *shm;
+	/* QTEE requires these felids to be page aligned. */
+	phys_addr_t paddr; /* Physical address of range. */
+	size_t size; /* Size of the range. */
+};
+
+#define to_qcomtee_mem_object(o) \
+	container_of((o), struct qcomtee_mem_object, object)
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops;
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object)
+{
+	return object != NULL_QCOMTEE_OBJECT &&
+	       typeof_qcomtee_object(object) == QCOMTEE_OBJECT_TYPE_CB &&
+	       object->ops == &qcomtee_mem_object_ops;
+}
+
+static int qcomtee_mem_object_dispatch(struct qcomtee_object_invoke_ctx *oic,
+				       struct qcomtee_object *object, u32 op,
+				       struct qcomtee_arg *args)
+{
+	return -EINVAL;
+}
+
+static void qcomtee_mem_object_release(struct qcomtee_object *object)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Matching get is in qcomtee_memobj_param_to_object(). */
+	tee_shm_put(mem_object->shm);
+	kfree(mem_object);
+}
+
+static struct qcomtee_object_operations qcomtee_mem_object_ops = {
+	.release = qcomtee_mem_object_release,
+	.dispatch = qcomtee_mem_object_dispatch,
+};
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object __free(kfree) = NULL;
+	struct tee_shm *shm;
+	int err;
+
+	if (param->u.objref.flags != QCOMTEE_OBJREF_FLAG_MEM)
+		return -EINVAL;
+
+	mem_object = kzalloc(sizeof(*mem_object), GFP_KERNEL);
+	if (!mem_object)
+		return -ENOMEM;
+
+	shm = tee_shm_get_from_id(ctx, param->u.objref.id);
+	if (!shm)
+		return -EINVAL;
+
+	/* mem-object wrapping the memref. */
+	err = qcomtee_object_user_init(&mem_object->object,
+				       QCOMTEE_OBJECT_TYPE_CB,
+				       &qcomtee_mem_object_ops, "tee-shm-%d",
+				       shm->id);
+	if (err) {
+		tee_shm_put(shm);
+
+		return err;
+	}
+
+	mem_object->paddr = shm->paddr;
+	mem_object->size = shm->size;
+	mem_object->shm = shm;
+
+	*object = &no_free_ptr(mem_object)->object;
+
+	return 0;
+}
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx)
+{
+	struct qcomtee_mem_object *mem_object;
+
+	mem_object = to_qcomtee_mem_object(object);
+	/* Sure if the memobj is in a same context it is originated from. */
+	if (mem_object->shm->ctx != ctx)
+		return -EINVAL;
+
+	param->u.objref.id = mem_object->shm->id;
+	param->u.objref.flags = QCOMTEE_OBJREF_FLAG_MEM;
+
+	/* Passing shm->id to userspace; drop the reference. */
+	qcomtee_object_put(object);
+
+	return 0;
+}
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms)
+{
+	struct qcomtee_mem_object *mem_object = to_qcomtee_mem_object(object);
+
+	/* Reuses the memory object as a mapping object by re-sharing it. */
+	qcomtee_object_get(&mem_object->object);
+
+	*map_object = &mem_object->object;
+	*mem_paddr = mem_object->paddr;
+	*mem_size = mem_object->size;
+	*perms = QCOM_SCM_PERM_RW;
+
+	return 0;
+}
diff --git a/drivers/tee/qcomtee/primordial_obj.c b/drivers/tee/qcomtee/primordial_obj.c
index a30967d89c91..cd9fe9eac08b 100644
--- a/drivers/tee/qcomtee/primordial_obj.c
+++ b/drivers/tee/qcomtee/primordial_obj.c
@@ -16,18 +16,31 @@
  * for native kernel services or privileged operations.
  *
  * We support:
+ *  - %QCOMTEE_OBJECT_OP_MAP_REGION to map a memory object and return mapping
+ *    object and mapping information (see qcomtee_mem_object_map()).
  *  - %QCOMTEE_OBJECT_OP_YIELD to yield by the thread running in QTEE.
  *  - %QCOMTEE_OBJECT_OP_SLEEP to wait for a period of time.
  */
 
+#define QCOMTEE_OBJECT_OP_MAP_REGION 0
 #define QCOMTEE_OBJECT_OP_YIELD 1
 #define QCOMTEE_OBJECT_OP_SLEEP 2
 
+/* Mapping information format as expected by QTEE. */
+struct qcomtee_mapping_info {
+	u64 paddr;
+	u64 len;
+	u32 perms;
+} __packed;
+
 static int
 qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 				struct qcomtee_object *primordial_object_unused,
 				u32 op, struct qcomtee_arg *args)
 {
+	struct qcomtee_mapping_info *map_info;
+	struct qcomtee_object *mem_object;
+	struct qcomtee_object *map_object;
 	int err = 0;
 
 	switch (op) {
@@ -35,6 +48,7 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		cond_resched();
 		/* No output object. */
 		oic->data = NULL;
+
 		break;
 	case QCOMTEE_OBJECT_OP_SLEEP:
 		/* Check message format matched QCOMTEE_OBJECT_OP_SLEEP op. */
@@ -46,6 +60,30 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 		msleep(*(u32 *)(args[0].b.addr));
 		/* No output object. */
 		oic->data = NULL;
+
+		break;
+	case QCOMTEE_OBJECT_OP_MAP_REGION:
+		/* Check message format matched QCOMTEE_OBJECT_OP_MAP_REGION op. */
+		if (qcomtee_args_len(args) != 3 ||
+		    args[0].type != QCOMTEE_ARG_TYPE_OB ||
+		    args[1].type != QCOMTEE_ARG_TYPE_IO ||
+		    args[2].type != QCOMTEE_ARG_TYPE_OO ||
+		    args[0].b.size < sizeof(struct qcomtee_mapping_info))
+			return -EINVAL;
+
+		map_info = (struct qcomtee_mapping_info *)args[0].b.addr;
+		mem_object = args[1].o;
+
+		qcomtee_mem_object_map(mem_object, &map_object,
+				       &map_info->paddr, &map_info->len,
+				       &map_info->perms);
+
+		args[2].o = map_object;
+		/* One output object; pass it for cleanup to notify. */
+		oic->data = map_object;
+
+		qcomtee_object_put(mem_object);
+
 		break;
 	default:
 		err = -EINVAL;
@@ -54,8 +92,21 @@ qcomtee_primordial_obj_dispatch(struct qcomtee_object_invoke_ctx *oic,
 	return err;
 }
 
+/* Called after submitting the callback response. */
+static void qcomtee_primordial_obj_notify(struct qcomtee_object_invoke_ctx *oic,
+					  struct qcomtee_object *unused,
+					  int err)
+{
+	struct qcomtee_object *object = oic->data;
+
+	/* If err, QTEE did not obtain mapping object. Drop it. */
+	if (object && err)
+		qcomtee_object_put(object);
+}
+
 static struct qcomtee_object_operations qcomtee_primordial_obj_ops = {
 	.dispatch = qcomtee_primordial_obj_dispatch,
+	.notify = qcomtee_primordial_obj_notify,
 };
 
 struct qcomtee_object qcomtee_primordial_object = {
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index a5d05a72af15..cd5d45075fcd 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -15,6 +15,7 @@
 /* Flags relating to object reference. */
 #define QCOMTEE_OBJREF_FLAG_TEE BIT(0)
 #define QCOMTEE_OBJREF_FLAG_USER BIT(1)
+#define QCOMTEE_OBJREF_FLAG_MEM BIT(2)
 
 /**
  * struct qcomtee - Main service struct.
@@ -222,4 +223,42 @@ int qcomtee_user_object_submit(struct tee_context *ctx,
 /* (2) Primordial Object. */
 extern struct qcomtee_object qcomtee_primordial_object;
 
+/* (3) Memory Object API. */
+
+/* Is it a memory object using tee_shm? */
+int is_qcomtee_memobj_object(struct qcomtee_object *object);
+
+/**
+ * qcomtee_memobj_param_to_object() - OBJREF parameter to &struct qcomtee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is an OBJREF with %QCOMTEE_OBJREF_FLAG_MEM flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_memobj_param_to_object(struct qcomtee_object **object,
+				   struct tee_param *param,
+				   struct tee_context *ctx);
+
+/* Reverse what qcomtee_memobj_param_to_object() does. */
+int qcomtee_memobj_param_from_object(struct tee_param *param,
+				     struct qcomtee_object *object,
+				     struct tee_context *ctx);
+
+/**
+ * qcomtee_mem_object_map() - Map a memory object.
+ * @object: memory object.
+ * @map_object: created mapping object.
+ * @mem_paddr: physical address of the memory.
+ * @mem_size: size of the memory.
+ * @perms: QTEE access permissions.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcomtee_mem_object_map(struct qcomtee_object *object,
+			   struct qcomtee_object **map_object, u64 *mem_paddr,
+			   u64 *mem_size, u32 *perms);
+
 #endif /* QCOMTEE_PRIVATE_H */
diff --git a/drivers/tee/qcomtee/shm.c b/drivers/tee/qcomtee/shm.c
index 998aabe96434..9bdf9e48bfeb 100644
--- a/drivers/tee/qcomtee/shm.c
+++ b/drivers/tee/qcomtee/shm.c
@@ -113,9 +113,6 @@ static int qcomtee_shm_unregister(struct tee_context *ctx, struct tee_shm *shm)
 static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
 			 size_t size, size_t align)
 {
-	if (!(shm->flags & TEE_SHM_PRIV))
-		return -ENOMEM;
-
 	return tee_dyn_shm_alloc_helper(shm, size, align, qcomtee_shm_register);
 }
 

-- 
2.34.1


