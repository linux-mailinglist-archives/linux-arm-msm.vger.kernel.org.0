Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9845F690C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiJFOIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiJFOHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20376AE22B
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id s20so2845061lfi.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rmWrwXL1/rEa7YwSXjYI+sleNSYWYmtoDksU9D9w9FQ=;
        b=sm5+TVVv5qjweRw2lfL96piQUy3Npvv44gp5pEoTucx/iv1GPnN02CcuEVfTyp8hez
         Wvl46AKYqeajkqW9Uq372bzBVRq3sO1aNX79K4kcjLTyYPkfVJFUUIl6TzNLDF4me8N0
         1T+rFWY8DK6oDl4bb+OXF97+5zsfns32b3OF/rB5mfuyXxqsnn9Qfn/UJCnbGMfz4+Li
         zc65MC2YdH4Qo1Zrn1Ubs8S3ovdWgILE4uzu3EV2nCWcf1GRG9D9azIM6dfXzcsE0Mp4
         JFMUsxR0A+B6/6m5HIssC9nLVvJ5g3GfcpmQ59/uzkVzaj2lvkwBeq3Qj+ELvX+7/JmR
         XuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rmWrwXL1/rEa7YwSXjYI+sleNSYWYmtoDksU9D9w9FQ=;
        b=mvx208Wi2XrqZwvMcb34looC6pBnREPOZa9vvnP4JIJ2AuP3tHaINBaHXWsxbUFKY/
         QFZ+zneKjpTwNS9KVCBQoguqKYbWtpym1jVtesRHJBh9Ug61sYG3lx1LTmBRGrx7L8td
         GV98YGDNBD0tmcj3+0AWbUJRbNFyoBn5FRWzMvfw7GrGTlveQF2UyboSJrPpMy6rprjM
         4ptO4RUOOuNwRq+a1QbF4fsdXB9ZizfO/FA0Vmdl+cBJO+g5veFIVDvD+90yDpxKEc4Q
         HES3puDF4/4V4HG69AkyBgxAftaWMkXp/G6Pv0M40txHHJTigaAje/UiRAQ58Rv5BFEs
         mJJQ==
X-Gm-Message-State: ACrzQf1+WPUh7oGSXulYM6t5sc97VO0IbbOG4x116oQp6/V56uIbHUVv
        ITL77Dp/1ErjiYXTbC1Io+3KCA==
X-Google-Smtp-Source: AMsMyM5cyxJ2wXG5J2lSVHvH2Lum7GE/H77ENBOqqdMxGyjk8njACSLQkNQxnNdyJMHQPZwdvV99ow==
X-Received: by 2002:ac2:5a44:0:b0:4a2:5c3d:d68c with SMTP id r4-20020ac25a44000000b004a25c3dd68cmr39450lfn.347.1665065220826;
        Thu, 06 Oct 2022 07:07:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/34] dt-bindings: pinctrl: qcom,sm8350: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:17 +0200
Message-Id: <20221006140637.246665-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 6ae5571f60da..1c0186050dcc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM8350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

