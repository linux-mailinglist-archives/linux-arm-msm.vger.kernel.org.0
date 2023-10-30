Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3DF7DB6A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 10:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbjJ3Jtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 05:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbjJ3JtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 05:49:00 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F4E1A4
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:26 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40859c46447so28375845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659305; x=1699264105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOccD0C7edPjnKtGGV5EOipOupKgg2TlBe26/J19sxo=;
        b=tYeH8PJ7FZYo/EMJfOt/E+2oACT5mlkTGZCDFOT771SsyYsH5/sMw+wlrrT8HDURdF
         WYkWG9qU6U9nDJGcIWtbOsBkAVPZGY6ShtDGPuHX8Q79b0PtD9cdbETBbbSdiz4lxlmU
         MRHeTjQvIOXnnoTVmvGc2mGFiBOAWfDu18h/GpQqimULLeuPFNHsvtGksjtHGxSBqBKG
         wE6HP3OuFsgUyM9yuO3Gk0FWZ3Gxj8jIucy0egoz0j46nx09I5nwD9MJJLZy/WW5yMNk
         cYtzDdjSiZOrXaPCJ2/D1GtzQlDEdKzuon3DJdZwwHcOZ7Bzp5NSR+TJqeS2duCt4SCR
         OvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659305; x=1699264105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOccD0C7edPjnKtGGV5EOipOupKgg2TlBe26/J19sxo=;
        b=pmnRYC5Paa52SUopfrXWXo5nBZJhWU4mT2k2MAJXQLhR+bpvVrvHpxA0fLTryU4YR2
         vQQo8hRS/ERtRUHFMVUpg/6vZiFMoMF0VjmKihcEko5eNCUBxgcK5zk3zVUYBjzbw0FI
         8eNPjHw4vOP/dveS/JljUbLmDpqypmPSfYCJx1z6LCnd3YFHYdN+zHuYoIj+XqR/xElJ
         ggfDk05zeB7oxiyCkoJGutTSnqsUXo98Rvk2TXBiOr/tgCom8eXriU5ICa8xxPwN1XqJ
         o2AQ8uZNDIWdjGpt/8GDZumtJH7/6nGsDOuL7H1BnkJHjAHo+jCex4zDjtzq4EiPAQ35
         ZuCg==
X-Gm-Message-State: AOJu0Yy5kYLb/ovP9Lo7oJMcDK2yIklf3eAD0zPsmtAz7JgYb3dhI799
        jFzSuW/iSuR9a/4DbhW3cyJ3PQ==
X-Google-Smtp-Source: AGHT+IGeEbNTWBdVG7nxcyNdqEmFTXnEA9a/7+gy33ifKoZavdBXzRu7k87ubtyaY57mzLZM3iNjpg==
X-Received: by 2002:a05:600c:3b10:b0:408:492a:8f3 with SMTP id m16-20020a05600c3b1000b00408492a08f3mr3133346wms.5.1698659305210;
        Mon, 30 Oct 2023 02:48:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d444e000000b0031980294e9fsm7854256wrr.116.2023.10.30.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:48:24 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 10:48:19 +0100
Subject: [PATCH v2 3/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 document the SM8650 QMP USB/DP Combo PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-phy-v2-3-a543a4c4b491@linaro.org>
References: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Xag2WDeziAURcWKIX/6NHrH5c9ia6QiWvMigNGbt3z8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3vjxQlmpxIfopW3b3i5aEIiGCfHhCERWz5f1mA3
 wMr3ndSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT974wAKCRB33NvayMhJ0bHTD/
 9y0AvDTsyk34bvL3jz0F5B169gUc6mtWbjHWMAicrb6f71p7i1MKQk++f+/k/39W1DiS+vPrzDvXLK
 sGv/ZCapf/nB42ze+ITePQgeahiMWBdE4JvLBqqPZS98W+i4gMCRxtaq+6nxwSsC8g3IBnZvoEMkk0
 T7jv9OaanCOX6a/fKCo/NrBUcS8+Y6Y/ecesuk0Jp+N9cIi5spgQvlIuWlPwpGaDBfs9oy+sJ2np8f
 5MAWhxjIzsuMQr/VSC764QrC1TooE/5xcw/WpW6UtaaK4LPcVWgpoQ59+rf+aHZIVMsM5oQVEMIMEb
 F4m7Ba9VE/uFUlCPPNq2KXOeB0ZvvJgOuzzOnQJ8+eyGAYFrEqkzveg9p69KwONpC5itMjjMQ7SY2B
 u7lQzrdnlG6a6387LXxuIiF0fhyeknLqqwxMlFpp4GZR2zaT9Ab94XwTWCjrrUyiGHAmeC4EP+79Q4
 pudJ9CFfm2bB5Usnr+hG770YgsYTJHf211NAcyAyt+3Zodn58ObsopTy9bp/Bpy+/MJ5rvldzrZPFo
 1uyPd/SyYQKcICO6wc6v1V32glJHVKertuGO9eOvvvdc6lZwn7s9JWMKZXgTSEdm238Kjwx6OakdWF
 Xgl6x6YI90s+0pXUBQVWIh4b9VYMU1iu2kktysEVHoymKQzKjz+X7VSha75w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the QMP USB/DP Combo PHY on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 9af203dc8793..ae83cb8cb21f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -27,6 +27,7 @@ properties:
       - qcom,sm8350-qmp-usb3-dp-phy
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
+      - qcom,sm8650-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -128,6 +129,7 @@ allOf:
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
+            - qcom,sm8650-qmp-usb3-dp-phy
     then:
       required:
         - power-domains

-- 
2.34.1

