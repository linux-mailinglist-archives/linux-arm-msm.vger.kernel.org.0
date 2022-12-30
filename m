Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46647659936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 14:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235118AbiL3N65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 08:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235103AbiL3N47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 08:56:59 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F321B9C7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id z26so31826992lfu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LFPu/nfv09qeuH7foczG8nitidZm7jiC/H/irSOvB0=;
        b=FenquDmeM5xjvYwTOMVkaV1iRtMO3RONryG+sEZeZeoIYQMaHQ4rIPIHTtf9gwycFH
         9ED5Id07W+cOR1CqHsPoEH9J4DVdFwGtiAzFJqlFCldTxZoLxN+6UNzkGMELLyyHSa/0
         wxH94i1BAGrXOA52m1RHFIKoxa6UBPF3OouT99D9HGlf2Qj34V1MUaz/ImVx3x6yuxYT
         dFhEild0R6nRlch9HHZ4niwOmGv3sc0MHXVR94hqm8PoWYSbcqZQU1bjVWkRmy1g3FuH
         KTUXKvxXjH3Cf8ez1vqvtCqYrvU/bzWTCaDHQdP19FrQBqG7/bBv404dibrIVjhD1BDg
         m9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LFPu/nfv09qeuH7foczG8nitidZm7jiC/H/irSOvB0=;
        b=dtXs8yEHJAdmhiOU8OAp69GRrz5M8p12Kr1ErnqYUVfTOlMQGjH+SCTiwmsW4KkYo/
         oRDUTmxIQXr+AU/mbVkyfiLWhbjlKXeNSjdfsquEHIjAwg7v34LQiMGcrTwyeH5El5/L
         1PH0KzQS+Ot+aQQSTo8I99xyLMdWQ9meZowr9QqCPzgZNr8d4/fSV9zbuLv0m5TDfim8
         lvf3Km3RuGWM2Nw0h/a0UhbqV6UNtezEK4xXy3nVb+XtpzMk0ckq/ol4cRlWKBGnAPzz
         wQaGWHFQVqe3C/qSEd5JDz9Egf+C+jD/7OJorwZf65yhOr4OMUJP25PVKx8NQDG/ZY0m
         Myng==
X-Gm-Message-State: AFqh2kqVL+gACydav8zCSe9VbmKN1V5dgdaeURVaO/i1ig7/t9NLxNbe
        0+1rl2VQ5Mll98P/2JRm4ykchA==
X-Google-Smtp-Source: AMrXdXtz5qJKZlog4jA903P0FBj6sn0ZKWF1jQjXH4xcsohitA2gUJ2BvVm6Md/VN8xGqKNaKGHAWw==
X-Received: by 2002:a05:6512:220e:b0:4b4:b610:1427 with SMTP id h14-20020a056512220e00b004b4b6101427mr14824948lfu.8.1672408611102;
        Fri, 30 Dec 2022 05:56:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004a26ba3458fsm3454787lfs.62.2022.12.30.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 05:56:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/9] dt-bindings: pinctrl: qcom,sm6350-tlmm: add gpio-line-names
Date:   Fri, 30 Dec 2022 14:56:39 +0100
Message-Id: <20221230135645.56401-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow gpio-line-names property (quite commonly used) and constrain
gpio-reserved-ranges.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
index 41e3e0afc9a8..b099649e58f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-tlmm.yaml
@@ -26,7 +26,14 @@ properties:
   interrupt-controller: true
   "#interrupt-cells": true
   gpio-controller: true
-  gpio-reserved-ranges: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 78
+
+  gpio-line-names:
+    maxItems: 156
+
   "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
-- 
2.34.1

