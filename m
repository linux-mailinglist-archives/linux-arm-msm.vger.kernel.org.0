Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E138029DC6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 01:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388584AbgJ2AaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 20:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgJ2A2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 20:28:44 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D13ABC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:42 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a200so854692pfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 17:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=akb3sFyjPHBbZX4M7aYx39aG9OxmM1r+z59p+g0m3bc=;
        b=Zb0KIao1cRRj4nQdQHR9k+stnfUDsVd78vlm+lB8nUirhOWM/EwMvhclPbv6SOJUR4
         wF6fVDaNtuejzlqvPyQsTBEHNrEBZWF6Yi5NyiW5EIzuWhmM5q4q1VSWid1WwRo+T00t
         Z1sy7fiplEvLj5CAJbWv/xRccfQgeRrQKaC0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=akb3sFyjPHBbZX4M7aYx39aG9OxmM1r+z59p+g0m3bc=;
        b=uROv20zciDAOjvThl0GFPTxIsqko/G9NkYO+2/7QiEB6cKXoFQWpjx+c/z3fx4xiXZ
         Ujh/z50nEc7oeqHGtWJ0hhgrNobR6X0BjF2IWJ7Ola4Gau2ZFEtSgzkePSfkvCMRm/9d
         FB0tiMXdd8X0sG4ND8G8vnEsKF4bNXR4FPKnP4Y4GqdOptKCrsVkwoqpE3wKfMcyoU56
         se6FuhFhmaNFpJJz3XbZA/w3xrhpqoz9DXhcB6UztGk9WAevynBkZNg8xSY5jLLhQQL7
         fvsU2gkroJXwFHq106f2CmFZODkP+Z58KHmPNhsCvmLVjZrbG0lw+dDsKu2eMsjqNTV1
         v8aA==
X-Gm-Message-State: AOAM532IS8RDueLdlyg9q2qEuN3dslRg7dj6syhmwDstIRvwwk0f2ymK
        5YvoUxEWStHfHEvDCjxrQqW5aA==
X-Google-Smtp-Source: ABdhPJxi6c7TfcFNM60BApDm83Jqp3fP1uFsafWgoIelrna6lLSSvuHO6GU9gVpU882QcxPJuN0olw==
X-Received: by 2002:a17:90a:3f10:: with SMTP id l16mr1465131pjc.110.1603931322399;
        Wed, 28 Oct 2020 17:28:42 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:250:b6ff:fee1:7d4c])
        by smtp.gmail.com with ESMTPSA id u13sm743625pfl.162.2020.10.28.17.28.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 28 Oct 2020 17:28:41 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: nvmem: Add soc qfprom compatible strings
Date:   Wed, 28 Oct 2020 17:28:24 -0700
Message-Id: <20201028172737.v3.1.I8b447ca96abfbef5f298d77350e6c9d1d18d00f6@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029002827.1729915-1-evgreen@chromium.org>
References: <20201029002827.1729915-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SoC-specific compatible strings so that data can be attached
to it in the driver.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
 - Fixed example (Doug and rob-bot)

Changes in v2:
 - Add other soc compatible strings (Doug)
 - Fix compatible string definition (Doug)

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 1a18b6bab35e7..992777c90a0bf 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -14,7 +14,18 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,qfprom
+    items:
+      - enum:
+          - qcom,apq8064-qfprom
+          - qcom,apq8084-qfprom
+          - qcom,msm8974-qfprom
+          - qcom,msm8916-qfprom
+          - qcom,msm8996-qfprom
+          - qcom,msm8998-qfprom
+          - qcom,qcs404-qfprom
+          - qcom,sc7180-qfprom
+          - qcom,sdm845-qfprom
+      - const: qcom,qfprom
 
   reg:
     # If the QFPROM is read-only OS image then only the corrected region
@@ -60,7 +71,7 @@ examples:
       #size-cells = <2>;
 
       efuse@784000 {
-        compatible = "qcom,qfprom";
+        compatible = "qcom,sc7180-qfprom", "qcom,qfprom";
         reg = <0 0x00784000 0 0x8ff>,
               <0 0x00780000 0 0x7a0>,
               <0 0x00782000 0 0x100>,
@@ -85,7 +96,7 @@ examples:
       #size-cells = <2>;
 
       efuse@784000 {
-        compatible = "qcom,qfprom";
+        compatible = "qcom,sdm845-qfprom", "qcom,qfprom";
         reg = <0 0x00784000 0 0x8ff>;
         #address-cells = <1>;
         #size-cells = <1>;
-- 
2.26.2

