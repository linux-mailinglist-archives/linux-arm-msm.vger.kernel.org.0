Return-Path: <linux-arm-msm+bounces-94460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKmPABasoWm1vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:37:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD21B9178
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5766730B5553
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565A7264A97;
	Fri, 27 Feb 2026 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q65pcQVl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8hcnguv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CEE28A72B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201531; cv=none; b=Rwobg1RM/YE6W+gb9u6QsSpbXfQtTfPl+q08vw8Dy+HAToTf3pGz7nCZAlXLvuY+Z7rflcrFTevkezU87OrRwAksoG7cZNQLsAAeG5Nr1tJTRE4nN6a3OFnbRtnQEPBxT29oPwYBF2OL1p0ga834Ajpyhd84YJiym4d920ob0w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201531; c=relaxed/simple;
	bh=U92x4HK8ifTfTc7KDp1LdFqO8zaCFAO9kJosDhnhP6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0QOorTK/yP5yLWVykAMWCOl1opFXCrtctBbudZtFu7GcXlcQvRvXdB+aHm9r537SaPjHFBS3Qt7/TwQ/8McJDKdadsZ6ISG0CAFtCDLXouJBXfTxwXopzzEphGcHYI34Br2T9QlKIQr9WSwFGUzam5Sz4rUDypWEJa1EiMRQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q65pcQVl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8hcnguv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RA5BMa2438882
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7evXDkp68Lk/Qex060cCqT9IdjlmfPgNN/jVLkSNYnk=; b=Q65pcQVljEviw5uM
	NE6OLn/BzQCgI4QfPM7Mg5EPISxiLeb7yIl8ZUmsF/BN9DXQhbk1VELYG+YEX/Z6
	ZE6vjX5J0zeWfr8Awf7vNv92LhBMImpNx64/jlOQFbZJEZMgXLs6VoJ10R3RUM5/
	W0TRYQdjh4LvgRwNOOnuA9tkuR992Ap9qhbh2R2WvPaxc1yFae6FqSlEynO3zrE1
	Hzw84cmAqsxvpPL5ipY8P6cWlbF6gqXaP3FbGH+ZXN51IxvU9CiBrr3JtlL5hHbM
	+VdxmKOEiw0chqw0tz+FOV6IW2p7xjh2tH+j7CjKdKfL1C8iMdlEnUJViIkx7Qy7
	qFrcww==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cju4r3mu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:12:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ae04f58b19so110891505ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772201527; x=1772806327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7evXDkp68Lk/Qex060cCqT9IdjlmfPgNN/jVLkSNYnk=;
        b=O8hcnguv5l91eor5z3gVSa5vfCEqJTzWJJRwkNIeqOQNYAKLqcXXTUy1dqOfywtq7v
         5uZNxl19lHZITzhUD72TirNJnj3FBWjByU4dXxrloyq4A8magll/1xs9NYDDFlBt7A9d
         U4aA1b5pc8eEjPhyMhifoXybm7VmhLtqqxcciEaOvNTI9zHuG6J5JAkKXEXKXyGUsr5t
         6irMe6tIKY/Suvzt4IlQMcavj9ofTWLzVrnYNvCcBm/boIXSfnr/YjA949bnxAYb/QND
         ru2JEj3NcaDRCnBGPGkNNJnsd3hLKkDLMDx53jVIXduid4shReyBLLoyZ8SGu0v3lMPG
         ghBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772201527; x=1772806327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7evXDkp68Lk/Qex060cCqT9IdjlmfPgNN/jVLkSNYnk=;
        b=VE74z8LKFzLF+XitAjYBI7Tzouy/53YCm6z2EOEx7ztbJP83dtBEfQc/3Z2Wy5rsIS
         7/BEmUJhimnB25p0tRXs6kCx+z2eWgdjkdjcTIGwmBMS519+SDrfzp2Lmi75HO+TE6Xy
         hx5axfgONaFsIED9ctyDAH6SGN5K4AWDtgpS9xMSYhPXtve3gn6pg7usEY7XBQEwQDUV
         fO37BMk+4+aN9CE1Br9xJPK/CgjsCzrcF6GVHtnIU9F4Hqm4C34pnM/pep7qzliuX8CW
         irZFjcKrgJ0BLHfaXs0qfmjxxATX9Eci8aZ4+9S/nJPZOHaY+fn88/xOfa2mtjD+iAmV
         bvvQ==
X-Gm-Message-State: AOJu0Yy43eJT1rngJeVJoxFdRHujKnw6u/OL3khiDt+i8Svr7VVt6gSz
	aKcKarproS6o7tCuiVs4ShoYf0l9ZjEjYSqjDh8cZBmLSuUF6fUXcBT2bfezTf//sAJhPG56b1k
	Tx0pUhW5vil51CgwRIjqT5fYUF99Kd0fMazyM/yx2XgGxhtlHMCNNazY26OaW1IUmC3ZZ
