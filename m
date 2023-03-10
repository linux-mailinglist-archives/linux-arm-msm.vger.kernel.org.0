Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF6D26B533C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbjCJVqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbjCJVqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:46:04 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C77146261
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:44:20 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id g3so26155548eda.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678484630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJnD+TmpIWsb3dNvXDWriziAnT09R0JSbZSoSxYB3I=;
        b=CCPhzuWmaV2C8C7W8SIAp77g9fF1tNRToI2X4v5sruLui5QAT3eplPYntV1A5g5snH
         Ab+hIss+rE1Eib9wUxIspkPWeUgftjiqbcxXcQ9v+tT8liWdlpu00X7AXKAfgu1X84cT
         3Kd3ZM+oC3Jyi84nGCCG+8BKzGFAgavCqjo25PCfWAMiIp/4wFDPaqyfxBx4tv8QPooK
         Sm6J+U3OF0h1ela/q1CIoL+sOXB4lm5zaDO4oChwR5m6bMXq/vnRg2X+BwjEF2VbW8Xk
         QG+s3T06qdk54u8bw/YX3am49jq1HDDkuKa8R4n6+LCJUScGQzKIRXg6SwWJhEKwrhoa
         cAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678484630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHJnD+TmpIWsb3dNvXDWriziAnT09R0JSbZSoSxYB3I=;
        b=VtAhGeoJnwy56anO2jJE7+O66ZeF36KS5iBtTqZowequLxiYs94izunc7kYg86VALf
         ePAiyGN2vDFinU6Qo0hcMlR5CYfmf1r8BpngsGiDX2TR4KEGqF6Lh6RDlLaNzMw6Pn/d
         tl71SWUFKevF2vAAEYa0Ku5eUNYSofJv2uXhHUsNGJyUZ22IhtLVSK6l8aQjGdvaF49i
         abDiDKaUEXWjnSqn8kR39Epb0qrVGHHYnlkEGbSNs/qfIuplb1j8QErw3bHg8JdP0WC7
         9kmP2lzOoItspBvbj1NC9Z3FtG6xKgEiA2en9ifz/CMfMHk26fTjHfNnCXXieodY2oJ+
         XRow==
X-Gm-Message-State: AO0yUKVT8RhpIG7nQIqxd5ILdIAwst3ppmO/PjUnOXUHCT1JLvSn0npl
        kz0tz0bvFrMj3gvD2r+vr4RZKg==
X-Google-Smtp-Source: AK7set8CrVSqb0nImE54sT1v/yDICbplJWTA1hCEEjQ0wOFQkMFxqNNonQJZvgygm+HU//tgaKmXGg==
X-Received: by 2002:a17:907:1909:b0:8b1:304b:8e2c with SMTP id ll9-20020a170907190900b008b1304b8e2cmr27647387ejc.0.1678484630055;
        Fri, 10 Mar 2023 13:43:50 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id f2-20020a1709064dc200b008dcf89a72d7sm327228ejw.147.2023.03.10.13.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:43:49 -0800 (PST)
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
Subject: [PATCH 8/9] ASoC: codecs: src4xxx-i2c: Mark OF related data as maybe unused
Date:   Fri, 10 Mar 2023 22:43:32 +0100
Message-Id: <20230310214333.274903-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/codecs/src4xxx-i2c.c:27:34: error: ‘src4xxx_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/src4xxx-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
index 27026030704a..a40fd20df984 100644
--- a/sound/soc/codecs/src4xxx-i2c.c
+++ b/sound/soc/codecs/src4xxx-i2c.c
@@ -24,7 +24,7 @@ static const struct i2c_device_id src4xxx_i2c_ids[] = {
 };
 MODULE_DEVICE_TABLE(i2c, src4xxx_i2c_ids);
 
-static const struct of_device_id src4xxx_of_match[] = {
+static const struct of_device_id src4xxx_of_match[] __maybe_unused = {
 	{ .compatible = "ti,src4392", },
 	{ }
 };
-- 
2.34.1

