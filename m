Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56D84C0B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 05:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237850AbiBWEkl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 23:40:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbiBWEkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 23:40:41 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B0C53E03
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 20:40:13 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id 12so8965919oix.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 20:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsRICSn/v/bxa2UPxGZA6ohcDIrS1JILrK1mA8xJ1sM=;
        b=MtKTSE6hOugw+wabSEoE2OSjauzQDZM2iYlBI9ljINbu2I9Aha4c7jS0rxVXF9r/2c
         KfuX+1zlgoTw1C5N3iC7v8gJfjcb6YA9a08PcPBJsgTBzwHppWGzG/MgV5lndag4aVMm
         ADOLlpH84QVnLYS2FJBureW8Vq378WM9/eJRqFtlYrXZV99VqTd6BysLABjSDlxTmFqf
         MZ4N3kzH+3VPG9lBvZ6w+LiYq10sZADNn4Ql11zzwy2pjqgupMrHx0QZ2zLFQPS71ZGi
         3ENz4sOagvf1cDTdkYZ9zD/RA8xdooL3iQzyllskpt2L1TtHdM5u1HPo5fqLKCgyPq4u
         p0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dsRICSn/v/bxa2UPxGZA6ohcDIrS1JILrK1mA8xJ1sM=;
        b=4f8xZcj1cmnkxEmlNpYOTBNhs/X/Dzkz7OaZzBv+ksqGTOvrQ/fKVf7bOx+y5Gd5Vz
         Lb2KBZY2yDVupQpDEf79CH1DmXFNrYzFBcO6nnOoFuUTbfw8LkAgzyqPac6Lz7yLuJ6C
         5m2Usv7a42yeqS/tdjf3FcG8ylrV6VWpu9F5Rxn9rYvzVM3PYkft4URCCHamsXq2+Jkp
         1vwrHHtED9icujz6ADimsljPnuA53AlWUUamywS5OLxmirhFmIMRyyUpYLhfJ8xptIql
         fCRFz1vC5BfQ1VGveNb48kie/KIfVn/51nQ/F4H4Imo/fZLhxFUEjmKXG1PDGHyakiTT
         ACyA==
X-Gm-Message-State: AOAM530BSadwIWH5jmxsgYRylD4QWw0ydFIlecPF3X0iG1Z5jiclY3f9
        aSZHot44pcBdYNIC1Vk9HmGAveV6Ix8pdw==
X-Google-Smtp-Source: ABdhPJxGR18ifwlVddz7t3QMNx9RO1Y7RolZ4RAfZ5MQCWauQAWAk0VK+DWH7WoyX2k6g75V7LvcKg==
X-Received: by 2002:aca:b206:0:b0:2d3:fa53:4fab with SMTP id b6-20020acab206000000b002d3fa534fabmr3626425oif.174.1645591213041;
        Tue, 22 Feb 2022 20:40:13 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id x22sm6250033ooo.20.2022.02.22.20.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 20:40:12 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qmp: add sc8180x and sc8280xp ufs compatibles
Date:   Tue, 22 Feb 2022 20:42:12 -0800
Message-Id: <20220223044213.3776600-1-bjorn.andersson@linaro.org>
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

Add compatible for the UFS PHY found in the Qualcomm SC8280XP platform
and document the required clocks for this and the SC8180X UFS PHY.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e417cd667997..455317dee5ea 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sc8180x-qmp-pcie-phy
       - qcom,sc8180x-qmp-ufs-phy
       - qcom,sc8180x-qmp-usb3-phy
+      - qcom,sc8280xp-qmp-ufs-phy
       - qcom,sdm845-qhp-pcie-phy
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdm845-qmp-ufs-phy
@@ -280,6 +281,8 @@ allOf:
               - qcom,sdm845-qmp-ufs-phy
               - qcom,sm8150-qmp-ufs-phy
               - qcom,sm8250-qmp-ufs-phy
+	      - qcom,sc8180x-qmp-ufs-phy
+	      - qcom,sc8280xp-qmp-ufs-phy
     then:
       properties:
         clocks:
-- 
2.33.1

