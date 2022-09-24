Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88595E89AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbiIXIGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233622AbiIXIFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:05:34 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8D7120BF0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so3480999lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dzT2o8l8kfLsRyN4jbWpEjgtzkg60okM0dLWljLPehU=;
        b=Nut3dXqx4HdfFNUc0lFKLLnx8BUvU8aX7GO/hsNMTtxfWvtwbaPdSPNn3iENtgPhPa
         PXIRqjWP2+CCY7d3KSvXNCuFNQwQ/Qn2xdNPTGUQjRWD6zpu2tx0YKkiDSEQPXuuhMr6
         JEVwUhIejzy2CmLYxY4xEB6mEKw4LDT1EeNoACGQkf8OmsFrdUYPAWHfznh3imuFhc+W
         zPvslhtSdjHAD7I14Oml0JOv/Oe0Eo3qZaCfLr5gzvjd7fKZCDwZ3nN7BSyAsvAazoK1
         Agcy7llQrmRX51ZEXU+magHVM0Wjl9SOQ7XuVJKTXtmx6GKrHa+/d/tQwux3zTXkOp9P
         qxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dzT2o8l8kfLsRyN4jbWpEjgtzkg60okM0dLWljLPehU=;
        b=bT6mb2RMyjUaOEQ341U8t82EmgZMG2ziB0EcKuEZ2eFUTkSQd11RbI9ISwCZgBDw/1
         KPK43vU/hpC7+oyrWG2GalJ1Tz573mCIsKjUIU6ZvxsZGo4JjJnuqP+T+GHfxYPjs2k0
         Sr75UCF7WUkg06kGbCaZCCvQqrFxys4nc1rbICTPuHZFfiTYg7NzZE+H8h1i7zkBKak8
         8vu5HQhtIuYuw4Cn5NIW3aNlOxiYifC/3RFheQHN5l26hq25lKWKMQuPRCZygQn24GJo
         tO1wcaRRuAsAwAzDNKSy3bGjes42FNwq0m+1FpY/LpBZ075CBAJejNZ6s3QNY0fIEIyL
         gInw==
X-Gm-Message-State: ACrzQf2aqapVuB/pS9JvLIxrLiVWJIYyBvmjhI1PNmH0QSSh1bc1i+Pb
        zzL3myW7M87/+/dwNU1Xwj04rA==
X-Google-Smtp-Source: AMsMyM7tZjF0XfS/xckpybmX1ihJDQCbeabJl3uER6gnAmeRxz59tt5YjtwQwaFJyVIjWgfyTFacgA==
X-Received: by 2002:ac2:5cb9:0:b0:498:eb6f:740d with SMTP id e25-20020ac25cb9000000b00498eb6f740dmr4579246lfq.106.1664006724553;
        Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/32] dt-bindings: pinctrl: qcom,msm8226: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:40 +0200
Message-Id: <20220924080459.13084-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,msm8226-pinctrl.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ecb90c77f666..f1d9696a1fe7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -60,7 +60,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
 
     properties:
       pins:
@@ -101,7 +100,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-1][0-6])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

