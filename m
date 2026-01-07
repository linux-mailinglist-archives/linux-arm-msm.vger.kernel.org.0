Return-Path: <linux-arm-msm+bounces-87857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09610CFD711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 595A3302CB89
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24963168E3;
	Wed,  7 Jan 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="WL/4Bz2H";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oTzMskms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D6313E38;
	Wed,  7 Jan 2026 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785662; cv=none; b=hfsA/IazOFEnHdWV8V0VoGRlFxTRLKs5VARb2PW/LRxVknh0FjntWfRW8mFw+ZXmu7vPQUYZ4Zz3vc8DHI3C0ksauU0Ig+GDWGFeZ321nQK/88gk4X3lAPPjsWC8SpJILtniKSr4ouD9BhS/F+4WazFMo2w4uCke5R5u/6teTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785662; c=relaxed/simple;
	bh=hMOaJ0+NkD8I6kI1w5HORwZtG0N9U0I7bizPeFHaFYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AfOFAp1nnYCLnH+d2WWszKn7XLVE1JEVKGZHAG5sTFRfUIfcmkU1EcyUU/rA701yS2U2ekrCzrsN5dUT1u79EoCl243fJeMj2BmY+QSqEK2fEEcA4m6G/eJE7DaD0Ovpzlwpl1KcmqKqwHR0nv6Sq680uXsQY8Rch1uWmEiQ+0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=WL/4Bz2H; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oTzMskms; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785650; bh=vM6Pxb+0ox/Gl08h+U0pmpt
	1xgP+KLIUrzIa7mxxR9g=; b=WL/4Bz2HnsphucT4I531rYebTeZ936NPF/c0aXmjCVtvmi7eyz
	iAWT0IAAd7LLwI25QMe0QWfcaO8WA3Cy+t/DSR4ckGoz8FZesJEUGPrCLYdd+GFHeUVp4Aq1Lkh
	uFmx/tAG018zVvtXbe5NmK2pOsO5pwRMNZG8G3p/t4eA0XTKZrEa0n5QrQ+BlOdrFuz/qIh+Nes
	8u3sciim69mx/y0Z50XYdnZBvYMDnWVArQdms2BuFh3519kd1y46ucI6VoUKMcR1X6No8ZtHrhI
	ONykTb7iDb+ZJu2f/OVJpOgdYjb2VTJMv3amDGXEPwIFU4TKGzkhVmOlqvTYVwWDmiA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785650; bh=vM6Pxb+0ox/Gl08h+U0pmpt
	1xgP+KLIUrzIa7mxxR9g=; b=oTzMskmsDMCjn0Lb9PxcaSjDf8rhuLhfWp8eswQDrSRg8t9rTX
	y4pTS4BAzU9oekhTjV5fAPpD4jVWqPVmtzAw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:08 +0100
Subject: [PATCH v4 8/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-8-9f4780345b6f@mainlining.org>
References: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
In-Reply-To: <20260107-mss-v4-0-9f4780345b6f@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=1435;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=hMOaJ0+NkD8I6kI1w5HORwZtG0N9U0I7bizPeFHaFYg=;
 b=hPRwNfmm7CCJElIrthYyaQ+s2SK7pzJ7Qph5xmNTrAScSkQhEzzvmRZy0Oc0/GoQgtJc+z6Wc
 KuJhfloIXbmAzgrJzE+do5OHvGpgt9VVh9riMqFzNcprc2kuCaR1U2q
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8940 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index b4a1b5852896..8c0ff4dfad10 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,msm8917-mss-pil
           - qcom,msm8926-mss-pil
           - qcom,msm8937-mss-pil
+          - qcom,msm8940-mss-pil
           - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
@@ -234,6 +235,7 @@ allOf:
               - qcom,msm8916-mss-pil
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
+              - qcom,msm8940-mss-pil
     then:
       properties:
         power-domains:
@@ -279,6 +281,7 @@ allOf:
               - qcom,msm8926-mss-pil
               - qcom,msm8917-mss-pil
               - qcom,msm8937-mss-pil
+              - qcom,msm8940-mss-pil
               - qcom,msm8974-mss-pil
     then:
       required:

-- 
2.52.0


