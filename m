Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38F886E9ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbjDTWb1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbjDTWb0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:31:26 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100D430F9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:25 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2a7ac89b82dso9253631fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682029883; x=1684621883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWT/B+r7q/RKUVkiuFZ1DbVX2TD5Cvvln3noQ7CU1Y8=;
        b=j9ovLmib1wBjfXLyvuYVA9fKZyjdkuM60bwdom/p0l6d+g2HsTUgByXIxDq9KFypFu
         jgMhPVeraebxHUjWSU4KaJF8Xi7nBbEJaeuDLq/rSmcPRsCf0ASlwS5Z+lFEJjSeMpz+
         G1Yt7few+Y8hg1VsUCOMe/El/+bubLML0kMxy+IHcgJDKr7/rH2ou6w2f3I/Usi8aUQg
         /Fvoh6ko1EjKmjL/6hgmIJo0XgJHYg1ElgnjgSTqffBGoIgN2QMlVcn833UfxYJpoxnk
         AMSxyjfPeLL8WKDLsdAAco5psbKaG2UgDmUKmOBjH8g03MF2PLeZGgB54O/n7Y8x0LQe
         unTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029883; x=1684621883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWT/B+r7q/RKUVkiuFZ1DbVX2TD5Cvvln3noQ7CU1Y8=;
        b=K4ixf+RZ8ycGTUc671ewzL9OuV7AiAejQUtSIfhZ4o1NLe6hI0CI0qzlJMTBwa3Msp
         Tjc/3Pxfu4gbmgsRE1kTDDPwpdcm3svf13NUGPbE4gpl/1nb6fHTPJ17/r+aPUi/K4a2
         H5BHu8SRX/OM6hbfj3jyJFVGyPmu/ao+YzVAvx3bNp0wsYExsBVSw5rWrtJivFg55M81
         EKOAtAcTfvyjwsWFCzZxJnFnyOcTHlIc8LDmKGEtGT7Z2a01TW+Sx+vj0dLsb03r7Uxe
         jjKll11cXh6RbX2oU76aYcOpW8hueVpCkL+TW+eWMKwI5VBr3tglO86VajY7IlX5hSxI
         vanw==
X-Gm-Message-State: AAQBX9e6CrjF8q00koTIKerP99nunKbqWGBBH1woqruOk3krF1AEqwqC
        oMUHJUVJNseQiuJus50AoUg1Yg==
X-Google-Smtp-Source: AKy350YuA9AUlqOuw49Ln1YZYTP8MQma23on/4STSQR6nyDGIJDgDbGw/Gs5GKRb/mcbRPEuFqhiIg==
X-Received: by 2002:a2e:8784:0:b0:2a6:15c7:1926 with SMTP id n4-20020a2e8784000000b002a615c71926mr129250lji.3.1682029883233;
        Thu, 20 Apr 2023 15:31:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id w8-20020ac25d48000000b004eedb66983csm324256lfd.273.2023.04.20.15.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 15:31:22 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 21 Apr 2023 00:31:10 +0200
Subject: [PATCH v2 01/13] dt-bindings: display/msm: dsi-controller-main:
 Add SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v2-1-5def73f50980@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682029879; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=1EZeD/7Id9o6cBL4ylQ4GNUTK1f0wLzgpRCWpr/xxlY=;
 b=wcPs44uEQqo7xru1sJ+NnetyZuOSV0ot3K+yGfD6q7BPkHkYw3QFtH5LXw7Tm1g/nLRcx7x2ZTpV
 PmFalNyZAsKNw3ajQaTN5bG899GZ4jB9ffY6uOvQVN4xLUyZfp7t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the DSI host found on SM6350.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e6c1ebfe8a32..6f367a1fabf8 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -285,6 +286,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sm6350-dsi-ctrl
     then:
       properties:
         clocks:

-- 
2.40.0

