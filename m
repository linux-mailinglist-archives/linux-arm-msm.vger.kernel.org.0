Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE3C5E9271
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbiIYLHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbiIYLGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:06:33 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48022326CB
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:26 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 10so6785350lfy.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aNLcQQxhPdFOgwRsvgsgtamBjwIOHo82jCWuV4BIKpM=;
        b=jhrnCb/Fnu5wUNoCrnU7J6oEwA36I+carel3+GeIXo3O64+NhfX1igqSU+OMZcJoIl
         FO5V4Uj2NKbTH2jRVxTmMU2q4DJEoQPqGgOAllwV2vnRiO+vsipU8JnyDm3kFc17zyLI
         atdtsSHSpaTBjd1saeK72U1nPuerTAy4+O0pqW4d8A1uihYB35LnCbGDiY69gSjdUguA
         FdaHFsjX0KE1Efwl92ljN1U1xOkStbp8KtKWCAG7clw50OPOecxh7ke51SvmWLq2eLdX
         4FduUBYWk8wXv8LwPGGTev5mSbPpXCmqvecwR7r4eX0jgp/kbCe/wSnix7jc8sAHfZMr
         NKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aNLcQQxhPdFOgwRsvgsgtamBjwIOHo82jCWuV4BIKpM=;
        b=qzbtCI8rJ1yTRKyObZGK4P5Eb+d05xoRX6+Rrd53bKRBBdOtl+Ovu8sTiq3kj8Je8U
         BQ8srQtrEt31WcznRKzlf0WLaIErTtk2QIErds7uu6x5LHVG6QTNCk2lib95eEffjT96
         NP29H8erBBf3rMY27UaR2EZS/4ZUb9i3C+bqiJVWCW0tuc2uUcm4MUs0/BOhdhG5ohHM
         J2q1Km5pl7ZX+zhFgbEkaoVvpvpysWCAhfHFgipJ6Z6pwNGOGL23jT3Ytk/4IK8KeiSj
         2VY+pOQp5AoBVApkE8e/w0uXdDfMUuvQmYnS/fXCcZpdFUvj865hq5n+Q5uOWg1SK47w
         +L5Q==
X-Gm-Message-State: ACrzQf2EB+S9XbRXSAou9Bz/OalUVWvuKNHvHmfLBeHQlA/wnz/lrd7T
        1Nq9B7BuF/Ocmke7Duyho6zCiQ==
X-Google-Smtp-Source: AMsMyM56CWbj1FJw/0qknzbYyh2y3pGIMvVHX90IMH40I9yAU3a7RcLmecGWI5czIsSEJGRZO/amMA==
X-Received: by 2002:a05:6512:3b8e:b0:49a:d2f4:6b7d with SMTP id g14-20020a0565123b8e00b0049ad2f46b7dmr6324123lfv.627.1664103985707;
        Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/15] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
Date:   Sun, 25 Sep 2022 13:06:04 +0200
Message-Id: <20220925110608.145728-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

Document common GPIO properties (gpio-reserved-ranges and
gpio-line-names), already used on qrb5165-rb5 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index c44d02d28bc9..d7d8e5d3b659 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -49,6 +49,13 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 90
+
+  gpio-line-names:
+    maxItems: 180
+
   wakeup-parent: true
 
 #PIN CONFIGURATION NODES
-- 
2.34.1

