Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4A455ECB1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbiI0RjH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbiI0Rid (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:38:33 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166B11E3F44
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id c7so11685576ljm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=D9NqHmVscqTgR80MyGgo4xdR6r5XZK5KUzqO3Hs+6YU=;
        b=jt9V6nOZuEJWPhqzBalm7Ci9griAR9Qq4CMaYb+FMJDgC12laM45FKXNI88Gh2p0cl
         98s4CJXWAHUPogi19xjx3IwNWLmMA+mAwZcMn2X/ZqUn+9TIGG0g9o/DCrSRE/xhMy2n
         C5Ax2Kp6DVQPSWXeIdCic6pB/ZLx9bqMbFDaTfrvgSeJCy3mDy+ZWiNjBn/MhoZdYu1L
         mp/Eg/RPNxXOpQSA0jUuCNvdgCyWptgZcyrponc9+wW9Kdmh7mcaG+JMrRa9s3+k+Ad0
         jTSpfRHT7gVgx1ajBqbMHBhI4f6cSOl4B9beD2NXx9yrpw6MJu5OnrQRRJo0fHWF0GgL
         fCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=D9NqHmVscqTgR80MyGgo4xdR6r5XZK5KUzqO3Hs+6YU=;
        b=rabKteBZjdqasE+GpLo2SWT8DC+fjuyoZI1bI3ZQewkPlQQf7T5GCn+6pzfNc0Aiuc
         tw39bCMIbsRlZveKGjdcMXNN7dmWi16u/5Ejamv999Kh0XnuxBK9uuLFRItwuy7MW0gi
         DsZvotT/hLAFcnsI/UElqVGj19Zm6dBhecF8G/GbczoDjzD84ZxgZA9ZfofMyTcfeIu9
         Nj7ApoLK+4bgW/qfkL66FNP7Rl4ddaDWYN9PAmUEuaPZXRplALg+pDrHMffHK77aor3f
         gdzuc/7qgdMMR6BW3HdYibIMGaDiyvoCIf1Eslm/XEpOs4uxJNp3YFTjnxRYO8uUMjQr
         wWtw==
X-Gm-Message-State: ACrzQf2UO15BvKjz5nVAkvDYge1iB1hpoajcTBiP1wbSatYhFWhEEbu1
        IQE+EpnMGOTB1VYG0x2P2lsVAA==
X-Google-Smtp-Source: AMsMyM4poDckf7x6/pf84z11NdpCVpIvrYbhs+WGnnKXbnXboA+64M9rKgs0ForXgo0ekfMFTUZgXQ==
X-Received: by 2002:a05:651c:128d:b0:26c:37f9:c8d8 with SMTP id 13-20020a05651c128d00b0026c37f9c8d8mr9761270ljc.97.1664300294096;
        Tue, 27 Sep 2022 10:38:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:11 -0700 (PDT)
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
Subject: [PATCH v3 12/34] dt-bindings: pinctrl: qcom,ipq6018: use common TLMM schema
Date:   Tue, 27 Sep 2022 19:36:40 +0200
Message-Id: <20220927173702.5200-13-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 735a8786cb13..bc85e098b5d7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -56,7 +56,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -121,12 +121,11 @@ $defs:
 
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

