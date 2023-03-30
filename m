Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF60D6CFC7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 09:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbjC3HOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 03:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjC3HO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 03:14:27 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBEB6E8C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:14:02 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id g17so23311407lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 00:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680160440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=loyEBhBPXJSd2oDq+EoAXwWIzrLOsQjO8pe3fhmwgiY=;
        b=U3YRPvTpjRpsvPS7VgrRRocB1If0hzy/qEXZOGuz1Qk8AwHtevj58Q3gIp31dIn4Cm
         /Wg7apuNcR/ZghtFLX1rbKEFCVSidlxmh9bmR7bk6hXRRF8Q8KFdWIKUVI7uaLLjh5cq
         6v5zbzkeKiAJrhMCEMswb4zNv/4qbIGsDYKAYtcTs8XpbYCMn8cCJVpTfnbOn9Rhf04s
         ON57Tu+OVdS3FOyKFoQQiq/UOpWvsz8SYPDcCZDxzR17NWozVIgzFOyxEEIEeimhR1Aq
         QWMIlonPYn5CtZFnXCt9a9n2Pg88JZgbNsTQZIZ12cyg0WKn69SPD0IWiRXrbCwYdw5g
         SyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680160440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loyEBhBPXJSd2oDq+EoAXwWIzrLOsQjO8pe3fhmwgiY=;
        b=zDVQOCWcqcxSRHXNDYnUU6HTgVWAlzwf5ifo8O9MiwUFIa5u3ys5ksd7/nXu3s4lZ5
         2owbVrQ+HmcK/0AqBoU6fcuvp7sT1xTY0J+jDGVOxW3+MNn1YMCXkbusLOTDwcuh1jtS
         4GUIdOk83yUMYhC7h6oItGHm/ixZ7NQKaLMkKCSJX7NAO4WY+BGlf9/qLCA5FvOFqYd+
         lPhUbra2+VylYR4pAdcPEdiDfKicCDsCz5FhjBGGOwSAOj9qIzOZ4wUdBjmek2flChFm
         DcQ4KRh+7xsHgoi0oBUZkqprttTol3fNOF1ex6Q6f2ac5wFva7XNA0dDk02d3uq651+j
         h04g==
X-Gm-Message-State: AAQBX9ck2XSz43jxDYYQkkpj26prdZ7KM0Bu8mgqc5H+a7nGtp1d8AD6
        tKzQMQe1myawg9eIkopmUInbxQ==
X-Google-Smtp-Source: AKy350b3y9O6CwWcsVsGYE/JWxP5ddszJslLziesflMMk+TImPwhlH4vJ9XHMRo03nUhcvsYp7n7qQ==
X-Received: by 2002:ac2:5547:0:b0:4db:1bab:98a4 with SMTP id l7-20020ac25547000000b004db1bab98a4mr5013932lfk.32.1680160440483;
        Thu, 30 Mar 2023 00:14:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512219000b004d85895d7e0sm3949103lft.147.2023.03.30.00.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 00:14:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH] ASoC: dt-bindings: qcom,lpass-rx-macro: correct minItems for clocks
Date:   Thu, 30 Mar 2023 09:13:33 +0200
Message-Id: <20230330071333.24308-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RX macro codec comes on some platforms in two variants - ADSP
and ADSP bypassed - thus the clock-names varies from 3 to 5.  The clocks
must vary as well:

  sc7280-idp.dtb: codec@3200000: clocks: [[202, 8], [202, 7], [203]] is too short

Fixes: 852fda58d99a ("ASoC: qcom: dt-bindings: Update bindings for clocks in lpass digital codes")
Cc: <stable@vger.kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index f8972769cc6a..ec4b0ac8ad68 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -28,6 +28,7 @@ properties:
     const: 0
 
   clocks:
+    minItems: 3
     maxItems: 5
 
   clock-names:
-- 
2.34.1

