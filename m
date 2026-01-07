Return-Path: <linux-arm-msm+bounces-87852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A71CFD6B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A707304ED84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F30C311959;
	Wed,  7 Jan 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="PbC4nVvS";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SrviSH8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6D30BB8D;
	Wed,  7 Jan 2026 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785658; cv=none; b=RImUYos00OZ6Y0w/Imc8wWVHdwd3O3jtf3zTfmi+jw3YxICFT7eYfQS3NOIo2RCnOzowveeY2D4+8UfRw9pUXKXney7UM64zDMFSUKXGa/UjfPFi+6A35d5GOEOw932q54TdKJ85t8HPyK5PNy6lIfy6YuLBknexRLZ+Iawr8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785658; c=relaxed/simple;
	bh=Lwu3psLehfxmN1oucfsa5wU+3OK0Mti+dAkvdh9CQKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KG5k2zI+BsPbvg/MsGScMIw2zppYZgQsJr03L8I+wSpTBm5bxqauCixkpYfK+QI1Ep5y7NalwkHq+8DJS/y24MYbQfvb/gRrqiQeutWZ33jW3QP3agxJJurFh3gCHXUduc7jk7/u71dZXYtIEO51yZY7vlpryzneWNssV1iAwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=PbC4nVvS; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SrviSH8u; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785646; bh=hofN6lrJooa4qLyhfM7ys/g
	1aOnKBeuoIGr76evSTjo=; b=PbC4nVvSGxwTlAIHodPb7OKBorSg+lSCGXwVaHFkIoq2LmZh0q
	+/IfpGBkGD2ZYDsgOMJ7NmDhH6exwrmh9d5w+pTtPB612d/1RaEiu50Ax/YtCyYdwMrRiFBxOoO
	zt1uy3k6+XqBaNbivL+VgP0e8N20oZ7nBPW+uxRUP+eflHl3PSHqx4BD6bigvFJoN3h3iL6iHbo
	XrvR0JshDlspFBUf99Kr8xjpBUDI3UTvZtVg6q8yInXGRmtHL/YkSN8q2U+0nMxNkRKqTI0MwCv
	fpJLXPdilC3NCAzeVCXAzGfRrOHvYmlqccW4v3hpDDMIxjbqz6mfkCoGOGxfkycnvVA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767785646; bh=hofN6lrJooa4qLyhfM7ys/g
	1aOnKBeuoIGr76evSTjo=; b=SrviSH8u6KPalK5X76NrBWHns3ZZ202iLa+C6Cx21PXNhnApJS
	TDpz8LYAwEXVodNnUat9DuqFH4U0g0XoRCCw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 07 Jan 2026 12:34:02 +0100
Subject: [PATCH v4 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260107-mss-v4-2-9f4780345b6f@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767785644; l=1130;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Lwu3psLehfxmN1oucfsa5wU+3OK0Mti+dAkvdh9CQKY=;
 b=agpsR+hJiSr4ahlIL71Nm5nwQCOdnk0LUYDxGqcC9HIgy4xdqeThJmjsEih7McAsqGAZDJ9UP
 Nv/wnGpoE6mDNKkQQPzo5iI55NeHUVqTZ+OMycOl9ajPECv57SmAzp1
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MDM9607 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..4e0d2fe0e46c 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,mdm9607-mss-pil
           - qcom,msm8226-mss-pil
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
@@ -226,6 +227,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,mdm9607-mss-pil
               - qcom,msm8909-mss-pil
               - qcom,msm8916-mss-pil
     then:

-- 
2.52.0


