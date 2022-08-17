Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997C5596F37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239394AbiHQNED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239539AbiHQNEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9BD31DC6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:54 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v2so18920151lfi.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Fu31UHcZ2LXLoLqG8lQtW1W1v+mxTPYhVi9HdleMdto=;
        b=Al0HfpTRNiVmLf1Ltv8H0kEaWM7RlsrinxpJ/BmAgcypfuG50URpD03yiHWeC6n7q0
         0/RXgYGGpwDEvcW3gNu1qhAcdV10k8HQ/lt62yZQafuNb5766KLrU+p2+Y4cRktx/OFj
         so4P5dgfGKHJhagKPR0s+kmuFFP4P11CCWE3pnO57irtvZ5t/BbGx4tEVk24PSbDl24A
         1Ghil/Vj3TKnPtdxIpegAJjo+/EbAdD/aVN05TIT40PX1nRyTU++UvuHZwifYcOTkY35
         lXy07XAL+UJ/AqM1Y+tPCjzrZdf9RgnY8z5tocPvLqtRHtdmQWaMYymeQvDyHQzn3Lzu
         +9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Fu31UHcZ2LXLoLqG8lQtW1W1v+mxTPYhVi9HdleMdto=;
        b=U0atAD1YWomJvFFS5QEnqErcOMwkX4HuIk9foWXBydeiLmCSdBsv6cmBecbZFY8cun
         kmYVx2iUota8hnE+atTYqcSU/HbxqeIxQAcywTsjJRlsvy4b7Ql8Q7S8VvXnUTRWbzGl
         HSWWNouhYplwAgHZBDBCTWuFSsCDgNhUFL6HYQ36V4o0OmHU7Cu/3tZaYcvHsfVuFIYl
         EfRQNU+IB640gzTRw6N79Eaf1Y7xvzyyHI/2o78gck208m0FotOh88BDj0LAi/mAjSxU
         OUK0bM0W5NkJtjXrXMFOxgIzEBncIwk3OfI/0JCV9+E8nxd6UU4AV2nCCyRsQVfBJ+Gt
         ZtKw==
X-Gm-Message-State: ACgBeo1ttKw9+Tn/68ot34ALYyB3kgSaTJStBLzAvQOJdO+a+sYkKe3k
        3mzL133GQ4WIxQ/tMGv3ScrE1w==
X-Google-Smtp-Source: AA6agR4hselVCr5xeWZ6GrhELl9ZY9rOaufFtQoKburwlVDxbLqKVXqrVxlc9YkN1yPuXZkskihE7g==
X-Received: by 2002:a05:6512:2243:b0:48b:2746:314d with SMTP id i3-20020a056512224300b0048b2746314dmr9429439lfu.392.1660741432396;
        Wed, 17 Aug 2022 06:03:52 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:03:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 01/14] dt-bindings: mfd: qcom,tcsr: add SC7x80, SDM845 and MSM8996/8
Date:   Wed, 17 Aug 2022 16:03:29 +0300
Message-Id: <20220817130342.568396-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document existing (MSM8996, SC7280) and new compatibles for TCSR syscon
registers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Correct order of compatibles.
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index 2f816fd0c9ec..e1c4936a0352 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -18,6 +18,10 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,msm8998-tcsr
+              - qcom,sc7180-tcsr
+              - qcom,sc7280-tcsr
+              - qcom,sdm845-tcsr
               - qcom,tcsr-apq8064
               - qcom,tcsr-apq8084
               - qcom,tcsr-ipq8064
@@ -27,6 +31,7 @@ properties:
               - qcom,tcsr-msm8953
               - qcom,tcsr-msm8960
               - qcom,tcsr-msm8974
+              - qcom,tcsr-msm8996
           - const: syscon
       - items:
           - const: qcom,tcsr-ipq6018
-- 
2.34.1

