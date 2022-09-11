Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17DAA5B4E5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiIKLZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiIKLZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:25:26 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB662B631
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:25:24 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f11so10377821lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YHs0SEaDJbXoyLL77gh0qKqzR2QzJo2QI/lC2jkxjBs=;
        b=tb7K4ihe99wtgXdoqfVWwjkSv2XWRM7zXDgHrB6hsB2te0rfp1CtsyaVPTEis4qNgF
         +xBz1Jdl3YWL0Zix/aOG+fIhrZPxQmmvqGIaMTjdSDIAfEP/Xycds5CJ8ZsVG3RJdbNI
         2MiM7rTLj3qqwl/9UrPJIbhwnHRwcCF+fS6XOXnGBPsG5sze7vHT6FhzSPij717/DsHN
         aLlZmRI28TEtOTwEXZX5FBn8L84vfukjcKXs21EXFaO7z3dOr4klvTM4gn+2hgO3zpdo
         +iCaizTRKG/A+ugula+uVSknSDQq47BtyhFp9ss6khHoJ6H88UofMvwrN+cxrR/pjDkQ
         QyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YHs0SEaDJbXoyLL77gh0qKqzR2QzJo2QI/lC2jkxjBs=;
        b=pCutIITlzgyohnMR9PiT9jvXNNQn7WA2UqIs8J6oL9pBRURMaV81jMNP1DGfuf8b4A
         1DTw+Jn0qlbLhaStwQQXtJxnkMo7GCZ9w4MME5s/qcndtI1E2Gk08rCTVXmpOtfE4UUL
         YvUOzlG1+4lxnnMo9+6SVdacaA/QhS6Ty+4b4jJ/0z/X3trcK3tK4FJOXBaMJa3jZLEp
         loPBPQXQTGsEUZhfpqwSO0nb5tWsXRlFKr+q+tjOOGN2j/v2CehFFoSEqTimMT2mRYUV
         BrOR1ZE26XZX6GHUyYWTLmxlgQMQSz1A6g4BGquTsNhfWI4WGbcR56u40B1n89dd1Fix
         TDrQ==
X-Gm-Message-State: ACgBeo2yQABuKRePt8cro76uMQFhi4l0k5ZkSHz1WGn6Yoj2sSXKJ35r
        clBHzOtBI/PIUrIlcMA0V7hSJw==
X-Google-Smtp-Source: AA6agR5oNmr6m8z31B/zJnwas91EEnPX1JPNa8YKgusE48/bwlAxCnz1sfRM7bpJpFsZWk7+VjHkxw==
X-Received: by 2002:a05:6512:3e13:b0:499:1829:5181 with SMTP id i19-20020a0565123e1300b0049918295181mr3138202lfv.71.1662895522679;
        Sun, 11 Sep 2022 04:25:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p4-20020a2eb984000000b0026b96b8ecb6sm629851ljp.111.2022.09.11.04.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:25:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom: drop non-working codeaurora.org emails
Date:   Sun, 11 Sep 2022 13:25:20 +0200
Message-Id: <20220911112520.203062-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Emails to codeaurora.org bounce ("Recipient address rejected:
undeliverable address: No such user here.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         | 1 -
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml        | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index 33d1d37fdf6d..624e14f00790 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -8,7 +8,6 @@ title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
   Low Power Island (LPI) TLMM block
 
 maintainers:
-  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 30e682579391..ad3496784678 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies, Inc. SC7280 TLMM block
 
 maintainers:
-  - Rajendra Nayak <rnayak@codeaurora.org>
+  - Bjorn Andersson <andersson@kernel.org>
 
 description: |
   This binding describes the Top Level Mode Multiplexer block found in the
-- 
2.34.1

