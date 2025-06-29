Return-Path: <linux-arm-msm+bounces-62983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784DAECF10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 19:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C63993ADE10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 17:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88018236A7C;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXwYc5W6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548EC1F542A;
	Sun, 29 Jun 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751217925; cv=none; b=SEFlLpls+WpwMft8wXWaB8Ajhh8EcvaSF8Ni8xxpKdOYRd+hxWUmYbpSZVHHzZO+Lc3/3OLqGDwa0508aHJoJkexCWcjnONGrytjmYn3jX7xepx7lvZbuzDZqAuYYi1US/+3PaBhvMyPnGC0wmCkcnhFprJAD8kIAQBgsJ6PVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751217925; c=relaxed/simple;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOqes8coq4WnhTf45L86O1joNxmklJxHbrTL334dr2sbQ/iXAEe1+puw+R8/7gQvfhUHZRwL2MErXDqqEim5PQOCVWvEQD6A6NrQ2r7TtkCmleXudMsEBPNxVdNFOSDMry4P4RgrD6VnGvUItwmumdNbMPDuAz580J2Uhha1ES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXwYc5W6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3D16C4CEEF;
	Sun, 29 Jun 2025 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751217925;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aXwYc5W6qMVJbXTGKXi/JcQFdA85T7ZX08wjQ7hoPg1q40Jp0dVomdRr8231Z/90V
	 OsdkepVa4JG7Vk00dI77+ODmWMW7bnUbDqw4fcIwb20Vijd8lLlnCYeIkal4PezwVv
	 lSQOSrP+h4ps/97GLIFnHEEfIVjf6zJmXzkzKS/wrb+ab7t4idYhSn83Q9f+KP+v73
	 vUWpWzgAqfiGKG6K2N1o3YFIzRWpFKI/VpwGHR29S3kgzLaSTDBuED3ODjC30rwbI/
	 zzm023D2ASh8G1kmm62/3WSXwkBKEdFe3ZgucS42hVaELIEOYZbz7JvK6ILxTlfHOi
	 e6pJQERQhQQ0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C2C7EE39;
	Sun, 29 Jun 2025 17:25:24 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 29 Jun 2025 19:25:22 +0200
Subject: [PATCH v7 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-tb16-dt-v7-1-35276341338f@oldschoolsolutions.biz>
References: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
In-Reply-To: <20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751217923; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pTpFlr2JNOBM1+TcC8lKJt5CSizsc8tw4WUtA7IPpGs=;
 b=PQ3GADMyrtmQ2xSYalVSE+mGOsMeuO13rx1Q0L4AH+XJAh3MgjjRJgceEkeeXBePKURHWHEpM
 SnU6RFYAQiLAcITXLtnUW/rXu2sfAR+gdULtdkMZAdKJXSFuIqmMzmj
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.

[1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b35565808ed27cd8354b9a342545c4a98ed6..98f8ae80feccf23b79ba7e7b04d4f6a291e37a44 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1159,6 +1159,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



