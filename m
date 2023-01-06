Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2350365FC28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 08:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232359AbjAFHeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 02:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232366AbjAFHd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 02:33:29 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFDC7814E
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 23:33:22 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z26so916928lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 23:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMnUsGMyktU5tXP+S6owcB1l0/Pz8pgW25wFgOOYi7g=;
        b=oFt1TXhdV7ws1DbbJ1hQdQSIfevOXBfPBQsBn2Ew8WWnf1qIQ/Sbm1gOqAX264x7Hu
         ARN7fN+q4Q3j8ULbusWyDjhXFoDNnkJ9nhUrCYFtXcRHddJMQU6J6hjqu+UI9S+98ii/
         JT2BWCnENtEoHAte+VOlGfjy5nQxlflTe46PI4yssE2ZgU5+oxkZaY+jLiXrXEOHI6Hs
         O3yym41VxhNqsCaetRfr9YCSalx28LDNZ5N8vjtWw0KiU95aMb1naF5gEGHhVJZJjME0
         pRl7FvQl6K2WlyCXWARbcaBMpwlm0Yr8M2/nC4Giq62Lc7s+5aSFQBdYJpJ56wMJvE7e
         Ca1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMnUsGMyktU5tXP+S6owcB1l0/Pz8pgW25wFgOOYi7g=;
        b=5K2LxI4P16uGpV4jIHuoyyUgJdPjF1+y/Bb+eizbUIgC7yv2yJJNqhEVWnM9OtYHGZ
         l4Nfpk/4PxCyD7W5m9UiTBZaJcEZyDWdb3vBG+lhfl9yBPVs8TFmOBLjYts99M76Te4+
         AFigUPzjiwmXaka3zp+hcJSHPHUoc7novImjD/M+WejbxeoySkD4kkqN1eUOzwzOo8hp
         kAAFioR8mhdWu3pedG+8S9rsqIJ/ojHB2iwb14yNT/wsvIHmiy1oUA8A4+8ytVgtqHfy
         CcbmXFO9NssnG8O5mG9QbEoN/zxYf3Hj7eIM6Z5TQokf4LIl7V0nqeDe/XGgNkfDAva9
         2kHQ==
X-Gm-Message-State: AFqh2kolDQAW1arIxBvFYWpSwdLMVrOpUHEO/3YxzFzcLM8zhG7cP5ob
        Gaohvr1Dk18KwDGyKKH65aW0cg==
X-Google-Smtp-Source: AMrXdXtis3+HHoYAaDDUWxHkSQv3cyyON5IU/dJbJYuokVsvJKB1BULKAyMOn5u9MKgDjPEn4N90FA==
X-Received: by 2002:a05:6512:2022:b0:4cb:22ab:ce02 with SMTP id s2-20020a056512202200b004cb22abce02mr7078493lfs.3.1672990402083;
        Thu, 05 Jan 2023 23:33:22 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b004b4bb6286d8sm61114lfc.84.2023.01.05.23.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 23:33:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <okukatla@codeaurora.org>,
        Alex Elder <elder@linaro.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 8/9] dt-bindings: interconnect: qcom: Remove sc7180/sdx55 ipa compatibles
Date:   Fri,  6 Jan 2023 09:33:12 +0200
Message-Id: <20230106073313.1720029-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
References: <20230106073313.1720029-1-dmitry.baryshkov@linaro.org>
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

These interconnects are modeled as clks, not interconnects, therefore
remove the compatibles from the binding as they're unused.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index a429a1ed1006..4e8d950c2832 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -58,7 +58,6 @@ properties:
       - qcom,sc8180x-config-noc
       - qcom,sc8180x-dc-noc
       - qcom,sc8180x-gem-noc
-      - qcom,sc8180x-ipa-virt
       - qcom,sc8180x-mc-virt
       - qcom,sc8180x-mmss-noc
       - qcom,sc8180x-qup-virt
@@ -96,7 +95,6 @@ properties:
       - qcom,sm8150-config-noc
       - qcom,sm8150-dc-noc
       - qcom,sm8150-gem-noc
-      - qcom,sm8150-ipa-virt
       - qcom,sm8150-mc-virt
       - qcom,sm8150-mmss-noc
       - qcom,sm8150-system-noc
@@ -106,7 +104,6 @@ properties:
       - qcom,sm8250-config-noc
       - qcom,sm8250-dc-noc
       - qcom,sm8250-gem-noc
-      - qcom,sm8250-ipa-virt
       - qcom,sm8250-mc-virt
       - qcom,sm8250-mmss-noc
       - qcom,sm8250-npu-noc
-- 
2.39.0

