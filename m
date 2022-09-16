Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B145BAE08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 15:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiIPNYr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 09:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbiIPNYn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 09:24:43 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E5A1D316
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h8so29062090wrf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 06:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
        b=jYtg6/mJRPsHpWerRPXAXDrZns01WqbBzMrstF5f9SmWFzNRjtwf7mPRxTboENGqgs
         Mk2qfOGO0vHw42sq4hlfIyt00rHusd6vCrG1r4cr+IvF9LjEKr/SpBCr6EYdSW1LWG40
         FxFqFDLXgPZYy9v4gOxgPY90tDRUYZdnolHS1Bjq8qcZpyH6izPWhiSy3u0Fi/PbCNpX
         vGx8C413GepqlLZs2oeyM7Z8GqhuaWuBjjzG3NjHm1xM5ppSlRmEhkNJq4zKRQuQeEBu
         kuV64FdhtnnGp9kgZNea11FiL1CAhdQ/xbMHcZqRfw2gyX7jl7g9ozXFZsQnxgr3CK1F
         6o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lGIzKCCzT9Z91pOhcVsZGKjotZcXBUNtgUUXIg8kGbo=;
        b=jzhIznbhyWLAESHkPOT3JRDvK5suPS9t018qUVxS5chI7uo4WeY/B56JJsAG4qA59f
         AgOZi8vhJJ6KOD/DR0P77Q+UgMqsfKp/ALbSgf5OnqUPuLZQ4r/YVMCAcry36+kQx3x7
         +uwQXhUicueH3dRrP5x2CyMdYiUMm8huCyTMCNukzK5Oih2C702/nvLVRs1q5d2Axj+4
         +kx1Xf9B577WiSSK51+yr0s4zT4HzFzxZeBBOG0IV1QjBLcN98LtTf837BThSU3c03m0
         pLvX18EaL7fJioMlVYu0mL1/P1nhlVV7e9/4N9/AYjFvsf3sLZvm4G+qN7nGcPzaOa3T
         uHEQ==
X-Gm-Message-State: ACrzQf3AwJMqJLgIbjdVU5q9Ij6Rb3iTfRbwUiItfFudstEk8/in12p0
        p957YtJ4x0Zv38CUClqW4pyzyw==
X-Google-Smtp-Source: AMsMyM7o0ljWelmEHySCByBq5ilh+1KD65ObHLXkmzd1QE1nONf5ejt92ifAmjxnVdcfkt1jcsA6/A==
X-Received: by 2002:adf:d1e4:0:b0:22a:34a4:79ab with SMTP id g4-20020adfd1e4000000b0022a34a479abmr2756020wrd.188.1663334679968;
        Fri, 16 Sep 2022 06:24:39 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 06:24:39 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] ASoC: qcom: common: use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
Date:   Fri, 16 Sep 2022 14:24:23 +0100
Message-Id: <20220916132427.1845-2-srinivas.kandagatla@linaro.org>
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

qcom_snd_parse_of depends on ASoC EXPORT_SYMBOL_GPL functions,
so make qcom_snd_parse_of and EXPORT_SYMBOL_GPL.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c407684ce1a2..e53ad84f8ff5 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -175,6 +175,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	of_node_put(np);
 	return ret;
 }
-EXPORT_SYMBOL(qcom_snd_parse_of);
+EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
 MODULE_LICENSE("GPL v2");
-- 
2.21.0

