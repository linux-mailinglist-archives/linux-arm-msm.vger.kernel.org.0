Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497F15EE78E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 23:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiI1VFw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 17:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbiI1VE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 17:04:59 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E842DDF067
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:02:10 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id s14so21694683wro.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KY22MjtoUlIwWIKxWwfuHh0wn9QBG3Vjtz/Dduvf6bU=;
        b=WyUQmG+dikM/2KB56J+eG4Y/B0GNeeumoWKaKhxJmcGkJp547dIcc914gSP+T7Y5jh
         WdtE9db/kqIizzIp3NNCL2h/Yp6vsZcaOChwsZD7xcH3HLegIduohrZ3bhRh2DEw3v6i
         oDdQVM0kklN9XW3aFRMIXsX7LbR+tbJ22tfmj2fpPBte+6PruziVTxqfI5Wz3ARaIKcF
         bcoHLngWnbprMwjhDgPvqcnPqC1C43xHZ0Z5XPhMnaT8O0FQ6zOJteHtaSlX5QOSrTBf
         nkPRm0nPWAk6zhdt1LNavzCBHxFKzRgZ9oOAYP6nsCUP/xedkvuJz5mUwA63uONAUnIo
         EJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KY22MjtoUlIwWIKxWwfuHh0wn9QBG3Vjtz/Dduvf6bU=;
        b=DEn7EchJEy/FYBizlIafghyIEJidlvBPYTblzZWUm4ANTFiZE0p2c/iKwrpYX+UCG2
         0QA922qQhCyhirC9IlPQkYhRWXFBDgR4rONO5Eojn0IwP7tiOui4dsxMdFwhp/lE9ABX
         5sTkpI47iMKKM+zYaMumSVrK7QL0f0MRLeAPbjlguLBU3NvUeMwiPyuAgVzuvCkrcR7E
         kix+i8L5hR0J20PfXMRehbTGUJmh2nmGNCmzmlcPx+bq9kgmvZnrUthTw4PlmU0yftS0
         He4rp7dU7IwHLCb7UP8Jkyid1FANB81tlUT0AuHeR1gR0KMmdKJScGRtMQt9k0fEIJnl
         7gMg==
X-Gm-Message-State: ACrzQf0B7i90HboY+wFxjdfDQ+SdBGNoJeZWHvhVGHdb3Z44WkWMPRLb
        DxSZZbzHQ2CPjCH7wAuRUYlYbw==
X-Google-Smtp-Source: AMsMyM4P1lUyKTcMIxqnoNZG7083LyGfwCK5ra6P2JSFm3+Dil1W9PWEHPQlRPPylMW65T2kcBp1qA==
X-Received: by 2002:a5d:64c2:0:b0:228:cb2b:f38d with SMTP id f2-20020a5d64c2000000b00228cb2bf38dmr22043755wri.491.1664398928756;
        Wed, 28 Sep 2022 14:02:08 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:02:08 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 18/29] thermal/of: Remove of_thermal_set_trip_hyst()
Date:   Wed, 28 Sep 2022 23:00:48 +0200
Message-Id: <20220928210059.891387-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928210059.891387-1-daniel.lezcano@linaro.org>
References: <20220928210059.891387-1-daniel.lezcano@linaro.org>
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

The thermal core is providing the generic thermal_zone_set_trip()
function which does exactly what the OF ops function is doing.

It is pointless to define our own version, just remove the ops and the
thermal_zone_set_trip() will take care of it.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_of.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 4e54d62720dc..494e9c319541 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -19,18 +19,6 @@
 
 #include "thermal_core.h"
 
-static int of_thermal_set_trip_hyst(struct thermal_zone_device *tz, int trip,
-				    int hyst)
-{
-	if (trip >= tz->num_trips || trip < 0)
-		return -EDOM;
-
-	/* thermal framework should take care of data->mask & (1 << trip) */
-	tz->trips[trip].hysteresis = hyst;
-
-	return 0;
-}
-
 static int of_thermal_get_crit_temp(struct thermal_zone_device *tz,
 				    int *temp)
 {
@@ -541,7 +529,6 @@ struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor,
 		goto out_kfree_trips;
 	}
 
-	of_ops->set_trip_hyst = of_ops->set_trip_hyst ? : of_thermal_set_trip_hyst;
 	of_ops->get_crit_temp = of_ops->get_crit_temp ? : of_thermal_get_crit_temp;
 	of_ops->bind = thermal_of_bind;
 	of_ops->unbind = thermal_of_unbind;
-- 
2.34.1

