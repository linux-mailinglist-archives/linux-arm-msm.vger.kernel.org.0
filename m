Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F38E8601CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiJQXBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiJQXBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:08 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD508051A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:51 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id o22so7660335qkl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3bp1rbrC28KgiG2T9eOR6Cd8Q38ToH71DONTqvsv5I=;
        b=YskP6Gz+D7mMmcMJrV5DcJNKUpWx/FqHzv4jAQw/QhVUVoWYZr5wR6JEuYOBuo1uCd
         2xd8Bp90uadHG3iWV8u5083v8LXG5Vqd1VemoVWvi9+6FyakLviaRM0Uprp4oYYduPuI
         hnh+vX/eU0cHhmO/Etk0SFIvBQ9I2BI17THrcek/kMpO1eTKjce8dE76zcIgBwLCiTe2
         h1I3FyvrDLq4V/rA7FKfHdXURQjzuB8R+AqfLH5qN12I5E81GIoilBwoacUdckAkVj6x
         q7LLPexyzsNheMzygh0uA9FWGrBXquLee0Kdy0b9NWwTHLRA1XuzUBzU10bXqZgZUh29
         MWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3bp1rbrC28KgiG2T9eOR6Cd8Q38ToH71DONTqvsv5I=;
        b=YZo7467E0moi8KIEGni2iFXgPKHfd8nXRtWESK2e469Y0QAYYHALSIpFHqkyekfAud
         IgmNe2gApcm2txDgxnt1H/2lthTD9dbT71TnCGHVMU8aVZo8NnKsKAnjHXE9gjLGniHt
         34BpTPdw6A+2AXvo6AznOx68ZcSBMGJ5KyIRaT14EDnSjleRYyBg+IaZjvqeoE8ftvut
         sC5IDf1vJvovyWgcgQEr3KJaupicSoBSuM46q50OboRGYsIu/4+FWtUTqsG9eCoizOZk
         yvd9G0dDykW6g2CxRNDnxw0CgDkDjyxZYc2MD4en5sWtYi/ZgBvo85b0KxStb8r5mNcB
         t/cA==
X-Gm-Message-State: ACrzQf3GcR2xe/LwqKfQ/2hP5FIpqOdPjJysytY1Jv5hy/zYmiEswZia
        9aZFgRiE1CC4Lfg851xwNMWxsQ==
X-Google-Smtp-Source: AMsMyM6QPzql7Z94Ogzs3k09TSVAnAqV5/TfBYUtTdyxGJrxZ6CXJVKBes5F8kI9M1G7RE6vooighw==
X-Received: by 2002:ae9:f209:0:b0:6ce:24c1:13d5 with SMTP id m9-20020ae9f209000000b006ce24c113d5mr9689771qkg.330.1666047651476;
        Mon, 17 Oct 2022 16:00:51 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:00:50 -0700 (PDT)
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
Subject: [PATCH v3 08/33] dt-bindings: pinctrl: qcom,sm6350: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:47 -0400
Message-Id: <20221017230012.47878-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 856b9c567ecb..94af82ee5967 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

