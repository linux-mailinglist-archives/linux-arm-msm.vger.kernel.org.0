Return-Path: <linux-arm-msm+bounces-37195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F69BFE4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 07:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BC351F2297A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 06:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04934194A43;
	Thu,  7 Nov 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjUvGRDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6111193086;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730960210; cv=none; b=WG78uhLjvSARtwY2AtAIuxUsodvNCO03ptkxrRjXo0EvBLdDkEAhL5VFZVkWnw+R3wF4fnQcgbDHJYbKPhKLZWV0g25TnkwO0rAhhbFOTXd3BxQkkUVw1p6/77thqiie4vS4Yufn2/MxIk1hTxUH6Yz2SAF84qV3QentQxp86uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730960210; c=relaxed/simple;
	bh=DD7RFLdCMZNNtOVZLIXfFDpnyh3xp1KO+XUHMMcBjjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiHmezJv7WlMeZq+mRvzraZKNLE+d+G0qh7ZUEuC38bQwpnI8WI4f+OWvrbZWlvAIpiBvuduT9MgOiEe49XjFX/DYt1gKAXNEzHkVtMZCMKkWx5Isbtj9kRqQsDycfVUFBq7b1DZzKVyaFtZoaNAp2WK2Y2Kt8f9HkSgiVyFVK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjUvGRDp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69999C4CED2;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730960210;
	bh=DD7RFLdCMZNNtOVZLIXfFDpnyh3xp1KO+XUHMMcBjjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CjUvGRDpSy5wTOB3otDbTYHe44vVTsw5//O+PaZd3CElhSPwaKlW9cQpamLiqYLi0
	 BwUqOP/gi1KPIpwJ3e0ODMaI/ixloZcau8N8XMitalcWasc37e7R1hKL0/dRI8Ctom
	 VQhRQcL/fLINMJ/UXWxRCsXk42rD2BJvWlSunp/jxHhmGsACAVVTx6822rhEYghBup
	 5/mgZKOamw1dQ2doWiqMcgU+cAun58J4odfHmqHQ/rO9VWA+wuRO/stCa6vU/6klIy
	 Ul4CJrfm806ZeOpVOH699S/YaWX61PD/SiIDc6SZH69o+PPBEZ1Nz4xjn5oE6MHA2Z
	 bKAof6AQzBh7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597C6D5AE67;
	Thu,  7 Nov 2024 06:16:50 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 07 Nov 2024 07:16:47 +0100
Subject: [PATCH v8 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-jg-blackrock-for-upstream-v8-1-0305621f17f2@oldschoolsolutions.biz>
References: <20241107-jg-blackrock-for-upstream-v8-0-0305621f17f2@oldschoolsolutions.biz>
In-Reply-To: <20241107-jg-blackrock-for-upstream-v8-0-0305621f17f2@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 xlazom00@gmail.com, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730960208; l=1093;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=8d56I6gOmBZIOa1V8Yrv6LMwQ6+olEL7Kw4xohNPb3Y=;
 b=NqVyGIAbjW5XBHs1Lyaz86G1jcPGMACSTv7wz5ElaQIhO5i8qvbbVhbv6bfQNYjC0IRJew77c
 EQtgMXaB+K/ADhJ8KdteGyl0j80pwxPo2uOpAMTwa6DNxq5fbURtyrK
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9679fed7259b9..870f538b575f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -824,6 +824,7 @@ properties:
           - enum:
               - lenovo,thinkpad-x13s
               - microsoft,arcata
+              - microsoft,blackrock
               - qcom,sc8280xp-crd
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp

-- 
2.43.0



