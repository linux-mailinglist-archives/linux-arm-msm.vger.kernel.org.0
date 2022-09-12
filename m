Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C52225B53EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiILGSV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiILGSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:16 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E482873B
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:04 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id v6so9372892ljj.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QW6MO1hMHGswxNmgzSJJEoxkkpvgP7Us3KREmZxCiHY=;
        b=Yu9BrTqQcEnJxEPrrVuFTQnTOJd6wG3FOfZq1tyHXe7MODQglhQ2YwW76KKgFxHMtc
         eaBS3IIh7jA1ahDEkBkygX8QqnmH9rBo9aOmDD3Mfs9/TcUZxYucYXClO5a3o+Yh52/C
         Icgoa7DM9ftsY0BycYjoANiKt9ZF7Nlz6lAMvTg6KCDb5AJLEyvx6j7embQb+xf4vuyi
         MI2w39tuOb10Rig5XHBJC4tWxhqCZr1HY9n+mgOSA+26ZVCrt+tMZwtrbloqbDXY+rmb
         0XKTEvffzZwuYjPPiGqWiAS7buUNtsO3eZkWWUaH2YjlrEWmQRNP4Fb9LynxIJYu23/i
         3vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QW6MO1hMHGswxNmgzSJJEoxkkpvgP7Us3KREmZxCiHY=;
        b=t4lJyR8pT+xpCFwXL3WYCszkCFNBG2te6139e26bgMOODueAhT7CiFL5NZIo/t4qer
         gXkUhzFsPPghFb1qBDt/zJVYVpBB2bSEXYVoLxwodDmH+EP4xwxtyraSiqjaJ4N6ECrO
         bF0KU2fBIxuo9DwjIFs3ofeRvXxCyrLe8/USMzCProcZKmfI92XxRpjRKW9ITThNmqs6
         CqR1+iVkrodWnr/HtIiRJMrODvZoew6ScuBVr65yt88EDaUyTKGisD3QcQlackQgzGjO
         gozrudOgNdLvnc8KEYK5F6rY4p9ztrMtbSFfs3I5NrCYFp0oQrOz1kXo4wVAwVdt9SAw
         BxJw==
X-Gm-Message-State: ACgBeo3lyV4wyinpy1y4QW/TKA7w8Pb001LCBwBX1pzQpW+77GO9UKOl
        IRtaeWok74AgBILc3FlZ2nJ+Hw==
X-Google-Smtp-Source: AA6agR5e30kVHJtnGRAqmDS1vesInkLLMyggYUjIYvaBWvXOR2+0CczdiEDd5g3ruvNG032Y0ncEQQ==
X-Received: by 2002:a2e:a4b1:0:b0:26c:521:76b5 with SMTP id g17-20020a2ea4b1000000b0026c052176b5mr1205004ljm.258.1662963484412;
        Sun, 11 Sep 2022 23:18:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:03 -0700 (PDT)
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
Subject: [PATCH v2 08/40] dt-bindings: pinctrl: qcom,sm6350-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:14 +0200
Message-Id: <20220912061746.6311-9-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm6350-pinctrl.yaml        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 85a4ff5a5625..0c4bf6e90ba0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -54,7 +54,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -111,7 +110,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-7])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

