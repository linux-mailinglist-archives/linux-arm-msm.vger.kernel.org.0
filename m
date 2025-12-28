Return-Path: <linux-arm-msm+bounces-86722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA0CE511B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1267A3009248
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60752D2388;
	Sun, 28 Dec 2025 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="I/bjsI5O";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kMbqdeCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050512C031E;
	Sun, 28 Dec 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766931860; cv=none; b=rO0zRdvzzhrgVTqVS+IcMcILjjpCRk/cqI2mwuq71fShZNwiYC8A/mOBIsgD10FD5O533ZV51/ZPnxNcQ231GiW1hiMaHgxAvJWmAe5EqM0I8XRl+5+z2wvRFEmGXJ1y68rf+SbcVrtkpRhzqm1g6LID+l2wQGrhFughdR27mwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766931860; c=relaxed/simple;
	bh=M9Av+yjLZ7pRMVn/OjIyDiMAf0d1eFuTqd14PXMK+AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pf1kiF8jarCSYbI6f4jkpME5aVyR9peoKVhT9p5R3BMj3igV4DLHn9xWgLS+woodrJx8y3WAgIkj/X5F7MV6CdR1MERf//KMEcluhzRn1xaPKiR75ku5Yt6AxoFwC/9qwgJ1elNVRI+CZbyWEu1rOdvGSMXCzAMduwdoIAMK/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=I/bjsI5O; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kMbqdeCH; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931723; bh=esCGISylhA6jXa8xzwVzjRV
	QZSfwggPbdM3Bf8BPhJc=; b=I/bjsI5OnyY1Vh0utbrXJS6JKGZawlipF0xU1U0p+OZMjrTHxn
	oCG3IKR1kiAvIOBm7TFgKoDLZsRFngQ0OLub6lRcqmO4BW9tQBXrAzCMvo4BGVMOgeTwUewPrgc
	Ce9uPIFltSW7JVzYusHVg23VomVmzGEGlouV9fJoziMx/s/NZ+Evew+h+xNATKS6Vhb5KjeAgWK
	mJ+B6lC9wQauOmj3Mz6l5Eb5KUTl9aSAWHzdxkLZcYZHcOLS8vpTaS/jXZrt/fDoF/ZhWAh55AD
	MQXQSoT2LXis1xAcW5LhRGBd5xp3376wsGF2uYYM16OrwHco5PyP0rUcgTRbIvIaJig==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1766931723; bh=esCGISylhA6jXa8xzwVzjRV
	QZSfwggPbdM3Bf8BPhJc=; b=kMbqdeCHr3hDlBHqSGiR7evBnXe9UAzCyQNJhT7UDArTWBS569
	yaA9NamPmeBRyk9Sp1I6bDALcA1vqa6mnUAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 28 Dec 2025 15:21:57 +0100
Subject: [PATCH 7/8] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251228-mss-v1-7-aeb36b1f7a3f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766931719; l=865;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=M9Av+yjLZ7pRMVn/OjIyDiMAf0d1eFuTqd14PXMK+AY=;
 b=/q0w13cp33ZYAKPGJ8TgZr+VEPTyPQiS11+uyIb40G6WJ5aTIQZ85VVsTs2Cbr20pzr5MX91e
 44i1Lw1Jf8bAvUpuAS9R1QvImw58PO0hfD/59XPwUhhb+vAbFJ93OXg
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8940 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 093231abf44b..e8e5030f60be 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
           - qcom,msm8937-mss-pil
+          - qcom,msm8940-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 

-- 
2.52.0


