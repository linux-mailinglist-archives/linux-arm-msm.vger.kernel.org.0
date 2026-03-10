Return-Path: <linux-arm-msm+bounces-96743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB13DP9TsGmBiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A1725585F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3148631E6D5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981683D411C;
	Tue, 10 Mar 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bKCof+HJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5uE+NIrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00593D1704;
	Tue, 10 Mar 2026 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163319; cv=none; b=MpbNdBp1NnkN2ta6OC8MrDgEcmZBNa+3k+lY4ZsarvpuiH2/uy0lC/KH8Fn8+g4/j7o383eHuBKEOSF86T/4oqmxkqfPWf8g4Mo/k1vgyDD6zHXk+jr0YV6Q9+OAHJ6aAqlxeG8sOPD6W0dlEWG7OAYbLUGxoBFsJMxi37X8Ygk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163319; c=relaxed/simple;
	bh=1gZkswrM/ObZDhdjRWGLnDhPUr9HaofQevWlqnoBf5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q/DHNO+Pq3EhhyS/wmdqDRNcy5aQiDPGVmE3Mp6hDVDtzD7Suf46vmrn6tlQ48dnWjzDjn7cNAlcUcQOLAaGv1yPQNyXUasZFX+2hlnbycx8lNtCRs5W8r0m5aKK5uZnAFsDHgkXPk2INJgYedQ5YNxj2rugTCEcG/miPCv04c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bKCof+HJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5uE+NIrD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163301; bh=3rxwRnspv+VmkJ6StVbCi+j
	VKNvSggvttHkEfU43PIA=; b=bKCof+HJUtIrVpt1Nyyj5Fmr8W7BOxctwIYdWHO15eGXeoIT4J
	xxYH7ujxYj+lmuq3hU2MzXc3antaSAKRVsX50qszhP+F6UWD6gTNd7H6iEYrgst5yQX5FWiNfYe
	OjRuj4w17PbPDuBF7eqBEJbHvII+pvC+hwJLtsZdGnj1pA50WXTGyI9/GKGSaz9J09WTS1+Vul7
	nNEPD+AUNFePS1SxB4vxbHvjMokq4Olub2DxJTaKmcZtiDS648DKzGfx5KqD8DvhIfB8pBumgAa
	ThDv5g35GBXsW7DDoT5GhgEJzg6qc+hgCCFgp4UckxphmqYlGaUE+9FQMcKJEnUE0gQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163301; bh=3rxwRnspv+VmkJ6StVbCi+j
	VKNvSggvttHkEfU43PIA=; b=5uE+NIrDiv1+n9vNibgJpwvv9ot832fmnBGGjeZGUTwEitiW+o
	aNzEVQEt3v5AU5460csvIt/l/2tqHn9QI1Cw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:37 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: Add Redmi Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-7-3bfc23996857@mainlining.org>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
In-Reply-To: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=1725;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=1gZkswrM/ObZDhdjRWGLnDhPUr9HaofQevWlqnoBf5w=;
 b=c2fXwGOGTpMvFBW+arCxwpY0cZH8xfJcLkpwASabr8VYZ05H2BabVhwTgLt1Ve8dgnOCsLjWU
 dnxgmClsrPPBxWqmQKIxmgMth5zM5GOEUlK7+tpjiGAVnz3ccve9hYG
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: D2A1725585F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.15)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96743-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Redmi Go (tiare) is like Redmi 5A with small differences like charging,
fuel gauge and different speaker codec.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                 |  1 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 20e161e843ed..a74598cf0b47 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -83,6 +83,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-rolex.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-tiare.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
new file mode 100644
index 000000000000..64a564d97dd0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Barnabas Czeman
+ */
+
+/dts-v1/;
+
+#include "msm8917-xiaomi-wingtech.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Go (tiare)";
+	compatible = "xiaomi,tiare", "qcom,msm8917";
+
+	qcom,board-id = <0x1000b 1>;
+};
+
+&pm8937_l22 {
+	regulator-max-microvolt = <2850000>;
+};
+
+&pm8937_l23 {
+	regulator-max-microvolt = <1250000>;
+};

-- 
2.53.0


