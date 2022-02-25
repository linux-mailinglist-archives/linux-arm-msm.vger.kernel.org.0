Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7E04C3C7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237046AbiBYDjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:39:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbiBYDjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:39:23 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 433BF17B0C7
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:38:52 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id g6-20020a9d6486000000b005acf9a0b644so2763440otl.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnXfHtdU2dmF+bRIs9i/3/49SI7ksFP4+CUOpW5LUCM=;
        b=A61Hahea1bfexZmqVnRRpHA8a0I90W04xKaxHoyWH47bxY7X0uoVQAnujcpZHA5luW
         7iJyj86bn4rDaf8s5E0PWa1cOd7TxhJq+dlFM2f5ihHxKeZzIWnvHOP1scWY2376hbM0
         0NFqjaJkgUmKx0RUXOdZ2uHxV43Kh60osc6u0jzpGyG0w7zFdY+loLVJ7Nt3se7tm4c/
         2bnnMWrBk7Ex8jFLP3CmOE1WT+YQOFIlpXc6xhGljo0qsQXTlYcyKb3WBczOVrgWz8G6
         pnh788gQkRyb7thgXdDRa/FATjvSi8tReXb5uuoSXEdtiI6RYlrL84igSYXVuzFinMAA
         AbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnXfHtdU2dmF+bRIs9i/3/49SI7ksFP4+CUOpW5LUCM=;
        b=PSzlyCEH9bJ6aZG96HRikmBJ39ZNoFa/HIEMOAq32Gx+S+2G/CXzlltVWowHEYt/eJ
         /woMGJVmKVTnNZ57+0UAf2NSSYBrj76XilO9uRmvRevLYvTyC4bcLPUV8VyWqwh/Wk7a
         LF4Yc//A7nzlzkrYPN4NYe1bCo6fE94H17ko2HfBfaAgR6xW1PDfBC9a8PklMjAIIYOD
         NISOJlrxVcWmrdKaNT3w58Lur7l1iElwiRS0Bce0qD7B7x5TAJm0SpAWztFCu+Xv8sLD
         S9ZhSytlYRYGTQk6kldieCcg5hfKEEwGFl64iDTIqEIh3EeNwD84ufn9yv4VA1Karqus
         Gd2g==
X-Gm-Message-State: AOAM533lntX6+2YrPrrMxJQyEfhtLkroj/m/kM9uWsGekQQK3CteM2rz
        vkfLq/qUUfLJGus1I+DiPxjNxg==
X-Google-Smtp-Source: ABdhPJxme5mSkSa+u0Mgeo+AjXvnrc4v2vvCZ10Vi1iBQ9PUoyLFkiqYOSWx1BQ4aWNV3Lbh9gTH5g==
X-Received: by 2002:a9d:178d:0:b0:5af:8e58:9ff2 with SMTP id j13-20020a9d178d000000b005af8e589ff2mr2127787otj.87.1645760331614;
        Thu, 24 Feb 2022 19:38:51 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id fq14-20020a0568710b0e00b000d4492531a2sm809359oab.17.2022.02.24.19.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:38:50 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add sc8180x and sc8280xp
Date:   Thu, 24 Feb 2022 19:40:48 -0800
Message-Id: <20220225034049.2294207-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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

Add compatible for the femto USB PHY found in sc8180x, sc8280xp and the
generic 5nm form of the latter.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 0dfe6914ec87..1ce251de0855 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,8 +15,11 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,usb-snps-hs-5nm-phy
       - qcom,usb-snps-hs-7nm-phy
       - qcom,sc7280-usb-hs-phy
+      - qcom,sc8180x-usb-hs-phy
+      - qcom,sc8280xp-usb-hs-phy
       - qcom,sm8150-usb-hs-phy
       - qcom,sm8250-usb-hs-phy
       - qcom,sm8350-usb-hs-phy
-- 
2.33.1

