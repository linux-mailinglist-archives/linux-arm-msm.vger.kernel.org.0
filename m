Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C538670F65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjARBFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjARBE0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:04:26 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3830A45BF6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:53:34 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id r30so7976729wrr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 16:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DalCKvROcpvlYWdSE2CkbjgOeJTZvI5I/bYR1P95SZg=;
        b=lUy8laUTabeuWhRq2uq0HYvvuYEBOkaYXm8HogYtOXuPPzS0T/YzhoTC+DvdLMMw2l
         EEP+jpndhZDQTM3a9V1v/yuSBEOv/LPxTVZ6y+YaS+2rhu//XZ00LFVZ/k5kAG0hDKcT
         aDQ/RVGfN0pkQuwNcgFtwhaJeT6hI9rmJwDsO4L2DyMgBc2kXbl4YCXbj7ppZCS8F1re
         BHm3N3X+Exm51/XBS7i2HWcd1rvK8fxP6qO8uoUNnta5gxbRbE5U94HtAhqxaa2TRVoX
         tknIWml9JlaauvLJtJ/+BC+3rb0vavvjYiLs/P8AdtLktOOg35CRq6AixXn2f1OKcneg
         UByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DalCKvROcpvlYWdSE2CkbjgOeJTZvI5I/bYR1P95SZg=;
        b=1mcUaH/gi0dM0ZTffo5eZrbHX0BgNei9jBM+/YorWu7UiX+cXoa05HdtSmqO4GUqyD
         +A1XcE0gSW4Cw7zLgStz6GhXrGpms8KXs9ANY6ZO9azcPalyltisU7IM0GvMGmnq8PAP
         BZkyisLwhYZelS8ZJS8zavm4oYoaQS64HR21rJyCb5mzh5pGnOzIgsUB5rFRQXTegq4n
         x3x50pVaQ6G6duB5a8KbrvNLTDL9Ka1gwRmXIHCX72shA+FzSpYnARqQ58kedO/x6YYZ
         3HqGBLyU05qNN3CSo2oCJUUj5X2WM1O7zQSA4srRFgHfRJyf4Fc+dvtpUqXZ8+B5KHpj
         A3Sw==
X-Gm-Message-State: AFqh2kr9lJsOO/yTGLP5fVvfrdUqkkzL8hv/Y5XxXqBDgwR7quFyDA6u
        y9I4oKcX28T9f/zQ6qPwV4e9Hg==
X-Google-Smtp-Source: AMrXdXsa6fqwlhsBt+oOnfgrFCzuV/PxFrYKxo8v/+NPuvbW95EznmuuPfTvqILwrCLL0czmP4PbVQ==
X-Received: by 2002:a5d:63cd:0:b0:273:6845:68ef with SMTP id c13-20020a5d63cd000000b00273684568efmr4076091wrw.60.1674003212740;
        Tue, 17 Jan 2023 16:53:32 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm29609705wrx.21.2023.01.17.16.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 16:53:32 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 1/8] dt-bindings: phy: Add QMP PCIe PHY comptible for SM8550
Date:   Wed, 18 Jan 2023 02:53:21 +0200
Message-Id: <20230118005328.2378792-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118005328.2378792-1-abel.vesa@linaro.org>
References: <20230118005328.2378792-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the QMP PCIe PHY compatible for SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 8a85318d9c92..65f26cfff3fb 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -20,6 +20,8 @@ properties:
       - qcom,sc8280xp-qmp-gen3x2-pcie-phy
       - qcom,sc8280xp-qmp-gen3x4-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8550-qmp-gen3x2-pcie-phy
+      - qcom,sm8550-qmp-gen4x2-pcie-phy
 
   reg:
     minItems: 1
-- 
2.34.1

