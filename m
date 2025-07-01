Return-Path: <linux-arm-msm+bounces-63266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA9AF016C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DF61C22EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB4E27EFF1;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6Pqp4X1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC127E058;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389358; cv=none; b=aeF/ywyDVkUXxG24YE85RjFUA1BA+uQ7NV739L7FKgxyn02iLWZu6bPLB7tV88V2Ghg6rtzLajMTsL5ySPF5YyCFXLVx0UkA8a9JTmFiKf2mEEd/GbirvDd1VLlObZu7vReuYNT+ow0b10jk+furD/BO45/2O4G/J+LdmjkYmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389358; c=relaxed/simple;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY0NygXwGY53jGAZCym75BGQiztwc+S2Oe8VB8CZswNgGb5M5hzctMMjoNcfpLSJrc7UkQdhMt677Vw667xiB/kCtQ7ZVrIf9HSXVRZbl6AH+Qk8pEJFR0PQ2tjqv6Kbacug7v/MVVBwjCGZmEiSSwbObc+xa0BHbSQTnZgWgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6Pqp4X1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52886C4CEEF;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389358;
	bh=7J6wVBbwJYCDrqwFDOobTUHM1JmxFG+rhiy57fv8764=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6Pqp4X1rIcvLxygvmpxPiq2I/vOWAUpBILrxa16hUKxXJt0zz91jHmKCzTxCylUN
	 GoccERVzD/RzQYse93YYqGqO0nu+dfNdxrJpkO4Ryi+zhN+sg2XChm519RVCTP8ZYD
	 wW+9UXqYGCphZkqH+7z/l9QceQdO2w5BeUK0w3EBGDVyz7vEQIiPIKwgBai7Y29lHd
	 VvHsBW/c7FHSsX2wx7MByroxBNguNTznqyNoRK6MCWcTdyv2D++gVuYAIoORAHE7Ei
	 zoWzeO/4qKzbjE6ennS+WBSRGHm7BFCjekIdLpOt8Rc5WMmAz1wmC8DeECqt1X2P4n
	 ama5WrrW/m/wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1FAC7EE30;
	Tue,  1 Jul 2025 17:02:38 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 01 Jul 2025 19:02:35 +0200
Subject: [PATCH v9 1/4] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-tb16-dt-v9-1-7d9e280837b5@oldschoolsolutions.biz>
References: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
In-Reply-To: <20250701-tb16-dt-v9-0-7d9e280837b5@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751389356; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pTpFlr2JNOBM1+TcC8lKJt5CSizsc8tw4WUtA7IPpGs=;
 b=42K1Zm1SbUSKYvK5KbuPtzc+HAtK8Wb3HT2pu6D24+0ULHPF7MHzwvODMJbiqjJma0VrbYVxk
 1EUUcBQCqGoDdijzWINu2KHEJRwNAmn+pOMp3hL0t0AZkD+byAXpgpD
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



