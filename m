Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455517E2B94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 19:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjKFSEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 13:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjKFSEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 13:04:31 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08051D49
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 10:04:28 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso741654666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 10:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699293866; x=1699898666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFwbWDLUdsWWY4JdKUSpXKXnctZdyDOvhR+9uQhZNK4=;
        b=EhZXzxcjrT/aal9pth6IIgfH2GPtxiOQ0Nwgity4E3xbsejEOn5uk7egPocA6wNc07
         NS5wZSrexeqLtmuRdnmPcBvznhMuL75uc0guj9owda8S9v9N0mF1HmbhtRXrLmkXWLri
         LgMvjaQ8slrxl+eQL/m2/yf0nBG2AAavZ5Uc6M3pks0ciiWqqRS3U8asQgIOMFXcdfp2
         HYV8QifsShkiuYiPui/Y/3yfDYEqZw6ZvhW90t54nDqVdubmnrrLQsb1EK7Rhk34jCMh
         rvAFeu3qwXT3ESm9MS6YM5ZoznTDitnUUtDrF/rg7XGigignsr5g6tZRWRsUc44yCFl7
         ogFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699293866; x=1699898666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFwbWDLUdsWWY4JdKUSpXKXnctZdyDOvhR+9uQhZNK4=;
        b=cXySYo5KtSTC+0t3brIPNFY6qq+8bm3VJtvpKqSS3wPhrwRviCdS/FsO3tkAi6nhgd
         xBisG4RQHEj0yA0HD1NyE93m2y1JCTdG1032eYJFp4h+IY2wu1yDHtESWcbUz+m7hMQt
         w9GGWOs2c/W8Gch3YkQX7dR++doRxxb80wf8MuYwGve6mK8sR5/53t5GTZS3R9DaEOT3
         fjgmEo6blusbgpsGuNOtXG+fwjVbVbHJkQg0ABzQBDLk6Ad9A51arQvSMuzaV0nQPwf9
         RnvU5I3U0ZE4KPWIcYhMmgeNKwk0Dz0s2iqUzY6/P4uv8daA9/KpkE4FamREy92O4xkv
         1n2Q==
X-Gm-Message-State: AOJu0Yz2YIC4Maa1laJKCE9CCGbT6+AI/OgaTEozG1rknhhI72o0CgNA
        8Km+SHS97byCo41lhXqXnogeTMpY8aAHW2p+mRw=
X-Google-Smtp-Source: AGHT+IHr8bnuWZj/iOFtunRgfK7Wwa+dsby/zXewBm5diZrFmq94VJef1rIQkqwg9lkIuEsT0/wTeg==
X-Received: by 2002:a17:907:7e84:b0:9dd:cc3d:7ba7 with SMTP id qb4-20020a1709077e8400b009ddcc3d7ba7mr6962413ejc.29.1699293866528;
        Mon, 06 Nov 2023 10:04:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090617cb00b009920e9a3a73sm92962eje.115.2023.11.06.10.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 10:04:25 -0800 (PST)
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
        Conor Dooley <conor+dt@kernel.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Date:   Mon,  6 Nov 2023 19:04:22 +0100
Message-Id: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add sound card for SM8550, which as of now looks fully compatible with
SM8450.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 262de7a60a73..88904ac4aa77 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -21,6 +21,10 @@ properties:
               - lenovo,yoga-c630-sndcard
               - qcom,db845c-sndcard
           - const: qcom,sdm845-sndcard
+      - items:
+          - enum:
+              - qcom,sm8550-sndcard
+          - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard
           - qcom,msm8916-qdsp6-sndcard
-- 
2.34.1

