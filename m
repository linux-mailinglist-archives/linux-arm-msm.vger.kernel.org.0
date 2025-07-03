Return-Path: <linux-arm-msm+bounces-63480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE2AF6AF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACBB188F8C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 06:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135B9295DA9;
	Thu,  3 Jul 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OESMpcMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433C28DB6C;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525956; cv=none; b=CF8lO+EslgnCTiJ7ufdm3Xhn/aPLbM3j9e1N02LRyq/ggz6WK6aFRFqKaXCCZsDsBCFU6xC3SF8w4jduz+KlrgtwPgIQKd4Rm32OhTLGnsb9iJ3di4PXsmx39OmMvIJPqAcgFFKmy2ni2iG3wQ4pYDXHfzxcgJDo0jObqx49ctM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525956; c=relaxed/simple;
	bh=9yV/GBep9orpKc0yl52y3P4ZzjCjzkQ8+V4Z/2Gg+1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvPp5jW76S+hHuOVF5GZ2w2LyYRyX5eknWHgZnpfTaTvUYQK2WBOOAbqp5JrehUFV6/AX3mwik55Jbev+qln76mMMVSW8HViW11/5fo4ns0d9bRPgMQ7qGcHAfMTj4nhMOISiAoTRnag+UJuiUyb1ujbYvpPDuI1V9HlfeMIUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OESMpcMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A92BC4CEEB;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751525956;
	bh=9yV/GBep9orpKc0yl52y3P4ZzjCjzkQ8+V4Z/2Gg+1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OESMpcMCCLBcBhUEfW58LZdOJCvtrE1LX6+AtbqdldfbNiAHNKSlNsULA8iJR9nbL
	 gbP98EtHPYP+t7dbqQZ/h/czzkTmVnDmHrQuT+RfN4FYK4ErvLlvcnrAwMlnbIkoaR
	 41Pn7NpqptwwAimNq2wveuK0l+qC5QrEXsEaN832BIsd2Ddun1X1ql0H3Fo6O8ATDX
	 yK4BpftZ2P6EcSp5eNEjQjjDX/T1Nfuc60HQt2qzzP+F7ZfbtlB97k5iS7/CaP47pF
	 6VxRJBKHYOEDzWrW/Rj2albk4eNRiwx7+EGZYTbTSj8Qpqqp0k+r/UVx+ayaO1QAwA
	 8bYTL1SKAx2/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E0BC83030;
	Thu,  3 Jul 2025 06:59:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 03 Jul 2025 08:59:11 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI in
 SoC variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-hp-x14-x1p-v3-1-affe103b4356@oldschoolsolutions.biz>
References: <20250703-hp-x14-x1p-v3-0-affe103b4356@oldschoolsolutions.biz>
In-Reply-To: <20250703-hp-x14-x1p-v3-0-affe103b4356@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751525956; l=1366;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=I+3NVCg9CDtAf7okEizfDiPl0TNiRn1YyOCbDEI5Cxk=;
 b=y96ghSpgyuSxHVblawfAr4glv4Iwdrv9fkVMVQ5pnKuPwO4sXfKqsnFlswpRuOl/uNp5ZXJ9v
 glgDwZRrCokB0XrXahPoDGKfbH1jbBuqQe0UdFlep1uk3BUh4ZznaWb
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
split the model strings in 2 variants:

hp,omnibook-x14-fe0 compatible to qcom,x1e80100
hp,omnibook-x14-fe1 compatible to cqom,x1p42100

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..d114b7ae4fa7b162a83a152d9bf8d3fc2d74750a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1148,7 +1148,7 @@ properties:
               - asus,zenbook-a14-ux3407ra
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
-              - hp,omnibook-x14
+              - hp,omnibook-x14-fe0
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15
@@ -1159,6 +1159,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - hp,omnibook-x14-fe1
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



