Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1535F68F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbiJFOHa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231251AbiJFOHU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55522AE200
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:06:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a12so2356855ljr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d4TLcCDcfJYNicU7tyVqnAMQRveCub49ISfUv5I/EgM=;
        b=O6XR8OeWsebCWAMnueVjJCXaqr1HRNpspu2+77EBzc9q8Tb5e6ugCmS01L22AMft4/
         l89k2nJFLxAd0b+h5/hInpgMR0JH2PeZ1TWkrJd35+KFKfXxt0hDL037m9pszWm/kyfL
         K2i+bs0HKeGm8CrsJ6m1J74ErCS6n9C9CJE5PWzuOARM0Cww1mos0J4dPH8HbGj8Ht37
         IO8jfzJmfdUQ6x3DxebXYH/Pgc2NDJtVBl4dBIjnqr0l1VgpvXhaAJs5iuUS9W7p9BbQ
         BUz8258dhEcJIELJO0Ijh4HQulyQ/iiqfYs7pxSGWgaDQv6pSr11oENr0MTkxgbs6d8l
         zFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d4TLcCDcfJYNicU7tyVqnAMQRveCub49ISfUv5I/EgM=;
        b=Juo4iikeai/wnGLZ6smb8HHHl+cGfkjg628kUSC3Ph904UesTmxgeYFsXLsBd/Mtb7
         7B8HV34eQshcTXOWg/3tJkQDMbLRl2cRw+3TtyG7L99a2RjTNpbpTJbUXRtjYC3rRxGE
         GgOdYEzFJN/uaJUOCUtHhrYumIOxkKafhan9SeqGS2OnO8hMhHv9cnM3gBcwY3lxsTZH
         0HCVR/4JmpVuO390yqVmUk+P6Vm+wUnHJCqVaRQSc7tfi/5x3NlaWEjY2d0YBGQrhbDY
         DkJbKhz3jFL1hS4A23aBUMPT00hXrAEKnkxor+4yXtb+p8kKWmL1xfska8FEtEGcKRFv
         nmFg==
X-Gm-Message-State: ACrzQf2FxDzVgRB4NdljJJeNXuiN93BZu5O15O6M+mnWvm4rsa18tupe
        sbuiLRghOYL/zWeB9BkiAu5RLQ==
X-Google-Smtp-Source: AMsMyM78xZvp2hUXY8ZOuP5EYqAR6n9d3icvCadcJBC1ZoG9JUZGkx9t1II01oILvTFVxmmLstUZow==
X-Received: by 2002:a2e:9d8e:0:b0:26e:3e2:2ebc with SMTP id c14-20020a2e9d8e000000b0026e03e22ebcmr1047373ljj.166.1665065215926;
        Thu, 06 Oct 2022 07:06:55 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/34] dt-bindings: pinctrl: qcom,sm6350: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:13 +0200
Message-Id: <20221006140637.246665-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 94af82ee5967..894e59caa735 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -53,6 +53,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -110,16 +111,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-7])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

