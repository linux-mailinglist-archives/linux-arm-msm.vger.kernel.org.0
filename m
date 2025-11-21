Return-Path: <linux-arm-msm+bounces-82831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35632C78E1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 167A72D9C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DAD34C127;
	Fri, 21 Nov 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azZ/igr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE234A771;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763725486; cv=none; b=C+y0a+E+xYxgc31VSJc3MOoRiluVpYFJNlpWMb/MI/VWDgI1eKbk7BfxLYQG1YfaeTSwuHH/Aa7Q74tJDoN9myXKulZphRNycKiAW4fxQYstdFbvYt4Asfuu72lFiXw3dcEdw4ZyDeQ+hk7IinC1BYTW+UGSVh1qLurZXd4eyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763725486; c=relaxed/simple;
	bh=97FTbf36np9MgkM7LPUtVVE0K5P2AfATQ9Z1XDxd3DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T5APmxopbx0sVKVvXKz5MEvQS3muaYg7i5+rBR2TPl4TjBf7VG3mtrRFWx2z9emM5qa0YVYPVJL+1ddaRiNpxvpXtDP5KyrL1FKaqG36LyOQUBVyrqxIwYF4BwX/OqaPl5ROUzBhLJggOgVMKSeqO0fbROIgXD4yxNiH04JjK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azZ/igr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 521C2C19424;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763725485;
	bh=97FTbf36np9MgkM7LPUtVVE0K5P2AfATQ9Z1XDxd3DU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=azZ/igr0DpJ+OKZWs3uePpGGpstOrO3r/W4dt+v/RSPozVce/RssAzjUFLqSLm+Xy
	 ehk3M5psT8XSAEGBgDj32L3qfQmYsie0iZFQTRuM3oujaoYJn4P+rEKCv5wRUQ6EGb
	 wm63FmvodPMAVRE/KVZP6X96JsvBPgr6HnyZuOkdytpZNW/UTqO07gjorxj30EaNR6
	 C0Cw15uhrcruL3D1lleLgCuRzP7/ITJ3f+Mem/5V0C01PUCH/3sFOptBj+5Pj3gVjY
	 hjobd7OwttZeQftsZz8fg+QqmpJSIb/KJiq7EYy31x+QIwyuQH5MKToYs0xMRYBywP
	 OrxAuo/iq1eLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E7FCFC269;
	Fri, 21 Nov 2025 11:44:45 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Fri, 21 Nov 2025 03:44:47 -0800
Subject: [PATCH v2 4/5] ARM: dts: qcom: msm8960: expressatt: Add
 Magnetometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-expressatt_nfc_accel_magn_light-v2-4-54ce493cc6cf@gmail.com>
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
In-Reply-To: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763725484; l=958;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=a7XyY1WOSn4jRl0dEe4trGTPAKhyBmKMsve5gKKfEgI=;
 b=Lp3GRvobazsmLoTotNZHbUiotkHRVFmzp1GNR2zXXL7HDQHqiaKt9lZtu/MV/mhK8EWKq+G4U
 u4hQ/g5BL8kC4HUgTiOalPxMBonyShBcOKlRzLqKiRNyRgNXep864vK
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
 .../boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 0d6d38b57f00..a5aaaeb8b041 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -490,3 +490,22 @@ nfc@2b {
 		pinctrl-0 = <&nfc_default &nfc_enable>;
 	};
 };
+
+&gsbi12 {
+	qcom,mode = <GSBI_PROT_I2C>;
+
+	status = "okay";
+};
+
+&gsbi12_i2c {
+	status = "okay";
+
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+		vdd-supply = <&pm8921_l9>;
+		iovdd-supply = <&pm8921_lvs4>;
+
+		/* TODO: Figure out Mount Matrix */
+	};
+};

-- 
2.51.2



