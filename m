Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2F55F667E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 14:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbiJFMrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 08:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbiJFMrd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 08:47:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1233A2860
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 05:47:15 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s20so2506369lfi.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 05:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GtCTGlGKy966v/cPNs/91xDY9Oz5Cj3W8mgOw/S68pg=;
        b=ySfefdkyf7Sd2nA5w03oYTAy62V0MdtX/HOQzJFKQN7Vi6YFspFiEYRwZapx1QuvFp
         mWZyE1hmGcsFfExZdH98hUij1W39yrm0Yh3dQApe7BsX3I9hirJNolU3T7gTnZCEDO+A
         y83yVXBED9j2gBTYFIkNfmnkeDAYXx+Uib/EheF+vRwr6LrE3a+ZjA/BEx+ZAzbwkaXA
         RPU+4Mr9b6BqucdjR+D3vWQhXKmWQZJAeQzm+UGZE1kHSLZvzh/Prb/jmVA0kDQkNDAS
         Pd+D9aR2BJFerwT6QbQTLu0uo6e5rMrT2QuL/EUzbvM2UHi77SNytehCCJCutFHw+mmR
         tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GtCTGlGKy966v/cPNs/91xDY9Oz5Cj3W8mgOw/S68pg=;
        b=oVRumBrFYftNMkS3FR/Wpad+maAI6+OJj7AzhCCSjM6UHnvSbpYlQxF6SRdayXmI7p
         97DH5d62fxKLgIunHU6HfRG4O3dc5+ANodAzYW6GJtxTizxmdq8hAA1XgzQA8RFo2z9a
         R0cPNyrNQ6cRS4GKaKK34agmQltmcmWLmqKengXLL92aryzXRdaeT+RI06GaRuCq9kgJ
         81kx3t8A0XCG9NA0YDXfsW+wZtSplbMuwlNVbry4NKguthb273REuzDgzpeKUrwM6z6V
         XAydk3HlV6ITjoyKN7LxcfDJSPZVLpmCxttaap0iSOkbidGlpZT5Hr7w9PzFukJBcRcH
         5t2A==
X-Gm-Message-State: ACrzQf0arXUHcLMgrjn4eFb0ChvSwwoQmp4Q/klUZh91aBwe+pg4cikX
        00CD2n7lePlaoZCdPmWGZQnkew==
X-Google-Smtp-Source: AMsMyM4ub2GjPnUStej5e3LPCtC/FHXytcbNYmmEctKo9I6j+5vxBTigkTYqtqfdGBm7/FpVkUbodA==
X-Received: by 2002:a19:5503:0:b0:4a2:329d:bc74 with SMTP id n3-20020a195503000000b004a2329dbc74mr1974845lfe.77.1665060433418;
        Thu, 06 Oct 2022 05:47:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 10/34] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Thu,  6 Oct 2022 14:46:35 +0200
Message-Id: <20221006124659.217540-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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

One pinxmux node can have more than 4 pins to configure:

  ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 76698cd97e8c..7202e2af200b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -63,7 +63,7 @@ patternProperties:
                       sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
                       qdsd_data3 ]
         minItems: 1
-        maxItems: 4
+        maxItems: 16
 
       function:
         description:
-- 
2.34.1

