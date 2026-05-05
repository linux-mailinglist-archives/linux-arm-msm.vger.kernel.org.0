Return-Path: <linux-arm-msm+bounces-105844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHdGEg6X+WmB+AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD1A4C77AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA93C3012866
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C853DE434;
	Tue,  5 May 2026 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fAGChe7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw6eUOi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C453DE42D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964458; cv=none; b=dtMFAQp0v70kkYbxYuS4RFmTIvve+B1SP+aUzAcqOT6iV9xpDA2Q3ANC98JQQMCrfTP1N2A6Iv6fChUX+jKUb1GVaJnTOHJ3G4SD7KPthc4Gnt+YTFUEwWdiwt+s6lD0MA5LCwantBlzKSACBLu4iBcJ0WWC+HOOdAe68TNtK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964458; c=relaxed/simple;
	bh=GBsVTS4l4F18YjaJ/58wFmxWqzuYLY1cBZgZWMYpxjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCGEgZgxoxVoitdsIzFRyJNfgr6nhZ/0C2fF3QcNxRQe8rlRhURgT9YKDlwrPiydUhf1B9HFAR6S1TfxzEvv6u5CKZU55Wy3qTqyLYk+rtSFY0ykPh650Qkq0V/yVR/K3AFTQL/kwtzqENgE1X9S4NMBBEL/0gFvwSEkJJypARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAGChe7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw6eUOi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644N1V1e1346410
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=; b=fAGChe7UVOMBRufp
	kgDdxbQCI6hbedldr9OdcJd2uYM0KMIBGgf2C+CTPePrGRAsm22D77DrE+XsE/0L
	DE9Ut5d5g7Uv7wi/L9/HkHQe07KGazcR5oDX99CiyeP9INItMmjj9EkswtiLLFyc
	++8wrdLl6r77RUa77anB7HrwgJpTHW2Qyet694PLHjS7TaTrMISX2VPSXQmDhvYx
	yRb8j9YdKnMJbThgd6Wxv3sYpeBnWn5OiptWHrxSZMHV9NI5vbOON1Nst11bjLA/
	7s9F7dsA5IarmKXXwkOVLVcz4Tco2OKO7QEhHGaGA1MUo9Fq3IPnanuFvlJXW4gv
	YP6lQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xaunr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:00:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362eaa3aa61so4993229a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777964456; x=1778569256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=Xw6eUOi+mKOV79uD91gL+dUeqhlmK1WuriSAPUnbvnkZnWe1wts56jN/gSLHB4tTcC
         6ZAgZVHHGcpnih5bdJsaW1xmZMlueib2Z+X2Bs+E7stsmTtIYvTuXrHRNbtlo3HiQR43
         +o7C2ZpytQ6+tSbH6ZF+XYKt7PUP+qb75bppW9o9y/UlWQ3Df533d58k00K5WH07OFGz
         76qbwI9ymDg9ySIJwDwEoMf44kR6J1Avn0NjDA+T9U1hxvXjx6qDmFbhd3thJ1qk3MqH
         18EsqOn1qDqD34iAN26b10Ose0A3t5ZGo4C+p9l1VQ+b1wNrnS1hini2Xql+3SXDZdvL
         A9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964456; x=1778569256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4907GskeGPyGqTJtsNAB5xkShzE2fjp5lObjsv/s6Gg=;
        b=IEueb+yCqOOdg0Z+hWePLe/Xj1v4N7ovo7lrNpXFmmO4yMy+sthcP7dNMk/mpLb+nn
         ddADwuoy0dihx7WOfRlrVpTsA/nAqpgx8PDL7ujNTmWDiH4o9WdRCBGP2VnGpHgThA21
         KI56Vc09c439RUxXONuFcYsrpXYy0zXaWVWtB9Ag0F0KEO161DC7aTp/7gT1BVTOrsu0
         FT5Rj0PYhA/qwxYxoT2qIv8oY1/2cUGCKXQ5V0Q2cuGNdF2nSoxlIM4QSsDnHuIcjG7K
         06xTdyQ0R43r8fqmbYR8xZxv9dctKJwTAyTPs/erRdzXfvkKg3G6Hl2NA3z/Q0WKCIGf
         MUpA==
X-Forwarded-Encrypted: i=1; AFNElJ+vYalEYFXL46YwpJ63blJ7bn28prbYZc+QGA1Pc+YjqYPtQQTiiTGGB4FeyoWq4uf07N4zwqnlSvRxIGen@vger.kernel.org
X-Gm-Message-State: AOJu0YxDKhIGWeJB/K1fryLy559rKOu7gBUAAD/bzYc/3eR7NELLupGO
	ipjNjWm94It43EXtYG+2aLK34a8Y2blog3r5EcRpaBNlysT3MpFnsv9YmEQ0rQH3a1nJ8Yr8rDL
	dP9UIdn/0r0JFxLxgYxWovq8Kysac7pJiW9NlZdT93QJdnyBc6DSAyTxMpzrzuNbgepzaCqHBEE
	mY
X-Gm-Gg: AeBDievNsgAtC1LOcS332BBEsbMX86hOSNQtE/CH6ZyFl/HfUtv56RtTpyH1uKjbVD1
	jSSuiQp+ihdfQq2hz/KVJcxyXxABE5OyoJhgW5sDkHqgHTXKUZ7qhNiRBYLTfClzsRtDLylLh4J
	BTtOF/skFwQpfZjfxp0+66Y1ZX2+G8bLiWS3mQhfJM6AvG/1ycDNLTOoC6pk9gcPEPEejbmFC5M
	eoatiKW6ykVBMOqoi7IFFu+bObxhcEQP8SfFDZjNqGBmrswc29rhr4cLDRa5tZB+KyrVP/9dvZM
	4jvuhgV60CVfpSTEWI5nM2qjnUoKvsVj3zmugZHSsLB+63X4ixdddI88ZLo0dMnipUcy00AAFRF
	nwRr74RVoBp7i42dholMI+8kLO6wXPhP8KTT3nsTHu6ByB+rD77MEsgix/y2MoWGgxA==
