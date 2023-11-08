Return-Path: <linux-arm-msm+bounces-153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8267E5126
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 08:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86ECB1C20DA8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 07:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E856D2FA;
	Wed,  8 Nov 2023 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jerS7h89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23501D2EA;
	Wed,  8 Nov 2023 07:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE67DC433CA;
	Wed,  8 Nov 2023 07:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699429015;
	bh=2pSJ5RtkTJUIWZtuMClF1MziyBCDcsQTg8O2HQnpmqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jerS7h89Mol+Jsq7kUd9TPJ3tspQI/+E70c4Xbwa70CxP0sLRXkFjQ3XLRqaxDAGc
	 4a98IwACWcBYmMVZuQlJi2opGEss6Adw+Ci2wg1V/68nF6TbrkidcxsZEZByj2D9bl
	 1W0V2uN99boiF9+BMm5UgPb4t/SUm2Cl+u0R+hdCZD4KR6P0y1BToQxFj6n544piaN
	 cjeDf5KBOOi5uZkkueYHFsYZ+uWTK8B7pxTx0+mKl6+mD/G8tNNn6opU5kJzNOLgMm
	 wD7GDEUB/DNX7vmzf23uDSaf/ywhhXELDIcRzrjY3yLHaq40bC4Qe0Efwd/z66gdc2
	 3ppPRaAXb5tUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F468C4167B;
	Wed,  8 Nov 2023 07:36:55 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date: Wed, 08 Nov 2023 15:36:35 +0800
Subject: [PATCH RESEND v7 2/3] dt-bindings: input: qcom,pm8xxx-vib: add new
 SPMI vibrator module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-pm8xxx-vibrator-v7-2-632c731d25a8@quicinc.com>
References: <20231108-pm8xxx-vibrator-v7-0-632c731d25a8@quicinc.com>
In-Reply-To: <20231108-pm8xxx-vibrator-v7-0-632c731d25a8@quicinc.com>
To: linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com, 
 quic_subbaram@quicinc.com, quic_kamalw@quicinc.com, jestar@qti.qualcomm.com, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699429013; l=1205;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=SwnogURbBf0S1flEa633BZvpsevy5nBnFae6M+y7bFo=;
 b=9rVUFUqm95tJAlvcp2hmpddaXqS8H57ZLXV+OdVJHAUmD6RwUm+THXTSNtFQkITRsWtIX+P6T
 ASimZa7PRlcAG13pW0TmJz+LODjM4kqnGncNXasgoaXyNAZ3rYlmZyL
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=hleIDz3Unk1zeiwwOnZUjoQVMMelRancDFXg927lNjI=
X-Endpoint-Received:
 by B4 Relay for quic_fenglinw@quicinc.com/20230725 with auth_id=68
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: <quic_fenglinw@quicinc.com>

From: Fenglin Wu <quic_fenglinw@quicinc.com>

Add compatible strings to support vibrator module inside PMI632,
PMI7250B, PM7325B, PM7550BA.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 .../devicetree/bindings/input/qcom,pm8xxx-vib.yaml       | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
index c8832cd0d7da..2025d6a5423e 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8058-vib
-      - qcom,pm8916-vib
-      - qcom,pm8921-vib
+    oneOf:
+      - enum:
+          - qcom,pm8058-vib
+          - qcom,pm8916-vib
+          - qcom,pm8921-vib
+          - qcom,pmi632-vib
+      - items:
+          - enum:
+              - qcom,pm7250b-vib
+              - qcom,pm7325b-vib
+              - qcom,pm7550ba-vib
+          - const: qcom,pmi632-vib
 
   reg:
     maxItems: 1

-- 
2.25.1


