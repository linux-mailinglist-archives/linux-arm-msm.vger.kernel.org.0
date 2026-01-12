Return-Path: <linux-arm-msm+bounces-88624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C1D1529A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E67EF30057EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644B232ED30;
	Mon, 12 Jan 2026 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DSVQGqLP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="wj8xd6Kg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1D17BB21;
	Mon, 12 Jan 2026 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248862; cv=none; b=cTVmtNYFDe4vrcx0Td6JyCnskcr1lP/5cO3HAwH2iz51K0wwx8WiWDNNBCeb2PQZ06B3RdMM38GzMLoAgaRbTRy3FD+5Sxy1Dmg4NbSdfE0JcNur1Igr8axD7/nPkzQcoflalsnrvRdLzPV6kx12e+oI3uBcOwkN362fL9bQ3CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248862; c=relaxed/simple;
	bh=vOe4bySOz5mBw/Tjo8Xn1YK1nLSRXmb+NDO2DV9YJJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYMIsKVMZ2e6nX/KMsRW3FIMW+FYI9sVlHorIUaWYs7UoKxLZ9QCLPnhzE92q3TtYRTacbyq7TQz4prZTGJKSz3x0N8YZgGDNwrMTALNmVSva/Oyg3Kf++fcDCLt8j7UDMB10HgZz3/4KGQN8NN3oko9aVixp6Re3a2A3crl8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DSVQGqLP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=wj8xd6Kg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248826; bh=OGR5LLUQwKTqpg8d03sVBc6
	jGyshRPNs9FTI1WFvlQ0=; b=DSVQGqLPuiHjfn661K0hSkaN2aaLgk+HqZj6dWO5/Nbbg4gh3S
	6EA3n3aD1FmoLl6WmPU6/OdlfrN+dNOF4G0NMGxNB9Ag/uNTGNf/mJ7GIrrLhT4Of19iEoFO5yI
	YULTBSiNyUqMK/FekqCw39ybRt1ycC6uDZqQxSYTQbZuRZY/Te0fO5HR5j5de2vrxe/U//Ue63e
	GlWHuHPym5+rdRaqKTLEeD+ufbhHsYm9tkJv0ZofRFq8jDXU0qlBWkN7K3Ozq4/itCDH2dcEKvD
	8pM0+RyfDVD3EZPLmRo5Zr8vNjKsjjJVO93LhU0DdMnvB6giHFXqNem/uX/6u1YgHAA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1768248826; bh=OGR5LLUQwKTqpg8d03sVBc6
	jGyshRPNs9FTI1WFvlQ0=; b=wj8xd6KgGS0uK04eHYh5LoxJ0uafsKGphOzOjgT8btRCafetYB
	N4u5l76j+ScTWvcxGct0fRBaXpOTN0DvebDg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Mon, 12 Jan 2026 21:13:28 +0100
Subject: [PATCH 5/6] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-xiaomi-willow-v1-5-8e4476897638@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=707;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=vOe4bySOz5mBw/Tjo8Xn1YK1nLSRXmb+NDO2DV9YJJM=;
 b=wTHFbxKglAYYba8AZhoz5jxdCTBhU0zkVYvmlQRhM+j9IrmJHSmO8RZWrpz4zgFJgcAJWwCTi
 BXp8FA7d58OAZu/s8R8Kewl3bgkzYomapWr2GwuB8Ez40A+wcx7y6Zd
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Document the Xiaomi Redmi Note 8 (willow).

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..f76cc92d5530 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -966,6 +966,7 @@ properties:
               - sony,pdx201
               - xiaomi,ginkgo
               - xiaomi,laurel-sprout
+              - xiaomi,willow
           - const: qcom,sm6125
 
       - items:

-- 
2.52.0


