Return-Path: <linux-arm-msm+bounces-21264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F38D6177
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EF121C232F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6C311581F9;
	Fri, 31 May 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="aHII+BlE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mainlining.org [94.241.141.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ECB29A0;
	Fri, 31 May 2024 12:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.241.141.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157571; cv=none; b=bPRHFsbM6IiJ9Lv0xt9uMX/jPrDeI5DglujNh71jTi6aFN2LyeJS6OlKnwG7OPMHJKGbBGq9+wzCoVAVuDZK9cDUjlpHogUPs4gPqKAbuxuJCpvwBMf15UYGtO/6rAo7FlN1SwPglASaaRh9aA4qTktl7gSq2deAc0JXDNaOn/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157571; c=relaxed/simple;
	bh=sNwq9j0seUAAM0TlDZhbME8CPsDh4g2j1l5gla81evc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L6kCC30a+WkBQeO4lq9TaFE1Vyfa9Ge3NXDG4RUtTBg/+wSnHxXn+gu5j1u3rLqXLsT21UYDOcymSHgTsopzTVaIE3f+MhYfu/LenWku1da9uUYTZnRSERQX0pQMbyQCRCFXI1+hQ+nZTWmByx+QNS/rFJTgikgJaoKkvGwO2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=aHII+BlE; arc=none smtp.client-ip=94.241.141.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.188.26] (ipb21bf7ea.dynamic.kabel-deutschland.de [178.27.247.234])
	by mail.mainlining.org (Postfix) with ESMTPSA id 09D1CE1FB4;
	Fri, 31 May 2024 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1717157195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=365GHuWbQyUl6ukwGlIrpFAaKYKPH0Juz+u4AfNJ4+M=;
	b=aHII+BlECXTNdaRd2bvpCG6OehJvPxLj0/U3tGLo/MLmrUUb+D87U2eFC91TzYTu6JhF7D
	KVUSyaeNS3vlSNkK/UI64W2d2b0RzuRkbKnQQ8nbah7K3llkkCgfWOb6NIdebetD5MHGso
	Xs6p8UWdnnUjQniax7muMORH0ZON2iDduyh2DczrlCU2ahL9wj0llFNHCeWMasLW8luW2C
	+YWx4NsBCRs3uJpDsGQAft72lQN6/a3i7Mti1JBUbY9O/mrrhk8Uqj4ThAFNvNo7kKK/57
	bV3P8TUwyzM/sCVOyrlh9DfZzQKzD75DDaVHSVSHPf9OAZK1T3pcDLfVO9VwBA==
From: David Wronek <david@mainlining.org>
Date: Fri, 31 May 2024 14:05:59 +0200
Subject: [PATCH] arm64: dts: qcom: sm8550-samsung-q5q: fix typo
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-fix-typo-q5q-v1-1-95f10a8eff9b@mainlining.org>
X-B4-Tracking: v=1; b=H4sIACa9WWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDU2ND3bTMCt2SyoJ83ULTQl3TFGMTEyPjJPOkJBMloJaColSgPNi46Nj
 aWgBRksprXgAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wronek <david@mainlining.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717157194; l=948;
 i=david@mainlining.org; s=20240531; h=from:subject:message-id;
 bh=sNwq9j0seUAAM0TlDZhbME8CPsDh4g2j1l5gla81evc=;
 b=te3JsqLcyA2g3BK4ZBdiENlHG97kZ+Wym6ylsy25J/ENSEY/3pPHqH1nW13eDMppwe3GQsiYD
 e2VLLNJMmd2CprD7SJ2GJIcfW2W2GqQ7M4BU36+NVL8gk2p4iolUuNS
X-Developer-Key: i=david@mainlining.org; a=ed25519;
 pk=XqkgbOfXJSEnyKxaC8p47fQE9Mm3634OwptSTONhdSk=

It looks like "cdsp_mem" was pasted in the license header by accident.
Fix the typo by removing it.

Signed-off-by: David Wronek <david@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 4654ae1364ba..3d351e90bb39 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -1,4 +1,4 @@
-// SPDX-License-cdsp_memIdentifier: BSD-3-Clause
+// SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2024, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>
  * Copyright (c) 2024, David Wronek <david@mainlining.org>

---
base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
change-id: 20240531-fix-typo-q5q-5d34423b7bb4

Best regards,
-- 
David Wronek <david@mainlining.org>


