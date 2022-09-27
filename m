Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1DF5ECB56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbiI0RlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbiI0RkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:40:15 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C023B1E8024
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a8so16752402lff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dybnjr5p61/gPgkCl/RaZs1FBVAW8oN+hfiHVJUJz8M=;
        b=JXG5CBa8BebjlIe1kGsL7RXljPnpEp2TKYyvuJqPwLh4vM0oE5VTmMr2ECcMjUhKqv
         lBujoju+vXkLp12j8kUTlWa6G+BwLZ2JiaLVYSIGBRBOqpgaiqvTfM0Dn+n/GAmmEYEF
         +ZMri3aoDbzQmKdLM5EesrC04+6KhHha+5wlb4238vsCYEN40jhzzwwgOhF/a4q7mXTK
         bTAkLdjxlWbxfeqX/l+79tmRDpDqt+pXO2PIFR2aKjmImVSbOMQ2IxcS2CUbeCYQxgDO
         NDe9xOMipeeL6DqGc293JDPCiMQXyJBgsKEwv60cokM6hqPZR+p62n/onnG9x9ZCWLXR
         ZEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dybnjr5p61/gPgkCl/RaZs1FBVAW8oN+hfiHVJUJz8M=;
        b=RF53tWPUe9tNdP/b9fYeM0QZfPXZcvCnTUU8DCBxy+nq1LxMfcCH8p5/nTmKu8cdaI
         /2qXiBa3+Ug+Oak5Ec+ayfKL+ELiGW0bwYnBzBq23ZMiz1ejOvKGumxCPVXIMD8En9E5
         AMcx0X5FM1aPMAKVFV+FOfN5PJY8OYMXxK8orpmrMBrednG6W+3gPUzPQlJO2NN6B+/o
         UxmSwgZeIV2FJw1aUDXbG2F8t2imQ6X4W3D2ApPKA9Zwc2cR/g4X4OVUOsh/xMTdqcJo
         0Liehy7/1Gnu+fMd0fvsaQvA/xbQVSmq4hvxm1qpz4PiK6nVqOtS0nCai7+YMOrPZs71
         4KkA==
X-Gm-Message-State: ACrzQf2dK/q/aKXrM6gxuQlMYeYerkHmkIqJATR11Lgiz6YAJuSe7YZi
        3v2Qy4gWQu97T1zKUKeufWjbjg==
X-Google-Smtp-Source: AMsMyM4QQVi1ri2hpBm1kaQp8KjesUFkx6szvF420AgHpdmNUad5KKnAzZRnIE4dDHRrZAwES9ieoQ==
X-Received: by 2002:a05:6512:3f1c:b0:4a1:d76f:ff4 with SMTP id y28-20020a0565123f1c00b004a1d76f0ff4mr4501278lfa.292.1664300343140;
        Tue, 27 Sep 2022 10:39:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:59 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 27/34] dt-bindings: pinctrl: qcom,qcm2290: use common TLMM schema
Date:   Tue, 27 Sep 2022 19:36:55 +0200
Message-Id: <20220927173702.5200-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

---

v1 was reviewed by Rob, but patch was changed since that time, so not
adding Rob's tag.
---
 .../devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
index 5324b61eb4f7..2a23f413c8c2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcm2290-pinctrl.yaml
@@ -119,7 +119,7 @@ patternProperties:
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

