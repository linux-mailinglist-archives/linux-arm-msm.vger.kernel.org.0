Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D312E84E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jan 2021 18:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbhAARAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jan 2021 12:00:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbhAARAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jan 2021 12:00:16 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90888C0613C1;
        Fri,  1 Jan 2021 08:59:36 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id i5so14759951pgo.1;
        Fri, 01 Jan 2021 08:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B6KZ2Ff9+uoX7TjtVwvZbD+YxpgTFNUVJ04tA7imAWI=;
        b=rOTNCfR+NkgKmhJNBCG+t65aPaiItah7G+UcEfeIhRP42LcaEbBXfdDgeiB/xESAV9
         3lMrloQGIbQCg/VxHZW4eSINdscKdl9lEoQNQD5N+1/VMlV8r27KbyjkOc0Mn4/WSbYl
         l7Mn4WMbVYcYQN2K9NHB+G56iE0CqLHqbgXG5Pa8XHyhwJoS/ULO4lh9U6ljNChd5eD9
         q3G5xPm7htyCYTKRzMav07ToYEemSKL4Z7AhvcXItqLRASSxLmwS5m73VCViolNnV1/H
         puv+HoyOfDZOs6AWg1EaWJexTTNcjcAef1VUUqrDv+PE6TjqO7Y9/dmUREi9hlmESDmS
         7OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B6KZ2Ff9+uoX7TjtVwvZbD+YxpgTFNUVJ04tA7imAWI=;
        b=W0m+EsyQ88h+E/wPfCvZ7VZNkMcOjPjDPBuYcAjeZ/1kSknCeT/EYdHiVd5NEgbUiC
         kKaqk9obpqt6OSBIRLp4lmdPITKLBx51zO0jvvJGAEDvzfLHMlz1u9SawTlJioH0QLUq
         CMcpvB8VivoFUAHM39yprZqvE/dWc3Ngijmtusj8w1rGEecsCNirtfvxFqAcnI4yltaR
         TliCtbRsKjRC3ucgNSXkplYhT6dgP0W5VC6ZUJEzeIdgHC6Myxz+fnYrvfA2iJPrMBwZ
         7oLiPSlwtHeDPapm4C/uhitPGZ6eqgrJJL2AyJF75jXeeWDHNhMAxW3Zz/0SJXeH6/9s
         KYlw==
X-Gm-Message-State: AOAM530genVz42MWESMsopUWVRsLn4NpPXQQni2NYHbw9wnMf9U8dVxn
        2fpAX9HiUJk28nOacD0YVSo=
X-Google-Smtp-Source: ABdhPJyRZmzWKwvwotVcdQcUdHa0yD6enH6l8buXkNSVs9fiPssXxnaoG6i0/rlHnvKJ20pT5FmoZQ==
X-Received: by 2002:a63:5a08:: with SMTP id o8mr18877228pgb.118.1609520376188;
        Fri, 01 Jan 2021 08:59:36 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
        by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jan 2021 08:59:35 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, krzk@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, digetx@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yuq825@gmail.com, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        lukasz.luba@arm.com, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, vireshk@kernel.org, nm@ti.com,
        sboyd@kernel.org, broonie@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
        hoegsberg@google.com, eric@anholt.net, tzimmermann@suse.de,
        marijn.suijten@somainline.org, gustavoars@kernel.org,
        emil.velikov@collabora.com, jonathan@marek.ca,
        akhilpo@codeaurora.org, smasetty@codeaurora.org,
        airlied@redhat.com, masneyb@onstation.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, tiny.windzz@gmail.com,
        ddavenport@chromium.org, jsanka@codeaurora.org,
        rnayak@codeaurora.org, tongtiangen@huawei.com,
        miaoqinglang@huawei.com, khsieh@codeaurora.org,
        abhinavk@codeaurora.org, chandanu@codeaurora.org,
        groeck@chromium.org, varar@codeaurora.org, mka@chromium.org,
        harigovi@codeaurora.org, rikard.falkeborn@gmail.com,
        natechancellor@gmail.com, georgi.djakov@linaro.org,
        akashast@codeaurora.org, parashar@codeaurora.org,
        dianders@chromium.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH 19/31] drm/panfrost: convert to use devm_pm_opp_* API
Date:   Fri,  1 Jan 2021 16:54:55 +0000
Message-Id: <20210101165507.19486-20-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_pm_opp_* API to simplify code, and remove opp_table
from panfrost_devfreq.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 34 ++++++---------------
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  1 -
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..c42fa9eb43b1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -92,25 +92,26 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
-	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
+	opp_table = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
 					      pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
 		ret = PTR_ERR(opp_table);
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
 			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-			goto err_fini;
+			return ret;
 		}
-	} else {
-		pfdevfreq->regulators_opp_table = opp_table;
 	}
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret) {
+		if (!IS_ERR(opp_table))
+			devm_pm_opp_put_regulators(dev, opp_table);
+
 		/* Optional, continue without devfreq */
 		if (ret == -ENODEV)
 			ret = 0;
-		goto err_fini;
+		return ret;
 	}
 	pfdevfreq->opp_of_table_added = true;
 
@@ -121,10 +122,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	cur_freq = clk_get_rate(pfdev->clock);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp)) {
-		ret = PTR_ERR(opp);
-		goto err_fini;
-	}
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
@@ -133,8 +132,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 	if (IS_ERR(devfreq)) {
 		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
-		ret = PTR_ERR(devfreq);
-		goto err_fini;
+		return PTR_ERR(devfreq);
 	}
 	pfdevfreq->devfreq = devfreq;
 
@@ -145,10 +143,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		pfdevfreq->cooling = cooling;
 
 	return 0;
-
-err_fini:
-	panfrost_devfreq_fini(pfdev);
-	return ret;
 }
 
 void panfrost_devfreq_fini(struct panfrost_device *pfdev)
@@ -159,14 +153,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 		devfreq_cooling_unregister(pfdevfreq->cooling);
 		pfdevfreq->cooling = NULL;
 	}
-
-	if (pfdevfreq->opp_of_table_added) {
-		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
-		pfdevfreq->opp_of_table_added = false;
-	}
-
-	dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
-	pfdevfreq->regulators_opp_table = NULL;
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index db6ea48e21f9..a51854cc8c06 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -15,7 +15,6 @@ struct panfrost_device;
 
 struct panfrost_devfreq {
 	struct devfreq *devfreq;
-	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
 	bool opp_of_table_added;
 
-- 
2.25.1

