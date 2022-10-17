Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34DE601CE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 01:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbiJQXBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 19:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231173AbiJQXBe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 19:01:34 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E47282755
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:02 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id t25so7675999qkm.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=T5kQ4xI+7mFotfutNCWBVXuDKdVbU3n/2dkKxu+UmMP24lcjtCjOp01EYkvNd5H6cm
         GOc+24uSDvmMtY5GE4OwYdKVSuoeK+g14Z5HBZS6bvTKEd44j2cyvcVduYdbI9jYxV5S
         LhUcibs9cT6pg6HCY3NHZzbB6Sz//D1u9yAV6z4EXjtEUtEElcb6WBZ/pxYQzh+SUtbv
         7HGO8OT0cUZJedkOJRREts4qrr4B/XWFcCrLrjaZb47aHu+NBnHvNcwzaIQCSs8rP2fC
         5TWiWqYTm1QU1UyF0tkRdqhHieTBGHARAH29oOXRr17+PydZw61e9AZe0cgpXm64zY5d
         B2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=Cwf1y9iHzXxy/IALXszWEPYn+xRcYpHKZ0A6MBdfdlObmdZgOjTU7cQYMn61dzOM7P
         /GF9KpmorKlEBWE3qZF0nTW3sbiuX21Uxl3Bch1pKS7zdW0s4V/u5KOmRumn/tsS0Lm8
         +uxev7poUkINp4fPtVinVEJIKLKF4bCyRki63v0acgtH2bCoiv7lmHA4pDORxgrKghXl
         lvO5gINcdM9qGySMUK+hMvvjThIdCePcs9YrFb36VXc4R+XWS3FNn3Cg0bkRjybK0fxV
         ceeprTwLxiPCf9YYvVjVUmIiASMmPDb9ZbEUC65mhSc45WvD0+yIV9H2aPjuIKcGEVby
         T+hw==
X-Gm-Message-State: ACrzQf1ffmJ/nUxn9ZspbaRGcvXU+tbxJwYIKuQrnV0mIFTvYEpW5dKB
        YioNpY+nWCF9SFPou/eIQuU4jA==
X-Google-Smtp-Source: AMsMyM4fc38XnezLTbPN1tjYP9n0KbNPCX2ihLNTJo/jj7HlKrT5HV+BlkhDe0bEZFEUnhatRA5pyQ==
X-Received: by 2002:a05:620a:28ce:b0:6cf:933c:40d3 with SMTP id l14-20020a05620a28ce00b006cf933c40d3mr9196699qkp.258.1666047661610;
        Mon, 17 Oct 2022 16:01:01 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:01 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 13/33] dt-bindings: pinctrl: qcom,sm8350: drop ref to pinctrl.yaml
Date:   Mon, 17 Oct 2022 18:59:52 -0400
Message-Id: <20221017230012.47878-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
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

