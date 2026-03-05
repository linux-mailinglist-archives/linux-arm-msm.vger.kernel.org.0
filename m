Return-Path: <linux-arm-msm+bounces-95679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFtaEDO+qWlvDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:32:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB7216485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8433B3019382
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B130C3E123F;
	Thu,  5 Mar 2026 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DUoHpvwz";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OgiqBp2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2C37C90C;
	Thu,  5 Mar 2026 17:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731874; cv=none; b=Z2MySF48/sRxnLWQ+MqBVqJO6afC3uwWRG1bs2cLLv+8dF4pzpbw7imv7gdDjJn7/aqcBIMRUDCPi1clh3XV6hZC8xPyOXopeALh/AHQ7pRyjbu2Ktlznot9Twm5u5DAn7YB5+U9cuIiHfBLAr0HO8jb13hsisFoc+AhzVLZXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731874; c=relaxed/simple;
	bh=lkvmsLBpvsY3x90vHPWd8+Up7LknIVIPM32vhNZixKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMWM43e9TQ7Qv593b+Eb+O9abZSHD3D1wYT8I/cU21Q6reaVKn4BUdt7r4959loekfmeBDOtASECr7AEdT9k5L2cxngG0fjndsdDiny31gic6KFP2p5cvfa12Ofq6UJn3nENQP8CXvRH/KS2nyDhF88Bh2rCAHYqWhxNwtXengE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DUoHpvwz; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OgiqBp2e; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731730; bh=5jBlLca/P0Nva9AtR1nrHHt
	3FfXJ/0VEgFiRu1l1Cwk=; b=DUoHpvwzhKvwXaAXT2jYJulCanaZ4ryZ8SjaMdiZt/XaFeqc6k
	E4/FOMuBR/nObFtL2PhB/z9WSB7DgFc6EXkfNw5e0u3JsOoJtdEB2Fafbah92shloWiDywZv0Xw
	vhjrWKmI1JuN6qFGLAHo9g5D3H0UtJfGGqAJTdmGJ0WSL0g9Q60lECCn/FbdKaQnsIMMVCMfJj5
	KQHQWxsMPVtqYEUoRk3clIo2pPEVaEPWuyuv+2S6e+C3rSXvmLqW8eihEER9KaXEnfs+bqZCqlb
	UdaCOotolyrbnBtZNrBaqSJW6K9dEawzpSHrkenLrA6BbnH/eQu4cVEL2Sz0eFr/DGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731730; bh=5jBlLca/P0Nva9AtR1nrHHt
	3FfXJ/0VEgFiRu1l1Cwk=; b=OgiqBp2eb6iLP4uI5Hif0km9bs4Z2LUA/kD7owlrC5hnY21H3c
	WpB5Fp9507pjb4zvGqmPPlvl/pvvsqPKBZAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 05 Mar 2026 18:28:37 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: Add Redmi Go
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-riva-common-v1-5-436f1f4b7399@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
In-Reply-To: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=1772;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lkvmsLBpvsY3x90vHPWd8+Up7LknIVIPM32vhNZixKk=;
 b=hsToBQTMA8E+tmNNacppDmiGFNF0g1mMQc6e+opIHKzpnpb1i6y4hTnE1n053DciNLwmuxOKG
 CzeKLp1ixLrCgWqp6sqbeiTGSusFNzfOVa4HrDmFjyBHiv0SyMZ7dnu
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: D7EB7216485
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	R_MIXED_CHARSET(1.25)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95679-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mainlining.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Redmi Go (tiare) is like Redmi 5A with small differences like charging,
fuel gauge and different speaker codec.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                 |  1 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts | 27 +++++++++++++++++++++++
 2 files changed, 28 insertions(+)

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
index 000000000000..c3a74530c34c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Barnabas Czeman
+ */
+
+/dts-v1/;
+
+#include "msm8917-xiaomi-riva-common.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Go (tiare)";
+	compatible = "xiaomi,tiare", "qcom,msm8917";
+
+	qcom,board-id = <0x1000b 1>;
+};
+
+&edt_ft5306 {
+	status = "okay";
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


