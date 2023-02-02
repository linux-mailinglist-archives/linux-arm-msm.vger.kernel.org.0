Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3E3687AB2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbjBBKr0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:47:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjBBKrB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:47:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122D6885F1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:46:35 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id n13so1033875wmr.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Mi7+OhNuEyZNc7DiLz+rkr+x6COhOfkexl0o6kozQ=;
        b=mEgF7UbOoD4G9bYatYIfcV2bTcI391vYW8nkK0m8Cy313k+1Fz7nEhlD1hKZVShFzc
         vEAOq6/fqNgRhY3Cpr9udkCLd2UowzJ9bwLFUcLINPhOaXV/jX0gnmPaN0hblljQ0a6h
         NHE+/5tSMR2SZ42Sgk8KocAAU/4kdgpsxU7byZPB4mkHt5wErybhVnP49E2BjH8jMAxt
         E7LSLEifIBeeDICOARTrlRdVLEH8vMb1UyGVKGq1u7GrE3Gqcbqr/yi/CXsO0crRTx3e
         trQN9cwrEoP7ruADKRtwDY7OC6cLwuG2ZGVVbTaW+KIL5BbyZI7zJJ4Dh8Giyx3b5xck
         T5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14Mi7+OhNuEyZNc7DiLz+rkr+x6COhOfkexl0o6kozQ=;
        b=Kyy2V4hgkvEPxgokQy5KKTBL2tOvEQwBdPhD1k4cuwAfX7V8Ms2wM8LFlFeB5/UDU3
         ttMgYWgVa72OQU7S/qTtrOxEW2AjqdZy+e2xTxNLQT6KMlxzW9COdgtsDTsV0I0yt049
         OXp8z+C5mXlDnW5tLIy9ii2E7T8/UytzCW1EN996HHbKdBABj9b/08UBDsaGlfWj10e8
         Tf6NZTGWFRCrx3tOP/8YPlfXCh5zYCaSmEDifyQ4wNFgn1dwCEuqs9jR5jkwXPhAzIHU
         3aENj+xZsOZQFNyigT/IOr0bRdIqmY5RUbhB95dabPoI3KyXXgyDdgWVrf2UFY9okzpa
         BOcA==
X-Gm-Message-State: AO0yUKWRHa2iVUpyeJqfzaFBDWMgQXPNxrFtLIozGAQrU/eE12xhPZQJ
        86M6UczyJ+gvx/drnUFS1eUmHA==
X-Google-Smtp-Source: AK7set+XVXY39Ilw1v2OLhzUXQC5zHzLGjXSoE6idWQRvdy7MLtgLVrcBGrycEByJjxnqjfbNzn9VA==
X-Received: by 2002:a05:600c:4f10:b0:3dc:58b9:83f7 with SMTP id l16-20020a05600c4f1000b003dc58b983f7mr5563037wmq.35.1675334759396;
        Thu, 02 Feb 2023 02:45:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:45:59 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 05/10] dt-bindings: pinctrl: qcom,sdx55: correct GPIO name pattern
Date:   Thu,  2 Feb 2023 11:44:47 +0100
Message-Id: <20230202104452.299048-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

The SDX55 TLMM pin controller has GPIOs 0-107, so narrow the pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index add3c7e64520..a40175258495 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -55,7 +55,7 @@ $defs:
           List of gpio pins affected by the properties specified in this subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-7])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
         minItems: 1
         maxItems: 36
-- 
2.34.1

