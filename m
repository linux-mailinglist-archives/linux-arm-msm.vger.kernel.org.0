Return-Path: <linux-arm-msm+bounces-71293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9524DB3CFBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67365203B68
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C33A258EC9;
	Sat, 30 Aug 2025 22:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="fV2sXMRV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="00kIBMnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226D325485F;
	Sat, 30 Aug 2025 22:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756591322; cv=none; b=PMLPy2HrUsOVvVSNq7KIawkvIPUY+tHcdwpPE+oEQlg05Ul4HUmVn31lQnQruspx0WtoGEcOrne6k8q3t3YtHrUa1hN+QINff+WJ+rbqOcdGqxaq4aCjmRuIekEuXq+jdFNUyTJ1I+RkOBVHM4sPlbtUdnMxr4l+CYbQZRL9iZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756591322; c=relaxed/simple;
	bh=AHa26N+ECuxR7wkqoQN0auwkFX6EN6MLSdnn4d//iJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cbSefYo6vFuewgeSsvRS+F7I/fF3ofD067PteYlzbTU9hgTQgzmU2Z33rWV8yijJNC7mS24uvzz2U4tWC5JlxSALMjwSCy/TNnZR/2tltzOyANu9+MioV5umXgYLIxANI27GPeKy7v8aw5IlVx39jXn1josq9J4TtF0IeRfvfw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=fV2sXMRV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=00kIBMnu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756591177; bh=GvveRHU49l0faAS0sZFcm/m
	3jP4qqs1a5B1KgL8Iw4c=; b=fV2sXMRV0YMPSJ56hDWW4iyriOUM1w6CeHnpeQj68qZdVhBu97
	v5s2dvgrmx36jYrSCte3NlSph7l+0AfdYw7pTwKjyOcKDtzkG+iS8JcQu/ZsuvZdxKar7eaw4pU
	wlhA/Ph/Sy1p/HsqwjOOHnzoP/4V8iG0gNTU15HqmInvw9/fVv7PwXPmzIJ4o98u2LipDlYonGo
	AiRxJUe65/CUAo367o67WohTUzNAJorGuZ/2RnA+Nmt4wuD773TjdEAj8XMAkBpCIQg6r8sv+Ob
	kBPLi31hUDPjTAp3bINUX7H+vYSxVnED01M+HHD7Z46sdPrT8YCplh9dyZEMr8s3ztw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756591177; bh=GvveRHU49l0faAS0sZFcm/m
	3jP4qqs1a5B1KgL8Iw4c=; b=00kIBMnu+VNdOEcfQV7VDdLWqS9mmbM01BOcFsmPeOEzh7pKyj
	oxoGFziDLIHsz2mLIiawbdriJrVnt9xGyUCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 30 Aug 2025 23:59:30 +0200
Subject: [PATCH] arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250830-daisy-sd-fix-v1-1-727e83a987b8@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAEF0s2gC/x2MywqAIBAAfyX23IKPCulXooPoVnuxcCEK8d+Tj
 jMwU0AoMwnMXYFMNwufqYHuOwiHTzshx8ZglBmVswqjZ3lRIm78oNI6GDtMjoyHllyZmv53y1r
 rB5MVas1eAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756591176; l=1207;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=AHa26N+ECuxR7wkqoQN0auwkFX6EN6MLSdnn4d//iJk=;
 b=hYymOGdpET4sDF4O/TBng1sNfD4hmDXWkNhSfXixkzDZnmfVCvhICLlu805lc/Ej29HoO9xgx
 vL7flKbB3w2Bx8qWRU5hYHbcCWviP6HJ8B2CxST7K8GNjSp6a/SyLWi
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Correct cd-gpios in xiaomi-daisy according to downstream sources
it is using GPIO_ACTIVE_HIGH instead of GPIO_ACTIVE_LOW.

Fixes: 38d779c26395 ("arm64: dts: qcom: msm8953: Add device tree for Xiaomi Mi A2 Lite")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
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
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-daisy-sd-fix-011c23468e2a

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


