Return-Path: <linux-arm-msm+bounces-89640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB07D3A7B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB3993077E3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B777D31ED66;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0+TCn8g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1131AABA;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823934; cv=none; b=ryeZQLoIidOWvmA4/a7wriKN56l8e9YeiTc1pcNvSoChRQGrlYKuQO7efGiBTX754j+P7LbxrnMxJSPayYubQjujQmZybFL5Swn0mNNxkOcz84y3g9ADtzmL/yGJxWUlHkXo3uoJAyplCo3aL3l1rGK6JLlvYigesFxZN6uZsiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823934; c=relaxed/simple;
	bh=i2KIyk/9YoyAsAVQ8Ktvjgu6lNLtjdHRFEc2ofmH1w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOXT3m1f1QiwPM73Wbb/3Nkgdpk7xmDDGUF//+fLXDqgy0vr41wi4y3s2ZT90rwY59OvHRucpxQz5Dw7JQ/0gbdTjdHY8xI4ig6vcp080j5oCihOTVS/ZEXH/4SwE4n1v8duX1X0KJ/gR5v/plpehJN+VhBKqgtVhu9tt7HEpWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0+TCn8g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0106DC19423;
	Mon, 19 Jan 2026 11:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768823934;
	bh=i2KIyk/9YoyAsAVQ8Ktvjgu6lNLtjdHRFEc2ofmH1w8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S0+TCn8gijlXSzIovKNXCahsIYRsgkgfk5rblb+z0nEbC/X+ZEZfkmeZCZ3YoEmbG
	 JIN/v70hKSRdBHxPsn/R6uRLlSpvNUT96zUsncKwWD7hXgHzXLAuJmcm+mQx5miy4M
	 waj/S3vBZyFAMC+DKFOv7N26uPQudG6xh0640QBsBfbQgdiLI8LgdUHxaiWuym+LZi
	 7Z4o6nPsaseFoXsc4AyVt1NWbaREuilhvtW8KVTbaYwxhGLe1ZzHXcErJA2Nu+2gM3
	 CCqjCMa3RlFUsHbe737W2/PYh4UpnOi4dR5lmk+XJTUe75K5T/tpmZYZCYQSOK7s4G
	 6N4G1uWJXdXIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED106CCF2F4;
	Mon, 19 Jan 2026 11:58:53 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Date: Mon, 19 Jan 2026 12:58:53 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-sony-xperia-tama: Add
 bluetooth
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-akatsuki-uart-v1-2-238f4da4fa56@protonmail.com>
References: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
In-Reply-To: <20260119-akatsuki-uart-v1-0-238f4da4fa56@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768823932; l=989;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=oJfa2XZX/bnhQI4FpuzAOMxaAeuoSQqJQXp6FVFBsCo=;
 b=a/0z+yHib1x0aFIOKRMxjXjdkZYOLrvT5bGZkBat/lOzbNC21peavZUojSS53cpiRTOZzPnG8
 CVMlK64CRVbCP02aP5a2ddJeio6qkgwqGgvm9Gbb4q5W2V2dxm+mlIV
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com

From: Petr Hodina <petr.hodina@protonmail.com>

Enable the bluetooth interface on the uart6

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 68841e036c20..f23f9757a08b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -755,6 +755,23 @@ int-pins {
 
 &uart6 {
 	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		/*
+		 * This path is relative to the qca/
+		 * subdir under lib/firmware.
+		 */
+		firmware-name = "akatsuki/crnv21.bin";
+
+		vddio-supply = <&vreg_s3a_1p3>;
+		vddxo-supply = <&vreg_s5a_1p9>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p0>;
+
+		max-speed = <3200000>;
+	};
 };
 
 &uart9 {

-- 
2.52.0



