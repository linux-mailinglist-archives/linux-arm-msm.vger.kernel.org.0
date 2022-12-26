Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97D3655FBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiLZEWC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbiLZEV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:21:59 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF102641
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:58 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o6so14703573lfi.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GhZ0FxfbIH4v+WIvD3ap4QIpyJbfOnvuvRt1i73wJk=;
        b=q23UOK9rcJEw6EbkKbpPAexJCjdG39R4jB+sOnwU/ySIcq4XAjm60ou+pHCDL13duX
         3JN6nhB+Ng6iZ5mGrg+dezc5bs9X6grVB7z5c0vYHCu4RFcUCZ56zKgO+lGSA0s3ucek
         VTWjdz3wDRFdJEnEPJBAkhqWAlBM5lzeUHvYREFmN+pQA1SV3G/x5CVjWRckhjOb7yvn
         9RPHdhI2M3NwT8e3BhlcmUmDCIKfSZaXJUv3MXDArkcBxKA0f4svt9/ipAAMAY0Za5ev
         ba8AN96MBZmXgXe40BEbdn68bnrW9Jv5guSj6sD6B/VB5cDXKzbJC32l0Z8k7B2L+179
         I6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GhZ0FxfbIH4v+WIvD3ap4QIpyJbfOnvuvRt1i73wJk=;
        b=xBG7XZHzHbY3hudPXEEGI/7W19RD/3AoUFFZ8mqyPrV/VmxFPKUXzFPfvajiP7HZVP
         O6zl3WjpruP/e0JSNy8x5yU68hNWEOW889bhCovlGUBxoFldNvMl7XWlt9GKPWNPqb8z
         El3OMit1SrNrzsknLB6/IT5e0e2tM7Zb1hyV2N9ZzEhS2R8vxmfUF3NmpXBeX5nU9Hyx
         jc9KfQFKFrp111PgCdOOg2J8xBcvJR1L9Lpi2Ijkw0VnRXb7pEOKDHJOVoWr+OCfrvKK
         MKhkcLcLdMJZn+OTwo90+4Nkyw2sTcCE+vEElTta1OwiV++1GCE/QgTmWiYDgqixj1U6
         h1Uw==
X-Gm-Message-State: AFqh2krwBGa6wbguNOwMnO75pUUnfoOm5QvdjmIncRgZAXsV11suHSPN
        sjhrds9YR5gGwlHP+qxzh5WZyg==
X-Google-Smtp-Source: AMrXdXvNTP18ugelgVDKpsYtWXxt3JIhpq5vlfHPFgxIKtehlis9TOU7PI3dXS5mUd32lLGXdbsrpg==
X-Received: by 2002:a19:6508:0:b0:4bc:8c94:82f7 with SMTP id z8-20020a196508000000b004bc8c9482f7mr4149328lfb.13.1672028517105;
        Sun, 25 Dec 2022 20:21:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:21:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/16] dt-bindings: clock: qcom: gcc-qcs404: switch to gcc.yaml
Date:   Mon, 26 Dec 2022 06:21:40 +0200
Message-Id: <20221226042154.2666748-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the gcc-qcs404 gained support for GDSC and requires using
the #power-domain-cells property, switch the qcom,gcc-qcs404.yaml schema
to use common gcc.yaml.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-qcs404.yaml       | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
index dca5775f79a4..b70901e0d5cf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
@@ -20,26 +20,13 @@ properties:
   compatible:
     const: qcom,gcc-qcs404
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -48,5 +35,6 @@ examples:
       reg = <0x01800000 0x80000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
+      #power-domain-cells = <1>;
     };
 ...
-- 
2.35.1

