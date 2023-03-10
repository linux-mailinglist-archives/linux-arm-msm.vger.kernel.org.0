Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA26B539F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbjCJV7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232084AbjCJV7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:59:16 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5FB1C5A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:55:58 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id az36so4353878wmb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678485357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=eVhW4axVNZLOXqGc5Wrwpn7P/gsnyy9pwbDSFHUlmHUFJNWqmCjfXpmAeQxCP7+zGr
         ySVzxipN+tfC5HOJ/UDLeYCNlvZUgHE3J+GYgZQybsXVutyiwAecFDKa2JFkGnX3NiBe
         64FgjaMpDlTg7Qn5ViiOOrVMh0nerhg/Xz30jFXG//ZQj9F1fZUmAEskxsJ/hF2Fam5G
         OHfk0yOhGaq5lhN5ALPoH494jYP8kLTp6x3Quya7gApYvIJiXzb6eWoFFCB6ZMdYTiEN
         jbyfl6pKca8KMTq3Y6TEBA8kp7Hl2el78rZHu8CA/OQIO7nntQq2i6UdxW9ktx+v+hjc
         6k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678485357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6R58u+pco5SwiyuNgUjgOgUh5UTBCxq4L8biqsKSRA=;
        b=BjbQIX6MjUv9qjdg6Tce14e744i4vCpDDIxshgPMMfwMVMHloHv7fOB97Slxxl7RvO
         eSZxyZ5UFDZylJY7kxC0HTIRa3Xnfz6QPFIPHqnVdP21PtO9CIeIy8pmISt0Yd4zEyqy
         Ad791dLgTOZWu9hHKAy1097ZUWzM6PUIGAx/Z4SA1ja63ZxS6CgGUZ3iXbA+poVejzG0
         iGK+LUZW/FZT5enFnNbKoGoay1ffNUJ1FBch/wGv5J/32ci8OFc6PCf2VJHjKkQBPmF7
         L9lpOg93NRRYx8CotJhNBj6kQRK/0ItBhdXwLLXeaumvLlK7/+eZk8JMd0S4K7fkrXZr
         J8/A==
X-Gm-Message-State: AO0yUKX0S04Vr/D3TfxWOnwl4PpBvszz10nyr8JK3jCYqgwg3lr7NWQD
        2loIQul/4ttGsSz/oSZEaTvMsLJm82idGiLVSso=
X-Google-Smtp-Source: AK7set+FDz8JZEWAMgcBwbvkCP7C1J/GKrOFdld1I4i17Xvc2r83YnSVN8MhDyC9T68rpj0eW9DONA==
X-Received: by 2002:aa7:c2d1:0:b0:4ca:4a5:91bb with SMTP id m17-20020aa7c2d1000000b004ca04a591bbmr26053986edp.13.1678484764382;
        Fri, 10 Mar 2023 13:46:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id u7-20020a50d507000000b004be11e97ca2sm471873edi.90.2023.03.10.13.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 13:46:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/9] regulator: rpi-panel-attiny: Drop of_match_ptr for ID table
Date:   Fri, 10 Mar 2023 22:45:51 +0100
Message-Id: <20230310214553.275450-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
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

  drivers/regulator/rpi-panel-attiny-regulator.c:390:34: error: ‘attiny_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index 34514976475e..3953fc1f389f 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -396,7 +396,7 @@ MODULE_DEVICE_TABLE(of, attiny_dt_ids);
 static struct i2c_driver attiny_regulator_driver = {
 	.driver = {
 		.name = "rpi_touchscreen_attiny",
-		.of_match_table = of_match_ptr(attiny_dt_ids),
+		.of_match_table = attiny_dt_ids,
 	},
 	.probe_new = attiny_i2c_probe,
 	.remove	= attiny_i2c_remove,
-- 
2.34.1

