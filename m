Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDDD525877
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 01:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359531AbiELXhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 19:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359530AbiELXg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 19:36:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A4265D1F
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:55 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id p10so11669321lfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 16:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=iXwW7J9u+H2HItGvauEDzCNnvKPaZBXXt3QnjD7RMi3ta+74h4j2BR19KiAwVqTNI8
         boCEE0PazFQzGUotk83wRsifDapmV+z9q9EO/NTLoxDQsyeqolNo+t1sQ7wqpewL4D8v
         z9CWx2xT27bxW4bBLf+LVCX893TmhrxPa4lk5dcr7AXjdiTK9RajYXKRkNy/GuJZusZI
         Zfu2JDBhV83WKxFJ233Cf+DebKxzaSy7yKtSkrMNF55jca5XjHiD7+Xzgx3coUfmgl51
         6Dw1UyOU7uwSzXks9YdCey5rB9tvef4qWZxOQ0+rL2OLBy1EJG7bvrXaZjX5wXrcEyrw
         ycCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mfq8artsCmgPridHwXtCTWz4VD26jC/9nXCO2mqCNlk=;
        b=rkMD11FXt2GV1QH2x0lCJ+IMLLXA3P0k2GIab234ds3HL0cb8d2480wOAPiXcgHd31
         UWW9HvWzHu4224CygXiPG6fZ0ajuklX6+duE66w9ASKaNeoq/+ChcvkIfHwFsOIRUuep
         lH4ht48YTExbSnvEUxuEeAtzhrdaVXMK75Bx/lJ1Sid43iNk6ybeNRGsJWtuOLFdzAFy
         sbUsVffhPO7M3Gx+13qujjMQUV02D+dFW0hGsKW7uUBKdDR2JoC4OTNlL0jGFcwBMQSc
         kfwZUVnKd7u0i1WM939neqgtYF7rKPOBW1LSKa8l5jQQdQejfLCOy3Nm/Pph/7VjCFBf
         2QUQ==
X-Gm-Message-State: AOAM531aOVufGubYkV8kVE/VHo2f23dbHDSIx/jHLfh7WssvYkjDeIpO
        xmScaZxKZhpxmQDu4k/PAoeghQ==
X-Google-Smtp-Source: ABdhPJyHwvFyLPj76dHqxn/lAe13fO2rG+/lMa9ckPzT4sqPlUWeknSc1GduqjhN2jAiACWtz8IBTw==
X-Received: by 2002:a05:6512:2820:b0:474:35c:e74f with SMTP id cf32-20020a056512282000b00474035ce74fmr1426134lfb.661.1652398614085;
        Thu, 12 May 2022 16:36:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a19f00d000000b0047255d211c1sm127937lfc.240.2022.05.12.16.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 16:36:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 8/8] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Fri, 13 May 2022 02:36:47 +0300
Message-Id: <20220512233647.2672813-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
References: <20220512233647.2672813-1-dmitry.baryshkov@linaro.org>
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

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..ac4ee0f874ea 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -41,6 +41,7 @@ description: |
         sa8155p
         sc7180
         sc7280
+        sda660
         sdm630
         sdm632
         sdm660
@@ -225,6 +226,11 @@ properties:
               - google,senor
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - inforce,ifc6560
+          - const: qcom,sda660
+
       - items:
           - enum:
               - fairphone,fp3
-- 
2.35.1

