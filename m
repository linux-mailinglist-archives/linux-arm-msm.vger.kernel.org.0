Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F23C5B541D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbiILGT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiILGSp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99CE2A97E
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w8so13125408lft.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=huMBt2cOX5WYiW0m7Bpoars+zfOhAPbHFngq8gou9wo=;
        b=T8PDwPdVBimQHwxsfBUyfb4uH8nlYDvxv5g/QTxqnWH2LPwNzVda2v1jBaZzGREdVb
         EeAsURrwAHNtJ635NC2elIa4KJZOf2q08BukMxzmhU8DW8fxkPeDMAhrJUmFJ7jHMHQ1
         k5rF/NhwGT2UicyG33Tm5TDHrXdiPTaPB84r38jG+srb5isFjWn1++4Q19e6RWhgjL2f
         zngl0U+K546t+Ex1Bgkpq+a5fPdxsLjBokKDpiEAUHKNmk6R+bJ6RPGpnR8NoEcjFSgX
         HG3oXxavYasohtl+8HxkTZbz2Ri5emIttgo+5T/c74/wBwp53gKOSekXze6q/jdla6NN
         LEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=huMBt2cOX5WYiW0m7Bpoars+zfOhAPbHFngq8gou9wo=;
        b=M0H75ybxOKZPo0B/8YzuUepi2+MhWmqYCqdG7xcoE67tUpE9C8FMOF9EiDwqlNcK1r
         TgY3PtIO98XcjRB1d2XW1VP25eluxF8tAnlmuqFXM8YU3JicoocKU+R0XY5GKyq7aX3N
         TbGZf7ELs5ACENHK7Egtaq6DMvzS6sujjhEooxls8qbqimO1DxCR3m2nACEOEgmXrVg1
         7LHidV6i9okMIHcMZpPhDjUTz6AvrC7GF3zSDKVxhi4D9mjM2EuKkwpQ/h2QXeWH3mdR
         K4UHbgoMrckh7t+51F7q3t/XGmRSlOmXI4rXAa3lx9ygrih/qYxmFfSdgNXkAn18Ioz6
         1t4g==
X-Gm-Message-State: ACgBeo06m448VVX8D4XWcLpnyT6cCpSim51hbtwI3CTgARjrcAU2ezkE
        EeRQSQ2vwFBrZDRxspJqKKA1sg==
X-Google-Smtp-Source: AA6agR6fRJ9q4A31YGpIAzK9KA/cdCWDaEg2eAV3NGrqf+BNeg59ngLbUvMSv4CZ00GGrrC03Inumg==
X-Received: by 2002:ac2:4e0f:0:b0:48b:7a5f:91c8 with SMTP id e15-20020ac24e0f000000b0048b7a5f91c8mr9052330lfr.430.1662963490535;
        Sun, 11 Sep 2022 23:18:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:09 -0700 (PDT)
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
Subject: [PATCH v2 13/40] dt-bindings: pinctrl: qcom,sm8250-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:19 +0200
Message-Id: <20220912061746.6311-14-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required:

  sdc1-clk-pins: 'function' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Another question is whether 'function' should be disallowed for such
pins?
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml          | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 15bb1018cf21..12bdc2e67c4d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -110,7 +110,15 @@ patternProperties:
 
       required:
         - pins
-        - function
+
+      allOf:
+        - if:
+            properties:
+              pins:
+                pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
+          then:
+            required:
+              - function
 
       additionalProperties: false
 
-- 
2.34.1

