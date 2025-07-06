Return-Path: <linux-arm-msm+bounces-63865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C1AFA7C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 22:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F5197A4010
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 20:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8492BD580;
	Sun,  6 Jul 2025 20:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="q3JDerJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557962BCF4A
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 20:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751835537; cv=none; b=hWCFExbkIVmjG2sdjsRK3LMdtNP1FKw4S8EmlZ1qf1rhuFCBTRo9yVq9hkC2m9DD0BLA2zvPq4eSBlfVkfAdjJtU5yLRBfY9LWRtvjaRP8EVI+/EMqVWl+OiO00/BAPiWY+a2bAGFqmRs2/UYkOuGPwyDefeARdAf3PLevKlCB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751835537; c=relaxed/simple;
	bh=tHAOfmWrKC2MO0J8+E3XQ1TtW8obhRiT/OhAQjCNz0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mytMdXSPoG+KNfNo3I8oL8aHePeOt/s2XxKqpDPAiYT92KKTZUAsm0qmciZhQ5Et66UUhu/bpJvolmbDOaBDd4EyvzXv4mTzlt10e5pwHQc7QyixaWzNUGRR5qNtYBMObAuspsmEhJD5qVCHL9DSlOmnsoOT9rOElvs8AGpFmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=q3JDerJC; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751835533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fVALWoYDFjauVrLrvxQSV8FxyXgrZXKC9VSebAbBFY=;
	b=q3JDerJCH4yA1V77IcVNXt37It6U1muIsf9Sft6UVW4HQ/uZanqkNUZXmFMGEZv57OGPml
	PDPDZ+Ml/Nxze5VSNi1im/XwUmJauqXawogeYPcmRkA8xid+kz9ySWePnX/RkH8w4Kw9tN
	dr54fkzZkkPsTKy3N4ww5b+GLb+OWCUoIWt4/abYtvZZ8uDAY/uMSt0ngs5MFOMvgeaWq1
	Qtf/3dV+kqj2MsSeJ2ePx5t+O2oo6E47h9WSQzPTQS4M42W/JDn2T6ZfSvvGjzo/w/bv2e
	daVDeXQnqDBk7HJKjOJuRG1mCzv+OWbQ6VDX2Ja+pZgYxXPKOdVy8Pyt1dHkow==
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
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
Date: Sun,  6 Jul 2025 17:50:23 -0300
Message-ID: <20250706205723.9790-3-val@packett.cool>
In-Reply-To: <20250706205723.9790-2-val@packett.cool>
References: <20250706205723.9790-2-val@packett.cool>
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


