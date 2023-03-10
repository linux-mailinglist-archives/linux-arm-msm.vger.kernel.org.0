Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B1A6B5333
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:46:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232131AbjCJVqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjCJVpX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:45:23 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8CF728E
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:44:08 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id cy23so25967589edb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVncxQNg4gxFDgYIBaUsd3uzVPfps5DyaJrzAl5UBAA=;
        b=ncSa4IpmBLB7CP0IXgXqZdSd89q1KMW/Iz2YrLgk/ZIZugabSyh0SCeAoelIf4BCcy
         wew8y/0j0iY8rX6KcIqjUEOtfT2G8IgKy1lPbcPl7EZJAwFKTAay9d6DM5bftdwNV+4G
         QEBCCNRaRpaNDv09XC3gX/t96zJWIgA08Lk1G1D8Mh9YiBmMqzj5azToCXnaH66iyzXQ
         3jyXhBuy5zX+6jBzwsE4GwPJFtH/mygoLD50q0kb/UiqPILDi6Bxa5zwGMXiWKPaZQur
         e7KCkwAl7i62olZVrX4qNRf/a0tLcMrXwbH7wnf/GLHVlMdNvcrLqCrCAYsN1x3mr3dZ
         zp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVncxQNg4gxFDgYIBaUsd3uzVPfps5DyaJrzAl5UBAA=;
        b=cWFhQ8XKK0gEfC0jjVSeq4NMsIWLLV+wcFFjeZ3ADQaUVdBCbERlOgKj5+933Lb0lL
         KjQio0ZFGzcy4bfzWlG7NJHebr5WrGBQPmWz3b7VHay73Bi7GuGzahtDNYUXEF0kTsEu
         DT6ij2p76JG6/T2sQbRnJHy85zDgmITkmlU4YdDYEwfPvPGCVZdt1sYGhuNhMh3M7n+D
         ILm60v/HfXnNi6nYs9JRszOiH9z32kR2W5akLEKPHDN4xKq/uxA4uhauWOSpCS114ELK
         oboKS0KzQbSkCGKpmZI2dVhkRc08W1a7ePDLOTnsemalIvZM3Z5gnmHI3qUVVvEErffG
         Ul/w==
X-Gm-Message-State: AO0yUKU+ne6OTijbarz0w6uhz9ToJ9gDklc6HoJqotJ0QnyCDWdC+B0W
        Huktmgid9K9nUNu7Q2Ovkf08lw==
X-Google-Smtp-Source: AK7set8ZbxJEF5tC478I3Zm/JdDZm7PcmKmY5C2UnCmad6B3N81KaINb+wIFMS2BIhkbDLbGBPiirw==
X-Received: by 2002:a05:6402:31fa:b0:4ac:b308:d732 with SMTP id dy26-20020a05640231fa00b004acb308d732mr24684308edb.18.1678484623164;
        Fri, 10 Mar 2023 13:43:43 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] ASoC: samsung: rt5514-spi: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:43:28 +0100
Message-Id: <20230310214333.274903-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it is not relevant here).

  sound/soc/codecs/rt5514-spi.c:497:34: error: ‘rt5514_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt5514-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 362663abcb89..22c0afa01459 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -504,7 +504,7 @@ static struct spi_driver rt5514_spi_driver = {
 	.driver = {
 		.name = "rt5514",
 		.pm = &rt5514_pm_ops,
-		.of_match_table = of_match_ptr(rt5514_of_match),
+		.of_match_table = rt5514_of_match,
 	},
 	.probe = rt5514_spi_probe,
 };
-- 
2.34.1

