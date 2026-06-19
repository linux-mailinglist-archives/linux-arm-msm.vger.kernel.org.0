Return-Path: <linux-arm-msm+bounces-113868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p/QvKnFrNWqWvwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:16:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4716A7039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:16:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=vVd2vL0z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1DBA3029761
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EBC3B960F;
	Fri, 19 Jun 2026 16:09:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D173B3899;
	Fri, 19 Jun 2026 16:09:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885360; cv=none; b=gDtM6NQGO822fuOSuHYHK1Zbe8RQvm7nL1a1y21MEP0nSw137E2+VSaqf90M0tiNIEuVpFuhr3oQOJj60LpZO+Ox6Uul2KDN31CA/rXh2D5Cw3fX1MSw5vUQ2PbLIvAsW3rTCKBf/CC7D/Q266y1myiJlCc2wQFXuGVoKC/Nb/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885360; c=relaxed/simple;
	bh=A3GsCiJRCGCQJn7g3c8QC+jzXSOJChCifd0CegMXt28=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=gpfeSVySCtBA4QlT6YC3u1rAcHMcTY9I60rje4XxhHtQcwVneXhM52PyvHVHfwHbOF4aNpZSziLRb6Hfy+8EKlbW/naNK587kxbtV1sgdvMkS1xTD0wzws+gAv2h/g3yDyZZYjLzeSUdEnODkZj1cxkw7EGqVcL2RoPupRiJycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=vVd2vL0z; arc=none smtp.client-ip=162.62.57.210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781885347; bh=7/lnaOHto/qPkD7B/xXr1vBIxzc7V4NYacvDA84b27c=;
	h=From:To:Cc:Subject:Date;
	b=vVd2vL0zSth/5SBX1JS3CyWcKnJ2e8kRjNaTihBOYCgG+GhCa5DgHup63m5GEYCb7
	 jO+xfTMDYiizJZnCHmQ4QvvLBKIVzO5k2bF1pt4fB9FVBlqK2I1X4d9KzB5nADOwBx
	 PlFfGs6YCCsxiqQKezZrCgM9mmA6aEAaAk+o7jnM=
Received: from 8qyomHQF3vPjMe ([240e:3b3:62d6:a3f0:1216:88ff:fe19:9e1d])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 1F7B88CB; Sat, 20 Jun 2026 00:07:55 +0800
X-QQ-mid: xmsmtpt1781885275tc6vaha2e
Message-ID: <tencent_598E543ABA6624DF90EE8492CB23BA904505@qq.com>
X-QQ-XMAILINFO: N8i9SvusUD3byyZ5b+Ih1rzwc/zcKhCpGsd8SWqXm0xyEsWBEMRSYI4Dj9eN4m
	 uooDrU5gR7FOkjve9xW4oQHIWjwcqdNgQXWGkVLTsVbIvb7rQTPZRKNju6VvRfYI7cyfbm4vpBev
	 N2ui0OEIRT69ldaQRwKuJ5m7DdM3ttYx0+hVzdEfBiGJCUVZNXDbmLWuaEQ8eItpOV4PS0s9YRRo
	 lF9oZfj8jy6JbIM+kLdM8HbU16XWKeb3VjjE59pL0FJCk4WClqz2MZ247SIp2/1zg+6eXiAsmE93
	 senuo8f4j7O+8FS/u7tLEN7drpcK591u6+1+vo0RkivUzEw935Pq5ztQuI7hHOP3JaribmqCXvDK
	 06xVc5jFbfjFgZKfX0NcSK8Kg0AAyyikaQougr8Cl++BXz5TPDiG5eQt257o+A/0pi1ED9iQaBDu
	 1gzOE02U7qU5e2pkENv0JtcFpYEWGW8PGT+CU+Huw7Ic3+Omt5qcwf+gvN7B+bJRUSGgCeXd5ng0
	 2IWHWzmpCfGVPtGUgAKyliR5Nkx9dmpY7SHE0P1J8QUTyN7rx0kbqFExCitJCEcIO2seL/68HVfu
	 g97pml2tABlJEP2OvlEMUBGCQtq7BBuivNgW6BMjJaxMEdh2yqNZ6pBa1XQoslZmhe22ycW09ESl
	 G27cPsHT0JGVu/OQfRbYQEnGmg01Ep7disVH4wu1Q9hxVcHuJ/cnlKpvqegUu5lKu2xdi8As5C7O
	 rp7KkrzUH07JTV+1/3Uh0FlWJag1u66t9FPB8gokWLT7JAscu4fetu0IJnBMXPvtt+vK9DxJ5dcP
	 VjOQFEytevPi8gPPa5ykFs04IVxxQZ+zrz9bSOfaKW8XCEqAB9/8jccPeAaR481Rhr/nPJmp+Aj3
	 qsTLQ5uS27eUx06+NB/oewBnercF5V+djl+oEtKaFzgkdpBeJE9qPPBPqoQFa1rqPd2pYXjoTUt/
	 m6pGDanIivhgkrRXCn0bype4+YbRgdpcCfnqa7yxie9D/mU+XZNdCh8ri4wXVWm0OhNj+bMRY6K1
	 mAmXFZpOsjDaELEmyVSrrrFqL6ut8zsfV/DTVRxknEaNptK2UqEuqXFSGDmCIDA9HSGb2ThQr3cm
	 lZ46tnJczgzmkvJy0lA2npdwLEM9Hu9dr4E/pE
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Xin Xu <xxsemail@qq.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Sat, 20 Jun 2026 00:07:37 +0800
X-OQ-MSGID: <20260619160738.107502-1-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A4716A7039

Add the pm8008 PMIC node on i2c15 with seven LDOs,
using GPIO84 as interrupt and GPIO76 as reset.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 51b57c697a75..2687a2a8dda4 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -599,6 +599,82 @@ fuel-gauge@55 {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <84 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1152000>;
+				regulator-max-microvolt = <1152000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1152000>;
+				regulator-max-microvolt = <1152000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2900000>;
+			};
+		};
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -801,6 +877,24 @@ bt_en_state: bt-default-state {
 		bias-pull-up;
 	};
 
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio84";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			input-enable;
+		};
+
+		reset-pins {
+			pins = "gpio76";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <2>;
+			output-high;
+		};
+	};
+
 	wlan_en_state: wlan-default-state {
 		pins = "gpio20";
 		function = "gpio";
-- 
2.53.0


