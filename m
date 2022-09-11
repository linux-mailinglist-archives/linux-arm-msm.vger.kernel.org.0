Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4041C5B4DDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiIKLNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiIKLMv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:12:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B755633438
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id w8so10343596lft.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=huMBt2cOX5WYiW0m7Bpoars+zfOhAPbHFngq8gou9wo=;
        b=gjjFGcTzNIJEpTozDwXlCSQu9pxjor0DOliAlVN4b3xO3s+BMl9gcVSKWAmyPezafe
         stShxSixpggf+L5Ut3/uAnnWPvHw2CVeUTtPWQC2lEhfZAZEj9+AZA0Oj0M7W2SxAaRN
         gwffL4xCb6oQI/13wC5i5HtgY3xpVlo5iWdlMxpOt9ajb2Np/fzwUBemzBo76Xjpm+3e
         FHMzR1Gwu/tywUBKZqePd3b/Ak+TBkAEXrsh3A4N72e7HdMEPX3zFjV2djtdKDrHScuP
         nKKBGJn/bWpLcj/A7qXa5ehbHCQOYvUtiaMyYhzISPh281JdnJ7TLUvJNXfkBDsiIuRH
         hAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=huMBt2cOX5WYiW0m7Bpoars+zfOhAPbHFngq8gou9wo=;
        b=Mz3dY3s7TzgPxrcm7U/vblhIQU72ouKPzvBvXwZIcGB9BM2fLzXPlr0aGUdNP817PP
         QZgdomcObECDoLNtTGqY+9SqIYSPdrr+ax0ChGQn1IiVvS8OVNKoLQs+yqmN+JQ94u8T
         GYnxOjistb+20Y7JncPvRnkZK9Dw2pTImc4/mB6kA/50WcWUNemLhtu4s3gMqj6upxPc
         booRPpYkLz18J0/poAz3PcFbwVes7KKNVwQVQyVOA62htW8zka4iSOtxMiVzqH00mkbq
         S/j/BYCFuBMgGirphLttyhFNgE/6T7jnck9hLgvbQ37XTmB9x2tFckroGWQ7ulA0PYng
         qchQ==
X-Gm-Message-State: ACgBeo14RZ4+0lDDNKH8Qz+YFEuMfhYyiKQn0+DmOytfwsHgdLBvo0V8
        Av/guH7sVlBZ6nBtBFD/FLFiPQ==
X-Google-Smtp-Source: AA6agR6di+WIA1ch9u/rQZkDKXpzRSwuSZEtWBV8LhyTjERbH1hCrJWCet09H3Un6djVDYxi792y5w==
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id i3-20020a056512340300b0048c972750b0mr6898768lfr.309.1662894740977;
        Sun, 11 Sep 2022 04:12:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/40] dt-bindings: pinctrl: qcom,sm8250-pinctrl: do not require function on non-GPIOs
Date:   Sun, 11 Sep 2022 13:11:33 +0200
Message-Id: <20220911111200.199182-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

