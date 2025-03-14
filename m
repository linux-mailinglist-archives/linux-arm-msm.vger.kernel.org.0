Return-Path: <linux-arm-msm+bounces-51519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA91A621DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Mar 2025 00:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8F719C6190
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 23:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01681F8916;
	Fri, 14 Mar 2025 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBevlPbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594B21F585B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 23:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995366; cv=none; b=T1Qk6naIbkgaJNYyYlAG9hqMZtXiQB34wkIevQ9lrJVUy3vcuskWjQUxpBCudLFzlkjDvBQKvzvaWrU9fJCwq0VUnhuhmKFf3B4WQ9gdjFcYjyKiRFRD8+ujiSjmlxoMBYzKL1LtFUaN6mKN0HXP+xxK1IclBM08qjy3ZjgHarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995366; c=relaxed/simple;
	bh=od5Z1Svn8BYbFzs98UBOgL0BUpzTDGbd+1gcxYEsBeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXHtFVE8ZD2u1mNOjSlbQD4z3ykQg+GCXF+r1iM+LYBcLPLQuj4w7iGdBKvLjFBrFMOHFsvGbf8zlLqLoX/D+ziI3NhCNlfM3STwVnlyHvKx8l9MVUGkAYtjvjFoaz8rz7xv+3pPa3sEFLujD/BXpjSU6aXNtQ85W51AUnrUy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBevlPbK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ed007aacso523675166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741995362; x=1742600162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15nxH5caHACIfumG1mxHa3lLrfZBiG2an8ZU5x65FLw=;
        b=RBevlPbKZKuXxd/13zDWqNLiRjpWIqaAv8Bj/oZjDI0Y6HMRENscNI3i356htz9SMb
         CAaBsI0aZ63Pe/mC68BV1vv7FGNrKSBoDza+JWVv4y3td/1c7OsfUDDBeCac7hcS7dYB
         PJNjsX3tsEn2FKrMI3Ve3tSxyZykHPvAdwrg0NtduDbLRFJMyCpI93RkRLAwgb/PE7TN
         v994fwPo2BjmPPi0yfs/KKey0wFWjM9AQ+nQ/ajVFEmoSShU35+DLBWoDY+ei9zInS9s
         ibKTHXq+plEU6KpUFdKp7bkO8eXaP3F+mJZqw38VtVhxGyOrjTpg95lBkRweJDtSNzDi
         py1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995362; x=1742600162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15nxH5caHACIfumG1mxHa3lLrfZBiG2an8ZU5x65FLw=;
        b=Mch7XRpvV6gi9rCTgdLvl7WDCsADdBwUADJsDgg0LYAkB8fp1mqsbGIJc4WM/Imcvp
         zsBLOWdYWwMFgfGRtBYCT+4dshLxQqZz/xdoLKHFgSBXeeSsJnh5AdqAcQ+Nnb8DTCEX
         s74gRgZeuax4gpf/81W8ccihLUs9EKEE7xSH928U3LIsL938y10iSlbk3+50DuFN922q
         P/RkC74KvLiz3iGs8odT2E9g6mbcqO+qd/QzmvunuDeszekhxxelKidf+t6lQkW0yYF8
         RdaSAssCZNtmd7nr8u9r58AbA8U54IWkoYzEVZpgct1PeFe6J5MZJn1X7khCkvQp92Pb
         fBVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUt16sEywaZs/77CMvlFXAstDopMu8dIZo6z27xxKAtYwWQQoOmRRr8JcXSKPah5ckWTrIrsjIwf9rmgAl/@vger.kernel.org
X-Gm-Message-State: AOJu0YyAlOXExT60bQD1OITeqN3MGZnUcLPAOg1S8b34NagEz5g+uBd5
	tgBx364/xuast7rxnpsAH64wLT8afegtMAUDgt4VlHzjvwTdvRr5RL1v5s3aYyM=
X-Gm-Gg: ASbGncuG4oXq1o+WzSDkhFBSz+Tid57VJVS8hqmwllleeo7//o9aIlZ9x4EU/sT4uAF
	P/gohgVg2crY1VCmsu9NxE7gT2PW3kQ2d32wVUz7Dwnk9FnYFGJtnfYn+/2ZMihEise4z0K+HIt
	fIEXkdoX38lKAf30OytGNFN1ecLeLcF1pSQIvoQ1D+R3BPBRcYu36t9D/hlAz9cjAO6nUHLtL56
	Lu6FIAPeBsCM5OGgcs6w4eCK2kZEXUZTPiOX2JuboGBrRoCfYhUBIgJ2SXbkBMR4RABJO/UrXy6
	/g8tHuovRQK55oIlyPvl2VwJQoTQfi6+/tM0F/OLP1kgrt+Ii/zwGtvpA77jShJd+Hg3EMU3eN/
	xHYgFQnqgpKNkfDqvYwk3q7tkAS3bs3efQOpjP5KXpXi+/BO02gQ1FC6ML0YyoUetS0ec
