Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C037E76A113
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 21:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjGaTVv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 15:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbjGaTVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 15:21:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89701E7A
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 12:21:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so3107693e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690831298; x=1691436098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgiy1L5xFFXzTL6vBU06WTwPPyk+2wiDw9CMMBxoAqU=;
        b=BDN5aHHLy5f+8ZqWeFKahTozUsHMkbDIzeox+LKbsAUEdlRMAhTtlSid6HPBqTS3ah
         YWA1H1rvCd9Yxtropqa6pGlppKi3xPL1VbOgHBS4HhCL8g8G4ZwZC7l7O24bMXw2RgMM
         mwa+2Zm2xp3lsmT7U83U7TcLw+nDkXUxHWu68f1+nQ1TgGTLzC4DFAt2IxCyuuv3mk1N
         TTqIjU7Yu7NmCB3cLIxGp4HhC57kbNgdhaoc2LFbABvxNK0CQAPFhj27EJm9RRoDUGLl
         0HkHLuwRBrHwYkWhT/E7yA1sgyOPTPWY/WpGow9lVtYitKsoyC95OC9E5NMcumP/4JfY
         Y+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831298; x=1691436098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgiy1L5xFFXzTL6vBU06WTwPPyk+2wiDw9CMMBxoAqU=;
        b=acpa3XULHWLbcpI9YxSZVywdt7Dk/xXwvXcSB7Ya7vzbBDiEymJfrmPTIsiM6qJxV4
         IUSnA4WjgHafZxrjnSZ7DE/f31AzWwvqP8YP/wxKo3GAlpramzv9huGwud42I1Mdwxto
         xeNeGL0l3IhINVp/1d9XTGW8ckysWEh2t+EBQUVvrYshZAGt54NHlY2QBNTM2tV7VIOd
         ZsseXFXiGWm/mRojc0PLaaQByeskvMsoU//7iDX6LtTX/0NV82h2xCMd3eXGZj8qtkFP
         Hb5SehOAKx806dJLtWtHq7GiNZkyz5N2LrVIbHWLlLLwD3X5BhPfzqmcFUt3UWHZhZS/
         TL/Q==
X-Gm-Message-State: ABy/qLaatVZc2QboS3MqLlTrk5rrweDHYMwnCICxfCqA603B84UZvlW1
        5RPmQn4hVw8+MZen6stJSLiJzaIV8RPrkiVqbOf3FA==
X-Google-Smtp-Source: APBJJlFpN3Bb8twZNdS+ZKYDc6oIsWZ5yeH4TbKtJjzw2AzrHWElVbmYnMr0mMKxrFe8Bm/BJVXAbQ==
X-Received: by 2002:a05:6512:5cd:b0:4fb:9a1e:125c with SMTP id o13-20020a05651205cd00b004fb9a1e125cmr439606lfo.45.1690831297882;
        Mon, 31 Jul 2023 12:21:37 -0700 (PDT)
Received: from [192.168.1.101] (abyk53.neoplus.adsl.tpnet.pl. [83.9.30.53])
        by smtp.gmail.com with ESMTPSA id ep28-20020a056512485c00b004fe1bac4080sm2024882lfb.222.2023.07.31.12.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 12:21:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 31 Jul 2023 21:21:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,sm8350-videocc: Add
 SC8280XP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230703-topic-8280_videocc-v2-1-c88269806269@linaro.org>
References: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
In-Reply-To: <20230703-topic-8280_videocc-v2-0-c88269806269@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690831295; l=908;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=09vaheOwPFgSKvoFFPC1+TxzhpnRaLHei7up05bRFww=;
 b=eWW9amWrxG5uiuQwj6XKg0uo9aY6AR9mGVP8x/iG039uc295/S37S4cgVj1KL+C4d8j5Brp+s
 lnKXQA4nY58CcHkmht1o3PFfQN9ew+5aVVk6FoC6zVfQz7iqv4hjrdI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SC8280XP reuses the SM8350 video clock controller block, changing just a
couple tunables. Docuemnt it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
index 23505c8c3dbd..2114664978e1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8350-videocc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,sm8350-videocc
+    enum:
+      - qcom,sc8280xp-videocc
+      - qcom,sm8350-videocc
 
   clocks:
     items:

-- 
2.41.0

