Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5F52FF59
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243485AbiEUU10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343545AbiEUU1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:27:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CFE5AA5F
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:23 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p22so19511474lfo.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rqljFuyKHWWWcWCRfpwWBisSLFaKs+0DUCstH3t224I=;
        b=iKtfrAQUQUqzGuCuyaohnaklzIgs5LB0CbtDz2o1eWNTm6f2UketT0ExqZMS+F16hf
         8lZd7CvLTmT8ZVKyYsRy6FtUmqh63WZJ7Ad1525lpv5PCCLBobKhEIwlgQVrzr0XNzLr
         aQNyN/uGTU/O4P4mU9KPWt30zZbmO+FMQ8f2o++l0q+JD+KhLtb5VwnRo7/TVSEHorwn
         uem7kaPaTgWB2Dwfm9gGBcMn9IwSsi9WsxYdhUIYekR1AbhXd7laW9Yjja+Xsd1CIjR7
         cmsMT8dmE1BIVmTzZh510Et5cg8KueZa6bFWQ/ePyhK7NcYMsCV2F4K+8zUxacqeWn2/
         v9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqljFuyKHWWWcWCRfpwWBisSLFaKs+0DUCstH3t224I=;
        b=tpBJI7UosJG/vbsDkVXdAe8/aH2YKELk6pHi5G9qf+TwcwLnBfwPnb7H89i1mppJFs
         WrVFT/DjS3zwMmIq0WBTIp6ydjfFSQt+JyT2fF5hw4yR/R3Oyv5tT43Th+Ln7fSxXtbP
         CmbwRI3OJERbl7x2aSbgeqsSlGbnfFitgYcHTkdR/UOuTJp7/6+8B050NedM2uPfgdD7
         H3ZfLFV7l/SiV9BDugvYdhRhK66TpqKyi7tv21AJBacqt6dzMfcEStNBWrctGxI51Zui
         xMcgqn/sraSL4l6dxFpmC6sCgIDL4rZOIJjqFWUjP7ILzCIog8jwdEszfNxb5pkebEB9
         46zQ==
X-Gm-Message-State: AOAM533DheL6W/gwi2PMcSNY4/01mtxsYE7ouYYuacbFLxgk/T0oDUpF
        H5HSY/E5Pm6GKVA6noYVRtkVfQ==
X-Google-Smtp-Source: ABdhPJyZawqyZonpuMnDUfSK7YBJspBgbVFISUC8/t1PgaCC7kFANU1LPqvT2c56huTxU1tCvZkrcw==
X-Received: by 2002:a05:6512:39c1:b0:472:556e:b297 with SMTP id k1-20020a05651239c100b00472556eb297mr11308606lfu.564.1653164843326;
        Sat, 21 May 2022 13:27:23 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id x1-20020ac259c1000000b004786291114fsm317773lfn.140.2022.05.21.13.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 13:27:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 10/11] dt-bindings: arm: qcom: document sda660 SoC and ifc6560 board
Date:   Sat, 21 May 2022 23:27:07 +0300
Message-Id: <20220521202708.1509308-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
References: <20220521202708.1509308-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5c06d1bfc046..29ce543da391 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -44,6 +44,7 @@ description: |
         sc7280
         sc8180x
         sc8280xp
+        sda660
         sdm630
         sdm632
         sdm660
@@ -241,6 +242,11 @@ properties:
               - qcom,sc8280xp-qrd
           - const: qcom,sc8280xp
 
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

