Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD9B6C4975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 12:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjCVLpu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 07:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjCVLpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 07:45:45 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB54F5CEC2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:45:43 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id ja10so19002626plb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 04:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679485543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45NVBVpYiF52cvaoHl0w4JJTLlfK1ZDLXhzA7w3zmPk=;
        b=QCpJz+I0YyR3Y8UkVEK9iQ/AZAdzUodv2rQnOxKrEWSDxgDV8DY3JtFwCbJO3t7JDj
         Hob3jgIEaE9lZrWnPa51rwhT6QLJPKYyxoWIx2O8OMR9uNx30QTb7rYeeeCvC3s13pgs
         FCOkhAlHaCtfQWJjPqj3eleMj1fK1fSQ+lnWysUNn8qgmb8OIbL5ZOeneaqpdiHptTMj
         nz5mMwZgXyKpHqt+brMwl2eWRlXy19BoENSXjZaGvpbN9i2H0hIUStbYS+rUbE5qztd1
         1dWyqLnzkSERcbqocR3FCVVj7pRHI7QTWS9cIOn6ruJMn5BMFfa9EmVoOGuHyWjOypwR
         mPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45NVBVpYiF52cvaoHl0w4JJTLlfK1ZDLXhzA7w3zmPk=;
        b=7a9cRwhb7zrSNkKnDk40JFsHOLZZgPvQC0wQwtdQSpqeUB0kvpn/73xdMqmXj5IavO
         kxv1RRDzFtgYFNT61gvxC0OXkQ2nfcq4/P3W3IVI25amncFQZppPy0ezXaW4vRfnS1WA
         pBGRCybrbeyxr2dxDKLNPp3kmRHKai1Zt7pe9kjF3GeJyHSzH1O0NbFnGs6x77WBQWrZ
         Id1FkI9RvKfN1vQDV3NvxAZCp+Ghd90C03Uhj0+47J0+UpcHp7VNZVfC9gekEEbkCEeu
         5OyIrv8XCt1oeAL9Xjf7dSDvzJAe6T+EuHwiLbSOYVp3iQzI2O9xNZ/OzTtdjLxB4wMv
         6eng==
X-Gm-Message-State: AO0yUKWyD4GZSngwZoqYKYd2rcmCYENY+MvEGRJcAbm2YW7xaVTksFHv
        WpXwxK6Aiu1WHiQhBzHKLD0x/AAYFM8f1pBtBbA=
X-Google-Smtp-Source: AK7set+7LE4DiuKvUMqEeTlogwTHF5bRE41vSvH34T1W4F5A9KNupKEL1ddxRbsh/OcpIErQ4Jog8Q==
X-Received: by 2002:a17:90b:4c43:b0:23d:21c9:193 with SMTP id np3-20020a17090b4c4300b0023d21c90193mr3430944pjb.2.1679485542718;
        Wed, 22 Mar 2023 04:45:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:d4c3:8671:83c0:33ae:5a96])
        by smtp.gmail.com with ESMTPSA id jd1-20020a170903260100b0019b0afc24e8sm10386649plb.250.2023.03.22.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:45:42 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v2 02/10] dt-bindings: dma: Increase iommu maxItems for BAM DMA
Date:   Wed, 22 Mar 2023 17:15:11 +0530
Message-Id: <20230322114519.3412469-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
References: <20230322114519.3412469-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since SM8450 BAM DMA engine supports five iommu entries,
increase the maxItems in the iommu property section, without
which 'dtbs_check' reports the following error:

  arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb:
    dma-controller@1dc4000: iommus: is too long

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
index 624208d20a34..5469c9c2a1df 100644
--- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
@@ -46,7 +46,7 @@ properties:
 
   iommus:
     minItems: 1
-    maxItems: 4
+    maxItems: 5
 
   num-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.38.1

