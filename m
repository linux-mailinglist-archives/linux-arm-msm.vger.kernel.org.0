Return-Path: <linux-arm-msm+bounces-87041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953FCEB163
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F12530533AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2412FE56A;
	Wed, 31 Dec 2025 02:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qd8Z4uLP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Wk4GAL6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5672EBDC8;
	Wed, 31 Dec 2025 02:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148185; cv=none; b=UfBVpH34JuGdRf/NiTdi4ouUk8oGWvMkEuuWnJwcbaS98GaL2uqQh2mhs681lDin+Bja9iOMsozFeL7/dAlSv9IwyBCUb02hY+avpu8+uBBKMfjpk3UdBPw8JFE3ornp0RMCWECj5naerVbf3tC5Ui0NbG/abiG/pjaiL1b+SxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148185; c=relaxed/simple;
	bh=ZGJL8ieQ+dAntpYwsMwaA/f5kgC+FT3c5sWvnrJ8RfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGsiVFFchJ6C2n7PKrUwVMrN2JUPNHwWmwe7Ou76Znqo7wm+kHqZIWMNRlO2hFxQqn+r45yxPPcM2aR4jvdYVFu7GAQUmtg086wVPLdIpFcEFjo5gZlMUCcYLEsNG3/iqIjwaF1yRCI2jxeIQ9jPvHdl0dBYUlVT9udOOIWiNUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qd8Z4uLP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Wk4GAL6w; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148175; bh=T3E+R96u++LFCayDHWU1Haq
	hLqGQ37Y/f4joD9JSG5k=; b=qd8Z4uLPwjOhSG9/oHW0IYVswPMW06Jy6JfeHa2TL2VZSY05y6
	HcNHezNZDcIiuOSgKifD3Lv2KkIGz/7Srw3ryKNcCo7BfxfMMT0sOVZ55c1jwtgVjdQGz8vRQKT
	WUc5827Pj6snD+n3bNL6dTTRwac1H7gzANu4ClW7M3mctql703xoWt/9zEPtQOu/STIUlQ6D5S/
	qeXFSgleoXlpNap5+J6C3rQnkJ8usaRx6+UGFu8qPPkqxxrm6x4YBFNgeFhXT46+54FsPCeqUqf
	acVUz1Y2TxzlHFyjDjMZF0IhbI+UEOSoKg1D0o2hm4oYkHmskvHb0KFj1O4tktSVPgQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148175; bh=T3E+R96u++LFCayDHWU1Haq
	hLqGQ37Y/f4joD9JSG5k=; b=Wk4GAL6woymfl0PuUCKM857cfaWST2IfNO6f0a/QoDS8vHGnws
	Sqdn1lhq7vI4KOW5wCPiFVVRaVwbPLXQlkBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:35 +0100
Subject: [PATCH v2 8/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8940
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-8-ae5eafd835c4@mainlining.org>
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
In-Reply-To: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=1362;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=ZGJL8ieQ+dAntpYwsMwaA/f5kgC+FT3c5sWvnrJ8RfY=;
 b=GryPXZJnWiML6v6RnC2j6X+K+IU3LNZmmLwB8IStW2JlYIkcHs6cR6503zmsRQvDklMKkWiCJ
 rbV6KkJi3UQCihvstcG2fRj0jdPzrXsPcSWHdjb519iiyIR/FiN1RMD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8940 platform.

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


