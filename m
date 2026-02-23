Return-Path: <linux-arm-msm+bounces-93828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMy9FK7RnGllKQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:16:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B617E1ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E44430FF864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E876D3793CE;
	Mon, 23 Feb 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Es4KXQM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EC237996F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884348; cv=none; b=lo2rL5kWUB7sKr7Ia1GW6xRXp01HdC/6Bx37nnZpz2YdejOkKIov8Nn3Cf9B0V0BDgfKzDBgaVnHtPqp+FvoWs2jxt/YFSqFttUnfd3+05OQKeTXaPcNszfljBiz6y/tYcNUXpd0o8nHsV5BiZnTvwS7kXA8X13SMpu5LLh9T+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884348; c=relaxed/simple;
	bh=J+1g3BFKpGsLeGH9UYvNfZGkIIHnMQDBztHbe/vYHes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqjU+QoBzjwLpfDlLnNM/EARkTJ5ClUJdIBnVSj/r5Y2eMxWkCJ1xwt4q1oTkZQbKErlodWceNPJAGTuuEGBMDH+HDaGIQ0q6Z5SGQjvrSP/DYJmmhEPzsqLayZ8rlLBK0VHxTtox12hdJdOHGBJwcmOR0T5IsU6QB+cT47YuSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Es4KXQM7; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1771884345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWGj0PuEmaHxhlgWD4cc6InO9oM8rB7Fxw08u8rCwZw=;
	b=Es4KXQM7Nf+JQFxE5NW63WUEhXrXkm9t6ef5UY6tQrprP+IBQzx3vzuFYzB63R6u1Xzyx/
	ealhNFtSKeJKhWMCd8fikJ2lDVj+J1VN9r+j6K572JViwV4bFsoVwNtscB4Hqo1Nz7b7jF
	PqlYPuVpKzuigbILx0nODdcvb51zVchLKosVewPIB6ZEsmU/TNaQN31Gh5SHZmFTUPU3b/
	zo3phqbq32LHQvVc+kj0xOjI2yX0iGeYddFz9GgVWQshTPjsbgjU0ibLroIGp4ie4wj+sU
	myzatLmiByPwTDWhmSSKTwq7coU9IJVSqhsb096jd93utHpVaXcG/3701EoCjA==
From: Raymond Hackley <wonderfulshrinemaidenofparadise@postmarketos.org>
To: linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Max McNamee <maxmcnamee@proton.me>,
	Stephan Gerhold <stephan@gerhold.net>,
	Nikita Travkin <nikita@trvn.ru>,
	~postmarketos/upstreaming@lists.sr.ht,
	Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree
Date: Mon, 23 Feb 2026 22:05:14 +0000
Message-ID: <20260223220514.2556033-4-wonderfulshrinemaidenofparadise@postmarketos.org>
In-Reply-To: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
References: <20260223220514.2556033-1-wonderfulshrinemaidenofparadise@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,proton.me,gerhold.net,trvn.ru,lists.sr.ht,protonmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93828-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wonderfulshrinemaidenofparadise@postmarketos.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:mid,postmarketos.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,proton.me:email,protonmail.com:email]
X-Rspamd-Queue-Id: 829B617E1ED
X-Rspamd-Action: no action

From: Max McNamee <maxmcnamee@proton.me>

Samsung Galaxy Core Prime Verizon Wireless is a phone based on MSM8916.
They are similar to the other Samsung devices based on MSM8916 with only a
few minor differences.

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - QDSP6 audio
 - Speaker/earpiece/headphones/microphones via digital/analog codec in
   MSM8916/PM8916
 - WWAN Internet via BAM-DMUX
 - PMIC and charger
 - Touchscreen

There are different variants of Core Prime, with some differences in
NFC and MUIC.

The common parts are shared in
msm8916-samsung-fortuna-common.dtsi and msm8916-samsung-rossa-common.dtsi
to reduce duplication.

Signed-off-by: Max McNamee <maxmcnamee@proton.me>
[Raymond: Refactor touchscreen and MUIC. Add commit messages.]
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/msm8916-samsung-coreprimeltevzw.dts  | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f80b5d9cf1e8..6cbe919c978a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-motorola-surnia.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-coreprimeltevzw.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-e7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-gprimeltecan.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
new file mode 100644
index 000000000000..40415b5635ef
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-rossa-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy Core Prime LTE Verizon Wireless";
+	compatible = "samsung,coreprimeltevzw", "qcom,msm8916";
+	chassis-type = "handset";
+};
+
+&battery {
+	charge-term-current-microamp = <150000>;
+	constant-charge-current-max-microamp = <700000>;
+	constant-charge-voltage-max-microvolt = <4400000>;
+};
+
+&charger {
+	richtek,usb-connector = <&usb_con_sm5502>;
+	status = "okay";
+};
+
+&mpss_mem {
+	/* Firmware for coreprimeltevzw needs more space */
+	reg = <0x0 0x86800000 0x0 0x5400000>;
+};
+
+&muic_sm5502 {
+	status = "okay";
+};
+
+&s3fwrn5_nfc {
+	status = "disabled";
+};
+
+&usb {
+	extcon = <&muic_sm5502>, <&muic_sm5502>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&muic_sm5502>;
+};
-- 
2.47.3


