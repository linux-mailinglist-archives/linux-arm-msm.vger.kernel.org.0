Return-Path: <linux-arm-msm+bounces-110701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOdOEuhdHmpxiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:36:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A406281DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 401EA302C6F2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E734A2D739C;
	Tue,  2 Jun 2026 04:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="ExmAN2Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AF2DA74C;
	Tue,  2 Jun 2026 04:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374998; cv=none; b=HqPrK4T0A3Bqi9CYvnkd/MWjEiKY+/r2/xXy9HIEc4oT7lJwDUW0Ws8JbZ8Q/dP5umNKFlJbSQa/aPEz5Q3Zp7INat9M7jav0P1LAptBIgrNwURf73JOBfxAhdIVlmyIA+Hhr7dkhSFD5UXuV/eyS/LHOhnT9WNZvNmXTI819Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374998; c=relaxed/simple;
	bh=+QjWqsNdohmngZFGvCvaNMAp/lHvrU1j4TeLxIbajXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGxU/ncRL1F4wKrbavQ7w6Js5kM4tKO0S9a0RWHMqBH2f7DyQ37o9o4UVNdL58AtKak81T7NmtuhCdPLLen+hjAkmZAkS1xbN7ZIr0MD26qikyGAjzclnwk5ysDEgQtWA/pOkPZvjSXE+JEh9yfVIgpeg1GZ0uFfVKAM7rcVBlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=ExmAN2Tu; arc=none smtp.client-ip=136.144.136.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gTyhT74G0zTPNND;
	Tue,  2 Jun 2026 06:36:25 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gTyhT30Xbz3R3nyZ;
	Tue,  2 Jun 2026 06:36:25 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: reset: qcom: add mmcc-msm8660 reset IDs
