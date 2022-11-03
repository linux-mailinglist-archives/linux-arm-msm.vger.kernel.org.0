Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10975618906
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 20:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiKCTyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Nov 2022 15:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiKCTxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Nov 2022 15:53:47 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABA01EC69
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Nov 2022 12:53:46 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id e15so1877151qvo.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Nov 2022 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
        b=hyOVUenakbhimpBLe4rmEpbp4laB8yVoIzkgZ0Go7fnS1YY/EUj0RndvLYOdyp21hc
         AoSMLyQHYqqCqG+g0NgFxbVStOY5sxLOPrMSu2sDNW/L7jxNT0v/h30XE7o4eRGb1CM2
         p+hwpbfgLIGIUM2Y5kzXfZ/EdzsDrryoP3pEnxfiAbpRz94QjhY0QKcuVd683sqJuadN
         I2HlhLzw7b8Z0E9GGv1l6RFEZh6CKrMUl+StnZ31qbx6tFuKsMqbELu2vse2lUiAZ0hY
         nfzdkoGWpo8F2RurQkdkczNaar0/e92wH0V8NdUypy9ULrgRpuMicbvRkjwvjq7CApAM
         U4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qi/QHriO9WLQrr+WCirZAkAs6AyTOYgHq/qkN2NOeAY=;
        b=FKt3TCqhl2M5sz+vt09Ohbr/FjIjSNT4vm/CO1Q7ERKbVf5nCksFxaPhWo3fPYMV4I
         g76aB7xsD4tm5aMEd7xmWNGSZzl7HdXu20hvlo7BUj+yUqKNhO+qhJ1XX9jGKm9/VYy5
         0ngALDFtz0WfSIjBVaz0/IO5LHbdWEyw8LRSlF6xDf3M8jEsRRgaIvWBa2KlVAk5YBn0
         6dYhX2fVFaSS1i/DvzaSwM3E4DRr0PNsbvJ7p35JLo0wZqVAFavLanmt13yCjHg5V6HZ
         Ml3PjA9EZ3kEwua3qEo5zHBRmaomc/GU9hcxKL9p0Q7lH79HwBe9pXjgD314Qqs2DRHj
         s3bg==
X-Gm-Message-State: ACrzQf1WWXxBbU0pyLogJAptGcMqGsvpGqk94A7gD1Tp6J95VRUra/RX
        6tq1TwY9du3l2x4keLv4zMCitg==
X-Google-Smtp-Source: AMsMyM67CGOGnsKJJ2m829zic/y/kudxtYEKdM/yBMe08cw4Li7s1lduovri1Y843bkDlJ8rGOUcoA==
X-Received: by 2002:a05:6214:20e2:b0:4bb:7aa5:bf0a with SMTP id 2-20020a05621420e200b004bb7aa5bf0amr28398378qvk.112.1667505226196;
        Thu, 03 Nov 2022 12:53:46 -0700 (PDT)
Received: from krzk-bin.. ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id de41-20020a05620a372900b006b615cd8c13sm1328892qkb.106.2022.11.03.12.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 12:53:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: parse clock-output-names
Date:   Thu,  3 Nov 2022 15:53:40 -0400
Message-Id: <20221103195341.174972-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
References: <20221103195341.174972-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we have several instances of WSA macro, each one of them should
register clock with unique name, so parse clock-output-names for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5e0abefe7cce..5cfe96f6e430 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of_clk.h>
@@ -2350,14 +2351,15 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 {
 	struct device *dev = wsa->dev;
 	const char *parent_clk_name;
-	const char *clk_name = "mclk";
 	struct clk_hw *hw;
 	struct clk_init_data init;
 	int ret;
 
 	parent_clk_name = __clk_get_name(wsa->npl);
 
-	init.name = clk_name;
+	init.name = "mclk";
+	of_property_read_string(dev_of_node(dev), "clock-output-names",
+				&init.name);
 	init.ops = &swclk_gate_ops;
 	init.flags = 0;
 	init.parent_names = &parent_clk_name;
-- 
2.34.1

