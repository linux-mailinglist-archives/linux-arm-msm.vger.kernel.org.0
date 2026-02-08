Return-Path: <linux-arm-msm+bounces-92168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dr1lLWz/iGnD0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:26:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B0210A377
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7569300DE15
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3F34D389;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5pxfR01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C789834AB0B;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585947; cv=none; b=quRJfsHQXsM9hCI2Kh3TP2yyUEJX4k9OhxiT4l2ZDJAt1oBvH7ndTYI08pN/BqwKIyv/X1m74dSTk2ZGwMlpagD1TnE04OmAZB8hh9YDDn+MntPDbSt3Ikzw3xGyqthDkLc5dIvkcXB0W2KkN0Ou0yjeVfddhGY19zI50G/aexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585947; c=relaxed/simple;
	bh=7KjgaPAZ/N/94BLKtAqzmJLLuL+i8NbsZKMcDcDhN6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jh1745/HiePgqEfJNCyD9qTNwEqsZEmGM5rDPGAeskZrDZTRgioWt2GYCpIFUCeN4Bmj/DDHGKR13+W5eSTMG3EY+Jte1MLqEIQrEYEXs6ozIckMYnR4jdoZTB9eHaUwz6P7FLpao+J/nnfAv5FHDa0VtXXJR5fQbaSydqPaAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5pxfR01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C585C116C6;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585947;
	bh=7KjgaPAZ/N/94BLKtAqzmJLLuL+i8NbsZKMcDcDhN6I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z5pxfR01zASSWE03rA6f+tdcGGwdU6VVCe/+syq7ZQihgpefVW7PHybwa8WJ59Q3L
	 /Q+7zl6VU6EMO2Ev/RfNfFq1qxyIQ4WihU3mR8J9MyC0lnTMJgdTG5R/w9yDLQBwF4
	 S8PEdhVA6vjzD/AR/OOt7PgWplMjJg3M1kYhImMXh74mxTNFXSrLPhK+x53rbbwCBA
	 vHt5trA2drgNSsLar2FXjd9bKJi/qR40OwSsxyASlxvCsm8d49ZC74qznX+c+Q2YHG
	 5wC/qdSpewiWmKgs9hmnp/nLmtPQ10OyFann59Ik6UgRm0sqR2AapC/qrtxLKTgo9Q
	 Mh8DV3bvwIELg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811F0EF06EE;
	Sun,  8 Feb 2026 21:25:47 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 08 Feb 2026 22:25:40 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: x1-vivobook-s15: create a common
 dtsi for Hamoa and Purwa variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260208-b4-vivobook-v1-3-3a9b5e153909@oldschoolsolutions.biz>
References: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
In-Reply-To: <20260208-b4-vivobook-v1-0-3a9b5e153909@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585945; l=2235;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Y2qI1/Z1yfQDT1AVJoKJZZpFnOZ4lrVs42vPBsxZ9/I=;
 b=apTc6Gg3RSrTxFsFUqVHgpwtchAffdCNlUGQ8tDMPm1K8/J4XhXlZRXlTVCJ08bL9iudkZ4GH
 L4mim6Yp2GYCHcRL1qtSIuRvm4R2jJy1hiLsAUclbwVLZOmm28Og5xc
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92168-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,oldschoolsolutions.biz];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35B0210A377
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The Asus VivoBook S15 S5507QA is sold with x1e-78-100 and x1p-42-100 SKUs.
Put the common part into one dtsi file to be included for model-specific dts.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 ...-vivobook-s15.dts => x1-asus-vivobook-s15.dtsi} | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
similarity index 97%
copy from arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
copy to arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 17269eb0638acb81cef7112285372b5d306ed8c3..1ac64d64e675b557d86042c3c361239170cf3f97 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -4,19 +4,14 @@
  * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
  */
 
-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
-#include "hamoa.dtsi"
 #include "hamoa-pmics.dtsi"
 
 / {
-	model = "ASUS Vivobook S 15";
-	compatible = "asus,vivobook-s15", "qcom,x1e80100";
 	chassis-type = "laptop";
 
 	aliases {
@@ -632,10 +627,6 @@ &gpu {
 	status = "okay";
 };
 
-&gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcdxkmsuc8380.mbn";
-};
-
 &i2c0 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -833,11 +824,6 @@ retimer_ss1_con_sbu_out: endpoint {
 	};
 };
 
-&iris {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn";
-	status = "okay";
-};
-
 &mdss {
 	status = "okay";
 };
@@ -1027,20 +1013,6 @@ &qupv3_2 {
 	status = "okay";
 };
 
-&remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qcadsp8380.mbn",
-			"qcom/x1e80100/ASUSTeK/vivobook-s15/adsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/ASUSTeK/vivobook-s15/qccdsp8380.mbn",
-			"qcom/x1e80100/ASUSTeK/vivobook-s15/cdsp_dtbs.elf";
-
-	status = "okay";
-};
-
 &smb2360_0 {
 	status = "okay";
 };

-- 
2.51.0



