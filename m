Return-Path: <linux-arm-msm+bounces-77279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7A3BDC3B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A941892E6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 02:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF36F30EF97;
	Wed, 15 Oct 2025 02:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqWVub3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E1230E0E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496989; cv=none; b=cRzPS+7jYPhH0tLcYI8JF0jcAdBxQu/aXyzjtSGJx17F7wc56Y/9KdPgjycZwGqCedtvtS0srPeMsIQI44VSNKffF7q8vPGGTNkoCQ2rjs+asTZDcXjaWky+PcRqCQ87vjpfD+7uuK2yz1oPhw/wcxRa8sBpr7lTlxiJfiEOk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496989; c=relaxed/simple;
	bh=Z6O2OrlDMzBHDdDrCZTHlK61XvxHW5TQmv96UBZ/V+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxdWTfXPDk3h/Oxk4K4yRBI5rOoIMXpH8Zqe6tQg/BkbOLO0eDZq3LYuQHJ8VqwCgsdNXvihyOctyDa24h+F5Jqd4ton7zYtSqXYER3+GHVQvJq+ysR3aJRTYYD8KWsWE6S6wZ5inKmtddhGArW632W+Fzh5T7XoDVR+ne0xoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqWVub3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sLd0016314
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9y0YWkkvo3E7ykXJ7KZEtC5SPW6tu6/8/RV4/SaMjCQ=; b=lqWVub3cgCZv4oGE
	btdijSC4CY6M2krrjno4hpDb9/Ayw2lJ1busvUMXgtboK/l4iWrNC3e9sP8AMHAb
	G1X07CFAxZcj7ijTWiMbz5syJhG+kBJDHdHb9XIxsYFz0BUs5XvJRZZ+DQG97pYa
	zBk2ffafIDM+TYm04cMuxuPYUrRowcFQuh/oaoMoGPP9H09c2083WSH+en20C7ht
	H/jGnofllHbweHX/JL7cP+WejAnlZhu+xWRV6iJKlhfoH+goyN4DRlgAdWngqa+9
	e4d3+SnRTU8p7SX8sREBv9Mg3cKHFhZ8WZkQu/lGgWNOH6CvdBsFQhLi6fFAD/P1
	Wv0pRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdkatuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:56:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2904e9e0ef9so131145815ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 19:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496984; x=1761101784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y0YWkkvo3E7ykXJ7KZEtC5SPW6tu6/8/RV4/SaMjCQ=;
        b=DAR0OpJBudvEZPuUcsFVpd6fYALdwEzM8FA3okBCUI0DlUUD/LCHg2LXbl2DQTtLKV
         L0+OcXWoHjE3fsBHygOHsNEvS/WpDfpAhy2CtZgGOdfqPwpDky1wx+Wws0IlKDRgWU/6
         E6+i5Ctmnedv0OJxAy3MEvobijMlWhIJSXR5LX+XmB6UjBMICLAxekGgB5AfUS5OOA9+
         F6MNRiPo8+Igfdy+GT7tuPw/Iv6+ecwJ5qo9t74XFbmigPD7/tA7nhxJopQjbP6hAnbY
         y+5xfy9ggmsBia6SJnMXQXNgMHomepbuAv9nuW0biQx4j0/mju0sYvNlGl0LYle4GDQk
         XT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMYGMWxxbFhutbfEw1eu803f+JSMOkdrzK5EN98X8TDnH+qbs8HG9+R/WshRa3IGC9cGZTvuuppyFi9+Ta@vger.kernel.org
X-Gm-Message-State: AOJu0Yw61Nm+pztrthLwc0dwIRiLqkZ8uuaLIonRWjBI+dBE+crP2uGW
	B1qUgPjnw1s5lqvan5nYQow0Mfwf4x9ByGIknD5sCn+BIVqKYKpJPSw6eyiv6XNSs8DfKPOQ5P2
	8OLj/2o9lNgOWyWaIgJW48S0jLrwJeCDTcPbTirdmTTJmjR3LwsZ6YAlJb2IL3ujESUyq
X-Gm-Gg: ASbGnctw+tpAHziIUCOq73JcpRlGHAwdHZlmlWnqXKC7oyTXE4V3HVdLDhatbbK2zgc
	RHDf59Eg9xaoNAFm0T+6SR/ZrBYDOOxh1ivfj9ATH1pStXbZxdXBadYqi6fULFnJUqtxOTHWAZj
	iBN/ovKaDXNH6akdws1FIPYss4jfDnIV0NGumbeocjGwIxVsKRzFkL8UeclAXw5mtYm+6+5SuCB
	1mpexMey4NwMJrneX1KEcKKslNsh01jSXBZ3zcUVfp4LMI5rn0OHO9EwxyGdmfAI20R35+bD+Ux
	0BDFnAb7JSyemy0jOSEXA4tA3jHmrfllAOCkALX3IzmJ1G7sAbuPwgyzFYaAhQJZjIIgtNMnoLF
	x4yGfpiwecE9Nuod0H+Y=
