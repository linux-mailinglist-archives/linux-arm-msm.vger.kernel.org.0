Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7440D5A90A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 09:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbiIAHm3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 03:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiIAHm2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 03:42:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6B811E821
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 00:42:26 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b26so10078178ljk.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 00:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cSbZMlghmZTJCz/NzUNbAO/3CZuwbgB1TQgsZKvyg6M=;
        b=kKOB1Ro/ejRalllRIdJwEKe81afPB8P+svSN1ww1UjcrYzkH7Rbfn1IQz/r86YRkl6
         klmXRIX17gl2jouz4DrcQizXzteIFY9J7c8Q+VPg74INdbkc3Sztn4s3BEblfbG/HC29
         m0lyhgG71M1LXa1wvRKansWorANLE0R4Yalc6FLx/2MUyX8p6ZRfCuW9AhndvanoYYFM
         6JFhU2F5MhJvbOnFIhFPJd19dePPGwkmujJ5mZljyvJYAABE+O4UrYabZZuxNj2z4Vv1
         Ds1XxiMZc7MF+tFr9+EJVkzBxoDXChOefMZXFs3WeT6hFy7/ircI/ZFh/B6QKXxWz9Ou
         jdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cSbZMlghmZTJCz/NzUNbAO/3CZuwbgB1TQgsZKvyg6M=;
        b=jYI9Y4xa7tpTZA2lRBgrfdncDqaWTU0IRV+cr1fZ+uyfz25ygKz8eA6mD+FbrA6p37
         uOvMgB3p91v/gcpeorUBesh85omNCos07vJa1fFWQOBXeVKphfgsYpaM4zkgV1NbAXJp
         Bq2IeyybqJXeMMEFZ8+QhsXogsVHjespkZsRV5bSjEABB6+Cwg5j0QYev1iFPi6mS+Qw
         /AhVgQh3aVFBbA/4jfd7nhknbn+y2DzCNlLpKXO70ayaZfkRQrY9U7H31UkT+Kb+by2E
         7qrBeSwEmHS7sY9R2gLIEEeKETxJQA5Ag6+jLhb/enPTz1qCTOTPGuhFe2YJnQHjxrzZ
         vrZQ==
X-Gm-Message-State: ACgBeo2tBo1j7OZOtprdMttMW1QmDECTK/tCIVw3TKWz5PZMNK7FI5mT
        5co/YBe/g6BwwY0SjUpi7j2Qjw==
X-Google-Smtp-Source: AA6agR7IP+6m6NN8YIfX3c6qFByfvqwUyb5rMomNaP+FrpGxQtOQVXuP3cEQzAYRkUZJbWvoDv6VTg==
X-Received: by 2002:a2e:8856:0:b0:268:1810:63b4 with SMTP id z22-20020a2e8856000000b00268181063b4mr2995375ljj.453.1662018144714;
        Thu, 01 Sep 2022 00:42:24 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id a30-20020a195f5e000000b00492efa461aasm407752lfj.204.2022.09.01.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:42:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: i2c: qcom,i2c-cci: specify SM8450 CCI clocks
Date:   Thu,  1 Sep 2022 10:42:18 +0300
Message-Id: <20220901074218.21108-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document clocks for SM8450 Camera Control Interface I2C controller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Based on:
1. https://lore.kernel.org/all/20220901073504.3077363-1-vladimir.zapolskiy@linaro.org/
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 90c9e401229e..e51a85848d6e 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -126,6 +126,7 @@ allOf:
           contains:
             enum:
               - qcom,sm8250-cci
+              - qcom,sm8450-cci
     then:
       properties:
         clocks:
-- 
2.34.1

