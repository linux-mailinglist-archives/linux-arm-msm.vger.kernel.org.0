Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B255699556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjBPNOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjBPNOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:32 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F87A3A0BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:31 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id b3so2733307lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVwCQxzpAEIpXPHUGXDu/BMLdh/4/iLGwabsMvVeo9s=;
        b=q03UgKpiEoJBmxNezi5NqpijnGwzNYxs5oGEGmO/NHMMDwx4dlrZVRvHQith9AcxGd
         +p0xzN/DvA1NpDiJUqGtbXEbqowlXnSPdVngC1rqUjrXIuoUYon7SYpu1eeC+feaZU/z
         0ES2jtb35DpDGqc/4bYzWGf6RJh/nTfH/jVcAgf2I9pSY1Me5MruXocXGdYMQElgOxgU
         +dWRVe7zZLJgEbuSbbsBTiGO/CONuAVO2mH2xPe0xKkFTzo+hmWlfYALMYfp8f4YCWsy
         TdUcE5xaHrFvih2uLcaqnD5Oc3Wfxdltob/6tIs4IgiuluW2QGH7wqsgGvFwC2HbqBEB
         8jCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVwCQxzpAEIpXPHUGXDu/BMLdh/4/iLGwabsMvVeo9s=;
        b=qQ8yOonRwmCpFNOafaxO/I2V6n5PGiH8UoMUyOrr7OrHkNv/aoABYIuFZL7b0qit5l
         iKRgY+FOZgy3mER0QFmAfQxCu4Nr/E6N4b4S0PlW3d3BoH+a23qykSE6PvUwaM/+nEN9
         N9pPX2NPfaOSSuPRfvaHdKM3PQJgmCHNNnPwzaScHoNIfeHTPNjkjRErw8thvJIcedNc
         c+raB/xVX31jriyYoUfJkf6TTIE62/HFCrp+XJVDDq0z+QoUAHHgOMvepm8g+KEAf8Kd
         2nf47Wmp68I1ly+iLGd7FU2wMZoHU3p4Zhso9rI7V7ogrcBnhej8aZES0cMuUv2CnGeZ
         Dkug==
X-Gm-Message-State: AO0yUKWk+A0/IwpBFiQ7NZ0OUa+CdmNdoSPlwpr5JMH6jGpRy8vhDxLL
        o1X7nOcQ3ZG31IX8yeihCxyASjKmzh/7c1a/
X-Google-Smtp-Source: AK7set9PQdq/g/J4VmXzutAPqIkKGvuAGjNk9zhTJ0J8cTy2tvdj+6cVYtTdkp1c8gaa+9R44kCg4Q==
X-Received: by 2002:a19:f009:0:b0:4b5:b46d:e60 with SMTP id p9-20020a19f009000000b004b5b46d0e60mr1786545lfc.27.1676553269112;
        Thu, 16 Feb 2023 05:14:29 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id w7-20020ac25987000000b004d862e9b453sm290306lfn.196.2023.02.16.05.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:28 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: msm: sm6115-mdss: Fix DSI compatible
Date:   Thu, 16 Feb 2023 14:14:26 +0100
Message-Id: <20230216131426.3996378-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

Since the DSI autodetection is bound to work correctly on 6115 now,
switch to using the correct per-SoC + generic fallback compatible
combo.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Depends on (and should have been a part of):

https://lore.kernel.org/linux-arm-msm/20230213121012.1768296-1-konrad.dybcio@linaro.org/
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..146d3e36d1c9 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,9 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        items:
+          - const: qcom,sm6115-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
 
   "^phy@[0-9a-f]+$":
     type: object
-- 
2.39.1

