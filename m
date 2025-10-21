Return-Path: <linux-arm-msm+bounces-78088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE45BF4B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5014A18C392C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 06:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CB823A9AC;
	Tue, 21 Oct 2025 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lshdYMU4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6692746A;
	Tue, 21 Oct 2025 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761027668; cv=none; b=TLfK8s6PYT5DyQutUuSJW/pgcz/wDm1xE3UqVG/u/x16mF0C6tnh1JG2F0gEPFjX3opqRO17EpKus0dSdXfbLac7KhdkR6cTyfOI8YQqqFgMNqzurqajsWQdXzhP16F3R1miiVTtTa6wBlQhq5qabHO2STHTTnGuMrKfPewBv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761027668; c=relaxed/simple;
	bh=W+d5UueuksbVZ5B897EhjH3ZfVq/4dvSVyHlFR39x7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RIy26J6cTCwFG0Yv7AIT0v+/aeq3xVjBR9NEX7bx3kr2qUotHq9a8qR8fU9ZEKAaTEu+wunWwtzZVVsLESlzSw+6llijGL1hhAS4D7UYmJpwywABPHuvPU7IuNskSkdA/Lp0LTIEt+AX4yEdyPaL9v9XeOskRpbbJE8MCOeuxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lshdYMU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9AC1C4CEF1;
	Tue, 21 Oct 2025 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761027668;
	bh=W+d5UueuksbVZ5B897EhjH3ZfVq/4dvSVyHlFR39x7E=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lshdYMU4mKyeIHgI1BjEMsUjoZZz1p0/BzAL2zxNooL0Sa6kjhN8BPlAz9hL+u+fL
	 O4uP2wZZ9EaDulK9tibjNWrYOnQp1SfJH6LRR3khruFEw9VRDtC6bD0bG41GhDnkQT
	 n0iZ7YicdFUpKBrxHc+bMVA+fOSBqhJS+j8OhOoD4dwbpRYZmf63/kW2lepHuR6Gg5
	 gT0CguM+C4HXXquObKsNJNY+NKBB9FhzouIaGgYFjHSobocLyc4kusvtOSNjPIoa6v
	 md4uRllNg110La/GzpjK/WWmHAoaDnn3ttKl4SLpdEEi8BEl21cZX8+d3EVSbUIA9a
	 svCWhoI+GXmeA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1B0CCD1A7;
	Tue, 21 Oct 2025 06:21:07 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Tue, 21 Oct 2025 01:20:49 -0500
Subject: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-shift-axolotl-fix-touchscreen-dts-v2-1-e94727f0aa7e@joelselvaraj.com>
X-B4-Tracking: v=1; b=H4sIAEAm92gC/5WNQQ7CIBBFr9KwdgzQWq0r72G6IDAVGiyGQVLTc
 HexN3D5fn7e2xhhdEjs2mwsYnbkwlJBHhqmrVoeCM5UZpLLEx/EAGTdlECtwYfkYXIrpPDWlnR
 EXMAkAjUpee60bFuDrHpeEettb9zHytZRCvGzJ7P4rf/YswABPUfZK9Mhby+3OaAn9FlFNR91e
 LKxlPIFtwQ4J9kAAAA=
X-Change-ID: 20250919-shift-axolotl-fix-touchscreen-dts-afa274c233de
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761027667; l=2603;
 i=foss@joelselvaraj.com; s=20250919; h=from:subject:message-id;
 bh=U0sTpFpcrFN55z2alpABRqP+EG7oJWABVi8Wsg5kAeU=;
 b=uNkxTO4CLk55xQaPOMprWB4EgvcEz8dLQcg3oddM5f0Abu3ebTofFDa/+dwsxgZ2hm8z8vfna
 kK/SV5o0VXMCF1nQckuwBHJTdgr8+GM2GqSrBGOgaogjHVDpFpMq5n+
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=BBMos4ph15apUFh2AkG9rLZIrBWl5LD4egPOhEv63X0=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250919 with
 auth_id=529
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

The touchscreen properties previously upstreamed was based on downstream
touchscreen driver. We ended up adapting upstream edt_ft5x06 driver to
support the touchscreen controller used in this device. Update the
touchscreen properties to match with the upstream edt_ft5x06
driver.

Also, the touchscreen controller used in this device is ft5452 and not
fts8719. Fix the compatible string accordingly.

The wakeup-source property was removed as it prevents the touchscreen's
regulators and irq from being disabled when the device is suspended and
could lead to unexpected battery drain. Once low power mode and
tap-to-wake functionality is properly implemented and tested to be
working, we can add it back, if needed.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
Changes in v2:
- Split the commit message into multiple paragraphs. (Konrad Dybcio)
- Add explanation for removing the wakeup-source property. (Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 89260fce6513937224f76a94e1833a5a8d59faa4..d4062844234e33b0d501bcb7d0b6d5386c822937 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -434,20 +434,19 @@ &i2c5 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "focaltech,fts8719";
+		compatible = "focaltech,ft5452";
 		reg = <0x38>;
-		wakeup-source;
-		interrupt-parent = <&tlmm>;
-		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
-		vdd-supply = <&vreg_l28a_3p0>;
-		vcc-i2c-supply = <&vreg_l14a_1p88>;
 
-		pinctrl-names = "default", "suspend";
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_l28a_3p0>;
+		iovcc-supply = <&vreg_l14a_1p88>;
+
 		pinctrl-0 = <&ts_int_active &ts_reset_active>;
 		pinctrl-1 = <&ts_int_suspend &ts_reset_suspend>;
+		pinctrl-names = "default", "suspend";
 
-		reset-gpio = <&tlmm 99 GPIO_ACTIVE_HIGH>;
-		irq-gpio = <&tlmm 125 GPIO_TRANSITORY>;
 		touchscreen-size-x = <1080>;
 		touchscreen-size-y = <2160>;
 	};

---
base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
change-id: 20250919-shift-axolotl-fix-touchscreen-dts-afa274c233de

Best regards,
-- 
Joel Selvaraj <foss@joelselvaraj.com>



