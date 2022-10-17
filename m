Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15A2B601CC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiJQXAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbiJQXAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:00:39 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63E337E810
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:38 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id d13so7663772qko.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kufKQ/HjiRue6jRVh1kAvY+CDHUw7AvMzeS+Blm/NOo=;
        b=jzm9rwxS9yii51Ru2az1ccFw8DkQaIrjJ0+McwNyzLHg0pHVbI7fHH3i1+h/nDqmNf
         WZuAkxtkLLSbmxpb1pJohBc0gWHYRSOamC7wW3p1QRh4YXoYCoxUx0QndxO7Aw+aEEsu
         aqgmK3iSL2SJYaV5O9UGDEzXGvwKGW8sfJ8Ni+vfFxxXiq2erCogSfhqMJWlcHHfeVTB
         +wInAAvFTQXTp4Vp9FxfnV57lnPaoY1jxBcYpd7As67qM1dtX5/o9pc+lN6929Oy0K+J
         BnAzjKYoc5n09j2eBlN156v8yWOro+GNaKlmcrCEJx0B7hruZBGYrBt5zKZpzXZXyy93
         MVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kufKQ/HjiRue6jRVh1kAvY+CDHUw7AvMzeS+Blm/NOo=;
        b=x/WOXk4bpEYNEX+kkJEPhBtHO1sRUv1zSRg1SCTM9cm4m+hADUmtGqSz81/OofOYTr
         1bKJGsoTmI3EiBl/A4SO/05BACPH8PQZ07xfuW3sHCR/eql9M1moEsgKYYqij7LFLMkz
         ZAAZa/XlMKa/xmQZhdH1dLiQ4LELbucCX0PDSDv8T6ro3XBOKSQrJZsxQNWi55ElzXbm
         8uDafXLYWvRc/aGOgR6Qxxvr1DGxcrI/GQU1YJCd+iULKqTdtAbIZ6zk9n5Fo+XdaZ8t
         bdEpTHzEzFK/u97/PQD0YtB5BF+ibSMLoaA0We5fcs/C/x46FZHDcUiZM3nEBQzB32CT
         JMSw==
X-Gm-Message-State: ACrzQf3GG+gAWIxXnzBNU/D25CndpjjgBIAO7XZ0zPJ7PKv2VPa3W8Nn
        HXSbd7ua9nyCM88EWiKIr9IUAg==
X-Google-Smtp-Source: AMsMyM5PRWcCOhJTefNUgXkIKWmr3AODr1CuetgzuwLePAwEVkqXs/UqZeETgCOfHVo9Tifs/3OKwA==
X-Received: by 2002:ae9:ef04:0:b0:6ea:adcf:4c02 with SMTP id d4-20020ae9ef04000000b006eaadcf4c02mr9461550qkg.779.1666047637479;
        Mon, 17 Oct 2022 16:00:37 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:36 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/33] dt-bindings: pinctrl: qcom,mdm9607: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:40 -0400
Message-Id: <20221017230012.47878-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index a37b358715a3..5a9002a83423 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   MDM9607 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

