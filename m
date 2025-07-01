Return-Path: <linux-arm-msm+bounces-63298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABAAF06DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 01:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD624E2C3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 23:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232F9277813;
	Tue,  1 Jul 2025 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="sP7ag4YE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60897302CB4
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411865; cv=none; b=D8IZykg9Zi26r0hpIJVswJD/qc3wIP15hi5NI3AyvTubIvT27A7cSJTtBzC50DRy0JicTdDcsGETbGsnzxKKzbOYzjVckbvbSycjnX0CjryELVsuwaLzwsxZX0QmBlXIIbQ1aZXWyDm9mWQZoDp9C1Ms/FSWt+5nlDyIvOUAgK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411865; c=relaxed/simple;
	bh=tHAOfmWrKC2MO0J8+E3XQ1TtW8obhRiT/OhAQjCNz0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyQE+i9p9c/GdCoFArMujdflwlJplGJMBjvLqT212RiMpV6ucIKRTnA/cogAacZq64oTCJ46G5o/CMHcZ9OTzmLDlVWQgIewqfhPhwOiz8eZ34ndbvl68bjfpkJjvFrHc7U6GYHSwFPSVCIdDdjYzDryfQvPsfi4Y+D9E3x2pok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=sP7ag4YE; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751411860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fVALWoYDFjauVrLrvxQSV8FxyXgrZXKC9VSebAbBFY=;
	b=sP7ag4YEyIBG2mQjyAhCKeWne+FEXDG2ZpPy/1Zagsb9UAukQR+g46EhliVlRPN0vHLmdy
	JpahuVu97SJU6c0n2lJG/WDrcsrRYj4ZUZY29ZpQdVdUqGZDcmxRbCJcWI3JTCA1OgiGk8
	98z1SQJ1q75krx5In8AO3bHyFGqSGRCUPxOhpko4MuuT2kEoNmcvEPKwAd6c0tL29tAxeF
	FqjuausTKUeQVoLDJb85ksvdcLmf8Av3sqMl3Y+IzVZVWkUmaITLtOhOQzuTODhrFY+pKb
	oU2nGVklAk4HTU1yxwdwrnVOTpx/jtanhbe00bfQtECOZZNKbnK7v+oxn7PBMA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
Date: Tue,  1 Jul 2025 19:53:24 -0300
Message-ID: <20250701231643.568854-2-val@packett.cool>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
References: <20250701231643.568854-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Document the X1E80100-based Dell Inspiron 14 Plus 7441 laptop, codename:
Thena.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b3556580..8e3b804864fa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1146,6 +1146,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - asus,zenbook-a14-ux3407ra
+              - dell,inspiron-14-plus-7441
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-- 
2.49.0


