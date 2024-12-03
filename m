Return-Path: <linux-arm-msm+bounces-39996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5C9E123D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0882F282C74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D32185B76;
	Tue,  3 Dec 2024 04:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q04QIT5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1427217C21B;
	Tue,  3 Dec 2024 04:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199620; cv=none; b=mipeOvFmvON8GlSnJYNH7Ync2DJLWEa1msp/Z+iclZerDTwYYix1QpmImPXoZqRgX36u0RXLshbUn2BNLHu5Fghj5dQaH0+cTcQTkQ6En/Nh11eDN4HUymbHHXbZ6tiHi+VbOTLrKrQ3DxCg4etBPN5FMsgTokvr5h3TZAvBW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199620; c=relaxed/simple;
	bh=4czpIWIbbW+HF40KlLhyA7y8AN6snPxTO9DRnj4n2aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HYYail6QiA3bBhvS42REZSIURU04L3ipj8t0u3vYJ2ZqXC461y416z9kf/prwz4YrsrqVvsj2YbnWL10zMdDBj29bbu4eYtn/s5UWgT3Rhjn2sdI1KKuebw0veXUOx3aZSdlnpbsugcfS62y6xZpgiZRPx3tHF1GvRqlfk2dRec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q04QIT5U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2I7OrZ025063;
	Tue, 3 Dec 2024 04:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqXDsRvA2nwfupXbMIvTWXc6tkFglTK6wh3qKIXtKWk=; b=Q04QIT5UJgPgXJd/
	HopuvJXj2xw/1giAeq/XpVMptTrCX6O7rSZgVd9oYN4Di20NCmuxlJuZZmjAMBLb
	NHTVG4PeDPQ3O+IZUTwIDy26Vk8jVI7Pcjfgqg1Z4JBi7OayZesYovCQX7+ufohq
	kTSRRrtaxJI7ZkviapjCdjrgU5ucGw2X3tug02yJB4nqvg5ESwcjvKghCVMKEA0F
	td42zRl0l/7uuQfn7LI6TD9lLLr52bGhgpt7YwXwczuPMbCQD8yxbumvkP8zVFGF
	kWRsE9NhJlYqBX+yXoafx2K4JJpD2may3fDrEbDhS/C8XOSjY7VtBMJeJCYlyVCn
	3RxAKw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq66suc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K7CR024265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:07 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:07 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Mon, 2 Dec 2024 20:19:24 -0800
Subject: [PATCH 08/10] tee: add Qualcomm TEE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-8-f502ef01e016@quicinc.com>
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
X-Proofpoint-GUID: XMqJi43RdkOybvAWw-pvpwyB17D833e9
X-Proofpoint-ORIG-GUID: XMqJi43RdkOybvAWw-pvpwyB17D833e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030034

Introduce basic support for invoking objects hosted in QTEE and userspace
through the TEE subsystem.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 drivers/tee/qcomtee/Makefile          |   2 +
 drivers/tee/qcomtee/call.c            | 707 ++++++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c            |   8 +
 drivers/tee/qcomtee/qcomtee_private.h | 166 ++++++++
 drivers/tee/qcomtee/user_obj.c        | 625 ++++++++++++++++++++++++++++++
 include/uapi/linux/tee.h              |   1 +
 6 files changed, 1509 insertions(+)

diff --git a/drivers/tee/qcomtee/Makefile b/drivers/tee/qcomtee/Makefile
index 108bc7fdabcb..6bf91481fde3 100644
--- a/drivers/tee/qcomtee/Makefile
+++ b/drivers/tee/qcomtee/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_QCOMTEE) += qcomtee.o
 qcomtee-objs += async.o
+qcomtee-objs += call.o
 qcomtee-objs += core.o
 qcomtee-objs += primordial_obj.o
 qcomtee-objs += qcom_scm.o
 qcomtee-objs += release.o
