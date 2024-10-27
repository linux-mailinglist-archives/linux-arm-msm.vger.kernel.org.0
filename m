Return-Path: <linux-arm-msm+bounces-36077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A93859B1DBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 14:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3786B1F2113A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 13:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B614E156653;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="retivfID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE1139D0A;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730034141; cv=none; b=g5riqBxsaz0M6XPMg/hUbp8ymGipx4VRrfAIPRA+XjmfPc2VHTlTW4ugm6YFrTZxf1GpjH4n8nyvqngqaALlhVpg9fs8ikho4+03fMQKnqA1RFnP/db7GGoriWF2SWeeCwekCAq2kRSsB1wZgNCE7WaYP7x8dNm23vwUf2Hd2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730034141; c=relaxed/simple;
	bh=KT1efUsWdV/8xB40/Wnf+QtoYbsdYN98OKVjhQNdov0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPXSs3IIfEkjJU94t3YY04uARnM5eKW/gI2LKjXnrLsZuzK5jx+cAga5lFYMwOdLt4wP2RXmqsKqq1SkDTkUbZN+LN/YwnYuFpWj2jA+5tsXOWiIM75JzIts+MoJ+0Fi+QqZUNMiYkK2N8sEN/b/Vf02PwaKeclBTn+l/qRgjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=retivfID; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 248DDC4CEE6;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730034141;
	bh=KT1efUsWdV/8xB40/Wnf+QtoYbsdYN98OKVjhQNdov0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=retivfIDV5gKGxejqz3vBRcDbXbn4BAIaasIohdN9/EaED9CYRZXpHo6MlvSXSsTo
	 ahYR/BFDPJzcaeUR1BNqpiTj2QEZbFwaewYud3Lt/VZWa6OyAqG9fV4MFqVKk1/1lN
	 inZEXa6tWjEf/DKpuGugcLdomgubl2lkqQAaFY2Bx86QkVzRdPF3mxgfEOom6NkeM1
	 4bldwPBJxrtxU0xFdSQ75LQ/Md318ZMzKkRHqXd+M23bG3pAwYmdNYe7FTdGG0QVAV
	 WALLOtOjg+rIRGYi9njKJRWRMfFQNCN7AUaysthMSpEvMJi/25l/wNtQmS47TcKtRR
	 ipAPfVMzcYdEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153E8D11707;
	Sun, 27 Oct 2024 13:02:21 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 27 Oct 2024 14:02:16 +0100
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-jg-blackrock-for-upstream-v4-1-703b254fc95f@oldschoolsolutions.biz>
References: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
In-Reply-To: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Merck Hung <merckhung@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730034139; l=1029;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=kVFiw5iTYnaFdKToApkPnG1lOIfe7ZmaJD+ATzZdQIc=;
 b=HBMgRwuPgNP8kOE5/601JH1GPcV7t804R/Qu9ve2SvLMJXTxBpcnX9PGvHqzycWxOHHgaSqiC
 z3n8V40FBISBE6+Kx2GKFixSq2NDxC85qD6IbopviEdPWUphMPYnrl7
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
with its codename "blackrock". The Dev kit is a small desktop box
based on the mainboard of the Surface pro 9 5G, intended for
developers to test/build arm64-based Windows software.
Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774a..32381638b6f9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -823,6 +823,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



