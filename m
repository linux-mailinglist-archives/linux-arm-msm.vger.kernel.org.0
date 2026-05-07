Return-Path: <linux-arm-msm+bounces-106545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HkDGJgX/WlLXgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EF57F4EFF1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 00:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B8F0307996C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 22:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF383D47C2;
	Thu,  7 May 2026 22:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEqAB1J2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX84c+y5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EA83D332E
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 22:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778194220; cv=none; b=jlQWD3eFcJGdh5sR8a1ewwB+SsJSncMK5uqMdwisFdI77w9NshXZ5158U68jZY1vfkNf2GKqW0zgoHxvkYIYQEO+akQOQBiAiCPHW5K0fk4HtjFSRD0xwpsDGh3UclK/Qzb+LJ4GxcxAGqo+oOXSXUBPQFCThNuK4MAo76Ggya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778194220; c=relaxed/simple;
	bh=7Krz7pN0WV1WEwE+SM/17Byvte7UfrNb2WulyP8M938=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KL2t4vweDo/aOsNxR4glQE8iILSWoUnqRDKGWPmY5p4CLgCZ3wUq0c3vVQ0K1pSYCBOKQYCCssVIewR5BRHkWt8zGp13Oitut34N5h8nFyz1sw4S8ej/h8nNA5cKndPAOglkF+PHOO06S7vonMCceDeWhDYsttQnlE4FYdk1aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEqAB1J2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX84c+y5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647LZQK54069446
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 22:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=; b=aEqAB1J2DNsPcjx9
	jt6JhCscOwesf++9Opc/65eYqOp9+o9pH0P1OK0YX/DoQqFuGZkL6bKiMGyaGhBi
	PYIOBMk0+NKRy4Tc07QkEyMlUq3vNYLvjqJlmqHqwyLedYLUVGDy+dQOmVNMKj8m
	mHIa4qdfP9dcDxyrE0L0g8y0WhLJqpqMsJXW0Qa6W0Xw9uljkJ70x37gxigrp2ft
	MWo7nnRtFniQQMFnz7b2w6pA/+EYUq6F3cOvgdwXrb/ykr7CJPqHJdgbVw3MtgEu
	f4MPSYU8hA8KqaF7+CZV4meeTP7ow9Lss4NxwzHZVs3JtFCKDBC67E7ukK5cG97Y
	1N8SRQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp05uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:50:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62e94ae0479so5172733137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 15:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778194217; x=1778799017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=;
        b=RX84c+y5180DBXRSkor5q/VBH98Zc5SnwB7x3xKVbxIEayRsx2JSYC434xN7OfTAIw
         8LQfeJ4544XSoh7IjBObFTtokzYachdLfh0OWVhN9JY9GjTh/4xTO/WtchVoe7aYY7u/
         WnZDkuDD/IrgMlikceSRDEBlwYfk6Ds+qWoBPvfTca6VtFlw73m1d8i3H4rfiyEaEcqD
         Kr7750m/nM3SNPwBvlPzhQRBeb0ipLHI9ftOcLYCkrGZihec5OpvYCTGUK7eUHPV9KyX
         4L3KV/VZJOXbowAZYvi0whJeHfltGeRqj+ya4Texw35MYLJyroyeBJ6AhF7qg8ydOifF
         Q4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778194217; x=1778799017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MkPXhNFKpgj51RT3nXElFSkq09L7clUycFsPNU23WU=;
        b=jCACaC3XSS4T+5SYPr4hUl+PaMil1qnxHRd/OMuu4tfgsiRykeOwNbi6AuQGFsYW3g
         xz0+TbX6REy8D5qH7Vn+q/tM0M/iR5znH7LR4jSYzDO/clvtw8cbm6PWbukDn/ZkBsuE
         8vEGeBn3LNBIV/DBnlO/yHHUZusDfq4e/HyrB21plQlu8QfFhlgoYDimyqomOo1jye9W
         uBHHE7iMhmrAdkdiVOdBm0kw7LAIROAi6RQGzaB5XS4LpnYV+7xQRXle3fJtj4qv9BsP
         gx4xSRWBNMB7Jgplx6w+bfSSFMZ7kIFHEko7P+blB6lJ87itgFfKcMHTsWI//yrZ8f3i
         vKRg==
