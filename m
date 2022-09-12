Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF45C5B53EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbiILGSU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiILGSP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E450C2715C
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a8so13099416lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u03qsv1ayfTU6Jx4uWdo7qxMiGgjgckKImKOyJnLF5w=;
        b=a5qFYMQoEm1+4yxovQ3Ef2O3ttvBtdH7U35anDVIDhwwF3yBcFOQRM5LKQrrNPePsF
         8PxmivF0jtVa9KJghmdDhWsQ8cvJJvP7ILP+eJGQU1U4bWzCQW5so4ZJP2Z1Ndv3uGM3
         0nZT2DY3G0VxfQeLEInmx1sN35jA8rLWDgnyng58y92crc0H1hdwWUjRNO4TmenMReAN
         pizRxzbEwBkf0/B3twPCX8Y+SAZlhc+wEgbb2Ev00YEx7cswtb2JJKaMDqWA/5EShrZw
         f/8FV5aASHlNPV9gT+ywkmfiPZ+TzLxygAZFRmDCT2HmFo+9KPfLzP/QCtM/g9Csj/J4
         AQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u03qsv1ayfTU6Jx4uWdo7qxMiGgjgckKImKOyJnLF5w=;
        b=afRsmIVYmyyg6FCfG7txyQRzo93uFXkzqxtvSGjgw4Kyw2MEeRKBF+fN198yAhGHc/
         ku7xhRquI+v+ZCNuhwxdllhGDYxCZCw8a78vkmwd7+GDbauLZ7XW7T98qAHN53zyD9uB
         9QlduBtQZT8MDk+XcFAVst5RMayFOu2Iv87QrjrbBK7cNMSXm629z2dRJ7427uWetwn+
         87ppNpcbOgcJ8nIiUN376IVNhbS6bJ7qGjT7EueXCEwcD4WfvmGc/1uXm23E6QjgW1gl
         CxMGKSK6yxJGWNMLFe0muUyY+QpvjXBwjuNwmnxMyfZXUQ6n08pl3jcOE/VEDFj11gy+
         ws6A==
X-Gm-Message-State: ACgBeo0aw1KX2nDFjED134TmQ3brGuerIoULZkd8LYEXxdOpJNevwMvv
        hQ6YQdyFq7h7gtcF1pGLTpOxSg==
X-Google-Smtp-Source: AA6agR7nDfo2PcytVMo1uVWx8E8ef+HVm/VXHhh3lbmOPty2aOgtyO7Da6aBn+MTpiTn9sJssYEe2Q==
X-Received: by 2002:a05:6512:3ca2:b0:497:9db7:ec10 with SMTP id h34-20020a0565123ca200b004979db7ec10mr9150052lfv.350.1662963483323;
        Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
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
Subject: [PATCH v2 07/40] dt-bindings: pinctrl: qcom,sm6350-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:13 +0200
Message-Id: <20220912061746.6311-8-krzysztof.kozlowski@linaro.org>
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

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 898608671c4b..85a4ff5a5625 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -44,8 +44,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm6350-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm6350-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm6350-tlmm-state:
@@ -133,13 +134,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio25";
                                 function = "qup13_f2";
                                 bias-disable;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio26";
                                 function = "qup13_f2";
                                 bias-disable;
-- 
2.34.1

