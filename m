Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58F025BAE0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 15:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbiIPNYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 09:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiIPNYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 09:24:46 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6F624BF8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:44 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id z12so17705956wrp.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+W+mJGcR2EndruN0lglfV6ZFhxv7HYvptaoPjmljPEQ=;
        b=vZoDLfSLqQEgTYVavNcrVAvUnwNBVnu2uL/Hrd6HyBmmXLkf/10NuukyptOlvS5UHo
         z7ST7w7cP6evDi+WKJ9Qmkba+o8nfUVB8mTISbz+Q4v810ZCX2FN+PFPBGA1CAYvGLtH
         YL5WOlhPiKXophIAMEEJQc4QMSTzMlOfUIN1j/LV1dpZS4xkSgnsP7wgQI38ImPFjMk9
         KA/DGy/aSc/tJAThdedMXwJcRFFi5YYOgK1pr7MMOBhjEujqKlT+ELtJHecp0synIZu7
         ECgO4nf+W9Gw1Jui2G2Mq7EU01QGR1il7a8lmYlVuOcqdLKX81aA7n0Gf3yrt94bDrHy
         PcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+W+mJGcR2EndruN0lglfV6ZFhxv7HYvptaoPjmljPEQ=;
        b=UlECXmCX4FFMH7lFw9ItZc+B1O4AV/Q6FOGzI3LCGtvVmSHSIzS9n74WWohDifpYoT
         7N5h9MWG/YZIFR9JLPykSyrW9umkudI2gzyMXlUfeixCGt9NWbjRm9DvBrAjN8N+dKbC
         BOYLrUdkH2W0l8y4hKJFUqNY//2iABcBMmCvnIbWKnYDiD+eNertu/q0bieMm0jnob/j
         h/6wHBI4kB3ZU2n4bzH2YfSInB+HhtZX63x89AI6Kdg0XyvFe/JpqxMHvI+A8R3obKw7
         6fRchmfXw8v/1vrknZrn8qV8CSxFNyxpKlwzr29OCB2Yp14YumfJVnDqRTb/xE8hE16z
         0IlQ==
X-Gm-Message-State: ACrzQf0oEngB9Wc57v5m5Reqk4TASvQiCLNIjBoDQbiXgDgzZJGpSKOy
        ybg9n1jy+OOuPBun10hV7xqDxw==
X-Google-Smtp-Source: AMsMyM65rHm2cl2xkabgfqjleJ+Ut49AmRpBnqIa4zx8l1mPDXedZJjTcAdd/NSjcB4nW9/5wDCY2A==
X-Received: by 2002:a05:6000:1363:b0:228:d605:f9dc with SMTP id q3-20020a056000136300b00228d605f9dcmr2703108wrz.109.1663334681983;
        Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/5] ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
Date:   Fri, 16 Sep 2022 14:24:25 +0100
Message-Id: <20220916132427.1845-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
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

Add compatibles for sm8450 and sm8250xp based soundcards.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bab1a6f1890f..70080d04ddc9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,8 +21,10 @@ properties:
       - qcom,db845c-sndcard
       - qcom,msm8916-qdsp6-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sc8280xp-sndcard
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
+      - qcom,sm8450-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

