Return-Path: <linux-arm-msm+bounces-82832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04DC78E57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A096F3564C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB2A34C83C;
	Fri, 21 Nov 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3bPTQva"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B6134AB0B;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725486; cv=none; b=ZyHN/GpXOw+qKaZFeRHoKIVFdaItlz/xhY5YnithAzcBEpiZI4rpzDTSoGqOtdpFDIGSD9Wq8aH/uwmvcce6exaGDxC2QQ3cLJbnzoSXIQy6BgOhqUpp0CYJOJBIJJp63AP1Y8Eh05AWoaHQig1hVgfs77M/OTZjnTbTjKUY29w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725486; c=relaxed/simple;
	bh=nnRvLGfK9uWDg9KedZ7Z/AwLfMCK2zbVbuMKr0fVBX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzeBlQeMqrm6Ge5OScLI8bFbIB/IM3I8xTPFV7dwQWCbGpMA3kxFKJdiFApOYI8P+whAoRX/qvf+UQA/9kWzYl3/yxnzcyuTqUMoXYxidv/u3xHHlvlgK2cjYPnSMLzWO1PLCD3BzTR/6ulauh3NkATbcTcG5QqIYCglJgxz9B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3bPTQva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61CDDC4AF11;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=nnRvLGfK9uWDg9KedZ7Z/AwLfMCK2zbVbuMKr0fVBX8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K3bPTQvaoASZJisBCaggNuX/WJPbeNHsc6SzhXTFqjFnqcEOsRUpy4l4Wo/9UbEQj
	 gqbW/x0bJzqRvVqM4mQLKUYnIiA9QmamL5bMZVzpzfgCTX9hTyBMa5eWDV6w+zXPHS
	 qMcJtCRTIz18uMpyUcLKV/jClOuhVsJRd2obievCSwB1aAwKhvp067jQJYaD/7w5jE
	 G214AuLSTTiW+25EyH76KcUW24tS7fFDjvGKfdRlzMZ0Z0QR5hB5gD1+y3Td2awQ3T
	 HBFoFH3NZFSwcAAAlfP7D31eJhSrTbSvWYRvNEEplVANCkjp/gkY5Za0IYS2NOlg4U
	 4mcNGspqoYcgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5765ECFA759;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 21 Nov 2025 03:44:48 -0800
Subject: [PATCH v2 5/5] ARM: dts: qcom: msm8960: expressatt: Add
 Accelerometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-5-54ce493cc6cf@gmail.com>
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=890;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=fzCh/GlASHAPDspYl2KpIS8l3p2PvycaJ9AWihVt/2M=;
 b=5DnThmnsPvbynKoP9sG14z9eVINhbER5K6oae95OoAp4qMEWB1ZqjOxOafYEbEo95GVl8v9iI
 uyDpg6WhwRRD7hKtyF/WS1rvYjvWxcGWvcrMqh9wsBkmAQfpdkyOUNk
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
index a5aaaeb8b041..f18fc5d7d150 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -500,6 +500,15 @@ &gsbi12 {
 &gsbi12_i2c {
 	status = "okay";
 
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&pm8921_l9>;
+		vddio-supply = <&pm8921_lvs4>;
+
+		/* TODO: Figure out Mount Matrix */
+	};
+
 	magnetometer@2e {
 		compatible = "yamaha,yas532";
 		reg = <0x2e>;

-- 
2.51.2



