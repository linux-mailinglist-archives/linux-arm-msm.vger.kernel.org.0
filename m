Return-Path: <linux-arm-msm+bounces-92845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAgDIlIzkGnZWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCF13B6A2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 09:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8A6643007A6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Feb 2026 08:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB0B30DEA5;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K46vo+rk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964322FE0E;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057986; cv=none; b=t/L9OEeP9v6ax4PVfowmHcijjaICPXZtkBc4YGLRaml4TK/LJgs3T6K0MdEOffMJootY0FYKZ9oI5mCEh36shwuOZ1nZeoPlyE4Gf4RN8vhkp4uTxz/Zj8wJspU2utppLN+lA8Egi0FpevsPdJkHQ9T7oXYcGP9yIWrCslqtP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057986; c=relaxed/simple;
	bh=C33cMMyuzEeSbioi3MV1NrYP7T9w2//QQTxjVqKyUjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lC3S1RJXDAHxb96jKlJ4nk+dVoCo1g5gZ2V3t6v/7PuWJ+z6FjJi4JGu2mTQJZ2DSqnLKdSsffiqi8cqAUlayoAJR5M4blx7gW6+m35lgI4XFtfIENKm1tHDRLV+SiU4Mw60RwQ+9gkz9UqQZeRuoQ+YeRcCe5ERinUTXbFQHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K46vo+rk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81E95C2BCB5;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771057986;
	bh=C33cMMyuzEeSbioi3MV1NrYP7T9w2//QQTxjVqKyUjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K46vo+rkefTl4HjBz0/rSuIRGINaB6crq9D7JqW2Xguw9n1y8h7ajMbvoiTd81ht/
	 tHlIisXVSN+sT7N8PtiwYam1v1QI4HC685DYVqEKenJKqzTtV1Qk9uT3U42Oi4amqN
	 Lwc1bVJ4NBbkddGBcWz5+BvqTZDulJYvXeN0XangV7K680DKprnvsSOzjqR6448Wbm
	 biHK6bRjM+zK2cZ+z/AqFqVpOIC5KNHFqrZ2q53iIjGmYZv3LguqpKTNbV1NDMyIus
	 Grj3HT2Qi8isWzI/jUjNv2/tPNzDeSwIMxZ7qJuh2Y2dmccvAhTsgmUVlukhcupkwG
	 AuZ0OlZI286kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75936EDF17F;
	Sat, 14 Feb 2026 08:33:06 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 14 Feb 2026 09:32:56 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: x1-vivobook-s15: add
 Purwa-compatible device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260214-b4-vivobook-v3-4-3c88065bbf77@oldschoolsolutions.biz>
References: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
In-Reply-To: <20260214-b4-vivobook-v3-0-3c88065bbf77@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771057984; l=3008;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=JsNHubph8pAleAfVSQwYG/ermk8hpfjIvUW4ciJ0gnk=;
 b=tf8OSBBkFk9RgJOdXnN9PnaEOquP619kkuDyH/MdbilmuODIqFjlP9jUCJvXz6N+BavMcikJ8
 AFq4o/bl7s1BBs8oe6KfssUcvm0s7eQc3+kwMTltHj/qQufuPkrjz+w
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92845-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto]
X-Rspamd-Queue-Id: A8CCF13B6A2
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The ASUS Vivobook S15 (S5507) [1] is available with Hamoa and Purwa SoC.

Add the Purwa-based device tree.

[1]: https://www.asus.com/de/laptops/for-home/vivobook/asus-vivobook-s-15-s5507/techspec/

Tested-by: Colin K. Williams <colin@li-nk.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e80e4efcd70f14cef4e7d4a1ec48eb..baa7ec904b4878a41e6fd9c678025f28cb484cf3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -380,6 +380,8 @@ x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb x1e80100-microsoft-romulus15-el2.dtb
 x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
+x1p42100-asus-vivobook-s15-el2-dtbs	:= x1p42100-asus-vivobook-s15.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-vivobook-s15.dtb x1p42100-asus-vivobook-s15-el2.dtb
 x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:= x1p42100-asus-zenbook-a14-lcd.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6f3337978ece27e2144491c53c84658cc1f3a364
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "purwa.dtsi"
+#include "x1-asus-vivobook-s15.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "ASUS Vivobook S 15 X1P-42-100";
+	compatible = "asus,vivobook-s15-x1p4", "qcom,x1p42100";
+	chassis-type = "laptop";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcdxkmsucpurwa.mbn";
+};
+
+&iris {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+

-- 
2.51.0



