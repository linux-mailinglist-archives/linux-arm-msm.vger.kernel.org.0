Return-Path: <linux-arm-msm+bounces-97527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBgsIaghtGnahgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:39:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E93285270
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3C743056BCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDD03368AB;
	Fri, 13 Mar 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMkTawqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA8332EB1;
	Fri, 13 Mar 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410892; cv=none; b=SK4SIJB59yJLGsmh/KRH8udCVHnJuubR893UOh/Pmh1wb1+a7nw55vRt2d1t0YW/flj1x4yJT4ryNRpEYvvpPDmsz9q0abs9iD3CFE6Gm0KY7omCfXPRo637B8mntywXzyy7BMux1gXV9yijS2oNYhjG3MJe/Y5XqoCq/F0fPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410892; c=relaxed/simple;
	bh=rW0sgZRNUegVJJyrf1fUfLQePGpW2MmN0lOZ5hihc6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q3ErMny9X/D0FWSOUIQhCLACxXQpxkHRpCJMJ8bDP9BxTDiv0AO3+BxhTOYP71soeAnkVYQPcZ7d6XWh523eO8cOuNs/vGGYti/+UhovxTVVBKU2h4r0tRye0E6YX8gGuysmvGlBR8CnRbnbr/WCgkDqilfws+p7XASaH4QJpOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMkTawqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B4BC19421;
	Fri, 13 Mar 2026 14:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773410892;
	bh=rW0sgZRNUegVJJyrf1fUfLQePGpW2MmN0lOZ5hihc6c=;
	h=From:Date:Subject:To:Cc:From;
	b=GMkTawqYSicfgpDcvLv6vT/QBn3fbebhBoLR23SdIv7xMHegxOMdUmgpuV6MQ1Gju
	 sE5k7cLKK1Hr43Sg1dm4AdVec8AnKW++yP3oERtJr2uF/oAdD8MI90jkjX6uHTl6zm
	 HiGjpEr0RvZDTTlC+1W3vtVscqceoLogYkkPegvIguoK49yMwSjirFAj9cGMafsueg
	 77ztUCOa7z1pRReebRBUT9yRCTgNEiIf0Ri++gAzAKWUnnjKRfbl1mTErAKDhRVvAS
	 JvNqCk+4k/TifGIpsyBKn6nyDtTo78hpFSR0yuGooYjYHhm3xYGcgvkQetLBOGKu6v
	 O11HOdBu9dmIA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 13 Mar 2026 15:08:03 +0100
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Enable USB OTG on functional
 Type-C ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-topic-x13s_otg-v1-1-cb2e4a08e25d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBOcpB+6SkSIjTWbFJUQxLsnL
 b/FewUiBaYIa1cg0MuR3dOAfQfm1s9Fgs9mGOQwSYUokvNsREYVD5cuMaK1iyZptJqhRT6Q5fw
 Pt73WD2kilxhgAAAA
X-Change-ID: 20260311-topic-x13s_otg-51ff8ae0ca37
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773410889; l=4990;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ExBImoQoNri/JtsYEeEQo60qtjsA+equUB3YrZJCDtQ=;
 b=Fm9yEm9U6T7c4bWLKdE7dbFWUq2GrpliRjKsQFB54KHvjPo1MYaytNUMs5AYAWdaLXYze8eF/
 rywXInPaKf3CbgDVOxledLeHWaQtiTEiru5gLCthLD2VPGkEsI+abCd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97527-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,a800000:email,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6E93285270
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The two non-multiport USB controllers present on the platform are
role-switch capable, so mark them as such. They need no additional
plumbing, as tested on the X13s.

Enable OTG for all devices featuring a data-role provider in one fell
swoop to prevent hitting the edge case where UCSI code would time out
trying to get a reference to a struct usb_role_switch, which wouldn't
be registered if dr_mode was set to anything other than (the default)
OTG.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts       | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts     | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts  | 8 --------
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                     | 4 ++++
 6 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index c53e00cae465..3acb63017fe3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -819,10 +819,6 @@ &usb_0 {
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con0_hs>;
 };
@@ -856,10 +852,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con1_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..e4513b66261b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1132,10 +1132,6 @@ &usb_0 {
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_dwc3_hs {
 	remote-endpoint = <&ucsi0_hs_in>;
 };
@@ -1169,10 +1165,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&ucsi1_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..f83947c8b1b8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1341,10 +1341,6 @@ &usb_0 {
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con0_hs>;
 };
@@ -1379,10 +1375,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con1_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407..82ad20c5c7a4 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -758,10 +758,6 @@ &usb_0 {
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con0_hs>;
 };
@@ -795,10 +791,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con1_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14..1effb30c93af 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -986,10 +986,6 @@ &usb_0 {
 	status = "okay";
 };
 
-&usb_0_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_0_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con0_hs>;
 };
@@ -1023,10 +1019,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_con1_hs>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 58876b25dd23..6303a0d572f2 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -4080,6 +4080,8 @@ usb_0_dwc3: usb@a600000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -4159,6 +4161,8 @@ usb_1_dwc3: usb@a800000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 
+				usb-role-switch;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;

---
base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
change-id: 20260311-topic-x13s_otg-51ff8ae0ca37

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


