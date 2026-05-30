Return-Path: <linux-arm-msm+bounces-110387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC3ODljvGmqF9wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE8A60D4CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D57A303F29F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0A92D9EDB;
	Sat, 30 May 2026 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="Cx6EN28M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound1.mail.transip.nl (outbound1.mail.transip.nl [149.210.149.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70E17A2F6;
	Sat, 30 May 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149826; cv=none; b=grqcXh7MTPuZ1Xdto+faM4xIhrjHb9d6JRU506D9dz6DJ4ZarCt+DdW7bo3EirZvKvm6b2kHgxRiPI2LiVFv+TXTERMWZxtsaMu41a014f44Swg7CgRtqVB4twSf5oTQTD2PrUQNpiilpOZUmtf6dBGltLyoHya6Ct5bruojcQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149826; c=relaxed/simple;
	bh=7GVEU4din37FjDdBmZSuCuPSKPUqbKeNE/zhEIn25T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qUoQbGm+J7O8jn6YuYs1/GShWvUicfupoC23N3X65yHXwif3YWkAzxTSLF8Rl+CeF45p59UgKc91qn7Sj0k1ZISoQxDwQC3HJV4p8oIbQBtTUXtH3L2MJfqTYuUzphb3LcESvSqyYuJ4JnsrhBm2ADMbgQj7RSOn+M58Z89REb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=Cx6EN28M; arc=none smtp.client-ip=149.210.149.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission5.mail.transip.nl (unknown [10.103.8.156])
	by outbound1.mail.transip.nl (Postfix) with ESMTP id 4gSMJH0vP8zRjSp;
	Sat, 30 May 2026 15:58:23 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission5.mail.transip.nl (Postfix) with ESMTPA id 4gSMJG3zntz2pRDjH;
	Sat, 30 May 2026 15:58:22 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/3] dt-bindings: clock: qcom: add mmcc-msm8660 clock IDs
