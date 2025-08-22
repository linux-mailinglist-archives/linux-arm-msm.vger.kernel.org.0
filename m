Return-Path: <linux-arm-msm+bounces-70249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE797B30F51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11DD81CE4D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34F22E6104;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9SVHYJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFB2E5B04;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845057; cv=none; b=f/S6fu/FcEWfQFMIOJnZumSZak51cVgF0TK1Rofp8if6cKt+yhJlEsQn7Yl448EfwpUFKax1+2vaChbEUUNaHQhkE8wIUi+8W9RZA2abCQf83X3IXh6YPM+tsRagWKA5biEQFQKs6JxNKZN3pPdDyMIVZffBb6HxHneZadhfinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845057; c=relaxed/simple;
	bh=+G42y066SWtg+n/148FHRfa9US8aatQp3K1VDW7lbtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6UUwZa4qKZz13jVwmne6zwtalrKjBHqA0HID3YsgP3rT4X148e/VVOjriK/z/GApHgHsOmanIw4zSAJxgm1tBzHsmejtrzYplV2qeFrAOyaJnsXdCsiHyVtLNih2ZOcSSuHy0Xk0C0D1gXZACFYqAMDoXORxXRb2rO4I6k9heM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9SVHYJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 366A8C113D0;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755845057;
	bh=+G42y066SWtg+n/148FHRfa9US8aatQp3K1VDW7lbtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k9SVHYJK/Y5tXzXxYtxVlfgJPyZa0T0h+63rYt7MSZSuu8PpYxHSNNwAI+eTjz2GY
	 71wl9PFXOC421HwBcQZKgf68KUFfOgQoO+XaTeQDcjS3mvjO5McmVHkvtQa4DWhLM7
	 k8dvGhjwgQXUqtIFl/6BmLu4N8YrhUazL/ahN97lF0sY52JIExzSHdmcKO8oazTuph
	 g+oa7CgwMPsPU3B0aHSkytrF9fVfSZAn7o/iZlG5cIC5junAvSZlyTRTpwhXVDEc3s
	 k6OLt9AjxkXCMp82jj2KdX3qvUU89MQz5vdjVhh2XLn/8/bVOgh7hH1eqQNVaaGX+V
	 HdwfeXZQSkFgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D08CA0EEB;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 22 Aug 2025 08:44:10 +0200
Subject: [PATCH v12 1/3] dt-bindings: arm: qcom: Add Lenovo TB16 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-tb16-dt-v12-1-bab6c2986351@oldschoolsolutions.biz>
References: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
In-Reply-To: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755845055; l=952;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=thk+MxsHNEPHwSzWHQ050lhc842Rldx6y6UuBNa55OY=;
 b=w7rhyqRsRcbSqaVGGnOzu2y2mlXLISTbu8/EOwiw0799z6rSsKvwwcVwBfiKYuEUNTogh66hW
 G4359EFhf/gB5tojAUfdVbOJ+/VMK5VMqAWcdGgiIUSrcqsD6et7z+W
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
index 55e5eb75af8905c93e6604d54d516585f70a8e29..55113096dde567dddec419e67b916a0bff8c318e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1072,6 +1072,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa
+              - lenovo,thinkbook-16
               - qcom,x1p42100-crd
           - const: qcom,x1p42100
 

-- 
2.48.1



