Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72665687AA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbjBBKrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231989AbjBBKqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:46:36 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CECA885EB
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:46:02 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1014095wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2vajhQRGz6tVBbUNED/4hod8rqStI0ha++lJD4Wrmo=;
        b=dyZleA/lOMPLBzbmOawMoXGDDMorsZYWyRyNBVpp8MgAhT7MZ3gu2d5p5j9Na24e+8
         hMeTRUG1jNZTGnSAsJaip2Sd5LDjyNxxNHDildzaAnHh5VajrmdO0bRweeZ3SuYkyMos
         zxPTvMnPQyzUPeF1QIQtsRFIgdvEqpGqZtRp2TitUyOPZr5EYhFHjJyamgi2hs1oCX+Q
         ImUBhmZ/J7Da/gYHqDddNeGJRXwNGS1SSOEzt8bdLgeP/cfszDEALLi3vmtVpAxRtU5j
         VHqS75ZpA8Cdl2j5FFBxVRuYC0B576VWtKvlxSibp2TYzvwxNAo19fg/GoRuvIzFVy9B
         oA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2vajhQRGz6tVBbUNED/4hod8rqStI0ha++lJD4Wrmo=;
        b=rkVDdqx2EL8wvEotALslbWMyJDleT3cdSMpMPH09/aOhdTIsU5haNbXjUZ79dpHUal
         jNJqLsREwslt3ShJfr6HX+c2tb4Ph11q9nNMi63lwCxHbl7GcLxrWaKrJ4hkrSAWEs5r
         osUH2h5LY6dLM+/8oVx8xTnGGMf0SFJ+HKeRioJpo0tIkluON8V4ARvefhTu9WI1x2bD
         n/pdPJMm/nfOstXdNFq0vWyHYen41a7QOd5vSsb7xsJtFVvVJlmyMedbD3NEQ4NSFrn3
         vJYC9Rdxm9WDqCNfVyJROp3FDUN9I7NEZTfbxN2gJPoaw3p30sPkrSfxw+rcHgyGsOUu
         xU4Q==
X-Gm-Message-State: AO0yUKVNRH7Ejt9KCgJdR2gHcgSMz9uhyWRyD71enZyM9bmLVOEY1mpl
        ZiCqlxLi8ycna43eQI8QnZ/c1g==
X-Google-Smtp-Source: AK7set/sD5gixAns3D+wFSdgRhKQ4bdJsU4XnjXxRENuv7EX3rlmhC5XnBN6XecVgcNPWiKbdOI2ng==
X-Received: by 2002:a05:600c:1c16:b0:3de:c612:df56 with SMTP id j22-20020a05600c1c1600b003dec612df56mr5167935wms.15.1675334752139;
        Thu, 02 Feb 2023 02:45:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:45:51 -0800 (PST)
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
Subject: [PATCH v2 01/10] dt-bindings: pinctrl: qcom,msm8226: correct GPIO name pattern
Date:   Thu,  2 Feb 2023 11:44:43 +0100
Message-Id: <20230202104452.299048-2-krzysztof.kozlowski@linaro.org>
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

The MSM8226 TLMM pin controller has GPIOs 0-116, so correct the pattern
to bring back missing 107-109.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index a29b8a9e1f31..6cb667fa8665 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -56,7 +56,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9]|11[0-6])$"
             - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk, sdc2_cmd, sdc2_data ]
         minItems: 1
         maxItems: 36
-- 
2.34.1

