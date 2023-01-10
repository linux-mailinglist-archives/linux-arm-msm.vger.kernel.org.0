Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2036F663E52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 11:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237833AbjAJKes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 05:34:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbjAJKer (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 05:34:47 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FF64D4BD
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:34:46 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ja17so8429784wmb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 02:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8w8+O91x6kumEh4lF0ym7XFpPER6TCzGXKG5aX3JDw=;
        b=aoBbi6sXhFzCmybRmWwEV1rhv1MxYXadF7W7dx0BjBynhzu9RQeaR9mZVwEW+ghPVx
         puj2WM34WhsMwTPd+48dLY5tRv0UvfvbBV69pDLqz2Fb9PgGamos65X0tz+OimhWP4eX
         3nRDEOHq3qH78eIc2MlkJGLnXu6p6wKEXVzzaeYQlr6z/me3qkQWIaVx1XqpDM2vpTxE
         z1rsYntTDmu+ZGfxjVVJLOowBAxEkNPeL/ngswksFYGlQ17iO10frKh4dfAnBbsIR0cZ
         dAmu2CB2EvYgvVds6/p08QU9Sjk5wSZ2HP441Y5583Q2r7j8MJI9fQx5TxmIxmVSCfjR
         Z0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8w8+O91x6kumEh4lF0ym7XFpPER6TCzGXKG5aX3JDw=;
        b=Ek6LXz1fw1jUmE6UANtT0ro2XL+jiknFBIyGmswue1AYWukwAZB+pRTKID9pKS6ZRD
         Xz1yxSMI9M7dRAmRZLcXgtMhZjpFZvEY6T0DnkbnRbSXuyQbetEpXzCqsgqKqpmZIO5+
         i3Vozh14xvKoKjxY9hnq2AyvRV7fqSwdZt6E+tX4xVr5t7v3S5bQb6kq9O8PIZboAitq
         Fwc+hH6JZ1rWP9od6STZjTNP96JORjWLqcGYeyGxddPzy+sTbTQBRQc+Q8jQ4onmiNxR
         j7kddgkj77mndkzXGEtafcm30g0sZwxWmGrKmVnUZbFkh+3bWA8lJTXHMM5ZvrhVngLu
         FpQA==
X-Gm-Message-State: AFqh2kqS7vgiS7GmVx28AEgb+HPX2+ZrsQEQH4JpntW2OxCgXNZlu6DQ
        kYU/JH5T5sV2tKoWKgmV+gh6EA==
X-Google-Smtp-Source: AMrXdXsKZIF89HCTLwqLnN4QPrxdRDgUZhxST1pEsKbqms4h+NEyD0x16YKN/NnlBup8oC1yWqXcAA==
X-Received: by 2002:a05:600c:35ca:b0:3d1:f2de:195a with SMTP id r10-20020a05600c35ca00b003d1f2de195amr52230532wmq.32.1673346884631;
        Tue, 10 Jan 2023 02:34:44 -0800 (PST)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c154c00b003d9fba3c7a4sm409366wmg.16.2023.01.10.02.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 02:34:44 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
X-Google-Original-From: Daniel Lezcano <daniel.lezcano@kernel.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org,
        dmitry.baryshkov@linaro.org
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] thermal/drivers/qcom: Remove duplicate set next trip point interrupt code
Date:   Tue, 10 Jan 2023 11:34:20 +0100
Message-Id: <20230110103420.2430518-1-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.34.1
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

From: Daniel Lezcano <daniel.lezcano@linaro.org>

The tsens driver reprogram the next trip points in the irq
handler. This function then call thermal_zone_device_update().

However, thermal_zone_device_update() calls thermal_zone_set_trips()
and from there it calls the backend 'set_trips' ops. This one in turn
reprogram the next trip points (low/high).

Consequently, the code setting the next trip points interrupt in the
interrupt handle is not needed and could be removed.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
---
 drivers/thermal/qcom/tsens.c | 46 +-----------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index b5b136ff323f..58693ee8c430 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -472,52 +472,8 @@ static irqreturn_t tsens_irq_thread(int irq, void *data)
 			continue;
 		if (!tsens_threshold_violated(priv, hw_id, &d))
 			continue;
-		ret = get_temp_tsens_valid(s, &temp);
-		if (ret) {
-			dev_err(priv->dev, "[%u] %s: error reading sensor\n",
-				hw_id, __func__);
-			continue;
-		}
 
-		spin_lock_irqsave(&priv->ul_lock, flags);
-
-		tsens_read_irq_state(priv, hw_id, s, &d);
-
-		if (d.up_viol &&
-		    !masked_irq(hw_id, d.up_irq_mask, tsens_version(priv))) {
-			tsens_set_interrupt(priv, hw_id, UPPER, disable);
-			if (d.up_thresh > temp) {
-				dev_dbg(priv->dev, "[%u] %s: re-arm upper\n",
-					hw_id, __func__);
-				tsens_set_interrupt(priv, hw_id, UPPER, enable);
-			} else {
-				trigger = true;
-				/* Keep irq masked */
-			}
-		} else if (d.low_viol &&
-			   !masked_irq(hw_id, d.low_irq_mask, tsens_version(priv))) {
-			tsens_set_interrupt(priv, hw_id, LOWER, disable);
-			if (d.low_thresh < temp) {
-				dev_dbg(priv->dev, "[%u] %s: re-arm low\n",
-					hw_id, __func__);
-				tsens_set_interrupt(priv, hw_id, LOWER, enable);
-			} else {
-				trigger = true;
-				/* Keep irq masked */
-			}
-		}
-
-		spin_unlock_irqrestore(&priv->ul_lock, flags);
-
-		if (trigger) {
-			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
-				hw_id, __func__, temp);
-			thermal_zone_device_update(s->tzd,
-						   THERMAL_EVENT_UNSPECIFIED);
-		} else {
-			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
-				hw_id, __func__, temp);
-		}
+		thermal_zone_device_update(s->tzd, THERMAL_EVENT_UNSPECIFIED);
 
 		if (tsens_version(priv) < VER_0_1) {
 			/* Constraint: There is only 1 interrupt control register for all
-- 
2.34.1

