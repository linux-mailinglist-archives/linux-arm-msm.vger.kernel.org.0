Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8DD35ECB75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbiI0RmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiI0RlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:41:15 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2AE1D35AF
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:30 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q17so11699376lji.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ltLGpU1h6jZiQR61UECYm7DLTFR8lVcOJSAS94IZQoc=;
        b=O7Mbicb+6edgQvvk34cOePY8+ZiWVat0hWtEDIccHA9hP4bvfLWohyCrPeyx9dSqGq
         HTvW83mIRt2n3scLlvvgBk2EIv1bZzQCp0Qhf6US3cgqDJ3n9pPny4xu+A3Or2MAk8qc
         WxHBpGeyKNVaolvCEdQPLgjbm5Kb9DW7Nvr2lDZCUSqVOpfgW04kZUjShhiXg59H37z0
         NsGw6UOOst7ervmbThIS5uNrtwLwAZhFEsolW4/FkYuR5F9l/L6L3o9c5wJA2fr8SFE9
         YBGXn5sZe3+bP2X7bwVrOJHOnwiB9cmK+GiGvvwEqVLnpTIoqhQfu12qHq5OrsvgwRy+
         66uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ltLGpU1h6jZiQR61UECYm7DLTFR8lVcOJSAS94IZQoc=;
        b=TXHxfPFSk8ZaF3ko7td3imYabwmyZS7ehhMxOzvM5KcJ5FLOS8D+bz+vBMmv2Rhjfh
         EkKng9zt3O2EzJO59j+nv6Un1elerJ/oElnxOfkdjYHG+5Bn5XZoLfY4Q7zbIGhMEIi0
         UehOUknFB44YV1vwqVMbh0n62tppFRQlVx1eraNbzCdW2hFk1QCR1VO2zx6foXr0F+Wu
         lSIDRBERAOzLx8gEmMXSau422LYakAm/YUHs2+bQtFmr5/2DhtMeFPOrFUkJ3enb1wx/
         kR7JKYIkQjmIGOHgCBnlbF42G7vs5Y7FZAqYhWCxG5lsP+KfT6c5xEMdEJz5Zv9+vYEn
         V1HA==
X-Gm-Message-State: ACrzQf3otVHDadiGfFDzfYpcs1hV60ArXW9S030uuenZ357qwJcGVh2W
        nOFS5+WmaHAUMCrTe4Dga13ocw==
X-Google-Smtp-Source: AMsMyM5qIM+yDbAZmajj3xr8GrulfAYa7rrZr+u9ppiNFplrs8xUh6tb7E3CEecyVVwjhuTFOLOvJg==
X-Received: by 2002:a2e:bc28:0:b0:26b:d979:fc72 with SMTP id b40-20020a2ebc28000000b0026bd979fc72mr10651732ljf.292.1664300356447;
        Tue, 27 Sep 2022 10:39:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:39:15 -0700 (PDT)
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
Subject: [PATCH v3 32/34] dt-bindings: pinctrl: qcom,sdx65: use common TLMM schema
Date:   Tue, 27 Sep 2022 19:37:00 +0200
Message-Id: <20220927173702.5200-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>

---

v1 was reviewed by Rob, but patch was changed since that time, so not
adding Rob's tag.
---
 .../devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index 0f796f1f0104..f5451b1a3a2f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -142,10 +142,12 @@ patternProperties:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
 required:
   - compatible
   - reg
-- 
2.34.1

