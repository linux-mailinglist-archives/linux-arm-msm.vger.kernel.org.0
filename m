Return-Path: <linux-arm-msm+bounces-58143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE70AB90D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 22:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C68F16A153
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 20:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD4D29B76C;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6YCdxF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAAC27A461;
	Thu, 15 May 2025 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747341544; cv=none; b=j8tIGJTXN5oHXHRsCGqu9YJGDUzJmGF+xuhDzazvRC4W5HY9dHVOlOcMGHJG++3/xlbHLp4pAWwWEHbQBVqTmdZuUZFpZlqYy9HKLbsvL/xa7SQpIuhth0ftBOAeqtsvpN1qD71wgHdo0ks4zc7bLndsALuFDZcl+yx9qBkaSMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747341544; c=relaxed/simple;
	bh=UXinpe2LBizmTtJCPOmJXeA9o+GXrP88Ksg0kKE+oAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qKANxblTTKWPQvTdlWiutOzyaU9Zqsbt0POL42PKbHtp/xV8u3x2nRPVGsUqpTy0mld/+fT/fWHkz6fLbf98XuSJLsMTZ3S2NjVKpMi4tD6pYarik0Wf3hKPdHpYklsSZ5Jqm/EhHm9bNjxG/DI5OdnyJYChxUcxx+es5iG4WXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6YCdxF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9634C4CEEF;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747341543;
	bh=UXinpe2LBizmTtJCPOmJXeA9o+GXrP88Ksg0kKE+oAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W6YCdxF+fNmTcBjKEpXYXM4wAlLaOhzUMvd0AtlzmQ89z11kNDAplSqNN8yS17Kcf
	 9ITquWPPg7itgllpPchxZSF5nv7lg8tr0I25efvzxOYLz1flWhV8/63r7KbPbpaKni
	 XvxqPSxNqdpqA6kxr7V51hyagr1HwfzD9RkxJwJOWk+RCYymWSZAEZWgWsQ0fVPUbk
	 0kIRabuHcMbBs2tGGIFarE9B4bCr2kwSYAU+nzJvO+Wwy4d6uQun4XYC0HoOmaK+RZ
	 89XMC+OaW0R2YsEB/jFoApCGQuToNXEPWwLwax9jh7fQb41J2Tpi3GPZlBjRgXMcdu
	 0br1qb/bME0sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9830C3ABDD;
	Thu, 15 May 2025 20:39:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 15 May 2025 22:38:55 +0200
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Lenovo Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-tb16-dt-v1-1-dc5846a25c48@oldschoolsolutions.biz>
References: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
In-Reply-To: <20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747341542; l=979;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=TN9BFdQQ9DpzkCDMIeEV8p5iSAM7nvgIdQ75j09Yufw=;
 b=anN28te7ONtQoPfu7in0oDLURhFKKHzwKaBq2Yqy7y0k2rJqSoepiq4q+osZPQwlzCu9z2iQJ
 NNpj4IDLdX/DaXDGBIKndArqcg4NDEwfvMFJduz4fmsuCJygNNMMIsd
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a61c85a47e2e759c7c86f3bd49f8597fc5054929..42d22e2fb7817810742a15226807bd6a984e6acd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1152,8 +1152,10 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
+          - const: qcom,x1e80100
 
   # Board compatibles go above
 

-- 
2.48.1



