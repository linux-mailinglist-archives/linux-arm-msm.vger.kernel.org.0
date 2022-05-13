Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED69526D24
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 00:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350772AbiEMWv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 18:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381607AbiEMWvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 18:51:24 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66261756B7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 15:51:22 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-ed9a75c453so12224529fac.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 15:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kua8B4khAkEth8WrkaEZqbJEJzxcds7bDIq6qGKeoAA=;
        b=LYr7gat2Rwi6lnoMITQx6Wg+OlJDVuSYTte8B0VtIQPVFl7hehb0Nu41HE+Vp+KDcW
         2LP7wQ018/Gsd1fpYoesJ5oXAoPhBK8PJkSHIrpD8J3guAzwGgqShC8FWrK7FtMyb+BY
         gRrKK6osH8mDnq384UE7AGJymdwVLIRHciOM++u3HrIre+OqQY9ds0vChidWCR6eyYTC
         oF/98ZLYUIQ/N/W+lyrfqG0HqIJLYBSbqq/xsl7+fKUOczJWZEJFs2p8/bnWEi9LoFAd
         F9qrxw/bNk8MvWi7JyrMdMKlTGVo7fqBoX1B0+i8uLUpMv1K9LAk0DG1JCaq5yMFZDby
         wuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kua8B4khAkEth8WrkaEZqbJEJzxcds7bDIq6qGKeoAA=;
        b=LhkEt0I4cbZyHLS20pdkPEuImN31UzOBIU9IXUOWnzBb2D0SbpFI7Jh0sNLMzsHoj1
         XdmlrNP4Dg7vwzEInPlXJh4Ftgzlqs2ujpKJhnQXy1Mr+A87rJ2giOff8OZ8ZKVt+lYY
         X/nEG45LolX/1MW5sg93XgvLkCft/tXbDy2IvPqaBLsL5atTfeJdsLICDs7o/7dRGHz9
         23xl0cq8M/kY07UsPyUFmZtVL6ZY5XBp3/5mVxOq/2pGidX9HUm3NcDb9644qvdbbg5C
         A1rRfDfN07OC9qYUAkHmyi7T7MTjnm4ehjQ8G1H7c1qpj606D3Jycl1Bt1w/t3+mLxjG
         0EMA==
X-Gm-Message-State: AOAM5320U4f5FZqfM78vFVofY2MB8BcZZlcSFU8sDF15zJfg+gv2JPsB
        fDRjcRuJ2Amu971lKNAUIVlizw==
X-Google-Smtp-Source: ABdhPJxQcfhFWjlJ9JKtJ3WaK8g8TNN/nzSOi6RPcULRnRIlo3Njy5+RMC4zs4dZur9aiM3tMCxZIw==
X-Received: by 2002:a05:6870:c093:b0:ec:c13e:f938 with SMTP id c19-20020a056870c09300b000ecc13ef938mr3712741oad.123.1652482281834;
        Fri, 13 May 2022 15:51:21 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l9-20020a4ae2c9000000b0035eb4e5a6d4sm1592679oot.42.2022.05.13.15.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 15:51:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: phy: qcom,qmp: Add compatible for SC8280XP USB3 UNI phy
Date:   Fri, 13 May 2022 15:53:46 -0700
Message-Id: <20220513225348.1671639-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
References: <20220513225348.1671639-1-bjorn.andersson@linaro.org>
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

The SC8280XP platform has a pair of 5nm USB3 UNI phys, add a compatible
for these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index 8b850c5ab116..0a9ee5b7600d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -33,6 +33,7 @@ properties:
       - qcom,sc8180x-qmp-ufs-phy
       - qcom,sc8180x-qmp-usb3-phy
       - qcom,sc8280xp-qmp-ufs-phy
+      - qcom,sc8280xp-qmp-usb3-uni-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
-- 
2.35.1

