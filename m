Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4BD5AF21C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbiIFROC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:14:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239560AbiIFRNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:13:07 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503A08E0C5
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:02:48 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t7so11384330wrm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wHzaLeNQVCSBpl0uliw1oI1t3Vv7waInVuSDN9rCrD4=;
        b=k8U1G9bRxyqpso63N2PFNnVmHY6LUWgCTgQrkSyvHLGHl1JmRKJA/N+k+rYUtOB8FA
         4EUUHoJ4qLupudKinKgBMzDjyDPCxT64rOhsoZPhY7HRQYjVX6M5xbYKne7p5bPwzc1a
         eOADvQJ5J4nPk7YuwFbV6BLG61EqZpoxVkkSGlkaQiPcLC6H0s7B6o66qxEjQxGRxVz0
         3KWryMtXUVDYZEv3zeMOMa+2T6mFHg4uWw35hlS1WgTXc2l1PpR7Oi5M3T7GpoTelycg
         xw7onG3TVNnbKLzZYdbgPay5T8/tNwBEouWDB18+RqDAC1b0fU3jJa0zL0rxvEczAfbv
         unMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wHzaLeNQVCSBpl0uliw1oI1t3Vv7waInVuSDN9rCrD4=;
        b=yTvJv6zoGD6889ukW5e5308RViCuKphxL5Lu8Msiy/j5mHsoThyvi5EDu5dSpQF5M1
         4wJ8syrapZFqP6aEHPVfUC568mHd4EjmE5Jp5+GCzT4q+ojaUwm1AfshDGD7pbR8AN2e
         pfLZ4UFKoZmqDDuozQMACTwm+3/wRlb7Oh/9JW9xca+TOx7/Aar6g4xd7pJMnR+54OrU
         LhirOpqUDCOgAzB3pg1wvtJjf3r/9T73wyUNYgIJIrvFhtRP4dnDpPffV0xobJQQ3taJ
         W3u5WDujeWUkuTZ5XSP6H79+oFfUQ91q4Kx3vTlL90m/mYF+wCcAqLQ0KP6eH7WPfdVF
         7HSg==
X-Gm-Message-State: ACgBeo2neQxi9z/gCtIk4/tm6NOI2r2d5CBBpqPLEQ1sfQlfdaR9sk3N
        Z51tdfTn7KWvLo0ID5/HkWeNEg==
X-Google-Smtp-Source: AA6agR4A0j1MQqOx9dgt2eesqRX/FLXrcfb71oW2fg138hd0nsF9LAMVvtyPJ40JMHKVpgs4f4W7xw==
X-Received: by 2002:a5d:6b8a:0:b0:228:d6f5:f83a with SMTP id n10-20020a5d6b8a000000b00228d6f5f83amr2850621wrx.381.1662483737282;
        Tue, 06 Sep 2022 10:02:17 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:02:16 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 10/12] ASoC: codecs: rx-macro: add support for sm8450 and sc8280xp
Date:   Tue,  6 Sep 2022 18:01:10 +0100
Message-Id: <20220906170112.1984-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
References: <20220906170112.1984-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible for sm8450 and sc8280xp.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 338e3f0cad12..a9ef9d5ffcc5 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3654,6 +3654,8 @@ static int rx_macro_remove(struct platform_device *pdev)
 static const struct of_device_id rx_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
 	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
+	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
+	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.21.0

