Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91A8D689F95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 17:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233378AbjBCQtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 11:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233355AbjBCQtG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 11:49:06 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526CB1A97E
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 08:49:04 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso6418815wms.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 08:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPGIQMGiuzh1lR8nv0hVybfRN6cS2OlCFSuMfHEv4Qk=;
        b=ndMR+Sp/SSPTCAPvgGub1M0Ublg+/b53apl8CDJirjidwZHB7qAZwko6bKqC6RyJB6
         EVTPVI6JZQSL6pifqZJlZ+TQWMY7VhSxm/+6LV2FCSwK+KXgHKHnrnWHnW6kHe0O9129
         5VD0XZVI8TKmVHArQyU5iqpw1GGZo22c2n4X7AtDIA61emhLdqw0pjiwR2rnInyGEe8C
         k+OBVsk1tVrk7uOKxtrYX6T3Co2KIdDXT3W1FXhJcQyzcFCxsrDkhJOTtj2EiU8yY3wQ
         qrUJimsVopf+n1HAEdc1LOG9VAq6CPmPyTyL5iD9wCov94ij4sDhDaJgywRBPTGZLxZw
         6g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPGIQMGiuzh1lR8nv0hVybfRN6cS2OlCFSuMfHEv4Qk=;
        b=56AoPLTRrGuWVVqsApmNqDArOU3GjWEIju4B25DgK9nbnzvCPqZP0HlJK8NjYEIl4y
         HktMxjQdzytmFKZ3dYmDJN33eE/UvV28h+BKGbD2sqNZd7F+bOAIW7/fSYiQWZEvYA1U
         XdO/+VkNNYsCdyvsUyrmlskXesJRTJ9MeDGYJB5iwClVyYd0960MzWdp13pu5jR8xQQH
         em+23tH3P6wBV/KDEK43LatnUi4+eOOVGk4X0dRMo+8VBsZ2a3HVdw4ANka+FWeOUHlZ
         kV5crJmaaTGItTi46B1KTspa7+UBRVqK4r+RKMbKnz2mo07ySJUpnd5OM6VPtt7iCQIH
         Znpw==
X-Gm-Message-State: AO0yUKV0Hl7w4ammPxj1IXR62WNJOtwqE9PJhaeVhI7HCCbNW4JWYh34
        QQ0lnJHmU18gJ4j5rp1Vh/Ejbg==
X-Google-Smtp-Source: AK7set8ZA4rOQL1llR9Lj0TcFZ7Ju5sXBox35xsoRQmWfSdKE+OG22fqJaaceJM66St5hyDJrqax0w==
X-Received: by 2002:a05:600c:468e:b0:3db:1434:c51a with SMTP id p14-20020a05600c468e00b003db1434c51amr10555011wmo.40.1675442942792;
        Fri, 03 Feb 2023 08:49:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003dc4b4dea31sm3503247wmq.27.2023.02.03.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:49:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: correct GPIO name pattern
Date:   Fri,  3 Feb 2023 17:48:52 +0100
Message-Id: <20230203164854.390080-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
References: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
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

The SM8450 LPASS pin controller has GPIOs 0-22, so narrow the pattern of
possible GPIO names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index e04d094d1946..8bf51df0b231 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -65,7 +65,7 @@ $defs:
           List of gpio pins affected by the properties specified in this
           subnode.
         items:
-          pattern: "^gpio([0-9]|[1-2][0-9])$"
+          pattern: "^gpio([0-9]|1[0-9]|2[0-2])$"
 
       function:
         enum: [ swr_tx_clk, swr_tx_data, swr_rx_clk, swr_rx_data,
-- 
2.34.1

