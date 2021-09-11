Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E7C407ADF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Sep 2021 01:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhIKX31 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 19:29:27 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56504 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234577AbhIKX3X (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 19:29:23 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 403EBCB1FE;
        Sat, 11 Sep 2021 23:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1631402889; bh=c732++tHiJDMJoYkrOhyilXiLDF0isB13YAKanZXZdE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=N6ivacqq25+ItskrFKCQ50g2lyXJem031ab4hHnzHZ7ZKyEESPb6HNIq/VC4mnZtd
         9NEudKZ0c2uqewhiKLEomaTcIHiD8Dznbj4W69sjS2ipDR4Hc4Cf+uERLtry7c3Vi0
         olnEd+5EXiKi1uYjguaVe8brP6Csd0MZQw+aFoo0=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, bartosz.dudziak@snejp.pl,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: arm: qcom: Document APQ8026 SoC binding
Date:   Sun, 12 Sep 2021 01:27:01 +0200
Message-Id: <20210911232707.259615-8-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911232707.259615-1-luca@z3ntu.xyz>
References: <20210911232707.259615-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the APQ8026 (based on MSM8226) SoC device-tree binding and the
LG G Watch R.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 880ddafc634e..da44688133af 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -25,6 +25,7 @@ description: |
   The 'SoC' element must be one of the following strings:
 
         apq8016
+        apq8026
         apq8074
         apq8084
         apq8096
@@ -92,6 +93,11 @@ properties:
               - qcom,apq8016-sbc
           - const: qcom,apq8016
 
+      - items:
+          - enum:
+              - lge,lenok
+          - const: qcom,apq8026
+
       - items:
           - enum:
               - qcom,apq8064-cm-qs600
-- 
2.33.0

