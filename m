Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 573A75F68EF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiJFOH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbiJFOHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEC3AE20F
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:06:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so2880176lfy.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZI6V0g8Fa0N0Mb60LAsLdyWPSvNvWVbqoCuAkJZgzhs=;
        b=JIDF8cwmNfPdx26tk1eqfgpSDIZe9UypQDthjpV6FOq6EqSKSrDF4P6Hx2m1QHKqYr
         oIn96hq1ZSO4tJJIsTIhpeouo8kt2f/nkEW8l2HxRpH0/FJL/NkCrWWG/Rb8GPXXPXLx
         c7dH9xHB9kcqyR4j+D6HB9rTmf8wpwpCeLuyy/FxgbGhp2aZBszLG6TO2xJKh5Idk8Ue
         uNHpOieSW5GtC7iPZrL/WHcJ0eJ8pBXRE4bqMC+TjDrhw8ADOX8pECh316OCD1Cn6sbA
         nmGHeGjrh7YhKmD8xdO9H4AWI+g+rCfJoWJdwMWdM6ExJfZqBdvsTNmGWznwKcbc/tu5
         asQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZI6V0g8Fa0N0Mb60LAsLdyWPSvNvWVbqoCuAkJZgzhs=;
        b=ot7RO2AoNJQ4G7eshko0j7kWJAgJfnqKkVmvNhKLms+HkUSMoMmairpxDHDF4hIBc/
         o4YtmZHsD/RltcKa+1Gj4MWuKVebjxzM5ghm97FhI8QliY3gWDXwNPXWxLB99cep1nmG
         XtYpR4b5wM1ybZaUhSS+XEQp59JOQERzHSr6XZIRtH5OaR2na3VZHbehUzRvkyauc35L
         jButj9+cUjfe3//8euigNNhHD+NFIKkPVYcMLmylJP5XdCwkwVdcYCSH7GQs0VPbDkwf
         W3CRmhHYuGJ7zg8zeWbGwF57sV6IxkP3NFM3GpnC7VzwyFVCCUrno8rfK45ZCdhfsGtK
         vIQA==
X-Gm-Message-State: ACrzQf2TnywHOuFNUG3jBI1K2RAPugMkS1m2Vsz9uDWlAJSt0spNJBI0
        pKSV+GyvAjufTIuyzgTinyGonQ==
X-Google-Smtp-Source: AMsMyM5ToChhLcVsxSQ058FvFfhF6ZnMQsPD7i+QJhuCLdRQ3A5usc07mSmB9FLtcvlQyFkWW4VVqg==
X-Received: by 2002:ac2:4e0d:0:b0:4a2:6fdf:6698 with SMTP id e13-20020ac24e0d000000b004a26fdf6698mr55136lfr.288.1665065217058;
        Thu, 06 Oct 2022 07:06:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:06:56 -0700 (PDT)
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
Subject: [PATCH 11/34] dt-bindings: pinctrl: qcom,sm6375-tlmm: drop ref to pinctrl.yaml
Date:   Thu,  6 Oct 2022 16:06:14 +0200
Message-Id: <20221006140637.246665-12-krzysztof.kozlowski@linaro.org>
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
 Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 025faf87d147..8320e5ff17b9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM6375 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

