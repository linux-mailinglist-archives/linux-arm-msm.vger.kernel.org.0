Return-Path: <linux-arm-msm+bounces-89433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB7D3355E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7324C3008704
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB3433D6F2;
	Fri, 16 Jan 2026 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mXqsJiHy";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6YZwMJxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF533BBC8;
	Fri, 16 Jan 2026 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578919; cv=none; b=cCBaan5g4ShsnvIN1/NU6v2CvqcEhjcNQBGwreYu2QWEDas/tvwVpyvveqACQK8hQcuaSgpaXnH2D1al4D84PMglzxdcPQC3EPCO4mla5KodS67IJ9A6wdZIwfrUzRvTxpWwovSJeHhMhWYmLD7AJUfBf2c8zJBcn3QFwcTR1t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578919; c=relaxed/simple;
	bh=KmSGZAPOA/EmLr4+XusNqLJfnRxNxjmUq0BkrQWKJl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhlZAWHG/22MGp+M/k917MOyoIeMCxbzpIhEc9RCatzogGBQ25Wm4B6U7qcr29xIIQp0ZmYF+FaaHOrXL43QG7pqzRZa0IjI1qjbskBkQuaTnKmioCWE8OXe06I2eAptHymDNdOzvTzTGVDuNR0WbNHlHzyBOlDAEZW3bD19iu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mXqsJiHy; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6YZwMJxC; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578902; bh=Mve4+ZS70I8fnOLJmWTrmWC
	2UftHU3YU4RPNj6SKMZo=; b=mXqsJiHyuKYeJh905T2y2duBH4FQBK06li2B6ViKuX7meXoHjb
	Z4HxQPPIDvqKFEREDPq/S2ievgNSZDM2v8D9dKjRFqU8YfhJr39e67DrAq4JPC8FhZ77YBTQIvU
	ZBQdZEN/ghI9CJhT5gU0BufAojJ6Th8oj2mx1j29t4SszJmmCAJQokDIgLjXMAWtzl8sinThRYw
	gPYUjTSlxmo0Lj7+VN/wrSm56B4SqeORO2rXC8kNzrL7D4Qi0J+XoLA2Tx5hT8rIVznq/GDQS4u
	Zn+ZcujkHc8cSMoBlwuJjiaviY1SGW8lCuI24eKsYGbv5V6g22UsA6EOOwH2/vEGnjw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768578902; bh=Mve4+ZS70I8fnOLJmWTrmWC
	2UftHU3YU4RPNj6SKMZo=; b=6YZwMJxCDPZQYlKJyuQ2dQqt9SC4gFhTYhzEJ5Jl2sWPyNeW9J
	7PiUgcuyE0Lri1GHWat0TewN35a4AwVfoKCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 16 Jan 2026 16:54:43 +0100
Subject: [PATCH v2 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove
 board-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260116-xiaomi-willow-v2-1-4694feb70cdb@mainlining.org>
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
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768578900; l=996;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=KmSGZAPOA/EmLr4+XusNqLJfnRxNxjmUq0BkrQWKJl8=;
 b=zgZ1vqo8W5dM2rSFXbhSuMApV9aie5HRCKMemmJJrXXbFT4tNpfCQgwndUsPTe+EmdjhaimA3
 ClNiz8ljpvoBxwGohsvv4LEZIoB/jgtqJmaquaDzxY+N+MR06zeJ1hu
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Remove board-id it is not necessary for the bootloader.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
index 6b68e391cf3e..bf03226a6f85 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -18,9 +18,7 @@ / {
 	compatible = "xiaomi,ginkgo", "qcom,sm6125";
 	chassis-type = "handset";
 
-	/* required for bootloader to select correct board */
 	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
-	qcom,board-id = <22 0>;
 
 	chosen {
 		#address-cells = <2>;

-- 
2.52.0


