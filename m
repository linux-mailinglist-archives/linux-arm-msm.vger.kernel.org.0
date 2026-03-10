Return-Path: <linux-arm-msm+bounces-96739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOSkCDBTsGmBiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:21:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C774C25575E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3930A300D369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF4E3D47A1;
	Tue, 10 Mar 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pgpInriS";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MHcv7ZBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25E3D170A;
	Tue, 10 Mar 2026 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163308; cv=none; b=sLhMubma5rQrqAVSFbiZ09skt61slHP+KK1zqlyX7HciCoeKfxS9YQEJInHmV2RAZEL3AYOOYG51D63mwG1ur76I3B0g99DRsZiIX6AXtcZE03xCQE2TUeRNtVKipWL6n3DbGonRoi+Cqf7tnNJ+XIFqUMT9oxC7xJjTZQGc4kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163308; c=relaxed/simple;
	bh=RMj3ncf4NAtA489bIWdlCcHH2qm5SVhvdHYOZJcz9YA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBT8K8GN1/2DqOyeckQgcFehuET1ODRbOjhM+mykt3Huu2MHvBmz7Vd/zQOeaSdfKWK8Y1likiK1r9UD6R3u6RBwc1US9hTTIzE4wiWqr1MgJ9pHQW2uvKlROK3dsaIeUrnvQmqJiF7qibfoAAHd2+yYSXmfDUsU3UwT/CKFCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pgpInriS; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MHcv7ZBd; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163299; bh=jXPNP0UTw6pA0JDK5z46/2h
	C/V7AWb1SHeuZOfzvacI=; b=pgpInriSI70PlbyNiQC+QjYmdSUvoNqm4YxS074KfwWmOO3M6w
	rTgt5A69d/uOT2m9Bw7hPq3gRdzxKaxqTaCWaldh/RNRSXUS3pX4iahH6q0ODDM4o8rtSKpGQEo
	qHkFIzyW5WkkpHqtasCN14o7robnkf6EbLxZ0/LwRmWMFf4KcGUWD3WGE5kValIWxLhQlBiwfSc
	3AIKwfR2b8ASZ9E9BzLMeapd4XyKfCEBxqHoY5VMRU8iWos2qfAZxfEy9p3dXdE/J6LWnWEDpej
	aZK2RQLT4rhXIeO9N07B2QPemhKLA5IwB+K6EUXgLie9q5o4jd7EKhlbDqwatTLBJ2Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163299; bh=jXPNP0UTw6pA0JDK5z46/2h
	C/V7AWb1SHeuZOfzvacI=; b=MHcv7ZBdjPZ0V5aTj4K3i6iN7nRSCrrmUDmASBLHXESkGkNBda
	HPFe1eEQ75AiDoVXsgI4cVhs9MM7Q5jhiHAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:34 +0100
Subject: [PATCH v2 4/7] arm64: dts: qcom: Add back Xiaomi Redmi 5A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-4-3bfc23996857@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=2625;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=RMj3ncf4NAtA489bIWdlCcHH2qm5SVhvdHYOZJcz9YA=;
 b=CnJ9xSHMuKzKcHzjLgyb1z+qdkkMmzx6wudmppvVps1vavcYgv473r00uFk3WWm+NtRBqRwVw
 2JclFj9TozYBefwYxKSfMbBjhUINjKgQrSI5G8BCzXIam4gWnelt2hA
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: C774C25575E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96739-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.55:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add devicetree for Redmi 5A based on msm8917-xiaomi-wingtech.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                |  1 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 56 ++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e68e161cfec0..6d87be639aac 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
new file mode 100644
index 000000000000..02d9d4fd1b45
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -0,0 +1,56 @@
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
+	model = "Xiaomi Redmi 5A (riva)";
+	compatible = "xiaomi,riva", "qcom,msm8917";
+
+	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <3000000>;
+		energy-full-design-microwatt-hours = <11500000>;
+		constant-charge-current-max-microamp = <1000000>;
+		constant-charge-voltage-max-microvolt = <4400000>;
+		precharge-current-microamp = <256000>;
+		charge-term-current-microamp = <60000>;
+		voltage-min-design-microvolt = <3400000>;
+	};
+};
+
+&blsp2_i2c1 {
+	status = "okay";
+
+	bq27426@55 {
+		compatible = "ti,bq27426";
+		reg = <0x55>;
+		monitored-battery = <&battery>;
+	};
+
+	bq25601@6b {
+		compatible = "ti,bq25601";
+		reg = <0x6b>;
+		interrupts-extended = <&tlmm 61 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&bq25601_int_default>;
+		pinctrl-names = "default";
+		input-voltage-limit-microvolt = <4400000>;
+		input-current-limit-microamp = <1000000>;
+		monitored-battery = <&battery>;
+	};
+};
+
+&tlmm {
+	bq25601_int_default: bq25601-int-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};

-- 
2.53.0


