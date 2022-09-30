Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 384345F12AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbiI3TbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbiI3TaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:23 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A00D3E748
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u18so8326813lfo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q7Wt7NmwcU3io2xsT4q8AlyT1mkGLYVHtOHkxPZ8Qsg=;
        b=fHO+IsFFscYyGA6KsxL/3LYq1dgks7LmCSFGZLKQgEaYwpH13vAbf7dlPPvk0dQpSU
         s+luPjaTjFSRIP4MkEjbMSz84wvGGCVeudPdTLoC4zt73QFRx72cQzcGSuZPQO1AM2VK
         pziRQwHb8bwAnHullmH9WyUVknG+N3c9hqI8oLpH2uYMdQxWCR+7k56VHjl1H/ZqTqW4
         wt6GOaL/hJX3XCqP5AGMU2xqg93vtQfxXj9v/UX9SaMiA2FKRFRzFVADKVVKBZOHTm9Y
         JADTWFT10QDgFNyO8vFCiiTT5rbhtgeo+KKChW82g8qH/W57RqFC6MOjVQSuDlXlCJLR
         hcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q7Wt7NmwcU3io2xsT4q8AlyT1mkGLYVHtOHkxPZ8Qsg=;
        b=6b6AJ0yYUiMp+yhgV9qZE/+0ObsYScP9aNmPocMW4UweicXieoJFCGH3SVYJpK1mTA
         H+/5bYguxcsD6adS/WoJZKOOlQSHXipISrQa1YZmFF4tPb9M9nYeRzsJqs2ij1jhQRiF
         KMPgmPy/VCpx3FfCdSZofeM2MuCJh6QYgXS7ZHy04ohTtuOwXeTsnW1vx/6H+A3z/UWp
         GiPGUbQRAt9974TQzzyB1YtxzGVTGAVFPhFqKiakb57iVYslNK945jME4EnA4nCZWXyK
         DCLqaPj+9SvOO1FQckbTTJfggBIpK4IopCswQx+I/ddAjfS0NMUrb4qKreucNFaEBipc
         DDXQ==
X-Gm-Message-State: ACrzQf3BeRuwh3ms/Hm1V07haX3aKHWf9iJPSfoI/41BP7i1LbPnsdT+
        Lm85PjTqXLwQAvOXv7AnF+q1OA==
X-Google-Smtp-Source: AMsMyM5NisDMoIfxYBDmjkTtCz7/i3xeob65iCXd3elLnTRywcAJ7iq2YVvSzdBDjBbkW5zH/aX22w==
X-Received: by 2002:a05:6512:4019:b0:4a2:f25:4214 with SMTP id br25-20020a056512401900b004a20f254214mr2214737lfb.94.1664566208412;
        Fri, 30 Sep 2022 12:30:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 11/16] dt-bindings: pinctrl: qcom,sm8250: add gpio-reserved-ranges and gpio-line-names
Date:   Fri, 30 Sep 2022 21:29:49 +0200
Message-Id: <20220930192954.242546-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document common GPIO properties (gpio-reserved-ranges and
gpio-line-names), already used on qrb5165-rb5 board.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
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

