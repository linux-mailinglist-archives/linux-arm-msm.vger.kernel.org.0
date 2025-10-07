Return-Path: <linux-arm-msm+bounces-76168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F3BC047A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 07:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 543C84F3D75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 05:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1E322A807;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isR7iKQc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C5227EA4;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759816549; cv=none; b=s4po+kaPWlJl/CqpMWYy7ZKp3hnEaBSpoUU/LiOaCeU0B2XyCPt8Ns7x/cxP4w+WfFR9TOqKz5cIj43zEIfSynTmJfPa6wxhYboyyVR+AVRE4wXSxcJRwkOkDLiJxD+rZJosYE2BKaUkIqLWKtf/Aj78k+GOK931hkGQ2haWtWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759816549; c=relaxed/simple;
	bh=zllb+3NvwJkSAIh2p+SIfQifQPmEwRZvoLAixcWzz0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qkx0W2yGRBJ+RtOFSc1KwtbQw18CL1NFLu6RDnlovrfwTyD/BpNEg06212oDqmh5wGW27NzhwZiGY24+ljum95kLMrovsKkeL0lC0TsM7NycLfjaxXicf8/bHoAEGVW9apR5FUU9k+lM2qHhjde7cvURPRVDAMHBFt62MDO6/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isR7iKQc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FC6BC19421;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759816549;
	bh=zllb+3NvwJkSAIh2p+SIfQifQPmEwRZvoLAixcWzz0E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=isR7iKQchEFp5G+QojRUOl5eUNtDqlaWT8mKlVNVJLOTwrfBH8bSdqz5QbuF8dM10
	 vpnhcfZDdGfkFysr2JaleFx98N07/jFIGw69GOkbxkFh1mvD/DEjMpO+tj3pTOla8q
	 cEFGozztCcEgUS3AHgGDkCQeuMjLvB0oPVU1rEec3Ch0RhJasV7LV3NjbXB62c9CHx
	 1fYlfpsJQR9+au6VhkBOQbt94el7JvygD3dcWhroPX4TyW7jXI2J4TE3FDA/euNbxi
	 b7wjgCbIMRb1PD6SXDKYHrLOGLjJn+bnpyE4UfADAFonkqGDHWlmrWEzZftB/SEiqe
	 +OS5Q411S0c3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C85CCD184;
	Tue,  7 Oct 2025 05:55:49 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Tue, 07 Oct 2025 01:55:45 -0400
Subject: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
In-Reply-To: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759816548; l=1396;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=hdecRNJtpjZw0ZFJpTZCDbMGZMkzuTJDOFqG18sWriY=;
 b=upDMWCpKVS6TzPDV0IXurlo/SWZvnQRUjFVv2F6MvD841N+5VeyizVu42f8yrfyUfvHsGTJcb
 DQQ744yTtVVCTTcOgpkwKuY/iNhAp23aL5tX4I3TqR0vY7Bx8BiQAVY
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add the touchscreen device node for the HTC One (M8).

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index 36eb42f0f3d9..040a256f9465 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
 	};
 };
 
+&blsp1_i2c2 {
+	clock-frequency = <384000>;
+
+	status = "okay";
+
+	touch@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		interrupts-extended = <&tlmm 18 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ts_int_pin>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
 &blsp1_i2c3 {
 	clock-frequency = <384000>;
 
@@ -358,6 +387,13 @@ cmd-data-pins {
 		};
 	};
 
+	ts_int_pin: ts-int-pin-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcnss_pin_a: wcnss-pin-active-state {
 		bt-pins {
 			pins = "gpio35", "gpio43", "gpio44";

-- 
2.51.0



