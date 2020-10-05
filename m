Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820E62842BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 00:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgJEW7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgJEW7Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 18:59:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB957C0613A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2020 15:59:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h20so2053346lji.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2020 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQxLnnxGSQYN0LXdB0y/fyR2HctEcybyvcWWTrR4+38=;
        b=qgYD1v6QtTAS7dzFOJQOJLWWUbN7S3CFtgSpXkY0ous3l2D7gXrHcsxenH5rD8Q+3Y
         gq4mTqqv6bkB69PxVNZlEMH6DtV0FtmvKUalU1TVr3Qx5h17iLN0zRJ0X0kjO3QT9+BS
         E5xz+2146q4GVICFUz7EIq8n7ebYT0YTuzKe1C5N0FE6+jyXM2gFd6s1w3l53/R4eoK3
         1JcZtrEcuaC/l3hT4HV4C/1aVW1ZIPABhuo/Fee6hXVAI/R4MIUis61pV8uY9qWxO0gF
         SywJG9ZQgPYBxgNoXwbnmV94L2BL2kfS/HKFOZ0qCuT5zoRT/FzRO4AHaWemenPrzCZp
         zvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQxLnnxGSQYN0LXdB0y/fyR2HctEcybyvcWWTrR4+38=;
        b=b8BIcTD6w75gLswkAfWouPRUIPE6zqwLcIEXEjWm/LBZoJLpPra9pA7iDOaBgApVE/
         fEaiT0+8z5ppuXYQxwEslR9ZFEkxJ+G+Re8HBIKCqQGthOPQImOQGJuz4H9TYzJLifS/
         x6fMtJSnS5qX5gbT1X/j7p8DsViCcURkIPq8LhPyJOvcQQ/CUan2yBTVC2GFYW1VmqJW
         QKzeimSKoNe/nENEy//Efp2+h8W7sPzj2zzJwaqVC4kyDUSFgq+B16TivbsT2E4FikVX
         Kj7h0yC91yDhEJPlKYmd3gTsL1QbzZEFh7BF5uaFir1RmCGwwq4Sb03WuKP7VHyQOm2U
         babA==
X-Gm-Message-State: AOAM533upLGKkWoE8yWwsinOkiQQLodnQ3E+50LBk5y31Sfc2CfMRo/p
        TojWFaEWO3neYzyyhS8ctc5Zpw==
X-Google-Smtp-Source: ABdhPJxtGJJCgzJRDJ39P6T+RXIp0P1ZqaYtYLUe1lczJKEG4yNBLFfj0+XPjU+J5+2ZJdt2lVow3Q==
X-Received: by 2002:a2e:b4c8:: with SMTP id r8mr676818ljm.37.1601938763332;
        Mon, 05 Oct 2020 15:59:23 -0700 (PDT)
Received: from eriador.lan ([188.162.64.219])
        by smtp.gmail.com with ESMTPSA id x4sm353831ljc.80.2020.10.05.15.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:59:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 2/3] clk: qcom: gdsc: enable external switchable power domain
Date:   Tue,  6 Oct 2020 01:59:13 +0300
Message-Id: <20201005225914.315852-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 MDSS_GDSC (and respective dispcc clocks) are children of MMCX
power domain. MMCX needs to be enabled to be able to access GDSC
registers and to enable display clocks. Use dev_pm/opp to enable
corresponding power domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 56 ++++++++++++++++++++++++++++++++++++++---
 drivers/clk/qcom/gdsc.h |  5 ++++
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index bfc4ac02f9ea..c9e1619074f8 100644
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
 
+static int gdsc_toggle_supply_on(struct gdsc *sc)
+{
+	if (sc->rsupply)
+		return regulator_enable(sc->rsupply);
+	if (sc->pd_dev)
+		return dev_pm_genpd_set_performance_state(sc->pd_dev, sc->pd_opp);
+	return 0;
+}
+
+static int gdsc_toggle_supply_off(struct gdsc *sc)
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
+		ret = gdsc_toggle_supply_on(sc);
 		if (ret < 0)
 			return ret;
 	}
@@ -153,8 +172,8 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
-	if (!ret && status == GDSC_OFF && sc->rsupply) {
-		ret = regulator_disable(sc->rsupply);
+	if (!ret && status == GDSC_OFF) {
+		ret = gdsc_toggle_supply_off(sc);
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
+		if (scs[i]->pd_dev && scs[i]->pd_dev != dev)
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

