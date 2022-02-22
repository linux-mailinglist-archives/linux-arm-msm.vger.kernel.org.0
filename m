Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C82B4BF94D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 14:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbiBVN3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 08:29:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbiBVN3M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:12 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6835998595
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 05:28:46 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B8563402F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536523;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VKZlwWJ7g99WEIyofZ1MqRBQ33PrEKi+p/W7fixuZQiEB/2X+gc7Gr1iVWam0e3WU
         WitLCT92mAbGqReCm8y7JpBUs6MydgHKfP42Wa0RKywCLmybZslSxnPsQnxIWqbdMS
         Wh2bH6R/iRuOS/f46edLeQ1SwRPr4WjRlIKwSj9k+Njfw/eMmhKurQEr8LVtP2bptT
         DTj7i+gBtR9MDPAmIgpM00OfYXO9DwszqnfySNSSG2kdlGbws+f0lfuukin297dUab
         baGeaV8BHHyE5Kz8XyC7Nvrtq2ne0jQnhlJAYDJ12SNAj7wLVDL2deWf7FjC029JJe
         dFlN85JCHLnvw==
Received: by mail-ej1-f72.google.com with SMTP id sa22-20020a1709076d1600b006ce78cacb85so5788004ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 05:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6XeuQoqUzMUksn+ZuaBzNCPcuTk2LLoHTJkT0DsbDHY=;
        b=lrwlBgF/QN3e+oyW/pGNlXOvFlj75x5KExEPYWGcf/uDZs5ZLFMT06U7YUkfiSk2ox
         Kg8jrWA/brsRWXCjcYW6WJhd3t8pWanJZB3s//oCcVMXY+paXTflj1z9X9PFCxlbUX7I
         gSVp3SlP53raUVP2KNOPiFLatfj2BQpCef5YpdoGq98tINrmQ/sB/GMmPD0Z/zlcVC3L
         1jOXTC6B+pi9fd+y03muE9fzqWpmOGGteiHyZGUk6DoFJne1CUMQwk3yXOU3wWHQsTD4
         jV15FEEUZwf5wIeBGTqJaNR1yronmPqIQwpU/bQt8Jk53/R0kYL3Yo7HlV8oY/zQl9RV
         79/A==
X-Gm-Message-State: AOAM530V7Md5bu8wcgQS975qAk6OmG1Ryb16Ks+INI2IZgOAvVkck0fv
        K2JZ4dqxcQng2NkN8/zkXAt0ARBc55483X2/+u1QffrKiLBsl6fDB38ir0YJe64skDp4fnL9uEt
        T1ZcZ9wI/YMZm0XbyAiMW8+Cl9Z3VDu9rQ6xgH8FfYeE=
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602329ejd.377.1645536523431;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymWh8nTis0+whBJdlEUIaYxkLfPNPRZyT/AbiwgON8MIxb/gad15tlt22GRXjxl9FycTeAJw==
X-Received: by 2002:a17:906:1656:b0:6cf:571c:f91d with SMTP id n22-20020a170906165600b006cf571cf91dmr19602313ejd.377.1645536523213;
        Tue, 22 Feb 2022 05:28:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        stable@vger.kernel.org
Subject: [RFT PATCH 2/3] slimbus: qcom-ngd: fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:06 +0100
Message-Id: <20220222132707.266883-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver_override field from platform driver should not be initialized
from const memory because the core later kfree() it, for example when
driver_override is set via sysfs.

Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 7040293c2ee8..5987d8f8a8fd 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1455,7 +1455,14 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		}
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
-		ngd->pdev->driver_override = QCOM_SLIM_NGD_DRV_NAME;
+		ngd->pdev->driver_override = kstrdup(QCOM_SLIM_NGD_DRV_NAME,
+						     GFP_KERNEL);
+		if (!ngd->pdev->driver_override) {
+			platform_device_put(ngd->pdev);
+			kfree(ngd);
+			of_node_put(node);
+			return -ENOMEM;
+		}
 		ngd->pdev->dev.of_node = node;
 		ctrl->ngd = ngd;
 
-- 
2.32.0

