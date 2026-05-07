Return-Path: <linux-arm-msm+bounces-106549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EcoL/8X/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:53:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B04EFF92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFDCA309C247
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329543D6CC4;
	Thu,  7 May 2026 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKxR98FL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLFRJgYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7743D3CE2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194232; cv=none; b=b92JdcmSB7NxWTPFMHq3w/2cID8MLMtnIPS9DTHJAW8FcHd2exn5aWOlfP3ldVuZ3vQY/Bh+rUIzIj9gSbVPlxp1oq4mvKKrVKCp973nlU4cUK7mp0rOQBV1j4OsnpVBafRdZZDM5AzRFiMAJPQ6NSC7KEarOG7llvL4uXW5Gv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194232; c=relaxed/simple;
	bh=KTYQxoDHRK+AaxLzVW7P0uYiEE/yFjt5Rigb2R9yyTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwXd+I4Kgo9qUJjMludyQCpa2eQYrMN00j0BZw2pDLazhq0mgdqCRmUQHhBqqSi87hVED3p7RWuLPeRoXPC3AkrMcPJg3ysV1Ob84z4RBsa8VjjdfRE1WcUOsPAA8VIKVWxEelAhqqx+ycA0KJfRYTdpKPM34o2Ldww5C6L7R2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKxR98FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLFRJgYD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647J7MCi2530922
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=; b=CKxR98FLhzhXSFsV
	Mqz5y/JoLwgyfQLmiQ4OUDfi0QC6Z0fjQ45VahFmB1jG/WNQI4jNOi9KA5mpTsIi
	vheIPckggPKlCOE9nIMa0bJU+TpxWCvAYq6cufddqXbq0yaPUx7QdHKdh+nYR06T
	34vpxkWOVS1ULNQF2k6kcoDuPtWU7b+ej5J+kcEoXYfMtqU76OKWn8OUFlEStRAC
	YS4Aw5QwTLFq8w91TEHIeO4Ijta1mCfBQjBmh3dXPtZglsSwXpgjChsRixiXadqM
	HJaqdqa0NmS0rIkmMQLR94MdehFs1ya7Qi2uTka91iL1f7rlxHNNXnUi5oEggVWv
	R/jyIw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9rm3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6313c9d983fso81896137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194229; x=1778799029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=CLFRJgYDP/R82vxmlOqcthSl3rPCa8+C8luB3uOgVs3LBmxPy/vExI5Mzy2CJvj6I0
         fXiAw4y8gExZMYxo7ZjHQtVt1Rcw3NmWT4T6KzcrcD4Ce74q/LhkbAxIxG1v+hufpCoj
         +WiAQjl+zhpuxm0y9PMzQo0yjLcl0rLOaobZqOqVX8mMNMVp3NFvWj7NCbuuZwIkbkZP
         LApDC4lIVpnKHzsnGjHtOt77jFGP1Mc3QpdWacvu2l3U+8ACPV0RC24xXBjmGs/MRn/3
         KBKY7cxi4oMIRMAxmwPI+14QzycyoqbddlXtKzjeDyNHaeZJDzNUE4xfboA7bd/xV+M3
         NXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194229; x=1778799029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnBfolT3jX6CNISr4JxMcRA7ySnkS3THYsCQYykqpxA=;
        b=E4wEFfbENRvT9bspdSV+RRHEMi+lkUWTid/5YsjbekxKVlF88hKNpoy7eYMy+YH39f
         OC3uy+6JOAJ6AW+co5bdCuKykhdjhMXe/TqYrhyS8J4US9CYl++1f8mZumfOYzdjsnPj
         ItysfjY2I9kIO5WfVI27EY4/9ii04QWDhQBZEGEt7gkXMkuCvPz1MlxtsGXe0+3FGX7v
         A4b9zvlStthXV7RYiVzZKekxiHKH+mpZtTj87hV6DL6DM+vVBJViS9OzWoaRRZUwyFNd
         ht+QzFSQ74aEwXSrZf2wFbdBRtJ7S/+yznn7RqiiVhbpPMaGCQIHp/Oe+cCgSypGPvU5
         2s4w==
