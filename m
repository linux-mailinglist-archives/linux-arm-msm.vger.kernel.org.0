Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA5C6F8B5B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 23:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbjEEVlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 May 2023 17:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbjEEVlh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 May 2023 17:41:37 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F088759E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 May 2023 14:40:44 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ac8c0fbb16so10641951fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 May 2023 14:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683322843; x=1685914843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
        b=mGExL8SrQ5XCe3yqvDTrnGVkTIhBUhG8YPsyQ1/e/44Q3cEhZJ1/08XjzeuiRUyQD6
         M7LB6Ez57o3AzvLFjeyAWMJALzYXdNP5M+2jminPeixrUPikkepbM+Bm56WqlLmrBYfw
         xKPWLHO6S0mh/OQ30sBadObt6s1ZrWJldEJ5AiUbHKsECbbpI1IdFDU+3k8vdctN9mBE
         SG9OPTHzZjUZY+VcadBG3WVZvfW0b26y9XZhml/nM1KrjY7pd5EcHbn90zlgmvZQEHKY
         QnGsUU3nMC72ua2pgZZ2l2gEKdrQfbjYoR+3X7r9uojNgEerTz0gxTkVc2hX0l8wKsfl
         Sd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683322843; x=1685914843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1+Xx964Do5+Dd75p0npXtM1tzzF2n1YUbY/5ffcryg=;
        b=SzH24D4jhljTB+jW0revmBF/WWY5GAPmGmG7i7xvSXqZw7quSr+axv3B5G06cvcI67
         Ycp9m68zpIrDd4Di9cNpTeG/4kLMvyW7dJiVVPrL3/hdZWpaJHcRS307Dx/8XZUtOikS
         keluRsGReYaLJ95h+hIuLHtfSUjw4WjrWE4S290oFz7cXUVZUi+hFQyTzznsoqf6FomJ
         D7fWFJHdjWlt/BLVuGtpbpebw3Ueg0A60v29HA+dalk+pDK6ExFxBi9D58GkwXwYqfJu
         ndRB8DwuKpO0dnUDliITd1LLAS1c++xXRN1+QrRU2cQjMKdCF4DQctAPpap54z1PFLYR
         rIJQ==
X-Gm-Message-State: AC+VfDwxppWxW7AKZrBDquZ57u3SRYO3FiehbXlLkLJghMtxl46WsmWn
        cSTLoOaBFONpaVCo5eswZsUscQ==
X-Google-Smtp-Source: ACHHUZ7dbutd62hVffBmQka6SJs8tp9PNCSqis8xhLAT3IIrAmJco8X7JFwSYcMQzrd1Segejocbug==
X-Received: by 2002:a2e:9202:0:b0:2ac:7a77:1d4e with SMTP id k2-20020a2e9202000000b002ac7a771d4emr790219ljg.24.1683322843242;
        Fri, 05 May 2023 14:40:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id n12-20020a2e720c000000b002a776dbc277sm126453ljc.124.2023.05.05.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 14:40:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 05 May 2023 23:40:27 +0200
Subject: [PATCH v3 01/12] dt-bindings: display/msm: dsi-controller-main:
 Add SM6350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v3-1-9837d6b3516d@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683322839; l=1129;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=+O75/n498bCPQBt/QSpDKi1r6jFyvKeD8W9H7IyUIm4=;
 b=H5Kkgj24gPlGZUMzlH7o48hrPaPJDKbNQlfIh6lS7Er20KgpF2LUCpCvwkInzjXJDZ0bDJ9aS
 6QteD0gUYBmCf9xOsDUgvrXBc64n/3AF6qfnUgjhKnmSXHBb+EfyOrm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
2.40.1

