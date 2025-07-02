Return-Path: <linux-arm-msm+bounces-63466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9698AF63DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 23:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3256B4A3857
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 21:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F9723BD1F;
	Wed,  2 Jul 2025 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/IXW1zt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61E2376FF;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751491356; cv=none; b=aVNU0CJSazxFVRWopnV5lMuMwkPr6V7AyEEyC9y68uXz7wnIO+NOpjNJqI00Fs2WORe7oHzNjj1fVcCgdpg984Y1NDL90uUXXgR2Ch3Ri0wXntvUiS23t0KKpp+w12tsXfCeqa6JI3zqvwuqI0OzpF+a3EezgC5BMppX5KqOPek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751491356; c=relaxed/simple;
	bh=DXbM91CgEjCkxuAzzT5JKDW/blmIS/P9r/NYKp++kJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFG5SPdqCCesR4qgukpM5NE1Bt0hSJuqFwEkKulZdnPAHWAGXYsC/2iouLI9gYoSxvQbvWzSGo63YYjxRO+/TpTJpWCFHEo1kZMc7gOqDk6hCiG92lfPA8Ucn0x7ciEq8SEXFygy5rXHm7XTgcDMNpIi79iRxM0Sq7PTgjno5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/IXW1zt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3C36C4CEF0;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751491355;
	bh=DXbM91CgEjCkxuAzzT5JKDW/blmIS/P9r/NYKp++kJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N/IXW1zt5ymPSAUJvePA9w1vaLidLLErp/YSSYZGRn5zSid6xH/X1BO9hEowYuILq
	 GF/3bVx5tGPpP31l7lH74lXB+yNxEjwuvvbDg2WJYjE/AJDEofNgHge82RSypO2Z3F
	 neIjtXuTIaexDJxH6/EOxONIaIZsPGMvQN7T14rvJOabNvle7Z2fwyibirkUZz/gTY
	 yijngO+2P0Q22WYMhhLCU4aoqoYXYS+j84U/dbXKzNMede6+wU10lklSPiX03oagqB
	 AP+EMrphf19/eokQ04Byg/7/LH9pe6UTWLp6DJm4u5LryVHLFhLnPfG4R7qFXKn6oS
	 q9ldw+995wpTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8823DC77B7C;
	Wed,  2 Jul 2025 21:22:35 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 02 Jul 2025 23:22:33 +0200
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI in
 SoC variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-hp-x14-x1p-v2-1-af5b588d1979@oldschoolsolutions.biz>
References: <20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz>
In-Reply-To: <20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751491354; l=1368;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=Pol/dtLzZJ2i32WcUXC19GKh3aXInqtPj/XtwlKvYLI=;
 b=95OAF6xVDVaFKMTYZAv5R3ibPzrFJeIbHjrJvonLp4NFXo/rG8f9xzrLOFTOdY9oIxG3pTq7O
 /PFI9PXcgPmC9NqXJD6coGs4WfKSQRPrFtKGlrqlPGX8KpQqoiQeHsl
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

hp,omnibook-x14-fe0 compatible to qcom, x1e80100
hp,omnibook-x14-fe1 compatible to cqom, x1p42100

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



