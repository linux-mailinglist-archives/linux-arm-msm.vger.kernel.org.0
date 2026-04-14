Return-Path: <linux-arm-msm+bounces-103031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FOnM1nK3WknjQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:02:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBE3F5983
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A29A3082AB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 05:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B70225A38;
	Tue, 14 Apr 2026 05:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTER+EvD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyWDK5j+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686223E342
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776142847; cv=none; b=BdifOnE/D/hPmcOcdTCyoS7gvK8jXaoid2pB1jYx+Y28INx4grODdFGz7scucy+Wt/UkyqQ46S81wxWIkDgzTnDjJp3teLcKkB0PCJy4Xt3hi/2JNe19cGUF19iTEJpNszSMzIy3jSdDgmUsGrkH9eaduHWZ61LXO6erAZPzcQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776142847; c=relaxed/simple;
	bh=O/+LYBNLdxSQKzsqIETsJYp7ERapNlu6dOUA1n/zY1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AnGapwjO+2sz8j1eQP+JGIDqPwgHGq+bQzMXUhZ8NnUi94uZsffvPWjoixTF4JhfuuWhvvI9HOr9VmvDK42LW+E1CSooLcGtirfxOp9rwaK5qqmQKGAn9lTAdXsywMG3KqLpEQBuunvZXIxfgD8EYBilMgzh4sB6GCkU6TRul4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTER+EvD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyWDK5j+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLCkkt3505463
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=; b=aTER+EvDjXvlAJW5
	TlY5GnyLlKiAQsaeWrVAVP9RxVQZfv11bAGqCoh3DCxVVZjzaW8tvnWyMhIKwMnC
	oGDB3RtMERTZG4jB8MIB6gl9o35WJveIkbNvJyUOk0zLrVl2j8UlP/0MO77tqzOH
	3m6G1dLimpXTSileapV3ClkdmbdF+kvMCsQ+lN1l09FmIc5/twjboYrQs0dQyPlg
	YDouvOnq5DMS+97jSK7hCW3kqgXh+wTyLr46C1mZpzhIs1Cc92dvWvx2DALgzmQy
	DLXciOipw+pwHhmzDvdgDIlfdFSvpWDYmsiVL5RIJU68Yz3vUSCdjVwr0rjKhbTT
	AoOtMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870h2dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 05:00:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24308165dso97138355ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776142844; x=1776747644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=;
        b=CyWDK5j+kWqkju4+0WHSpfAWPWPWac0PNC0a4TJv6nJKgGNM8T4+wDa0vjlqGCCBga
         XU+1YZ+7js6MZWhG50kO6OE24eFpSCMtN9tAk2kYDyWzdO7gZ9biWyUuf1CIQTJLHE9g
         uOGeNd9YxyuTY18SgVHYQitlsAOfBOUiAQgpr1pLK6SovsYwqIFy4gUJ1nH+3Rp0N8On
         oqrIbX8TwTgvekvH6OfnhDVzBZoFS8w/6cOVn0XDV2p+xowwpw2A0AiM9uLZF4g1L4KB
         c9yDf4FZ+0g8Ta82idoJkSJFqRLY7mFBRjP1aCZChxa5EN0o9uhSqzjS5JWmar1oIT6T
         YRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776142844; x=1776747644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aMuxr0+9TcjyPSsVh1aKRVut6k2RFbAyhAme7P42Vtk=;
        b=Xl6J8KlE48jPAwoLKlgoqiNJh4g6HP7pnPtBtujDQIV8sv0fqRgPJpo71xrPD1Jdwf
         5jyGqLMIETCXfn25KglD8gqyhiKFx6pnxCDQaBuD2wd8lYerbLdyF/7OQEB2rlfPuCLL
         iqck7b1QfLDqfiM1XU+XjUyhh3VmqPQHhh9oZqFO8zRg0wr5Cns2pw+QNCjrnuqXpDk0
         wpI9ClwobG1Bg/6P/NGqI7sAlbiquBN8u2nQ5Xmh9oW8VCIBWyhtH+ze333yXeVFeSYo
         H1sCv1CcmWhtFmY+RFKnO2ejez+du/VxhEHJMJGaDk59ArzDhbvL9XnY6h7zZkCNA81C
         r3oQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HeezXd54gBzXlZHD8jMsVBG7Hid2ndkOCx75pa541Oc8gXWXLg5fuIqQMfQ90xV0/le78gEomg1CZvVvv@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxcZOR23OyEZHbIQ27fb4bZDyBQgUCsnxjVyGvvcYbLYpit8e
	+LRBWUqvI7K5hOGoHNjyM8sB6VGqBKymzPlcKgHKp9lalSrbnWHAfayV8XawZpTQb0NtQ0bnNUh
	gCHjhdnbYDRDwxrCmmPYoOGTj9HphFpPx6s353RiEfoEZsrHAbavbJ55r/GycBBMFFe/d
