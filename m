Return-Path: <linux-arm-msm+bounces-4595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308A81201E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8296C1C20FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 20:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683155FEE6;
	Wed, 13 Dec 2023 20:40:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de [80.67.31.38])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CE9A3;
	Wed, 13 Dec 2023 12:40:40 -0800 (PST)
Received: from [92.206.191.209] (helo=note-book.lan)
	by smtprelay04.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <git@apitzsch.eu>)
	id 1rDVw2-0004Kq-1w;
	Wed, 13 Dec 2023 21:34:26 +0100
From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date: Wed, 13 Dec 2023 21:33:57 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Motorola Moto G 4G
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231213-peregrine-v1-1-5229e21bca3f@apitzsch.eu>
References: <20231213-peregrine-v1-0-5229e21bca3f@apitzsch.eu>
In-Reply-To: <20231213-peregrine-v1-0-5229e21bca3f@apitzsch.eu>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.12.4
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Level: *

Document the compatible for the MSM8926-based Motorola Moto G 4G smartphone.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c968412d86b8..91dc3205d09e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -185,6 +185,7 @@ properties:
           - enum:
               - microsoft,superman-lte
               - microsoft,tesla
+              - motorola,peregrine
           - const: qcom,msm8926
           - const: qcom,msm8226
 

-- 
2.43.0


