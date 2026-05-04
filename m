Return-Path: <linux-arm-msm+bounces-105764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EToJVG7+Gnh0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:29:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2B4C0AFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 17:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 776303012C77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 15:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529513E025A;
	Mon,  4 May 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="AcKMmLWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26DA3E022A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908478; cv=none; b=Kfyu3aJUp2NNH7IVw5x9JXh4aH/a0Zgwr++lcBf+/5L8f9HYJEleotObmxP/g7sGWsOf5rerzlxhWu+/pb1FYtf1vVOajRnVkY1/X7apT6KWBKmBSkkKna2udlqGNhNjXjR3qpqQO/mddwMFUBVwo6VMgaoNRaSV3tZ6ZBVKADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908478; c=relaxed/simple;
	bh=9tXj5jzx0LJOIKHtlQ53NKu8/mNJfmhfr35XqM4lZdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lVxujSLE3xjjpGhBmsNmS6BmoB2u8ekXScpscuzCU45HgTDaWPouE154KU1mhFfUOBxga9n5xeXWKg7IA5CTVcao4AdLp8AXH8o6krY07Z3/uZA17DBh1pC3dLh4zAcISR2GzU6VEZXP1pfLPCCZLPWUvMT3T1sq9DK1YA/74Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=AcKMmLWK; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 2671 invoked from network); 4 May 2026 17:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1777908467; bh=1muykjFIIU6vgtZLfl4vZjG8zzlzTdgA63NBX5Jm6yI=;
          h=From:To:Cc:Subject;
          b=AcKMmLWKE21+r6LqDh3oZUDfmyZqDEmyB4TKvUNs2bRGhHR3q73nTtxOJH29dDc55
           wPwC9pYSo9HMv/LlAISEDMGFJJGmGXEMigKN03D1Bs39oAr489I4H1U7lPyqKrUATs
           B5fRNs4YopqY9JO32s5Zh2V+5AdS5N7A2MhCBqKQyiBgU3MvCU/r2xcHO+MtYIGQqa
           bT0gpD3Oguma/bgwY+o/U07jUMm2KTyB2woJwRhHGbDUG2KHdj/OxgocRBeHDGw4Ce
           ziSo2+TJiRb6gRarY6cqQaDJk9hbriqaJPkjavPoxl6GvzCJc1wpiobIrGTsWPTvFU
           mGhYmR55hNLfQ==
Received: from pub-142.188.multiplay.pl (HELO ad-Inspiron-14-5441) (adamszyma@wp.pl@[178.219.142.188])
          (envelope-sender <adamszyma@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <linux-arm-msm@vger.kernel.org>; 4 May 2026 17:27:47 +0200
From: Adam Szyma <adamszyma@wp.pl>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	quic_bjorande@quicinc.com,
	val@packett.cool,
	Adam Szyma <adamszyma@wp.pl>
Subject: [PATCH] arm64: dts: qcom: Add Dell Inspiron 14 Plus 5441
Date: Mon,  4 May 2026 17:08:12 +0200
Message-ID: <20260504150812.15385-1-adamszyma@wp.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 4d69c8ef495984d62e34a26ec3d5f04b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [8WM9]                               
X-Rspamd-Queue-Id: 2AA2B4C0AFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,quicinc.com,packett.cool,wp.pl];
	TAGGED_FROM(0.00)[bounces-105764-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[wp.pl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamszyma@wp.pl,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[wp.pl:+];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add device tree for the Dell Inspiron 14 Plus 5441 laptop which uses
the Qualcomm Snapdragon X Plus X1P64100 SoC. The device shares the
same platform (Thena) as the Dell Inspiron 14 Plus 7441 and Dell
Latitude 7455, and reuses the x1-dell-thena.dtsi include.

Signed-off-by: Adam Szyma <adamszyma@wp.pl>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../x1p64100-dell-inspiron-14-plus-5441.dts   | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4ba8e7306..8fb09ec5b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -449,3 +449,4 @@ x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
 x1p64100-microsoft-denali-el2-dtbs	:= x1p64100-microsoft-denali.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-microsoft-denali.dtb x1p64100-microsoft-denali-el2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p64100-dell-inspiron-14-plus-5441.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
new file mode 100644
index 000000000..d38febdc4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p64100-dell-inspiron-14-plus-5441.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Adam Szyma <adamszyma@wp.pl>
+ */
+/dts-v1/;
+#include "hamoa.dtsi"
+#include "x1-dell-thena.dtsi"
+
+/ {
+	model = "Dell Inspiron 14 Plus 5441";
+	compatible = "dell,inspiron-14-plus-5441",
+		     "qcom,x1p64100", "qcom,x1e80100";
+};
+
+&sound {
+	model = "X1E80100-Dell-Inspiron-14p-5441";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcdxkmsuc8380.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcvss8380.mbn";
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qcadsp8380.mbn",
+			"qcom/x1e80100/dell/inspiron-14-plus-5441/adsp_dtbs.elf";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-5441/qccdsp8380.mbn",
+			"qcom/x1e80100/dell/inspiron-14-plus-5441/cdsp_dtbs.elf";
+	status = "okay";
+};
-- 
2.53.0


