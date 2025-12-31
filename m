Return-Path: <linux-arm-msm+bounces-87130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFACEC421
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 819CD3064C30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3B7299954;
	Wed, 31 Dec 2025 16:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YFCgnR9u";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oyKQeZFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E066288C96;
	Wed, 31 Dec 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198623; cv=none; b=SCecenbvl/a5rMnogpC3qyMPUjQotpPOXh7kg9ixhkviPOgpvPS++q75g6FfBzaAE9sxouST/Rx0TyO5vB8ATWHJ+l8mnohCOuh8indqKSrQHwsaN+Y/CZXNv+lKueO+qOZWy7E1YSvD3fe4mSjRge4dTP8YFiWIpq6LTvE/ybw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198623; c=relaxed/simple;
	bh=04XEBMDpEV1lgd2MHxPLm427fT+7qwuMKA4T1FeHvJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME98PVFk5g73CKsmPwZQkxoobML85rShL6dYS4IcTCnwx/YF52ImefWW8OIj9S5R3i5k7moqNjYYPzXZbXqAhHMWxV1dzqRIjSOdmaTuKOAGLgSLHVaAVAAX53YsSJik2xXCDqPgN+wDQQfP9bz2t74f2k/l2jIwIFdTHUdFyvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YFCgnR9u; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oyKQeZFq; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198617; bh=QffQ/HFvNOEYyu7fqrFQscK
	deFLLrT010lx1XxLDOn4=; b=YFCgnR9ukbZCz6DDVCiJsx3tQGfg6vMWLP1jb7idXAeMrLVABz
	OUyHg6HNT9bfA9zJYR2jbsPRYEtXrTLXv8+Ci1jrwWY8BRAN8ttxflzALRd8ezzdeWgUear+vJx
	ATWKJa3M3EkMC2UJta3jZE94Gybroi8KU9yzeBzbnzTNu32L7PJeThdywxWmCP1lUHR6FGKk3qR
	Vpjfl0C/pbL7QityGkVgV77i+mxKFoPwWxFfOTb1y97wgGjLdeJWDxc8i9d01rO1X3prxIEsWme
	H6xrANt+JKqPPYQu0WuuBqQ0XKYz7Rrx6soso4fiuchvGipay/Y++6IxUKwXT8ATv5w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198617; bh=QffQ/HFvNOEYyu7fqrFQscK
	deFLLrT010lx1XxLDOn4=; b=oyKQeZFq4psOJ82jU0KMHDRMTsuD3yatPLAeFNcpPQ6hkcMoEf
	bXZ2sqb2TwCjlke0QsMi6eantOLPwystNDAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:16 +0100
Subject: [PATCH v3 6/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-6-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=1343;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=04XEBMDpEV1lgd2MHxPLm427fT+7qwuMKA4T1FeHvJI=;
 b=tenWIBtsP6Dd3oBMiRYRWAc+A+/oVkCzIyN/MNGPHoR2N+b9ExAbjsKUpiRc4luIwuO/ygroQ
 Ac6pLvacDTUCOOnou+Bftxk4DkXyNIbZztx0oOg5awC98H4kGM25l+C
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8937 platform.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 74202dd34703..b4a1b5852896 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -23,6 +23,7 @@ properties:
           - qcom,msm8916-mss-pil
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
+          - qcom,msm8937-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -232,6 +233,7 @@ allOf:
               - qcom,msm8909-mss-pil
               - qcom,msm8916-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
     then:
       properties:
         power-domains:
@@ -276,6 +278,7 @@ allOf:
             enum:
               - qcom,msm8926-mss-pil
               - qcom,msm8917-mss-pil
+              - qcom,msm8937-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


