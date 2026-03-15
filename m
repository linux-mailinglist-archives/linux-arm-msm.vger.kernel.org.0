Return-Path: <linux-arm-msm+bounces-97721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HISLgjetmlOJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:27:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 383682916C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DDC030078AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 16:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD10374191;
	Sun, 15 Mar 2026 16:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Cc1BO1so";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="4qP8RlFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B16373C02;
	Sun, 15 Mar 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592005; cv=none; b=gSII6lwGqQM7cT9tlwPTX1hmq3A6XvAjW9vgrE+gV5/MP4mREbxqlY3UK88I+X7Q9DOJZQzn3NKHyPiNC/L5fkU3ETmGwBzRQ92vAoAAHkcEetXTJanhpysE+YEAg6wlDvyMhIrIaqt4cDmKmIxJFO50MUPTAaOrYhd7hSx8wl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592005; c=relaxed/simple;
	bh=6v/WGG4IW5FUaX0BV49oI4fw7ECTK6DF4nreNavRlkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3aKSRTetlWd1Qp5o1PI6R7nqNyD5OvwolU8gChLUP67j1lheuJQcbev5WzQ5kgJ27mTws3nm7K1oEbq4rhbpUBMupd/J0jNDcoA09JNM/1pUhghOkAJCPzDhCkSSpAWATs+9+a1P6NQoaM/YgOlQyXgS9EKLtQLg/9f5f+j4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Cc1BO1so; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=4qP8RlFg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591988; bh=cObeGn0+mqbIDv0gy4l32b/
	4gwec2rhWOM6Q/NtCevI=; b=Cc1BO1son9VMvJCLRaRRvDqVlQriwxigBT3U48FVoA9K7srhio
	0cKysR1eDN8vcXsP8CrL6TfKL5aWO1+U4LxtufOGC1+3/x3svT+W+EhtoLjXu+E4TwRHUkZPdGg
	ZwiDucSQWYjCRWBbv9SSK2bxe2giQZbR8c4sWKoErOAKweGSGOeb1wGeaAXVs7N8VQsWsCfDRhp
	MG7SgGJa7xCYjmxuR4ojde2x/5HEV4cKoTWS+AHPaRyjvFt8oTGe1YLr2cdzUzi1HeoEdfjJcP0
	GX+cFY/bow0d1JanLvSXy4GnnzMT4VIq8NsfmJUwfDt5Qf5VFX67BHOzpWGdU7CoqBA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591988; bh=cObeGn0+mqbIDv0gy4l32b/
	4gwec2rhWOM6Q/NtCevI=; b=4qP8RlFg3zY3JO1wm/MRASnNrUdqpsB6//WYqk7JGQGw7UnnP8
	flhqHgSrJfwl/u5essTPX5Ps00MtRowpwHBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 15 Mar 2026 17:26:24 +0100
Subject: [PATCH v3 6/6] arm64: dts: qcom: Add Redmi Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260315-riva-common-v3-6-897f130786ed@mainlining.org>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
In-Reply-To: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773591982; l=1698;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6v/WGG4IW5FUaX0BV49oI4fw7ECTK6DF4nreNavRlkk=;
 b=CHdAadEbelpdf2vggFcyaiY/vusBmFy8vcArI/vyVd4qXiWkKxpKM0qS0yXdU/LvYOFv2FlzO
 k/3DGsv8QQLAQn48nIKxCIb/+/HynfpX2iL7x2k0Iq7qRQVQbRQHDkh
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.15)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97721-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Queue-Id: 383682916C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Redmi Go (tiare) is like Redmi 5A with small differences like charging,
fuel gauge and different speaker codec.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                 |  1 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)

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
index 000000000000..fe844230030f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
@@ -0,0 +1,20 @@
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
+	regulator-min-microvolt = <2850000>;
+	regulator-max-microvolt = <2850000>;
+};

-- 
2.53.0


