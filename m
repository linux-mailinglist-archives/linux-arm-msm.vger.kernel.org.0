Return-Path: <linux-arm-msm+bounces-87035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7A2CEB0F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 03:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3E4F63009B08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 02:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623FD2EF652;
	Wed, 31 Dec 2025 02:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rKQSp8Ic";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UCf64U1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D62E7180;
	Wed, 31 Dec 2025 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767148182; cv=none; b=pU0L8Gei8FcqXssAtm7qFL7aKRGcCko7F7IEmjpuUfSgtIR69mNr6w+YQcTrdS/y7igkvQ/1KRRyrEgPcrzFYmlzG7fZYrrcJgIuGCsJl+GThbMz2UEkbdjph4oekv3CPoC3j/F7bp18lQIgv/UPOwFO3aJ65L9On61WjxZl4NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767148182; c=relaxed/simple;
	bh=3IozC71ijmNg38qD8RfT3RWim9e1qFERmdN0P/NMg+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uA07ba2fKb38UBaqs62gTrr682cOAt0WJgHOZo96oTnd7PUbjahWsP/3Ezerphaud2rToo6KBNLZh7Ca3aaSuVxq7J5OTywXR/VHKhNvwb+7oYcR36hZL2Sa7VQr8vP6lPXmpHrKwg3PRCx+VzX5dGwuzyfHVYwAgphwVm1a2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rKQSp8Ic; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UCf64U1E; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148172; bh=fF8lruY0Q3UFuXdQyaJnl4x
	uJqz5yvtNSd1wFxVNgaQ=; b=rKQSp8Icujas0YfXjQuf4IvcD2TwiqDV0Pu0jqFM5M8qAe7pCY
	oxXOajSxscZd3J2+QnSgvE8X5ec4ALLpdylD2EeirU5nDV89PywVi4TY1xHchU/r1I33aTEN7/Q
	e8ju55SaIFkesFkiu1Kis88uKorZCVLx01Ik5u4Xth8CTycfHPY6atYUFc6vMn2QUhPF4yXObp9
	sQ4hX0+1n7tTf8gb5wJjq422bQZ888dBXY7KKfp797Kn9ototHEMLYXgyB1qbYfGNi2GZb8sftU
	8xM/IdE1LGVMYG+t/eM6TffqMKkizeJ+GmWEcTqVJzdXp7b9D48LvRfR7UA4LDQ8U8w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1767148172; bh=fF8lruY0Q3UFuXdQyaJnl4x
	uJqz5yvtNSd1wFxVNgaQ=; b=UCf64U1EzrwQaeysUuGs7qygefTCGkdJa0sv//jvPgXErzv5jQ
	fZmO7fHedi4kjzECGF3SQ3oWHrDDcs+xtdCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Wed, 31 Dec 2025 03:29:29 +0100
Subject: [PATCH v2 2/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add
 MDM9607
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-mss-v2-2-ae5eafd835c4@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767148170; l=1060;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=3IozC71ijmNg38qD8RfT3RWim9e1qFERmdN0P/NMg+M=;
 b=Ky4mbSAdpDglq0bl6u323TBQK5zOPVK8iR8wOqY9QrGgbndnTJLFlaZac7n2ZIxv9VQsme5dN
 VzGCnn78xbBC47u+yQ2batLbjZA1ob8yebv0OFx1nEG92/Q/544GGcF
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


