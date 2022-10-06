Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29CF05F6917
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 16:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbiJFOI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 10:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbiJFOH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 10:07:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201D0ABD5C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Oct 2022 07:07:04 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu25so2893617lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Oct 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5uqVTGHKp2EbU7Wz0x0CUno6/1EribUdVjgKFJQWX/8=;
        b=eX0x6H+2JzHrgwXW1BuOO6zn9BW7CrBbQE2JACA/gPXNbzqnVu0yip7SnHUq+v7eEK
         m+4ZFAZZy8dcjbdDWGBovqdc5bD8N+ZIm3A45y+x2HZeoHXioVQ53wnUXxqMVmOzdVK8
         MhlQM2e0c7p0jgIB8Kq4F6Y1PAyCTO8tWClBTEQ3NvxCAYsQPPNlK9gynqW2gQUkFT5W
         Xxnvyx+1T29uSWTGjoHWXf9NDOxdVed3Cm+xWgRWdPvdBedb5UinpR9N9pP1h37yFGl+
         vkiW9V0ZJy4TLSMrxKS9HsmCPRIzsnn3jQJEh5yeNrap4Qt+W+PmQNIIxMEPJgP9ZZbE
         Kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5uqVTGHKp2EbU7Wz0x0CUno6/1EribUdVjgKFJQWX/8=;
        b=nAjG409ZQkKW436H2yS7A1FqxwuSzsaR379/Div32Six+X9u9u2NBaDknrGzoAnG10
         +3qVPheGonwsCm92DYzUx5xjK1owo+p+3bpNh7o7IRBpHlwp5TSFu90qRtoL8nWwtdO0
         jFQaJ69lqhjmNGmAxJlRFWfqqqsbbOxRZkL8HgPf7Cb/xeS06LuwuyySxvObrQY1SASU
         mTBanx8az3pQvfC3tp7hXAOXSeDEc3qWKERpDK5gd+hp520d08ji2xNSKFpDkjZzhrzh
         H3oXXWcXq+gfy/8w97aVAZ1aoiwKLiRc5vYfBe7E4vF9pORihOnnlHbEFLJNdhclkl1H
         QMsA==
X-Gm-Message-State: ACrzQf2UNWydu2NcpuDpd8eZhcTwsQ2VCyzUzsP8DsxoiTXaY8DcWwK8
        09BYUiRypozuVjKsKmSfxtR39w==
X-Google-Smtp-Source: AMsMyM7MavJaNb6wx7RerrbDpMR115M6b6YvS9l+oJhoZ0de/sAUViAd1L53PZISWWidUpo4KS6iPw==
X-Received: by 2002:a05:6512:1150:b0:4a2:7f90:79ea with SMTP id m16-20020a056512115000b004a27f9079eamr59083lfg.180.1665065222378;
        Thu, 06 Oct 2022 07:07:02 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:01 -0700 (PDT)
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
Subject: [PATCH 15/34] dt-bindings: pinctrl: qcom,sm8350: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:18 +0200
Message-Id: <20221006140637.246665-16-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8350-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 1c0186050dcc..cae726b5fc79 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -53,6 +53,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -107,16 +108,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-3])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

