Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0F1D57ECEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 11:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbiGWJJu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 05:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237080AbiGWJJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 05:09:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242C25FAEE
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bf9so11002835lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q8lBqyEx6SGHmbE+vfXkQ2O8ysfEUB+r1LK9cuMZdXY=;
        b=GwdeW4U3zgHBxbPUoxEy2XpZQCEGQQXWjy2QUugJTEAgH0DHOMOw/TyCqQ5U9tnnqN
         xm68fJUFWXVdAquAM0qzt4XkXB0qnMhKV6SMuYZC645GB1K3kWhGpQWmygZwKccRQW5D
         wy3DvkNKRofHjk3kSgpOUQNs9E4uHIXf6wmDfeJuhGOWgqAHsITNgKffajeEMyHXKI/I
         QQjY6pMtVjLI7nEzSijemiCGDirXQkY52zUYc7i4c2i4k0T5oJIIuxAMmk838CsjnvRe
         z03qKNBc33oQ3uO/3WWB5/E3jS8Q0sXANCNsZupZzJqU7s2NhS98kGoGdVYnUUMJaraH
         L9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q8lBqyEx6SGHmbE+vfXkQ2O8ysfEUB+r1LK9cuMZdXY=;
        b=Tuk2dbXpMQza4fSVpRa4Jzubr7qOgoBnOe2m+eGhaBTyXoLyXi6RAPC2aMQo2ITJaC
         y7ha51lYmirySYNGXi1JpihNxGzVYaHMaScq4+aBmc5tggz6xjOMG2MnrO3O00ZsgiJB
         RbPZeZWJm6Z+gj/AqC7ihOrwQVFcVF1rTXPXY0BzLN4fUFUBTikk/ga0yjmU2mLF/IPk
         844lUK5TXJUV4KOtti362XNPPOFNezk2dL+123UZNrDk36I0pYUUvP2FPFXabwBswuIi
         hGjBS/d+pkvWyHV1LuTp5wkhAb89W95O4ez6Wz8OzgfslVOcJK1Pv6H5vtl0bqBwCEpo
         x92w==
X-Gm-Message-State: AJIora8xGPw542YYvAQIi3oRsxGwUaWJfyFGMOu0vc5v/qPasPU/8l6I
        dn8sgur6fbT0UQvZwQLDEtNkeQ==
X-Google-Smtp-Source: AGRyM1uD0AFoTvurrkUJ7itQsHuNiQ6op58mdd1FtDNkisPuPdShrCsURia/YY01obutoN7dTmC40g==
X-Received: by 2002:a05:6512:b8e:b0:489:dbf4:e6f5 with SMTP id b14-20020a0565120b8e00b00489dbf4e6f5mr1606424lfv.612.1658567385269;
        Sat, 23 Jul 2022 02:09:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s29-20020a05651c049d00b0025d6a975c47sm1537636ljc.94.2022.07.23.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 02:09:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] dt-bindings: arm: qcom: merge simple platform definitions
Date:   Sat, 23 Jul 2022 12:09:41 +0300
Message-Id: <20220723090942.1637676-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Merge most existing Qualcomm platform definitions, which consist of
empty schema plus single SoC string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 188 ++++--------------
 1 file changed, 39 insertions(+), 149 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d4d945a43178..809d3de18194 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -108,66 +108,56 @@ properties:
     oneOf:
       - items:
           - {}
