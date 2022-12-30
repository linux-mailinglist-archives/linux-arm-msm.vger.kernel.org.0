Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 538EB659916
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 14:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbiL3N5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 08:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235107AbiL3N47 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 08:56:59 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E281B9C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id z26so31827055lfu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Dec 2022 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgHeaqGJtsrsZ+FkQskPR4BdMj+blbVrqMuxi9hy0OY=;
        b=mDulusA+Qv3wl9EPdFQ04AO9iNkc7KUHFbidFwQDlV59bX8L1a9Y23I5iV9WPt1LpY
         O7GmZuGrewdZpaCVgzgK2E8fvNcBX6/F4yjt08TRkw2/s1iG9MU2/gzuPuAVJ8Rvn4nP
         4Kw9mIbNFXggexbKROaTeg1QYmSCZRb6lLI5wSBWjaTMsFjJALv+xnrUejsbYqrAuY0G
         l5guViQA3iQiH3xfJNqQYGdh5cq5Vles5lm3jqWx8WTq0bCIXCV9fCr+SFWeeQuu3fqJ
         ggd4K7xP77rjTmCHc5NWOHnSrLzkXnGj37Xiz0R85GTs/3gSfIFiViQgnBY4CQ5LXq3E
         5vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgHeaqGJtsrsZ+FkQskPR4BdMj+blbVrqMuxi9hy0OY=;
        b=f6FnDX2yYHfB/mPftN4JPx7j4znnDdWrqPaTO0zCEw5rrS/IqIUZvOBMFyCx7VDPTb
         cyJCPpg0Fz7h2gKcVGfPHki4i8kfMksIM7PgkdrLcVaYITAchnO/APiJRfPzRuyaDUBb
         a+gMx27f3rqHK9FohxwvdPUTuv8iUnQIZCGFiS1otfuvGYtBktq/zG2iwtvdYOOnPcU1
         QPIM8gU5jR0iYZAHzDNXuCtQdM1IDDG5Jl2SCVoPZ8xWMTbuoNYbPi04ugSpYmYZ2C/2
         O6COrgAoAUvrSzoA2VA0YV+31szqL8zJwZC01CVC9kGgyXt2tuoknhbeagNC+cQ1yEam
         mNzw==
X-Gm-Message-State: AFqh2kpxwCMFD4HHg+pBZedu75P3OREc6K1quXVUYE63qh5gxEfeDoeF
        /n/evxdvIwlGajwcHHr+1C8usQ==
X-Google-Smtp-Source: AMrXdXspSSfrPHNeHg9cm9HeLa92E88/a1Tzl2gASeMpw6YRI/gOAzoBWHbUdKG3R2XJC/o6CaBoXQ==
X-Received: by 2002:a05:6512:348e:b0:4b5:8987:1db8 with SMTP id v14-20020a056512348e00b004b589871db8mr8064564lfr.59.1672408612491;
        Fri, 30 Dec 2022 05:56:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d9-20020a056512368900b004a26ba3458fsm3454787lfs.62.2022.12.30.05.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 05:56:51 -0800 (PST)
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
Subject: [PATCH 4/9] dt-bindings: pinctrl: qcom,sm8350-tlmm: add gpio-line-names
Date:   Fri, 30 Dec 2022 14:56:40 +0100
Message-Id: <20221230135645.56401-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
References: <20221230135645.56401-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow gpio-line-names property (quite commonly used) and constrain
gpio-reserved-ranges:

  sm8350-sony-xperia-sagami-pdx215.dtb: pinctrl@f100000: 'gpio-line-names' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
index 0b1e4aa5819e..7795cae01e26 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
@@ -26,7 +26,14 @@ properties:
   interrupt-controller: true
   "#interrupt-cells": true
   gpio-controller: true
-  gpio-reserved-ranges: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 102
+
+  gpio-line-names:
+    maxItems: 203
+
   "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
-- 
2.34.1