X-Forwarded-Encrypted: i=1; AFNElJ8JdaK36LzZ46vQI6h3kx9m+SsL7L6WwaRrZm9RmQ1o2PgokHrf61IeGGo671l50w/Hg9q4Fw20+UIJWOx2@vger.kernel.org
X-Gm-Message-State: AOJu0YwvbZsQUeuA7nSdeKOJ+LDaNus96Q5NXi0lXNMEw5vTSbu5381F
	lLrTsiQ1MtEq8snmFEpDG6OH6suQfodYRWUzNVKu8Oeh8zIxZn09SQQJab3C4KyjpC2PHpePNFo
	TSdZczad2jUwnG6GfGdH3dUh1Z0yumnxVz+l7I/BFCo2vNQ/MGzMhhTwXnHrjdYzjzQyV
X-Gm-Gg: AeBDievOWXzKaCcx0DWhHNYBri8Jbs6dElL7/pUiHM7yVAgpMQ92IA15bBTqWnqpr1K
	S6A/1DgkWuG/OyAFPQ5ke4PeAasp9SVcevn8DwI7GOJXxp83mjwWqaVgzM/LTgSqpokiHSy3BDF
	pM99ZnlVuCTSwQ/DPJMsCUxzKRpHSJwOjmaPvPJR4m5fNrClBdmTw3XPp+sbX5OZPsFBSgHgJ8E
	FPnVKPLuGvqUGf3UpBl2j4CBnbWCpuf6zN8md7vgLcFuVIR8d1F3EQkCrD3GMrqkXLWYrBa67C2
	kCAijoGoX6qCOkec5il/ELq5u5GpYSos9EWAhExeyafAShcUBKHJTxJwUbFX/mlj4bih5znlIOJ
	Cc/tqRLWXFk2hoo8zPKmJxngjfpT17bUjtS5R9ng1FQRdVbY3o3YFY7ldPdnHz2ufIk9fiq2bYr
	qji3TwYDFV6oMrB2Tatdpghr/r0WE=
X-Received: by 2002:a05:6102:580a:b0:62f:3c55:d41f with SMTP id ada2fe7eead31-630f8e6a743mr6379577137.2.1778194228840;
        Thu, 07 May 2026 15:50:28 -0700 (PDT)
X-Received: by 2002:a05:6102:580a:b0:62f:3c55:d41f with SMTP id ada2fe7eead31-630f8e6a743mr6379564137.2.1778194228416;
        Thu, 07 May 2026 15:50:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:23 +0200
Subject: [PATCH v3 08/15] media: qcom: camss: Add camss-isp-params helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-camss-isp-ope-v3-8-bb1055274603@oss.qualcomm.com>
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
In-Reply-To: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rkOIl6LL7nFi1PgkBq806FXxKq1NYHm1
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fd1735 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ELVW7ba-Z2avb-AJsJIA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX12IVsJNYBRtN
 aZYVvgZnk22N31lEYnqChyLBS0pqfuRiGOLKJq8d0yW00mB3Z6Slc7WH2A8366Xl6D23KG6ZwII
 iP7r5M3CUV12gZ90a/Caoh6XDupQTxgu2X4hIfN5XcWFZPIFXB9PzF+97h/aq+GValnNelo4hif
 2BQf0cHJtuPxipQ9+SVWLV1TwkmTQLzkY8usdmr/8nnZMDxR6ttPKaOtMxFE01uE1ql3UEuVkBc
 m2HeEr9I65m0ghN9ZEUAMGreac/ox7oROAx8q7D4S+vjNIYIx3gbahJLNeziALoX265yJGu7mpH
 v8GNQwF5xUFHPhrDeeC/SDliUdD1DZCtKzeGxhH8xhFM3YqeeyMeUACXzlBG0qW9l7avp2+7HgK
 jaFfwHrF6pqKOZ0CPqGjU85oS4z8CHjkwqnfRWDYSwwE85O+Cv7ysPxzv84iZeqsrMkKxzcCWkl
 B1EEhdQLJJC4Z8DCXbg==
X-Proofpoint-ORIG-GUID: rkOIl6LL7nFi1PgkBq806FXxKq1NYHm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070231
X-Rspamd-Queue-Id: 344B04EFF92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106549-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add an ISP parameter buffer parser for CAMSS offline ISP drivers.
camss_isp_params_apply() wraps the upstream v4l2-isp buffer validation
and adds a dispatch layer: after validation each block is forwarded
to a driver-supplied handler indexed by block type.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |  3 +-
 .../media/platform/qcom/camss/camss-isp-params.c   | 67 ++++++++++++++++++++++
 .../media/platform/qcom/camss/camss-isp-params.h   | 62 ++++++++++++++++++++
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index f3acb1b54b6c1455d72e2d947c860f0c337648de..fba6f34b8d9f70ea258f7ae1a293a8d58d866498 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -32,7 +32,8 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
 
 qcom-camss-isp-objs := camss-isp-bufq.o \
 		camss-isp-sched.o \
