Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1F6635AD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236737AbiKWKyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237076AbiKWKyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:54:11 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29B64132F5F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:20 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k19so20924094lji.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bda09macuyK5fYNXnbLx3WrcVV5Sb23aKOiNbSvBd8U=;
        b=bOBm+hpF6D9fAUC6maQ8j1uwXXeEOzWC68rFDd5Elim232VcyJg+ZZb3eWhdLVMDE7
         /po3+jQ4o9/PdzTUWjzUOFrWza5CnEuCtgcj0An4C+x6juAENvO8lH0eJ66iEuk0AjPY
         WjftM1dVUeGXn0UsnLY0+0zRMwzcq35PnyojqudM3BKxfOdY3hJLozxJ34mfLZLyuB8Q
         xYYRCW8Fflvs/23a9EcCqzHh3RDrnsP6XsAEfy/ey8FMLz+pTBH1kFrkcNma7YXaBV7m
         TwD1ywvJrGzQhA4DYJMK3WP1XtGMUhx6ZdZAT41Fkhvja6uoLYdWYqWN58aVd2o0kta8
         qVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bda09macuyK5fYNXnbLx3WrcVV5Sb23aKOiNbSvBd8U=;
        b=rktrosyal/4J5Jk1LA1krciKWERNj5E0ZpDLWFv45YJxVbNtZihKnYpuOXBDp20N9C
         H7/YOMLqwhynpXBry7pXIDbAW7Q3DV1glcnHyL6/Ksu3ZFNm3AASQjjBRhsxz5aPogYo
         sh0EIw53qlDObkuSCeQARmUILz60Ikd0F5r3qW8lpWMo+Hu45DPazexUGdVL4NPEz9nl
         Runtd9CVDCYSvakkZCUZspAN2h+z7OJmkpktPXrtSBPTC4S2R2+sit+qFLK05PsxMnpS
         h91/hiNGIgOX07Wh8KDqmCtCSrCq1N2Q8l70QSmYPPt+hR6KIzR8br1T7VYohvymXvy2
         niyQ==
X-Gm-Message-State: ANoB5pm+eEKL5X2OGGmsYH2VpfYlc3cVLLoK74uxQEUbI7A9rawAgqsQ
        CsCC0wsZnj8M40h1bWncHgj68NZTLR8g1A==
X-Google-Smtp-Source: AA0mqf64Owtbu7ESJT1RZlk0iUTM2xUoDEQI5h/X43/zXe5olzOeKuAa4Hj2m4Qvs+MIwtZMJY4TJA==
X-Received: by 2002:a05:651c:2db:b0:279:13e4:b790 with SMTP id f27-20020a05651c02db00b0027913e4b790mr8874615ljo.154.1669200138561;
        Wed, 23 Nov 2022 02:42:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id n5-20020a05651203e500b00498f570aef2sm2862908lfq.209.2022.11.23.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:42:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 3/4] dt-bindings: phy: qcom,*-qmp-ufs-phy: add clock-cells property
Date:   Wed, 23 Nov 2022 12:42:14 +0200
Message-Id: <20221123104215.3414528-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
References: <20221123104215.3414528-1-dmitry.baryshkov@linaro.org>
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

Add #clock-cells property to the QMP UFS PHYs to describe them as clock
providers. The QMP PHY provides rx and tx symbol clocks for the GCC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml      | 3 +++
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
index be41acbd3b6c..80a5348dbfde 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml
@@ -75,6 +75,9 @@ patternProperties:
         minItems: 3
         maxItems: 6
 
+      "#clock-cells":
+        const: 1
+
       "#phy-cells":
         const: 0
 
diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index dde86a19f792..32ed1886fbae 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -43,6 +43,9 @@ properties:
 
   vdda-pll-supply: true
 
+  "#clock-cells":
+    const: 1
+
   "#phy-cells":
     const: 0
 
-- 
2.35.1

