Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA93F5E89D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233760AbiIXIIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233829AbiIXIHY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:07:24 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D482A151014
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:50 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a3so3501920lfk.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rip9dlqrCxUoqsfVIdKnVGZs/mVmoXJ1pwJE84kTnM0=;
        b=BYN1RmEIN4HrrjJwUV3E18I1szEFwmb2/CMwcfYPEvwwNESZcsHBcnysZ4SeIMQWpk
         tG5VIanHjeIG+WFDdufpzrqzH8PNA/GJG/PmBJjth5yJR3bmzzdJteXRkpwiMgKNmzyY
         RwyC0mKRBR3Nx2dbJySeGwd8rR16638gKhNmOvIAZjl18V71FwyJk0iWvU0ldHzHrpDx
         XJ5+FRGLfiDn5NV8kcHsE1ZkRes2qIyUtahEyl9jXdF2X3zm5gDbNE9XrU0Ay3kCwc/e
         w1CqMHmGxMm/fOYpT6AN4o0Bry/FyS8IE7FL9GM7GfZrisRz2e5jcsaN2q/Z8TYSMfwM
         ezoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rip9dlqrCxUoqsfVIdKnVGZs/mVmoXJ1pwJE84kTnM0=;
        b=yEU+tq8zJOGXdMfNYYWAD14lKh5WHWiwCbTi4/ZSHFbu1j2rxkLUaMjT/satQafIG9
         E1BXWsMUWVYFAQQFZVAeMlu1OJmLOfIomm/hI9QBf1Fp9U+fKgKSJroyfI0y50c5JLhr
         Si+LfUt8uOLzJFhFiWnKYCIN3txCBCO+rAOQLhCmvmJjUnXiOtuhP3WHhVPToTTCEKP4
         8X4WUSFXyHtA0vJjt3OowUytpVXoLdhfm8MP74nsfTTMHKOs3I3yVTks+MGS7hFLk6SV
         L17GnE1g5Qbu9bUJLz/WnxEcBCrJA9QIvG8hsnnXskQz97TYn8/cJP89QH4sjOXS+Jf9
         sTyg==
X-Gm-Message-State: ACrzQf2FW/LFU6REzdoZJ2dGTzPS2KN5Yy3LNCcAWlLtgzjqo7XCiyiL
        KaRzg2qLZaimkX206mmdFJvJrw==
X-Google-Smtp-Source: AMsMyM7DtqDqvO9kU8Kg5Vt/9Z6iBx2qR1S10wUIArD6VgSDnEosqOQTk0yPfKO7tpYCWpCAU/Bt9w==
X-Received: by 2002:ac2:5469:0:b0:497:ed1:97c6 with SMTP id e9-20020ac25469000000b004970ed197c6mr4510420lfn.248.1664006750150;
        Sat, 24 Sep 2022 01:05:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 32/32] dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example (remaining piece)
Date:   Sat, 24 Sep 2022 10:04:59 +0200
Message-Id: <20220924080459.13084-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.  Previous adjustment
missefd one spot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index b9ab130cd558..0b251caaebf2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -139,8 +139,8 @@ examples:
         gpio-ranges = <&tlmm 0 0 230>;
 
         gpio-wo-subnode-state {
-                pins = "gpio1";
-                function = "gpio";
+            pins = "gpio1";
+            function = "gpio";
         };
 
         uart-w-subnodes-state {
-- 
2.34.1

