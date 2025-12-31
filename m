Return-Path: <linux-arm-msm+bounces-87128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D4CEC412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49F9304B049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C94528FA91;
	Wed, 31 Dec 2025 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KtghSlVC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="6hD2NKxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B4028688E;
	Wed, 31 Dec 2025 16:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198622; cv=none; b=YQVtGNSy+1bZoeJFiaHghQaTAXE6bHvFk7NlHD5hmXTkloje1YToZn9kaG0DYa7gdFLd2GxG7Rb3iUe7R18Og+mgNwM7jly6y6Iwx3JamsMobiz08shiyGfAtOr/1tIZWKWIYZf+8ICf5VpVdojOVDR9nsjxSXCNN0KfDx2q52g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198622; c=relaxed/simple;
	bh=fhONiEfWH8zhg2s1jSG6LiT9QQ2bEtT2mbMM7izw0hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9mOoRfqpbHvL2Avcd0Vu8EPEYpkYloDpq/KW+hla1T3KWrztzBbpGaNWRbMVmWUj8ELX6tIrfQLmIicG3iQ0nf3h+Zu9nt4dgrG6UMVZEnb9+ljc11qbCAYYC7yDRpvODx3gDdIz7aiDEes9zieDksLvqBcuzZWG3LtuCzI3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KtghSlVC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=6hD2NKxA; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198616; bh=YRcof6xDYaHvRV4UTtjARYM
	lAay2JAmmMme5AWxMDs4=; b=KtghSlVCTLe0zT7/9qiqRy6iMqH1N4E0FiqCS7YcGzh9aSTHGA
	eM9Vh5UoIwj/IYorAvZmrpqkDARlVSGxb0uNGHx9zAoKmMuiZXWc8Dm0qW1C4gNXSLDjLnzgI+Z
	Zd5aFHHn9tjbt/aU8aQ4cSuBrIjQqz0bnO4WFWCBowy02CrufWRRJdJq+9vuBMko3dyjCNRry24
	1/hvqqUCJAfrGFRX8VxLwMrQAeUnsPRAy74g+fxcxDRmnP/2GdUlP0ZmFLy/j+Ig1GZ683QsGqj
	oA/0FHxXrWIdRhZOhEP5pxAYy4ojh0BpEJvSGF3lLEHkcvEn8IshCd4nTLDjXnMsg6g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198616; bh=YRcof6xDYaHvRV4UTtjARYM
	lAay2JAmmMme5AWxMDs4=; b=6hD2NKxANSbe2T2CaNhSqMLBKXIMtxkXZmb1bf1Om9K9O4Y5Rx
	zINX30s9Ejb0WQA7jYsivO0wU7xwLUZUs6Bg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:14 +0100
Subject: [PATCH v3 4/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-4-f80e8fade9ec@mainlining.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
In-Reply-To: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=1647;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fhONiEfWH8zhg2s1jSG6LiT9QQ2bEtT2mbMM7izw0hQ=;
 b=Lli8sz9nPWSb7wt+TiwXrrjh+uYNvyiV8XuoERz18w4rnZPeBXjdezbOHMcqWpi0AR9qR5DqV
 apV5AxMBAGbBn1Pz4IIVAAFEhnhECqVSo8khbTzd2+bbfJqz3Qbh7mq
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8917 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 4e0d2fe0e46c..74202dd34703 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
+          - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
@@ -90,7 +91,7 @@ properties:
     description: PLL proxy supply (control handed over after startup)
 
   mss-supply:
-    description: MSS power domain supply (only valid for qcom,msm8974-mss-pil)
+    description: MSS power domain supply
 
   resets:
     items:
@@ -230,6 +231,7 @@ allOf:
               - qcom,mdm9607-mss-pil
               - qcom,msm8909-mss-pil
               - qcom,msm8916-mss-pil
+              - qcom,msm8917-mss-pil
     then:
       properties:
         power-domains:
@@ -273,6 +275,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8926-mss-pil
+              - qcom,msm8917-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


