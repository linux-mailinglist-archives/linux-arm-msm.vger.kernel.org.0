Return-Path: <linux-arm-msm+bounces-64343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6BCAFFFAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:50:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BE371C4493D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA302E090E;
	Thu, 10 Jul 2025 10:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcJ2ly65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B552DFF22;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144654; cv=none; b=a8ieWJpvdQxaj9THnrnC+rpGu8PSFpy7+9kG74bFrH9YKZcPIIbB0aNTOTeEhVssbF6IgNEKSrXI40/tOsF8yyKSU7+x5UqUBVZf3W5IiHyOudZRZvqv5WCPA2dB5lc/pfXJSZobbpRdVKMIaKM163egzDsKqB8qidwrmlYpad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144654; c=relaxed/simple;
	bh=TQ/2MaGxuBHcFFdbDMsi7aEDjibfjxWnEo8P20jRYoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iczRdE66gwX9SDtpAUrCEPAYZhaapb8AW+SCJUu153Vyn/oDRSM3kbv7IRQznKjJzrFCgt5n0pItvwSRT7ZsMrelQt0h5FAJYp/btimRuBRRM0lfGTnEEHJaTrpT14cQpV4ygdiBe1HtI1XUGlie1H46dcfYfnI1lHb4FsC/w6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcJ2ly65; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0911C4CEF5;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752144653;
	bh=TQ/2MaGxuBHcFFdbDMsi7aEDjibfjxWnEo8P20jRYoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fcJ2ly650lNQkrPvs3tAUM2peUIMGlp51+KU/uzS15s/DuwcvZwPqUiHhplddmhTu
	 vm3yLI9g7kllAzgAS+6rGLTAItoRxSTbcDD6q9amvz+6Zo//SSl/ApuMnysewDSGEa
	 phrYxJXjfVx9xV+n09oxQoV9OHKaznZ7pgLqWYEVUyzLCYAywqaTeRuh49zvGH4Jb4
	 vDNcqOPt68yevH8VIWd9Fhb6KeEulC8K2y0DqCWBs1w/Ljbr1GMyJ9WQeYGqgNaURE
	 eZWTLBe0BlBmpgQdINKei1ugLuUaSCxJ95FT+6Ec5tZnyKTNv7gjINxgGc8MQsUcjO
	 4E2w8s4yBd5oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81DDC83F1D;
	Thu, 10 Jul 2025 10:50:53 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Jul 2025 12:50:33 +0200
Subject: [PATCH v7 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-hp-x14-x1p-v7-1-19c10c81713a@oldschoolsolutions.biz>
References: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
In-Reply-To: <20250710-hp-x14-x1p-v7-0-19c10c81713a@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752144651; l=1009;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=b5Nu+6oAHzlrV3PrXiQu9rljA/Ic/96pvaMC92XEkv4=;
 b=yR/ONXU+lhdJ5yMJYxCcaC5E8BXQpKX1ICKr4VML6ESCFfLM7b7H1jXULZ1nKz4hZNMFCMPfm
 N1KlWTQV3RcB2YFT04CCs5A5U9hEhpfuLZo+jMGBNmgjQWa1yT3B3Ix
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
add another variant:

hp,omnibook-x14-fe1 compatible to cqom,x1p42100

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..50b7b77dfe3e66f8fd57ccd5fd7e95a7e1ac2e35 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1159,6 +1159,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - hp,omnibook-x14-fe1
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



