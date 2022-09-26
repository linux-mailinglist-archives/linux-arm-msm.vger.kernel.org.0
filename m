Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A94995E9B1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiIZHsz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbiIZHrt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:47:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D034D38466
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:25 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j16so9526603lfg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mweOvkpICMOfupA+AxR3sUo6cDzRelMcpG98SvyuQUI=;
        b=jC9uGJ1Ey+WuXAAFg7tQx+ROr4bWC+MZ7BAcBHS/Xt25KellApdOodcvEds8ANPidZ
         bDZ1aTP0GKD6naMWPhyhbjHjqi7Qfv/lsvM1uBE4tbkKJ3E+Mdox0rkR9Y9dfas27geH
         TRD4VFkjWYo7B8IjLxUb8WUyUF2T82skwSDepLU6alzBFJ06GwpVy2ot33rvQ/qD/t+f
         4lXOE65toZMkes7sT9r1D2IUSHgHeNOveTbDmp9FIxo8RzgDnNgfkq3X27xrkblBOS3o
         tQhb+CNUVTkAWF8vRpS9NU5sr1YHadrDwSm3Achyl4c+wlNVUryg/1M5W/PfIAue0048
         CHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mweOvkpICMOfupA+AxR3sUo6cDzRelMcpG98SvyuQUI=;
        b=Je8MB+UL35cI5R/I8J7yWhw6kW0Q+V6n9xRazBpH2bw38q/c14+ySQNle29kBZXRkF
         eUZzLpbwHCzg2Zp+aS2jQwzX7ppnbQQS51dmc9vObloCRi4j6XVTfn2GcFVr+buiXeOF
         WCXWvjxv4LkadaRc3XpXEWY2A1zJzR9fWj/ebA88ALp4SIopC7qAUlB6rRQLqj+dFHOI
         GZVnI3yWcUo6zlpqLP97mlkDhzzRknZe/62jngOrjnB71L6NENtkWK4r6u+h8NGReFTB
         c2kp4a9sjb3UYjz6L/ffulIJZHoL3yjWF9a7CMAOZp6Tvh9qb+KADSOF86CC5MMpxpVU
         ZQ5g==
X-Gm-Message-State: ACrzQf3x2vlPKGk+q/0ADZEC9DndRpOysoU75d2vE8VUYiL2wOUjQV3l
        tyt9xXLJlD5EPUMyUB26PaEpbw==
X-Google-Smtp-Source: AMsMyM7h3Usjznp+bqIol+3YyF81DP5TOSGr6pZAZ3NVwPiOa1sEASGbLIItdJFVPJQRX03RlvEu1Q==
X-Received: by 2002:a19:654d:0:b0:49f:5309:1cb6 with SMTP id c13-20020a19654d000000b0049f53091cb6mr8046571lfj.522.1664178325297;
        Mon, 26 Sep 2022 00:45:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:24 -0700 (PDT)
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
Subject: [PATCH v2 31/33] dt-bindings: pinctrl: qcom,sdx65: use common TLMM schema
Date:   Mon, 26 Sep 2022 09:44:13 +0200
Message-Id: <20220926074415.53100-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

