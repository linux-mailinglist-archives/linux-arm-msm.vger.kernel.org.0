Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98CB25FB929
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiJKR0O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiJKR0L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:26:11 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42B42B639
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:08 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id df9so9366382qvb.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfmyl8XwBH4dwm3AIO13EpUCEkfSWVSd19L/hzPS8yg=;
        b=mTDzSp21AC53Ncv7CwK2jnNtKlY2VMMi1CoHHZKmar1TOKG5BADncO8tTbxokD0452
         /mdsILCCfZtrAypSofgulX+zklzw8iHN0M27j8BD6zUhwLnphuA5W3Ko00FVrD8KLCLD
         ENd8DnqrjUvAf3m92h+5P8GyNcD5ZcwNSQaWjFfCx6yh2e0Fo1LZlNqqQCmQULneujDR
         Tub4zxM6tVnd/aTTHyOV2kuNw55pWrbTT1pz0tnH/deMhtIHHDwvq346kqV7YoZyUJp7
         UgCsi4BU9obeniBRQyUM1CkuGb0Bum656rx7L/+DeHmKFn+i1/Evt3RvFBBmygrb6mkL
         M4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mfmyl8XwBH4dwm3AIO13EpUCEkfSWVSd19L/hzPS8yg=;
        b=AGjudC8VFIouK4/rqyIyzZas0cNbPfQAB+wy7y0rI1uB3VX9Go29uq/IY/rU670Nf+
         xHx6hidRN/WYmUyAEUM9kMR/roY4X0gvuo/vg6cizbafqiUohur4o24/VGv8ZSMFir2g
         1hhOmOHA46AyVR8ARr4/pX2LB2lZ9deWUZv09kFObkXbm0w7ujzpBlf1aLhr1IGkO8jU
         BwVlgm93pGntSVkaluidb0A7K6N2Ii9hQ49y8aDpFeyulYacJNuL9rjn7RE5wp3Ak+t4
         eo27Yur1uoQwPaA0vliMOS7/3ZjnsU8YjfAk0LRo7GogoV/MQPSdNJS3CDmYDA7dtAF0
         fSag==
X-Gm-Message-State: ACrzQf3L2097n0PflS2DZiQQj0I4og4HJn/qYmpmShSnj8FHOoxAfqCF
        d6fWPuAU69oZpvxSM6J+DnFJuQ==
X-Google-Smtp-Source: AMsMyM4OOgycfTinnkZCe4yzH3O9R5+Ywh/D3IQvcsIaVXvx1j105//vp8iPmGqx+HrSnIrMKZURFg==
X-Received: by 2002:a05:6214:20e3:b0:4b1:d5d5:8e85 with SMTP id 3-20020a05621420e300b004b1d5d58e85mr20930213qvk.69.1665509167986;
        Tue, 11 Oct 2022 10:26:07 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:07 -0700 (PDT)
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
Subject: [PATCH v2 02/34] dt-bindings: pinctrl: qcom,sc7280: drop checks used in common TLMM
Date:   Tue, 11 Oct 2022 13:23:26 -0400
Message-Id: <20221011172358.69043-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 2a6b5a719d18..bdb896e5682f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -62,6 +62,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -127,16 +128,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: /schemas/pinctrl/pincfg-node.yaml
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-6][0-9]|17[0-4])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 allOf:
-- 
2.34.1

