Return-Path: <linux-arm-msm+bounces-71945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD30B42BF0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 23:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49B341B2445A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 21:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC0C2EB5DE;
	Wed,  3 Sep 2025 21:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="anAcspD2";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pqNva9nI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC252E03FF;
	Wed,  3 Sep 2025 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756934996; cv=none; b=WuarSM5J00q4/ftlkbyuXFX36XFSNoODOPre914qfxVR2r3UMYe0VAYpYYnvNW7Y3JPVzuUrCkGK7vLrFRnDMUWnlwsUCSjX3weWZCiXcKivqTLgZdNdJj7RYqiay46OsATQgTNASqD6vYoo3g6JM4B1qezFliXVaZSEiqhCzJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756934996; c=relaxed/simple;
	bh=Pm72KJkyOx20dJkg1/oHOJ+b8z/476MTARgoZvT6Kko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WqWCAEV5X/8g4euaAIO3Ey/qQPlJnmSwsoOL1MFtjVblbcqoOo4z/Qh1uwhpJ4BkimtpO1O/LyL3SwOOl9/hVqQLErv1gPwPYZyva+PcL59R8NxzXw9eM28ON08xHDCWyfL1De+JNUi9hXmxX58EDJ/5J3STO6LvCYG53Y7Ch20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=anAcspD2; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pqNva9nI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756934856; bh=KWG1lKRUoYbRab1ldXHp7em
	ZA3hhQoPTXfqyJ/dofyE=; b=anAcspD2TR1NSE4GORNByPsFoFmmZh9N4ZRwfas5cB2Fs+6s18
	utAbAfhbhOkoGcq3F5QrY4KhKeAITnsDfeXFMkOWqLGPFZ9i+ida1kidConVIbhZxiR6wrpo0zl
	Q9d2jMGe0VBoXE0yCxgMN0ScP79GuGuubSoysPHiic7LKx1qqBIl9pU100v6J4n+4dBYLcaqVSo
	4eGYtVpkJKwPud1F00n07K89X4EcSw/C1XMi0veqWx+hrGg/8MyCFumRGC9jxZxpgvQ0da5Vbdq
	9bWE7VywZA/Z9wt+Nf7Tanjx8SMGntoGMcxFzZ3h0HdUDgZAcqDXwnGUoy0hA+OeqGw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756934856; bh=KWG1lKRUoYbRab1ldXHp7em
	ZA3hhQoPTXfqyJ/dofyE=; b=pqNva9nIU9A+d2o7h6gM74nzifXEx6oZ2iZBDwwUfPl99wCDFM
	LQFTpXSMeeIK1VeLCiFaMJ1ID/9fIt89wiBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 03 Sep 2025 23:27:33 +0200
Subject: [PATCH v2] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-daisy-sd-fix-v2-1-e08c50f3be57@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAMSyuGgC/3WMQQ7CIBAAv9Ls2TVAVdCT/zA9YFnpJgoNGGLT8
 Hexd48zycwKmRJThku3QqLCmWNooHYdjJMNnpBdY1BCHYXpBTrLecHs8MEfFFKOqj+cDCkLLZk
 TNb3tbkPjifM7pmW7F/mzf0ZFokStNJneno2+m+vLcnhy4OD3MXkYaq1fCb7Ovq0AAAA=
X-Change-ID: 20250830-daisy-sd-fix-011c23468e2a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alejandro Tafalla <atafalla@dnyon.com>, 
 Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756934856; l=1448;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Pm72KJkyOx20dJkg1/oHOJ+b8z/476MTARgoZvT6Kko=;
 b=spjJ8/o1wszYQYfWdN0OlEkMr5Iy/iURdUV18eYwxwctOkz4dAEUbdslorYf1a5057gPB6ymH
 ibY4rwWRiHnD1EiYlJi//WON2mkrxq8vVZg/6UNcXGtxc8JN1FVqqaM
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

SD detection was not working because cd-gpios flag
was wrongly configured, according to downstream sources
device is using GPIO_ACTIVE_HIGH.
Fix SD detection with change cd-gpios from GPIO_ACTIVE_LOW
to GPIO_ACTIVE_HIGH.

Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Changes in v2:
- Reword the commit.
- Link to v1: https://lore.kernel.org/r/20250830-daisy-sd-fix-v1-1-727e83a987b8@mainlining.org
---
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
index 336b916729e4721b5ba8f4f7e368d0d838aa54ab..ddd7af616794290aa1f06228a95cfa1d42b006e6 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts
@@ -296,7 +296,7 @@ &sdhc_2 {
 	vmmc-supply = <&pm8953_l11>;
 	vqmmc-supply = <&pm8953_l12>;
 
-	cd-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
 
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;

---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250830-daisy-sd-fix-011c23468e2a

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


