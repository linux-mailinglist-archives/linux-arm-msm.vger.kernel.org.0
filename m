Return-Path: <linux-arm-msm+bounces-101390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKIvGDOBzWlveQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891E38037E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39C2E3074440
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052DD36655B;
	Wed,  1 Apr 2026 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Za3g2bWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD393363C47;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075534; cv=none; b=Ri8nSYzamuyH2w4cgHt374/c857DklP35zGVF7GWJqPeJzxFoBhUHSRnuC02OP2GaEsJIoYFWW33L6gGNq7U0SJWvIANdag765LEQQY5YQVvc678F/zZEJ071Np2eZOFpjnxmLu9v43lgdKflOI2JX1/mHa3Qb0RFQB2RoDGdsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075534; c=relaxed/simple;
	bh=jBsewHTghAIIn/wUMqhn7I3HEdWZ2HxsTOsAooxpTDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwT/VsxQilcqTzTCIx6VjgMx1GItNl+iggS7aIWJyMK2dbmm5MvMzjsxiNlY2EIVULVI7eoBceXoV5pGdDCLM8uqlUjvYcc65/EViqzqi0rUDfOEA5S/HiburTqqUKc6YsjoWsEsMY6/ZreXYJcO/+i92ZYfvC0P0XPeD6oimt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Za3g2bWc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BEAC4AF12;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775075534;
	bh=jBsewHTghAIIn/wUMqhn7I3HEdWZ2HxsTOsAooxpTDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Za3g2bWcnInyflFiripNysEfsYnK+m2T4NQzCOCKINQrlbKsEE0QOHxp+5RMznmP1
	 opGF+oU6HvVWnbAsvTN96/EGGawZok7eAxvfa/BLVezHnBuUjkXmy4fKQoycaPz9Vw
	 /oxijF/RBwjzUePnuxmaIvGQOioUb/ZkbFktRW+kM6tZQi+edNQUawCbbgV1okjLor
	 i9Tlx2eTYzGbYpNnr7QSLj7ZjuGhruxXJiJxUZ3GlZZ2EdPF73LfuLkoJHMGzI9Hfw
	 U4pEpPkZj5KeGVF5nqH/kUs/o4sIZ3VI0qP3tOHDVpTyZXEY3fwUduO/vdmRzWgSqk
	 7joJeTHswcLMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDC610FCAD2;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 13:32:16 -0700
Subject: [PATCH v3 4/4] ARM: dts: qcom: msm8960: expressatt: Add MAX17048
 fuel gauge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v3-4-9674cfc0b5a2@gmail.com>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775075533; l=2748;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=IonQhp2O6bu8eJNbRzvS3qlnrcCkSyJ1KwFHc6H2q3E=;
 b=Pdcp1JWN4eqttKlHzxOcnyf2fyTy1ZYVoNtr3gjw/2PNsqDxLNOAFRO8X03903ZgO0X0nmn1x
 gmONkSgnit+DIHLMZ74GPxb5UWn0XGgz7XsJlrIKHGYHIF5aHSqsc1M
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101390-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4891E38037E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Add MAX17048 fuel gauge support.

Tested by comparing battery capacity readings between upstream (mainline
max17040 driver) and downstream (Samsung max17048_fuelgauge driver)
across a full discharge cycle. Upstream reads ~3% lower throughout. Both
track the discharge curve correctly:

  Upstream:   95 92 88 87 86 87 83 82 80 68 60 55 50 45 40 35 30 20 16 10 10 5 5 1
  Downstream: 95 94 92 91 91 89 87 86 84 73 64 59 51 48 43 38 33 23 17 14 12 8 6 3

Each pair of readings was collected by checking the upstream capacity
first, then moving the battery to a second expressatt running downstream
Android to check its capacity. The battery was then moved back to the
upstream device for the next reading. This swap occasionally caused the
upstream capacity to read slightly higher than the previous value
(e.g. 86 -> 87). When this happened, the reading was retaken after the
value settled.

Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/board-apexq-battery.c
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/drivers/battery/Makefile#L5
Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-11.0-XNG3C/arch/arm/mach-msm/Makefile#L308

Assisted-by: Claude:claude-opus-4.6
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 0e6959f7af6f..e4a5e49a43ec 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -186,6 +186,22 @@ &gsbi5_serial {
 	status = "okay";
 };
 
+&gsbi5_i2c {
+	status = "okay";
+
+	fuel-gauge@36 {
+		compatible = "maxim,max17048";
+		reg = <0x36>;
+		maxim,double-soc;
+		maxim,rcomp = /bits/ 8 <0x62>;
+		maxim,alert-low-soc-level = <2>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&fuelgauge_alert_pin>;
+		pinctrl-names = "default";
+		wakeup-source;
+	};
+};
+
 &gsbi7 {
 	qcom,mode = <GSBI_PROT_I2C>;
 
@@ -587,6 +603,13 @@ touchkey_irq_pin: touchkey-irq-state {
 		bias-disable;
 	};
 
+	fuelgauge_alert_pin: fuelgauge-alert-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	touchkey_i2c_pins: touchkey-i2c-state {
 		pins = "gpio71", "gpio72";
 		function = "gpio";

-- 
2.53.0



