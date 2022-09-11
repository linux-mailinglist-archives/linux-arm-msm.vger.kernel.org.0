Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A2F5B4DB6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 13:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiIKLMP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 07:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiIKLMM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 07:12:12 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6842A32ABC
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:11 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f9so9635084lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 04:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ceh+f8TxlJi2UoKOPdsH4JvikLyBx6shEQIrAtyynsY=;
        b=WfK/Jj6vCrrI4K9oreM/jR8blTb/kZ9Dw/WbHpBVLrTRS/R8Hdb1MR+waGki2bYiQn
         DqiUEvzcAH+LQiWqu4OqX9A7LdtqNIRCmlZ6qmRMKgU+ftnuZe+KjKGWGkkhvn/ZoMDO
         gNx9dMtZSj45os4B4cRyPIuoJ0Pkpy8SOeaIRbfIJ/gzjQjUAd1va30+6IImx7TNQRWK
         Vf3BRFrlX7rcA0dNI8o6gIKOpDFJJse/3mhhKeHkyxOpX3V0LTCHc4KcimXIwmvL21ob
         IXlmvoQBnVlUDLnU3EkFa4e4vyr+Yt9A5R/jsvmOWbGPIpnG0bugZiguJqQHYlIqjIIm
         EbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ceh+f8TxlJi2UoKOPdsH4JvikLyBx6shEQIrAtyynsY=;
        b=1MMFM9s2dC6WxKDKmbJdkCVpud8ckQIR5qVdrT1ORlf/WqfQHhiY8aRhEk1+5l0yOX
         UtIsB8DRqh7oZkl/yA0z9J/sIpTB6ZI9qFYJmIcMH3bT/Uy9knQaSGcK9n7zAUM/FRav
         Mp59cgHNPiLhE/uxDXqcnCdtUtGR4DFnAbWsNvDbeLqUIuxb/X2u9ybBdek2+srTwUrv
         VivJXSmhg8V9czkElBWk0vh4hcUHWCEvtLSSSnVzNIX9woZLMxULzi08cUpJx0JmkRIE
         LJFaUvFKG4OTXhW9XTp6x17JJg3AfC/qDC7mRDYzJoMLTMz+UVHloDDItHNqESpmpiCg
         Xw1Q==
X-Gm-Message-State: ACgBeo0HD06mPow0czHYXQceUoUiUGGflIiDDuH1x2lQdobUHoDFJjUE
        HKvtmzAZlPhq1KZ+NWYhW5/+NQ==
X-Google-Smtp-Source: AA6agR4i4kvqK8g4bENIZvSOxBq2z8uvod9PUVwWkOa9hx9Gdg6rM99cSX/Ae0xhDeyDcJ0cgf28LQ==
X-Received: by 2002:a05:6512:224e:b0:498:f21f:3500 with SMTP id i14-20020a056512224e00b00498f21f3500mr4879493lfu.581.1662894729537;
        Sun, 11 Sep 2022 04:12:09 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:09 -0700 (PDT)
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
Subject: [PATCH 04/40] dt-bindings: pinctrl: qcom,sm6125-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:24 +0200
Message-Id: <20220911111200.199182-5-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be either named
'pinconfig' or followed with '-pins' prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index c8eec845ade9..84ed16f9915d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -51,8 +51,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm6125-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm6125-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm6125-tlmm-state:
-- 
2.34.1

