Return-Path: <linux-arm-msm+bounces-113867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NOaNCVZrNWqHvwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0D6A702C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qq.com header.s=s201512 header.b=jJHAgnrx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=qq.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 579AA300B614
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFAEA3B5837;
	Fri, 19 Jun 2026 16:08:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DDA3B47DE;
	Fri, 19 Jun 2026 16:08:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781885301; cv=none; b=rgNCHO7kdRZaw2NOfxEwVT25Pu2eo9Fd10HnoH40nAgssZ0uoYHsGBkbq2wpQkDCAgjuNtmOgUToTchJmysA0oIGwy1c1MYWth3BTWZazSRhxdxETeY9ZjsjaK9Uk+qr6Z7XH4oOdZ5kpZlP4lTPIzUoQ3MOBmNb8iNpoHPKLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781885301; c=relaxed/simple;
	bh=ewmJBY17hkH/VguQHRP/zj7Y05CAqxAqWVAiogzG4iI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=HPiTMWu2juwxUH/5A48XeX+O5qgHYJn6CQzFo7/o1nxzRmBYVwgAbYDQz0t+x/fRL5eM2gD/nGFeeRSCCMqv7Zf71O6qs7LPdoEhdcgLG3drREY/ZPkWuGkCLW96d5L4a28ccRQ1cyYKSg+UQtDbFoT2D/LEr2hx5RKM6f33FQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=jJHAgnrx; arc=none smtp.client-ip=203.205.221.240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781885290; bh=3e2tdmTzxXO2g2AIkPPMDDrzYTIKNlWPDCSBeA8+bM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jJHAgnrxjvVHYd68x0hHaUDNdOkmHbepsV3DIq/KNu9G2mUOfq8VFKWXOeMjnKvUu
	 RBcwxEBsavjoYXtdkPNrAM5napIB3JFJUr1AYWsez86eJwMSXWkw+/dLeFKCG1oGn2
	 ZiC4xPssjMUmRY1CuPKK/1S+N/ZAkXWMB1DCLeAc=
Received: from 8qyomHQF3vPjMe ([240e:3b3:62d6:a3f0:1216:88ff:fe19:9e1d])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 1F7B88CB; Sat, 20 Jun 2026 00:07:55 +0800
X-QQ-mid: xmsmtpt1781885277tj8hdzo2u
Message-ID: <tencent_1E24D1D0EF248A4B3A3A9E258AD4217A7805@qq.com>
X-QQ-XMAILINFO: NfH6lijP3t2qTJ8ObAeDy9lkl3G6ABjml5vrN1Nlh4ZNtQ3K4vi13ywNPJKoxr
	 4mhzIWqLeRDRVslMDqXzpEIBtI47ZX9S1qkaUv8DwjrVPtrPuowQXEPTpPifLTG9ERgxsuuxNYGk
	 mZBZwNJJKb14qdQbMevHatX2s5VImIVWRKB5n5NabhlKLTuArJNsGCepyisDLoMhbrBI3u1KzISB
	 El+jNrYJFOOy7Kzydssb3wHO+5wspdbi52Qd9rt414eiYOiBfM+JkBQkc8gZX3fblnTRAYHuiJuz
	 JcJCyO7Hr3kCerFai5GisTAGFkghn5yCDGm1Y/Rfymxinfe1BoxTC+nTju6iVvIpyJdYBJ1d45Di
	 B0qURWgqMQh7PAhoWAKZpk5lN6aJ1/UU9XLiumtxQOX1c1YZi2C5KT1OqXf/aWueIf1sgnQibI63
	 YM6Au8zSuVug/Mr4DaioNu9Gap0N0hMZQ7Kr5hCWxG5JBRywnQCuyPb1k+c70zYtNCP9GP/0MFyH
	 7gsUH1RnzfemhtSnX8aU4mdpqR4rafGFM3ZoIvxRF7toMjFNzc1nNoDuYacgjLnXDTqgGupiEeMa
	 gANCf++OZdxzeqggfIc4KRu8u55/xaVXl8E7Om/Gyk5quPeNRKIVqW7ledG4Ed03CNQguh3Y16RW
	 CoEp0BRZj3+Cf0qOElwnMeaDPZgC3BEvqxZetuKlg6H0Fe7U2LWzIoFrb56mZXkcKDcBKyZWAt76
	 5B4EE3HBo9woAqcC4EzqQmnpBNIuzw808mvqEyKnyGDNNL6apGxBgJPUh1v+uHsvahI7lgaon7qs
	 Tr11Dfz6S25970V5wvBfudnS7rzgrqjxrOWvf19DUTeg4/X1QxwPtVSYGDf/lEMCBTVqb5xZy1bJ
	 +3uIFp3ESWzloVoqVj7EjpyT6HbKNuUtn9NlZVBLzmbo98bhW0q0l9r6nM5L98V2iM/HsxKom7Hx
	 dhurtnPpkpmvlZAOeDuJr6PqxpytrqD6BZpddxa2eqsVHjK7/wVF2KODkdQ9WwLZKwBwOsor3nHn
	 OAkB8xTki+pqU/dpa30h5+xeKFEaVPR4WXO0NUsPJRX2GAEBGcoCyV94SjLsJ0+/5/YnjdxyHuc8
	 4hzCdETt1aSuYTzrRAhXRaCh9ubuOrWAp2viHGQY5ejVUVDsIdRbiBVie5Gnn/D54Mw1h4
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Xin Xu <xxsemail@qq.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xin Xu <xxsemail@qq.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: add ov8856 front camera
Date: Sat, 20 Jun 2026 00:07:38 +0800
X-OQ-MSGID: <20260619160738.107502-2-xxsemail@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260619160738.107502-1-xxsemail@qq.com>
References: <20260619160738.107502-1-xxsemail@qq.com>
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
	TAGGED_FROM(0.00)[bounces-113867-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 9EE0D6A702C

Add the ov8856 front camera, connected on CCI1 to CSIPHY4 and
powered by pm8008 LDOs and other supplies.

Signed-off-by: Xin Xu <xxsemail@qq.com>
---
 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 2687a2a8dda4..6d2cbb0b9fa6 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/usb/pd.h>
@@ -531,6 +532,61 @@ vreg_l7f_1p8: ldo7 {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	status = "okay";
+
+	ports {
+		port@4 {
+			csiphy4_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&ov8856_front_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera_front: camera@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+
+		avdd-supply = <&vreg_l5p>;
+		dovdd-supply = <&vreg_l1c_1p8>;
+		dvdd-supply = <&vreg_l1p>;
+
+		clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		clock-names = "xvclk";
+		assigned-clocks = <&camcc CAM_CC_MCLK3_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+
+		orientation = <0>; /* Front facing */
+		rotation = <270>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&mclk3_active &camera_front_active>;
+
+		port {
+			ov8856_front_ep: endpoint {
+				link-frequencies = /bits/ 64
+					<720000000 360000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
 &cdsp {
 	firmware-name = "qcom/sm8250/xiaomi/elish/cdsp.mbn";
 	status = "okay";
@@ -877,6 +933,20 @@ bt_en_state: bt-default-state {
 		bias-pull-up;
 	};
 
+	camera_front_active: camera-front-active-state {
+		pins = "gpio109";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	mclk3_active: mclk3-active-state {
+		pins = "gpio97";
+		function = "cam_mclk";
+		bias-disable;
+		drive-strength = <4>;
+	};
+
 	pm8008_default: pm8008-default-state {
 		int-pins {
 			pins = "gpio84";
-- 
2.53.0


