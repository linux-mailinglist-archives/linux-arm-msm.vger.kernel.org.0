Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE1562DC30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Nov 2022 14:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239512AbiKQNDB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Nov 2022 08:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239220AbiKQNDA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Nov 2022 08:03:00 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5065968296
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 05:02:59 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id r12so2695227lfp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Nov 2022 05:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPiJ7os7PhEqrWGvtI8HCACMGN0RvPMekiv79MxyVqE=;
        b=rb1lpgP+fARO/6FtRRzLWhf1wyTHfYMbmqIXevWEuMS94ujwYdhoe7VQAH/Hs7wYyG
         pYwovs9TxBIwqW5zZR702ZamIB42qBnxhfyAW6T1JJUDbMD7PqFwCTDldyXg3NZnuhWq
         mjU0PtqlfwMYyFbquOQWCWndXRTU7i2XG6cZuCFoMRsXZU9X/3ElM+HV/GG14lsCCIOu
         /pgIGIhPo1HUHgs638m/yuf3SH02fZxkXo1Ew2rWyFgNKZYAzB/trAgdcGxYOfD+dXOM
         c6TyjbWA21lopFHHBaeaMUTgGzAUWK4oEE2TQHGQlIw23WuRRj0CUJkGeNajcBylR1kd
         Wq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPiJ7os7PhEqrWGvtI8HCACMGN0RvPMekiv79MxyVqE=;
        b=mn+BxH03XmOWZgNQm2LdY1vfEIl6y3cTubgEeLHvyzdfH8yMkX5YUUArzofZ85qKfc
         R0TG9MCE7yv23vnWq1qj0qNyqSX4/yuB2NoOzLBW12CtNxywi+Ih4Rw2bhZKCey0hWDO
         pew1PkyITnonV9GhaJtaJUoYIjlg7kWcBEE8Eozz+1v6H5ZDzzZ/s4LFTYr0EONuoCJF
         AHt3qA89IZzzL2JU7BWM3iyzG2sFEVwDKf1VrChWGp7FE5GP0sA1mLnjX68DU9crk5K9
         3skP+YII82VkzRldh0J8r59v02m+dPv1X96hDJdO5JttjMB6SFSQw79kGdZ2PVd173ug
         TmQQ==
X-Gm-Message-State: ANoB5plv7oASfOBBpnlDhYBjKtDsmPUjqkLDiMC2bPq+9390NFJtPSUD
        EazXdD0t0HglvRGO24Rc4WmA0w==
X-Google-Smtp-Source: AA0mqf4ACSvvgnA3OevUWAqQJmbuiVpzqjBLDs6tP3CCwp3fODm5slkGppX+15vDxgXXVaFEUgTOFQ==
X-Received: by 2002:a05:6512:25a0:b0:4a2:bbdc:1430 with SMTP id bf32-20020a05651225a000b004a2bbdc1430mr813519lfb.404.1668690177498;
        Thu, 17 Nov 2022 05:02:57 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v6-20020a2ea606000000b0026c4c1a0b4dsm186982ljp.126.2022.11.17.05.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:02:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: simplify if:then: clauses
Date:   Thu, 17 Nov 2022 14:02:54 +0100
Message-Id: <20221117130254.378109-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Most of the device-specific compatibles have generic fallbacks like
qcom,tsens-v1 or qcom,tsens-v2.  The if:then: block mentions these
fallbacks, so drop redundant entries for specific compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/thermal/qcom-tsens.yaml  | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f0bd4b979e28..c9949713f714 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -118,12 +118,7 @@ allOf:
           contains:
             enum:
               - qcom,ipq8064-tsens
-              - qcom,mdm9607-tsens
-              - qcom,msm8916-tsens
               - qcom,msm8960-tsens
-              - qcom,msm8974-tsens
-              - qcom,msm8976-tsens
-              - qcom,qcs404-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
     then:
@@ -140,17 +135,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,msm8953-tsens
-              - qcom,msm8996-tsens
-              - qcom,msm8998-tsens
-              - qcom,sc7180-tsens
-              - qcom,sc7280-tsens
-              - qcom,sc8180x-tsens
-              - qcom,sdm630-tsens
-              - qcom,sdm845-tsens
-              - qcom,sm8150-tsens
-              - qcom,sm8250-tsens
-              - qcom,sm8350-tsens
               - qcom,tsens-v2
     then:
       properties:
-- 
2.34.1

