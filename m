Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7095A585988
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jul 2022 11:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiG3JSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jul 2022 05:18:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233690AbiG3JSb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jul 2022 05:18:31 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14E92422D9;
        Sat, 30 Jul 2022 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659172710; x=1690708710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2VNA7H6O+24EWq4bB5A9yXLWrY+TfCZIiju8MCV13SQ=;
  b=ZEG9e+wQdp3T/HtLS4kYDYVtCwKsWbXZPEUCeNBLW2uV63AH61YrHJYZ
   PxvjPKehSSpYL1pKv6W3cGkqmnIRsP84z14BmLz1RpDAPvN3gH39q2JvO
   426qXDjEfeka2oBbgZ80pNC76G631BlwzqWvXh0UcVrmf/2wC/TJ/KEEb
   4=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 30 Jul 2022 02:18:29 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2022 02:18:29 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:18:29 -0700
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 30 Jul 2022 02:18:24 -0700
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Stephen Boyd" <swboyd@chromium.org>
CC:     Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] clk: qcom: gdsc: Add a reset op to poll gdsc collapse
Date:   Sat, 30 Jul 2022 14:47:43 +0530
Message-ID: <20220730144713.4.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a reset op compatible function to poll for gdsc collapse.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
 drivers/clk/qcom/gdsc.h |  7 +++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 44520ef..0c9f648 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -17,6 +17,7 @@
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
 #include "gdsc.h"
+#include "reset.h"
 
 #define PWR_ON_MASK		BIT(31)
 #define EN_REST_WAIT_MASK	GENMASK_ULL(23, 20)
@@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
 	return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
 }
 
-static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
+static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
+		s64 timeout_us, unsigned int interval_ms)
 {
 	ktime_t start;
 
@@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
 	do {
 		if (gdsc_check_status(sc, status))
 			return 0;
-	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
+		if (interval_ms)
+			msleep(interval_ms);
+	} while (ktime_us_delta(ktime_get(), start) < timeout_us);
 
 	if (gdsc_check_status(sc, status))
 		return 0;
@@ -172,7 +176,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
 		udelay(1);
 	}
 
-	ret = gdsc_poll_status(sc, status);
+	ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
 	if (!ret && status == GDSC_OFF && sc->rsupply) {
@@ -343,7 +347,7 @@ static int _gdsc_disable(struct gdsc *sc)
 		 */
 		udelay(1);
 
-		ret = gdsc_poll_status(sc, GDSC_ON);
+		ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
 		if (ret)
 			return ret;
 	}
@@ -565,3 +569,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
+
+int gdsc_wait_for_collapse(const struct qcom_reset_map *map)
+{
+	struct gdsc *sc = map->priv;
+	int ret;
+
+	ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
+	WARN(ret, "%s status stuck at 'on'", sc->pd.name);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index ad313d7..b76b6b6 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -12,6 +12,7 @@
 struct regmap;
 struct regulator;
 struct reset_controller_dev;
+struct qcom_reset_map;
 
 /**
  * struct gdsc - Globally Distributed Switch Controller
@@ -79,6 +80,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
 		  struct regmap *);
 void gdsc_unregister(struct gdsc_desc *desc);
 int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
+int gdsc_wait_for_collapse(const struct qcom_reset_map *map);
 #else
 static inline int gdsc_register(struct gdsc_desc *desc,
 				struct reset_controller_dev *rcdev,
@@ -88,5 +90,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
 }
 
 static inline void gdsc_unregister(struct gdsc_desc *desc) {};
+
+static int gdsc_wait_for_collapse(const struct qcom_reset_map *map)
+{
+	return  -ENOSYS;
+}
 #endif /* CONFIG_QCOM_GDSC */
 #endif /* __QCOM_GDSC_H__ */
-- 
2.7.4

