Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9176D4200D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Oct 2021 10:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhJCIfP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Oct 2021 04:35:15 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37988 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhJCId5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:57 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id CBAD1C9118;
        Sun,  3 Oct 2021 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249929; bh=RJQLF6oLD/LA6HJd8wF9mMr/P17NktfBH/lE5wJ42IE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=uatboYMRq7/13F9IO4U1y0wSY0pUrk4a0DkKGisupMOwCeWFkGml4GSNQmZ+omHgn
         SOi2EnQK7prA2lPwDZb5bgDe4LguRC2MVF3z8XhO+NuX1kITX1W0jbvcc7snn+W1ij
         evfYr/K/hlyKD+3Q1/IS350ZyLBes8lTMdegiK+c=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] dt-bindings: arm: qcom: Document sm7225 and fairphone,fp4 board
Date:   Sun,  3 Oct 2021 10:31:32 +0200
Message-Id: <20211003083141.613509-10-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003083141.613509-1-luca@z3ntu.xyz>
References: <20211003083141.613509-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding documentation for Fairphone 4 smartphone which is based on
Snapdragon 750G (sm7225).

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 880ddafc634e..540dfafa3418 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -44,6 +44,7 @@ description: |
         sdm660
         sdm845
         sdx55
+        sm7225
         sm8150
         sm8250
         sm8350
@@ -217,6 +218,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - fairphone,fp4
+          - const: qcom,sm7225
+
       - items:
           - enum:
               - qcom,sm8150-mtp
-- 
2.33.0

