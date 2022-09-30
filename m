Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6955F12A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 21:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbiI3Taf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 15:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232088AbiI3TaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 15:30:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5CD422C8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:11 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id u18so8326888lfo.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YcI0G2tvJ2eeBoXCl3/KWqeV9ihL9n5QFt8TDOVyV84=;
        b=MOuf7S1DiBaiESHsFZqhnaVlBQ9PCDhjzQFbeDmC4qvDCrVD0VW1BAVTPOiL6AQw3X
         qU/IeNa4425XAiBNAcBcQaHmHSXiC2JhIQjldwhT5adWqZFaskSEpYepoceSrDpgEw4S
         g5YxoUMqhHH1qPRkyQoSt/tgNg6eteICMUkTaidUoZxMa5bkALbtF+ZMkihMWciex+dh
         PPGsgeO++r39YLjrjuz7rYRCcTpey0C/LF3LFDLkiNAPcvNi9Sj0rRg7aKsUuYFd4DPN
         bZ+LV0eyGRK9aIqF9rAqMhlvwgXBG0t5l9jzXwRh9f6qQCRKi9Qv1AOWVVyvO3/0z2vD
         4BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YcI0G2tvJ2eeBoXCl3/KWqeV9ihL9n5QFt8TDOVyV84=;
        b=5rojoL8G2V7rOC748xvQavNRqLyEmwXGB9NSjnt0Byk72FdLVIvMmuEYSR9q1EA/6/
         HiB0G4FwGDTnRn4THwTdcftgNP/dJtGWBIhUS8f6xp42bK9kIs/e1QM2gHkyw+VZGbEQ
         9c5nsSxznXvKBUBAbGObtp3SIw36PLdOrvRrC65YapT8nYnBtIrKc9lk1w0AlW9Ex04V
         /gcvH5nR1DtT9u1RRSvEdkWGWNwj/ihv6/KeXvdTuhCC/Hh656u+NGF6ID94AA6lukVa
         HCSdPzJvdKhEflQFpXjqU+NCzDp35HMjjP75ZL+d3nmlbYQ46/JrF8QiIqk1lCvPlWE5
         BSbA==
X-Gm-Message-State: ACrzQf3hL41qxiWBZZeV1sSgS97Fh/unu+/kU9R2MVkMeOkbLvUrv50V
        NdDW0WFePiEZxoEBd6Oh1OZpIA==
X-Google-Smtp-Source: AMsMyM6JWXNaKmo9ITi8GfvgKGi5qyyVtQiC813vh+ypLgkIaOyuzoK/K2V2eZk1/Pbf7Ml+sk1zCw==
X-Received: by 2002:a05:6512:239c:b0:497:938e:2c99 with SMTP id c28-20020a056512239c00b00497938e2c99mr3676715lfv.416.1664566209605;
        Fri, 30 Sep 2022 12:30:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0049f9799d349sm393603lfb.187.2022.09.30.12.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 12:30:09 -0700 (PDT)
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
Subject: [PATCH v2 12/16] dt-bindings: pinctrl: qcom,sm8250: drop checks used in common TLMM
Date:   Fri, 30 Sep 2022 21:29:50 +0200
Message-Id: <20220930192954.242546-13-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema brings already
requirement of function for gpio pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8250-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index d7d8e5d3b659..021592b32904 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -64,6 +64,7 @@ patternProperties:
     if:
       type: object
     then:
+      $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
       properties:
         pins:
           description:
@@ -118,16 +119,6 @@ patternProperties:
       required:
         - pins
 
-      allOf:
-        - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-        - if:
-            properties:
-              pins:
-                pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9])$"
-          then:
-            required:
-              - function
-
       additionalProperties: false
 
 allOf:
-- 
2.34.1

