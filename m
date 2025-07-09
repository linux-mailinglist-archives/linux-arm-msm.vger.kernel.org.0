Return-Path: <linux-arm-msm+bounces-64283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB5AFF1C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 21:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0C31C80198
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 19:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6272024166B;
	Wed,  9 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLoUOZPG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362E223DDD;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752089230; cv=none; b=kQu8mm7l9EQ0C5V9IEnDtkQ1yUcMBglHjXj7hcWilMDpC1Ne2VZjH8dfir+dYne+vhQqHG+UkXPd6D4yO8BV93bh+r8KCwmOd0tshhZAOb5mD6YEsDbPWdn1A8z1VHsWSoofsDhZsdO0Z8P/vklyhC8VkOfcCV1ttqeJgLqzN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752089230; c=relaxed/simple;
	bh=TQ/2MaGxuBHcFFdbDMsi7aEDjibfjxWnEo8P20jRYoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YzbigQMurVA1d5dyyn1Z5cSzheNX+KDSYcj1PBx7G5Dsb9elu82FynQFh73dBw6EgmfW31ktTqNsWgI48f/846caa6OuwloTyhphP0zz/MGSm8sCm285Hx7A7wyEwaex9kjkMLPjagtvGKscz2GdE3b/cVowEMgTZNLscAzQzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLoUOZPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F3FC4CEF4;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752089229;
	bh=TQ/2MaGxuBHcFFdbDMsi7aEDjibfjxWnEo8P20jRYoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XLoUOZPGe0Y/YkH/GNxV7jCmCEOc//KcWXZSL4mpql5DUwGjz4/iBBL0xMVCCA8Gu
	 c1HHeRMRwMi5qmFoAu4wkVixZzsnyHYfewYOjHuUAdVdj5v4oe/0v8XM6bU3LD/1lK
	 /LdPmsWOKIO09OorcnK0eH0DnVQP9dd/TQIyK7tmP33laM74nwLezyLxdjS3E9XC1o
	 EBzF6n5MwofuD3MFOJbJMFZLT3gavNxBqYvIoiLx+oOcd8R2+RudVYLHA/JvjgbBBR
	 80VuglAake/wJpaliRZL8/x/0f/mdlwflB6pIcg4Bk6c2v17eBcSjgEWL3ckGH42AB
	 rb/Asm2B7kycA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAC4C83F0A;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 09 Jul 2025 21:26:52 +0200
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-hp-x14-x1p-v6-1-f45cc186a62d@oldschoolsolutions.biz>
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
In-Reply-To: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752089228; l=1009;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=b5Nu+6oAHzlrV3PrXiQu9rljA/Ic/96pvaMC92XEkv4=;
 b=HLSoYEvS0R/AvrOQSjzmSADBE0Jpb0CQFvIKbeboNH7LBVvKHdlFkm/AbRS+RPGs9b8u0pq+H
 Ag4VHo0NUkcCQfkSHRNpgbo9iw8+dNKSb9ubd62B5RFV4B8DCW3tJcs
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



