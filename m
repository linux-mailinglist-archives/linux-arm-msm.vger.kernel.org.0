Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A51115B53FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiILGSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiILGSV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:21 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA9D29CB4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h3so913646lja.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=32LY4IbEPjFm8JO/WRWi4obqGJa0d6BNeLwZ83eH6po=;
        b=WCnkuogqu7kQCyySlMwsIlulnXgYiVr5RxZd68Qj3KB00YqxTjGtAKuc5MwsQUHYoo
         kmK7+WEA7Fth5kid6mrA6rake6R8gFokF85xN1GI6iScDaLEzR0h1TDpljBwlbgW/p7X
         ffW19PP6q8Q5dpemuB3THQcZlHqbFkaPyrjCDSEU9Fl92TDLrAvUHkziNM5vJLRB2iAl
         Go7KqodPT3JDgg2zeUgsw8JeSH6t2509Ofvlyv1rdH9ORY6NjQnFjOgnf1Ibnqo8lOfg
         gze82PO3WkTsIAeKtfsPenMyjUk+Ai+ivJBYCzFU87NWz+rnKgMb2sAdT/rl55qP/ank
         FPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=32LY4IbEPjFm8JO/WRWi4obqGJa0d6BNeLwZ83eH6po=;
        b=W6GDlEGjsazoZIdiISh0byH6YKF4qKOkU/6nRER4laWQ/edUu8YrG6ZzHyrqkgb3Vz
         CHmFndNarVb8MWXStwwS/B5h1rK0+/sHsdQwgdWO3P1F9yFpalkepbojqyzAooViY5d0
         XqnsRFFtx69AHYKvUyipYcBFgij0ywr0XytFVDjZGds0rZF81uWgVL59xqSY38MrzgTi
         O8YHBIkSkV8AAC8NVwQEYfytK11o4Al0LH8RJSEI3CRTSS6cEi48rEsXVxLomkeYhJFf
         735KuqoKVK72tqyxp62JSs2Mo2IHYM5NYR/BsAyHlUycg19/aRsodlWGVAdzQ997Fps0
         bJSA==
X-Gm-Message-State: ACgBeo1ANsw57OkFOO6+zEtoN/QXyXn5dRbzA4IjHXka2Eml74rvHgBY
        QrGyvcj/JOAPmbxddgmj7ki1FA==
X-Google-Smtp-Source: AA6agR7+hZOh3OMyOgpPiLFCoMoouG6n4+mB59qgB2hYJA/6/Y1BW+Jo7prrvciHrP4MVH/mpR/vUw==
X-Received: by 2002:a2e:8190:0:b0:26b:d94b:75e9 with SMTP id e16-20020a2e8190000000b0026bd94b75e9mr5994084ljg.379.1662963486842;
        Sun, 11 Sep 2022 23:18:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 10/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:16 +0200
Message-Id: <20220912061746.6311-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 3908807a8339..50f0ca5ab7e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -44,8 +44,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm6375-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm6375-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm6375-tlmm-state:
@@ -142,13 +143,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio18";
                                 function = "qup13_f2";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio19";
                                 function = "qup13_f2";
                                 bias-disable;
-- 
2.34.1

