Return-Path: <linux-arm-msm+bounces-59612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6081AC5B77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9F88A2FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187AA20E034;
	Tue, 27 May 2025 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="De3iS55A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF62F5E;
	Tue, 27 May 2025 20:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378426; cv=none; b=SQ1MN62m26kAIwzE2wJ/tZY/VT0s/q/8GJmEkde1PWzkhm6w0jcPGuFcIWV2Y8cun8Ud25UGD43xA3hfvYtNWYO6RIA4Crz1+Gc/Na+8noCTWroVOoMHiBDPgLbXENOVvMtZ+a3LTU+HrFpct22XO3zSPwrSIIWGpc8LzA72fTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378426; c=relaxed/simple;
	bh=OZGSFzDt9WhrXPK5JCxiNfHA9Ym5WHvuiEgfK7Q0v1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8MGNZZxMmv+4Zt9RiVrUyM0G9yF3eWcIc8aWH/40DpAf/zOdYgBfKGFO5wqUhaAnzFN1gRaxQBak+gwAn8j0xexyuZJDZ7p+77V3U3H0zyZATTqBEDOyJsJqL/4OikE3AJMmtI8MoKeaWNjcMLLee6VGAtgxfcGDz71FfIjlmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=De3iS55A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA04C4CEF1;
	Tue, 27 May 2025 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748378425;
	bh=OZGSFzDt9WhrXPK5JCxiNfHA9Ym5WHvuiEgfK7Q0v1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=De3iS55AV1K33Z7Cg96RhvIjCBqBDiYJIWcyCg2URtg1A1i2rQGnd07mwMDSIyMFI
	 VLlZ9AdMCQnIdGurR8wVvU4p+xLSuS0+rdSKMJEf+EyCYzTVeEWhSf+bURIiIKz3Sr
	 5DswnYcOT+R8RCg13Gm65DrKULk4qrhd3m4jX8lib7Fi932Z3nadldn6B/knqCbLvk
	 DaNdsnSXyzfdtFBBM406pPFeLQUNbPorhAcIpduQvWAobfbNtO/NN/0c3yx0M96OFx
	 By6eseQ8QBe3Xcu3kUq0A20PvlMGSLYdZhyn1RsHmZXOXKZmwzyRDE64gE8tmOy2xh
	 6CVkEaPgv/7/g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 27 May 2025 22:40:03 +0200
Subject: [PATCH v3 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-topic-4ln_dp_respin-v3-1-f9a0763ec289@oss.qualcomm.com>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748378414; l=1691;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PXkLGrcv3UJAZq8C/WK6VHbmWRh0H5KeqDACbLWooeY=;
 b=WcBiUfrusp5lQZsLehD4Bqyr+NkQempWA6f8W3GrAfmt9OhZOR6dvOeVMhOyG+80r3r2BVFyU
 lyxE3t6IvnHBfqNRqTT4TgbcPQJWKQq9XmfMkLWRH7iKt5bNr3a31I/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Neil Armstrong <neil.armstrong@linaro.org>

The QMP USB3/DP Combo PHY can work in 3 modes:
- DisplayPort Only
- USB3 Only
- USB3 + DisplayPort Combo mode

In order to switch between those modes, the PHY needs to receive
Type-C events, allow marking to the phy with the mode-switch
property in order to allow the PHY to Type-C events.

Reference usb-switch.yaml as a simpler way to allow the mode-switch
property instead of duplicating the property definition.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..692dbfe26e84778fcabae45ac9fa87195f796adb 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -72,10 +72,8 @@ properties:
     description:
       See include/dt-bindings/phy/phy-qcom-qmp.h
 
-  orientation-switch:
-    description:
-      Flag the PHY as possible handler of USB Type-C orientation switching
-    type: boolean
+  mode-switch: true
+  orientation-switch: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -105,6 +103,7 @@ required:
   - "#phy-cells"
 
 allOf:
+  - $ref: /schemas/usb/usb-switch.yaml#
   - if:
       properties:
         compatible:

-- 
2.49.0


