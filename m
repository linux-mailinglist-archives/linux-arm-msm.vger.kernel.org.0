Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA707D8445
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 01:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfJOXNY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 19:13:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37893 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbfJOXNX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 19:13:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id w3so6145346pgt.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 16:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AkK1IUD9itHRJl3qrEDn5W76PGecDNNhAPPx6TQzzz8=;
        b=AvW3ElfqMmv+CbwmItArkaa8Rnz/cRp/ZjdTku9q8Ee33KpjYuWQFNgI+dHLaI+BKQ
         g8ZAmo2OSohykJP7k51g8OEWglMNLi3t7Xtt4yO0UjuRrXaJI/rhAUrYQBxf1xNCXfdA
         MzIDfjz0+GUt/sETI1G27w2IX9E6rDBVIuRXfTd7xFYwcorAP0ndQHDKk927gOOnTc8E
         vvGhjl5G0Vhfr1Ld0z9UPChshknavZ7V9hN3cDWJCIBnmyRDyhrXuj91SlVJkoZx5WKi
         E4ww6h3XOzqRdgesiRhI5pXXwaeWGMy/P2glv8rSQVIAO6Yh5XlPnrnskfOTwGp7AWIn
         W9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AkK1IUD9itHRJl3qrEDn5W76PGecDNNhAPPx6TQzzz8=;
        b=SK92PbD23pCaxs8g/jnEQlcMP4cgLxW67UGIopOlcE8TDSGoafLYo+bgDnsm6/iTw/
         BSn3DnNQrPDDR6mPNS1De+k8ZjBfgipLwCKT1sFHBgY+uXdyv9uf4TJcs61q1Zz/dKrw
         umEEqJqHWN2SsTHXoWZpFaAqljJpd5xKBCA2FgY5rOxR3Z8ASarWGhZ9TD6F7yYr79Be
         A6y7JDdFuAI7J2WiTSpZMGzTIUReeJ05/+n6li0UcMjm8BHI4j/cS+exxInUAhospLkI
         b32qp/T7UVugrsg3XYU4MMns9sZNUGIGx0wSf+YHLizwuJ18i2RdMUHBVoctfEensP15
         fnuA==
X-Gm-Message-State: APjAAAUETpGbjGoqk4BthA1KSKkS119Nc/84c3yemEH+tmkdIrxM3qQe
        wpFPhftQAk0q7I24qvAM7CNvrMUC8nrr+Q==
X-Google-Smtp-Source: APXvYqzOZGdubxtAq2JsWsYxt64pPyHv8XCfZGohaoG/tQzF1DNtUISZxE5TDhW8OrwjjxOl+XU9/w==
X-Received: by 2002:a62:6d81:: with SMTP id i123mr20789870pfc.57.1571181200905;
        Tue, 15 Oct 2019 16:13:20 -0700 (PDT)
Received: from localhost ([49.248.193.232])
        by smtp.gmail.com with ESMTPSA id m102sm352863pje.5.2019.10.15.16.13.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 16:13:20 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH] of-thermal: Disable polling when interrupt property is found in DT
Date:   Wed, 16 Oct 2019 04:43:16 +0530
Message-Id: <1b53ef537203e629328285b4597a09e4a586d688.1571181041.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571181041.git.amit.kucheria@linaro.org>
References: <cover.1571181041.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, in order to enable interrupt-only mode, one must set
polling-delay-passive and polling-delay properties in the DT to 0,
otherwise the thermal framework will continue to setup a periodic timers
to monitor the thermal zones.

Change the behaviour, so that on DT-based systems, we no longer have to
set the properties to zero if we find an 'interrupt' property in the
sensor.

Following data shows the number of times
thermal_zone_device_set_polling() is invoked with and without this
patch. So the patch achieves the same behaviour as setting the delay
properties to 0.

Current behaviour (without setting delay properties to 0):
  FUNC                              COUNT
  thermal_zone_device_update          302
  thermal_zone_device_set_pollin     7911

Current behaviour (with delay properties set to 0):
  FUNC                              COUNT
  thermal_zone_device_update            3
  thermal_zone_device_set_pollin        6

With this patch (without setting delay properties to 0):
  FUNC                              COUNT
  thermal_zone_device_update            3
  thermal_zone_device_set_pollin        6

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/of-thermal.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
index dc5093be553e..79ad587462b1 100644
--- a/drivers/thermal/of-thermal.c
+++ b/drivers/thermal/of-thermal.c
@@ -412,7 +412,8 @@ static struct thermal_zone_device_ops of_thermal_ops = {
 static struct thermal_zone_device *
 thermal_zone_of_add_sensor(struct device_node *zone,
 			   struct device_node *sensor, void *data,
-			   const struct thermal_zone_of_device_ops *ops)
+			   const struct thermal_zone_of_device_ops *ops,
+			   bool force_interrupts)
 {
 	struct thermal_zone_device *tzd;
 	struct __thermal_zone *tz;
@@ -433,6 +434,11 @@ thermal_zone_of_add_sensor(struct device_node *zone,
 	tzd->ops->get_temp = of_thermal_get_temp;
 	tzd->ops->get_trend = of_thermal_get_trend;
 
+	if (force_interrupts) {
+		tz->passive_delay = 0;
+		tz->polling_delay = 0;
+	}
+
 	/*
 	 * The thermal zone core will calculate the window if they have set the
 	 * optional set_trips pointer.
@@ -486,6 +492,7 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 {
 	struct device_node *np, *child, *sensor_np;
 	struct thermal_zone_device *tzd = ERR_PTR(-ENODEV);
+	bool force_interrupts = false;
 
 	np = of_find_node_by_name(NULL, "thermal-zones");
 	if (!np)
@@ -498,6 +505,9 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 
 	sensor_np = of_node_get(dev->of_node);
 
+	if (of_find_property(sensor_np, "interrupts", NULL))
+		force_interrupts = true;
+
 	for_each_available_child_of_node(np, child) {
 		struct of_phandle_args sensor_specs;
 		int ret, id;
@@ -520,7 +530,8 @@ thermal_zone_of_sensor_register(struct device *dev, int sensor_id, void *data,
 
 		if (sensor_specs.np == sensor_np && id == sensor_id) {
 			tzd = thermal_zone_of_add_sensor(child, sensor_np,
-							 data, ops);
+							 data, ops,
+							 force_interrupts);
 			if (!IS_ERR(tzd))
 				tzd->ops->set_mode(tzd, THERMAL_DEVICE_ENABLED);
 
-- 
2.17.1

