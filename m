Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1D5266145
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgIKOel (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 10:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgIKNLy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 09:11:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3E5C06179F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:01 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id q8so5792690lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m5KMHGWQDG6Uv1g+cxbh6QspEu1IYdXsFgHaa0ci9nE=;
        b=aPdnl4LauZp8bormR5gQukpv+hJDKXUphmNidSWY9kfPjQkdMB4mWSA7HZWaX0lI+k
         g1y2eJ7zY+nlIYJp+KV3M3GI1IAznKCWvMs1ohovMk29bNXBoGD+hOYR3F98lB+dfWLn
         PCg4l7iDWyhIuLywPcjtDu1K74k0TExDFdxQWi1AeeBwx4y6SoOMXe5oMELIh8w/bRsZ
         eIML7ydS/78stgJQhQhZum05rooi0I+HjveNUSw8J9HFl6JEMF9QXP3s/CduAnxNoJi8
         MSGiV1EAnn6GpQfpPmsX1FPD/nLzwdHDisMmo2igRbnh7EZwGg7z6KHGvYBFQ5vH8Xkm
         Lg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m5KMHGWQDG6Uv1g+cxbh6QspEu1IYdXsFgHaa0ci9nE=;
        b=Psp5GaCxnwzSniiqozOCW3dMwTi4n8RMPOp+8jHf0vobzbLMzmhqom9RQpGywgDdiv
         VXBa4T4p+C8vB2kN8A7nUzQWsbMoscEjYNOQTXxa+LiX9ltaZRLct8As8Q/CMYdi8zOT
         qmzOM1CywjsyysPZAKUCOHgK9AQ7wD/SYgopUVQjSjcy6R+ejLfmp0qKZ19DjCLHIESW
         jfTW+FM264TGyvXZZ0b+gwueHIRPt9UVNX/ITXnHvPVsTRLFlfUjrl0OFTZ4xmuZ1yuy
         yzv6X4oM4JI0NN7YFUWNKbmE64apB7wOAvOwF2dyHuO+7PjyIZtSVVCkgHB7w+7QuupO
         Qx4g==
X-Gm-Message-State: AOAM531GEXuXi7zl/9bxCM4DjdlAQC9QjDOByl/kiLjGUkhbGBvVZe7+
        ZEuJSm51mg3vzX5fKzKwv4uQSg==
X-Google-Smtp-Source: ABdhPJycYmbMHiM/KF3emp4n9dE8mAR+tqwFUllIlclkXPzN9929dL6HkRJKEGtS3OIB9YkGUcyMWQ==
X-Received: by 2002:a19:834a:: with SMTP id f71mr780700lfd.59.1599829799561;
        Fri, 11 Sep 2020 06:09:59 -0700 (PDT)
Received: from eriador.lan ([188.162.64.141])
        by smtp.gmail.com with ESMTPSA id 10sm429500lfq.64.2020.09.11.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 06:09:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org
Subject: [RFC 2/4] clk: qcom: gdsc: enable external switchable power domain
Date:   Fri, 11 Sep 2020 16:09:48 +0300
Message-Id: <20200911130950.578483-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
References: <20200911130950.578483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some GDSCs (SM8250's MDSS_GDSC for example) need switchable power domain
to be on to be able to access hardware registers. Use dev_pm/opp to
enable corresponding power domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 56 ++++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/gdsc.h |  5 ++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index bfc4ac02f9ea..a522e062a79a 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset-controller.h>
@@ -110,13 +111,31 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	return -ETIMEDOUT;
 }
 
+int gdsc_toggle_on(struct gdsc *sc)
+{
+	if (sc->rsupply)
+		return regulator_enable(sc->rsupply);
+	if (sc->pd_dev)
+		return dev_pm_genpd_set_performance_state(sc->pd_dev, sc->pd_opp);
+	return 0;
+}
+
+int gdsc_toggle_off(struct gdsc *sc)
+{
+	if (sc->pd_dev)
+		return dev_pm_genpd_set_performance_state(sc->pd_dev, 0);
+	if (sc->rsupply)
+		return regulator_disable(sc->rsupply);
+	return 0;
+}
+
 static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 {
 	int ret;
 	u32 val = (status == GDSC_ON) ? 0 : SW_COLLAPSE_MASK;
 
-	if (status == GDSC_ON && sc->rsupply) {
-		ret = regulator_enable(sc->rsupply);
+	if (status == GDSC_ON) {
+		ret = gdsc_toggle_on(sc);
 		if (ret < 0)
 			return ret;
 	}
@@ -153,8 +172,8 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
-	if (!ret && status == GDSC_OFF && sc->rsupply) {
-		ret = regulator_disable(sc->rsupply);
+	if (!ret && status == GDSC_OFF) {
+		ret = gdsc_toggle_off(sc);
 		if (ret < 0)
 			return ret;
 	}
@@ -407,6 +426,27 @@ int gdsc_register(struct gdsc_desc *desc,
 			return PTR_ERR(scs[i]->rsupply);
 	}
 
+	for (i = 0; i < num; i++) {
+		if (!scs[i] || !scs[i]->domain)
+			continue;
+
+		scs[i]->pd_opp = of_get_required_opp_performance_state(dev->of_node, scs[i]->perf_idx);
+		if (scs[i]->pd_opp < 0)
+			return scs[i]->pd_opp;
+
+		scs[i]->pd_dev = dev_pm_domain_attach_by_name(dev, scs[i]->domain);
+		if (IS_ERR(scs[i]->pd_dev)) {
+			ret = PTR_ERR(scs[i]->pd_dev);
+			/* Single domain has been already attached, so reuse dev */
+			if (ret == -EEXIST) {
+				scs[i]->pd_dev = dev;
+			} else {
+				scs[i]->pd_dev = NULL;
+				goto pm_detach;
+			}
+		}
+	}
+
 	data->num_domains = num;
 	for (i = 0; i < num; i++) {
 		if (!scs[i])
@@ -428,6 +468,12 @@ int gdsc_register(struct gdsc_desc *desc,
 	}
 
 	return of_genpd_add_provider_onecell(dev->of_node, data);
+
+pm_detach:
+	for (i = 0; i < num; i++)
+		if (scs[i]->pd_dev)
+			dev_pm_domain_detach(scs[i]->pd_dev, false);
+	return ret;
 }
 
 void gdsc_unregister(struct gdsc_desc *desc)
@@ -443,6 +489,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			continue;
 		if (scs[i]->parent)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
+		if (scs[i]->pd_dev && scs[i]->pd_dev != dev)
+			dev_pm_domain_detach(scs[i]->pd_dev, true);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index bd537438c793..d58575f8f25f 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -57,6 +57,11 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+
+	const char			*domain;
+	unsigned int			perf_idx;
+	struct device			*pd_dev;
+	int				pd_opp;
 };
 
 struct gdsc_desc {
-- 
2.28.0

