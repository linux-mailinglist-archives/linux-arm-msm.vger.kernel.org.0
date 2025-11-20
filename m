Return-Path: <linux-arm-msm+bounces-82625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66917C7293C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA2034EA75C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD7A304982;
	Thu, 20 Nov 2025 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cK/l/rbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D444303CA2;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622886; cv=none; b=eOMkKeHhf5oymtzGQMyGqLu8LSAs5bGUMlEIb9u+YIoikXQi2XkQ1QD+zyzFX8l5otAd78nKZ51gqfSMuDeVHG34QBB5a7JdMkhHaBamqytkPotAVRi+QhNZIcZdzIoGjsgpHPcNkQLwC40nhqlZRBQEoEuYFIEmvFY3sZcnnrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622886; c=relaxed/simple;
	bh=8YKagX8GGBjs386z6tejk6PzXgpSQpbSPdr+btj4mkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nvOM5sw0JvrRWg5slQd75EK3ENgIvUM6MAqn40rKvHe2Gs6H/RPYkl2sbPPCwBDfQ+33RvXgVopojv6ZO9pGjQU3fv6X3a+heUtjt7QqOBUURATo1k4+8p8S6ZPOlikWuFYT6pB/1om7jPIfrZJDUNTOCHHEX0Q7yuxhQgQxbcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cK/l/rbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF60FC19423;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763622885;
	bh=8YKagX8GGBjs386z6tejk6PzXgpSQpbSPdr+btj4mkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cK/l/rbM6AO+vaHCxYC0aw98lDduJ81P9kd/fbr8mml/X07pV/mDatGnWsf1UyMGW
	 U95bXiV07lzMbCdRuHHHibJIueFwJvmAbcJkbN0aZdXCwYGzQOKg4QVrxm+V3bCNIF
	 8FCfxOmSJSDgxVUqFQVQCdVgKvgzTwUnEPhjHq8R8HxXX70GLQhciJrRqvDp4j3SG0
	 KKlADPr0EM7zz9+FPFNnuvJvfIhjpnMgKt2IEXRteGTw0LIjYg1HvSI+uJAvoYOMEX
	 2SiNVIQdSBNAxTYy3FnP+sP8jwAlqu15i2RfRdOPvqhcm4xgOIyBiEmHhqnkpNYGCa
	 UrSCJ7YNTMdLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A9CCF854B;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 19 Nov 2025 23:14:45 -0800
Subject: [PATCH 4/4] ARM: dts: qcom: msm8960: expressatt: Add Accelerometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-expressatt_nfc_accel_magn_light-v1-4-636f16f05cf4@gmail.com>
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763622885; l=887;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=6ayiOr7JapmOLC4broKYTiOez9Grhv0EctruDrmHy5k=;
 b=jr+ybj1UXxg3Cy7st9H9R5i5BunAyujF8jZjp2M2CY9DT25oDfDOs5IaRKI6swYbc9mF6fFTa
 RpiHCHNRHw0AmDgQVeAuNXa6/tZpX8l8A+5M/086IjMLPNLDxKJ/Oap
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the Bosch Accelerometer. Mount Matrix is left as a TODO.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 403bef67a148..5ae702693826 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -499,6 +499,15 @@ &gsbi12 {
 &gsbi12_i2c {
 	status = "okay";
 
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&pm8921_l9>;
+		vddio-supply = <&pm8921_lvs4>;
+
+		// TODO: Figure out Mount Matrix
+	};
+
 	magnetometer@2e {
 		compatible = "yamaha,yas532";
 		reg = <0x2e>;

-- 
2.51.2



