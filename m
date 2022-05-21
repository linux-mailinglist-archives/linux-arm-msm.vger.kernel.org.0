Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 150E052FDC5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 17:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355374AbiEUPVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 11:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244914AbiEUPVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 11:21:10 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3819BDEE2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c19so5714598lfv.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wMN63lCZacnROjhfQZw+Egiz/efYaTo/kam1dhAdrNg=;
        b=ZOApLFIQO7+wtMWocm5qLEkFDwlKghTWb6bhel3qLuXKx5Lle3xCwoKUXT4sQw11ar
         2Cwiz8iXMb0TfYrKkwmAZ9YgaDe74tE5gtcs9DGdglWqVdkGMlNfjEg/JliYeYXzxpVC
         nEwwJuv6EUY83hdA44hXerl8ep/IjbXraHse5lTJ+OVfKdJLNchddL05jSxPhjupqdzS
         jX+5l7dW0BLUPXYA9nWmtfL+/HL78OeS+UD+URwxBfKxJfwJB0CqM8mbburFtcVAKeKd
         zmQaoFXIrSY2Nqzb4dXG/0V+Z58grlFSh48JMu8fdxywh8tup3T4eRIjRdj7Eq+qPZfv
         uh3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wMN63lCZacnROjhfQZw+Egiz/efYaTo/kam1dhAdrNg=;
        b=hCnIImbqT8cgrOCwgndcGDQcYrKkwPMosT/02oHCZvtoahwLyG6jafU5VPTYuY24xs
         LKSdR5zlT+m9F/E3Pu+2uOiCrgcdSthYENxqs1AVLX8qjYX2uqJPy5+dMqvWhxjy8hh3
         3B+o7ehauZYvp+XKpQnWQbct05GiBHUG+mjtFLALUPZBLesk0TRKLECSUJCpl6TuCP+a
         TmxRDvKE3QvgLpuzwz8drwKEmdKPBjS5ZG3po+nJvw87RLUtojDSmSmT1vWVJsX7mWrD
         K+P9qfhCTb3DBdfabF08D7XMQ4fFWWLbodVUWyh6ApMkIKvSNGV0YD0j3fsqGaj20v83
         6Nig==
X-Gm-Message-State: AOAM5323Q3COGq5z01kl4PtIif2yA5BXUfwFiYl00fACvCRBSu2CIrJQ
        qqXPMXAtcrT5PK992mWN6A+hfw==
X-Google-Smtp-Source: ABdhPJzv1zSLl8fRm5s9ae/qAigRlmLvW1svY/iPMTqvppD24ELjYOmD4G7vIhs6VNx/6oTs6TqbGQ==
X-Received: by 2002:a05:6512:4009:b0:46d:31b:e05a with SMTP id br9-20020a056512400900b0046d031be05amr10676695lfb.528.1653146466578;
        Sat, 21 May 2022 08:21:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id k8-20020a2e92c8000000b0024f3d1daeccsm739933ljh.84.2022.05.21.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:21:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 11/11] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Sat, 21 May 2022 18:20:49 +0300
Message-Id: <20220521152049.1490220-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add binding documentation for the Inforce IFC6560 board which uses
Snapdragon SDA660.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

