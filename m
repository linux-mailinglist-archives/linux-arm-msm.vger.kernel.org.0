Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0951768C0E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 16:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbjBFPFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 10:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbjBFPFk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 10:05:40 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A4013522
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 07:05:39 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a2so10386950wrd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 07:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amhvuQJiOyM43SbMnQxHq99ru2XL4cfNPHdX1Hxtb1E=;
        b=wyheIegPWInE+xuWRmetJaDQ6503y6u+ZY4Z/UZOQjNiKTXIDL9x4feew6EE7T8u97
         ZzuCwIHrchMRL8gxV+f9j9YMxTO2FGa+vCzRrj5o5rSKyH2DGEiZ5gTFY8ysGLPw+7QD
         5JkqDA+GzCE5VrVW3k3d2VoLwqjNaRiJiaiU0G0xbh53O4hoLaSVcMy11OooGTv5ftIb
         jnUFO7yWjmptevIW67Fwx0V/tzyylKvZSsFvjU5KH9UCGMqi81UaotxPDh6o8+7CzSmx
         Oqv+TC5CYH9Ocaiz9pl0mX6/S0uycTWNiJpdfFKChHlE7/JX5UU2cBCua/Oisf8JN3SF
         YWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amhvuQJiOyM43SbMnQxHq99ru2XL4cfNPHdX1Hxtb1E=;
        b=RzDttK+tPIaud0/lREKXBKdSbYArPN21pruiClOxTQy8lEsrdVPf5fmRGLl6/Fc+eU
         k2rWtK2P+ytty4d5X03NeRnA1U1FgqCJv1VjK359ZLqiVlbfwtFj3Nf3FyXYDoOZfkU5
         0GcYI9wuxmUu5o6xSo8JUwbMahvc+xKMq71LXwGcs1qspEZQrCY0bN+5bTcGz20T78MX
         LLz6Qmhbr+esgVOgQVhl8k080gV1Pw6ASaj0POSl4Cvcomhh1LqPoKBO83acLgHLbnaI
         GEImMd4as/54Q8xhC07qJMe70HRskvOitD55SK5z6TY0K0Hog4A1Fv/aLHxnu+oJrBfY
         sE5A==
X-Gm-Message-State: AO0yUKVQbpAPBQ6x+Yo4l0GCHtP0EtLcMZqvuNdIJ39sVyO/aQYgx15x
        MmiiT9cKB1ufFkrNtGTaipYT6w==
X-Google-Smtp-Source: AK7set87ORlIh4onmuZwhL5ZeCR/96bwUDAU2cystvVCwMKhtFZxhlwVf6cQZ1UtL61nGykNveZhfg==
X-Received: by 2002:adf:e192:0:b0:2bd:fd81:b503 with SMTP id az18-20020adfe192000000b002bdfd81b503mr18911355wrb.1.1675695937848;
        Mon, 06 Feb 2023 07:05:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b002bfb8f829eesm9543492wry.71.2023.02.06.07.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:05:37 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,q6apm-dai: adjust iommus for SM8550 ADSP
Date:   Mon,  6 Feb 2023 16:05:32 +0100
Message-Id: <20230206150532.513468-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

It seems that SM8550 ADSP remote processor uses two IOMMUs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index a53c9ef938fa..cdbb4096fa44 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,q6apm-dais
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
 required:
   - compatible
-- 
2.34.1

