Return-Path: <linux-arm-msm+bounces-64101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506BAFD86D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 22:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EF687A8C65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 20:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F90723E342;
	Tue,  8 Jul 2025 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ukwqJ67s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D70F201034;
	Tue,  8 Jul 2025 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752006904; cv=none; b=HGEBYjjoYftBVc2uiHuGjZkteCYzw1GBNCra3iITeHm94slNVMFjRG1GwEThDeQ2Szjwgvq8bz9Z0jLBEEBiD888MORh6/AMlmG+rhp0cCZsE9DAT/l/j0amafLAtix5fUZUpe1wG8jbi3skFmmdBDvrW6OtBoe1O6tPa2N+C9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752006904; c=relaxed/simple;
	bh=AQ8PyWTuO7gfrqbD9nHKPmpnTsUP1jf40FpwDYNeDWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6dZE3NN6QzxiaiDRj+c5oAapy/ZM3lVHg6jc0pYRFeD+bv2QNYGvCQZeXz1B/U+fn4UxsYNapz8Y+YQLnFo3/qFmsp9b3PUF0Y9O2Eb7XxerlYQjUr9oh825hGwk37dwtOw1KH/yCPFV8Q5dPXGsbxzNgfgTvPfL3j4hJuthes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ukwqJ67s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2F2AC4CEF1;
	Tue,  8 Jul 2025 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752006903;
	bh=AQ8PyWTuO7gfrqbD9nHKPmpnTsUP1jf40FpwDYNeDWU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ukwqJ67suBdOEgHK50+7y7bULMYTLdIYS+Dbb/nw20t4lPKc8J5mUP7bQCFzpCzTv
	 ZA6Y4C2pd5hz6k/McsjRFtUWadLKJeLgP4b2hEcDwzdDNeDvgTfkQX4dBQJGMMFisT
	 DCaJDaprSIoMJg1+T7WO4s5xTU/2yZCEXcleLz5vNeObOfppZrzzClVzknPsn3bpYy
	 LE2sxs2AjPgzqnzoiexNkntETFUz/NKnliTiKY6zTlAjjKR9/12kP1gOTL8Ox0HM11
	 ki1+IWJX0SPNkEgSOQ/OZbTw57qI6RIeUo7R57FCYnvPT6FvjV0VOANUteYZUlPiIe
	 /TDaBzYBkABgg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD956C83F09;
	Tue,  8 Jul 2025 20:35:03 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 08 Jul 2025 22:34:06 +0200
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add HP Omnibook X14 AI
 X1P4200 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-hp-x14-x1p-v5-1-44c916efa973@oldschoolsolutions.biz>
References: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
In-Reply-To: <20250708-hp-x14-x1p-v5-0-44c916efa973@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752006901; l=942;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=QWy1ZM3z/vE1Jrc1XcPJy9BtRSoZ5QEk8VpRW+h62No=;
 b=YmHxjM/NllGOoUpox4JObsGbhmHge/fikzoUw3sqdE3lCeyr4LtXjZz0V4rJO95ZfzK9GDXlP
 RDASVXMDHP7A3L4kSi5nCN2DaWUn/ydc1MPb7aQDuv7AJD+dSBXySV5
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
add amother variant:

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



