Return-Path: <linux-arm-msm+bounces-106856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFR9Bs2ZAWpxfwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:56:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 896D250A706
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6EE830036EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF7E3B961F;
	Mon, 11 May 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhh+sMkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6431E49F;
	Mon, 11 May 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489282; cv=none; b=PwtbbT/bBDyIjjfQVX1J/LYZq6M315JO1HRoX4lhkj+m+1Cs9YrVFI5PLW4xxNUJna8hYq7MT61lr0eS1YvMy+Pslro7l5uuB+hwuCKAqmtUU176J3Dws78ad+EiqIfdMZIEAjU/I1h7jBQKfbR9TqEtiIBQa17EQMbhLUgwaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489282; c=relaxed/simple;
	bh=UzqTOaHRU9smzFf4OFemjOEZlOYUA0UfdAOKglWpaJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MJCYxsQC9lFEE++W6LoZyR3T6fCO4ihgetDbSm65FgVccBqNGRpQ6itcPYDJZS/sXhvJJpyYJUMAs6yCjv/RZWLh8qC8lIh7YUNroBwkE6rOoJY/sHMphWKtFZcE5oc0zZ4bQb5uIl/NF5DitK1VjeOAJS8RcBxrovGwKqL26jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhh+sMkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B39E3C2BCF5;
	Mon, 11 May 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778489281;
	bh=UzqTOaHRU9smzFf4OFemjOEZlOYUA0UfdAOKglWpaJE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bhh+sMkL1fRKPR2Vsn0FBV2fu5cTKQuKkdQZW/XdNH5PUYAjnp4gj57HgUCtFVKJM
	 VSyEQn6ElV4XAH2ti54FIexsgxPAsVfKUYgNUMy2Q8x2b+54HQHDKF34PVEOEwEWcW
	 3dYlur+2eFMFvLSBrpSmLzshR/dD32HvH1IRvCC34JzUcTC+gMFJpWRnkdFyn2kBMr
	 gvVL1aqXToMHc76yfOUozWuty4y7JHHOjts1Oz0WAS/omD6w8xMUSKSdVTG0g9bSH3
	 MYSj6XrSOAW3KRujBB1m7XswgIYb7KAtVHoOGJuKFSvzT0lzvbeDzq9w2qdpdjeoNT
	 m4vQAgNxaMXpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A170ECD37B5;
	Mon, 11 May 2026 08:48:01 +0000 (UTC)
From: Qian Zhang via B4 Relay <devnull+qian.zhang.oss.qualcomm.com@kernel.org>
Date: Mon, 11 May 2026 14:18:01 +0530
Subject: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMCXAWoC/y2NQQ6CMBREr0L+2jb9INi68h6GRYUqP4FWWiBVw
 t0txM0kb5J5s0IwnkyAa7aCNwsFcjZBccqg6bR9GUZtYshFXokSkfVk58isiRMT8lzptpQPjRL
 S4O3Nk+Ihu9eJOwqT85/DvRR7+9cITCqFkqNS4oIFQzaStvy7P95cCHycdd+4YeApoN627Qfc2
 K+iqQAAAA==
X-Change-ID: 20260511-linux-next-0846ad58ba18
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489280; l=3025;
 i=qian.zhang@oss.qualcomm.com; s=20260511; h=from:subject:message-id;
 bh=UvfCcSS+NNYGPij6dEX9rRsuz5DeGDSI2ga/3v1YAXo=;
 b=AkqF63xY1DcsQ89bMnQFRi95GL3r7GC9vg6Z2nAOMKskoWE3sZ2QLlq7kVnJeJLqx1QU0RVGR
 ztolhJlftx3DYso+XE2+F0JaLg+QmJfkPh2xwjssZ5BViI7n8J0q9kP
X-Developer-Key: i=qian.zhang@oss.qualcomm.com; a=ed25519;
 pk=bPnvg+qtu7WOMbd5NyWuvI8LCSGKP2BQwbycyqy3gIA=
X-Endpoint-Received: by B4 Relay for qian.zhang@oss.qualcomm.com/20260511
 with auth_id=775
X-Original-From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Reply-To: qian.zhang@oss.qualcomm.com
X-Rspamd-Queue-Id: 896D250A706
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106856-lists,linux-arm-msm=lfdr.de,qian.zhang.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[qian.zhang@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:replyto]
X-Rspamd-Action: no action

From: Qian Zhang <qian.zhang@oss.qualcomm.com>

The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
asserted before PCIe enumeration, and GPIO54 to control the RF kill
line.

Model GPIO56 as a regulator-fixed node (wlan_en) referenced from the
PCIe node via vddpe-3v3-supply to ensure correct power sequencing.
Model GPIO54 as a rfkill-gpio node to allow the rfkill subsystem to
manage RF state.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
The Arduino VENTUNO Q board uses a QCNFA765 M.2 PCIe WLAN module
connected to PCIe0. Two GPIOs are required for proper WLAN operation:

- GPIO56 (wlan_en): The WLAN module enable line. It must be asserted
  before PCIe enumeration begins, otherwise the module is not detected
  by the PCIe root complex. This is modeled as a regulator-fixed node
  (wlan_en) referenced from the PCIe node via vddpe-3v3-supply, which
  ensures the GPIO is asserted with a 20ms startup delay before PCIe
  enumeration starts.

- GPIO54 (rfkill): The RF kill line. It is modeled as a rfkill-gpio
  node so that the rfkill subsystem can properly manage RF state,
  including software-triggered airplane mode.

Testing:
- WLAN module (QCNFA765) successfully enumerated on PCIe after boot
- WiFi scan detects available networks
- rfkill block/unblock correctly toggles GPIO54
- GPIO56 remains high throughout rfkill block/unblock
---
Changes in v3:
- Replace regulator-fixed with rfkill-gpio for GPIO54 (rfkill)
- Reference wlan_en from PCIe node via vddpe-3v3-supply
- Fix subject prefix
- Link to v2: https://lore.kernel.org/r/20260501051918.1990713-1-qian.zhang@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..e0ffe87bba90 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,25 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	rfkill-wlan {
+		compatible = "rfkill-gpio";
+		label = "wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+	};
+
+	wlan_reg_3v3: wlan-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_en";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vdc_3v3>;
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <20000>;
+		regulator-boot-on;
+	};
 };
 
 &ethernet0 {
@@ -326,7 +345,7 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
-	vddpe-3v3-supply = <&vdc_3v3>;
+	vddpe-3v3-supply = <&wlan_reg_3v3>;
 };
 
 &pcie1 {

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260511-linux-next-0846ad58ba18

Best regards,
-- 
Qian Zhang <qian.zhang@oss.qualcomm.com>



