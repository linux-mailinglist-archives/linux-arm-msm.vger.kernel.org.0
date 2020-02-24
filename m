Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A63C16A69C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 13:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgBXM7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 07:59:15 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:47037 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgBXM7O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 07:59:14 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so4022850pll.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2020 04:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEoIHk1DMNFlUDlS2mHYQ7hw5/edQugGUZCmTbk0oQY=;
        b=WhmJc4o0Hei2T5dVmOwsPi0dhRuZXdo+2t1CwfjSjQ01c+rVJ3o197eZe9jaivHhsS
         Af9MO2dlYF1ozNWbTJR0uSnI1yg7VmouHRFRUyrKhDQfFdCuxFZ77K4qjKUuuVDRGXMO
         pp3f9dsEUX4X9+jPFCr1Fx43GgP4QZIlHNutaxoT2tf8eKnxnwKDoEWy1WxIa1ktJv+n
         l1fBmEGKoSIwZaIYNWSPhkyugR64Z1osmk2kMcJuru4J5pkgt9iZMyGqtcozwJreizYV
         /sE7KvwquUjMGUI2hROeGofUGqdk/NaEpiGRy1SQXlw2K9z+AaXNcYQBoCI7EcNiqjjt
         8dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEoIHk1DMNFlUDlS2mHYQ7hw5/edQugGUZCmTbk0oQY=;
        b=ezL3quE34GyaTgQkSSB5+b8LoS/NuaXAJVjlwhZt/tUDABTpPKpWPR8OGgsDcawL7f
         yuk4zFWDNVtiZYY7PSE9j7A2aSylmB9XseoIOwRd4IEgZdiKv2OMOn5U6tJpmpb+/bK6
         qq/4njqe4V28idZ35iYbQf/SxkBj1MhhCoUxnrFADtbrqvmdZ2SP8otYcJs8RNkbY7Uh
         mtgiQAVRGMXvM+i9T4dAVjBahtvbPOVEEZhJNP/1W90LkimAb8r+u63KyG2pOL5v4k/k
         O5uN1JTt7djQdcOXFCrs4FBQ2Mq9MjUvxYzs4Pj3adyrox1V8rPFGJMLy/dwVhWObVeJ
         CM7Q==
X-Gm-Message-State: APjAAAW2sNhhVqNI+j2JN41wF6LuLfuzrZXjI2x5uwnOIe4C3QLjrUae
        S7PHQPWEy77gsQdjNulb2rwCCQ==
X-Google-Smtp-Source: APXvYqzj5TeDP+eGemW8oZ0tWxCwY2kgIztJ5SvpSDmy6jWDsr3H7/EWg24A7BqInCkuWierFcgMNw==
X-Received: by 2002:a17:902:8341:: with SMTP id z1mr48441653pln.178.1582549154055;
        Mon, 24 Feb 2020 04:59:14 -0800 (PST)
Received: from localhost ([103.195.202.114])
        by smtp.gmail.com with ESMTPSA id u13sm12519095pjn.29.2020.02.24.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 04:59:13 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v6 3/8] drivers: thermal: tsens: use simpler variables
Date:   Mon, 24 Feb 2020 18:28:50 +0530
Message-Id: <ec300c8cf25c0fc841ab7919f2b3b6b975b34a4b.1582548319.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582548319.git.amit.kucheria@linaro.org>
References: <cover.1582548319.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already dereference the sensor and save it into a variable. Use the
variable directly to make the code easier to read.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/6f95b3f0d39433c7e6b01094bdb200a7ac8e9f0d.1582048155.git.amit.kucheria@linaro.org
---
 drivers/thermal/qcom/tsens-common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index c2df30a08b9e..1cbc5a6e5b4f 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -368,7 +368,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, UPPER, disable);
 			if (d.up_thresh > temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm upper\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, UPPER, enable);
 			} else {
 				trigger = true;
@@ -379,7 +379,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 			tsens_set_interrupt(priv, hw_id, LOWER, disable);
 			if (d.low_thresh < temp) {
 				dev_dbg(priv->dev, "[%u] %s: re-arm low\n",
-					priv->sensor[i].hw_id, __func__);
+					hw_id, __func__);
 				tsens_set_interrupt(priv, hw_id, LOWER, enable);
 			} else {
 				trigger = true;
@@ -392,7 +392,7 @@ irqreturn_t tsens_irq_thread(int irq, void *data)
 		if (trigger) {
 			dev_dbg(priv->dev, "[%u] %s: TZ update trigger (%d mC)\n",
 				hw_id, __func__, temp);
-			thermal_zone_device_update(priv->sensor[i].tzd,
+			thermal_zone_device_update(s->tzd,
 						   THERMAL_EVENT_UNSPECIFIED);
 		} else {
 			dev_dbg(priv->dev, "[%u] %s: no violation:  %d\n",
@@ -435,7 +435,7 @@ int tsens_set_trips(void *_sensor, int low, int high)
 	spin_unlock_irqrestore(&priv->ul_lock, flags);
 
 	dev_dbg(dev, "[%u] %s: (%d:%d)->(%d:%d)\n",
-		s->hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
+		hw_id, __func__, d.low_thresh, d.up_thresh, cl_low, cl_high);
 
 	return 0;
 }
-- 
2.20.1