Date: Tue,  2 Jun 2026 06:36:18 +0200
Message-ID: <20260602043623.285901-3-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602043623.285901-1-github.com@herrie.org>
References: <20260602043623.285901-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780374985; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version:content-type;
 bh=d7Er86HmzNP/oc6nFqyXAKLhnVQcyD+0JXnIczziOdo=;
 b=ExmAN2TuAt5amQymOx2ndHR8LNzdxA+U9MwKCk3LApHFuy0i7KKgpT/iuOxgZG1bbtBqPJ
 jQJEAgqHz5NdqfbzJwLwoYlTcEffHhPTgMsTQMrojts6oPy550Jr392WC56Zl5r7NddH6D
 YUqWlJcVt9KuWnuHJhvRyaTiE1lBK13J0x+ruaCzIcSHqonnBYu83BycY0Dgx/Ma+y8d/B
 MlCubDLfCOy+vEoNB/YFyZWNuxj0Wa/LWzvqd1N4Dfd/M20sMPLZ5QQJjSdTkQPURhQIDf
 2mKq9edcBs04bdj7/XQj7W45TbW5ydQb42r7Am7dz1TktCxAe5o7+8wYL83WMw==
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
	TAGGED_FROM(0.00)[bounces-110701-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[herrie.org:email,herrie.org:mid,herrie.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E4A406281DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the dt-binding reset-ID header for the MSM8x60 family
(MSM8260/MSM8660/APQ8060) MMCC reset lines. The MMCC exposes per-IP
software-reset bits used by MDP4 (display), CAMSS / VFE (camera),
Gemini (JPEG), rotator, VPE and the GFX2D / GFX3D blocks; each gets a
matching reset-controller ID here.

IDs match the numeric values used by the original shared
mmcc-msm8960.h reset bindings; only the resets actually implemented
by mmcc-msm8660.c are defined.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 include/dt-bindings/reset/qcom,mmcc-msm8660.h | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 include/dt-bindings/reset/qcom,mmcc-msm8660.h

diff --git a/include/dt-bindings/reset/qcom,mmcc-msm8660.h b/include/dt-bindings/reset/qcom,mmcc-msm8660.h
new file mode 100644
index 000000000000..c3ffd57834c9
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,mmcc-msm8660.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2013, The Linux Foundation. All rights reserved.
+ *
+ * Reset bindings for the MSM8x60 family (MSM8260/MSM8660/APQ8060) Multimedia Clock
+ * Controller (MMCC).
+ *
+ * MSM8260, MSM8660 and APQ8060 are the same Scorpion-class MSM8x60 SoC
+ * with different bin/feature labels. MSM8960 is a newer generation (Krait)
+ * — its reset bindings live in
+ * <dt-bindings/reset/qcom,mmcc-msm8960.h> and must not be reused here.
+ *
+ * IDs intentionally match the numeric values used by the original shared
+ * mmcc-msm8960.h so the driver's qcom_reset_map array indexing is preserved;
+ * only the resets actually implemented by mmcc-msm8660.c are defined.
+ */
+
+#ifndef _DT_BINDINGS_RESET_MSM_MMCC_8660_H
+#define _DT_BINDINGS_RESET_MSM_MMCC_8660_H
+
+#define VPE_AXI_RESET					0
+#define IJPEG_AXI_RESET					1
+#define MPD_AXI_RESET					2
+#define VFE_AXI_RESET					3
+#define SP_AXI_RESET					4
+#define VCODEC_AXI_RESET				5
+#define ROT_AXI_RESET					6
+#define VCODEC_AXI_A_RESET				7
+#define VCODEC_AXI_B_RESET				8
+#define FAB_S3_AXI_RESET				9
+#define FAB_S2_AXI_RESET				10
+#define FAB_S1_AXI_RESET				11
+#define FAB_S0_AXI_RESET				12
+#define SMMU_GFX3D_ABH_RESET				13
+#define SMMU_VPE_AHB_RESET				14
+#define SMMU_VFE_AHB_RESET				15
+#define SMMU_ROT_AHB_RESET				16
+#define SMMU_VCODEC_B_AHB_RESET				17
+#define SMMU_VCODEC_A_AHB_RESET				18
+#define SMMU_MDP1_AHB_RESET				19
+#define SMMU_MDP0_AHB_RESET				20
+#define SMMU_JPEGD_AHB_RESET				21
+#define SMMU_IJPEG_AHB_RESET				22
+#define APU_AHB_RESET					25
+#define CSI_AHB_RESET					26
+#define TV_ENC_AHB_RESET				27
+#define VPE_AHB_RESET					28
+#define FABRIC_AHB_RESET				29
+#define GFX2D0_AHB_RESET				30
+#define GFX2D1_AHB_RESET				31
+#define GFX3D_AHB_RESET					32
+#define HDMI_AHB_RESET					33
+#define MSSS_IMEM_AHB_RESET				34
+#define IJPEG_AHB_RESET					35
+#define DSI_M_AHB_RESET					36
+#define DSI_S_AHB_RESET					37
+#define JPEGD_AHB_RESET					38
+#define MDP_AHB_RESET					39
+#define ROT_AHB_RESET					40
+#define VCODEC_AHB_RESET				41
+#define VFE_AHB_RESET					42
+#define CSIPHY0_RESET					47
+#define CSIPHY1_RESET					48
+#define VFE_CSI_RESET					50
+#define MDP_RESET					51
+#define AMP_RESET					52
+#define JPEGD_RESET					53
+#define CSI1_RESET					54
+#define VPE_RESET					55
+#define MMSS_FABRIC_RESET				56
+#define VFE_RESET					57
+#define GFX3D_RESET					60
+#define HDMI_RESET					61
+#define MMSS_IMEM_RESET					62
+#define IJPEG_RESET					63
+#define CSI0_RESET					64
+#define DSI_RESET					65
+#define VCODEC_RESET					66
+#define MDP_TV_RESET					67
+#define MDP_VSYNC_RESET					68
+#define ROT_RESET					69
+#define TV_HDMI_RESET					70
+#define TV_ENC_RESET					71
+#define GFX3D_AXI_RESET					75
+#define CSI_RDI_RESET					79
+#define CSI_PIX_RESET					80
+
+#endif
-- 
2.43.0


