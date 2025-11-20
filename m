Return-Path: <linux-arm-msm+bounces-82626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83516C728B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 45D2F2F1BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752C83043C9;
	Thu, 20 Nov 2025 07:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSbGXGWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFB303CA8;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622886; cv=none; b=VYfEy9W+1E8P5cZ5Nynz/R/QJoFpIxhoXv/OU5S6monqrEGIMtl8nlaNHyI3d4+90vgd9AXy7vp1xoF4+ICQrQWV7Aq5bM3zZMuAlO++Ib4vVEbnkHHsUDWfhXEvDb+ut2jcUSbBr06fv3gom2krzBst2WH2Z2x6l2G5N4yPgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622886; c=relaxed/simple;
	bh=9xxxHVPVB3ijF7fi8zZXuY1fcHhaER7hDvjysMqlxF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9r+z+f2bgzNgjKaSxQX9TaArA+CbBUuao09A9O6DlRhTi5fdkXN1Au3t0yZ6urN02kG7auoHtzBwYpX9A5pEvgLrBe85Q81QzwiCwUQsap4hZKhWdyUDzIY4yNtXh6gANHAIhV1TVqFfZ5kwIOjTe5etFDr6oBX4mK6dJYgCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSbGXGWA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0FC3C16AAE;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763622885;
	bh=9xxxHVPVB3ijF7fi8zZXuY1fcHhaER7hDvjysMqlxF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oSbGXGWAmNbKUtaDlyATNto/ZUPnoaj0YnC8wS2eLo2+TKCB74CEuqH2NUWnHSYcg
	 oA7VAuAq3MRqAjo/C4FfAXGZU4isGr0pDZgaqMFeOcAHxMiP+41HNGFjR5xqS6qEfo
	 5JwSdGoJZZL0ePsVZt/AdKA8hRrK02r63Gc1qx7H+uy2GIl79drxbqskbB8+V8XW6G
	 LVTdDF5xYyoG3K2KEFopQifhuyuh2SD2cq6B0bKCV08hOjtGI/C3wylb7WrnMdUbkn
	 p86G+mD3hOXilRIR2qzNc74iv8IcCwuAlYq3Na3PZWM8SOuedTdqMpDIwthPayXVBB
	 hLpSfeVGCyXzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7623CF8548;
	Thu, 20 Nov 2025 07:14:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 19 Nov 2025 23:14:44 -0800
Subject: [PATCH 3/4] ARM: dts: qcom: msm8960: expressatt: Add Magnetometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-expressatt_nfc_accel_magn_light-v1-3-636f16f05cf4@gmail.com>
References: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
In-Reply-To: <20251119-expressatt_nfc_accel_magn_light-v1-0-636f16f05cf4@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763622884; l=943;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=YhqxAzSOCOeCQlEI5U8jpQj+HTe6yqqN3vpsUK3rJ3c=;
 b=JpcQamOMZqyhAWTYeQpFuh+Nt3Xqhbyq9HmE7dgA+e5sWJJ9QrUPss12nOQ4tFzcjcmYboF6l
 bO2gRP/ZESOAdeV4dj6/Ld4yEMIMPn4gYs1PqyMnenjwBBi69PbC2Zh
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the Yamaha magnetometer. Mount Matrix is left as a TODO.

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 81806d7ca001..403bef67a148 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -490,3 +490,21 @@ &usb1 {
 	dr_mode = "otg";
 	status = "okay";
 };
+
+&gsbi12 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
+
+&gsbi12_i2c {
+	status = "okay";
+
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+		vdd-supply   = <&pm8921_l9>;
+		iovdd-supply = <&pm8921_lvs4>;
+
+		// TODO: Figure out Mount Matrix
+	};
+};

-- 
2.51.2



