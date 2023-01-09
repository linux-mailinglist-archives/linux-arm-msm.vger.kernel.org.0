Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E36661B90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:38:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjAIAi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:38:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjAIAi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:38:26 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424BAFD14
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:38:24 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v25so10603267lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7tzbbXtIcdAwZoC6yIOfhpW+r6dBpbZgfIckXUFSvw=;
        b=D4WGmG+HaScJg1C0el9OtztTyWDt5JuNx8u5i5obN51oiXeoIbw1hgf216nB5OlPQj
         jTG+Bdc8n7dKeQcOimJME2R6VPYRV07sS42gwuponbLAeV6cPrJb8Hriy4PlvOD0oA3/
         CkcboR5MG7FzBnwQh0l0Mq5QrdNEysfdttyE40tqsr4+5plLNL1kVCtpsOx4+J/NWs7R
         e4rK9WulDqvXXF1iSGeeXHv/oOLwcEML+8aKKjkIrH4iC7xgR1SrpOK2aL8oBKWuIxYt
         K/sK2y0djGAdvSjAub2Jh/u7Zo9ayeKyTX9FDoW6EQo0n5YtSXUAt56KGpmK7Xv1cpFv
         7L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7tzbbXtIcdAwZoC6yIOfhpW+r6dBpbZgfIckXUFSvw=;
        b=xeb4zMkBYlqo7Ci9hAGpG3ZX2AjfmWgbKNX3+YK0UaKmWifaQvPWyqyf+SzwkZiNqG
         l3BjctvBbyN6f6muRVAuv49ComF0ZQ9znjfQtpTBNZq9M7juOTZQbpxBgIb8dJMDOX5X
         C9FbnUVLpGG9m/mnRevdaAuGcBmIGeZxQSZFcVLErBKx8a4aG7TZ2FWfSx/Da2wu4Lm5
         WyIh0Xbd/3fFgnPu9dR8JHYVmHQ2Ya24OQfERc2P2ddlwGxl9KjdhjIO9CfAjQmDQ8Kr
         82l2Fx0Dv9S9rRC2INfEIhU0Q70HVHAs/3y2md33tdSbm7S1KgjFm7rVePKebjCMZasC
         kcuw==
X-Gm-Message-State: AFqh2kqDM4m22CefWoYbNAwb66RXU/+Qj1zKC/lM+GMTDdd7YbJYMQRB
        Ob3q6KGJ1PXEwcuDQlmP2ZKouA==
X-Google-Smtp-Source: AMrXdXt/9PmqRWev0nH5pp5ZiXqEVizMIvfXyeTLsR6rdshy74ZK24gyoTxXZwFOEqgySlPHqoOodA==
X-Received: by 2002:a05:6512:6d6:b0:4a4:68b9:609b with SMTP id u22-20020a05651206d600b004a468b9609bmr20697985lff.38.1673224702666;
        Sun, 08 Jan 2023 16:38:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b004b58fadba35sm1297469lfr.296.2023.01.08.16.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:38:22 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/4] dt-bindings: display/msm: add SoC-specific compats to qcom,mdp5.yaml
Date:   Mon,  9 Jan 2023 02:38:17 +0200
Message-Id: <20230109003819.245803-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
References: <20230109003819.245803-1-dmitry.baryshkov@linaro.org>
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
distinguishing between various platforms. For msm8998 list
qcom,msm8998-dpu rather than -mdp5 to allow this binding to be handled
by either of the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/qcom,mdp5.yaml        | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index cbcbe8b47e9b..9d9da987572f 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -16,7 +16,23 @@ maintainers:
 
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
+              - qcom,msm8998-dpu
+              - qcom,sdm630-mdp5
+              - qcom,sdm660-mdp5
+          - const: qcom,mdp5
 
   reg:
     maxItems: 1
-- 
2.39.0

