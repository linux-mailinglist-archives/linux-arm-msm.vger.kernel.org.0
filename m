Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E173C1E58
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhGIEea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhGIEe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:26 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C474AC061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:42 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 8so8963738lfp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wyfQ/AaQKOiokX60V253WPiUw+AOPKvuwfW4bIOFEAY=;
        b=AJP+QloJmqmzs+VJU10kG5J/rkfgBe3Tio+qlCxt/ubsoyKjmKRrEWZIMKq+ccRYWl
         ojA1gund8aY9+Q+hLyNNhB/XeZGWHRnT/sD+Pa4wIyWeed5z6MQ4xn4N9gr3DR7Yir5V
         JcBzKcGTVVy5YhnAWqDsch8bhfwqDN6ZJLInvUtRr+fxkBI4ngrofr5A9ceIOn8IjXc0
         itswHZhQLN/eIAqeW99pbsrQWw0nfloAfJMNA6uzpWqVEOGCwz4ScuLhIrTj8GmEOeZx
         riMWmZ1I7Dld/D91a57dMk+nmG9JCW8aBvdaB2ut4RYYyxRajF3smG6HAYMs8sYza1kx
         0uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wyfQ/AaQKOiokX60V253WPiUw+AOPKvuwfW4bIOFEAY=;
        b=pvr7dkzHDP+lbGo7br6VcUNxLgWJ3v2FhJXiuwdsGCQaIRMAUbW9KfoL05nv2PeOzL
         AVusjLeGXCnQXsXiiQzc4jQmgqjXHw4cOVJQAHIv+r0wYIUSYniotLNqJYgdEki3EGP5
         ilumGMNmLTb3vSKozPa3jGAfSVlhSnax8jy1GQIDV3r74wA63w71dLcBAsZDygc0wovQ
         OCFOiOmPtLOCubhwcyy5pWjyCH25D8IkPMq7PoX8FvSlBWk8JwZhkLV8+/ZIn+Tc5EvX
         GN7g/JhXgtBvwKAIkO1BFdAcAlHlnd5vvpyvmgqgeC47ZutqbHr3ROgUenG+UHf8csQ1
         Mvyg==
X-Gm-Message-State: AOAM530pXKY9d2NXbST1iZk+rpbbT1sbbeaSLAmVqYog0HJ057a3MSzc
        mfzsp2OzQQVWflURJWqi0gv1zg==
X-Google-Smtp-Source: ABdhPJxwjk6BNwns0NH2xy/EkGCWutIfDZLODxwpg2CXf5/Z2PIoir1JE6Sv1yjRfPjTh/NpraIc4w==
X-Received: by 2002:a19:e04a:: with SMTP id g10mr27341156lfj.561.1625805101114;
        Thu, 08 Jul 2021 21:31:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 3/7] PM: domains: Add support for runtime PM
Date:   Fri,  9 Jul 2021 07:31:32 +0300
Message-Id: <20210709043136.533205-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Registers for some genpds can be located in the SoC area, powered up by
another power domain. To enabled access to those registers, respective
domain should be turned on.

This patch adds basic infrastructure to the genpd code to allow
implementing drivers for such genpd. PM domain can provide the parent
device through the genpd->dev.parent pointer. If its provided at the
pm_genpd_init() call time and if it is pm-enabled, genpd power_on and
power_off operations will call pm_runtime_get_sync() before powering up
the domain and pm_runtime_put_sync() after powering it down.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/base/power/domain.c | 33 +++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  6 ++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index e5d97174c254..7d49531c9731 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -482,6 +482,30 @@ void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);
 
+static int _genpd_pm_runtime_get(struct generic_pm_domain *genpd)
+{
+	int ret;
+
+	if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
+		return 0;
+
+	ret = pm_runtime_get_sync(genpd->dev.parent);
+	if (ret < 0) {
+		pm_runtime_put_noidle(genpd->dev.parent);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void _genpd_pm_runtime_put(struct generic_pm_domain *genpd)
+{
+	if (!(genpd->flags & _GENPD_FLAG_RPM_ENABLED))
+		return;
+
+	pm_runtime_put_sync(genpd->dev.parent);
+}
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
 	unsigned int state_idx = genpd->state_idx;
@@ -497,6 +521,10 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 	if (ret)
 		return ret;
 
+	ret = _genpd_pm_runtime_get(genpd);
+	if (ret)
+		return ret;
+
 	if (!genpd->power_on)
 		goto out;
 
@@ -526,6 +554,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
 	return 0;
 err:
+	_genpd_pm_runtime_put(genpd);
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
 	return ret;
@@ -572,6 +601,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 		 genpd->name, "off", elapsed_ns);
 
 out:
+	_genpd_pm_runtime_put(genpd);
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
 	return 0;
@@ -1986,6 +2016,9 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	genpd->domain.ops.complete = genpd_complete;
 	genpd->domain.start = genpd_dev_pm_start;
 
+	if (genpd->dev.parent && pm_runtime_enabled(genpd->dev.parent))
+		genpd->flags |= _GENPD_FLAG_RPM_ENABLED;
+
 	if (genpd->flags & GENPD_FLAG_PM_CLK) {
 		genpd->dev_ops.stop = pm_clk_suspend;
 		genpd->dev_ops.start = pm_clk_resume;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 21a0577305ef..e86cd7cfc9ec 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -60,6 +60,10 @@
  * GENPD_FLAG_MIN_RESIDENCY:	Enable the genpd governor to consider its
  *				components' next wakeup when determining the
  *				optimal idle state.
+ *
+ * _GENPD_FLAG_RPM_ENABLED:	Use genpd's parent dev for runtime power
+ *				management. There is no need to set this flag,
+ *				it will be detected automatically.
  */
 #define GENPD_FLAG_PM_CLK	 (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE	 (1U << 1)
@@ -69,6 +73,8 @@
 #define GENPD_FLAG_RPM_ALWAYS_ON (1U << 5)
 #define GENPD_FLAG_MIN_RESIDENCY (1U << 6)
 
+#define _GENPD_FLAG_RPM_ENABLED	 (1U << 31)
+
 enum gpd_status {
 	GENPD_STATE_ON = 0,	/* PM domain is on */
 	GENPD_STATE_OFF,	/* PM domain is off */
-- 
2.30.2