X-Received: by 2002:a17:902:e78f:b0:269:74bf:f19a with SMTP id d9443c01a7336-2902735639emr334559635ad.11.1760496984212;
        Tue, 14 Oct 2025 19:56:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG18yuj5/u+6WlhyLpaBFCJDXhP7gR0AcZ9ntpaM9uZ+huPSh+lAyyEN5DDo9SKvp3euQ1oCQ==
X-Received: by 2002:a17:902:e78f:b0:269:74bf:f19a with SMTP id d9443c01a7336-2902735639emr334559175ad.11.1760496983662;
        Tue, 14 Oct 2025 19:56:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de54d2sm179122855ad.12.2025.10.14.19.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:56:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:56:06 -0700
Subject: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
In-Reply-To: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: DvFAzLIpfkJ5NgUvvFIxgFDNddaJJifh
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ef0d59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VihgKR5E_TO-SwyxCUIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: DvFAzLIpfkJ5NgUvvFIxgFDNddaJJifh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX9Z5vILmCiqF0
 CJ3rZDLYv+jzp7bboeQWAb/ppjVcIAixA65RIW1RvaXDfNXphDU5SN/Xlv7qyE7z7s9/mFZZq5p
 CkWLUgVgh2bja7SdwvqICXNoWkH+83+t4Nb/fa7u6+WsZkoG3uM0GQibOOhXBKCPgccN7upPLWK
 FN0ah/QQGtEM5OvBFcKF5YMjzIfnrkEKo4MKqe9FM9kGHfpPEKUTpBlLCSmXpkRuOwtNnW1DzQi
 TuPABZowI4HNkBCQcoq83n6lmiRVH2fgwqAov2hGzzHDNi0WPtbDN0fRGzglgCqLs/AguvcnzWt
 o+f5ONJLlgZ2yNK3//tXBDeR9DVdaasxr07J7z+vjQnVV5KRjfbZtSjktG2d2FagbqBIxHMe8wn
 4N2I3HX8y+FbrS7sIyLX9WPCNQKsxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Add Video Front End (VFE) version 1080 as found on the Kaanapali SoC.

The FULL front end modules in Kaanapali camera subsystem are called TFEs
(Thin Front End), however, retaining the name VFE at places to maintain
consistency and avoid unnecessary code changes.

This change limits the VFE output lines to 3 for now as constrained by
the CAMSS driver framework.

Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile         |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-1080.c | 188 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 143 ++++++++++++++++
 5 files changed, 342 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 3a7ed4f5a004..dc41b0d6dc21 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -22,6 +22,7 @@ qcom-camss-objs += \
 		camss-vfe-340.o \
 		camss-vfe-480.o \
 		camss-vfe-680.o \
+		camss-vfe-1080.o \
 		camss-vfe-gen3.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-1080.c b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
