Return-Path: <linux-arm-msm+bounces-54797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA93A9427A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 930983BA733
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9352B1C57B2;
	Sat, 19 Apr 2025 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1ihWmPQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB115CDF1;
	Sat, 19 Apr 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053458; cv=none; b=QvGQpXq54sS9/wkenX3QxF1bv4qjL/NAcC8OKq3D6MDZG+GVIlN+6v8Iy9gzUjKOF0iiB+zGCgYko1vfBkz+enEErl87a56Eyxo1Jpltj8dGGrwKT7Vi0Qqyoc/Zt0kDJhr5fER2p7K/IdKeSW2/JYudeJAwGQDw6LUP/pG7Z+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053458; c=relaxed/simple;
	bh=cLncCasxN85hsjkgk0f1dJuXRJigNa4pQLbkifRGfus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8I+oQd938P818SN395C/NJLpd60PyNTmFHxdafq7r0gkhgpr19yBohgDdmBNLrrUWxflxXjpyd57l2o4J/6YokQ6lkOcCTlH57X2SFsGHkc4EpSnVMHLU8PRkv3Qyg9qDoLDF687wdWJGMafyAHyanQLwZcaifZBEjekYFx4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1ihWmPQF; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053455; bh=cLncCasxN85hsjkgk0f1dJuXRJigNa4pQLbkifRGfus=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1ihWmPQFXWLPz5bkuKFi+prSvUEo1QAYF34nd1GuBxwt2z8XgT14EedLZ3R2+2iJ2
	 hCYNoYSpK9YtD/SYP9AJiKCWPB0Sshk1urufcBPv5wW2tW/68l2naXdFRD1+5DK0la
	 R/Z10ZYXHHr3Kczru0uq46sZH+IJrUjiAuANjz94=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:03:57 +0200
Subject: [PATCH 1/3] ARM: dts: qcom: msm8974-oneplus-bacon: Add alias for
 mmc0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-msm8974-mmc-alias-v1-1-82aa131224b6@lucaweiss.eu>
References: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
In-Reply-To: <20250419-msm8974-mmc-alias-v1-0-82aa131224b6@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=715; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=cLncCasxN85hsjkgk0f1dJuXRJigNa4pQLbkifRGfus=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2cJncw2krakzAkZCU/SdLwQRFoZcPVg9mZmN
 g06qDaHvDiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANnCQAKCRBy2EO4nU3X
 VjisEADUnYQ2Ryu3cGyNH14cGhCLzEMwv3Nd7aHxYRR1rqopUQCeUxp3bB0OIIV5DZE7pyxTFYC
 gszh6EKlo1A7lgN+BKCQW23RuJHjt/aJxjsuC20GyrNxGy8eRNhQpi1klSc+680Hf9nrE+/DDVb
 MTDrqULAXKVN641Vsbw+OwVzzprT0rH6KghWFeOWRb69v/SgdZAP9kdPY/OtXrMaqjvdnD/4ToV
 ZO+uKgCZwfY8pKiex3zzfUbo1gNEJV2PhTgR0+vY1aprnAuTPmoyvuFTeGH8Ot1+Nn23KHQ09JI
 uHudF7OEA8/zoC1PnDQBlrDQc/7oNdUB9gQBZXMb/0iO15NIA8W8tUc5jA6tGls2ZxbF9wgOCub
 ZopLkLZB+K8udgEEZ5ErastM+2JIoTVxncGH6XwHe/U+QYnZZHhpNNV29Ol2tJswKe3Xv6RhkON
 3ZoRvUD4s5U4fJYsuasa2hOgewPHa1j/7sCM3INr/u46e2xRQg4Aifr+15rX72VLd6CvD9F3JyA
 rNuZzSr3h5I7fuQVEqtHdoF2telvr78hiwgrIV+zcJFX9gU1Gant/VsfuvYwtPM89pTDZbMA/ff
 zkW9n/h2TkVVNxcRMAazlm0LTAczIwuwA0xeErCji03vQ/WvW3Eib37WjGP4X+3vedgiV1aIFIr
 G5KPqyZO+/rlktQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add an alias for the internal storage so it always becomes mmcblk0.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 4c8edadea0ac63db668dbd666fbb8d92e23232b7..88ff6535477bffefe475cc5fe927b3cc5d223084 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -13,6 +13,7 @@ / {
 	qcom,board-id = <8 0>;
 
 	aliases {
+		mmc0 = &sdhc_1;
 		serial0 = &blsp1_uart2;
 	};
 

-- 
2.49.0


