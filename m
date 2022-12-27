Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AAFC656CDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 17:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiL0Qbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 11:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiL0Qbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 11:31:41 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF5064CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:31:40 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y25so20262946lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lyoX12mwMevw/GvkSfOGH+b2RZglwpZdjU1H0BRrPvA=;
        b=lYv3qXlJQd5TErBapx2gr0arJ30auBkHwnrHBURc6jJJIAQfMKbJgpUxgD4xW4BDeD
         fEiX4AYxUcrt8Za5ln7eSERt1vuERBBGSqGik6HErKD2YF4jqdy1kZIHKt/qnrW0lWEi
         j1qdbpRdTppHfuefBO1jh4y/3OO6Z78d+UCoWf3loFcPPDZYePKlRB4lXnZBPd2ww6va
         vpbNSqH6EARnKq4bzQn/2tEHwkvRU9FAf3JcxSZS1IjdqFrIltBypydS7/YDJEuF5+RK
         bI2/yJXCU+Pa3VRoOZuftDuC3yTw989ISotswVm5aEMlOlPD+GiZ8pztYYNcpJLNZ2KN
         XGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyoX12mwMevw/GvkSfOGH+b2RZglwpZdjU1H0BRrPvA=;
        b=nCjPr+ZU+yYRsSgN6j8nO0HXaM50DPiP7sqa3YqPyEqpx2ac7VE3X05DPkecMGjJJu
         saKyg4SFIU1fRAoSGaZffK2verIvo0gPO9xGSVO9D6mIgZ7hg0tBooO4Xub5IPCcMqkV
         r+lRbs8qafrj/dUGjsC8yW2fsYbEq66Hl9wy8zsXwQ50Oal57+yidYm0KExMMZuW0Bef
         UwFzLEXfaPLHDO62yzw34D8QsrZ+oRR27eoaSUE07J542MZNjU6X0Ha/OMkUd9z3uzfs
         IJzlcRZtSxvRt8JcXjYNVmu8es2txieGvn5MunheRdqf3oHDpGouvc8+ed2ofSOo0eyc
         wscQ==
X-Gm-Message-State: AFqh2krNYLShCybrkXgJTfhsI2UnlMxPs0kyN4o5DP/5SqNmqbbsyNmw
        3zw/8RMBLfdGeM2b2FzNYCzMSw==
X-Google-Smtp-Source: AMrXdXsoXisr+b5apbAKUCZViYp6vaNIxWI+lRrZbA7Gh0SVf4k14JHySm36TYX+GLwajUW2DSNaPw==
X-Received: by 2002:a05:6512:2821:b0:4b0:1305:6e02 with SMTP id cf33-20020a056512282100b004b013056e02mr7010836lfb.8.1672158698492;
        Tue, 27 Dec 2022 08:31:38 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v9-20020a056512348900b004a46a9cebe2sm2318019lfr.289.2022.12.27.08.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:31:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,lpass-cpu: Document required-opps
Date:   Tue, 27 Dec 2022 17:31:33 +0100
Message-Id: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS CPU device node comes with required-opps:

  sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('required-opps' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index bb42220916b3..f00fc1051d4d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -65,6 +65,9 @@ properties:
   power-domain-names:
     maxItems: 1
 
+  required-opps:
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 1
 
-- 
2.34.1

