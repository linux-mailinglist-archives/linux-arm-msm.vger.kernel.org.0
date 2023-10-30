Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199C37DB6A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 10:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbjJ3Jtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 05:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232659AbjJ3Js6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 05:48:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D88170F
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:25 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso33370715e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659304; x=1699264104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDI+ZTdLxSi8PWzv3r7yJYlJcfM2WG+b7IpLA7iFA68=;
        b=w1r7wldoJ/xIKBZoWhODfkitl0p5ihzDkdUWh8DAFMKDlnZi1F8kZpRBaBCyGZEEeM
         WAfItwg3IAoXwqPIe37yoqVyiYd3udPubDO3aS77MViXxdhwCj19tNB92hXXQjUorIpJ
         aT34t22RB0hzkWZ7dgu7psu4Bzxc4SFKGFHUFpw6mJLuxYduM/21XoUKAjfRDjGHhgM9
         F7G5iur/rjIb52QF5l0JR5W3VNJSN/T8EHyBqnE+xg79670lGutxUuWbfSEVKH1GE2Qo
         1YgSqxuBbp0fm0FU/6uDQFMuBaxNxcgKtjsAzYM+2lkvPRinr9hWa/8SYAHJc6wGmisV
         F1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659304; x=1699264104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDI+ZTdLxSi8PWzv3r7yJYlJcfM2WG+b7IpLA7iFA68=;
        b=eDvNzFkjQYQApCVxFTRHw3Za9uAVXDUuUKlrpm8j0Nm3vEl0Nx2yJh6UCTDCmZxDI8
         8hx0iPMXtCb5joiP8mVUKCu5tPYzTHKp/gbOtBTvGZzjedaCN6GQHELHG5QcIl8p468r
         ZqZyDc+mMny0ut1kzuMFiIV5jlXheT/BaVrNqFpezdYgqFh9hlwh0sl2dSaBc7vZ2O+P
         vqef20lP8iXOcsfLJc7mI3XhOYuD1lVBVzBCEaX+kzR8ysKbGZ0wPMXi7MzZjIeoi4V7
         ndOPTWrrh06R/4bJWPquwBr9gxpMijg3/r2+zmAC3AeGqSOKMQenlEkDEJkc6dP+/KE3
         Onng==
X-Gm-Message-State: AOJu0YxdmXCKDrYgyDXf8ChpwLu5uAAYI+Euj+EzouGqN/WTLHj11Wut
        F6OX+WMkR2DLJcBqTS41+5+G0w==
X-Google-Smtp-Source: AGHT+IGxVy46ObeiVkf63uvCsjQq/OAiy0EjFOfx1prvjWtQb871K3UduH3d6wboTtM9TJE2nOma5A==
X-Received: by 2002:a5d:6ad2:0:b0:329:6b3e:d87d with SMTP id u18-20020a5d6ad2000000b003296b3ed87dmr6196864wrw.42.1698659304210;
        Mon, 30 Oct 2023 02:48:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d444e000000b0031980294e9fsm7854256wrr.116.2023.10.30.02.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:48:23 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 10:48:18 +0100
Subject: [PATCH v2 2/7] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 document the SM8650 QMP PCIe PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-phy-v2-2-a543a4c4b491@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1487;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vqp0R39R6XOLi73u87t9lfEkW+pxzsrFjm3NS2YeV3w=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3viWvR5lAGJi9KX6YQjzgrxzRUrtKm4TaRq0jMb
 JDhOrYOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT974gAKCRB33NvayMhJ0aaYD/
 9l8QsLy0Slqim7ZLm+3ty/KHBzvV8Wb9NjB+ZhhYpyUH8mVBd2jzV4QQjegTM4FAiKiALi2r+hlX0m
 ufBCZWvEhbTncgFrK2PBp0TOhxrfk1vxxa6IiNKXM8qtbUg6qpIWwstJQldch1cyiBZPuS00OB8pai
 QOil/WV/qsmbZeZ3djhvFVnxmUsWohhNAzFLJJNjLqyG4s11XhYpsZ5QWIa9R7SYuQOpEqYnezvtqN
 Sw6blt0DyVpbEylhEm4eztlKSdG7ETuATvdseUJi6EmkF0sVCM9bdGLbTnZ6dNXu14oX2QN6wE6EYW
 X1v4dLtdc0M+SSWG+Zh0o3JKOl15ePP9ktWdx7xkL1OA2hHmW1CLZ3Oc30IlRSwb1VA85CA0vbYvom
 qVCfXZd5Qh2TqEw+pcUnkXVttgY1uvoY3Jd6V5NPAMlVm2+VVnWAidyNo/kWVYAVg5RsL593A3e5DR
 tOrhO72JGdOvM7e5jiAWoNYUR4u2FYk3WGT9/bGVl6cS7sOIytH/R2vYHF2/oVRNr/tUxv7dIDdxSt
 2pMisLDgoXJbs1+4vJadZbc0bmUiu7BjPUyPsC5t2W37HBuMCtTBOHy3kxrYDSYLsCv2kBOn/899cd
 hjLLtvzAT3TfS+BaX+5TBOM4/SgC1sDeg9fZe0YXazYkEwblC+oljJZqbtKg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the QMP PCIe PHYs on the SM8650 Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 2c3d6553a7ba..6c03f2d5fca3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -36,6 +36,8 @@ properties:
       - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
+      - qcom,sm8650-qmp-gen3x2-pcie-phy
+      - qcom,sm8650-qmp-gen4x2-pcie-phy
 
   reg:
     minItems: 1
@@ -147,6 +149,8 @@ allOf:
               - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,sm8650-qmp-gen3x2-pcie-phy
+              - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
         clocks:
@@ -189,6 +193,7 @@ allOf:
           contains:
             enum:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
         resets:

-- 
2.34.1

