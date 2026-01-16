Return-Path: <linux-arm-msm+bounces-89437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A03D33582
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96A4F3024249
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE7533E373;
	Fri, 16 Jan 2026 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="e/66dDPo";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/iMo2zLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CD33D6C9;
	Fri, 16 Jan 2026 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578978; cv=none; b=hgfW2ZDl+87kTv9gqx0G2TYi34UMYpb0tZC1auNiv/yfrkvo88Z+KB0AhhNkoTgMWJEsjDsbJ9UdlcvlDf1PIFjNLPkxzEPc2kSKMgYzAZ6iFoAGEx98CT3Qz8IlVbK/gFi59Z+iDXdgQZHQPM0W3fnvwkzFgHymk29KnwtVQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578978; c=relaxed/simple;
	bh=YOrth3ejwMF527RhCiKQYXmWmKMxtZPu9VetrxbBia0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D4iZla5Yqo4Ne+dR1fjJw+R0fBvTg5puu8/2V92H+aSjXklEHzJsx7UCuAEK+3+2SFPJI4jBZ8ADAWSBIyFf+5ZtvXqfOGFS/r5Q23fk5bW5XiDyzPORTnB0R2KRVdcG3yAzvJKc/k0lJVHDQno1MjnIFCxlSY+v0/SLF2trj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=e/66dDPo; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/iMo2zLc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578903; bh=8bhPpUJP0+XolsAYuL9DQaG
	vKNiIcNmhlIWfoBXP2qY=; b=e/66dDPoRnOXSpsDbHYZjax4gMBS827iP6LgdeSIrMRBN/5trK
	L9U8B4ad2CcLaVyoqXPuHucTn6G9ncrIWnZrJPRJ/QRtdLGB1h+F1LVjLNuKWxeXT6Sdpx6/+Zn
	wyrC8dmkRDxBmVceEa1W3dav58lVFRoKVhY555s0kdFGUG7kStlQZL+HUGnCLnh/achqBZrRGnp
	MVj3duND7oeFR+jDbNCOqiWRZolMUbzYIcRJMyqx5RC5ryvXCA6zJ255KPthxU+EIRLqIMA5RRA
	iJnGQJkbtzD3YwT5RvQbjhjNOAlxK6wWSlZYYRIpigV+4NYOIIi1hEwhgixAtXe8QoA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578903; bh=8bhPpUJP0+XolsAYuL9DQaG
	vKNiIcNmhlIWfoBXP2qY=; b=/iMo2zLcFRm8u38qo78mIpY4sgdF4BxnLQhAt+EWqcLhhVWeth
	yOoUQaE09zE/XhzSo2t0mS1FKQ7JHfdfU3Dw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:44 +0100
Subject: [PATCH v2 2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct
 reserved memory ranges
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-2-4694feb70cdb@mainlining.org>
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
In-Reply-To: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=2479;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=YOrth3ejwMF527RhCiKQYXmWmKMxtZPu9VetrxbBia0=;
 b=iWNf8Oq/aQ52LkuiY4EeOU7Lo8KJ7oQF/fb71IJBxFnbjI58Wz9kXqMothfFYPw3W19yjx05u
 DUTGXiel7bQCPf126WLcU+t9hd6iGaqvCg1kW5AbaAVEzDrzVlguzlI
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

The device was crashing on high memory load because the reserved memory
ranges was wrongly defined. Correct the ranges for avoid the crashes.
Change the ramoops memory range to match with the values from the recovery
to be able to get the results from the device.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 41 ++++++++++++++++-------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index bf03226a6f85..d5e5abdb3b2f 100644
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
@@ -36,28 +42,39 @@ framebuffer0: framebuffer@5c000000 {
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
+		/* Matching with recovery values to be able to get the results. */
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


