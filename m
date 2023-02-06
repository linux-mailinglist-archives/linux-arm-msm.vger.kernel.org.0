Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AECF68B9BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 11:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbjBFKRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 05:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjBFKRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 05:17:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2BD21291
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 02:17:09 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg26so8288386wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 02:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juT1ANtFRKnjz1qxgg5mjyQWnKuwI08rPtM+jF3OUfc=;
        b=hcxFwOf5s3B6uQ+TEDvLWWHa6v/pRaAt0pZWJfSz6KR8G9cKL2s9MQEPh3I8JujA2x
         i1HZyq/CoPY+6O9Q6HJ2X33Zu7KzgrAFqNMfUez+qAf82Ee7WuiQ1Bh+qlouUHvAMUdi
         4cDUMM4O54LRhEir1VY65DffLDAhlGKbg9ntI2V46kPa7KuTX4nyP3h7p6quQf44NFXn
         kQz5fNeVTeCzBOHluNHqhZNwYw/dPYCm6yeEzw6fzkL8bhVUzVGstvr+Tqpqnt5nRJOi
         PMU5zVVtcEGA++YzApp1CSULUdocIquCCSzIVcGLxXxMouLlSnOi8fjkzgex0r1YN39x
         tI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juT1ANtFRKnjz1qxgg5mjyQWnKuwI08rPtM+jF3OUfc=;
        b=d3azFkI9Jp51xJ8GVP0U+vallz761WwCAH3XOGc2iRlESO5bQerSxsVm0aoH4Ujp8I
         dKKydL55lt0XHrlyNhzELS944jL2XWe4QkTnJgRoawONiOq6ySubsQhVJ6gXGtsLaovw
         uH805wQrxxuf62x4oO97KKC27EG64FESHwXxmaq8Qfvfs9huGQqpEa80B2D158hCgHql
         xwxbAWP7TMfd4J1AJJqNZcLChpp0CjHQ0U6gArEQj0Hslo5FJb5lmHnL4sJyMvt4LhXf
         ibLerwA8v3n2npbVGQ4402lgTrZ/YeAeW7dezReg10jK/lQ5AyUNYdz6QLwtl6qLdRCI
         1OQQ==
X-Gm-Message-State: AO0yUKUsaOpbeQP+A66GfPhq37x18mEYjDGngjrBNeo5nL/RFRFQBlsc
        jUZzfSQsCp++UhG0O8MfCsO84w==
X-Google-Smtp-Source: AK7set+nTV2McC/t0ZmuxXwp/9Qiusp8BNjBheoHhkQQldgSqYkmsMsm5Ygo1A4/QyjK3+lSIH8SeA==
X-Received: by 2002:a05:600c:1e8d:b0:3df:deb5:6ff5 with SMTP id be13-20020a05600c1e8d00b003dfdeb56ff5mr13663417wmb.24.1675678627739;
        Mon, 06 Feb 2023 02:17:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w15-20020a05600c474f00b003db0bb81b6asm11314201wmo.1.2023.02.06.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 02:17:07 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 06 Feb 2023 11:17:04 +0100
Subject: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230206-topic-sm8450-upstream-dp-controller-v1-1-f1345872ed19@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SM8450 & SM350 shares the same DT TX IP version, use the
SM8350 compatible as fallback for SM8450.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 0e8d8df686dc..98bae326e655 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -25,6 +25,10 @@ properties:
       - qcom,sc8280xp-edp
       - qcom,sdm845-dp
       - qcom,sm8350-dp
+      - items:
+          - enum:
+            - qcom,sm8450-dp
+          - const: qcom,sm8350-dp
 
   reg:
     minItems: 4

-- 
2.34.1

