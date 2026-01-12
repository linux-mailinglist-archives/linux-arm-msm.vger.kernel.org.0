Return-Path: <linux-arm-msm+bounces-88625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE33D1529D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D49A230074A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7604832ED27;
	Mon, 12 Jan 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lZIqtThX";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8hfgdxjF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531C33120A;
	Mon, 12 Jan 2026 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248868; cv=none; b=J/m8Ep++B5RNmj5y6lQORMhfDuyH430y5E0my7M7/0H2geAnt7TXEgzqRFHDtSZDLOT5oSUbqcMQKI3MRvNDfySBE4t8GB18jfW+hUETaLeQgrMk+kotLgVq7gKLPcIuw9Ii1oZEbSgqJBy58zPsPP5Wcj/BLudoIgktzE+h7vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248868; c=relaxed/simple;
	bh=L0qxiwQA73ZiBf0W7LRfkmczBF6MCQDHTZlQLG+DdMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgSYWY/V4SNZ8FNFfJ8/GkNBn3GUAxdYXAJ2H8KoLD9zwwr3atscuxqS50nBnMe1e0z5NRK9JM1/uPVyniMHCU9Lwkrt/fkqufw83p2ANjZMwuZ6oXz0pfT76ukfXLfhVnH5NO3t4FVlLW1qW7N+snbfyus+IOLG8sUOfSN9Qx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lZIqtThX; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8hfgdxjF; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248821; bh=mgW7h96soV8sHZ3tOn5YBjo
	9nLthCAd8VJNiqrLK58I=; b=lZIqtThXidAgjuJ9e6Id/36mQYt3uiFohjA7v5aRdJ3HO8PV2w
	cRwit3t+wAL4Y5SGieShCm5lj0QD242BY9KiLwHgmhx8on8Vi2jeqPwSzTjR3OpQAvUUZdmDpwW
	bYjn8rENJOzLtEZOjxATbMbcxOTIYp8k+tZaCHM30qZ/UFZwNuggvqPPoYEieDew+lBrMbqrtpC
	vG2MdE8qdzoMrmX7WYtr/gIFkASNtc7x/4vIt/4wlLXbgzR2xHmevlOLKv7DlbHt/SLYfIhoiiC
	WRnDZY97KGbkj/6Nph4JA18sDfvxFtWVqXOS/PKTjQQU6Elf9ELW7EG6zwyJL6FawWg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248821; bh=mgW7h96soV8sHZ3tOn5YBjo
	9nLthCAd8VJNiqrLK58I=; b=8hfgdxjF1gZw+hL+f3177ODTOmepRNz9IgO2BFE59itNJCiTSf
	j5gniCXFg5JZL7t91acLfx7Kg32OZH5xrnCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 12 Jan 2026 21:13:26 +0100
Subject: [PATCH 3/6] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-xiaomi-willow-v1-3-8e4476897638@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=1046;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=L0qxiwQA73ZiBf0W7LRfkmczBF6MCQDHTZlQLG+DdMU=;
 b=msUBAn98RLimUdKFKBUcSorzVDJLA/0ESnUqJO5noQv/l0Bv5917dSdb5AfpcjbLZV3zKKXKw
 2PHKtlDCU1+CfUrNtTA481t2PxaN5x27SSZZMUpgRIGMHhBSchfuu3T
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

GPIO pin 102 is related to DisplayPort what is not supported
by this device and it is also disabled at downstream,
remove the unnecessary extcon-usb node.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 4c548cb5f253..666daf4a9fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -80,11 +80,6 @@ ramoops@61600000 {
 		};
 	};
 
-	extcon_usb: extcon-usb {
-		compatible = "linux,extcon-usb-gpio";
-		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -307,7 +302,3 @@ &tlmm {
 &usb3 {
 	status = "okay";
 };
-
-&usb3_dwc3 {
-	extcon = <&extcon_usb>;
-};

-- 
2.52.0


