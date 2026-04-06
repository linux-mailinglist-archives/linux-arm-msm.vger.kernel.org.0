Return-Path: <linux-arm-msm+bounces-101919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AASUA9ZB02m6gQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 07:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CAB3A18B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 07:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 938EF30057A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 05:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76A5D318BA4;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdQwBZMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48197145A1F;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452619; cv=none; b=kG3WOzSBFFxex/DhGribAoCGXiDyUj0clDQwKGVeFCFkHS0ukSDb8C5S9klsXBXqDGUSoH5ivJWXDm1oql8Y0Ax+dvG5Ti+6jWp9tQwt7dal7yJJoua+TLKLaiqCuXsiStHFZx6Zz96Zdf9qSfke6q/e1rAgAipb/QRoF4r7UE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452619; c=relaxed/simple;
	bh=2/R8hwVT5UvTjOtMlKMI6RGTlmZeC9oO2S1Skxh7MUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoKeXM+eIG/Gzbw+zaQhHWo5NaXN/LaXuxU/5TfdU8Uu+x9wANrYvsH2bBwA7VOBJ42Yw+zpYpqifI49II5dDzzxwPWbklC3PWyNUAplx16u2V15Df98+PguRSYjzgSBJj/2Zh7e/ZmPPGFETZx2Opl5g+ZFHGnu5o0hy8v50YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdQwBZMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AEF5C2BCB0;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=2/R8hwVT5UvTjOtMlKMI6RGTlmZeC9oO2S1Skxh7MUk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FdQwBZMzgbUuWgWJkYSNCAmV4A2938HAFpmu9KT7qL967o1En5v7M70701nB8oUb0
	 rcIPK40aEMy95A3o68NUfKLG48GVygAq7cIVg0x9hJJaVW8A68zBQcDiCdFJUWt7lp
	 +O0wuZzYwqxamyufJonseCmoANXy6pEYbkSCg7LBs6HVAJLlx6GzsUChtDn077rd78
	 t9g0fGMRV5xFcM4xxhiyXi34WY2U2z8m0qZhL1am1779GRo+4gJAVR5B9bZ4a65ws8
	 mNOeVpqhTyeQsHPpqXYD1YA8wAgGce4ZgtISRWJnbjPZSjoccmBYvXhn1YQMhYaDOY
	 MOzVSKz9GnKag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE28AE9D839;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:16:58 -0400
Subject: [PATCH v2 2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-2-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1054;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=JU0TS6dILZCLSZHyXLFTL6ZYC0tHdKQqnoQppdUf1kQ=;
 b=BwfaQTGnDfue3ZWWdpP2EfasX/7LitrEQGjtuzkKlETFgafs5q6Xw6Y/vx7zos53mjvYL/zT9
 N0o5zj3Y7PQAF4pAL5x5Qr6K1Nhnyh18M1duHV63gO/aetiyzSOFXKV
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101919-lists,linux-arm-msm=lfdr.de,alex.me.ssier.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.28:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[alex@me.ssier.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A1CAB3A18B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre Messier <alex@me.ssier.org>

Add the NFC chip used in the HTC One M8 to its device tree.

The downstream vendor kernel used an I2C frequency of 384 kHz
for this bus. Use the same value as the vendor.

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 37df271dbdeb..f24882dbeef3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,22 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c3 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 144 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+		firmware-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &pm8941_lpg {
 	qcom,power-source = <1>;
 

-- 
2.53.0



