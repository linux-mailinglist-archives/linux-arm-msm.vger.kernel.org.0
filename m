Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D60F05F12A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232296AbiI3Ta6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232129AbiI3TaW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:22 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C9F4F647
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:13 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 10so8353811lfy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=751HwE4ANyqWjgioMZDa/VolLenfO2h9E4PUsKTqmtg=;
        b=awR/urScDETz3u4YGsD0uUg68eGVaCmc6FPn96ThB0WgQvJ7xb90q7rev7rrC9b7az
         fvDuVfJPk/Rm5sIxlIgDRcIaJxCSY/CY90AIpQlS50YB71BYEYNPzL4kyYuuIiUAKfCv
         Qjl8t4F9IFCj6AfyLuia8aVBMH/Ed2O2m+n9gSrqqj0DqtZwnDZ3/hKTbTJWQfcIrxc3
         hg3pDGHCATZMImDRLF/SknEDa7YajJYLhSbpZxnyk9bC6997wqe530hIMO5otmGpWcu/
         AgP4fdcsUbOWzPA9joNuQrWfWr5C+TIxGbScoE8v+8pj0nhju/9jkCDSNVHCwPgWDAEq
         xaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=751HwE4ANyqWjgioMZDa/VolLenfO2h9E4PUsKTqmtg=;
        b=FNc9GST2z8MTLoNjjp7NrB/Hl3m/5hn9vauhDc6uyPbSvAEcV+tDIER22C3w56SLgl
         I0cArC2YZLmUx9hQbzsGLynj9CyAqD7qeZxibEIOV+4QeTZbT0gu8QqhmmqWgMgj/7Fd
         SxWEHcegQwWFs5l+pl7m7INnDPo66ZayGyGh1jLZnrwmY9KCH983LRPVsI0HXGAoWrXs
         tQRI9WuQpLR1SbCDNonNBUY2RbC/ZV6E+R9jb/gW2NROXaE7IMslrhCnhglzZICLEdCc
         EWnaNxp2i3bqLHIWvvdbEgXyWzyava06LHHBV62WMuOMhz1C8Q72mDvfs4U9esm64o2T
         wnug==
X-Gm-Message-State: ACrzQf13NLrqmJDs3nJbhPrInb7JbwSyLWSpn7s9DWgnXb3HIgqR66Hq
        ZXaubguXi0KV5NTSP1ogtOpO1g==
X-Google-Smtp-Source: AMsMyM4QdTw8Odc4fHUhM/j5GmrND335cYcD42VOQtqDPMCsgYBazwrdXR8mGAl7MBTzEWYGpb3FMQ==
X-Received: by 2002:a05:6512:3d1a:b0:499:c00f:d95f with SMTP id d26-20020a0565123d1a00b00499c00fd95fmr3825857lfv.575.1664566211515;
        Fri, 30 Sep 2022 12:30:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:11 -0700 (PDT)
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
Subject: [PATCH v2 14/16] dt-bindings: pinctrl: qcom,sm8250: add input-enable
Date:   Fri, 30 Sep 2022 21:29:52 +0200
Message-Id: <20220930192954.242546-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
References: <20220930192954.242546-1-krzysztof.kozlowski@linaro.org>
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

The SM8250 pinctrl driver supports input-enable and DTS already use it
(sm8250-sony-xperia-edo-pdx203).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 131eb8c981f8..fb753fd8bbee 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -119,6 +119,7 @@ $defs:
       bias-pull-down: true
       bias-pull-up: true
       bias-disable: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.34.1

