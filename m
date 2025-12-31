Return-Path: <linux-arm-msm+bounces-87131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A16CEC430
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 17:33:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 336EB30B075F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 16:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A236288505;
	Wed, 31 Dec 2025 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="b47aSYWm";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RiRTOwy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604D27467F;
	Wed, 31 Dec 2025 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767198630; cv=none; b=lwoFUk4Yll4UMjKukqyD/VuxdfNqk53/ZGrfev90r93iija0lkWfmsfgP0PHQjJe+4E3XLv0AO9nMmeyAvRFBRMyTzNVvbF0ZI0UF5XPOgghKzaDfpBgX+sZv3pJv57IQ7vEdHQyBa4eEf8qvANPTb7Yg5+RfNhTvGjp3ArK23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767198630; c=relaxed/simple;
	bh=3IozC71ijmNg38qD8RfT3RWim9e1qFERmdN0P/NMg+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Av3uEisbPz1GQlByc1CUtK6BHSSb0C2aCsUR/BCVVQ3GfzCVA2zJpDTbL2obT7yku45nkYhgaF0s3DN18F37hUGmKGkCyyzBnrXe9Swt4Ynga+u2zrLsXe24WXxo5XR133hQZGi3Z+8ZHnsouoCujt78cP74GxUUqvnnkz3rQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=b47aSYWm; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RiRTOwy9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198615; bh=fF8lruY0Q3UFuXdQyaJnl4x
	uJqz5yvtNSd1wFxVNgaQ=; b=b47aSYWmKd6Rd3sF44gNLtMDCupdp7Jrar779NM9H7SuXXdvOx
	XRNy8zFQI6sPaq1ZhPMHD4Q95hUjG1SQ7RXnM36x2nP+puDXxRw0+vIAtA/C71278ScylLZzR95
	aE0XZzyGxPC4K3T0w5Pl7ZmLbh0E0VYMzqw/sO2vYaxFsw9ZiPtfLB9o7sokPrEw5coPcXKPfM9
	kZL7VVJGXgyawdfoG+Uis2IHBJzNFSzrYJcoZoOvLmqkcwc1O1tZ41thd03BP/phlqI+z512fTf
	g3fjk45s8gDSMhkdlQfUoKaRC7yjytoagCTSdJNII0aPhOTTeK/bk8fU/iNxibzm3hw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767198615; bh=fF8lruY0Q3UFuXdQyaJnl4x
	uJqz5yvtNSd1wFxVNgaQ=; b=RiRTOwy9tLkd25Kpm3FXETrDS5pVMMLPIVGfZMZZNk0SVOnyVL
	eeZmaoKRuRrVSNJo3q5jSTmIQRTZuHsDCJBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 17:30:12 +0100
Subject: [PATCH v3 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v3-2-f80e8fade9ec@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767198613; l=1060;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=3IozC71ijmNg38qD8RfT3RWim9e1qFERmdN0P/NMg+M=;
 b=zlXgbYTPbqJ8mn4SqdrGN1Ukej6VoJKXjDWFhe8+kfJFMhAWV50QITaJlIBUQUdL+iXjgADQq
 YfqViu/v+dFBpJjS4zqR0v+Mz8R2qfMliIUfozpb1d+7E8lMjkuvrS+
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add the compatible for MSS as found on the MDM9607 platform.

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


