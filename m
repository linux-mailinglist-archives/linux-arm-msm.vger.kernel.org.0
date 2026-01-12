Return-Path: <linux-arm-msm+bounces-88626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9FD152D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AF0930C9CCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D713314B8;
	Mon, 12 Jan 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rDcfVu1J";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="y90d0oSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0480432B9A2;
	Mon, 12 Jan 2026 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248868; cv=none; b=EXI1cCxI7nEbPcMZHPlWrYQDnght0A4nL+OO8dKZFCB1WVv3OKJCbkmZ5/3QBp08uk3LEuA+ZMgNUN+GULV6DoDHH7spaww0gdUQQmMnl/gTs7r1c+lPiWjJHV0ph7ywBN/0TnxRnCPGVwo53f/DfDs7d5n+7wdQkXU/W+qwjsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248868; c=relaxed/simple;
	bh=TwZgVvSwBF34L7N4CUDqPCkerxFP8r6skyVin6mIX+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2Uu7l8JkJH9PKfiyAUJxTA8ibdWVlPUhGqkEFAPTTumlfqFN04oYDLdt9lxAoCoWJyG3tpX8lE/S1tehufgqczcKJjjHcqOd3+1kzVqS1OPMnoNTrhItvfMiYFdDLtZnqLw8W/+ff6xkhl+r9AfjQygWZqWc2TI1+KLtLw090w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rDcfVu1J; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=y90d0oSr; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248819; bh=aWCB54DX416yxveZ87Jmgu+
	+Ed7uMzjxa/AlU7V5sUA=; b=rDcfVu1J/9RjPL5lk2M0e0LT7Sfq+Pt38gpSYwz3PrJ6TGwqgq
	GSh5w7NX9Om8+lNOVtbyXNEEmaispxzRdo9sh/zOnJLFMkLLn9zlmodDeYy/sSj+OIg+PGzc5vD
	J5KC80WLg0ZIMAhmAaixX4WEPGMTMdyf38zXQd9i7f0vwH6Qir4Va06MngO5rJAavR59sH36ToO
	2Wt5fn5UA4GmI7RpqpXRmjqoonGG/mOU+ooqmbqeUVqMLcNt584zVuzWRuo0rrw7lowLiwg1lTd
	UByWOWjKEcvrAc/5TwfcMLPDQcedn1b08f/VBDVVBM1FHFnpoCyV+jnbGxi3qqTSZtQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248819; bh=aWCB54DX416yxveZ87Jmgu+
	+Ed7uMzjxa/AlU7V5sUA=; b=y90d0oSrbL79QyUyZMukTkY8KUfXr7BQ5BPhUDzqexCe53wxII
	rSs6MssUkPItYllJIIsxirKrfYSBAUtEIwCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 12 Jan 2026 21:13:25 +0100
Subject: [PATCH 2/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-xiaomi-willow-v1-2-8e4476897638@mainlining.org>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
In-Reply-To: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=2498;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=TwZgVvSwBF34L7N4CUDqPCkerxFP8r6skyVin6mIX+4=;
 b=FlDJo7CDU1poarKZl7Ula2dHFacvAqjyzOj4dHx2ex1m3gCrlPar3uLdfqsYyw/fAqKFWwG5e
 vE3OTTbLCVaCduaUNvs3hEA+LqrespcillJeHcM9fkS9S5UnXHuUr/2
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The device was crashing on high memory load because the reserved memory
ranges was wrongly defined. Correct the ranges for avoid the crashes.
Change the ramoops memory range to match with the values from the recovery
to be able to get the results from the device.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 44 ++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index bf03226a6f85..4c548cb5f253 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -13,6 +13,12 @@
 #include "sm6125.dtsi"
 #include "pm6125.dtsi"
 
+/delete-node/ &adsp_pil_mem;
+/delete-node/ &cont_splash_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+
 / {
 	model = "Xiaomi Redmi Note 8";
 	compatible = "xiaomi,ginkgo", "qcom,sm6125";
@@ -36,28 +42,42 @@ framebuffer0: framebuffer@5c000000 {
 	};
 
 	reserved-memory {
-		debug_mem: debug@ffb00000 {
-			reg = <0x0 0xffb00000 0x0 0xc0000>;
+		adsp_pil_mem: adsp_pil_mem@55300000 {
+			reg = <0x0 0x55300000 0x0 0x2200000>;
 			no-map;
 		};
 
-		last_log_mem: lastlog@ffbc0000 {
-			reg = <0x0 0xffbc0000 0x0 0x80000>;
+		ipa_fw_mem: ipa_fw_mem@57500000 {
+			reg = <0x0 0x57500000 0x0 0x10000>;
 			no-map;
 		};
 
-		pstore_mem: ramoops@ffc00000 {
-			compatible = "ramoops";
-			reg = <0x0 0xffc40000 0x0 0xc0000>;
-			record-size = <0x1000>;
-			console-size = <0x40000>;
-			pmsg-size = <0x20000>;
+		ipa_gsi_mem: ipa_gsi_mem@57510000 {
+			reg = <0x0 0x57510000 0x0 0x5000>;
+			no-map;
 		};
 
-		cmdline_mem: memory@ffd00000 {
-			reg = <0x0 0xffd40000 0x0 0x1000>;
+		gpu_mem: gpu_mem@57515000 {
+			reg = <0x0 0x57515000 0x0 0x2000>;
 			no-map;
 		};
+
+		framebuffer@5c000000 {
+			reg = <0x0 0x5c000000 0x0 (2340 * 1080 * 4)>;
+			no-map;
+		};
+
+		/*
+		 * Matching with recovery values
+		 * to be able to get the results.
+		 */
+		ramoops@61600000 {
+			compatible = "ramoops";
+			reg = <0x0 0x61600000 0x0 0x400000>;
+			record-size = <0x80000>;
+			pmsg-size = <0x200000>;
+			console-size = <0x100000>;
+		};
 	};
 
 	extcon_usb: extcon-usb {

-- 
2.52.0