new file mode 100644
index 000000000000..5637e85a7786
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-1080.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-1080.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v1080
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+/* VFE-1080 Bus Register Base Addresses */
+#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+
+#define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL		(BUS_REG_BASE + 0x128)
+
+#define VFE_BUS_WM_CFG(n)			(BUS_REG_BASE + 0x500 + (n) * 0x100)
+#define		WM_CFG_EN				BIT(0)
+#define		WM_VIR_FRM_EN				BIT(1)
+#define		WM_CFG_MODE				BIT(16)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(BUS_REG_BASE + 0x504 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)		(BUS_REG_BASE + 0x508 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)		(BUS_REG_BASE + 0x50c + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)		(BUS_REG_BASE + 0x514 + (n) * 0x100)
+#define		WM_IMAGE_CFG_2_DEFAULT_STRIDE		(0xFFFF)
+#define VFE_BUS_WM_PACKER_CFG(n)		(BUS_REG_BASE + 0x518 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x530 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x534 + (n) * 0x100)
+
+/* VFE lite has no such registers */
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x538 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x53c + (n) * 0x100)
+
+#define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x560 + (n) * 0x100)
+#define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x564 + (n) * 0x100)
+
+/*
+ * IFE write master client IDs
+ *
+ * VIDEO_FULL			0
+ * VIDEO_DC4_Y			1
+ * VIDEO_DC4_C			2
+ * VIDEO_DC16_Y			3
+ * VIDEO_DC16_C			4
+ * DISPLAY_DS2_Y		5
+ * DISPLAY_DS2_C		6
+ * FD_Y				7
+ * FD_C				8
+ * PIXEL_RAW			9
+ * STATS_AEC_BG			10
+ * STATS_AEC_BHIST		11
+ * STATS_TINTLESS_BG		12
+ * STATS_AWB_BG			13
+ * STATS_AWB_BFW		14
+ * STATS_AF_BHIST		15
+ * STATS_ALSC_BG		16
+ * STATS_FLICKER_BAYERRS	17
+ * STATS_TMC_BHIST		18
+ * PDAF_0			19
+ * PDAF_1			20
+ * PDAF_2			21
+ * PDAF_3			22
+ * RDI0				23
+ * RDI1				24
+ * RDI2				25
+ * RDI3				26
+ * RDI4				27
+ *
+ * IFE Lite write master client IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * STATES_BE		5
+ */
+#define RDI_WM(n) ((vfe_is_lite(vfe) ? 0x0 : 0x17) + (n))
+
+static void vfe_wm_start_1080(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm);
+
+	/* no clock gating at bus input */
+	writel(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
+	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel((WM_IMAGE_CFG_0_DEFAULT_WIDTH & 0xFFFF),
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel(WM_IMAGE_CFG_2_DEFAULT_STRIDE,
+	       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	if (!vfe_is_lite(vfe)) {
+		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	}
+
+	writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+	writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+	writel(WM_CFG_EN | WM_CFG_MODE, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop_1080(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm);
+	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update_1080(struct vfe_device *vfe, u8 wm, u32 addr,
+			       struct vfe_line *line)
+{
+	wm = RDI_WM(wm);
+	writel((addr >> 8) & 0xFFFFFFFF, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+
+	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n", wm, addr);
+}
+
+static void vfe_reg_update_1080(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static const struct camss_video_ops vfe_video_ops_1080 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init_1080(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_1080;
+}
+
+static void vfe_global_reset_1080(struct vfe_device *vfe)
+{
+	vfe_isr_reset_ack(vfe);
+}
+
+static irqreturn_t vfe_isr_1080(int irq, void *dev)
+{
+	/* nop */
+	return IRQ_HANDLED;
+}
+
+static int vfe_halt_1080(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+const struct vfe_hw_ops vfe_ops_1080 = {
+	.global_reset = vfe_global_reset_1080,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr_1080,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.reg_update = vfe_reg_update_1080,
+	.subdev_init = vfe_subdev_init_1080,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt_1080,
+	.vfe_wm_start = vfe_wm_start_1080,
+	.vfe_wm_stop = vfe_wm_stop_1080,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update_1080,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2753c2bb6c04..0084a1a1e71d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -349,6 +349,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
@@ -521,7 +522,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	ops->reg_update_clear(vfe, line->id);
+	if (ops->reg_update_clear)
+		ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
 		dev_err(vfe->camss->dev,
@@ -548,7 +550,10 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+
+		/* Deferring the reg update until after CSID config */
+		if (!vfe->camss->res->vfe_res[vfe->id].vfe.is_deferred)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -1998,6 +2003,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
+	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
 		ret = 16;
 		break;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 0300efdb1c46..47851362edd4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -133,6 +133,7 @@ struct vfe_isr_ops {
 
 struct vfe_subdev_resources {
 	bool is_lite;
+	bool is_deferred;
 	u8 line_num;
 	bool has_pd;
 	char *pd_name;
@@ -245,6 +246,7 @@ extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_340;
 extern const struct vfe_hw_ops vfe_ops_480;
 extern const struct vfe_hw_ops vfe_ops_680;
+extern const struct vfe_hw_ops vfe_ops_1080;
 extern const struct vfe_hw_ops vfe_ops_gen3;
 
 int vfe_get(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 74a8ad3cb728..033fdaaff7f5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -217,6 +217,147 @@ static const struct camss_subdev_resources csid_res_kaanapali[] = {
 	}
 };
 
+/* In Kaanapali, CAMNOC requires all CAMNOC_RT_TFEX clocks
+ * to operate on any TFE Full.
+ */
+static const struct camss_subdev_resources vfe_res_kaanapali[] = {
+	/* VFE0 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe0_fast_ahb", "vfe0",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.is_deferred = true,
+			.has_pd = true,
+			.pd_name = "tfe0",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe1_fast_ahb", "vfe1",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.is_deferred = true,
+			.has_pd = true,
+			.pd_name = "tfe1",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe2_fast_ahb", "vfe2",
+			   "camnoc_rt_vfe0", "camnoc_rt_vfe1", "camnoc_rt_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.is_deferred = true,
+			.has_pd = true,
+			.pd_name = "tfe2",
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 - IFE Lite */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.is_deferred = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 - IFE Lite */
+	{
+		.regulators = {},
+		.clock = { "gcc_hf_axi", "vfe_lite_ahb", "vfe_lite",
+			   "camnoc_rt_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.is_deferred = true,
+			.hw_ops = &vfe_ops_1080,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
 	{
@@ -4493,10 +4634,12 @@ static const struct camss_resources kaanapali_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
 	.csid_res = csid_res_kaanapali,
+	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
+	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1