+qcomtee-objs += user_obj.o
diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
new file mode 100644
index 000000000000..11bb31836808
--- /dev/null
+++ b/drivers/tee/qcomtee/call.c
@@ -0,0 +1,707 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/tee.h>
+#include <linux/mm.h>
+#include <linux/platform_device.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+
+#include "qcomtee_private.h"
+
+/**
+ * enum qcom_tee_object_host - Object host where it is managed.
+ * @QCOM_TEE_OBJECT_HOST_USER: objects in userspace.
+ * @QCOM_TEE_OBJECT_HOST_TEE: objects in QTEE.
+ *
+ * We refer to object hosted in userspace as 'Local Object' and objects hosted
+ * in QTEE as 'Remote Object'.
+ */
+enum qcom_tee_object_host {
+	QCOM_TEE_OBJECT_HOST_USER,	/* Object that is managed in userspace. */
+	QCOM_TEE_OBJECT_HOST_TEE,	/* Object that is managed in QTEE. */
+};
+
+/* Read object ID host information. */
+static enum qcom_tee_object_host qcom_tee_object_host(struct tee_param *param)
+{
+	if (param->u.objref.flags & QCOM_TEE_OBJREF_FLAG_USER)
+		return QCOM_TEE_OBJECT_HOST_USER;
+	return QCOM_TEE_OBJECT_HOST_TEE;
+}
+
+/* qcom_tee_context_add_qtee_object() - Add a QTEE object to the context.
+ * @param: TEE parameter represents @object.
+ * @object: QTEE object.
+ * @ctx: context to add the object.
+ *
+ * It assumes @object is %QCOM_TEE_OBJECT_TYPE_TEE and caller has already issued
+ * qcom_tee_object_get() for @object.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_context_add_qtee_object(struct tee_param *param, struct qcom_tee_object *object,
+				     struct qcom_tee_context *ctx)
+{
+	int ret;
+
+	guard(mutex)(&ctx->lock);
+	ret = idr_alloc(&ctx->qtee_objects_idr, object, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	param->u.objref.id = ret;
+	/* QTEE Object: !QCOM_TEE_OBJREF_FLAG_USER. */
+	param->u.objref.flags = 0;
+
+	return 0;
+}
+
+static int find_qtee_object(struct qcom_tee_object **object, unsigned long id,
+			    struct qcom_tee_context *ctx)
+{
+	int err = 0;
+
+	guard(rcu)();
+	/* Object release is RCU protected. */
+	*object = idr_find(&ctx->qtee_objects_idr, id);
+	if (!qcom_tee_object_get(*object))
+		err = -EINVAL;
+
+	return err;
+}
+
+static void del_qtee_object(unsigned long id, struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_object *object;
+
+	scoped_guard(mutex, &ctx->lock)
+		object = idr_remove(&ctx->qtee_objects_idr, id);
+	qcom_tee_object_put(object);
+}
+
+/* Get the QTEE object added with qcom_tee_context_add_qtee_object(). */
+int qcom_tee_context_find_qtee_object(struct qcom_tee_object **object, struct tee_param *param,
+				      struct qcom_tee_context *ctx)
+{
+	/* 'qtee_objects_idr' stores QTEE objects only. */
+	if (qcom_tee_object_host(param) != QCOM_TEE_OBJECT_HOST_TEE)
+		return -EINVAL;
+	return find_qtee_object(object, param->u.objref.id, ctx);
+}
+
+/**
+ * qcom_tee_context_del_qtee_object() - Delete a QTEE object from the context.
+ * @param: TEE parameter represents @object.
+ * @ctx: context to delete the object.
+ *
+ * @param returned by qcom_tee_context_add_qtee_object().
+ */
+void qcom_tee_context_del_qtee_object(struct tee_param *param, struct qcom_tee_context *ctx)
+{
+	/* 'qtee_objects_idr' stores QTEE objects only. */
+	if (qcom_tee_object_host(param) == QCOM_TEE_OBJECT_HOST_TEE)
+		del_qtee_object(param->u.objref.id, ctx);
+}
+
+/**
+ * qcom_tee_objref_to_arg() - Convert OBJREF parameter to QTEE argument in a context.
+ * @arg: QTEE argument.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It assumes @param is OBJREF.
+ * It does not set @arg.type; caller should initialize it to a correct
+ * &enum qcom_tee_arg_type value.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_objref_to_arg(struct qcom_tee_arg *arg, struct tee_param *param,
+			   struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_object *object;
+	int err;
+
+	if (arg->type != QCOM_TEE_ARG_TYPE_IO &&
+	    arg->type != QCOM_TEE_ARG_TYPE_OO)
+		return -EINVAL;
+
+	/* It is a NULL object?! */
+	if (param->u.objref.id == TEE_OBJREF_NULL) {
+		arg->o = NULL_QCOM_TEE_OBJECT;
+
+		return 0;
+	}
+
+	switch (qcom_tee_object_host(param)) {
+	case QCOM_TEE_OBJECT_HOST_USER:
+		err = qcom_tee_user_param_to_object(&object, param, ctx);
+		if (err)
+			break;
+
+		/* Keep a copy for driver as QTEE may release it (e.g. using async msg). */
+		qcom_tee_object_get(object);
+
+		break;
+	case QCOM_TEE_OBJECT_HOST_TEE:
+		err = qcom_tee_context_find_qtee_object(&object, param, ctx);
+
+		break;
+	}
+
+	arg->o = err ? NULL_QCOM_TEE_OBJECT : object;
+
+	return err;
+}
+
+/**
+ * qcom_tee_objref_from_arg() - Convert QTEE argument to OBJREF param in a context.
+ * @param: TEE parameter.
+ * @arg: QTEE argument.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It assumes @arg is of %QCOM_TEE_ARG_TYPE_IO or %QCOM_TEE_ARG_TYPE_OO.
+ * It does not set @param.attr; caller should initialize it to a correct OBJREF type.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_objref_from_arg(struct tee_param *param, struct qcom_tee_arg *arg,
+			     struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_object *object;
+	int err;
+
+	/* param should be of OBJREF. */
+	if (param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
+	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
+	    param->attr != TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INOUT)
+		return -EINVAL;
+
+	object = arg->o;
+
+	switch (typeof_qcom_tee_object(object)) {
+	case QCOM_TEE_OBJECT_TYPE_NULL:
+		param->u.objref.id = TEE_OBJREF_NULL;
+		err = 0;
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_CB_OBJECT:
+		err = qcom_tee_user_param_from_object(param, object, ctx);
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_TEE:
+		err = qcom_tee_context_add_qtee_object(param, object, ctx);
+
+		break;
+	case QCOM_TEE_OBJECT_TYPE_ROOT:
+	default:
+		return -EINVAL;
+	}
+
+	return err;
+}
+
+/**
+ * qcom_tee_params_to_args() - Convert TEE parameters to QTEE arguments in a context.
+ * @u: QTEE arguments.
+ * @params: TEE parameters.
+ * @num_params: number of elements in the parameter array.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It assumes @u has at least @num_param + 1 entries and has been initialized
+ * with %QCOM_TEE_ARG_TYPE_INV as &struct qcom_tee_arg.type.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_params_to_args(struct qcom_tee_arg *u,
+				   struct tee_param *params, int num_params,
+				   struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_object *object;
+	int i;
+
+	for (i = 0; i < num_params; i++) {
+		switch (params[i].attr) {
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
+			u[i].flags = QCOM_TEE_ARG_FLAGS_UADDR;
+			u[i].b.uaddr = params[i].u.membuf.uaddr;
+			u[i].b.size = params[i].u.membuf.size;
+
+			if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT)
+				u[i].type = QCOM_TEE_ARG_TYPE_IB;
+			else /* TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT */
+				u[i].type = QCOM_TEE_ARG_TYPE_OB;
+
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+			u[i].type = QCOM_TEE_ARG_TYPE_IO;
+			if (qcom_tee_objref_to_arg(&u[i], &params[i], ctx))
+				goto out_failed;
+
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+			u[i].type = QCOM_TEE_ARG_TYPE_OO;
+			u[i].o = NULL_QCOM_TEE_OBJECT;
+			break;
+		default: /* Unsupported TEE parameters. */
+			goto out_failed;
+		}
+	}
+
+	return 0;
+
+out_failed:
+
+	/* On ERROR: */
+	/* Put IO objects processed so far. */
+	for (--i; i >= 0; i--) {
+		if (u[i].type != QCOM_TEE_ARG_TYPE_IO)
+			continue;
+
+		object = u[i].o;
+		qcom_tee_user_object_set_notify(object, false);
+		/* For callback object, we hold a reference for the driver, put it. */
+		if (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+			qcom_tee_object_put(object);
+		/* Put QTEE copy of object. */
+		qcom_tee_object_put(object);
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * qcom_tee_params_from_args() - Convert QTEE arguments to TEE parameters in a context.
+ * @params: TEE parameters.
+ * @u: QTEE arguments.
+ * @num_params: number of elements in the parameter array.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @u should have been already initialized by qcom_tee_params_to_args().
+ * This also represents end of a QTEE invocation that started with qcom_tee_params_to_args()
+ * by releasing %QCOM_TEE_ARG_TYPE_IO objects.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_params_from_args(struct tee_param *params,
+				     struct qcom_tee_arg *u, int num_params,
+				     struct qcom_tee_context *ctx)
+{
+	int i, np;
+
+	for (np = 0; u[np].type; np++) {
+		enum qcom_tee_arg_type at = u[np].type;
+
+		if (at == QCOM_TEE_ARG_TYPE_OB) {
+			/* TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT */
+			params[np].u.value.b = u[np].b.size;
+
+		} else if (at == QCOM_TEE_ARG_TYPE_IO) {
+			/* IEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT */
+			qcom_tee_object_put(u[np].o);
+
+		} else if (at == QCOM_TEE_ARG_TYPE_OO) {
+			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
+			if (qcom_tee_objref_from_arg(&params[np], &u[np], ctx))
+				goto out_failed;
+		}
+	}
+
+	return 0;
+
+out_failed:
+
+	/* On ERROR: */
+	/*  - Release params associated to QTEE objects in this context so far. */
+	for (i = 0; i < np; i++) {
+		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
+			qcom_tee_context_del_qtee_object(&params[i], ctx);
+	}
+	/*  - Release any IO and OO objects not processed so far. */
+	while (u[i].type) {
+		if (u[i].type == QCOM_TEE_ARG_TYPE_OO ||
+		    u[i].type == QCOM_TEE_ARG_TYPE_IO)
+			qcom_tee_object_put(u[i++].o);
+	}
+
+	return -EINVAL;
+}
+
+/* TEE Device Ops. */
+
+static int qcom_tee_params_check(struct tee_param *params, int num_params)
+{
+	int io = 0, oo = 0, ib = 0, ob = 0;
+	int i;
+
+	/* QTEE accepts 64 arguments. */
+	if (num_params > QCOM_TEE_ARGS_MAX)
+		return -EINVAL;
+
+	/* Supported parameter types. */
+	for (i = 0; i < num_params; i++) {
+		switch (params[i].attr) {
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
+			ib++; break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT:
+			ob++; break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
+			io++; break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
+			oo++; break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	/*  QTEE accepts 16 arguments of each supported types. */
+	if (io > QCOM_TEE_ARGS_PER_TYPE || oo > QCOM_TEE_ARGS_PER_TYPE ||
+	    ib > QCOM_TEE_ARGS_PER_TYPE || ob > QCOM_TEE_ARGS_PER_TYPE)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Check if user issued a permitted operation on ROOT_QCOM_TEE_OBJECT from userspace. */
+static int qcom_tee_root_object_check(u32 op, struct tee_param *params, int num_params)
+{
+	/* Some privileged operations recognized by QTEE. */
+	if (op == 4 || op == 8 || op == 9)
+		return -EINVAL;
+
+	/* OP 5 is to register with QTEE by passing credential object as input OBJREF. */
+	/* TEE_OBJREF_NULL as credential object represents a privileged client for QTEE,
+	 * only kernel can pass TEE_OBJREF_NULL.
+	 */
+	if (op == 5) {
+		if (num_params != 2)
+			return -EINVAL;
+
+		if (params[0].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT &&
+		    params[1].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT) {
+			if (params[0].u.objref.id == TEE_OBJREF_NULL)
+				return -EINVAL;
+
+		} else if (params[0].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT &&
+			   params[1].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT) {
+			if (params[1].u.objref.id == TEE_OBJREF_NULL)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * qcom_tee_object_invoke() - Invoke a QTEE object.
+ * @tee_ctx: TEE context.
+ * @arg: ioctl arguments.
+ * @params: parameters for the object.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_object_invoke(struct tee_context *tee_ctx,
+				  struct tee_ioctl_object_invoke_arg *arg,
+				  struct tee_param *params)
+{
+	struct qcom_tee_object_invoke_ctx *oic __free(kfree) = NULL;
+	struct qcom_tee_context *ctx = tee_ctx->data;
+	struct qcom_tee_arg *u __free(kfree) = NULL;
+	struct qcom_tee_object *object;
+	int i, ret, result;
+
+	if (qcom_tee_params_check(params, arg->num_params))
+		return -EINVAL;
+
+	/* Handle OBJREF reserved operations. */
+	if (arg->op == QCOM_TEE_OBJREF_OP_RELEASE) {
+		del_qtee_object(arg->object, ctx);
+
+		return 0;
+	}
+
+	/* Unsupported reserved operation. */
+	if (arg->op > QCOM_TEE_OBJREF_OP_MIN)
+		return -EINVAL;
+
+	oic = kzalloc(sizeof(*oic), GFP_KERNEL);
+	if (!oic)
+		return -ENOMEM;
+
+	/* +1 for ending QCOM_TEE_ARG_TYPE_INV. */
+	u = kzalloc(sizeof(*u) * (arg->num_params + 1), GFP_KERNEL);
+	if (!u)
+		return -ENOMEM;
+
+	if (arg->object == TEE_OBJREF_NULL &&
+	    !qcom_tee_root_object_check(arg->op, params, arg->num_params)) {
+		/* Use ROOT if NULL is invoked. */
+		object = ROOT_QCOM_TEE_OBJECT;
+	} else {
+		/* Get object being invoked. */
+		ret = find_qtee_object(&object, arg->object, ctx);
+		if (ret)
+			return ret;
+	}
+
+	ret = qcom_tee_params_to_args(u, params, arg->num_params, ctx);
+	if (ret)
+		goto out;
+
+	ret = qcom_tee_object_do_invoke(oic, object, arg->op, u, &result);
+	if (!ret) {
+		if (!result) {
+			/* Only parse QTEE response on SUCCESS. */
+			ret = qcom_tee_params_from_args(params, u, arg->num_params, ctx);
+		} else {
+			/* Put driver's IO objects copy; get in qcom_tee_params_to_args(). */
+			qcom_tee_arg_for_each_input_object(i, u)
+				qcom_tee_object_put(u[i++].o);
+		}
+	} else if (ret != -EAGAIN && ret != -ENODEV) {
+		/* Unable to initiate a QTEE invocation; cleanup qcom_tee_params_to_args(). */
+		qcom_tee_arg_for_each_input_object(i, u) {
+			qcom_tee_user_object_set_notify(u[i].o, false);
+			if (typeof_qcom_tee_object(u[i].o) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+				qcom_tee_object_put(u[i].o);
+			qcom_tee_object_put(u[i].o);
+		}
+	}
+
+	arg->ret = result;
+out:
+	qcom_tee_object_put(object);
+
+	return ret;
+}
+
+/**
+ * qcom_tee_supp_recv() - Pick a request for the supplicant.
+ * @tee_ctx: TEE context.
+ * @op: requested operation on object.
+ * @num_params: number of elements in the parameter array, updated with number used.
+ * @params: parameters for @op.
+ *
+ * The first parameter is a %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT meta parameter.
+ * On input, it provides a user buffer. This buffer is used for parameters of type
+ * %TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT in qcom_tee_cb_params_from_args().
+ * On output, object id and request id are stored in the meta parameter.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_supp_recv(struct tee_context *tee_ctx, u32 *op, u32 *num_params,
+			      struct tee_param *params)
+{
+	struct qcom_tee_user_object_request_data data;
+	struct qcom_tee_context *ctx = tee_ctx->data;
+	void __user *uaddr;
+	size_t ubuf_size;
+	int i, ret;
+
+	if (!*num_params)
+		return -EINVAL;
+
+	/* We expect the first parameter to be an INOUT + meta parameter. */
+	if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR_META))
+		return -EINVAL;
+
+	/* Others parameters are none. */
+	for (i = 1; i < *num_params; i++)
+		if (params[i].attr)
+			return -EINVAL;
+
+	if (IS_ALIGNED(params->u.value.a, 8))
+		return -EINVAL;
+
+	/* User buffer and size from meta parameter. */
+	uaddr = u64_to_user_ptr(params->u.value.a);
+	ubuf_size = params->u.value.b;
+	/* Process TEE parameters. +/-1 to ignore meta parameter. */
+	ret = qcom_tee_user_object_pop(ctx, params + 1, *num_params - 1, uaddr, ubuf_size, &data);
+	if (ret)
+		return ret;
+
+	params->u.value.a = data.object_id;
+	params->u.value.b = data.id;
+	params->u.value.c = 0;
+	*op = data.op;
+	*num_params = data.np + 1;
+
+	return 0;
+}
+
+/**
+ * qcom_tee_supp_send() - Pick a request for the supplicant.
+ * @tee_ctx: TEE context.
+ * @ret: return value of the request.
+ * @num_params: number of elements in the parameter array.
+ * @params: returned parameters.
+ *
+ * The first parameter is a %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT meta parameter.
+ * It specifies the request id this response is belong to.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_supp_send(struct tee_context *tee_ctx, u32 errno, u32 num_params,
+			      struct tee_param *params)
+{
+	struct qcom_tee_context *ctx = tee_ctx->data;
+	int id;
+
+	if (!num_params)
+		return -EINVAL;
+
+	/* We expect the first parameter to be an INPUT + meta parameter. */
+	if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT | TEE_IOCTL_PARAM_ATTR_META))
+		return -EINVAL;
+
+	/* Get the req_id of response. */
+	id = params->u.value.a;
+
+	/* Process TEE parameters. +/-1 to ignore meta parameter. */
+	return qcom_tee_user_object_submit(ctx, params + 1, num_params - 1, id, errno);
+}
+
+static int qcom_tee_open(struct tee_context *tee_context)
+{
+	struct qcom_tee_context *ctx __free(kfree) = NULL;
+	int err;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	err = init_srcu_struct(&ctx->req_srcu);
+	if (err)
+		return err;
+
+	ctx->tee_context = tee_context;
+	idr_init(&ctx->qtee_objects_idr);
+	idr_init(&ctx->reqs_idr);
+	mutex_init(&ctx->lock);
+	init_completion(&ctx->req_c);
+	kref_init(&ctx->ref_cnt);
+
+	tee_context->data = no_free_ptr(ctx);
+
+	return 0;
+}
+
+static void qcom_tee_release(struct tee_context *tee_context)
+{
+	struct qcom_tee_context *ctx = tee_context->data;
+	struct qcom_tee_object *object;
+	int id;
+
+	/* Process QUEUED or PROCESSING requests. */
+	qcom_tee_requests_destroy(ctx);
+
+	/* Release QTEE objects. */
+	idr_for_each_entry(&ctx->qtee_objects_idr, object, id)
+		qcom_tee_object_put(object);
+
+	/* Put the context; wait for all user objects to go away. */
+	kref_put(&ctx->ref_cnt, __qcom_tee_context_destroy);
+}
+
+void __qcom_tee_context_destroy(struct kref *ref_cnt)
+{
+	struct qcom_tee_context *ctx = container_of(ref_cnt, struct qcom_tee_context, ref_cnt);
+
+	idr_destroy(&ctx->qtee_objects_idr);
+	idr_destroy(&ctx->reqs_idr);
+	cleanup_srcu_struct(&ctx->req_srcu);
+	kfree(ctx);
+}
+
+static void qcom_tee_get_version(struct tee_device *teedev, struct tee_ioctl_version_data *vers)
+{
+	struct tee_ioctl_version_data v = {
+		.impl_id = TEE_IMPL_ID_QTEE,
+		.gen_caps = TEE_GEN_CAP_OBJREF,
+	};
+
+	*vers = v;
+}
+
+static const struct tee_driver_ops qcom_tee_ops = {
+	.get_version = qcom_tee_get_version,
+	.open = qcom_tee_open,
+	.release = qcom_tee_release,
+	.object_invoke_func = qcom_tee_object_invoke,
+	.supp_recv = qcom_tee_supp_recv,
+	.supp_send = qcom_tee_supp_send,
+};
+
+static const struct tee_desc qcom_tee_desc = {
+	.name = "qcom_tee",
+	.ops = &qcom_tee_ops,
+	.owner = THIS_MODULE,
+};
+
+static int qcom_tee_probe(struct platform_device *pdev)
+{
+	struct tee_device *teedev;
+	int err;
+
+	if (!qcom_scm_is_available())
+		return -EPROBE_DEFER;
+
+	teedev = tee_device_alloc(&qcom_tee_desc, NULL, NULL, NULL);
+	if (IS_ERR(teedev))
+		return PTR_ERR(teedev);
+
+	err = tee_device_register(teedev);
+	if (err)
+		goto err_unreg_teedev;
+
+	platform_set_drvdata(pdev, teedev);
+	return 0;
+
+err_unreg_teedev:
+	tee_device_unregister(teedev);
+
+	return err;
+}
+
+static void qcom_tee_remove(struct platform_device *pdev)
+{
+	struct tee_device *teedev = platform_get_drvdata(pdev);
+
+	/* Keep a copy, tee_device_unregister() sets it to NULL. */
+	struct tee_shm_pool *pool = teedev->pool;
+
+	/* Wait for users to go away. */
+	tee_device_unregister(teedev);
+	tee_shm_pool_free(pool);
+}
+
+static const struct of_device_id qcom_tee_dt_match[] = {
+	{ .compatible = "qcom,tee" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, qcom_tee_dt_match);
+
+static struct platform_driver qcom_tee_platform_driver = {
+	.probe = qcom_tee_probe,
+	.remove = qcom_tee_remove,
+	.driver = {
+		.name = "qcom_tee",
+		.of_match_table = qcom_tee_dt_match,
+	},
+};
+
+int qcom_tee_driver_register(void)
+{
+	return platform_driver_register(&qcom_tee_platform_driver);
+}
+
+void qcom_tee_driver_unregister(void)
+{
+	platform_driver_unregister(&qcom_tee_platform_driver);
+}
diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 79f1181cf676..545857e117db 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -904,8 +904,14 @@ static int __init qcom_tee_object_invoke_init(void)
 	if (ret)
 		goto err_kobject_put;
 
+	ret = qcom_tee_driver_register();
+	if (ret)
+		goto err_remove_group;
+
 	return 0;
 
+err_remove_group:
+	sysfs_remove_group(qcom_tee_object_invoke_kobj, &attr_group);
 err_kobject_put:
 	/* Remove '/sys/firmware/qcom_tee'. */
 	kobject_put(qcom_tee_object_invoke_kobj);
@@ -920,6 +926,8 @@ module_init(qcom_tee_object_invoke_init);
 
 static void __exit qcom_tee_object_invoke_deinit(void)
 {
+	qcom_tee_driver_unregister();
+
 	/* Wait for RELEASE operations for QTEE objects. */
 	qcom_tee_release_destroy();
 	qcom_tee_msg_buffers_destroy();
diff --git a/drivers/tee/qcomtee/qcomtee_private.h b/drivers/tee/qcomtee/qcomtee_private.h
index c718cd2d8463..15f358260ed7 100644
--- a/drivers/tee/qcomtee/qcomtee_private.h
+++ b/drivers/tee/qcomtee/qcomtee_private.h
@@ -10,6 +10,14 @@
 #include <linux/kobject.h>
 #include <linux/tee_core.h>
 
+/* Flags relating to object reference. */
+#define QCOM_TEE_OBJREF_FLAG_USER 1
+
+/* Reserved OBJREF operations. */
+/* These operations are not sent to QTEE and handled in driver. */
+#define QCOM_TEE_OBJREF_OP_MIN USHRT_MAX
+#define QCOM_TEE_OBJREF_OP_RELEASE (QCOM_TEE_OBJREF_OP_MIN + 1)
+
 struct qcom_tee_object *qcom_tee_idx_erase(u32 idx);
 void qcom_tee_object_free(struct qcom_tee_object *object);
 
@@ -44,9 +52,167 @@ int __qcom_tee_object_do_invoke(struct qcom_tee_object_invoke_ctx *oic,
 				struct qcom_tee_object *object, u32 op,	struct qcom_tee_arg *u,
 				int *result);
 
+/**
+ * struct qcom_tee_context - Clients or supplicants context.
+ * @tee_context: TEE context.
+ * @qtee_objects_idr: QTEE objects in this context.
+ * @reqs_idr: Requests currently being processed.
+ * @lock: mutex for @reqs_idr and @qtee_objects_idr.
+ * @req_srcu: srcu for exclusive access to requests.
+ * @req_c: completion used when supplicant is waiting for requests.
+ * @released: state of this context.
+ * @ref_cnt: ref count.
+ */
+struct qcom_tee_context {
+	struct tee_context *tee_context;
+
+	struct idr qtee_objects_idr;
+	struct idr reqs_idr;
+	/* Synchronize access to @reqs_idr, @qtee_objects_idr and updating requests state. */
+	struct mutex lock;
+	struct srcu_struct req_srcu;
+	struct completion req_c;
+
+	int released;
+
+	struct kref ref_cnt;
+};
+
+void __qcom_tee_context_destroy(struct kref *ref_cnt);
+
+/* qcom_tee_context_add_qtee_object() - Add a QTEE object to the context.
+ * @param: TEE parameter represents @object.
+ * @object: QTEE object.
+ * @ctx: context to add the object.
+ *
+ * It assumes @object is %QCOM_TEE_OBJECT_TYPE_TEE and caller has already issued
+ * qcom_tee_object_get() for @object.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_context_add_qtee_object(struct tee_param *param, struct qcom_tee_object *object,
+				     struct qcom_tee_context *ctx);
+
+/* Get the QTEE object added with qcom_tee_context_add_qtee_object(). */
+int qcom_tee_context_find_qtee_object(struct qcom_tee_object **object, struct tee_param *param,
+				      struct qcom_tee_context *ctx);
+
+/**
+ * qcom_tee_context_del_qtee_object() - Delete a QTEE object from the context.
+ * @param: TEE parameter represents @object.
+ * @ctx: context to delete the object.
+ *
+ * @param returned by qcom_tee_context_add_qtee_object().
+ */
+void qcom_tee_context_del_qtee_object(struct tee_param *param, struct qcom_tee_context *ctx);
+
+/**
+ * qcom_tee_objref_to_arg() - Convert OBJREF parameter to QTEE argument in a context.
+ * @arg: QTEE argument.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It assumes @param is OBJREF.
+ * It does not set @arg.type; caller should initialize it to a correct
+ * &enum qcom_tee_arg_type value.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_objref_to_arg(struct qcom_tee_arg *arg, struct tee_param *param,
+			   struct qcom_tee_context *ctx);
+
+/**
+ * qcom_tee_objref_from_arg() - Convert QTEE argument to OBJREF param in a context.
+ * @param: TEE parameter.
+ * @arg: QTEE argument.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It assumes @arg is of %QCOM_TEE_ARG_TYPE_IO or %QCOM_TEE_ARG_TYPE_OO.
+ * It does not set @param.attr; caller should initialize it to a correct OBJREF type.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_objref_from_arg(struct tee_param *param, struct qcom_tee_arg *arg,
+			     struct qcom_tee_context *ctx);
+
+int qcom_tee_driver_register(void);
+void qcom_tee_driver_unregister(void);
+
 /* OBJECTS: */
 
 /* (1) Primordial Object. */
 extern struct qcom_tee_object qcom_tee_primordial_object;
 
+/* (2) User Object API. */
+
+/* Is it a user object? */
+int is_qcom_tee_user_object(struct qcom_tee_object *object);
+
+/* Set user object's 'notify on release' flag. */
+void qcom_tee_user_object_set_notify(struct qcom_tee_object *object, bool notify);
+
+/**
+ * qcom_tee_user_param_to_object() - Convert OBJREF parameter to &struct qcom_tee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is OBJREF with %TEE_IOCTL_OBJREF_USER flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_param_to_object(struct qcom_tee_object **object, struct tee_param *param,
+				  struct qcom_tee_context *ctx);
+
+/* Reverse what qcom_tee_user_param_to_object() does. */
+int qcom_tee_user_param_from_object(struct tee_param *param, struct qcom_tee_object *object,
+				    struct qcom_tee_context *ctx);
+
+struct qcom_tee_user_object_request_data {
+	int id;				/* Id assigned to the request. */
+	u64 object_id;			/* Object id being invoked by QTEE. */
+	u32 op;				/* Requested operation on object. */
+	int np;				/* Number of parameters in the request.*/
+};
+
+/**
+ * qcom_tee_user_object_pop() - Pop a request for a user object.
+ * @ctx: context to look for user object.
+ * @params: parameters for @op.
+ * @num_params: number of elements in the parameter array.
+ * @uaddr: user buffer for output MEMBUF parameters.
+ * @size: size of user buffer @uaddr.
+ * @data: information for the pop request.
+ *
+ * @params is filled along with @data for the picked request.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_object_pop(struct qcom_tee_context *ctx,
+			     struct tee_param *params, int num_params,
+			     void __user *uaddr, size_t size,
+			     struct qcom_tee_user_object_request_data *data);
+
+/**
+ * qcom_tee_user_object_submit() - Submit a response for a user object.
+ * @ctx: context to look for user object.
+ * @params: returned parameters.
+ * @num_params: number of elements in the parameter array.
+ * @id: request id for the response.
+ * @errno: result of user object invocation.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_object_submit(struct qcom_tee_context *ctx,
+				struct tee_param *params, int num_params, int id, int errno);
+
+/**
+ * qcom_tee_requests_destroy() - Destroy requests in a context.
+ * @ctx: context for which to destroy requests.
+ *
+ * After calling qcom_tee_requests_destroy(), @ctx can not be reused.
+ * It should be called on @ctx cleanup path.
+ */
+void qcom_tee_requests_destroy(struct qcom_tee_context *ctx);
+
 #endif /* QCOM_TEE_PRIVATE_H */
diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_obj.c
new file mode 100644
index 000000000000..4c671a3ae0de
--- /dev/null
+++ b/drivers/tee/qcomtee/user_obj.c
@@ -0,0 +1,625 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include "qcomtee_private.h"
+
+/**
+ * DOC: User Objects aka Supplicants
+ *
+ * Any userspace process with access to the TEE device file can behave as a supplicant
+ * by creating a user object. Any TEE parameter of type OBJREF with %QCOM_TEE_OBJREF_FLAG_USER
+ * flag set is considered as user object.
+ *
+ * A supplicant uses qcom_tee_user_object_pick() (i.e. TEE_IOC_SUPPL_RECV) to receive a
+ * QTEE user object request and qcom_tee_user_object_submit() (i.e. TEE_IOC_SUPPL_SEND)
+ * to submit a response. QTEE expects to receive the response, including OB and OO in
+ * specific order in the message; parameters submitted with qcom_tee_user_object_submit()
+ * should maintain this order.
+ */
+
+/**
+ * struct qcom_tee_user_object - User object.
+ * @object: &struct qcom_tee_object representing this user object.
+ * @ctx: context for which user object is defined.
+ * @object_id: object ID in @ctx.
+ * @nor: notify userspace if object is released.
+ *
+ * Any object managed in userspace is represented with this struct.
+ * If @nor is set, on release a notification message is send back to the userspace.
+ */
+struct qcom_tee_user_object {
+	struct qcom_tee_object object;
+	struct qcom_tee_context *ctx;
+	u64 object_id;
+
+	bool nor;
+};
+
+#define to_qcom_tee_user_object(o) container_of((o), struct qcom_tee_user_object, object)
+
+static struct qcom_tee_object_operations qcom_tee_user_object_ops;
+
+/* Is it a user object? */
+int is_qcom_tee_user_object(struct qcom_tee_object *object)
+{
+	return object != NULL_QCOM_TEE_OBJECT &&
+		typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT &&
+		object->ops == &qcom_tee_user_object_ops;
+}
+
+/* Set user object's 'notify on release' flag. */
+void qcom_tee_user_object_set_notify(struct qcom_tee_object *object, bool notify)
+{
+	if (is_qcom_tee_user_object(object))
+		WRITE_ONCE(to_qcom_tee_user_object(object)->nor, notify);
+}
+
+/**
+ * enum qcom_tee_req_state - Current state of request.
+ * @QCOM_TEE_REQ_QUEUED: Request is waiting for supplicant.
+ * @QCOM_TEE_REQ_PROCESSING: Request has been picked by the supplicant.
+ * @QCOM_TEE_REQ_PROCESSED: Response has been submitted for the request.
+ */
+enum qcom_tee_req_state {
+	QCOM_TEE_REQ_QUEUED = 1,
+	QCOM_TEE_REQ_PROCESSING,
+	QCOM_TEE_REQ_PROCESSED,
+};
+
+/* User requests sent to supplicants. */
+struct qcom_tee_user_req {
+	enum qcom_tee_req_state state;
+
+	int req_id;			/* Request ID. */
+	u64 object_id;			/* User object ID. */
+	u32 op;				/* Operation to perform on object. */
+	struct qcom_tee_arg *args;	/* QTEE arguments for this operation. */
+	int errno;			/* Result of operation. */
+
+	struct completion c;		/* Completion for whoever wait for results. */
+};
+
+/* Static placeholder for a request in PROCESSING state in qcom_tee_context.reqs_idr.
+ * If the thread initiated the QTEE call using qcom_tee_object_invoke() dies, and supplicant
+ * is processing the request, we replace the entry in qcom_tee_context.reqs_idr with
+ * __empty_ureq. So (1) the req_id remains busy and not reused, and (2) supplicant fails to
+ * submit response and does the necessary rollback.
+ */
+static struct qcom_tee_user_req __empty_ureq = { .state = QCOM_TEE_REQ_PROCESSING };
+
+/* Enqueue a user request for a context. */
+static int qcom_tee_request_enqueue(struct qcom_tee_user_req *ureq, struct qcom_tee_context *ctx)
+{
+	int ret;
+
+	guard(mutex)(&ctx->lock);
+	/* Supplicant is dying. */
+	if (ctx->released)
+		return -ENODEV;
+
+	ret = idr_alloc(&ctx->reqs_idr, ureq, 0, 0, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	ureq->req_id = ret;
+	ureq->state = QCOM_TEE_REQ_QUEUED;
+
+	return 0;
+}
+
+/**
+ * qcom_tee_requests_destroy() - Destroy requests in a context.
+ * @ctx: context for which to destroy requests.
+ */
+void qcom_tee_requests_destroy(struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_user_req *ureq;
+	int id;
+
+	guard(mutex)(&ctx->lock);
+
+	/* So qcom_tee_request_enqueue() refuses new requests. */
+	ctx->released = 1;
+	idr_for_each_entry(&ctx->reqs_idr, ureq, id) {
+		if (ureq == &__empty_ureq)
+			continue;
+		/* ureq in QUEUED or PROCESSING state, terminate them. */
+		if (ureq->op == QCOM_TEE_OBJREF_OP_RELEASE) {
+			kfree(ureq);
+		} else {
+			ureq->state = QCOM_TEE_REQ_PROCESSED;
+			ureq->errno = -ENODEV;
+			complete(&ureq->c);
+		}
+	}
+}
+
+/**
+ * qcom_tee_supp_pop_entry() - Pop the next request in a context.
+ * @ctx: context from which to pop a request.
+ * @ubuf_size: size of available buffer for MEMBUF parameters.
+ * @num_params: number of entries for TEE parameter array.
+ *
+ * It does not remove the request from &qcom_tee_context.reqs_idr.
+ * It checks if @num_params is large enough to fit the next request arguments.
+ * It checks if @ubuf_size is large enough to fit IB buffer arguments from QTEE.
+ * It updates request state to %QCOM_TEE_REQ_PROCESSING state.
+ *
+ * Return: On success return a request or NULL and ERR_PTR on failure.
+ */
+static struct qcom_tee_user_req *qcom_tee_supp_pop_entry(struct qcom_tee_context *ctx,
+							 size_t ubuf_size, int num_params)
+{
+	struct qcom_tee_user_req *ureq;
+	struct qcom_tee_arg *u;
+	int i, id;
+
+	guard(mutex)(&ctx->lock);
+
+	/* Find the a QUEUED request. */
+	idr_for_each_entry(&ctx->reqs_idr, ureq, id)
+		if (ureq->state == QCOM_TEE_REQ_QUEUED)
+			break;
+
+	if (!ureq)
+		return NULL;
+
+	u = ureq->args;
+	/* (1) Is there enough TEE parameters? */
+	if (num_params < qcom_tee_args_len(u))
+		return ERR_PTR(-EINVAL);
+
+	/* (2) Is there enough space to pass input buffers? */
+	qcom_tee_arg_for_each_input_buffer(i, u) {
+		ubuf_size = size_sub(ubuf_size, u[i].b.size);
+		if (ubuf_size == SIZE_MAX)
+			return ERR_PTR(-EINVAL);
+
+		ubuf_size = round_down(ubuf_size, 8);
+	}
+
+	/* Ready to process request 'QUEUED -> PROCESSING'. */
+	ureq->state = QCOM_TEE_REQ_PROCESSING;
+
+	return ureq;
+}
+
+/* User object dispatcher. */
+static int qcom_tee_user_object_dispatch(struct qcom_tee_object_invoke_ctx *oic,
+					 struct qcom_tee_object *object, u32 op,
+					 struct qcom_tee_arg *args)
+{
+	struct qcom_tee_user_object *uo = to_qcom_tee_user_object(object);
+	struct qcom_tee_user_req *ureq __free(kfree);
+	struct qcom_tee_context *ctx = uo->ctx;
+	int errno;
+
+	ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
+	if (!ureq)
+		return -ENOMEM;
+
+	init_completion(&ureq->c);
+	ureq->object_id = uo->object_id;
+	ureq->op = op;
+	ureq->args = args;
+
+	/* Queue the request. */
+	if (qcom_tee_request_enqueue(ureq, ctx))
+		return -ENODEV;
+
+	/* Wakeup supplicant to process it. */
+	complete(&ctx->req_c);
+
+	/* Wait for supplicant to process the request. */
+	/* Supplicant is expected to process request in a timely manner. We wait as KILLABLE,
+	 * in case supplicant and invoke thread both running from a same user process, otherwise
+	 * the process stuck on fatal signal.
+	 */
+	if (!wait_for_completion_state(&ureq->c, TASK_KILLABLE | TASK_FREEZABLE)) {
+		errno = ureq->errno;
+		/* On SUCCESS, end_cb_notify frees the request. */
+		if (!errno)
+			oic->data = no_free_ptr(ureq);
+	} else {
+		enum qcom_tee_req_state prev_state;
+
+		errno = -ENODEV;
+
+		scoped_guard(mutex, &ctx->lock) {
+			prev_state = ureq->state;
+			/* Replace ureq with '__empty_ureq' to keep req_id reserved. */
+			if (prev_state == QCOM_TEE_REQ_PROCESSING)
+				idr_replace(&ctx->reqs_idr, &__empty_ureq, ureq->req_id);
+			/* Remove ureq as supplicant has never seen this request. */
+			else if (prev_state == QCOM_TEE_REQ_QUEUED)
+				idr_remove(&ctx->reqs_idr, ureq->req_id);
+		}
+
+		/* Wait for exclusive access to ureq. */
+		synchronize_srcu(&ctx->req_srcu);
+
+		/* Supplicant did some work for us, we should not discard it. */
+		if (prev_state == QCOM_TEE_REQ_PROCESSED) {
+			errno = ureq->errno;
+			/* On SUCCESS, end_cb_notify frees the request. */
+			if (!errno)
+				oic->data = no_free_ptr(ureq);
+		}
+	}
+
+	return errno;
+}
+
+/* Called after submitting the callback response. */
+static void qcom_tee_user_object_end_cb_notify(struct qcom_tee_object_invoke_ctx *oic,
+					       struct qcom_tee_object *unused_object, int err)
+{
+	struct qcom_tee_user_req *ureq = oic->data;
+	struct qcom_tee_arg *u = ureq->args;
+	struct qcom_tee_object *object;
+	int i;
+
+	qcom_tee_arg_for_each_output_object(i, u) {
+		object = u[i].o;
+		/* If err, drop QTEE copy otherwise just drop driver's copy. */
+		if (err && (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT))
+			qcom_tee_object_put(object);
+		qcom_tee_object_put(object);
+	}
+
+	kfree(ureq);
+}
+
+static void qcom_tee_user_object_release(struct qcom_tee_object *object)
+{
+	struct qcom_tee_user_object *uo = to_qcom_tee_user_object(object);
+	struct qcom_tee_context *ctx = uo->ctx;
+	struct qcom_tee_user_req *ureq;
+
+	static struct qcom_tee_arg args[] = { { .type = QCOM_TEE_ARG_TYPE_INV } };
+
+	if (READ_ONCE(uo->nor)) {
+		ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
+		if (ureq) {
+			ureq->object_id = uo->object_id;
+			ureq->op = QCOM_TEE_OBJREF_OP_RELEASE;
+			ureq->args = args;
+
+			/* Queue the RELEASE request and wake supplicant to process it. */
+			qcom_tee_request_enqueue(ureq, ctx);
+
+			complete(&ctx->req_c);
+		} else {
+			pr_err("failed to notify user object (%s) release.\n",
+			       qcom_tee_object_name(object));
+		}
+	}
+
+	/* Matching get is in qcom_tee_user_param_to_object(). */
+	kref_put(&ctx->ref_cnt, __qcom_tee_context_destroy);
+	kfree(uo);
+}
+
+static struct qcom_tee_object_operations qcom_tee_user_object_ops = {
+	.release = qcom_tee_user_object_release,
+	.notify = qcom_tee_user_object_end_cb_notify,
+	.dispatch = qcom_tee_user_object_dispatch,
+};
+
+/**
+ * qcom_tee_user_param_to_object() - Convert OBJREF parameter to &struct qcom_tee_object.
+ * @object: object returned.
+ * @param: TEE parameter.
+ * @ctx: context in which the conversion should happen.
+ *
+ * @param is OBJREF with %QCOM_TEE_OBJREF_FLAG_USER flags.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_param_to_object(struct qcom_tee_object **object, struct tee_param *param,
+				  struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_user_object *user_object __free(kfree) = NULL;
+	struct qcom_tee_object *uo;
+	int err;
+
+	user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
+	if (!user_object)
+		return -ENOMEM;
+
+	user_object->ctx = ctx;
+	user_object->object_id = param->u.objref.id;
+	/* By default, always notify userspace on release. */
+	user_object->nor = true;
+
+	err = qcom_tee_object_user_init(&user_object->object, QCOM_TEE_OBJECT_TYPE_CB_OBJECT,
+					&qcom_tee_user_object_ops, "uo-%lu", param->u.objref.id);
+	if (err)
+		return err;
+
+	uo = &no_free_ptr(user_object)->object;
+	/* Keep context alive as user object is alive. */
+	kref_get(&ctx->ref_cnt);
+
+	*object = uo;
+
+	return 0;
+}
+
+/* Reverse what qcom_tee_user_param_to_object() does. */
+int qcom_tee_user_param_from_object(struct tee_param *param, struct qcom_tee_object *object,
+				    struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_user_object *uo;
+
+	if (!is_qcom_tee_user_object(object))
+		return -EINVAL;
+
+	uo = to_qcom_tee_user_object(object);
+	/* Sure if the object is in a same context as caller? */
+	if (uo->ctx != ctx)
+		return -EINVAL;
+
+	param->u.objref.id = uo->object_id;
+	param->u.objref.flags = QCOM_TEE_OBJREF_FLAG_USER;
+
+	/* User objects are valid in the context of userspace; drop the driver copy. */
+	qcom_tee_object_put(object);
+
+	return 0;
+}
+
+/**
+ * qcom_tee_cb_params_from_args() - Convert QTEE arguments to TEE parameters in a context.
+ * @params: TEE parameters.
+ * @u: QTEE arguments.
+ * @num_params: number of elements in the parameter array.
+ * @ubuf_addr: user buffer for argument of type %QCOM_TEE_ARG_TYPE_IB.
+ * @ubuf_size: size of user buffer.
+ * @ctx: context in which the conversion should happen.
+ *
+ * It expects @params to have enough entries for @u. Entries in @params are of
+ * %TEE_IOCTL_PARAM_ATTR_TYPE_NONE. On failure, it puts IO objects.
+ *
+ * Return: On success return number of input parameters processed or <0 on failure.
+ */
+static int qcom_tee_cb_params_from_args(struct tee_param *params,
+					struct qcom_tee_arg *u, int num_params,
+					void __user *ubuf_addr, size_t ubuf_size,
+					struct qcom_tee_context *ctx)
+{
+	int i, np = 0;
+
+	qcom_tee_arg_for_each(i, u) {
+		enum qcom_tee_arg_type at = u[i].type;
+
+		if (at == QCOM_TEE_ARG_TYPE_IB) {
+			params[np].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT;
+
+			/* Underflow already checked in qcom_tee_supp_pop_entry(). */
+			ubuf_size = round_down(ubuf_size - u[i].b.size, 8);
+			params[np].u.membuf.uaddr = (void * __user)(ubuf_addr + ubuf_size);
+			params[np].u.membuf.size = u[i].b.size;
+			if (copy_to_user(params[np].u.membuf.uaddr, u[i].b.addr, u[i].b.size))
+				goto out_failed;
+
+			np++;
+		} else if (at == QCOM_TEE_ARG_TYPE_IO) {
+			params[np].attr = TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT;
+			if (qcom_tee_objref_from_arg(&params[np], &u[i], ctx))
+				goto out_failed;
+
+			np++;
+		}
+	}
+
+	return np;
+
+out_failed:
+
+	/* On ERROR: */
+	/*  - Release params associated to QTEE objects in this context so far. */
+	for (; np >= 0; np--) {
+		if (params[np].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT)
+			qcom_tee_context_del_qtee_object(&params[np], ctx);
+	}
+	/*  - Release any IO objects not processed so far. */
+	while (u[i].type) {
+		if (u[i].type == QCOM_TEE_ARG_TYPE_IO)
+			qcom_tee_object_put(u[i++].o);
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * qcom_tee_cb_params_to_args() - Convert TEE parameters to QTEE arguments in a context.
+ * @u: QTEE arguments.
+ * @params: TEE parameters.
+ * @num_params: number of elements in the parameter array.
+ * @ctx: context in which the conversion should happen.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+static int qcom_tee_cb_params_to_args(struct qcom_tee_arg *u,
+				      struct tee_param *params, int num_params,
+				      struct qcom_tee_context *ctx)
+{
+	struct qcom_tee_object *object;
+	int i, np = 0;
+
+	qcom_tee_arg_for_each(i, u) {
+		enum qcom_tee_arg_type at = u[i].type;
+
+		if (at == QCOM_TEE_ARG_TYPE_OB) {
+			if (params[np].attr != TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_OUTPUT ||
+			    params[np].u.membuf.size > u[i].b.size)
+				goto out_failed;
+
+			if (copy_from_user(u[i].b.addr, params[np].u.membuf.uaddr, u[i].b.size))
+				goto out_failed;
+
+			u[i].b.size = params[np].u.membuf.size;
+
+			np++;
+		} else if (at == QCOM_TEE_ARG_TYPE_OO) {
+			if (params[np].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT) {
+				if (qcom_tee_objref_to_arg(&u[i], &params[np], ctx))
+					goto out_failed;
+			} else {
+				goto out_failed;
+			}
+
+			np++;
+		}
+	}
+
+	return 0;
+
+out_failed:
+
+	/* On ERROR: */
+	/* Put OO objects processed so far. */
+	for (--i; i >= 0; i--) {
+		if (u[i].type != QCOM_TEE_ARG_TYPE_OO)
+			continue;
+
+		object = u[i].o;
+		qcom_tee_user_object_set_notify(object, false);
+		/* For callback object, we hold a reference for the driver, put it. */
+		if (typeof_qcom_tee_object(object) == QCOM_TEE_OBJECT_TYPE_CB_OBJECT)
+			qcom_tee_object_put(object);
+		/* Put QTEE copy of object. */
+		qcom_tee_object_put(object);
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * qcom_tee_user_object_pop() - Pop a request for a user object.
+ * @ctx: context to look for user object.
+ * @params: parameters for @op.
+ * @num_params: number of elements in the parameter array.
+ * @uaddr: user buffer for output MEMBUF parameters.
+ * @size: size of user buffer @uaddr.
+ * @data: information for the pop request.
+ *
+ * @params is filled along with @data for the picked request.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_object_pop(struct qcom_tee_context *ctx,
+			     struct tee_param *params, int num_params,
+			     void __user *uaddr, size_t size,
+			     struct qcom_tee_user_object_request_data *data)
+{
+	struct qcom_tee_user_req *ureq;
+	struct qcom_tee_arg *req_args;
+	u64 req_object_id;
+	u32 req_op;
+	int req_id;
+	int ret;
+
+	while (1) {
+		scoped_guard(srcu, &ctx->req_srcu) {
+			/* Pop a request 'QUEUED -> PROCESSING'. */
+			ureq = qcom_tee_supp_pop_entry(ctx, size, num_params);
+			if (!ureq)
+				goto wait_for_request;
+
+			/* On failure, issue with params, e.g. not enough space in user buffer. */
+			if (IS_ERR(ureq))
+				return PTR_ERR(ureq);
+
+			/* ''Prepare user request:'' */
+			req_id = ureq->req_id;
+			req_object_id = ureq->object_id;
+			req_op = ureq->op;
+			req_args = ureq->args;
+			ret = qcom_tee_cb_params_from_args(params, req_args,
+							   num_params, uaddr,
+							   size, ctx);
+		}
+
+		if (ret >= 0)
+			break;
+
+		/* On failure, issue with req_args, e.g. invalid object. */
+		scoped_guard(mutex, &ctx->lock) {
+			/* If (!= __empty_req) then 'PROCESSING -> PROCESSED'. */
+			if (idr_remove(&ctx->reqs_idr, req_id) == ureq) {
+				ureq->state = QCOM_TEE_REQ_PROCESSED;
+				ureq->errno = ret;
+				/* Send error to QTEE. */
+				complete(&ureq->c);
+			}
+		}
+
+		/* Try next request. */
+		continue;
+
+wait_for_request:
+		/* Wait for a new QUEUED request. */
+		if (wait_for_completion_interruptible(&ctx->req_c))
+			return -ERESTARTSYS;
+	}
+
+	/* It is a RELEASE message; no one is waiting for result. */
+	if (req_op == QCOM_TEE_OBJREF_OP_RELEASE) {
+		scoped_guard(mutex, &ctx->lock)
+			idr_remove(&ctx->reqs_idr, req_id);
+		kfree(ureq);
+	}
+
+	/* ''Pick a pending request:'' */
+	data->id = req_id;
+	data->object_id = req_object_id;
+	data->op = req_op;
+	data->np = ret;
+
+	return 0;
+}
+
+/**
+ * qcom_tee_user_object_submit() - Submit a response for a user object.
+ * @ctx: context to look for user object.
+ * @params: returned parameters.
+ * @num_params: number of elements in the parameter array.
+ * @id: request id for the response.
+ * @errno: result of user object invocation.
+ *
+ * Return: On success return 0 or <0 on failure.
+ */
+int qcom_tee_user_object_submit(struct qcom_tee_context *ctx,
+				struct tee_param *params, int num_params, int id, int errno)
+{
+	struct qcom_tee_user_req *ureq;
+
+	scoped_guard(srcu, &ctx->req_srcu) {
+		scoped_guard(mutex, &ctx->lock) {
+			ureq = idr_remove(&ctx->reqs_idr, id);
+			/* Is id invalid, or no one is waiting on response. */
+			if (ureq == &__empty_ureq || !ureq)
+				return -ENODEV;
+
+			ureq->state = QCOM_TEE_REQ_PROCESSED;
+		}
+
+		ureq->errno = errno;
+		/* Process params only on SUCCESS. */
+		if (!errno)
+			ureq->errno = qcom_tee_cb_params_to_args(ureq->args, params,
+								 num_params, ctx);
+
+		errno = (!errno && ureq->errno) ? ureq->errno : 0;
+		/* Send result to QTEE. */
+		complete(&ureq->c);
+	}
+
+	return errno;
+}
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 5d33a8009efb..00e599d1582d 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -59,6 +59,7 @@
 #define TEE_IMPL_ID_OPTEE	1
 #define TEE_IMPL_ID_AMDTEE	2
 #define TEE_IMPL_ID_TSTEE	3
+#define TEE_IMPL_ID_QTEE	4
 
 /*
  * OP-TEE specific capabilities

-- 
2.34.1


