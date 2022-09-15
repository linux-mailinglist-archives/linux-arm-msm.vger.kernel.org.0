Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E625C5B9B65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 14:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiIOM41 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 08:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiIOM40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 08:56:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE449C227
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:56:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id h8so23782230wrf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dGW/xqrLlvyfRA2Og6cgZhYC9ChkIds6ZcWKdAIYiaA=;
        b=vkG472mnaa9rO5OnORsSKuzZKJ0n3y0S3uW+2fosrV1bYuVrCN7R2lAqmv4ThZaeLh
         GzQl3HknIRILNHYa2W4TlAX9MrXhpJP+MR5374yjMHCgVbNcAG+AX/79uzDpqY/iiYwD
         yJGxUhZIz/AYetdRnvkk1Y7LChFZvJF/TMc5TT8lqozG5UcUGBxWLylRgXFjy2poMqrd
         FiXyyDF9u/mshGmcXuSmNIWKuZ4xzStLn3XCq6eIk9S2atqvGTXgQKsqWfE+ahYwDFSc
         JsqmKlyecZRfIbBtVxyh5ZO+veiJfNNHxI3mCDD/0kRifcsM/0wRhiAY5H8Yu5Tks2EI
         b62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dGW/xqrLlvyfRA2Og6cgZhYC9ChkIds6ZcWKdAIYiaA=;
        b=3oLzpm69tFuM+HVlEOsSbDjcK5aH+fa2okn0eeyMj0/Z56X4YfKbfkcEG/HmIrUGmo
         MO/OUjMKTOsBtV/Lh176bZAVapru0xHYy8rLrtikHmcn1DRbknw/WJGtopXH7rIMJSSJ
         zqIcAiBBHDdkPRhhxoQ/qP0P74nXqunIaUWJwHtVWOQiUTMgzbSMf+N/3ay4O/LshXoi
         udcww8Dl2In2qrMEraUF+rDw6n0bM4KiAP/3/U6VZbAKrCjbXbryJdzjrWXwz9jfMQ1H
         uKuuAmRIoWwqm7rw0rEWfvcHI5ueJHXTu6gutdv4xKsMIRrCmPiyItqK7fLA8l2+DhlW
         Q87w==
X-Gm-Message-State: ACgBeo1VLlzoxvxrfuHRFo8NcnT3ISYgN6BKoAquBxDKB/WdWi7Yqdf+
        kwvIz4zMjOe53QpGbhRsHVUKiQ==
X-Google-Smtp-Source: AA6agR6CtKCYoQaagDp2fybzX9QOC1iHKi3CcXoXjAMmmG+fxC5phPkk1d2XMnfAzx2/pyFy1nSDgQ==
X-Received: by 2002:a05:6000:1546:b0:22a:b31f:6c8d with SMTP id 6-20020a056000154600b0022ab31f6c8dmr11221979wry.275.1663246583642;
        Thu, 15 Sep 2022 05:56:23 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b003a845621c5bsm2764776wms.34.2022.09.15.05.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:56:22 -0700 (PDT)
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
Subject: [PATCH v4 2/4] ASoC: dt-bindings: qcom,sm8250: add compatibles for sm8450 and sm8250
Date:   Thu, 15 Sep 2022 13:56:09 +0100
Message-Id: <20220915125611.22473-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
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
index a3a4289f713e..58b9c6463364 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
+      - qcom,sm8450-sndcard
+      - qcom,sc8280xp-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