X-Gm-Gg: AeBDievCHP7m848nkLpVKK8fzI0u9dbcTU5Nktgd/7+r7LzxOXpGqmMH/UGrc9zdkf5
	lJk0iykBX/ZodAGVXKRs/boXankbd8hJVz1s5MmHIENbGUBlSilb0BGjWGMW2/e8nfA7gao+uwx
	frB2b9IzieY7DDwDkQW1LKKuEG7nr2Qz68TCAo0t4NESiA89UcOWil7FKWGS/15d6uHtuXTxE93
	pXrOfaociumZPXINqsVCmJXYvGdxOk61042K/omj9H67heGLqa4eWr5tl/Rs1HolOXfDJU4XVaI
	Y1yD6OPzwvQoe3TDKO6tYSsB3nEhas0Y4hPyG1Krb/GHKlt/+LLXsJrARQU51B2Hwgqr1vJctbq
	KlCvRQp1JdNLwe2GyTHQ+xiSNCwVNx4Ztl/rTlzLZ9rlAszIDxBB/UVs=
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr163151865ad.41.1776142844345;
        Mon, 13 Apr 2026 22:00:44 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr163149055ad.41.1776142840556;
        Mon, 13 Apr 2026 22:00:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4db198asm134678425ad.3.2026.04.13.22.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:00:40 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:29:58 +0530
Subject: [PATCH 02/11] media: iris: Add iris vpu bus support and register
 it with iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-glymur-v1-2-7d3d1cf57b16@oss.qualcomm.com>
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776142821; l=3184;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=BLj6gT5dri/81+O7yZmqLEqPFKVnYkph8y79xh/glKQ=;
 b=CoGStrTZzo2YY89yPHj3q/r7F4MIOhu+D9erCHhYmDQtaV1B3scc6o2IWeu9zxPQyPiT3+/xc
 h1eQmTmUADyDR0dF+fULi7AeeXpqUSCxBO8lK/QAXPRHgt9Zaxy9Tes
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA0NSBTYWx0ZWRfX+mhzode1NAbs
 pbGxhhcZt94o2RMNia7hxKKbaIbXqfZIE/QlfneJMYGXekrIAqwOhD3snpyQLGRu2v0KQCbbV1H
 Y1TfSYUt1iB0Dl7NevT6rGBNWcLK2ZScuVQSJiI1tbr2zohZuHIwA0VvcL+tnVjEwogpZ1lQGyM
 QHKmQLu3apnSjKIHI/uBkUCgnp5HZVRl8Pp5yzSeH5A2H1MpQMA9LfuGmOynnloEoVKqxqtG3A8
 SnpQoTxGWgFONa6hU649gFrGnnMTB+HSm6r6qnQIqKu0n2wwRd0xJj+qAmM54Vw4UaWBe1Z3sUt
 9HHPU/6sRaMk+3vmV8OIxy+AkJomuVNFWTvMbCYSuLmAlIZdbAotBe1crmTK022vlfj7Cea1vww
 9UwoKlycVDONnFfmVEKBEzhD93Xz/h2FPF4O+zAe8oBbZ8PY09asXbQSqlh5sYk2qSc0Qa4LUwo
 REjGUuxPBx2t3Zfx7QQ==
X-Proofpoint-ORIG-GUID: cX5wau19OMUZWCMyBXEy8Ck_pKMg2iiw
X-Proofpoint-GUID: cX5wau19OMUZWCMyBXEy8Ck_pKMg2iiw
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69ddc9fd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Liwi-oTqB0IuMEU3Zn0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140045
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103031-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36FBE3F5983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add a dedicated iris VPU bus type and register it into the iommu_buses
list. Iris devices require their own bus so that each device can run its
own dma_configure() logic.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c                           |  4 ++++
 drivers/media/platform/qcom/iris/Makefile       |  4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 32 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 13 ++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba78206..d8ed6ef70ecd 100644
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
@@ -179,6 +180,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*
diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..6f4052b98491 100644
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
index 000000000000..b51bb4b82b0e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/of_device.h>
+
+#include "iris_platform_common.h"
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *f_id = dev_get_drvdata(dev);
+
+	if (!f_id)
+		return -ENODEV;
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, f_id);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
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
index 000000000000..5704b226f7d6
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
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


