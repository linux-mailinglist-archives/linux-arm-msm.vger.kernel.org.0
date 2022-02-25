Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8695B4C3CAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237233AbiBYDxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236000AbiBYDwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:52:49 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8ED186219
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:52:18 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so4779055ooi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2ttFE4UXWwKSdqHtV1QEdoVt4O2JyRTcbi9yz+bnns=;
        b=DqAFm/wJ8xtMDnKPPcP6b/3p5YUaxh7aYMcRRoG45NM43yM6VJKp97BOg3NK2gcnWV
         OSYkZTExDRQTGMn5KqAXrQ4qe5ChUm7XBZ4Yc/yxx15yG6hSfxvf1/7VemUBwzSzjAHQ
         B2q4UE3BU4fTUcD1/AjHMdSpTQ/Kr5E36ZVf0tezGLPL3vmmze+4bFQUFDSMEnNrXDV+
         PNzlN1mcOV8HEAEVbGeM0Ei2Y0BXC3Pf1u/6lZK5K6mX7Fe8r1MXHysMKU4hpBQhCjN2
         /B8A6/8x6rOlKXqKC5sRFEJsBwI617Kf/a99pdQ3yJN0L1JeE6Yrqxu0CXdoXHG8BqiE
         6nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2ttFE4UXWwKSdqHtV1QEdoVt4O2JyRTcbi9yz+bnns=;
        b=t1HUpWzAo7CzqKPsK0ovo49P+yov6eSulSxys2H5NKNaWdq1jlSlaAQhbyoPe0jaM/
         ypv/HnBRcWHe9dcdIREgXpbxSoqzdsTWPIZbKzmoWM7P3Zz6IQK5C6MgkJpRh4opd1df
         24A2CIe2u6exwdl8imBKGVUG/JGIRUHX3imE+oTgev38oImCjv0KEX5Hue5PQDuUwWfN
         XDW1aZomWzPgmCF7wUXxshoh5FyxpCLJD8h+HUubiyj2TDOJZ5aAhnn9a1gn1H6+QtCI
         Le1xncbYJjnr1fCUashSqx4beMtBUH/ktgnCXYbZ48abIK8LL280vmZyxOEt4hz/wuF3
         NBQQ==
X-Gm-Message-State: AOAM530qSXPetRuAfEs7tBnCV+j5VSdxnTjkpjqEyBYeHC0V72GniMrt
        VHhrDIh7y9pl+chjiJgwY7ZEPQ==
X-Google-Smtp-Source: ABdhPJzUvJjzaEsaanLyTn8buXuntkLSkvCcOLn0F0JsaSa5u6wnCVFX3BpuvaM3uYtH7IVW5zuoYg==
X-Received: by 2002:a05:6870:d90d:b0:d2:a1f4:1112 with SMTP id gq13-20020a056870d90d00b000d2a1f41112mr606354oab.27.1645761137625;
        Thu, 24 Feb 2022 19:52:17 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v7-20020a4aa507000000b0031c01a4ef37sm512850ook.32.2022.02.24.19.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:52:16 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: arm: qcom: Document sa8540p, sc8180x and sc8280xp
Date:   Thu, 24 Feb 2022 19:54:15 -0800
Message-Id: <20220225035415.2294821-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatibles for the sa8540p automotive, as well as sc8180x and
sc8280xp compute platforms. Also add compatibles for the ADP devboard,
the Lenovo Flex 5G, Microsoft Surface Pro X and the sc8280xp QRD.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- 'q' comes after 'm' in the alphabet

 .../devicetree/bindings/arm/qcom.yaml         | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index e8b1606bc849..d7bd6affbff7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,8 +39,11 @@ description: |
         msm8994
         msm8996
         sa8155p
+        sa8540p
         sc7180
         sc7280
+        sc8180x
+        sc8280xp
         sdm630
         sdm660
         sdm845
@@ -224,6 +227,18 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - lenovo,flex-5g
+              - microsoft,surface-prox
+              - qcom,sc8180x-primus
+          - const: qcom,sc8180x
+
+      - items:
+          - enum:
+              - qcom,sc8280xp-qrd
+          - const: qcom,sc8280xp
+
       - items:
           - enum:
               - xiaomi,lavender
@@ -252,6 +267,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8540p-adp
+          - const: qcom,sa8540p
+
       - items:
           - enum:
               - fairphone,fp4
-- 
2.33.1

