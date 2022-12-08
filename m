Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5B7646620
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiLHAzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiLHAzD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:55:03 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59A484DF1
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:55:02 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j4so31401289lfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
        b=dcXN8CrIwWj+WhiIr+k4CEInsAx52ZiTtEKU5oKIVxc2m0Oy6WhpOehgibHctHVcPe
         DYzdhAhDj5JG6Qg3RYEy8W6T06IQC3MOwAirjDcicnZMSdlZojzybp1sFvBvsX/RdT9a
         A7uxfuWg3nPriYSn+ZPCOxX+caIWkvto4J4zkM2EKiyVOs7yB1lYRHCtzlVGJvjSboWb
         ezWCnD1Ndo/Y17pW/Nc7PwMx8DEpxFXCwxQTtzg6eAZduWU789oiH6wsD7uHVwy6ClJz
         TViLnME8x6O6dkVyqGMETlcrK6fTc/vM/sObQ7hK9iB0nI90etAaLOTMGThqmYiTqZj4
         9QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/RmycL1Mv6ZSS27FwVTDu6/m14EDrtLYu+O7wuXKfc=;
        b=X+Hk75CzY8YpcC/zngFKY2+dQCPXhq/WOfoUCzODuzuQ8Tit7wqV2FKm/NbSb2ehZh
         AaoQqUnDsdJntSe3d/LWnjotpoUEsi8dVbeenSuHvtgV/cwywPoSawP373f8foxLShqs
         JZxSl0qcr+I4bdNxv57RSz3k+CzVxXQzs9BywpqXCZ42+wXfhXHY9RpPt2+YjlSoNxmB
         B2IyygWjkhRnhxB8kSIQsSLMWc2YJhgfWJhr/ptoo403tFPTnw/cuNKqygD9xdDWIoD0
         1IuJR9EmsiY+t4dX6AfICh/vokLbXvC+Dv+J5IYnZJjkKsq55D3r5zmP/XRQD8K+90ET
         Zrag==
X-Gm-Message-State: ANoB5pkz39DY4ZkiClllAwNujjJ/b3oIkWYbf59ympKOBkRzU6KkwysE
        rTKgA1dYOQUEu5dK79H05SOuOQ==
X-Google-Smtp-Source: AA0mqf69gi2tQR9aBLCUz9azAEFIH0hbuGn9WAjHGko/R2B+a4Gqgt2JoRfRWtg7+JlcT2aKX43k2w==
X-Received: by 2002:a05:6512:12d1:b0:4b5:869f:420a with SMTP id p17-20020a05651212d100b004b5869f420amr3049175lfg.353.1670460901051;
        Wed, 07 Dec 2022 16:55:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f27-20020a19381b000000b0049fff3f645esm3064159lfa.70.2022.12.07.16.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:55:00 -0800 (PST)
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
Subject: [PATCH v2 2/4] dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
Date:   Thu,  8 Dec 2022 02:54:56 +0200
Message-Id: <20221208005458.328196-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
References: <20221208005458.328196-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/display/msm/qcom,mdp5.yaml       | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..a7a97a4c46b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,24 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,mdp5
+    oneOf:
+      - const: qcom,mdp5
+        deprecated: true
+      - items:
+          - enum:
+            # msm8998 should either use old single-string compat or new
+            # qcom,msm8998-dpu
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
-- 
2.35.1

