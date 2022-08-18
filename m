Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2092B598495
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 15:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245190AbiHRNqw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 09:46:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245181AbiHRNqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 09:46:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4E4B56DB
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 06:46:49 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id r16so1801270wrm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pm1xUFE92YkVKDTJvx9M7ZRTfenlhIEpPrzTXw0dBmU=;
        b=FRPtHFtEQMFDYkm9zWB+sRZd4LDzYcg9DTqbKkGNU0b4auFyL0kIkekOHeFJJun8sF
         RFhcYKOoH8gJv+QYGWJftcKr1q4UdWYZz9Nldm6E3/diLsDc08FI53gZkmuJPvHYz9/Y
         K5bktp6W3JdaEua4zRBff7rPdsvNftE7SZKhE94oEXcU9s2H9fGmq3qG60XPXrf6YZC7
         JoRwt1jN7mgv4J5P1etit3Ako+lHsXJBfp9ePuehwam0+CpBpJJ9FTLbjszdVIu/cEY0
         xVPfusFo079QyvKAOSQDi5vpEqj1Nw7p+gx9I/oSPPaSK6zRPMDF+Zq2WzK0G5UBLCOj
         0zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pm1xUFE92YkVKDTJvx9M7ZRTfenlhIEpPrzTXw0dBmU=;
        b=2qV4V3RnjyzQU+1Zdsgx1+quo5CCi3WUwRwb+JacCQT0Cu3Aa9XG1lKXg/F7xxJZSn
         fDa+FCvzpTJm1exT3EE2S3STP+8GpTCxZ3t3dAalak2nZg8o3e2mG1gwGKavqdB3RnO2
         IQz0ynIz+wPcH0PPZGZuM/zro9CdWJVSqTmuDwC+6DVNCdfD/AEij9FNhtLej5QIFKQn
         yQXCFKNK1S5zLFv/TuRCFAbg+wZjPEnYaG0frnURs2SEJCAlBxWHQepAHOOHnBfRntzi
         hbm0JrIh3G/+OO/wD2q7VFHF45mN8ykmnisrnuSNH0rZp4Vpg+Wdz/yWaLAswAMOV5/C
         tZPA==
X-Gm-Message-State: ACgBeo14WictXfPviD9OfFMqWiJWdpisFNWWJv2eq+DZD9VrZDFvZm18
        sYUkBjxyNGHsXleNV45rgAqsRA==
X-Google-Smtp-Source: AA6agR7FKPqQnWzhAQx/K94hRrogeUHNRn696ul+WTtCZ12rYD4X5lPuuDq6bj4Kl+K6uGsGVef2uw==
X-Received: by 2002:a5d:6789:0:b0:225:2787:d44f with SMTP id v9-20020a5d6789000000b002252787d44fmr1606748wru.343.1660830408315;
        Thu, 18 Aug 2022 06:46:48 -0700 (PDT)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id v5-20020a5d6785000000b0021e47fb24a2sm1454549wru.19.2022.08.18.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:46:47 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     broonie@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        perex@perex.cz, tiwai@suse.com,
        pierre-louis.bossart@linux.intel.com,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 4/6] ASoC: codecs: rx-macro: add support for sm8450 and sc8280xp
Date:   Thu, 18 Aug 2022 14:46:17 +0100
Message-Id: <20220818134619.3432-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index 3143f9cd7277..fa8a174ba7c0 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3659,6 +3659,8 @@ static int rx_macro_remove(struct platform_device *pdev)
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

