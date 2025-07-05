Return-Path: <linux-arm-msm+bounces-63833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B62AFA1BC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 22:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCF11BC1C31
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 20:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49C021ADB9;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXCkeaVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8281249EB;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751747536; cv=none; b=ZpzBs2unubAvHcA05j+/Yh9WwzHRZJrSwQ4+NIDJfjjYoo+LnSeHSHJDH88mpDbvODEiN349JCJssoPUBvLWJA3AAlWMur4UgePYuxcwURGkVELR+XJsj4Orm8xVuyG1X59pGdhouqSby5FNQqDLQXkXMTgA9iQjtXiMc7DFr04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751747536; c=relaxed/simple;
	bh=+9bSehpukmlBKmZGbD7/WXkMzP1smwmfXzyZiL0+0xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dppWQ931X4HQe0ekuRBxhJn8hM101MiHd3/eoWBEiPIQHfkoGn1Qgqpb8eyXlDMgzZYJ6ZnrdSIe5T75J3XjPAQJPXDRuKUmV8kTCNqy7y40SEL4vwjGght4wTZj0Lc6wrGFdwKAtRHzS2JhNs7mo8KogiN1JqZhwHBozivDbdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXCkeaVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EEEDC4CEF0;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751747536;
	bh=+9bSehpukmlBKmZGbD7/WXkMzP1smwmfXzyZiL0+0xM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XXCkeaVu9hPCAlos13ur5RmkOIbKgG5g2G+PVhKXsLwW0FP/f5p0puPzdM0RXHod/
	 hrIKuHH1U+5fqjCb+BLxqvJuS6Zlq7Xi2bg/Tk5Kaz7oHlWJru8+qjzkRPw5mGpwZj
	 tmnWGbKJIY3QiOl4XurtuGiy12n108ws1ipSIWNJKCQETT9d8nyfay9D40mRll60Pa
	 0kjBDekNTmYD7xMvwlaXJg4MOpaz7+XGgmKIa+Xaj6mlskZwrE9Af+SWUZhQc3jzyx
	 RUM/gQQWGulWQL6Q26XxPXLmZLh/Yv76V1wH1JXQQDwiaIt3p9J4co/E6S/0EzjL+U
	 eATe5i/bB+pJA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39160C83030;
	Sat,  5 Jul 2025 20:32:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 05 Jul 2025 22:31:54 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI in
 SoC variants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-hp-x14-x1p-v4-1-1c351dbeaf18@oldschoolsolutions.biz>
References: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
In-Reply-To: <20250705-hp-x14-x1p-v4-0-1c351dbeaf18@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751747534; l=1005;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=pkh4LkVh9hJDmVs2/Xz1A5/7QQZjQJLMn+aQFFKE45g=;
 b=AlaeodUILYz40xmxLjDilhfgnzlLL9KRwL82Gz/GlTwqySv4HHuRU31gZn+y2EehcmI2vhRfG
 xLLDjjmZ4IqDqM25PYpltHJeKZ134TuocVvDra+Z2kF/08vRnvKqU9c
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

hp,omnibook-x14	compatible to qcom,x1e80100
hp,omnibook-x14-fe1 compatible to cqom,x1p42100

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