X-Google-Smtp-Source: AGHT+IFZuYsHDqscjjw6U5atHRu/Jm5bPjG92uZ8YJc6NiscNKCBw+NDetW5to9ATMl0/VCBNhOBTQ==
X-Received: by 2002:a17:907:97d3:b0:ac3:271e:6b1d with SMTP id a640c23a62f3a-ac3303dfca8mr575059966b.51.1741995362431;
        Fri, 14 Mar 2025 16:36:02 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeadbsm284246966b.29.2025.03.14.16.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:36:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 14 Mar 2025 23:35:57 +0000
Subject: [PATCH v2 4/7] media: qcom: camss: Add VFE680 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-4-d163d66fcc0d@linaro.org>
References: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
In-Reply-To: <20250314-b4-media-comitters-next-25-03-13-x1e80100-camss-driver-v2-0-d163d66fcc0d@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

Add silicon enabling support for VFE680 as found on sm8450, x1e and
derivatives thereof.

References work from Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile        |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c | 244 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
 3 files changed, 246 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 71797745f2f712929f76f6b97f75457bc59e35ab..d26a9c24a430a831e0d865db4d96142da5276653 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -18,6 +18,7 @@ qcom-camss-objs += \
 		camss-vfe-4-8.o \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
+		camss-vfe-680.o \
 		camss-vfe-780.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
