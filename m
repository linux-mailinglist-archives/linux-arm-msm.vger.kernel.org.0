Return-Path: <linux-arm-msm+bounces-87858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EC504CFD75C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61F5B30024C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1930231D38F;
	Wed,  7 Jan 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="HmLDRmNZ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XoHpDI7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5A31618B;
	Wed,  7 Jan 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785664; cv=none; b=Fn58zAr/jAJDgsK6Eg41UDUX7q3kBXNabZR2/leIx4wkI6FkgZWdSoFSENWdRS6k29/KXZeI8MXqBuj5dwIn3uKj15v8NXbRN05ubagWfJOY5/MtYOSRUenSAKHnMwrNHodzitV9JNgs60q7dwp2J1a9TQw8sepk1emlrsCAVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785664; c=relaxed/simple;
	bh=YxOIBnO2ge4Q3ZvVGY59uUkodhu/6SAouH6WatcD2Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/zh0RC4syoA5PpPqjAkwWGylUHZ/u9w1zcH6+dKZBeXUFpFeieoEx6RegwcoZj7lb6QZ38v2ZIrIHDnUmWbScDX9qYcXnS7csGb9DHiw9IlEHBGYjqJQc3ur046TmhkUfQ0qFobQ9WsBMS4SEzFuKpaHYvmwRKOHlPc8byoAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=HmLDRmNZ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XoHpDI7p; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785648; bh=vnZv3kXX9ltYhuUBaGr8yAN
	zc3cPPQykabClqonqnYg=; b=HmLDRmNZrD/3PooFT6rYAOTImFd3zkBS60oWfjUwoNfw3o/YlS
	DL1v2BInAUoLQl/DGbkhVd9YJ5UV6PpDNIHKSugb20P2l8sQQj/cg4qpm9fw0QwGsAw806rqSUN
	AFkpspgS71M10LhBK3wUNYQT0bTCJdabRjzVI695RxfKi8UiACjw4c/ThKbUQLP7uzDSNFuSaUh
	4aXQLZzu97mDz0DtwxZ9oVhDjPZPGDRreDFiReJEvH4UZJ/b4wF30G1/rqlesnseF64SOaOmqF0
	amwd+d3/V55fF4Yy0Ez+rs9ZD4azE9uNnMHFkewHpPLtZaWV3zwEJjofIfv9DstN4YQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785648; bh=vnZv3kXX9ltYhuUBaGr8yAN
	zc3cPPQykabClqonqnYg=; b=XoHpDI7pAOih+BV9hdgD10bGv9frQtOhY4+j7+JJS2l8+Nty+L
	4nzhAj12VAEVZ1uHJ8ZS+mItAFwjfASBszBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:04 +0100
Subject: [PATCH v4 4/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-4-9f4780345b6f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=1720;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=YxOIBnO2ge4Q3ZvVGY59uUkodhu/6SAouH6WatcD2Z8=;
 b=L7o21qDI7vlFSD7WwfF6FMRK15k578qpLNzoMpTLrATO67QaaKbIXYljZJXID64ZzEIzeUPHJ
 xNiWLWx6ZnYA5pCtxRJjFnNZTSwnlcRySIzk46l/EJ/ukbUrYuuka4W
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MSM8917 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


