Return-Path: <linux-arm-msm+bounces-86720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DF5CE513B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 858AC3021E79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9050B2D061B;
	Sun, 28 Dec 2025 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="tGB/VOGj";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SohqK+Gw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB127FB2E;
	Sun, 28 Dec 2025 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931859; cv=none; b=jTcOxvnfA/VWS1vjwnXehwhLQpCKVJEZ+9gddGyVmtqkKeE0z4IFq+KL6NxcVRel+hQcag02h1WW3gWg9s9SXLOjveRmHywEFcPfjXRRVb5NZmWMMXEU8LICpcq46p6xaWYe4qnd5cQGbNmBmfLigFSkayMODVYSCzD3DcWuNAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931859; c=relaxed/simple;
	bh=8AE1/XdiJgcw2rBcj4EoMzcZNVlJMSjtECoTfnGR2YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syU76IGyd5RIAgiWKOeyLwLd39qPGlEqu3YUb0N8linuUhu58ykq7m/oCgsdQNAQNEseiymEfaRwURgVF29FWhUsdNQp/iHf9VoKMRf+Oy0TyDX36bC39qTQCsmul0ODdCowRKyJUevkgivejHzaS/At33IWGzT3EK7MaU6jtTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=tGB/VOGj; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SohqK+Gw; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931721; bh=XxOWcvYd101lplLX+v+adOL
	4Tanl7/8wqVYPgfB12+4=; b=tGB/VOGj8c6aiyxrz/hQ7/3EJc5GprZvZCLVbOfpilC75RAGjo
	oK6e4+38HGTnN4jfDlZ6QGmwSAoJKzGXb0/IVnBHQPqHsqh2g1YNy4EH2TTN8vDZ1oCYBG9AWu3
	JCDkTrmkdNi5lZ9UP3jm9YTtk1Jft4DzdHfrMwB23wVnTiKXCuoQalykuHBe0wcanR4fdTzw6OG
	0uWi+eHWKoSoGJQHcmVuwdjZuhNCZbOYBj4vCH3l+qbztN6sVlCnvLH7kd9W6/AAlH0/hC4Xe9m
	KN++MfU69bXvmCs+W0p60jYOQHRm6W7R0uuAQZfn/wOcOiWOwUYGHtzfYvJu4/Wmm1w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931721; bh=XxOWcvYd101lplLX+v+adOL
	4Tanl7/8wqVYPgfB12+4=; b=SohqK+GwvREv5sMHEgKqojMclFIPoZdYBX/FikY4bKOygrpaWQ
	eW+8E+XAPw0NMK08jT2fTpnlsMDm6xC8KhDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:53 +0100
Subject: [PATCH 3/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-3-aeb36b1f7a3f@mainlining.org>
References: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
In-Reply-To: <20251228-mss-v1-0-aeb36b1f7a3f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=897;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=8AE1/XdiJgcw2rBcj4EoMzcZNVlJMSjtECoTfnGR2YE=;
 b=a8FWCaI4HbiEFwv6rBwAP+FmllzkeQ2jgJqz/yRheX5Wc8sG3Mav7TUY17YOv0spzshfaLu7B
 50hy742OgCzCI+4Bhb2fgoZulZ5n/nkWKzfKPBOVX/KUDQ06+bAKLnm
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8917 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index b59d6fe091a5..7ba813774597 100644
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

-- 
2.52.0


