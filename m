Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55AFC5E9B05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233685AbiIZHrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234266AbiIZHq7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:46:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674BC33A12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so9508905lfy.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8KHbSdK0R146ghgYDwfxWBheqlrOeLbmtxLPw9rHJdI=;
        b=t81lkCyq37RMtQ5/0rcnAfHNgWAm6G4Hh0NVVNuCFBm8NrAfrgTbJPGVWQ+KpD8x6r
         HHC5+udgAbTrytXBvP/Pd+4vW6viVYyJCS1BC6hNB1fJ/4gm4RC2R5RZCfzSEVa1dJ84
         fbbRoV4+RPEMx5L06DRlATIWbBwBPe+v3oCcTqJxFSDH+REdHsZidx9cJ+GpiUz8tV5x
         O700vyR1TMY8B5MoYoZyDhI0aRoCOk6NZSJBX8ECHxAnm+tcVJMDH6xb45ttYS1ov3VM
         adLY9/AQPlX7iN1O7g+SR/4d/50Xuif/xESWoeOc57mOfLH3i1CpXFMbsrLOC6ErWz9e
         MWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8KHbSdK0R146ghgYDwfxWBheqlrOeLbmtxLPw9rHJdI=;
        b=IjvbpMeCiRS20hlSZv9XB4zWLBMfSnxsAS1ubD0oWlSCOh2bUGDr+AHEAfsBb8oZHJ
         mHNaM7aT3O0DwEREJ+UKYv3p7w8GlWEJB1LxjtO/5438eV/WP43IG3IYecHK7Ivo7Llo
         o9L72+W4rP1c8nImfQtKQBa/7QqL0rxUFvACLB5ZOCxOGTP9LdzomGsnG8BDoWso84xX
         0LXPjmaZ2qUUotNs/IxoFX9exmnP5ijPc9ZZaKbdltSDHx2jp2syZSMLQGUyCuPoYTxw
         IWg3xJX99l+LAB7yFyoSnxRG1Fsxe2AULdBVz1QyWqX5htcQwJU6P+H8MNb98+IEkQv0
         zzXg==
X-Gm-Message-State: ACrzQf2uo+UhYzGVOqKn/7MfR2w01flnAs7Onm97iD0nggfsaPLf6SRy
        Xe0VeCKoWQ77+mWh116kuf+Qaw==
X-Google-Smtp-Source: AMsMyM5kNEdtxdZTHiynp64TnmGW7I/FY+3SlwkDjK2yFnvrKVRVAlnzpfEqMRcpuZAtV1ca8qPYaw==
X-Received: by 2002:a05:6512:33c3:b0:4a0:4434:1c85 with SMTP id d3-20020a05651233c300b004a044341c85mr6649809lfg.302.1664178310797;
        Mon, 26 Sep 2022 00:45:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:10 -0700 (PDT)
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
Subject: [PATCH v2 24/33] dt-bindings: pinctrl: qcom,mdm9607: fix indentation in example
Date:   Mon, 26 Sep 2022 09:44:06 +0200
Message-Id: <20220926074415.53100-25-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/qcom,mdm9607-pinctrl.yaml         | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
index 57a4fed55de7..a37b358715a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,mdm9607-pinctrl.yaml
@@ -120,14 +120,14 @@ patternProperties:
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        tlmm: pinctrl@1000000 {
-          compatible = "qcom,mdm9607-tlmm";
-          reg = <0x01000000 0x300000>;
-          interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-          gpio-controller;
-          gpio-ranges = <&msmgpio 0 0 80>;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
-        };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@1000000 {
+        compatible = "qcom,mdm9607-tlmm";
+        reg = <0x01000000 0x300000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        gpio-ranges = <&msmgpio 0 0 80>;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.34.1

