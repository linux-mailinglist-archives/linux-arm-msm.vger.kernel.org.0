Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904564C9A5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 02:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237840AbiCBB2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 20:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbiCBB2W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 20:28:22 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCCD39B86
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 17:27:39 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so276850oos.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 17:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=knKff9m1SSa1i2Jf9YTF9j12Lvs6C0dJTe/yY9EehIE=;
        b=JKVAG8VNOqbdpBasGXOclZzoF4HHztXmyufblKs9S+8MzQg09t2La3l2aemOnatttM
         ruvsh9OD9Bwj47/d4GLD9VfqIsP0KKYBXYxHratz3WFOQvAykgAmjJ6n3LbzCe2l/Vi8
         LOVoXWBi7WWLZ9aijWHyAFr4j4WMbW9wn1AfT47EE+F1VKLmZSgx9+XT1nwx/Jec6JHv
         TNq+SebN8j6GNN9ySAHPQaz49P1d7sasEmZ/Jui5lKR/TummVcZioNFU92cL4j3hZCdI
         uBQAYZ9tEw76VPgUW6/UD1O7SWwy2BZfJOFS90YcMu03FR1XBhZHysMAqLcBnbzP9mSW
         98dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=knKff9m1SSa1i2Jf9YTF9j12Lvs6C0dJTe/yY9EehIE=;
        b=t84uQQd5AweEvNr4Wzm71rsRr9syPQjcnONJJbkOlAnhbA2l113tJlrrIWEEl+El9l
         H7kxGBUoiWAIRXRAvBlHSZXBa9REDr368kGeK85Q1ez0jiTJMDzxdvSyJNNA4kKWYozV
         39CtU5mXWXmQlsT2suFm12dxpdgh/tck9/RzKG5UPQlqZoYwtl0mIWlAowegV5U/ZpVb
         LCmPuVaXDuo+nS97DnOSeF6mtkjynOej+nBVjHWcJgkAS2GUidCMEIWgTtoqpW83Lu3V
         F3Fmj0BZRfbaL23YJ/NLqX9YfbPf170OUsSrwKZeVJ8EXUFK6E+vjkJxYn2oHRXqUG9O
         f7kg==
X-Gm-Message-State: AOAM533bXSQRhXsXNNHBhLvdJ4jGjDj6KuKYzdE6T2l0eCUNagvCO3Xv
        LNc1q80Bln+Z6AlfEURZqJw6eJvpOUB97A==
X-Google-Smtp-Source: ABdhPJxixOFh3lm/h04oBLu7zQ0+6NPTfLFIsCxfmBOqi2YYi85+e8re5ihk2kbh5qJLy2J+D+JM8Q==
X-Received: by 2002:a05:6870:9a29:b0:d6:bba7:970f with SMTP id fo41-20020a0568709a2900b000d6bba7970fmr13678368oab.166.1646184459005;
        Tue, 01 Mar 2022 17:27:39 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id t9-20020a056871054900b000c53354f98esm6728948oal.13.2022.03.01.17.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 17:27:38 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: msm: Add optional resets
Date:   Tue,  1 Mar 2022 17:29:30 -0800
Message-Id: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

Add an optional reference to the MDSS_CORE reset, which when specified
can be used by the implementation to reset the hardware blocks.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New approach/patch

 .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
 4 files changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 8766b13f0c46..965027fe205c 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -66,6 +66,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index 12a86b1ec1bc..b41991eaa454 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -65,6 +65,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index fbeb931a026e..6e417d06fc79 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -64,6 +64,10 @@ properties:
   interconnect-names:
     const: mdp0-mem
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dca4b3d66e4..1a42491efdbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -57,6 +57,10 @@ properties:
 
   ranges: true
 
+  resets:
+    items:
+      - description: MDSS_CORE reset
+
 patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
-- 
2.33.1