X-Forwarded-Encrypted: i=1; AFNElJ+C61HYkLl4GFmsmVRNsrOcHMFGVOJalhP1Zep3ROi5F76y9ZcZ/T8Knit5wKL4ypfOnx9YQE4on3v5e7v7@vger.kernel.org
X-Gm-Message-State: AOJu0YyLHvFVGwlKB6lIUYZWMSRf2ZmxaTMGGJYM4/CxQpdh0im01gUD
	nZGUykZ8ay/WS2/Vs22l9Yi7O+vDjv598cKTRTuvH7RSNIYQCfBY1hNh9Nvsb/+memr8ko0Ck4v
	SP+Q4Yf/+lMXF9ZKaiPm7FVjlfoketcSV2ggUumPUowpHSgRGA97wFKi/G1njy03B7HH8
X-Gm-Gg: AeBDieuue9p39495jzoa6hnJ4lcvGIHy6+Jo/UJLCFlMpeEq9HELmz1f4pHIn3GVygz
	CZuazurvVIpbLILBK9CdvxVq1Z/xrPNAV1mFrn433o/lBlvjr37aMGyMQ85faEqj1x8o6iemeLq
	fou6tQV3Vtaoxm9PmU/K4upwHAxg8d8HrHSEd5EHcoM7xni5NHgo+/NVweZADQH1b1Ycl45cIRs
	4KACwaUiNBLENMXVPp31nlEqzPK0xAo+hW5sQ6+Pcxzfd/GxBHsUX/bsN+VPxscL5Twe5GxYrUM
	ukAIYE/s6rbqTYETlU8PlXVMDuD17bRn9bZhEaCRUeDgc5G0qSmrgqen2nfFttTnIqf0b/Qtk2b
	pAW0BAjsOKgu/WBoX7oxWeUSHVHLuhzrdOZPhm73svtAXt8rX84mS0HUTNFgh1ylk99V5Ln0ChV
	iGugdPSsAb2/NWs1NN/O2E3GoLWXU=
X-Received: by 2002:a05:6102:1497:b0:62f:4854:8c53 with SMTP id ada2fe7eead31-63115f8712cmr2441536137.12.1778194217103;
        Thu, 07 May 2026 15:50:17 -0700 (PDT)
X-Received: by 2002:a05:6102:1497:b0:62f:4854:8c53 with SMTP id ada2fe7eead31-63115f8712cmr2441524137.12.1778194216623;
        Thu, 07 May 2026 15:50:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:b16a:3475:ec42:bcfa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac4359dbesm102466b.48.2026.05.07.15.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:50:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 08 May 2026 00:49:19 +0200
Subject: [PATCH v3 04/15] media: qcom: camss: Add camss-isp-bufq helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260508-camss-isp-ope-v3-4-bb1055274603@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDIzMSBTYWx0ZWRfX51vVzYAPehYY
 RauYdRXSdHy9lW4cGAETt1REaqx4Wkz1tt1D1AUCeBmfHNhZGd6PKDL0LRdg7BXP5dC+CJnZ9yo
 5pGJEwa1qcNXbgUWggLi85mu3r7bdIrbTNjzqnr1RTCHfLlTbTEmou9u5lRkp4xnZdLNPsA4Upf
 lUomS5Xx8JlkMlv+ntsRGWIqbggW4d47yAqbiiSWQ0+r6cN3BEFvfROxQ1ElOVN0yDu4b3yFjWn
 SZ7Zfc++kbINnwDhnkBJZchQbo0284ochJYVuoaifgwKO6sWkkARGO+Toh2L2llpvvTLv0Ty72g
 kMyeByOdj5LPyysKTy7Zf8rDm9gTY+y3yZMeQlhma14jAkB+i8nmQ3X2F/WE/DSNo+pWKFevRd/
 G4S4L1xjrNTJWC8lqH7qIlBrVgRng9nhdBbLkAWKIIp1qkITKULw2xhyauWhuTjw8hprGscqeKm
 fHTpFA5U2yYui+HhtJg==
