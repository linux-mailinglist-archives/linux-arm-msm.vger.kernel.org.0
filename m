Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8B35B5411
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiILGTQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiILGSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0817F286E5
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:18 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i26so13132664lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GbjA8/0sNJoSMWK/LnXW+oLOon29f7DAZdcODYnsdAI=;
        b=erMAGCUjMGkF2Ivsnvzv3t/iPNvuuafZFkalisK7GLrYYBCdZmWuhau5ID5WuhZqTb
         kr4ysEzdnOmLoI24PE54VWcp/Yj9IP64UgnG2NySQxmwoDwgNq3uhLxCcsHRyeZNXzze
         qcngVl8HMJjvV8gMbNqVY3QFrTxqyfVoWKJYS1z6f6qdmSuj1jSra1r4awyaEaEfxDOx
         JXfUWvOrDk/G//9LuBhR4tPYlZQqDPAA1zsuuNWMOTfJJmjX0FpQkmdYXaKFsr1Kx4pZ
         M2qlCtgzNqhW4g0lkuYQDdqCPOeNDS25ybaO7WoZC+lyGTmj/32vTZv0oA2eGEqmofoK
         +nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GbjA8/0sNJoSMWK/LnXW+oLOon29f7DAZdcODYnsdAI=;
        b=6piknyQG4PNKeBQd5e9Xsh4p2skNtpyXDv4d41+c0bZLQFNbCXqotKYtTUB0tKkfVW
         xXN2IdERQ5xwDXlpEbIPXAbTiIeKK4UlPBtxozJi3qaef7cxgZwTDlzQzzgK4lnuBBiq
         ajGKuiNEPblGiLaT/MxJVHrkUsK/fo3GRJb0ctAquP3JBjgaJOKvfVX3NXE+C24H37Ky
         ssnrj48cJDIUbuZ9ImVCxHGVudfoWcMgcq95Qky/+HgPWBQho1ZY+M41O5J4ZAYTuMRR
         esANc6mlV9iBUNLzRNcMj28f4ZcILh4xZ4QZQ2zE+LvkfcIg96t8t+WUyOOcCBLyJcFd
         o9GQ==
X-Gm-Message-State: ACgBeo31toctLyxdEXM/KSGiTnC648P+3FK2GPg4vi8buCDtcquDdUku
        nEhsWgks1TQzwltQXU3wdmECZw==
X-Google-Smtp-Source: AA6agR78dE94Pkj7MTVfrXdLrHj56fM2dZpt6YU0K68zVSX1Wj34JmSVk7ltGHP/cfzGrGJn83ASkA==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id t16-20020a056512031000b00496a0ca1613mr9200190lfp.394.1662963498186;
        Sun, 11 Sep 2022 23:18:18 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:17 -0700 (PDT)
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
Subject: [PATCH v2 19/40] dt-bindings: pinctrl: qcom,sm8450-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:25 +0200
Message-Id: <20220912061746.6311-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

  qcom/sm4250-oneplus-billie2.dtb: pinctrl@500000: sdc1-on-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'clk', 'cmd', 'data', 'rclk' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[26]] is not of type 'object'

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 9c891246245b..d1d1c1455b3c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm8450-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm8450-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm8450-tlmm-state:
@@ -127,13 +128,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                    rx {
+                    rx-pins {
                             pins = "gpio26";
                             function = "qup7";
                             bias-pull-up;
                     };
 
-                    tx {
+                    tx-pins {
                             pins = "gpio27";
                             function = "qup7";
                             bias-disable;
-- 
2.34.1

