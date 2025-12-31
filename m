Return-Path: <linux-arm-msm+bounces-87032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE2CEB0E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC8763017F30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7062E54A1;
	Wed, 31 Dec 2025 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="li+frQdm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="P67+AY7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CEC1E4AF;
	Wed, 31 Dec 2025 02:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148178; cv=none; b=jR+cAvDgNE4a3hOf/WqWqJ/5v1FgCyuQfYRMUBeCOmUKqBP+hpFFqK9ooyByme7ERNPqtzXMjpArW/yy0lERwGFxKJkGu8GVaEUG1XQpiVAijOYWTLQenP6bFno55QEpTkimwcHP9y+xyflqeJ27VU9ynIZVqPoDR9czhhMlXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148178; c=relaxed/simple;
	bh=fhONiEfWH8zhg2s1jSG6LiT9QQ2bEtT2mbMM7izw0hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MjJuoTI0zkaWAbPdu3TwAO1EflWT/sngHZgKvSvpvHSP+ecizUEAGg34R0dKBggUf3heb+E8k6kEbJxVJvq+89KcyZ5DCXzoX7dEg9PFWAvXk7yLc+/5uem08KRxDa42+F1FQyHn6kYXsw4C6UIdhuXCkw8Uvo9FXR9JY/tsSkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=li+frQdm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=P67+AY7u; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148173; bh=YRcof6xDYaHvRV4UTtjARYM
	lAay2JAmmMme5AWxMDs4=; b=li+frQdmWvEIHTzkLu3f5WF+LzlYOqEMMmzOWS+jY0XBh8CiM/
	Zrai7Mkhn7D3TW68E84oCARRwWl9prPvb1dGi+emyv+qXxsmNjCgFCYEHrJ1D3DeK4YtyGUP/Dq
	EvONw05uDFgUzHCFnw+fg4bAc81NaCHNBktsfew4EMWQSTmJkQQFLMvAkX7+GnYrbM7nJYcdfdq
	D3ZzciT9gfgWVBE4rTmDA0WatVolr7nx9bgMRWsYMwFTVnoLAQBTrpxcmwCUqjv9QsMMCu4U3q0
	34y0SMSm1kGMA7VCEk/v0XyRoXTLIZkHDr+BL4zlYk4DAOqKeQo7FYXbhU1uges77pQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148173; bh=YRcof6xDYaHvRV4UTtjARYM
	lAay2JAmmMme5AWxMDs4=; b=P67+AY7uTmpTeGSmuvz4DWBS5xsUpsQ76LzdTGt0Wfrj/p9wPh
	Togi2Ea6NbYfJL7ONyyFo3QjAhd2Wn23SbAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:31 +0100
Subject: [PATCH v2 4/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MSM8917
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-4-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=1647;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=fhONiEfWH8zhg2s1jSG6LiT9QQ2bEtT2mbMM7izw0hQ=;
 b=czRmR581fOn4LBHWe887OAfsCqQWlimXRvwyx+lEYqhfcVa+q8TAHFS0jtyYHjQD1hDGW6RDY
 Z+v3+75WNcdAknwjW7EJ5jYs81kgPLM8CCr8N6hEEDpF09PBUpq+gzq
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


