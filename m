Return-Path: <linux-arm-msm+bounces-88996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F374D1DEB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 705D930CEC8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8632438BF7F;
	Wed, 14 Jan 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNTrzFA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B24F38B99C;
	Wed, 14 Jan 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385338; cv=none; b=eiC7bBW8likCwOYXVO5o8EpXSW2DrBa3RHJ+imC/4S95X+5+Dhasl948NM5jkhiGM+4EOf/ZHcuM/7PhxQNn1XbTwhkbVTche0ZDPe1LCT0Xr4kX7LC6+F117f3ARIHrhTZMF2DC0yUnSssPH0+3YQ0JtRKPHJ+FCOXTgDaio2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385338; c=relaxed/simple;
	bh=B8uw2XRpfRfyUglpmkl1Ya7toisPuPn6DrBBErbtgZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k0vtu/gIcBfrao49WXi03G67WyGrOGCa8fFq7P8GeSIbfj77dhC2VOY+XH0N2absddzAj1gl9aLAPv8jY6zEHPynzpZUNLN8act3KcrbVQsyP5DJeLCFTqa+RrESsPg7FGJuLFxHnzb9W524o7Al5tkU9TMm8SL/nP0shV8mr8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNTrzFA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF80C19421;
	Wed, 14 Jan 2026 10:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768385338;
	bh=B8uw2XRpfRfyUglpmkl1Ya7toisPuPn6DrBBErbtgZQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=BNTrzFA51xhjj1oY+b5F6GD2I6Wp4R2D0qFwYbaA4LX1F15V4u5IUuGE0PxESM2Ui
	 S5SY9NHRLXVlPrAwO2jehIMajRzkbcKv9x2qJE43PQwGwcXjuim+4tWDN1HitFkLr5
	 u8m6nUeKyfWSFpJkSaQ0hzQV0NeAcrI7CvsRwmbW3fXqcgM4e4txjkRQHeECcgM8I0
	 ckqTEhgDv/0V57jkHfVi5C/zFImjePC3hjABVebsowkbe5THIVe4ixWnm05yOVQSD+
	 dgXh4Zez3tXAUEWZBhltngStsKXFtRkPPg1c8Og0Fb9m4qxnGJBVUOomeT3kKKwi9+
	 0mkbmHEr2VDHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF207D31A38;
	Wed, 14 Jan 2026 10:08:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 14 Jan 2026 11:08:45 +0100
Subject: [PATCH v3] arm64: dts: qcom: sdm845: Introduce camera master clock
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-sdm845-mclk-v3-1-c9351deaf4f2@ixit.cz>
X-B4-Tracking: v=1; b=H4sIACxrZ2kC/23MQQ7CIBCF4as0rMUwU5DiynsYFxXQTrStgYZUm
 95d2o2auHwv+f6JRR/IR7YvJhZ8okh9l0e5KZht6u7qObm8GQpUgFDy6NpKKt7a+40LCResjUJ
 fAsviEfyFxrV2POXdUBz68FzjCZb3fycBFxyMPlsjtZN2d6CRhq19saWS8FvqX4lZaoGVRScMS
 PWR8zy/AbBSpOzeAAAA
X-Change-ID: 20251213-sdm845-mclk-041f2a952e31
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3175; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=VjhjaqM3XS+2n8GQ/x6ApyiqxtWTj+IRWhXyXFadzb0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpZ2s4qUlnsUVwtA6W65uL1mnojYILhVNWEt82U
 g/yf/DzcLGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWdrOAAKCRBgAj/E00kg
 cs7+D/9ML+U8eqXXOOZTcHPNgeiBo/mhZ0Z3jrLg/n2w6HWaR6tRiVitKZRAg+utC4b6Y02ad1U
 DXACGzZP6l1BIypVgyNPSxSMLMLoRycoDSF7O15SsqDnTroiv4KgYJGol1DsANCobEn9bKKGvBm
 0ch5BK5JN5k5hcQzMWkYggLs2Lm0dWrEd24V/EQGm6zbnsM5pq6bhp9bzzwk0rviyTX8I13AEpe
 XuzV8JoVN/wSMOnyu1uvfG578OT9zQTpApIPRQl4sj+EVFYiyhH4YHc9RF7/FwM3WxWdCU/J0kS
 A7MkMM9RO2KSduFDSB65Q9DVu0mXuz7kFf46S6sPzLfGCDwJCN1yfA1BqqxjqyGUwo0eXheAogw
 ePh78bIqgRBB9xblTehQYoYg9JYTADE1sqg+VzrRbX/BLSGiblS2QzyO1X+LTB5OGzNKaj29kOC
 bGDUY3fz0/C+JskQ0A3y3k2Vpo+EtFEi6GqvxIyhlEPA6PyU7DpIYUALzFPVxTVy/MACvFcS77b
 hADQVAB5xl4W95+QrU9yZTmMm1V6oTKq+6bdUSYZ2rJikN/FkxBapu2qutVEfxFZmJDbEyarQLZ
 thyraLsVcjGW5binxvRxcixhfeHhsx1kq8UYS4z7E6MvxlqV6D8LBxPyMt8yzaS3gbqM5i+Xf5D
 4X1ATcbIHiWqd3Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Put clock pins configuration for camera master clock into the dtsi.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Inspired by Richard's patch set for SDM670, I noticed that SDM845
follows the same pattern. This change prepares for enabling
additional cameras.

These pinctrl settings have been verified against the downstream
SDM845 kernel.

Since most of these are not yet used in mainline, testing was done
on sdm845-next using OnePlus 6 cameras with downstream drivers.

Thank you
David
---
Changes in v3:
- Dropped 2nd patch
  ("arm64: dts: qcom: sdm845-db845c: Use pad fn instead of defining own")
  as there is no documentation or people who can answer questions for
  now, so we can move forward with the main camera work.
- Link to v2: https://lore.kernel.org/r/20251217-sdm845-mclk-v2-0-7028c2d09145@ixit.cz

Changes in v2:
- Added mclk3. (Vladimir)
- Reword commit messages.
- Corrected commit msg name. (Konrad)
- Link to v1: https://lore.kernel.org/r/20251213-sdm845-mclk-v1-0-197bc947d4c6@ixit.cz
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba7..c0f21a745fb0c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2805,6 +2805,62 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc_intc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk0_sleep: cam-mclk0-sleep-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_sleep: cam-mclk1-sleep-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_sleep: cam-mclk2-sleep-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_sleep: cam-mclk3-sleep-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			cci0_default: cci0-default-state {
 				/* SDA, SCL */
 				pins = "gpio17", "gpio18";

---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20251213-sdm845-mclk-041f2a952e31

Best regards,
-- 
David Heidelberg <david@ixit.cz>



