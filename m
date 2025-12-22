Return-Path: <linux-arm-msm+bounces-86260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02489CD6EBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49ABF3015843
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F1233A03F;
	Mon, 22 Dec 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyPaQGO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7C332917;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430342; cv=none; b=ickNi0db3WX2rKAToCdOppQ2SaqE5AaKy6LJzUQe6wnHUWWIeL6ULHxbLCxiF57aaEwfGS/UOn6AXIvuGIJ/7FFigp6URSj4misLFvI0mtmj88RlwjvuxurTw+EKhZ2cT1qw+uhuEXhof6Ggi2sg0yzuSywUvnqwOly1Rox3EPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430342; c=relaxed/simple;
	bh=IxZQxqdN+M0Pz1WGD0TsE0JXMo/7r9MSL0fWKWUuwAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejqXnEfr6ML2/vlWEbnJROvMbSWBugfhdpmc9N5QB7uFM2SbPyMky1NKMFZe30j9YoM4lTTlvVZEUxEEyOc5ZyP+tWCZcXrliCSWTNRj85l5tWoKAWmHyoBTE167FsFf3z2glfcBPzxbd7BIzgLbHM7JpwOcS2yhS5Z07q1Ghh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyPaQGO0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B55D7C19421;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766430341;
	bh=IxZQxqdN+M0Pz1WGD0TsE0JXMo/7r9MSL0fWKWUuwAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YyPaQGO0TGKJIFeJECo3YMDcEQCFFwTqFIjx1Zx6tZPgS9kk6F6HGNFF9UxB9tGEx
	 FZ6JEWzYH4eljjo+D7iYTMRMi4dLpoTrXm62Tj13RmYeE8EmwGb7i0LaEWkof+g0to
	 dWYbwnOg+0Kd0gubqTxQh6V7WKAlyLBA+IE1WehLZKIT12BhDQZzj41XCi/8x0NemN
	 EzvCsC4sjnp9qWCAIEsNxNGWT79ruGsPfnAyvwzyl9F4U184McjShLtstgllhLx8Zt
	 QTOivSbpoXrFIGHwkY3G4kN4SPiiBtLUz6oXna8YITn0Vh7iZiGU+CHwBrHQhCrsYa
	 5fCw1FW3s0zEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB07EE6781A;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 22 Dec 2025 20:05:39 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: sdm845-samsung-starqltechn: Update
 firmware paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-oneplus6-new-fw-path-v1-3-a2d366f9eb89@ixit.cz>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+cFxlM0/qdKJ4WnDmq/MewWhoYxFFoCkBwVraCL+wRY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpSZaElifyursul5URo8/qUBz95B4hDuqBULgJk
 SU/Z0qBsSOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUmWhAAKCRBgAj/E00kg
 cqqWEACF2mKYnomZE0WCIRbKZnBJKhGvgd/+jVmDM18/Ry/IJuuzwA2mlISXQqkCOzUwakSNGk0
 fhXdQNcYJSm9uXt59oAf6Nm9UbwA2j1v8NrxAN74tIYp5UwxMscHv+0a74/k1lgR1JAsZNV7beg
 gbJQKJRKAFZ7owyLB4+J51osaaIjgXdpT+xMiSIE/ugmyBSJtkrQKpuYqQLTj3s4yOM7Ltc6KdB
 dGolVEku4mzLITA4UjEm5vsoX9CE3O90nPKficlzoYtZVqvlQY90XkKwu3e87ya40KMm9x4aqVh
 L7Gj4kA9QdzrCwkdYwTTR1Ywm2xNY/vWlKFFOWOPPNSNtq/avq1gFBrURoK3KaXuRPmryD9/TnC
 WKdspHSw2fj1l2eKaP492C5vvh2xM5e1XnO5Kcryp/TNG+GCRH1AQmMguIeU4LISiobtf6q1JMv
 SPUfQUPzq1+LkkHoNK9avCHTzwhWljYM3M7KviZoygloqI0Zi1KFlhmHwpWE0KrOVyt1e1CPWX3
 eZWk/Z2N33OYjvN8wltoDIjn5ySHuPm2SNCK6An76X/4Wwr4ZOK9dxWtkiBd/+WQGI2hufMDHKz
 0sEc7kAZhCvwm4O0XwxYaIHabbRkz481vFeJRh2M2AvZ7Vg/Mrcfx7XwIKetBM1Qx6g351xVZ7o
 /eZmpQ/yYTQ0RVA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Conform to the new firmware path scheme.
Includes cosmetic cleanups.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5d41a92cfebff..77f5872de6f19 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -254,7 +254,7 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/Samsung/starqltechn/a630_zap.mbn";
 };
 
 &mdss {
@@ -699,7 +699,8 @@ touchscreen@48 {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/starqltechn/adsp.mbn";
+	firmware-name = "qcom/sdm845/Samsung/starqltechn/adsp.mbn";
+
 	status = "okay";
 };
 
@@ -904,20 +905,22 @@ &wcd9340 {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
-			"qcom/sdm845/starqltechn/modem.mbn";
+	firmware-name = "qcom/sdm845/Samsung/starqltechn/mba.mbn",
+			"qcom/sdm845/Samsung/starqltechn/modem.mbn";
+
 	status = "okay";
 };
 
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	firmware-name = "qcom/sdm845/Samsung/starqltechn/ipa_fws.mbn";
+
 	status = "okay";
 };
 
 &slpi_pas {
-	firmware-name = "qcom/sdm845/starqltechn/slpi.mbn";
+	firmware-name = "qcom/sdm845/Samsung/starqltechn/slpi.mbn";
 	cx-supply = <&slpi_regulator>;
 
 	status = "okay";

-- 
2.51.0



