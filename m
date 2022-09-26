Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678035E9AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231241AbiIZHps (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234172AbiIZHoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:44:46 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361BDE0B8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:43 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s10so6452693ljp.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/CQFETLYcASickTGGV8Fyl3JywFDQFEGch29lLspQrQ=;
        b=RWnIyyPzgqZwcjOHuPo1pVt873TbQ4oB4jKezYtX/xFLPK4uTVh0Ty9NFioK9G2MlL
         3IPYmUA+oA4Sfa3u5NsMHelLUW18E9zN16Tw1LXLSD+PNgVrSiTQOYjlPmYAloXchBDP
         uTH+hM9bamWPIh8y7qnUV+HgyIdxihY26FAhDebvluNQKk59NtoS9JVYgSl53WAY4yyX
         vfyn2Gh742Nnxb2NN290UsvqQZ52YQzz2L8K7wv3FFy9L95pSUp2z9KZdmQCdyVCRERv
         aLdyH9nuRW1dE5uMK6zv0Nw9YYcOMEbuRXDmVQ0ptydRop3NF8h1WljMtSWKUrGJhl3n
         IdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/CQFETLYcASickTGGV8Fyl3JywFDQFEGch29lLspQrQ=;
        b=L5lX51aIP5/4sJLBcH4UGr2XiOkfCYnd1NHH+pEWQaqgIsABXyqrk6uxMZR+lBMTMs
         BCEw7RXOLRoP7NSpNVAZqeTsLr+UJ9b3j87LWTtxE9V8O+HZs4mvy21/RacMvg54skCv
         GKL7jgWjTvExRhcqWl4K5Cc859r0hvaS9B/OhX/Qih23jeY7IKmYWi8u6WnHo1rBKeSY
         K5RNDMM76Q+VyMJK3r+0t8r/PDYn6IxFX0CIi9ppqPbVhpe1H97ir8DLlpAcQ1fBnopi
         TeVrTusBwki1KdxxlXQz/hnalRAUNXI1/+AWc51vL17Z1AZ01hp65Dn9cC2eb6DGgBau
         epgg==
X-Gm-Message-State: ACrzQf3cNChFoE7vUOLYDudJWpKB5mNM6xc2FfDM5v0YyiUsWDTlELOB
        O9eXFmpQ+99QcA2oAdbFxi7T6g==
X-Google-Smtp-Source: AMsMyM6SREYy44aQio9hVsfg01WAZHUJooiL+uEPksQBL7qz8mYQU5n+Hijj34x7Y1uXZTiPB/KeSg==
X-Received: by 2002:a2e:9c1a:0:b0:26b:2bf7:9154 with SMTP id s26-20020a2e9c1a000000b0026b2bf79154mr6774210lji.417.1664178282741;
        Mon, 26 Sep 2022 00:44:42 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 10/33] dt-bindings: pinctrl: qcom,ipq6018: fix matching pin config
Date:   Mon, 26 Sep 2022 09:43:52 +0200
Message-Id: <20220926074415.53100-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 670eb7162e1a..50d8b04bb590 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -42,10 +42,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pinmux$':
-    type: object
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq6018-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq6018-tlmm-state:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
@@ -146,7 +153,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 80>;
 
-              serial3-pinmux {
+              serial3-state {
                       pins = "gpio44", "gpio45";
                       function = "blsp2_uart";
                       drive-strength = <8>;
-- 
2.34.1

