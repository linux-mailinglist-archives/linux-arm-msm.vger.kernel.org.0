Return-Path: <linux-arm-msm+bounces-115798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AGCHGS5+RWpxBAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:53:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470846F1A24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:53:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="tv/ybqiT";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115798-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115798-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A299B30492C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999003A6B68;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D670397E64;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939176; cv=none; b=ntJ4tLWoXZCjBJYZBviDFm2BxK80EMKAFySE/l1weg9LqqfDUX59pYg2FMZZYiqnAFvLMWRkltuOqWNdZFr0JXYjECzJmEWUBeXECK8fhiQrDSr6qU4KcDjm/DbFGkWDOySh78D4CSY35RdO4/QgO4ncwj9zHm0LFNDhW8hQJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939176; c=relaxed/simple;
	bh=YBZNjPDvs2NTDBthBppb7kT2kiuflIpBTYfsr7x0HMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqnxkVXUUyafjs788+FsidvWpuUezxZ2O60H+FG0YnHi3dwTGMv1UrKsqG1P/baqrLa5abMWoH3kiwuqVSDmVr+KBse4fJaKJIwEp+n+fobvo6zS6fm+/044rBqmQnWKou11VCKyNFUPSe7+HnolDZBEV0d2HRUTgDkBd8XXt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tv/ybqiT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3460BC2BCF5;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782939176;
	bh=YBZNjPDvs2NTDBthBppb7kT2kiuflIpBTYfsr7x0HMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tv/ybqiTmdPMBlkaUHiSH868lSEWgUGp/MxLfR3OTA3D7b2p+XgtN+ntRMlf9TEvM
	 +5/C4TnL7a3OPJGF8gqLd5OHJ7IlNYq88sZAVKj0z7VbuA+sihc2VyDNlZbFJl1mqh
	 rOiLN1f9LNmwwMhMC2mEl8CJqZIWUFuZdWg410D2r3l5S1gsfvmc9XdRItqqVprNwt
	 TkiftZWAA7W1WQxRK/Uc8c8Nyw3m0mYzjTnFnguC59E2gplRNchlnCO6/Yx4/E8Ngn
	 1MMi5nVlk2wcoOGaV5MCfI4lyRQxxPDEls50D36l+gahhr9frL78G6bnUOkHraob9Q
	 p+7327ILN0CwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AB7C44501;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 01 Jul 2026 23:55:56 +0200
Subject: [PATCH v6 3/4] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rimob-new-features-v6-3-be7d5d1e007f@protonmail.com>
References: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
In-Reply-To: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782942968; l=1707;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=zVtEsQzoBqgEOAQbabFGZoqatrDCkszo3+cx4iEIygQ=;
 b=TQf0vxH5qAyInLM0uxQmnoIC7mP+xqgE0U1W42U9CihamT8LyUu/UlDYXID012Mi0UyzmLdgl
 psYbututSlXDN+pCC87aXisFERd+wIDqnJav122DmlVg6T90yg99kBa
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:cristian_ci@protonmail.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115798-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 470846F1A24

From: Cristian Cozzolino <cristian_ci@protonmail.com>

This device uses a Goodix GT5688 touch controller, connected to i2c_3.
Add it to the device tree.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index db5c9f04bf1a..060129c72264 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -94,6 +94,31 @@ &hsusb_phy {
 	status = "okay";
 };
 
+&i2c_3 {
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt5688";
+		reg = <0x5d>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+
+		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+
+		VDDIO-supply = <&pm8953_l6>;
+		AVDD28-supply = <&pm8953_l10>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+};
+
 &ibb {
 	qcom,discharge-resistor-kohms = <32>;
 };
@@ -311,6 +336,13 @@ panel_default: panel-default-state {
 		bias-disable;
 	};
 
+	tsp_int_rst_default: tsp-int-rst-default-state {
+		pins = "gpio64", "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
 	gpio_key_default: gpio-key-default-state {
 		pins = "gpio85";
 		function = "gpio";

-- 
2.53.0



