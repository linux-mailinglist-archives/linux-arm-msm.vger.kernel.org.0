Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94790671A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 12:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjARLJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 06:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230219AbjARLIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 06:08:51 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FB79574E
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:15:48 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so1111927wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRyEhmF53trv7Kk3HZnJmBth9b2MnpqhZNNSw33IxZw=;
        b=CkGxztPeZ7+mrbeo75roxxrAxtbRiGO8zsjGejstIdNbfXXCpaBjyxTkK5DK9E8H5/
         BUEVRHfzeCL/5tO7UxBFB/KGhctINV/Xh6/XhjtAlwxtOYGrn3dl34d9xRCXnlO0NlS6
         8iAFY8ZOSuPH76eYZvHs7l1bMEvruVSGnnDifZTtxdqiIKsYxJW6ZS+jLk2sIXkK2xFM
         rHtPYM9xyapRgWGE1yJAcv1pUGzN+XA8aIa8RbeQYbZmF3C/EyAM2K0sHHKzDPqj/JLf
         vcPPGSXJ1yGCyw+lURMfGO86QP11JohiF67mED9Hnf9fFFXFyQt4g/P+tQ1Q4XrzADZc
         Smbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRyEhmF53trv7Kk3HZnJmBth9b2MnpqhZNNSw33IxZw=;
        b=gGB8zYp/PxKBR0VFkHLubf0PX3iakR7HB5bQGvVcy35Q3D353Aw1FqqYQ6xH5hQqsm
         RgqmmEUg/dYirGzmjoeySJO1Vwkxs9Omyd9fYvCTNHtQ3iaPi1JAPt0pdmv7Ujpdkrv5
         X6FxMi+qwkv9mQA6YVXXG7Elc0POb8BurxGD4jezWf+DAFStUV7f75pQ8pkd0cgM/Y8Z
         X+HAGI99aayRhLaVLH2GFYcdQmmeE/YqPi2wsiJbZT+J7jUPnbkBnEBdsKhaOr8Zs7JY
         dU2s9kwqrRGHZQk24YqHUdpvejn5zvIySeG7BdwqpEAJLTcmQJhANvh8Nrj4u4FzTf2C
         FaQg==
X-Gm-Message-State: AFqh2kooGy4HVXBstkfx36+o0n3CVrCQ4mn2SBA8lZhUeEFa89mm6NmJ
        K+DSqtUDfUjPzXPzSIgNjfTuCg==
X-Google-Smtp-Source: AMrXdXvXVA0eU58uzXSl/J827hOxqwwfBk3z8B/SPSmD0BQLzQD6uFwmFm3SePbidZ1gnz4zDG7pPw==
X-Received: by 2002:a1c:7417:0:b0:3da:fcd:7dfe with SMTP id p23-20020a1c7417000000b003da0fcd7dfemr14856239wmc.10.1674036947004;
        Wed, 18 Jan 2023 02:15:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003db00747fdesm1529838wmo.15.2023.01.18.02.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 02:15:46 -0800 (PST)
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
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: use fallback for SDM845 sound cards
Date:   Wed, 18 Jan 2023 11:15:41 +0100
Message-Id: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

All SDM845 sound cards are compatible with each other, so use one
generic fallback compatible for them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,sm8250.yaml           | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 70080d04ddc9..262de7a60a73 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -15,16 +15,20 @@ description:
 
 properties:
   compatible:
-    enum:
-      - lenovo,yoga-c630-sndcard
-      - qcom,apq8016-sbc-sndcard
-      - qcom,db845c-sndcard
-      - qcom,msm8916-qdsp6-sndcard
-      - qcom,qrb5165-rb5-sndcard
-      - qcom,sc8280xp-sndcard
-      - qcom,sdm845-sndcard
-      - qcom,sm8250-sndcard
-      - qcom,sm8450-sndcard
+    oneOf:
+      - items:
+          - enum:
+              - lenovo,yoga-c630-sndcard
+              - qcom,db845c-sndcard
+          - const: qcom,sdm845-sndcard
+      - enum:
+          - qcom,apq8016-sbc-sndcard
+          - qcom,msm8916-qdsp6-sndcard
+          - qcom,qrb5165-rb5-sndcard
+          - qcom,sc8280xp-sndcard
+          - qcom,sdm845-sndcard
+          - qcom,sm8250-sndcard
+          - qcom,sm8450-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.34.1

