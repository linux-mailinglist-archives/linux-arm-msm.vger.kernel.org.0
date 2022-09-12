Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F40B25B53EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 08:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiILGST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 02:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiILGSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 02:18:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D82A286E8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id x10so9325116ljq.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fEX3mEf1YS0VEGkwrFu/5ECJ6Ev0hCKVagP2clm1WMU=;
        b=fVTuBzBUkJ22VyHG6FNWHCYgoRTNWjgDMyVIXuk5sPhnDy9eMiAtlWYY0PFzdJhw/U
         9+5yWBbsHubw+nvqkA1HLrAS/8/1lKSI5915T74J9v3RSmSdCTTb2ln2Mzu/JiXtj3FS
         1MvRPCL0Fgc68BNi4TdRhQmgamnDzYCS2SyWM62/DGd0wh9wSpjiSqyyPqLoPWD0bFc4
         NZig99eryWwBIx55fgIpZSlt1dV7SbwapfQ+IWbWLtWq4Twl0Sxb/mXCLlWbuvHGahnO
         wnSj3BnhqAjSGvLRc8QAuakyz8X1izLxPP0juDBdmNoLgP0IfekWnN7fOnFYPg4moGi6
         4xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fEX3mEf1YS0VEGkwrFu/5ECJ6Ev0hCKVagP2clm1WMU=;
        b=2yHosqONMkI3iV5EToJdKLBIbo5uYQjeAeTlEUT2zJXMd05Id6FEUMaeLEFj/JwcQs
         gNumhqTQLx6rs0wvL8uxZy6zVOZlwsihAFQZc+q+A0ge0i4x8Sx1UQOEhQhKXf0xp34u
         YmZQXtYNTiQ7S71D3h+rDW8urrar+A0HI6r0OmWdgy2bu0SVVdtGtYARTk97yYEkkH8S
         NETpYGdZj+yDcRKXfJFF/7vqxB9xq0A7VgfebEK6lllJnwkPZY2shvWBm0m1A5noJedu
         Qnpfrn0097QRsiBOGh7T7DzPfRpMCtC+a/zARBExbJw2qZaNnsmu7RZvESQh3qCfzPkJ
         hZIQ==
X-Gm-Message-State: ACgBeo2CHMfeI7FWRcZX5KsmWI90mSWYUNfmtSVyd7vOsdUHx1uxYfpY
        deQGJrI4f2fk4M2R0lytmsVAEw==
X-Google-Smtp-Source: AA6agR4M8TAMHhPFbvbyPN9nvAjoUxf1GnokNm6GLAPiY8e/5IWPCyGMpO033fwrrhvc4VXrB2/CtQ==
X-Received: by 2002:a2e:5cb:0:b0:26a:b1bc:bba5 with SMTP id 194-20020a2e05cb000000b0026ab1bcbba5mr6959655ljf.93.1662963480813;
        Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
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
Subject: [PATCH v2 05/40] dt-bindings: pinctrl: qcom,sm6125-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:11 +0200
Message-Id: <20220912061746.6311-6-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 84ed16f9915d..735eb5d6834d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -61,7 +61,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -112,7 +111,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

