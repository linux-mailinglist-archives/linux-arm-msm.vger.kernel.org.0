Return-Path: <linux-arm-msm+bounces-110394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UACIDt3wGmre9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:14:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A454760D5E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F647304BBD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D4A2E62B7;
	Sat, 30 May 2026 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="T1zCa6H1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901E2080C1;
	Sat, 30 May 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780150085; cv=none; b=CKoLcu+9HNhELj0jDSIsMy+Mq2B5LhF7i59zBiOTutahb26n/AFUtc1anonaYa3w2P8XxtLRi8L7fIzQV6JEGTYv3B3QsqSqypoTJgn8SHB/4YX6GJjqrF8vocAmm8qZImmM+tCwWNRdRWZd9QO1PzgHtbCC6DOAsmNE5PpBEX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780150085; c=relaxed/simple;
	bh=w5mR+H5rPyVbSgV+adhHaSX2uDpuYP4IW4V5S+BD9ms=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwqpR7OKE2RC5/2k106E5bIaDrCyDC9UNb/7Fm7ShG/5TVa3V7hFfKZLZF07ebI3mCYQLoiPFjLeaTw5UykbmwtxlK0UJl6/cZ50G36COe10nVVGyluLwuzwOyXYT60czFiOCsreEX4oL/lNlHK2zdI8TWhWKJ7y7ZqwQN1eX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=T1zCa6H1; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission14.mail.transip.nl (unknown [10.103.8.165])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gSMLP5NQrzY76Kg;
	Sat, 30 May 2026 16:00:13 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission14.mail.transip.nl (Postfix) with ESMTPA id 4gSMLP1vjgz3RgQXr;
	Sat, 30 May 2026 16:00:13 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Georgi Djakov <djakov@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: interconnect: qcom: add msm8660 fabric IDs
Date: Sat, 30 May 2026 16:00:11 +0200
Message-ID: <4f08904fd8e8279abfacde03a0f7663dec674c74.1780148149.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission14.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149613; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=WHmruaTq2s12LtiMejU0BWfYOqcgbgyX8/Nk2hvR4y8=;
 b=T1zCa6H13pTUH+udukzI4AqhF2RypCqiu4Q9BIGWPYkXASA3PlHDrAliVUH0LnPsXPh8EO
 aVo7mpnuXX1la4DdHs/8+P6dUUISdDJ+xi9lopJdXe3ImP8ouy6IAOl9R2QlLCLa53ySkf
 cZbFobFPckb73RU03eEsXNFBSjmX+evH1eNWmRxqyBgXo/96tg51FfuhbU0FfVGkiq084p
 9D+glouXNC44oDTTofOwVKGwuy2Fa7DcmzLlHvcKKm8TXXN7sjtpBExVLSbTPCQOWr7WeZ
 aQkHr+i1trXolBrONgqIyHZ/SOikxTZpqF5Gx8l+lerPHEk+faLRzja+ge5W4w==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110394-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A454760D5E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the dt-binding interconnect master/slave ID header for the
MSM8x60 family (MSM8260/MSM8660/APQ8060) fabric mesh. The chip's
NoC fabric is split into multiple sub-fabrics that the qnoc-msm8660
driver models:

  AFAB  - Applications fabric (Scorpion CPU + L2)
  SFAB  - System fabric (DMA, SPS, security)
  MMFAB - Multimedia fabric (MDP, GPU, camera, video, rotator)
  DFAB  - Daytona fabric (SDC, ADM master/slave)
  SFPB  - System Fast Peripheral Bridge (RPM, MPM, PMIC SSBI)
  CFPB  - CPU Subsystem Fast Peripheral Bus (GSBI UART/QUP, USB FS,
          TSIF, TSSC, PDM, PRNG)

IDs derived from the legacy webOS msm_bus_board_8660.c master/slave
enums, normalised to the upstream interconnect-framework naming.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 .../dt-bindings/interconnect/qcom,msm8660.h   | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8660.h

