Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89FA75B546F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiILGVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbiILGVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:21:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41602A965
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id bt10so13202437lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bcVZH+vM6VlPj46aHm51wHDmSEBgcg+OmD5GfgTxNm4=;
        b=IOYLQduKDVqUl2FVMPccdSSq4RPfytAj5bsgcI/Uaj/+kjB/Rlsv+dnvKW0O+wmtlO
         nsk2UpQKYauZTfMFSGRcTCzzeN74n+6fyXIO+Gx230ej4/RYnBItA2zoyh6JiADlCWlp
         4JzDVoYRjQEEbZLY1AX8sxtcJRztvl8fG3ip1M2MwQs+XK9kjCnDQtM+THV/H7aRjkOM
         gzuyuSzE5xGOSsShos85ncbYSxdoGAFw4T0i64nkWPLYv7MfzlhD/TiCFqug+nheHgIT
         g9k9DFBRgl/NLcLoEtSugSQBDjYIha+FMBwO9/JClQ7sNe65zfZnPSvClwnGUAg1Trfb
         jeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bcVZH+vM6VlPj46aHm51wHDmSEBgcg+OmD5GfgTxNm4=;
        b=HH06m179sL4ZAzbQLBXd5OVo+qVpTvA1kAEdJpTo0OUwm75iGoowrVxxaBjKhWp8he
         CGu/NnXrDOxAIYw3Y6+b+UD9K7rc3bsg5qDhEi8BziEbr3OK9vZbrVh1Fiu9ue4/lLrc
         gcREYdkSh8OY3rRapksSQAOWWi6QsqkuuoRaxOClwvvzqj346X5jSDRUdLdDTposwFcQ
         u+EX0Q6e08UgiFi0Xv2JQ9hs42+3i3/8s5+63qxmQhnEcpTqx8KIehY9jRex/uMc5roe
         RJMkE39G/6o4wjj2ibWtPBYvVwxOfLQPDSMy3YE2Bjfjklop244+uGd5LfxuRgdy9fSO
         pi9w==
X-Gm-Message-State: ACgBeo1hBzz73744ZlloLBMYTpvmVtb/jJ9JzPp2N7aV30/JD9k28mcG
        QoI1U97jKZt4vpiyZD0xX9Z9zQ==
X-Google-Smtp-Source: AA6agR7TCoX/JggyD8QfNFbQxY7SgJBZR67pv6AvYZGTLMbK2RzG8EEmdtkEnjQDS1+gpUS8RPmq7A==
X-Received: by 2002:a05:6512:3b06:b0:498:fa72:c24d with SMTP id f6-20020a0565123b0600b00498fa72c24dmr4978910lfv.538.1662963517852;
        Sun, 11 Sep 2022 23:18:37 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:37 -0700 (PDT)
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
Subject: [PATCH v2 31/40] dt-bindings: pinctrl: qcom,sc8280xp-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:37 +0200
Message-Id: <20220912061746.6311-32-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 87a381c9a19d..5147afc28721 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-sc8280xp-tlmm-state:
@@ -135,13 +136,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "qup14";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "qup14";
                                 bias-disable;
-- 
2.34.1

