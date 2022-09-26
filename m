Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052765E9B23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234255AbiIZHs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbiIZHr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:47:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA633718E
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:26 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i26so9458397lfp.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=swAMWumsDo3YqkhHFZ0ggYaEkP49dlEnbQstPrv80sw=;
        b=NrUFoQAxSmBC+loWlEONVRFSFVQzbfn+ZvCH/O7cLIJ6E8sfm5fyIrETjo8xHxIPDS
         nTOYsrUcOGWYwAWjzhHhku29XxFNpzbyp6lmH3oI7xu8Cf+EnMcBmzjhLg1SxPmnV+A0
         X9O4Vsa04kCMx/IE55CMBHhMGxhpU8/k7F1xwK2Mf4ZWkRyYvusFi/26gjNYfbUZ+CqD
         VeFr3lIO076+3xoOipgG4I2Jod4jRk+aOCmMEahbn1xyQ1k+HRiJToWYqcfJv+EVvoT9
         B01tJ3pW7zgSSLDJ3k3GzFHJXgCtF//b2h1ra+sPQfjFjzYezjgsDOBnSosMzWueXlWh
         jBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=swAMWumsDo3YqkhHFZ0ggYaEkP49dlEnbQstPrv80sw=;
        b=7328kvZnmY0k8TwQtnFBSyZ86H8nYSVzxi7opRNnZktiif3FU9U4qHLcPgVsudW594
         kkP+GEx/43/qS1O04jO4OK8P+8eu/CuLdyalbel8xUM95O6L9uDQjboX9jBuEXgkRxhm
         g6BHPHtmfJilJ5TbXkO7E3QRBzMyGVU2f6MwEpyvzmfmlKJ0Au5MFbVdQWEmRPWqEx/P
         BMKNQ/SllORlULR2yB4JajgGO45zFcKNa7lfCR4Of4iymEElz53ZQzoOHcSv+JfNjqiS
         Lo66Jc6Ces2qi5PBMWbizjeF1ELyM7iQCoX6VeqIEstytpjwFT+E2m6ZBLxA3QBE6lvy
         gV3A==
X-Gm-Message-State: ACrzQf17uqLLJchwoc4cA2kdvv36D8QjcB/MAhNo6G0BXZdElYx6oXMT
        NGSda76P5ckmav6a7I4nFO3SFg==
X-Google-Smtp-Source: AMsMyM7dGeiaQaKniUDUvjImOzWrlqZh4Hj0uvdt/CaUTWWKGLblN1aVcBEyva5zGkdgBBJvXCiZzw==
X-Received: by 2002:a05:6512:3e1e:b0:499:34:e8a7 with SMTP id i30-20020a0565123e1e00b004990034e8a7mr7952844lfv.655.1664178315376;
        Mon, 26 Sep 2022 00:45:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 26/33] dt-bindings: pinctrl: qcom,qcm2290: use common TLMM schema
Date:   Mon, 26 Sep 2022 09:44:08 +0200
Message-Id: <20220926074415.53100-27-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 5324b61eb4f7..2a23f413c8c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -119,7 +119,7 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