X-Gm-Gg: ATEYQzyupSW6XQGY5l7Bx/zMUhZcilQk9bpF0N+aZSQ/65TlTdIuALTOKNraOha+Vs0
	jcIjDs6Dw/c0cnbdW7CsEHrwJaL/oh9giyYbljHbQGyETsRLwhtkTHFbwvHXLYRO9NqYvPnetOS
	EQNl9tmLiu9O4I/7lEtgOpF2KDdg58BEN0zecnFllYuRvGFfeCC4hep8GegPl+vLUR+fVggc/EU
	veam8O5/ajRh6C8wc5oJdcAPVSAkICW5xgz7JKqR9NBcSR6sJ4xdFIS2qoGanE4SDOhRRHgP/yD
	u+EBce1wkK4zRSbCwjoT5eBSx0GG6h26S7mJSznM6Q2fPSGNBOBPlJsTU1TwBUlSyRIfE9Ba+ob
	W0eYJEL67/jJ23aBCGLl7qYty1X0S9yDcIAkVYBhjytUQxrnvtYajIzEq
X-Received: by 2002:a17:903:234e:b0:2aa:dbd6:605 with SMTP id d9443c01a7336-2ae2e4a6614mr29882195ad.28.1772201527059;
        Fri, 27 Feb 2026 06:12:07 -0800 (PST)
X-Received: by 2002:a17:903:234e:b0:2aa:dbd6:605 with SMTP id d9443c01a7336-2ae2e4a6614mr29881645ad.28.1772201526422;
        Fri, 27 Feb 2026 06:12:06 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c183bsm60960865ad.24.2026.02.27.06.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:12:05 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 19:41:19 +0530
Subject: [PATCH v2 3/7] media: iris: add iris vpu bus support and register
 it with iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-kaanapali-iris-v2-3-850043ac3933@oss.qualcomm.com>
References: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
In-Reply-To: <20260227-kaanapali-iris-v2-0-850043ac3933@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772201499; l=3490;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=U92x4HK8ifTfTc7KDp1LdFqO8zaCFAO9kJosDhnhP6c=;
 b=jdoVUXk3ET+htylIX0X1XEbkBToNTf2jOc9KKhrCWMXdPhu3YPQv2BmUon/kkqdBROBOyEM7o
 qizaR1+CEbLA0+aQDi9/0NKs4UrPVKujei++EHWVa4ezUq5HPmKMb7t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyNSBTYWx0ZWRfX8VAZFI76QOMk
 qVvyZLxA54IzQanYA6r8/yP/TcybT6Ls77xAacVQGsMDUCefzHd6cdhXAg/ae7h+p0PMi53IjUB
 sAWkZE2WmleJtsXPRvtwEQokM/6UOEGbbdvs/bfk+cfztz8ponNufvPxdWglN/8Mlf1yCTwxZiy
 Z3AKLNqRm1qiPdivKOebrlQAGoY944o15nMdB0KVvJkm4lMiVU+YulauQBQvHpsIx7stxf/B0zk
 GnhfVUKn8HY02lhMiho2jFeQg4tgYh5yPHxc5kgEATIgU4TETj5WlinLvsyiI21UJEUh8XkIHwN
 06uiZaFtP6YpvbuRpYpXFfG9RfoEPs369LgYXaWjcNF/wuKUtXpx8RdUp7EmxF9RLhYno5xVxAA
 oCWEDZ/IHzq12YR/Kc8sXWq4du3tlJYu5C0yBxvJhNdXK6eP8NHvj9qARNe/6Po9Y6fGEvdi9ua
 udm3vqwaKAZKIJjtNtw==
X-Proofpoint-GUID: JvXqduSwG94-1YHtGkMwQYgU21GQ-Qp6
X-Authority-Analysis: v=2.4 cv=KZzfcAYD c=1 sm=1 tr=0 ts=69a1a639 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPm8v14ksbA5Et2Ge3oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: JvXqduSwG94-1YHtGkMwQYgU21GQ-Qp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12FD21B9178
X-Rspamd-Action: no action

Add iris vpu bus support and hooks the new bus into the iommu_buses
list. Iris devices need their own bus so that each iris device can run
its own dma_configure() logic.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/iommu/iommu.c                           |  4 ++++
 drivers/media/platform/qcom/iris/Makefile       |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 13 ++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 35db5178095404fec87cd0f18e44ea97cf354e78..fd5fb7c10da22ab548d359ca1f44504acc3d646c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -178,6 +179,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af07e52bf372a4b2f352463529c92c..6f4052b98491aeddc299669334d4c93e9a3420e4 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -31,3 +31,7 @@ qcom-iris-objs += iris_platform_gen1.o
 endif
 
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
+
+ifdef CONFIG_VIDEO_QCOM_IRIS
+obj-y += iris_vpu_bus.o
+endif
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_bus.c b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
new file mode 100644
index 0000000000000000000000000000000000000000..34ce78d9b0ff1feda15ba4f060a56d02749a0858
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/of_device.h>
+
+#include "iris_platform_common.h"
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	struct iris_context_bank *cb = dev_get_drvdata(dev);
+
+	if (!cb)
+		return -ENODEV;
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, &cb->f_id);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static int __init iris_vpu_bus_init(void)
+{
+	return bus_register(&iris_vpu_bus_type);
+}
+
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 0000000000000000000000000000000000000000..8aba472fcadd269e196b7243da5660deaff31abb
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_VPU_BUS_H__
+#define __IRIS_VPU_BUS_H__
+
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+#endif
+
+#endif /* __IRIS_VPU_BUS_H__ */

-- 
2.34.1