X-Proofpoint-ORIG-GUID: ZdJ-gkm45VQEekzlSB6UoAoZG85LZUIe
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fd172a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Rj2g1MzNgR17_EpZbusA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: ZdJ-gkm45VQEekzlSB6UoAoZG85LZUIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070231
X-Rspamd-Queue-Id: EF57F4EFF1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106545-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
buffers, one per queue index. This can help multi-queues management
and synchronization in ISP context.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Kconfig          |  14 +++
 drivers/media/platform/qcom/camss/Makefile         |   5 +
 drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss-isp-bufq.h | 122 +++++++++++++++++++++
 4 files changed, 242 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..d77482f3f5eadc65856806b9b237d65ea484f267 100644
--- a/drivers/media/platform/qcom/camss/Kconfig
+++ b/drivers/media/platform/qcom/camss/Kconfig
@@ -7,3 +7,17 @@ config VIDEO_QCOM_CAMSS
 	select VIDEO_V4L2_SUBDEV_API
 	select VIDEOBUF2_DMA_SG
 	select V4L2_FWNODE
+
+config VIDEO_QCOM_CAMSS_ISP
+	tristate "Qualcomm CAMSS ISP common helpers"
+	depends on VIDEO_DEV
+	depends on MEDIA_CONTROLLER
+	select V4L2_ISP
+	select VIDEOBUF2_CORE
+	help
+	  Common helper library for Qualcomm CAMSS offline ISP drivers.
+	  Provides buffer queue management, job scheduling, MC pipeline
+	  topology builder, and ISP parameter buffer parsing.
+
+	  This module is selected automatically by drivers that need it.
+
diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 5e349b4915130c71dbff90e73102e46dfede1520..bfc05db0eada1d801839ceb8a3b157baae613053 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -29,3 +29,8 @@ qcom-camss-objs += \
 		camss-format.o \
 
 obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
