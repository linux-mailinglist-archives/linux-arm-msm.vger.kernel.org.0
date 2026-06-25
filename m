Return-Path: <linux-arm-msm+bounces-114519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yFtiJEMXPWqfwwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:55:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E1E6C54CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:55:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=JY4q5jpX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114519-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114519-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FF6830CF3A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B7E3DD856;
	Thu, 25 Jun 2026 11:54:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234353DC4C9;
	Thu, 25 Jun 2026 11:54:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388465; cv=none; b=AlUJ3YVTzt9DCdOJH+Vdm0OCZUchmHcaN0K4WPaQZ4fzuBffQgDj2kcEyKpDLeXmYW8kLAZhrqdy91leFMVSdROrnpREAyW3AW2liWnpD+POIbKzTb3SFS0shnobobkBwvzDcxO4UiVC0JYIWPFIJVJGbanQg/F9dDRxmnBuAG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388465; c=relaxed/simple;
	bh=Qpxrkle4L3+25f1Qchr0uePF1fnDs6PGOnlKpcqQS8c=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=MVHkemInt7uOvnBy6FlhY8qFap1X6p0E6PYNzPtRJOA7qS04IDewPW/XECMN5JhgTYmUpxr+XafTn8nhq8Y9K2ouYRvvD63x4zWWOHp7mW0XGj8+hyv3239zq3HADYHEeE54sdDtWhbipwU2BflNOxVQMvxz5HexYyqdqZs1/88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=JY4q5jpX; arc=none smtp.client-ip=162.62.57.64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782388457; bh=0JEJUDTGl3UgSnEgYJ7DUXbzUGFeNoc/frtAE6GbpUs=;
	h=From:To:Cc:Subject:Date;
	b=JY4q5jpXbf73oWGmj65i+8iW8QxXDqOvaFIiVbzTuJaVkXDKC6uJfW83xeEozIace
	 Tem2udn5pf5nVBP52UDX6MejePACrBlpmmlRFYzzW5H3asvCEGJFKtTSHRjpvgxAF4
	 hnjpiG1xnlKRX5Yp+TCFeHjgvzNUbIeb+c+lGeT4=
Received: from 8qyomHQF3vPjMe ([210.21.239.182])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id D3B9F86F; Thu, 25 Jun 2026 19:52:59 +0800
X-QQ-mid: xmsmtpt1782388379te9prsnlg
Message-ID: <tencent_D4AB219A942591742C3A6DA4DFB0EBA49505@qq.com>
X-QQ-XMAILINFO: NdJjTjI40ejMoq3JkNixrly/Xi1k+Cab7Xp37KdAlXNjJRIoFaFdcswQwtC2QU
	 FdC7zosC+eN0mg7Z0UYXuuSycyaytS06XBkIAtCBtHquhfiJirMN5mMcFC0J60z93Xn5T/c1x0Ug
	 AvvFS/bS/p3kFHwXT2trcCqlVaOtoSsbf1P+cg5ynD41pzCW6a3nAfm/sqlkurahuf6iAYMSwZ9l
	 +np+c/LgE6rBMxBuRaPq5Ly1yP2hJQ5hDJIooQAJgx6m98tFj13sm2Hg1IZckJN9rhExjrkUqva5
	 +QIuWqtojwu2eNJABsndXBh8FEgYgbI4dszuJlyrS1nscrLxZK7ZPp5CrLKjhb4RckJHzZFsLw1i
	 3TZ4nvoYv0YbsjTBH3P/JwedcGMcihHUeFjHL/+MWUVVyCseSucFMzffq3JJ2CKSjy54zckaG41s
	 Re1oVwwAT5n9ZZi5ZnSVFR6fc8Rsegxnrev/8+bmvq/Kf6l9czRlB0uiFcCEhdgOFy8GkBElK+1H
	 t8MI38AUv806CCCO8M399eoLfzSlbHvQwPzsxzDg8aaTlM/RCOtxJqDaCcz0GdbzlkLkFahwgWHk
	 jowleI+3UKVKoTSrt7KBfoJTJmxMY7AoYQjzgcFJSBrFku12VLrSUzr+yjzp0Elcqgqm9/QeVLtL
	 SVpKuwxEIMEyXV58WxudIu4oGqNec4bKk2n/4Y6nDVmWJPtNqRf4xjlsLLZzaDXz8Hc5WGNN7zHX
	 t+KnThvEwo5v0LsN1MAb4TKP49T4GqlkleZSyxuxYu4A1cwR/KfWv7QLoO89pb+H/dgXiKB9LRzv
	 bbFZO16IWcZDBxHCM+1sQ6oY/Ql40WFN7EjmGvpE0znx2kSk3+yTgvwiQxw37Jq0OkrLP3Lm0Gke
	 5qlosbLHNBMd+g2ats/v5TO4Qpj0O2t0VDUEo0OzSC7NeJ16yC8tIpeqfpIY2qW7tpZyPzU7ifqT
	 Bf6ITpk3aREDMn2KOIAThj/g8GGP5dGJQXJIxN8qr8WjOhFG3J1dLLW5eBiRQpdmbaqq7ivIi3tN
	 HMHzgP83ZLi4Yzwj/SFsKBUE0CCyrkif2B1pMypJDgNddh326RS4Um1vbTCdKC6XiUFcXmKe4its
	 00FePHJSdvIKsrtRsZf7L2fCA9lOIbWWKgMvwi
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Xin Xu <xxsemail@qq.com>
To: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008 PMIC
Date: Thu, 25 Jun 2026 19:50:48 +0800
X-OQ-MSGID: <20260625115048.16735-1-xxsemail@qq.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114519-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:xxsemail@qq.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,qq.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xxsemail@qq.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qq.com:dkim,qq.com:email,qq.com:mid,qq.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26E1E6C54CD

Add the pm8008 PMIC node on i2c15 with seven LDOs,
using GPIO84 as interrupt and GPIO76 as reset.

Signed-off-by: Xin Xu <xxsemail@qq.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v3:
  - Split pinctrl into two separate states for interrupt and reset, drop
    input-enable.
  - Reorder bias properties after drive-strength.

Changes in v2:
  - Fix coding style (blank line, interrupts-extended, property order,
    drop output-high)
  - Correct voltage constraints for ldo1 and ldo2

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 51b57c697a75..05c366eaeff1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -599,6 +599,82 @@ fuel-gauge@55 {
 	};
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-0 = <&pm8008_int_default>, <&pm8008_reset_default>;
+		pinctrl-names = "default";
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
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
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
@@ -801,6 +877,20 @@ bt_en_state: bt-default-state {
 		bias-pull-up;
 	};
 
+	pm8008_int_default: pm8008-int-default-state {
+		pins = "gpio84";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pm8008_reset_default: pm8008-reset-default-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	wlan_en_state: wlan-default-state {
 		pins = "gpio20";
 		function = "gpio";
-- 
2.53.0


