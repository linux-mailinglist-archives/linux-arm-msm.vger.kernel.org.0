Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFB9669122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 09:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbjAMIha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 03:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235477AbjAMIh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 03:37:28 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D723FA24
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:27 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id v25so32065735lfe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBWElJ3IO67Fk9CmbUWfHwt0KiBiWiS5gZEar60mfps=;
        b=g/+yuEL6fT4FmzQHSpsjF7hhcrvpH76maUTxBOx85ZRxdMFI+OoBFWsWvvXvmk+2+q
         axfl5cWEgQ8i5nzIaAZum4hgGIN2FOzdtTZpETk7ZQnM3LYcVcy6TfUj+oV0QfpA2057
         ZNFGgeR2pb+qxuLqUbry3ggfcOizkomPTx5J8R7EqE1Rq5dUGhT91mX7cbnArnau4vBg
         3RyLsOqGq/Eof9HonFjOxJpXYGK5U0QTRNtQzjA9YTdxjO3CS8czWlSbbkByGnmkVMtb
         VQbyHU5nqGlPW8a5eDbQfKmt/iACi8huK8+fjLASgJeAVER/iFc4yTL0yuh66vTRRL9w
         3//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBWElJ3IO67Fk9CmbUWfHwt0KiBiWiS5gZEar60mfps=;
        b=acfjoD9xNML8TKCoPREc6qjjXdWYlipgr5CknDNQo8FIvbF8B2YwthEq3UAWKRf/1W
         7PxaIahTScXvtAGiVMLuzghsCSWaLBzhovo/37xpcBw3Q3ShLa1h2O4rlTdP3JK/WkCA
         HgrO/sfxkatJW9T+mFe2ptWoJnCgfK41QEP2qJA5IzNi9l5SnQdcB0F5DZT//HT4hbd3
         IVj8UCX90kCJ3U2ix7obctFncZokSgXVJr7dzap7DOHNYq89IB5D427TyH2gYHWtzjRL
         /1TLifC6jqyoLLgFxiMGHiHk5v185fwpBTxOttToLmV6Lmu/UlKCuVm3WwNzTcfQbzHQ
         HbHg==
X-Gm-Message-State: AFqh2krPy18lt5qoI77OzZmzITNBJCbcnUxSA2jFLjYwjaDQEyAJhrlx
        I155ynygRwyd020W8FtpfZkSDA==
X-Google-Smtp-Source: AMrXdXvhqdjho1hb0ITp61WnfeZYyLq21vI1S0xY0BraWfvdnKrO+ElBFknIu3FOaap+8aeu0jMcZA==
X-Received: by 2002:a05:6512:400d:b0:4cc:79ed:782b with SMTP id br13-20020a056512400d00b004cc79ed782bmr7668534lfb.19.1673599045576;
        Fri, 13 Jan 2023 00:37:25 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004994117b0fdsm3748038lfo.281.2023.01.13.00.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 00:37:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 02/11] dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
Date:   Fri, 13 Jan 2023 10:37:11 +0200
Message-Id: <20230113083720.39224-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
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

Add platform-specific compatible entries to the qcom,mdp5.yaml to allow
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml         | 17 ++++++++++++++++-
 .../bindings/display/msm/qcom,mdss.yaml         |  6 +++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index 5e3cd7abf046..cb7bf48c3a58 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,22 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+              - qcom,apq8084-mdp5
+              - qcom,msm8916-mdp5
+              - qcom,msm8917-mdp5
+              - qcom,msm8953-mdp5
+              - qcom,msm8974-mdp5
+              - qcom,msm8976-mdp5
+              - qcom,msm8994-mdp5
+              - qcom,msm8996-mdp5
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
index ba0460268731..dcde34ffc8d0 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
@@ -88,7 +88,11 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,mdp5
+        oneOf:
+          - const: qcom,mdp5
+          - items:
+              - {}
+              - const: qcom,mdp5
 
   "^dsi@[1-9a-f][0-9a-f]*$":
     type: object
-- 
2.39.0

