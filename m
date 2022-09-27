Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE9F5ECB2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbiI0Rjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbiI0Rir (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:38:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180301E45A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j16so16823438lfg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QWyssu4OHqLC0ekOypoYy6Karlav9/nAQkw9wJJv+F8=;
        b=x/7OMCb5ZemXQCpvosP0/1zP+kN5C1A4bPCEiIZjTnwuYKxOL8m7wKhxa+mGiF+FP+
         yIve6ketdbi/sr17l9UF+KVVNIwRL2xmnm99yekKsAKLlTXXB9n3ONitVpFJNKHz+q8O
         ydIQSSxYDYlZfzKGMYmQ1qmo0ZGOFYYCL4+I0d7PNDkeXllCLR+Y0z4eXcP31jXeMvNl
         JHcO+mM2h8LkW4l3V4R5E1tzhr/HlgEvMaYcIuyV6RsLnZHhXKg/t2L9L3vG09gm/0x3
         jdwhplZLObhAEdfJV5kx44F3Gan4QjTLbDJA6sOWeo4HgafqQK1rEXGaZrkie3sYwsZa
         ZVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QWyssu4OHqLC0ekOypoYy6Karlav9/nAQkw9wJJv+F8=;
        b=jabfJow2SOwlXSNvVYagBii6nSQZS7vR0igJM4g4xclo/TsyrMYy2/FLM2bDRoUfl1
         9hBuJVV/N2zWZKPtumcXYlYA3LeXglTofpZCElZOT5oIZKyCRIfZTrEHbY1Af7FacJwj
         63DEIiGxT9VGzhFWSWy1FBWd0prWceWIoj3tbfT+kcCdysPvSoBhfcbFF4BniL7O32Jn
         pdLVAh6ApbpCdw4KeYhHOxfXzPWCz+r0L+Bm9ecS1yKQHDXPipLKrPHtCp2bWOp25LfG
         wTbLWAP0p55VPO1xBU5hQOM/rEPX30XhgoLvX42Tx7nJsZ7hIX7fx8CSMd61z3ftV8hJ
         U4nw==
X-Gm-Message-State: ACrzQf2ARO4GTEc2TSN2vKqmqqmYNvZ8XrczM//UFNknPyzwBq/BGyx5
        RiLi1i2j+g4JkquoA47NEVoafw==
X-Google-Smtp-Source: AMsMyM5owfis2ExO5cEq2GgPgm/4v4UZuoIM6wgjK7l78bW6W9XPiMEdhEP2yShAroSZhAdfrNMzIQ==
X-Received: by 2002:ac2:59cc:0:b0:4a0:5393:3791 with SMTP id x12-20020ac259cc000000b004a053933791mr9092855lfn.495.1664300306096;
        Tue, 27 Sep 2022 10:38:26 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:22 -0700 (PDT)
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
Subject: [PATCH v3 15/34] dt-bindings: pinctrl: qcom,msm8226: use common TLMM schema
Date:   Tue, 27 Sep 2022 19:36:43 +0200
Message-Id: <20220927173702.5200-16-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ecb90c77f666..a64e2dbb0972 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -60,7 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -101,12 +101,11 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

