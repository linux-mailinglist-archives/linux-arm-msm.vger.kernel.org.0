Return-Path: <linux-arm-msm+bounces-84675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC6CAD310
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09FDA3013EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F801313E20;
	Mon,  8 Dec 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="SICKTMxO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CEE31355C;
	Mon,  8 Dec 2025 12:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197680; cv=none; b=MP/WV2Sz/Gv9wKhVagrBueK/wNkYUMksD94nsn04AcapITaWWcWk1y5oNcOLcBWTTp9Ke0arYZqM82qnNs5smsyuWuB3is2w/2h1stmSHwCbMFH6jtE9cttXUH6f27L/Hpye4wvvwSfVHLdadJoz/7xyCUTqPIJrFxWgADsbJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197680; c=relaxed/simple;
	bh=ATObcVA277EPtE5hC8WOkwhqMi5GiWWPtSeS9U75Oyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jBRlBDwRyD7SYN31HLy6fxh/GO//RgYkTTYYKJ+hNa8yf0cw4EiMu8WTgn5QojgCi5h6y2wgMyLMU4UR+bKJrHq3o/6NPECEg28Y4pLpTTmr3ysgK/8GNpZwjVszg7XNicUC/0proT8DPGnaKxPSkbTOBAeP2cYWbexNY1XqXSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=SICKTMxO; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1765197668; bh=ATObcVA277EPtE5hC8WOkwhqMi5GiWWPtSeS9U75Oyg=;
	h=From:Date:Subject:To:Cc;
	b=SICKTMxOM9i1jM92C1DB+bXePp9O0cyhXb5miqgdVnJ9Az73x5ghgAYvx2JZ5XZOd
	 7wGXHPyTL09I07PapNiMlO2Ji0D89H0mOdWLjgEtI5dmENp+BZV1mlmyld0VrKZPmt
	 zKuZRgIs9AD941vFQ5qXeu+HW2UDMchyCc80fxxY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Mon, 08 Dec 2025 21:41:02 +0900
Subject: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Update model property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-msm8974-hammerhead-model-v1-1-88975f30cbaa@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAF3HNmkC/x3MQQqDMBBG4avIrDuQxJZqr1JcDOZPM+BoSaAUx
 LsbXH6L93aqKIpKr26ngp9W3dYGf+tozrJ+wBqbKbjw8MENbNWG8XnnLGYoGRLZtoiFk/Qyi09
 RHKjl34Kk/2v9no7jBOVjBCBqAAAA
X-Change-ID: 20251208-msm8974-hammerhead-model-fa3aca1fda0e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jens Reidel <adrian@mainlining.org>, 
 Bhushan Shah <bshah@kde.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3

Many years have passed (more than 9 actually) since the introduction of
the Nexus 5 dts to Linux and it's high time to update the model property
to be a proper model name and thereby bringing it to the standards of
the 2020s.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
The phone was manufactured by LG and sold by Google. Some sources call
it LG Nexus 5, some Google Nexus 5. I think it was mostly marketed as
just Nexus 5, but consensus in upstream dts seems to be to use the
manufacturer, see Nexus 5X, Nexus 6P, Nexus 4.

Arguments could also easily be made to change the compatible to
"lg,hammerhead" and rename the dts, since lge (LG Electronics) is not
even documented in vendor-prefixes and doesn't really appear anywhere
else in the kernel and lg, (for LG Corporation, the parent of LG
Electronics from what I can tell) is used. But that's more invasive so
I'm leaving this out in favor of this simple patch.
---
 arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
index b3127f0383cf..8f4a1fda9276 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
@@ -7,7 +7,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
-	model = "LGE MSM 8974 HAMMERHEAD";
+	model = "LG Nexus 5";
 	compatible = "lge,hammerhead", "qcom,msm8974";
 	chassis-type = "handset";
 

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251208-msm8974-hammerhead-model-fa3aca1fda0e

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


