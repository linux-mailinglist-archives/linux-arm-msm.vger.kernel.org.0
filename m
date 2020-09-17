Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4717226D19C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 05:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgIQD2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 23:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIQD2P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 23:28:15 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F481C0612F2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 20:22:31 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id b2so783352qtp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 20:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1NcquyWzHDIuJiug62gYGv91t6olYNR2dy8wB4N3YW8=;
        b=ZjT3HZ9IWjRR2EMUmN6dGhhCAsiNbkb1deW8KLeL6QC+L2ejiNBxDXnA6PoXafOEeA
         8hQzQMOism0hxclUr6bt1SZwSU6oplOEAFDa6VmagRr/5wXMtw9cpwwDW593D7M5vGOG
         +iwNVaWP8BEWDAIOR6fFPTyXAt1YbO69uuoyUUAX0FwirgmlXHYeInYlJIFf6/44gRd6
         t5fqMzOMJocRgAb0SsdQQXsy+qN/oIm2sTU8S/kehGc6KzlLNVuFgIItfaFfCpt0Azcp
         yJlAAUi2gNynmw7ku7zJLgHuQ5CDWtpJiqsFn/FGPV257NxWv0MAK+/sM9DAUPfgp/xG
         uJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1NcquyWzHDIuJiug62gYGv91t6olYNR2dy8wB4N3YW8=;
        b=Py7m/4FWpNx5iBgdH1IcwYK7f2DdUGiS0gSRdh4G/bF3oo+0MiwtTeiuEt+Bz1CBt3
         s/MP8tANTXp63UUymjXxMr2EJ9CLjp7Og7+p9XQnIQZ3F4zVnoZnsa4XKf0by6eGDrI7
         T7isTlqEayh/R6BD2sz9ESbj4J4/8ZpTyjDAHcqLzAuFpNk7bgU7zWtVCotU5Uz8wj4+
         qzJkRjWJK1lc3C5QNjIphCwNBcOdFY2pAQXGylNCg4UIzjRgK9hDeh99IHucnPZ7Y9Pk
         qQHYgT4XAp6VGHpkdD+V4lvFJRA/VD7WJQBUWE3zcnvmYpbmilAat8b/PBqfBkZnhAET
         WWuQ==
X-Gm-Message-State: AOAM533akT/ZX23QdBrr7UV55L5+cYbqNXQGCzoGow0xr6b6kL/4zchK
        yzpKcsuwIxR9A2Npc7kNot3mqw==
X-Google-Smtp-Source: ABdhPJxxKJdjeTdjjcubP0PRHZMaX20uEdalLcV/FelHR/61pinL+LUVDzaruFtZmWuBsDezydob+w==
X-Received: by 2002:ac8:c47:: with SMTP id l7mr26784465qti.112.1600312950684;
        Wed, 16 Sep 2020 20:22:30 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id g45sm21370801qtb.60.2020.09.16.20.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 20:22:30 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rui.zhang@intel.com, daniel.lezcano@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lukasz.luba@arm.com, amitk@kernel.org
Subject: [PATCH RFC 3/8] thermal: thermal_of: Extend thermal dt driver to support bi-directional monitoring of a thermal trip point.
Date:   Wed, 16 Sep 2020 23:22:21 -0400
Message-Id: <20200917032226.820371-4-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200917032226.820371-1-thara.gopinath@linaro.org>
References: <20200917032226.820371-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce of_thermal_get_trip_monitor_type to return the direction
of monitoring of a thermal trip point. Also translate the DT information
regarding trip point monitor direction into the thermal framework.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/thermal/thermal_of.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 69ef12f852b7..5bc7f5bab772 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -328,6 +328,20 @@ static int of_thermal_get_trip_hyst(struct thermal_zone_device *tz, int trip,
 	return 0;
 }
 
+static int of_thermal_get_trip_monitor_type
+				(struct thermal_zone_device *tz, int trip,
+				 enum thermal_trip_monitor_type *type)
+{
+	struct __thermal_zone *data = tz->devdata;
+
+	if (trip >= data->ntrips || trip < 0)
+		return -EDOM;
+
+	*type = data->trips[trip].monitor_type;
+
+	return 0;
+}
+
 static int of_thermal_set_trip_hyst(struct thermal_zone_device *tz, int trip,
 				    int hyst)
 {
@@ -363,6 +377,7 @@ static struct thermal_zone_device_ops of_thermal_ops = {
 	.set_trip_temp = of_thermal_set_trip_temp,
 	.get_trip_hyst = of_thermal_get_trip_hyst,
 	.set_trip_hyst = of_thermal_set_trip_hyst,
+	.get_trip_mon_type = of_thermal_get_trip_monitor_type,
 	.get_crit_temp = of_thermal_get_crit_temp,
 
 	.bind = of_thermal_bind,
@@ -801,6 +816,7 @@ static int thermal_of_populate_trip(struct device_node *np,
 {
 	int prop;
 	int ret;
+	bool is_monitor_falling;
 
 	ret = of_property_read_u32(np, "temperature", &prop);
 	if (ret < 0) {
@@ -822,6 +838,12 @@ static int thermal_of_populate_trip(struct device_node *np,
 		return ret;
 	}
 
+	ret = of_property_read_bool(np, "monitor-falling");
+	if (is_monitor_falling)
+		trip->monitor_type = THERMAL_TRIP_MONITOR_FALLING;
+	else
+		trip->monitor_type = THERMAL_TRIP_MONITOR_RISING;
+
 	/* Required for cooling map matching */
 	trip->np = np;
 	of_node_get(np);
-- 
2.25.1