X-Received: by 2002:a17:90b:3852:b0:35c:b02:b5c1 with SMTP id 98e67ed59e1d1-3650cd4b20bmr12478769a91.2.1777964455534;
        Tue, 05 May 2026 00:00:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3852:b0:35c:b02:b5c1 with SMTP id 98e67ed59e1d1-3650cd4b20bmr12478736a91.2.1777964455015;
        Tue, 05 May 2026 00:00:55 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ebec73aasm13840146a91.2.2026.05.05.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:00:54 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 05 May 2026 12:29:25 +0530
Subject: [PATCH v4 04/13] media: iris: Add iris vpu bus support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur-v4-4-17571dbd1caa@oss.qualcomm.com>
References: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
In-Reply-To: <20260505-glymur-v4-0-17571dbd1caa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777964421; l=4228;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=cziP+P95lYoSiLg+5MW5xEwescL6vgvBBGLLAvVvoEY=;
 b=z+TxP8+TZXII4YxwxLPEEiwyjbixnGpOF1iRrVP5dnfHNH7GveE3tEOR8baGkU0hjom6PxRZM
 XT2scITxFhZBiRhXAqziGcNG6vqtiYPOORJHYpuj9ehNh/ilSBrOQny
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f995a8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rZQGDrx4aKZhb0zF23kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: LOWLkDets6kp_8tBkP0M3EEApe-YLbP9
X-Proofpoint-GUID: LOWLkDets6kp_8tBkP0M3EEApe-YLbP9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2MyBTYWx0ZWRfX+XeEnaMW4J0A
 lH0pjDWdSFhK4feiTXtwF2cFO+cExCIkZzeamtlOXArh6VNURoMy53yS7M6189VzJ2vgM9iAbWo
 cK8jmsv0440GBIapZMpjADTsvuoFRCMmgjrBH6mGDAC5wBTbVmRTK7rt195aS2X4K0GAR2jhGhA
 AoQYy4j0lHEwHJpI2Yj7/hJS2vvh7MFVmMaBQ+zOcNU5by/6YVcvkUyXNm8s3VschGefkUNT3mA
 UhrUegsXhFun2Y91xanroopt19Cc+biRCwo/bKbdaygCceVZmyHSqb8Cd/v5TXjU5oGxQ+zRF5n
 8hDMD7dcYcokSTlZA76sSclDa27jXMDa/1QThX9WPuSDt8qkNe6ISeQr10ANmTWX2wxOyt6JV+4
 iFma7ulI5VQ5yyQlk8hfcgvyghAvpbhPRxybGZXWOZaIHogvZbAMuswqQDH6WS/+msN9bq5GQWh
 Eu1rllMLNXfK+C3MmkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050063
X-Rspamd-Queue-Id: 4CD1A4C77AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105844-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,linaro.org,gmail.com,8bytes.org,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

On glymur platform, firmware loading needs a separate IOMMU mapping with
its own stream ID. This stream ID is defined in the device tree with the
assosiated firmware function ID in the iommu-map property. To create this
mapping, a separate child device is needed so the firmware memory can be
isolated in its own IOMMU context.

Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
and its dma_configure() callback calls of_dma_configure_id() with the
function ID provided by the client to map the corresponding stream ID.
This sets up a dedicated IOMMU context for the child device.

Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile       |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu_bus.c | 69 +++++++++++++++++++++++++
 include/linux/iris_vpu_bus.h                    | 25 +++++++++
 3 files changed, 98 insertions(+)

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
index 000000000000..15ba4d9c563e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_bus.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/iris_vpu_bus.h>
+#include <linux/of_device.h>
+
+static int iris_vpu_bus_dma_configure(struct device *dev)
+{
+	const u32 *iommu_fid = dev_get_drvdata(dev);
+
+	return of_dma_configure_id(dev, dev->parent->of_node, true, iommu_fid);
+}
+
+const struct bus_type iris_vpu_bus_type = {
+	.name = "iris-vpu-bus",
+	.dma_configure = iris_vpu_bus_dma_configure,
+};
+EXPORT_SYMBOL_GPL(iris_vpu_bus_type);
+
+static void release_iris_vpu_bus_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = release_iris_vpu_bus_device;
+	dev->bus = &iris_vpu_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	dev_set_name(dev, "%s", name);
+	dev_set_drvdata(dev, (void *)iommu_fid);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(create_iris_vpu_bus_device);
+
+static int __init iris_vpu_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&iris_vpu_bus_type);
+	if (ret) {
+		pr_err("iris-vpu-bus registration failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+postcore_initcall(iris_vpu_bus_init);
diff --git a/include/linux/iris_vpu_bus.h b/include/linux/iris_vpu_bus.h
new file mode 100644
index 000000000000..750e878e489f
--- /dev/null
+++ b/include/linux/iris_vpu_bus.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _LINUX_IRIS_VPU_BUS_H
+#define _LINUX_IRIS_VPU_BUS_H
+
+#include <linux/device.h>
+
+#if IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS)
+extern const struct bus_type iris_vpu_bus_type;
+
+struct device *create_iris_vpu_bus_device(struct device *parent_device, const char *name,
+					  u64 dma_mask, const u32 *iommu_fid);
+#else
+static inline struct device *create_iris_vpu_bus_device(struct device *parent_device,
+							const char *name, u64 dma_mask,
+							const u32 *iommu_fid)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _LINUX_IRIS_VPU_BUS_H */

-- 
2.34.1