-		camss-isp-pipeline.o
+		camss-isp-pipeline.o \
+		camss-isp-params.o
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
 
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.c b/drivers/media/platform/qcom/camss/camss-isp-params.c
new file mode 100644
index 0000000000000000000000000000000000000000..66dc717bb3a2a26707d206e537691deb4d58f04d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-isp-params.c
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <media/videobuf2-core.h>
+#include <media/v4l2-isp.h>
+
+#include "camss-isp-params.h"
+
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv)
+{
+	const struct v4l2_isp_params_buffer *buf;
+	unsigned int remaining;
+	unsigned int offset = 0;
+	int ret;
+
+	ret = v4l2_isp_params_validate_buffer_size(dev, vb,
+					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));
+	if (ret)
+		return ret;
+
+	buf = vb2_plane_vaddr(vb, 0);
+
+	ret = v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_handlers);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "params: version=%u data_size=%u\n", buf->version, buf->data_size);
+
+	remaining = buf->data_size;
+
+	while (remaining >= sizeof(struct v4l2_isp_params_block_header)) {
+		const union camss_isp_params_block *block =
+			(const union camss_isp_params_block *)&buf->data[offset];
+		u16 type  = block->header.type;
+		u32 bsize = block->header.size;
+
+		if (type < num_handlers && handlers[type])
+			handlers[type](priv, block);
+		else
+			dev_dbg(dev, "params: no handler for block type %u\n", type);
+
+		offset += bsize;
+		remaining -= bsize;
+	}
+
+	dev_dbg(dev, "params: buffer parsed successfully\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(camss_isp_params_apply);
+
+MODULE_DESCRIPTION("CAMSS ISP parameter buffer parser");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-params.h b/drivers/media/platform/qcom/camss/camss-isp-params.h
new file mode 100644
index 0000000000000000000000000000000000000000..4cedfbc745f81655569ff8bdd8e389b35f2c67a7
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-params.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-isp-params.h
+ *
+ * CAMSS ISP parameter buffer parser.
+ *
+ * Wraps the upstream v4l2_isp_params_validate_buffer() validation and adds
+ * a dispatch layer: after validation each block is forwarded to a
+ * driver-supplied handler.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_ISP_PARAMS_H
+#define CAMSS_ISP_PARAMS_H
+
+#include <linux/types.h>
+#include <media/v4l2-isp.h>
+#include <uapi/linux/camss-config.h>
+
+#define CAMSS_ISP_PARAMS_FMT_INIT \
+	{ .fourcc = V4L2_META_FMT_QCOM_ISP_PARAMS, .depth = 8, .align = 0, .num_planes = 1 }
+
+#define CAMSS_ISP_PARAMS_FL_BLOCK_DIRTY   (1U << V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(0))
+
+struct device;
+struct vb2_buffer;
+struct camss_isp_fmt;
+
+union camss_isp_params_block {
+	struct v4l2_isp_params_block_header header;
+	struct camss_params_wb_gain         wb_gain;
+	struct camss_params_chroma_enhan   chroma_enhan;
+	struct camss_params_color_correct  color_correct;
+};
+
+typedef void (*camss_isp_params_handler_fn)(void *priv, const union camss_isp_params_block *block);
+
+/**
+ * camss_isp_params_apply - validate and dispatch a params buffer
+ *
+ * @dev:          device for error logging
+ * @vb:           the vb2 buffer (used for size validation)
+ * @type_info:    per-block-type validation info, indexed by block type
+ * @handlers:     per-block-type handlers, indexed by block type
+ * @num_handlers: number of entries in @type_info and @handlers
+ * @priv:         opaque pointer forwarded to each handler
+ *
+ * Calls v4l2_isp_params_validate_buffer_size(), then
+ * v4l2_isp_params_validate_buffer(), then walks the validated block stream
+ * dispatching each block to its handler.
+ *
+ * Returns 0 on success, negative errno on validation failure.
+ */
+int camss_isp_params_apply(struct device *dev,
+			   struct vb2_buffer *vb,
+			   const struct v4l2_isp_params_block_type_info *type_info,
+			   const camss_isp_params_handler_fn *handlers,
+			   unsigned int num_handlers,
+			   void *priv);
+
+#endif /* CAMSS_ISP_PARAMS_H */

-- 
2.34.1