Date: Sat, 30 May 2026 15:58:10 +0200
Message-ID: <bab6d4e4c147c02987423141c0841bcc5d1eb045.1780148149.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780148149.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission5.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780149502; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=S+oVwmky282VbH+PAA7JnEpBKm9iw52aNdvDCKXBJ+w=;
 b=Cx6EN28MXFjlqnFZq/KMHlHO6f0T5l9vIwlYokX3IV4Ru1jJGRMwbNeMPMI9QxNJxYAM0C
 5S4cVVu+kfmFGRSTqba20e6fUKH8Bt3SI3nngqV6eaXHeuhHkoGOpPVpoaClRZjl6myo8J
 mfotERtaanUj9P3OQ8smVRcfFC6mifjrfKhXtnFasbT7ab3URJAVz51vi06PliV7Se975F
 adJIkT5/Bm9zkZGaWK83Kyerabk39e/OVnI0v3tUKMznppxxL7dySJ0Ra/JkIASsPuLTeQ
 xEIFj1PL9Tfr6HRs5Cxl2U1e5W948L2J8ZKtIhyNAICCQZzx+BEIs8X1sW0WnQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[herrie.org];
	TAGGED_FROM(0.00)[bounces-110387-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[herrie.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DAE8A60D4CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the dt-binding clock-ID header for the MSM8x60 family
(MSM8260/MSM8660/APQ8060) Multimedia Clock Controller (MMCC). The
header enumerates the clocks and power-domains consumed by the
multimedia subsystem (MDP4 display, Adreno A220 GPU, CAMSS image
pipeline, VFE, Gemini JPEG, video codec, rotator, VPE and the GFX2D
Z180 cores).

IDs intentionally match the numeric values used by the original
shared mmcc-msm8960.h so the driver's clk array indexing is preserved;
only the clocks actually implemented by mmcc-msm8660.c are defined.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 include/dt-bindings/clock/qcom,mmcc-msm8660.h | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8660.h

diff --git a/include/dt-bindings/clock/qcom,mmcc-msm8660.h b/include/dt-bindings/clock/qcom,mmcc-msm8660.h
new file mode 100644
index 000000000000..00c3a75e8b71
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,mmcc-msm8660.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ *
+ * Clock and power-domain bindings for the MSM8x60 family (MSM8260/MSM8660/APQ8060)
+ * Multimedia Clock Controller (MMCC).
+ *
+ * MSM8260, MSM8660 and APQ8060 are the same Scorpion-class MSM8x60 SoC
+ * with different bin/feature labels. MSM8960 is a newer generation (Krait)
+ * — its bindings live in
+ * <dt-bindings/clock/qcom,mmcc-msm8960.h> and must not be reused here.
+ *
+ * IDs below intentionally match the numeric values used by the original
+ * shared mmcc-msm8960.h so the driver's clk array indexing is preserved;
+ * only the clocks actually implemented by mmcc-msm8660.c are defined.
+ */
+
+#ifndef _DT_BINDINGS_CLK_MSM_MMCC_8660_H
+#define _DT_BINDINGS_CLK_MSM_MMCC_8660_H
+
+#define TV_ENC_AHB_CLK					3
+#define AMP_AHB_CLK					4
+#define JPEGD_AHB_CLK					6
+#define GFX2D0_AHB_CLK					7
+#define DSI_S_AHB_CLK					8
+#define VPE_AHB_CLK					10
+#define SMMU_AHB_CLK					11
+#define HDMI_M_AHB_CLK					12
+#define VFE_AHB_CLK					13
+#define ROT_AHB_CLK					14
+#define VCODEC_AHB_CLK					15
+#define MDP_AHB_CLK					16
+#define DSI_M_AHB_CLK					17
+#define CSI0_AHB_CLK					18
+#define MMSS_IMEM_AHB_CLK				19
+#define IJPEG_AHB_CLK					20
+#define HDMI_S_AHB_CLK					21
+#define GFX3D_AHB_CLK					22
+#define GFX2D1_AHB_CLK					23
+#define JPEGD_AXI_CLK					28
+#define GMEM_AXI_CLK					29
+#define MDP_AXI_CLK					30
+#define MMSS_IMEM_AXI_CLK				31
+#define IJPEG_AXI_CLK					32
+#define GFX3D_AXI_CLK					33
+#define VCODEC_AXI_CLK					34
+#define VFE_AXI_CLK					35
+#define VPE_AXI_CLK					36
+#define ROT_AXI_CLK					37
+#define VCODEC_AXI_A_CLK				38
+#define VCODEC_AXI_B_CLK				39
+#define CSI0_SRC					47
+#define CSI0_CLK					48
+#define CSI0_PHY_CLK					49
+#define CSI1_SRC					50
+#define CSI1_CLK					51
+#define CSI1_PHY_CLK					52
+#define DSI_SRC						56
+#define DSI_CLK						57
+#define CSI_PIX_CLK					58
+#define CSI_RDI_CLK					59
+#define MDP_VSYNC_CLK					60
+#define HDMI_APP_CLK					62
+#define GFX2D0_SRC					66
+#define GFX2D0_CLK					67
+#define GFX2D1_SRC					68
+#define GFX2D1_CLK					69
+#define GFX3D_SRC					70
+#define GFX3D_CLK					71
+#define IJPEG_SRC					72
+#define IJPEG_CLK					73
+#define JPEGD_SRC					74
+#define JPEGD_CLK					75
+#define MDP_SRC						76
+#define MDP_CLK						77
+#define MDP_LUT_CLK					78
+#define DSI1_BYTE_SRC					83
+#define DSI1_BYTE_CLK					84
+#define DSI1_ESC_SRC					87
+#define DSI1_ESC_CLK					88
+#define ROT_SRC						91
+#define ROT_CLK						92
+#define TV_ENC_CLK					93
+#define TV_DAC_CLK					94
+#define HDMI_TV_CLK					95
+#define MDP_TV_CLK					96
+#define TV_SRC						97
+#define VCODEC_SRC					98
+#define VCODEC_CLK					99
+#define VFE_SRC						100
+#define VFE_CLK						101
+#define VFE_CSI0_CLK					102
+#define VPE_SRC						103
+#define VPE_CLK						104
+#define DSI_PIXEL_SRC					105
+#define DSI_PIXEL_CLK					106
+#define CAMCLK0_SRC					107
+#define CAMCLK0_CLK					108
+#define CAMCLK1_SRC					109
+#define CAMCLK1_CLK					110
+#define CSIPHYTIMER_SRC					113
+#define CSIPHY1_TIMER_CLK				115
+#define CSIPHY0_TIMER_CLK				116
+#define PLL2						118
+#define MDP_PIXEL_SRC					129
+#define MDP_PIXEL_CLK					130
+#define MDP_LCDC_CLK					131
+#define VFE_CSI1_CLK					132
+#define CSI1_AHB_CLK					133
+
+/*
+ * MSM8x60 legacy footswitch power domains.
+ * Used with the MMCC power-domain provider (#power-domain-cells = <1>).
+ * Numbering is independent of the clock ID space above.
+ */
+#define GFX2D0_GDSC					0
+#define GFX2D1_GDSC					1
+#define GFX3D_GDSC					2
+#define IJPEG_GDSC					3
+#define MDP_GDSC					4
+#define ROT_GDSC					5
+#define VED_GDSC					6
+#define VFE_GDSC					7
+#define VPE_GDSC					8
+
+#endif
-- 
2.43.0


