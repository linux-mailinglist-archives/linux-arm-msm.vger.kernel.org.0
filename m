Return-Path: <linux-arm-msm+bounces-110428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGgjFWy0G2pVFgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:09:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E73561451D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 06:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77B5A3017BD1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2026 04:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A1F2D46B3;
	Sun, 31 May 2026 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="lhURLWz7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7323EAA0;
	Sun, 31 May 2026 04:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780200550; cv=none; b=Wp0FxrFc1sIDaahp+Bw8L9HqK5GN1yViQ2m9sQxKtzsXNMTiSb4lICjNtUCdzkyoKaOuVjhQPX/F531rQB86jeCebjUDEtJ2Zmck5z1NzfL6082oXwXCqst1WlQKPsBpDXBHYJyKMmMTXJuKjjUdTEf7nUFTriM5vQxGRf8P4dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780200550; c=relaxed/simple;
	bh=0pF0rhg2hHdPbQ2Luyn/7WqsTAcxwqew8Vs8I2dTWc4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVp4D1UOO3ZO3TKWJkIiuLjjTcvH+rmEz81T3wYevJ0QwkyDRnhkE/Vdp3n9QbI6gAh2h1Nqp8E+niMtAgjHmFETggbSmPsNc1nNaVMoS/4yB88fIGFcnmqxTTordI11CySsSwleZNKUzkfHjO0sn95WDXxWBMtCjPXwMrfNijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=lhURLWz7; arc=none smtp.client-ip=136.144.136.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission10.mail.transip.nl (unknown [10.103.8.161])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gSk9r5r6wzTPNc5;
	Sun, 31 May 2026 06:09:04 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission10.mail.transip.nl (Postfix) with ESMTPA id 4gSk9r1WYyz1g92mX;
	Sun, 31 May 2026 06:09:04 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: qcom: add lcc-msm8660 LPASS clock IDs
Date: Sun, 31 May 2026 06:09:01 +0200
Message-ID: <be69409cac5f6b316a609e182e609f0ce6133bbe.1780197511.git.github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780197511.git.github.com@herrie.org>
References: <cover.1780148149.git.github.com@herrie.org> <cover.1780197511.git.github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission10.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780200544; h=from:subject:to:references:
 in-reply-to:date:mime-version;
 bh=rW2SLXzGi1/eJwT7d4iDn2tWeHOxsLuq9eRAWU8zmV8=;
 b=lhURLWz7ZnRrHIp9Jwlh3Fardp4gWacXCQ/I+7kgXLEFqM/apkUSdsVom09GWPADEA7yf9
 BfKWZuhi+w/5fkr49RsUONYlAV8eJxE0GskJtQOrvfIwXV64MfE8ZiJ8AI//1dnkZWfBRi
 Hs6w3QPAlyeQPf3DlVc/FQyGrn1Si0muv4PqoJjKrCeRWT60zsnQONwjNAary4P+7PWhTd
 ziqy8YoJfswsE9sUmSfmqLi+ZeMz6Y0WrciQSN1znriTCoKPQX/iD0Xt3aAaHntNlXRUkk
 nFdmtCPYj5aD8ilrnROcUnHpYMoFqXB4KCYJSYGUxPvlMcaZB9qKGsIznSSHLw==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110428-lists,linux-arm-msm=lfdr.de];
	DMARC_NA(0.00)[herrie.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9E73561451D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the dt-binding clock-ID header for the MSM8x60 family
(MSM8260/MSM8660/APQ8060) Low Power Audio SubSystem Clock Controller
(LCC). The header enumerates the LPASS clocks consumed by the
qcom,apq8060-lpaif sound card and the codec/AIF nodes downstream of
it. It mirrors the format and ID range of the existing LCC headers
for newer Qualcomm SoCs (lcc-msm8960, lcc-msm8974) so the
drivers/clk/qcom/lcc-msm8660.c driver can be hooked up the same way
once it lands.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 include/dt-bindings/clock/qcom,lcc-msm8660.h | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,lcc-msm8660.h

diff --git a/include/dt-bindings/clock/qcom,lcc-msm8660.h b/include/dt-bindings/clock/qcom,lcc-msm8660.h
new file mode 100644
index 000000000000..d5d9b0d71a78
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lcc-msm8660.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_LCC_MSM8660_H
+#define _DT_BINDINGS_CLK_LCC_MSM8660_H
+
+/*
+ * MSM8x60 family (MSM8260/MSM8660/APQ8060) LPASS Clock Controller (LCC)
+ * clock IDs. These are compatible with MSM8960 LCC as MSM8x60 and
+ * MSM8960 share the same audio subsystem clock architecture.
+ */
+
+#define PLL4				0
+#define MI2S_OSR_SRC			1
+#define MI2S_OSR_CLK			2
+#define MI2S_DIV_CLK			3
+#define MI2S_BIT_DIV_CLK		4
+#define MI2S_BIT_CLK			5
+#define PCM_SRC				6
+#define PCM_CLK_OUT			7
+#define PCM_CLK				8
+#define SLIMBUS_SRC			9
+#define AUDIO_SLIMBUS_CLK		10
+#define SPS_SLIMBUS_CLK			11
+#define CODEC_I2S_MIC_OSR_SRC		12
+#define CODEC_I2S_MIC_OSR_CLK		13
+#define CODEC_I2S_MIC_DIV_CLK		14
+#define CODEC_I2S_MIC_BIT_DIV_CLK	15
+#define CODEC_I2S_MIC_BIT_CLK		16
+#define SPARE_I2S_MIC_OSR_SRC		17
+#define SPARE_I2S_MIC_OSR_CLK		18
+#define SPARE_I2S_MIC_DIV_CLK		19
+#define SPARE_I2S_MIC_BIT_DIV_CLK	20
+#define SPARE_I2S_MIC_BIT_CLK		21
+#define CODEC_I2S_SPKR_OSR_SRC		22
+#define CODEC_I2S_SPKR_OSR_CLK		23
+#define CODEC_I2S_SPKR_DIV_CLK		24
+#define CODEC_I2S_SPKR_BIT_DIV_CLK	25
+#define CODEC_I2S_SPKR_BIT_CLK		26
+#define SPARE_I2S_SPKR_OSR_SRC		27
+#define SPARE_I2S_SPKR_OSR_CLK		28
+#define SPARE_I2S_SPKR_DIV_CLK		29
+#define SPARE_I2S_SPKR_BIT_DIV_CLK	30
+#define SPARE_I2S_SPKR_BIT_CLK		31
+
+#endif
-- 
2.43.0


