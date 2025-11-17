Return-Path: <linux-arm-msm+bounces-82143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3790CC657D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 012C64F6BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B9F32A3C6;
	Mon, 17 Nov 2025 17:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="o4ybw177";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="awGYAf4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E3324B24;
	Mon, 17 Nov 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399883; cv=none; b=ahfmn7lHoVG65qRDxBkoRkYg0Ljrvoo2EWIHWCXJWr3hqLpXLtv5PBIA81u48xKJKmt7aDJ2Ivko0+jdR4WAxfns+PAcTa+AUDHe173eQP/0FiqA+kWIR9rKp15I/gArByT878S8CoTsFNZ6h5JOWL+HmTJ58Wja/4YO1c3ZZsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399883; c=relaxed/simple;
	bh=rxfig/ONBTPdbAgfRc9CP91PYOjXuMnr/bUGii65pvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iv+Kuc9yWCdE5vJEvsE1lIHorNhbVYmvlvysINt/hPEk6oOD2wAThQEpiPnoa2Pp+SHX6RoTw2I9TRQGjaIHd2dZE7j9T2J+R2IRRlKI6ynLQIK3X29YR7++p3DWWWvXvZWAxoAsnTY9bJPgEbemp54AU7ycAZf2/yj9nagX5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=o4ybw177; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=awGYAf4q; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399877; bh=aCBI0jo035ZpoTolTkYT///
	C1R8Q3uPGYK/zcmAOhoY=; b=o4ybw177iQrb5QlwAIgbCqbtQS5ZTFhDXikHKdJLSy9MdKyr6V
	8WBHd1KZ6eYNiFVoFTbmZmOfivCdh8Hl7+Toqp/med59zE5iaOxJ7yzF6RQvT+cWXSgWQrWe86b
	tjXj7PwTKnOyN/s9SO/bHZwRK+gaaCoCBsLnG2h1Qpclv369WShvDaVwwWPr/QAWgJ1Dk8PO9Sg
	pjXUwtuPK8LwgczWV8ucUFNrjxrX/vpxymvnrv6FJUyw42bWF+Gi1yeqD/hsOU42N3tpn4coDk0
	TtRvg/a7/RlmvDfsQT96gdgeF5AseMjmgk6rOpQLEcq/HHTaz7IpZ7kt9z9RtrhpoCA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1763399877; bh=aCBI0jo035ZpoTolTkYT///
	C1R8Q3uPGYK/zcmAOhoY=; b=awGYAf4qyEKCT4ig9Y9cqFfJL92WAwju0V3Kf/aUJqROk7GUzm
	W9zGqyycra7tGCEvUSdHpYWKMxV4eIxIQ1AA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 17 Nov 2025 18:17:54 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251117-mdss-resets-msm8917-msm8937-v2-3-a7e9bbdaac96@mainlining.org>
References: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
In-Reply-To: <20251117-mdss-resets-msm8917-msm8937-v2-0-a7e9bbdaac96@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763399874; l=748;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rxfig/ONBTPdbAgfRc9CP91PYOjXuMnr/bUGii65pvM=;
 b=KVvEBSaxq9S5xYhvki/XJFItq0GSRK+tmnSMFroMIRDdkwkNbPUoE3NhpsLARGBKxE619qL1a
 GXu574MhMb+AB2Q9eeH+4A+R00amiLA2Y1IOfMzQTKOB9blE4gJEduY
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add reset for display subsystem.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 8a642fce2e40..6251189b8e6d 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -996,7 +996,7 @@ mdss: display-subsystem@1a00000 {
 			clock-names = "iface",
 				      "bus",
 				      "vsync";
-
+			resets = <&gcc GCC_MDSS_BCR>;
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-controller;

-- 
2.51.2