new file mode 100644
index 0000000000000000000000000000000000000000..8da7a3566076c7ab2024c828f3aa25f1c30edb5c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-680.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v680
+ *
+ * Copyright (C) 2025 Linaro Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+#define VFE_TOP_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x1c : 0x44) + (n) * 4)
+#define VFE_TOP_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x24 : 0x34) + (n) * 4)
+#define VFE_TOP_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x2c : 0x3c) + (n) * 4)
+#define		VFE_IRQ1_SOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(2) : BIT(8)) << ((rdi) * 2))
+#define		VFE_IRQ1_EOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(3) : BIT(9)) << ((rdi) * 2))
+#define VFE_TOP_IRQ_CMD(vfe)			(vfe_is_lite(vfe) ? 0x38 : 0x30)
+#define		VFE_TOP_IRQ_CMD_GLOBAL_CLEAR	BIT(0)
+#define VFE_TOP_DIAG_CONFIG			(vfe_is_lite(vfe) ? 0x40 : 0x50)
+
+#define VFE_TOP_DEBUG_11(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xcc)
+#define VFE_TOP_DEBUG_12(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd0)
+#define VFE_TOP_DEBUG_13(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd4)
+
+#define VFE_BUS_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x218 : 0xc18) + (n) * 4)
+#define VFE_BUS_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x220 : 0xc20) + (n) * 4)
+#define VFE_BUS_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x228 : 0xc28) + (n) * 4)
+#define VFE_BUS_IRQ_GLOBAL_CLEAR(vfe)		(vfe_is_lite(vfe) ? 0x230 : 0xc30)
+#define VFE_BUS_WR_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x264 : 0xc64)
+#define VFE_BUS_WR_OVERFLOW_STATUS(vfe)		(vfe_is_lite(vfe) ? 0x268 : 0xc68)
+#define VFE_BUS_WR_IMAGE_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x270 : 0xc70)
+
+#define VFE_BUS_WRITE_CLIENT_CFG(vfe, c)	((vfe_is_lite(vfe) ? 0x400 : 0xe00) + (c) * 0x100)
+#define		VFE_BUS_WRITE_CLIENT_CFG_EN	BIT(0)
+#define VFE_BUS_IMAGE_ADDR(vfe, c)		((vfe_is_lite(vfe) ? 0x404 : 0xe04) + (c) * 0x100)
+#define VFE_BUS_FRAME_INCR(vfe, c)		((vfe_is_lite(vfe) ? 0x408 : 0xe08) + (c) * 0x100)
+#define VFE_BUS_IMAGE_CFG0(vfe, c)		((vfe_is_lite(vfe) ? 0x40c : 0xe0c) + (c) * 0x100)
+#define		VFE_BUS_IMAGE_CFG0_DATA(h, s)	(((h) << 16) | ((s) >> 4))
+#define WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+
+#define VFE_BUS_IMAGE_CFG1(vfe, c)		((vfe_is_lite(vfe) ? 0x410 : 0xe10) + (c) * 0x100)
+#define VFE_BUS_IMAGE_CFG2(vfe, c)		((vfe_is_lite(vfe) ? 0x414 : 0xe14) + (c) * 0x100)
+#define VFE_BUS_PACKER_CFG(vfe, c)		((vfe_is_lite(vfe) ? 0x418 : 0xe18) + (c) * 0x100)
+#define VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x430 : 0xe30) + (c) * 0x100)
+#define VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x434 : 0xe34) + (c) * 0x100)
+#define VFE_BUS_FRAMEDROP_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x438 : 0xe38) + (c) * 0x100)
+#define VFE_BUS_FRAMEDROP_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x43c : 0xe3c) + (c) * 0x100)
+#define VFE_BUS_MMU_PREFETCH_CFG(vfe, c)	((vfe_is_lite(vfe) ? 0x460 : 0xe60) + (c) * 0x100)
+#define		VFE_BUS_MMU_PREFETCH_CFG_EN	BIT(0)
+#define VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, c)	((vfe_is_lite(vfe) ? 0x464 : 0xe64) + (c) * 0x100)
+#define VFE_BUS_ADDR_STATUS0(vfe, c)		((vfe_is_lite(vfe) ? 0x470 : 0xe70) + (c) * 0x100)
+
+/*
+ * TODO: differentiate the port id based on requested type of RDI, BHIST etc
+ *
+ * IFE write master IDs
+ *
+ * VIDEO_FULL_Y		0
+ * VIDEO_FULL_C		1
+ * VIDEO_DS_4:1		2
+ * VIDEO_DS_16:1	3
+ * DISPLAY_FULL_Y	4
+ * DISPLAY_FULL_C	5
+ * DISPLAY_DS_4:1	6
+ * DISPLAY_DS_16:1	7
+ * FD_Y			8
+ * FD_C			9
+ * PIXEL_RAW		10
+ * STATS_BE0		11
+ * STATS_BHIST0		12
+ * STATS_TINTLESS_BG	13
+ * STATS_AWB_BG		14
+ * STATS_AWB_BFW	15
+ * STATS_BAF		16
+ * STATS_BHIST		17
+ * STATS_RS		18
+ * STATS_IHIST		19
+ * SPARSE_PD		20
+ * PDAF_V2.0_PD_DATA	21
+ * PDAF_V2.0_SAD	22
+ * LCR			23
+ * RDI0			24
+ * RDI1			25
+ * RDI2			26
+ * LTM_STATS		27
+ *
+ * IFE Lite write master IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * BE			5
+ */
+
+/* TODO: assign an ENUM in resources and use the provided master
+ *       id directly for RDI, STATS, AWB_BG, BHIST.
+ *       This macro only works because RDI is all we support right now.
+ */
+#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0 : 24) + (n))
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	/* VFE680 has no global reset, simply report a completion */
+	complete(&vfe->reset_complete);
+}
+
+/*
+ * vfe_isr - VFE module interrupt handler
+ * @irq: Interrupt line
+ * @dev: VFE device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	return IRQ_HANDLED;
+}
+
+/*
+ * vfe_halt - Trigger halt on VFE module and wait to complete
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+static void vfe_disable_irq(struct vfe_device *vfe)
+{
+	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 0));
+	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 1));
+	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 0));
+	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 1));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+			  struct vfe_line *line)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel(addr, vfe->base + VFE_BUS_IMAGE_ADDR(vfe, wm));
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+	u32 stride = pix->plane_fmt[0].bytesperline;
+	u32 cfg;
+	u8 wm;
+
+	cfg = VFE_BUS_IMAGE_CFG0_DATA(pix->height, stride);
+	wm = RDI_WM(rdi);
+
+	writel(cfg, vfe->base + VFE_BUS_IMAGE_CFG0(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_IMAGE_CFG1(vfe, wm));
+	writel(stride, vfe->base + VFE_BUS_IMAGE_CFG2(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_PACKER_CFG(vfe, wm));
+
+	/* Set total frame increment value */
+	writel(pix->plane_fmt[0].bytesperline * pix->height,
+	       vfe->base + VFE_BUS_FRAME_INCR(vfe, wm));
+
+	/* MMU */
+	writel(VFE_BUS_MMU_PREFETCH_CFG_EN, vfe->base + VFE_BUS_MMU_PREFETCH_CFG(vfe, wm));
+	writel(~0u, vfe->base + VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, wm));
+
+	/* no dropped frames, one irq per frame */
+	writel(1, vfe->base + VFE_BUS_FRAMEDROP_PATTERN(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_FRAMEDROP_PERIOD(vfe, wm));
+	writel(1, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, wm));
+
+	/* We don't process IRQs for VFE in RDI mode at the moment */
+	vfe_disable_irq(vfe);
+
+	/* Enable WM */
+	writel(VFE_BUS_WRITE_CLIENT_CFG_EN,
+	       vfe->base + VFE_BUS_WRITE_CLIENT_CFG(vfe, wm));
+
+	dev_dbg(vfe->camss->dev, "RDI%d WM:%d width %d height %d stride %d\n",
+		rdi, wm, pix->width, pix->height, stride);
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel(0, vfe->base + VFE_BUS_WRITE_CLIENT_CFG(vfe, wm));
+}
+
+static const struct camss_video_ops vfe_video_ops_680 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_680;
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+const struct vfe_hw_ops vfe_ops_680 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 9dec5bc0d1b146fdf6b1ecd47f26b41cfc9e324f..a23f666be7531e0366c73faea44ed245e7a8e30f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
+extern const struct vfe_hw_ops vfe_ops_680;
 extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);

-- 
2.48.1


