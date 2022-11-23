Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE3A636BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237595AbiKWVET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:04:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237323AbiKWVEQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:04:16 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4806E2AE01
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:08 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bn5so424414ljb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
        b=rB1+P0BUkPh/YewhokMj4qsH1MK+rmFWlFLw7TS/yD0FskwXBk2OYi2sYJ7ZQZCea8
         Qui4u5xoHF6KMj64eb1RDSjnbwMo50qctsPZKiCJ7UxEqLcD0XKqWfQGLGc8yRVBWpL2
         5Boj8NXE1E+UTA3LIMOQspN4Fp9LebRfobqTCRVufslL6QofIvyUvwlM3SySweKrQm8Y
         q9NttdZoxQAgKlSKvoSx1rR5f29gPvKQLQ2XyiG1QqEV5Eg0Szrv9eQz2YpgIo/siTMH
         NMrn2Gd3Q9bKdlCgsQdnMz89Yp38XYCTHrnYDuVfswCKxwqssijnzeU6pUZMJnypWv2X
         gZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eq+xrGXQkafyNxdD3bUOX4BO/00RbY/2YQOJ/yUkbp4=;
        b=YaunOkcAGFoxzXsrd0YNb61tm/9SkoXKu57LM3LrnTq/Xw3uB3lasevPpuqXjis71W
         urQC70QpLIBCfH+4B+2de7t3FZdBezMGKetuFEF+8ywsGD+zPoC5mOMYw1QR2Y6z3DMT
         1Drv0qY6wy4t0qNqD5DWN0bn7oNcAs2rNfPPYopZ6655IQbZYRRCbJrrAE7PFuYsvR0I
         8ZkINxmNAmqIGpoaU/ngb0Xc5Fx0lI5I+5L73t3EB9BuuSfEUDvE2SbTk9HeH69oNHxS
         Xu8GH5XQR4foL9eSh1ayu+X2NcYwo7xbp5sLmH2xURe7AzRjDs/7xdtfC5ejUqRXUeb3
         Im1Q==
X-Gm-Message-State: ANoB5pm1a6MlNK3lYQ/0Gk2XsmgyPgnsQaW25p80KwlJSSi5E2CMEAqT
        paWkrDQiQSIZFu/4irpj5lG37w==
X-Google-Smtp-Source: AA0mqf46OPUyvCRaV+rXrsIF9CJYhxP7BlmdS/3i551xkHAdarx4Z1u3pcQyFY30qtT6rTJMI9Od8A==
X-Received: by 2002:a2e:6812:0:b0:279:4159:ab79 with SMTP id c18-20020a2e6812000000b002794159ab79mr6177776lja.144.1669237446669;
        Wed, 23 Nov 2022 13:04:06 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:04:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 03/10] dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
Date:   Wed, 23 Nov 2022 23:03:56 +0200
Message-Id: <20221123210403.3593366-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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

SM8350 and SM8450 platforms use the same driver and same bindings as the
existing 7nm DSI PHYs. Add corresponding compatibility strings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index c851770bbdf2..bffd161fedfd 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,dsi-phy-5nm-8350
+      - qcom,dsi-phy-5nm-8450
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
       - qcom,sc7280-dsi-phy-7nm
-- 
2.35.1

