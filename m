Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D875E9285
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiIYLHU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:07:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232804AbiIYLG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:06:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C1D32A97
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a8so6729180lff.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=riHAYzYkIc2g3zYGSZW+9OdMXMpN6SWKiUDVtnd2p8Y=;
        b=FAjG2hl/kiAqhLDcVs30vg9KGRJeyDjbX+BLWPM6AD3GAiEXRESAPtNZtRCNWiOHIR
         uCOQnrBon4O+kcR2vBQKqEc7Po4hwyA6SskwoIbY+wUWTqjSUc4iSIiwrA41eyFQb2AO
         gGExYOcYhmEbNNsoS6+yeLVNc2D8+YKUKBvogyofIkzH7kSkYV+KJXPMdBsw6e1b1vfu
         kUSlfrG998nV8pfJkdVx9RL1dw1rjCvEFJRanm7YhlbUNwrjJBh/3qZ8WT+TORhkreR+
         nbhbwPbEDNurnYC3iNM0GFQd2m4D5PFzH8xusbTC71V510fMJV1Yfoop+js5Nf4PMpCV
         +5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=riHAYzYkIc2g3zYGSZW+9OdMXMpN6SWKiUDVtnd2p8Y=;
        b=8O1MU0Fo5w4tCIOa2voE3FtS9WDO80d89LFqtgiDsb2wDIKIZVL4qMItg56uDK3ZLx
         S7XS9AyBY43av9ySns2cDIikZlLj0O7hYSDI97lpIrGuTrBmzzhK9myQe4rDiKRDJuA8
         9RBPVX4ma+bP3n8tT5S7Rd9laOOQ4xYvQ0xPDkM1wQL5cdQxHVO8VAQ2FRB3nw6XMipt
         FANPyUUuCoZyxYflJ6tpuz3KW5PJAIl2i33xdsDjEj4lkjYQS7HWzAVbyDGDY+n+R4LK
         rMaBub6uobfSfsoO4klmOOk7HzpHYgVVhl2FWT81fhLM9JDv2PZLuMCZq705g85xAlLo
         Jdkw==
X-Gm-Message-State: ACrzQf1pv2SnI1swvWVs4DcjWq5syoYOj7Lvd4itG28rDgk4o+EUE9p6
        ANR8HUIGeCR5QDAsq+Q0UewmEQ==
X-Google-Smtp-Source: AMsMyM414UUOHEtN1KUwC+R69AWTqGrcOBpp9pJXFkZ8hSRwp3sFSvca/3y5uUcNxA3Kbu/o4Ga3Vw==
X-Received: by 2002:a19:5f4b:0:b0:49f:a4b7:3f1c with SMTP id a11-20020a195f4b000000b0049fa4b73f1cmr6366363lfj.333.1664103987689;
        Sun, 25 Sep 2022 04:06:27 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:27 -0700 (PDT)
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
Subject: [PATCH 13/15] dt-bindings: pinctrl: qcom,sm8250: add input-enable
Date:   Sun, 25 Sep 2022 13:06:06 +0200
Message-Id: <20220925110608.145728-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

The SM8250 pinctrl driver supports input-enable and DTS already use it
(sm8250-sony-xperia-edo-pdx203).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index da708c748a36..94f26a5ae3b5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -117,6 +117,7 @@ $defs:
       bias-pull-down: true
       bias-pull-up: true
       bias-disable: true
+      input-enable: true
       output-high: true
       output-low: true
 
-- 
2.34.1