+
+qcom-camss-isp-objs := camss-isp-bufq.o
+
+obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
+
diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.c b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
new file mode 100644
index 0000000000000000000000000000000000000000..b1dcf60afcc63d112eee7bd143f08a7b4aac9a18
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-isp-bufq.c
+ *
+ * CAMSS ISP per-queue ready-buffer FIFO.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "camss-isp-bufq.h"
+
+struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues)
+{
+	struct camss_isp_bufq *bufq;
+	unsigned int i;
+
+	bufq = kzalloc(struct_size(bufq, entries, num_queues), GFP_KERNEL);
+	if (!bufq)
+		return ERR_PTR(-ENOMEM);
+
+	bufq->num_queues = num_queues;
+
+	for (i = 0; i < num_queues; i++) {
+		INIT_LIST_HEAD(&bufq->entries[i].rdy_queue);
+		spin_lock_init(&bufq->entries[i].rdy_spinlock);
+	}
+
+	return bufq;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_init);
+
+void camss_isp_bufq_release(struct camss_isp_bufq *bufq)
+{
+	kfree(bufq);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_release);
+
+void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			  struct vb2_v4l2_buffer *vbuf)
+{
+	struct camss_isp_buf *buf =
+		container_of(vbuf, struct camss_isp_buf, vb);
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	list_add_tail(&buf->list, &entry->rdy_queue);
+	entry->num_rdy++;
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_queue);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq, unsigned int queue_idx)
+{
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	struct camss_isp_buf *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	buf = list_first_entry_or_null(&entry->rdy_queue,
+				       struct camss_isp_buf, list);
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+
+	return buf ? &buf->vb : NULL;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_next);
+
+struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq, unsigned int queue_idx)
+{
+	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
+	struct camss_isp_buf *buf;
+	unsigned long flags;
+
+	spin_lock_irqsave(&entry->rdy_spinlock, flags);
+	buf = list_first_entry_or_null(&entry->rdy_queue,
+				       struct camss_isp_buf, list);
+	if (buf) {
+		list_del(&buf->list);
+		entry->num_rdy--;
+	}
+	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
+
+	return buf ? &buf->vb : NULL;
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_remove);
+
+void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			  enum vb2_buffer_state state)
+{
+	struct vb2_v4l2_buffer *vbuf;
+
+	while ((vbuf = camss_isp_bufq_remove(bufq, queue_idx)))
+		camss_isp_buf_done(vbuf, state);
+}
+EXPORT_SYMBOL_GPL(camss_isp_bufq_drain);
+
+MODULE_DESCRIPTION("CAMSS ISP per-queue ready-buffer FIFO");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.h b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
new file mode 100644
index 0000000000000000000000000000000000000000..1a8bc7b112a1b039233cfc7be573f1f40fcda7c9
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-isp-bufq.h
+ *
+ * CAMSS ISP per-queue ready-buffer FIFO.
+ *
+ * Provides N spinlock-protected FIFO lists of ready vb2 buffers, one per
+ * queue index.  Drivers call these helpers from their vb2 ops and job
+ * completion paths.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef CAMSS_ISP_BUFQ_H
+#define CAMSS_ISP_BUFQ_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <media/videobuf2-v4l2.h>
+
+/**
+ * struct camss_isp_buf - vb2 buffer wrapper
+ *
+ * Use as vb2_queue.buf_struct_size so buffers can be placed on the
+ * ready lists managed by camss_isp_bufq.
+ *
+ * @vb:   The vb2 V4L2 buffer — must be first.
+ * @list: Entry in the per-queue ready list.
+ */
+struct camss_isp_buf {
+	struct vb2_v4l2_buffer	vb;	/* must be first */
+	struct list_head	list;
+};
+
+/**
+ * struct camss_isp_bufq_entry - per-queue ready-buffer state (opaque)
+ */
+struct camss_isp_bufq_entry {
+	struct list_head	rdy_queue;
+	spinlock_t		rdy_spinlock;
+	u32			num_rdy;
+};
+
+/**
+ * struct camss_isp_bufq - multi-queue ready-buffer state
+ *
+ * Allocate with camss_isp_bufq_init(), free with camss_isp_bufq_release().
+ *
+ * @num_queues: Number of entries in @entries.
+ * @entries:    Per-queue state; flexible array.
+ */
+struct camss_isp_bufq {
+	unsigned int			num_queues;
+	struct camss_isp_bufq_entry	entries[] __counted_by(num_queues);
+};
+
+/**
+ * camss_isp_bufq_init() - allocate a multi-queue ready-buffer state
+ * @num_queues: number of per-queue FIFO lists to create
+ *
+ * Returns a pointer to the new bufq or ERR_PTR on allocation failure.
+ */
+struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues);
+
+/**
+ * camss_isp_bufq_release() - free a bufq allocated with camss_isp_bufq_init()
+ * @bufq: bufq to free
+ */
+void camss_isp_bufq_release(struct camss_isp_bufq *bufq);
+
+/**
+ * camss_isp_bufq_queue() - append a buffer to the ready list for @queue_idx
+ * @bufq:      target bufq
+ * @queue_idx: queue index (must be < bufq->num_queues)
+ * @vbuf:      buffer to enqueue; must be embedded in a &struct camss_isp_buf
+ */
+void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			   struct vb2_v4l2_buffer *vbuf);
+
+/**
+ * camss_isp_bufq_next() - peek at the head of the ready list without removing
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ *
+ * Returns the head buffer or NULL if the list is empty.
+ */
+struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq,
+					     unsigned int queue_idx);
+
+/**
+ * camss_isp_bufq_remove() - dequeue and return the head of the ready list
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ *
+ * Returns the dequeued buffer or NULL if the list is empty.
+ */
+struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq,
+					       unsigned int queue_idx);
+
+/**
+ * camss_isp_bufq_drain() - return all ready buffers with the given state
+ * @bufq:      target bufq
+ * @queue_idx: queue index
+ * @state:     vb2 state to pass to vb2_buffer_done() for each buffer
+ */
+void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
+			   enum vb2_buffer_state state);
+
+static inline u32 camss_isp_bufq_num_ready(struct camss_isp_bufq *bufq,
+					    unsigned int queue_idx)
+{
+	return bufq->entries[queue_idx].num_rdy;
+}
+
+static inline void camss_isp_buf_done(struct vb2_v4l2_buffer *vbuf,
+				       enum vb2_buffer_state state)
+{
+	vb2_buffer_done(&vbuf->vb2_buf, state);
+}
+
+#endif /* CAMSS_ISP_BUFQ_H */

-- 
2.34.1


