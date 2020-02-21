Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228CE1687BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 20:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgBUTsj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 14:48:39 -0500
Received: from foss.arm.com ([217.140.110.172]:47106 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726443AbgBUTsi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 14:48:38 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED8931B;
        Fri, 21 Feb 2020 11:48:38 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.243])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 234983F703;
        Fri, 21 Feb 2020 11:48:26 -0800 (PST)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Morten.Rasmussen@arm.com, Dietmar.Eggemann@arm.com,
        javi.merino@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, lukasz.luba@arm.com,
        patrick.bellasi@matbug.net, orjan.eide@arm.com
Subject: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with devfreq device
Date:   Fri, 21 Feb 2020 19:47:31 +0000
Message-Id: <20200221194731.13814-5-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221194731.13814-1-lukasz.luba@arm.com>
References: <20200221194731.13814-1-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device to the Energy Model framework. It will create a dedicated
and unified data structures used i.e. in the thermal framework.
The power model used in dev_pm_opp subsystem is simplified and created
based on DT 'dynamic-power-coefficient', volatage and frequency. It is
similar to the CPU model used in Energy Aware Scheduler.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbf..d527a5113950 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -105,6 +105,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	}
 	pfdev->devfreq.devfreq = devfreq;
 
+	dev_pm_opp_of_register_em(dev, NULL);
+
 	cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
 	if (IS_ERR(cooling))
 		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
@@ -118,6 +120,7 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 {
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
+	dev_pm_opp_of_unregister_em(&pfdev->pdev->dev);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
 }
 
-- 
2.17.1

