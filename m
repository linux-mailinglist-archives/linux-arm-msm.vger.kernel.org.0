Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB385AF202
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 19:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232757AbiIFRM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 13:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239306AbiIFRMm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 13:12:42 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456511AD85
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 10:02:11 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h1so7211008wmd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cKtafl0UjnCIX3Puy9AAJwH+bYrDR15RnaqOt29dt7k=;
        b=DSQDRNxRDpSC0Y2GH8Yr7Qglq0JVaFmbUxckXOzXqDg1GSVXNvnDnKZIBcEfmz2v4D
         51QsgOKkarGZt2odOQIEJW38dnqxWk4W8lTk4WpfurC1baxWfz56suyQqy5XoBuxATHI
         M68ENoPYJObsFYwRKeKNHIJeKtmnvkqoCOSgks6r1LpZm9i+uzWvQUkn9IsGDWUB6v/Q
         jQ5PIhzfdJ5WG/IQSwHbkMz1yjavPj57XB/TtB4A+OEPZbR38s6/cfRUh+fOV5oXk4Of
         lkqmCMwsDuR67iL+Nvx9f/lJrCy4Iqi7aAhmsY9sYLhI8QdO3TYNoE8SRaJTk7fV4R3u
         uq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cKtafl0UjnCIX3Puy9AAJwH+bYrDR15RnaqOt29dt7k=;
        b=TaXahn/ArENF4wIrrKt+4J0d2ID+apHSwTrdfli+MJ32E6sXqmLUs8w4SWZgAreKFh
         yiMIflUhp5Ab7c0bstiJ79cydvpiJE64VBdEEpbTPVBI7tzpZaO1lFjN8OQ5vIMWJPl3
         tSd5ZinBkH7CvzTU1gJJRx3rGqSc/r0Lw9MV/pV4vt+/u5X4V0y0Gcjdvpy9V9GHfixj
         HIQAfpqGhldTtfUPJeQoF9XbJl9UP2VcyoR1MagLZnX9lvmBPH/uHmB/rzLhUsiu232/
         ISRxZBVwIJWhp5WUam+EXKY+yMz53V6rpRbkykVNuhLof6BoQ8A3E4v8xAHrnaLJ21rN
         R6Rw==
X-Gm-Message-State: ACgBeo0LsihMvuC/aBl1/lM07jAGdA2wXG6UhI7vQm/AUUd/74m3EfRU
        oD0Q0QU94aguptQbz/RE9MqLIQ==
X-Google-Smtp-Source: AA6agR7GvICXzJ7qO2wadJGXTUzi4eSPQqWx0ip8nmGBuJcGV1178cRrIrUJDO6x5Vpu8T8sm2sjZA==
X-Received: by 2002:a05:600c:600c:b0:3a5:abdc:8ce4 with SMTP id az12-20020a05600c600c00b003a5abdc8ce4mr14130312wmb.144.1662483729018;
        Tue, 06 Sep 2022 10:02:09 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003a5ca627333sm21085967wmc.8.2022.09.06.10.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:02:08 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 02/12] ASoC: codecs: rx-macro: handle swr_reset correctly
Date:   Tue,  6 Sep 2022 18:01:02 +0100
Message-Id: <20220906170112.1984-3-srinivas.kandagatla@linaro.org>
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

Reset soundwire block on frame sync generation clock reset.
Without this we are hitting read/write timeouts randomly during
runtime pm. Along with this remove a swr_reset redundant flag.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 3143f9cd7277..338e3f0cad12 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -596,7 +596,6 @@ struct rx_macro {
 	int rx_port_value[RX_MACRO_PORTS_MAX];
 	u16 prim_int_users[INTERP_MAX];
 	int rx_mclk_users;
-	bool reset_swr;
 	int clsh_users;
 	int rx_mclk_cnt;
 	bool is_ear_mode_on;
@@ -3442,18 +3441,15 @@ static int swclk_gate_enable(struct clk_hw *hw)
 	}
 
 	rx_macro_mclk_enable(rx, true);
-	if (rx->reset_swr)
-		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_RX_SWR_RESET_MASK,
-				   CDC_RX_SWR_RESET);
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK,
+			   CDC_RX_SWR_RESET);
 
 	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
 			   CDC_RX_SWR_CLK_EN_MASK, 1);
 
-	if (rx->reset_swr)
-		regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
-				   CDC_RX_SWR_RESET_MASK, 0);
-	rx->reset_swr = false;
+	regmap_update_bits(rx->regmap, CDC_RX_CLK_RST_CTRL_SWR_CONTROL,
+			   CDC_RX_SWR_RESET_MASK, 0);
 
 	return 0;
 }
@@ -3579,7 +3575,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, rx);
 
-	rx->reset_swr = true;
 	rx->dev = dev;
 
 	/* set MCLK and NPL rates */
@@ -3701,7 +3696,6 @@ static int __maybe_unused rx_macro_runtime_resume(struct device *dev)
 	}
 	regcache_cache_only(rx->regmap, false);
 	regcache_sync(rx->regmap);
-	rx->reset_swr = true;
 
 	return 0;
 err_fsgen:
-- 
2.21.0