diff --git a/include/dt-bindings/interconnect/qcom,msm8660.h b/include/dt-bindings/interconnect/qcom,msm8660.h
new file mode 100644
index 000000000000..d2639f737a54
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,msm8660.h
@@ -0,0 +1,156 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Qualcomm MSM8x60 family (MSM8260/MSM8660/APQ8060) interconnect IDs
+ *
+ * Copyright (c) 2026, Herman van Hazendonk <github.com@herrie.org>
+ *
+ * Based on webOS kernel msm_bus_board_8660.c
+ * Copyright (c) 2010-2011, Code Aurora Forum. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H
+
+/*
+ * MSM8x60 has a fabric-based bus architecture:
+ * - APPSS Fabric: CPU and memory interface
+ * - System Fabric: System peripherals and DMA
+ * - MMSS Fabric: Multimedia subsystem (display, camera, video)
+ * - Daytona Fabric: Peripheral bus (SDCC, ADM DMA)
+ * - System FPB: System Fast Peripheral Bus
+ * - CPSS FPB: CPU Subsystem Fast Peripheral Bus
+ */
+
+/* APPSS Fabric - Apps processor fabric */
+#define AFAB_MAS_AMPSS_M0		0
+#define AFAB_MAS_AMPSS_M1		1
+#define AFAB_SLV_EBI_CH0		2
+#define AFAB_SLV_AMPSS_L2		3
+#define AFAB_TO_MMSS			4
+#define AFAB_TO_SYSTEM			5
+
+/* System Fabric - System bus */
+#define SFAB_MAS_APPSS			0
+#define SFAB_MAS_SPS			1
+#define SFAB_MAS_ADM0_PORT0		2
+#define SFAB_MAS_ADM0_PORT1		3
+#define SFAB_MAS_ADM1_PORT0		4
+#define SFAB_MAS_ADM1_PORT1		5
+#define SFAB_MAS_LPASS_PROC		6
+#define SFAB_MAS_MSS_PROCI		7
+#define SFAB_MAS_MSS_PROCD		8
+#define SFAB_MAS_MSS_MDM_PORT0		9
+#define SFAB_MAS_LPASS			10
+#define SFAB_MAS_MMSS_FPB		11
+#define SFAB_MAS_ADM1_CI		12
+#define SFAB_MAS_ADM0_CI		13
+#define SFAB_MAS_MSS_MDM_PORT1		14
+#define SFAB_MAS_USB_HS			15
+#define SFAB_TO_APPSS			16
+#define SFAB_TO_SYSTEM_FPB		17
+#define SFAB_TO_CPSS_FPB		18
+#define SFAB_SLV_SPS			19
+#define SFAB_SLV_SYSTEM_IMEM		20
+#define SFAB_SLV_AMPSS			21
+#define SFAB_SLV_MSS			22
+#define SFAB_SLV_LPASS			23
+#define SFAB_SLV_MMSS_FPB		24
+#define SFAB_TO_DFAB			25
+
+/* MMSS Fabric - Multimedia subsystem */
+#define MMFAB_MAS_MDP_PORT0		0
+#define MMFAB_MAS_MDP_PORT1		1
+#define MMFAB_MAS_ADM1_PORT0		2
+#define MMFAB_MAS_ROTATOR		3
+#define MMFAB_MAS_GRAPHICS_3D		4
+#define MMFAB_MAS_JPEG_DEC		5
+#define MMFAB_MAS_GRAPHICS_2D_CORE0	6
+#define MMFAB_MAS_VFE			7
+#define MMFAB_MAS_VPE			8
+#define MMFAB_MAS_JPEG_ENC		9
+#define MMFAB_MAS_GRAPHICS_2D_CORE1	10
+#define MMFAB_MAS_HD_CODEC_PORT0	11
+#define MMFAB_MAS_HD_CODEC_PORT1	12
+#define MMFAB_TO_APPSS			13
+#define MMFAB_SLV_SMI			14
+#define MMFAB_SLV_MM_IMEM		15
+
+/*
+ * Daytona Fabric (DFAB) - Peripheral bus
+ *
+ * DFAB connects slower peripherals (SDCC, ADM DMA) to the system fabric.
+ * The webOS kernel managed DFAB bandwidth via voter clocks (dfab_sdc*_clk,
+ * dfab_usb_hs_clk). In mainline, this is handled by the interconnect framework.
+ *
+ * USB HS is included as a DFAB voter for compatibility with the legacy clock
+ * voting mechanism. The webOS kernel comment said: "if usb link is in sps
+ * there is no need for usb pclk as daytona fabric clock will be used instead".
+ * This keeps DFAB clock stable when USB is active.
+ */
+#define DFAB_MAS_SDC1			0
+#define DFAB_MAS_SDC2			1
+#define DFAB_MAS_SDC3			2
+#define DFAB_MAS_SDC4			3
+#define DFAB_MAS_SDC5			4
+#define DFAB_MAS_ADM0_MASTER		5
+#define DFAB_MAS_ADM1_MASTER		6
+#define DFAB_TO_SFAB			7
+#define DFAB_SLV_SDC1			8
+#define DFAB_SLV_SDC2			9
+#define DFAB_SLV_SDC3			10
+#define DFAB_SLV_SDC4			11
+#define DFAB_SLV_SDC5			12
+#define DFAB_MAS_USB_HS			13
+#define DFAB_MAS_DSPS			14
+
+/* System FPB - Slow peripheral bus for system */
+#define SFPB_MAS_SYSTEM			0
+#define SFPB_MAS_SPDM			1
+#define SFPB_MAS_RPM			2
+#define SFPB_SLV_SPDM			3
+#define SFPB_SLV_RPM			4
+#define SFPB_SLV_RPM_MSG_RAM		5
+#define SFPB_SLV_MPM			6
+#define SFPB_SLV_PMIC1_SSBI1_A		7
+#define SFPB_SLV_PMIC1_SSBI1_B		8
+#define SFPB_SLV_PMIC1_SSBI1_C		9
+#define SFPB_SLV_PMIC2_SSBI2_A		10
+#define SFPB_SLV_PMIC2_SSBI2_B		11
+
+/* CPSS FPB - CPU subsystem fast peripheral bus */
+#define CFPB_MAS_SYSTEM			0
+#define CFPB_SLV_GSBI1_UART		1
+#define CFPB_SLV_GSBI2_UART		2
+#define CFPB_SLV_GSBI3_UART		3
+#define CFPB_SLV_GSBI4_UART		4
+#define CFPB_SLV_GSBI5_UART		5
+#define CFPB_SLV_GSBI6_UART		6
+#define CFPB_SLV_GSBI7_UART		7
+#define CFPB_SLV_GSBI8_UART		8
+#define CFPB_SLV_GSBI9_UART		9
+#define CFPB_SLV_GSBI10_UART		10
+#define CFPB_SLV_GSBI11_UART		11
+#define CFPB_SLV_GSBI12_UART		12
+#define CFPB_SLV_GSBI1_QUP		13
+#define CFPB_SLV_GSBI2_QUP		14
+#define CFPB_SLV_GSBI3_QUP		15
+#define CFPB_SLV_GSBI4_QUP		16
+#define CFPB_SLV_GSBI5_QUP		17
+#define CFPB_SLV_GSBI6_QUP		18
+#define CFPB_SLV_GSBI7_QUP		19
+#define CFPB_SLV_GSBI8_QUP		20
+#define CFPB_SLV_GSBI9_QUP		21
+#define CFPB_SLV_GSBI10_QUP		22
+#define CFPB_SLV_GSBI11_QUP		23
+#define CFPB_SLV_GSBI12_QUP		24
+#define CFPB_SLV_EBI2_NAND		25
+#define CFPB_SLV_USB_FS1		26
+#define CFPB_SLV_USB_FS2		27
+#define CFPB_SLV_TSIF			28
+#define CFPB_SLV_MSM_TSSC		29
+#define CFPB_SLV_MSM_PDM		30
+#define CFPB_SLV_MSM_DIMEM		31
+#define CFPB_SLV_MSM_TCSR		32
+#define CFPB_SLV_MSM_PRNG		33
+
+#endif /* __DT_BINDINGS_INTERCONNECT_QCOM_MSM8660_H */
-- 
2.43.0


