Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A52C62BC49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbiKPLpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239096AbiKPLpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:45:21 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F05EE19
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:30:25 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id j15so29447900wrq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/T1k1/h1SVcFtI7d/+OZBX9Dlc5dYWuYExgqp9aLiI=;
        b=XrX4QtGWWk0zDYz+B3AIDFQk7tL9vbFPyrTaoTaHlZeSCTquETGRrnjP3+6gktpBHi
         +3n5Xhwc1mgEHhTeF8+PTfwv/SiAUNnVqtIzvdrpmnOZyBMzKKTDaaqXqMRX3w1s//3/
         GZKV1TS/MyTY/dNqjyTOPMuAEYXJ1ZoujLuKqX6cUOH/QA46vxj63/HgUvmFL3j3syH3
         +p++ruOhg0i/E6Ea1ctumT/g/1MrUUeD3Gdm68275kweI93pvbNWH0TPzcuoqZ5g+BoR
         ebb6bbRSGjbylbAExRYrxE2jksSmFsXMM2G/v+IkMprlY8jUBkofHO/eiMh04Z+q1Jbc
         XDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/T1k1/h1SVcFtI7d/+OZBX9Dlc5dYWuYExgqp9aLiI=;
        b=Znf0AU6e9E6d7jkwVQZ6sKpYCWaGNDaFNd9dMGj7hfRcm+OB5nGzktp7pRGYyjGNIC
         EnfPyrl2S6BCUMQ7fILuDotXFnNbCERzG4NrlSvcOOcU+YZ/XQfxpB6nHRhFBmmreYya
         wKm/R6gSLPwEVias+wPikff4UOsgw0XH9IOw48Pk3NtQgfXoItucmaUmseG1uo4CM7bZ
         NWVjPbUGcYf0iJOVgtwmST6tt01jxDM4wRj1D8eoo0mVsC36g7t7b7YkvkGYkMrsTdcI
         EXDDRV2rV0QHUX9bnYEiZRdDPT+BWC8itJ53LplpJVa0Q0cP3az00V0uSWUgn2wxl+2b
         9ojg==
X-Gm-Message-State: ANoB5pn9L2fHGtjWKHNCStuIdNDoBgX+XZ5b5RhlwSQFTRHJuqeyAnKy
        LqkYs0iap08DYbRoZYxGtzogrA==
X-Google-Smtp-Source: AA0mqf7oMX9VTcsoXvVGbn2G8v/eLbToNisfTbwhnZSi8DgrHYBu9C4TBXsRomh54pJFbil27iaC1g==
X-Received: by 2002:adf:f04f:0:b0:22e:391c:6192 with SMTP id t15-20020adff04f000000b0022e391c6192mr13377437wro.104.1668598224051;
        Wed, 16 Nov 2022 03:30:24 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p15-20020a05600c1d8f00b003b3307fb98fsm1929489wms.24.2022.11.16.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:30:23 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: msm: Add LLCC compatible for SM8550
Date:   Wed, 16 Nov 2022 13:30:04 +0200
Message-Id: <20221116113005.2653284-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116113005.2653284-1-abel.vesa@linaro.org>
References: <20221116113005.2653284-1-abel.vesa@linaro.org>
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

Add LLCC compatible for SM8550 SoC.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
index 5ea506412b4e..38efcad56dbd 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
@@ -31,6 +31,7 @@ properties:
       - qcom,sm8250-llcc
       - qcom,sm8350-llcc
       - qcom,sm8450-llcc
+      - qcom,sm8550-llcc
 
   reg:
     items:
-- 
2.34.1

