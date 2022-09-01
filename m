Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F795A9328
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbiIAJcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:32:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233656AbiIAJcx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:32:53 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618F31314E4
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:32:51 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j14so13209556lfu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=3iiGf3Tyr91E8vi4eGA9o6oUupAxAC01vXvdnh+gkz8=;
        b=Mpv4J11i3z5RjI7+6xVGZBsrAFUaRE3AwnOmijKMdvqzXI56Fv7REz0ErWRZ9+RweZ
         2jHzCGPH4Y71YrLvXTkpWvEl5lfJRHLZXHAXBQVuBnAb9P+akMcdhaTa338OuDIrjqRW
         8w0QYF2dWbbfQ5LzNl9wyboWk3efHS+iD0i7Eh2dZf2x+RLVruP3QW94vMlkleZUr8Id
         6HEei4lj8PoFrqPtTcBVA7/Eu4wlEDVEyPOKjDhYBzLFQzLIwfp9BTxZaLXiBopaUc3d
         vfKftnHKeRtrhEEkqjEb2sQUdd5abSqbDO4WjZKwJ4IyCBFCeULydtR7UGHj7IZfS5yh
         UZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=3iiGf3Tyr91E8vi4eGA9o6oUupAxAC01vXvdnh+gkz8=;
        b=mzIpo2UROaEiHtGt3Rj9ydaRJ8Jw6qpOK7PfwTmdq2nCQ7gfh0UBasUTceblPGM4Ev
         2q7KxZeqeBdR0pJyH1xDkbnKFBXELkT4OrT+U0qwLU4vey5bMr+3sqgQ1EIR7fgr4bPg
         G7VM2O8fR5HyxRaTv2hzfFMlchhu/FsFtiVjQO76GE+x1Q1tCEW+vc+TXhpM819eIZaT
         ZEg3wCJS50+EIKRc7z0vS/yj6V7HSxWOga0coS8ewI3FveAa/tYbBMrIkKF2p2efExJc
         RDktdblpVAeyHtA6nWrXU4Bgm/xespZl7lDTaILXuNsBqyydWU+Qvuh5tsYfHoJKHEbF
         i0CA==
X-Gm-Message-State: ACgBeo0JKJQu8J7H+GojvIhFWXsuH9itr4aZp1mT5Kb+E9+fIW3gnDYL
        9ekZCZGcxtlEx/tdFLWqmKX85Q==
X-Google-Smtp-Source: AA6agR7omwfon1PMfnUt3KRiqvGUUOqs0Bxw4whpKcnQjmOyQ5XFbVbNM52giGUfqOdolzDzWE9+BA==
X-Received: by 2002:a05:6512:b12:b0:492:8943:c813 with SMTP id w18-20020a0565120b1200b004928943c813mr9803065lfu.143.1662024769717;
        Thu, 01 Sep 2022 02:32:49 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id e14-20020a2e984e000000b0025e57b40009sm2442960ljj.89.2022.09.01.02.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:32:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFT v2 1/4] dt-bindings: soc: qcom: smd-rpm: add PMIC regulators nodes
Date:   Thu,  1 Sep 2022 12:32:40 +0300
Message-Id: <20220901093243.134288-1-krzysztof.kozlowski@linaro.org>
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

The Qualcomm RPM over SMD contains devices for one or two PMIC
regulators - already used in several DTS files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. None
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index 09d5bfa920f2..deccc637b6d4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -61,6 +61,11 @@ properties:
     items:
       - const: rpm_requests
 
+patternProperties:
+  "^regulators(-[01])?$":
+    $ref: /schemas/regulator/qcom,smd-rpm-regulator.yaml#
+    unevaluatedProperties: false
+
 if:
   properties:
     compatible:
-- 
2.34.1

