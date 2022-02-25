Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52614C3CAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 04:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237183AbiBYDtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 22:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbiBYDtj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 22:49:39 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C228A17EDAC
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:49:07 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so4842681ooi.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 19:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWhQoexzMJ4YVq6mliMw6qRbb7ug6Rs0Kh0Av2DrVHY=;
        b=ClafonPf8HIXuz2w1Ts+14JW+qjZzdQPIpJVXJbY65wEbjP56oQVustgTZlrh4EjNt
         Bq4b0cHnS+z/i7waQ/a3TedWx8W1Gi2ERBuaoPIQG6yAOIvAlOpcDI4keYI4Rf2ElQXg
         6ItH0NdOhGuQ3+VSO6WejJtF+ZXZsIOZ+azBgFOhE08FTE2+CLHlwqQrzStB0+oFYaao
         b8EBwCmdeaDzUqP8rGBfX9WTRG4Ya5JKYNPlpgPLU1OmgtUoyCDGQfFtXPvaP9biSL1k
         ml/tGPKK25ATmtyljNBDBFHj2VdM3/vsOFaeE+eFS1nMF/DaKegEAkXscMlsZZ5VgKMo
         A5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iWhQoexzMJ4YVq6mliMw6qRbb7ug6Rs0Kh0Av2DrVHY=;
        b=i0H8DkElB/2mtuy70sXvIaosl4QjfmE1LreEpeXqCaECEM811MF7TG+Amd0rgiVAgI
         8c/C7k0A5B5Mv0l8wovEQ2ypEW5AoB6QmhRsdCDr6zwK1d8hJrC8aXEKJXHmAuPhGBB+
         xRA07Tv/hfJ28uu3NOhWPgRupONBXxtWqFNw4AVbQGrYeb+OABR2lehyW7aag1SM3Bow
         WUSQ5eaSVUmt+gEr+ecka+xCol9VD6csj2alRugCIowa1bRqxmAlNhjZXpqZsk8T89Im
         Jmvxsz84fv0rJEN/as8i7RmQnJsOspwOaXKfyhsEpprqWy9quDvMoa6UsQRw9xZx01sD
         Rlkw==
X-Gm-Message-State: AOAM533409CoG9a1XvV5lncMyCbFLbs36ogZ+JSX5YcHa3RZHwd4ffgo
        OGabj8IW44blzxnTohYAOcz7CA==
X-Google-Smtp-Source: ABdhPJx6Aal5qcCZhdiDZiVPcmRXuc/9MkCtFBvvqaqJlQvMI9MjfC49G+hBO7uxjQUysO8MZkuW+w==
X-Received: by 2002:a05:6870:c888:b0:d4:43c3:ed64 with SMTP id er8-20020a056870c88800b000d443c3ed64mr585528oab.110.1645760947119;
        Thu, 24 Feb 2022 19:49:07 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id a10-20020a056808120a00b002d404a71444sm664088oil.35.2022.02.24.19.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 19:49:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: add sc8180x and sc8280xp ufs compatibles
Date:   Thu, 24 Feb 2022 19:51:04 -0800
Message-Id: <20220225035105.2294599-1-bjorn.andersson@linaro.org>
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

Changes since v1:
- Fixed indentation

 Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
index e417cd667997..e20d9b087bb8 100644
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
+              - qcom,sc8180x-qmp-ufs-phy
+              - qcom,sc8280xp-qmp-ufs-phy
     then:
       properties:
         clocks:
-- 
2.33.1