-          - const: qcom,apq8016
-
-      - items:
-          - {}
-          - const: qcom,apq8026
-
-      - items:
-          - {}
-          - const: qcom,apq8064
-
-      - items:
-          - {}
-          - const: qcom,apq8074
-
-      - items:
-          - {}
-          - const: qcom,msm8660
-
-      - items:
-          - {}
-          - const: qcom,apq8084
-
-      - items:
-          - {}
-          - const: qcom,msm8226
-
-      - items:
-          - {}
-          - const: qcom,msm8960
-
-      - items:
-          - {}
-          - const: qcom,msm8974
+          - enum:
+              - qcom,apq8016
+              - qcom,apq8026
+              - qcom,apq8064
+              - qcom,apq8074
+              - qcom,apq8084
+              - qcom,apq8094
+              - qcom,ipq4019
+              - qcom,ipq6018
+              - qcom,ipq8064
+              - qcom,ipq8074
+              - qcom,msm8226
+              - qcom,msm8660
+              - qcom,msm8916
+              - qcom,msm8960
+              - qcom,msm8974
+              - qcom,msm8992
+              - qcom,msm8994
+              - qcom,msm8996
+              - qcom,msm8998
+              - qcom,sa8155p
+              - qcom,sa8540p
+              - qcom,sc8180x
+              - qcom,sc8280xp
+              - qcom,sda660
+              - qcom,sdm630
+              - qcom,sdm632
+              - qcom,sdm636
+              - qcom,sdm660
+              - qcom,sdm845
+              - qcom,sdx55
+              - qcom,sdx65
+              - qcom,sm6125
+              - qcom,sm6350
+              - qcom,sm7225
+              - qcom,sm8150
+              - qcom,sm8250
+              - qcom,sm8350
+              - qcom,sm8450
 
       - items:
           - const: qcom,msm8916-mtp
           - const: qcom,msm8916-mtp/1
           - const: qcom,msm8916
 
-      - items:
-          - {}
-          - const: qcom,msm8916
-
       - items:
           - const: longcheer,l8150
           - const: qcom,msm8916-v1-qrd/9-v1
           - const: qcom,msm8916
 
-      - items:
-          - {}
-          - const: qcom,msm8992
-
-      - items:
-          - {}
-          - const: qcom,apq8094
-
-      - items:
-          - {}
-          - const: qcom,msm8994
-
       - items:
           - enum:
               - arrow,apq8096-db820c
@@ -175,26 +165,6 @@ properties:
           - const: qcom,apq8096-sbc
           - const: qcom,apq8096
 
-      - items:
-          - {}
-          - const: qcom,msm8996
-
-      - items:
-          - {}
-          - const: qcom,msm8998
-
-      - items:
-          - {}
-          - const: qcom,ipq4019
-
-      - items:
-          - {}
-          - const: qcom,ipq8064
-
-      - items:
-          - {}
-          - const: qcom,ipq8074
-
       - description: Qualcomm Technologies, Inc. SC7180 IDP
         items:
           - enum:
@@ -508,91 +478,11 @@ properties:
           - const: google,villager
           - const: qcom,sc7280
 
-      - items:
-          - {}
-          - const: qcom,sc8180x
-
-      - items:
-          - {}
-          - const: qcom,sc8280xp
-
-      - items:
-          - {}
-          - const: qcom,sdm630
-
-      - items:
-          - {}
-          - const: qcom,sda660
-
-      - items:
-          - {}
-          - const: qcom,sdm632
-
-      - items:
-          - {}
-          - const: qcom,sdm636
-
-      - items:
-          - {}
-          - const: qcom,sdm660
-
-      - items:
-          - {}
-          - const: qcom,sdx55
-
-      - items:
-          - {}
-          - const: qcom,sdx65
-
-      - items:
-          - {}
-          - const: qcom,ipq6018
-
       - items:
           - {}
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
-      - items:
-          - {}
-          - const: qcom,sa8155p
-
-      - items:
-          - {}
-          - const: qcom,sa8540p
-
-      - items:
-          - {}
-          - const: qcom,sdm845
-
-      - items:
-          - {}
-          - const: qcom,sm6125
-
-      - items:
-          - {}
-          - const: qcom,sm6350
-
-      - items:
-          - {}
-          - const: qcom,sm7225
-
-      - items:
-          - {}
-          - const: qcom,sm8150
-
-      - items:
-          - {}
-          - const: qcom,sm8250
-
-      - items:
-          - {}
-          - const: qcom,sm8350
-
-      - items:
-          - {}
-          - const: qcom,sm8450
-
 additionalProperties: true
 
 ...
-- 
2.35.1

