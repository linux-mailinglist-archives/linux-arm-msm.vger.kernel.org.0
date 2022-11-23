Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A9F636171
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 15:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237975AbiKWOUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 09:20:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237946AbiKWOUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 09:20:46 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A72663EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:29 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id g12so29575469wrs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 06:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nwk9ZDzj4f3oCxgYA9516gm4S6RtG9ILhUbfQ8JxHU=;
        b=L+3PEVfkzTMurgF1Pq7oMkWjcR9izDlB4cs8rfzSJsWA4NIpZfxFU5gWxxrODnks2x
         vW3ThKxGMiknEPCrm3CdvJNiVafl9fe+GAgniVVOc56UJl36U5RV57H1hLuRkhIPdy82
         jaQwNJ2A8jEKjVMaqxejUPuS6YhQr8kY27BsXQguKDpXcO/vx7HEF7t2kBf+ozDxnDCP
         qludLvDXwOFBVs5E0EcnJfCNARS+BoZkE60kuNMEQx+zMx2Z6+bQnA4aoNvgbRViGoph
         wfH/CWlp+IfOhzHWwVP7iox97ddvJIpwx9M4G3hKUwRG/w1J2HfeLl7slH2sASkMMzQi
         L9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nwk9ZDzj4f3oCxgYA9516gm4S6RtG9ILhUbfQ8JxHU=;
        b=o9TnchwCHSKJKA1a9ddgOTX7t2CQQ0kEkaP3RGrIpBDDkZaoxc6jeR+ivIqolQ2Sks
         q2+6vM0OgahF06XMjmvXR09kLr7nby2CxGHOHMDVRBxXxJTq7f/aKufuIQ6IizuGragn
         OF7g71/AftVtbv5Rz6wi1y2VIDY58A7ncQ0stQOx7bOhqeaja8k/4mB9Ry6IljaBZeAs
         pO3CORwOcJLNid7R5vD9ETV6Ke0iY2PnXnZT1w00KSzpUz5hB3Ragp/FpONulaEjfxnk
         r0f8QVk2ghflJX55iTx3G2WdRPssN3C49pXLW+dYKZRZKCtwNaY1oCVlXLbbI5OdXv4t
         7sjQ==
X-Gm-Message-State: ANoB5plUfA8b2YqwDqpv4S+kbgGU++W9Jjn1/VbzRVXpJPkQCYz/EDYB
        oGN/hliiNoQfSThhYrzKEVmhww==
X-Google-Smtp-Source: AA0mqf6iufSGN8Siv1QRRTblUjizIyXG9xaOU3+bcfaQifjisr+JO/GIClkcMtgfMBEhRnIOQER1MQ==
X-Received: by 2002:adf:f3d0:0:b0:241:f721:3ba2 with SMTP id g16-20020adff3d0000000b00241f7213ba2mr921857wrp.681.1669213228394;
        Wed, 23 Nov 2022 06:20:28 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c4ec900b003cfd58409desm2837438wmq.13.2022.11.23.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:27 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/9] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Wed, 23 Nov 2022 16:20:06 +0200
Message-Id: <20221123142009.594781-7-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123142009.594781-1-abel.vesa@linaro.org>
References: <20221123142009.594781-1-abel.vesa@linaro.org>
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

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes since v1:
 * dropped redundant "bindings" from subject
 * added Krzysztof's R-b tag

 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 437a34b930e3..d465dd691107 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -30,6 +30,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

