Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7594EE8E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 09:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343740AbiDAHQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 03:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242968AbiDAHQW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 03:16:22 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C101436E03
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 00:14:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o16so2735594ljp.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tGeNl+xMbN6e3y7sevLAkMzx2EbUUwjt8wbP2wC15+c=;
        b=rW6PzAxGcHKiwiTur4l9ABiVdyGIFGcDNw2/6ZbY50AMDTtvy7nxzlO9sylUnKN9LV
         p3lfSpgJRE1AJ0D85s1oCADe5UcAGF9+lSpR9SZGMza81I6q8dI2QGba5c+qi8eN3p4e
         oG63+dm4hwa7XDuSVUF5pjBAyMCQ9oWlOEG+NAW4sSBSCHuPYy2qO4k84rwzcPhQ4yUi
         s+Qz2U5Gjw1bTwZup+z+JCwNy/cxPq2j+AsnHKQqu2OBFUKlAVpmo1Esynh8RmZHwm4u
         QgMb5ZG+dEhSEY1gJy7qRgmxgq85xw3YB1bmYh2K2VqM1Qk7nKD4nUPvv4Z9rAmCMgm8
         S/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tGeNl+xMbN6e3y7sevLAkMzx2EbUUwjt8wbP2wC15+c=;
        b=VAjApGuQz12ib7103lQLf3+POhnmz9e4sblBd+mIPGKCpxLNk6bc6yp3VnDsvPJ9eW
         csGOIsMTlEpzIPpZ0ZcQQFa9nVbM86aGL7ht3xE63QQwczZUiQlQN2b6V7JBH+njLn6q
         Kbojo+EnLBxvROW7AKZADGCSwufN1Upi73XGUEcuMDkhvfUjGV3/UDZxTVkW1uH9ZRhF
         PA6vH67stnR3EVWvQ2FDxu2BZwDCqwRcHrzHG72uz9/CMITKNIHgV82OtoEniGcetR93
         GdO7XocBILRBxoM0Idqp6SbfVTc0AKJLroQYv+qLiY4pPRAryxR1sCty2mZGrBp8e5wK
         02OA==
X-Gm-Message-State: AOAM532MDnRVg93ViGPPjOA4xMSl4czMPmmoTOXkEuU9NVkUEcZvER1L
        Lo3FqUIkk7MOXKs+kPBX+WzWkg==
X-Google-Smtp-Source: ABdhPJwX1IK/r0hK2qHoyP79yr3/YSAlRT5oaBZ4y9G5flj00Oy4XFjOI3xxRVTuGcgngOb4i30DOQ==
X-Received: by 2002:a05:651c:17a1:b0:247:dc02:69b9 with SMTP id bn33-20020a05651c17a100b00247dc0269b9mr12243134ljb.437.1648797271942;
        Fri, 01 Apr 2022 00:14:31 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id x28-20020a19e01c000000b0044a3aca1c39sm152198lfg.255.2022.04.01.00.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 00:14:31 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 2/2] cpufreq: qcom-cpufreq-hw: Fix throttle frequency value on EPSS platforms
Date:   Fri,  1 Apr 2022 10:14:24 +0300
Message-Id: <20220401071424.2869057-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220401071424.2869057-1-vladimir.zapolskiy@linaro.org>
References: <20220401071424.2869057-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On QCOM platforms with EPSS flavour of cpufreq IP a throttled frequency is
obtained from another register REG_DOMAIN_STATE, thus the helper function
qcom_lmh_get_throttle_freq() should be modified accordingly, as for now
it returns gibberish since .reg_current_vote is unset for EPSS hardware.

To exclude a hardcoded magic number 19200 it is replaced by "xo" clock rate
in KHz.

Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* added a comment about a replaced 19200 number in the code, thanks
  to Bjorn for suggestion and review.

 drivers/cpufreq/qcom-cpufreq-hw.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index e17413a6f120..d5ede769b09a 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -30,6 +30,7 @@
 
 struct qcom_cpufreq_soc_data {
 	u32 reg_enable;
+	u32 reg_domain_state;
 	u32 reg_dcvs_ctrl;
 	u32 reg_freq_lut;
 	u32 reg_volt_lut;
@@ -284,11 +285,16 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
 	}
 }
 
-static unsigned int qcom_lmh_get_throttle_freq(struct qcom_cpufreq_data *data)
+static unsigned long qcom_lmh_get_throttle_freq(struct qcom_cpufreq_data *data)
 {
-	unsigned int val = readl_relaxed(data->base + data->soc_data->reg_current_vote);
+	unsigned int lval;
 
-	return (val & 0x3FF) * 19200;
+	if (data->soc_data->reg_current_vote)
+		lval = readl_relaxed(data->base + data->soc_data->reg_current_vote) & 0x3ff;
+	else
+		lval = readl_relaxed(data->base + data->soc_data->reg_domain_state) & 0xff;
+
+	return lval * xo_rate;
 }
 
 static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
@@ -298,14 +304,12 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
 	struct device *dev = get_cpu_device(cpu);
 	unsigned long freq_hz, throttled_freq;
 	struct dev_pm_opp *opp;
-	unsigned int freq;
 
 	/*
 	 * Get the h/w throttled frequency, normalize it using the
 	 * registered opp table and use it to calculate thermal pressure.
 	 */
-	freq = qcom_lmh_get_throttle_freq(data);
-	freq_hz = freq * HZ_PER_KHZ;
+	freq_hz = qcom_lmh_get_throttle_freq(data);
 
 	opp = dev_pm_opp_find_freq_floor(dev, &freq_hz);
 	if (IS_ERR(opp) && PTR_ERR(opp) == -ERANGE)
@@ -377,6 +381,7 @@ static const struct qcom_cpufreq_soc_data qcom_soc_data = {
 
 static const struct qcom_cpufreq_soc_data epss_soc_data = {
 	.reg_enable = 0x0,
+	.reg_domain_state = 0x20,
 	.reg_dcvs_ctrl = 0xb0,
 	.reg_freq_lut = 0x100,
 	.reg_volt_lut = 0x200,
-- 
2.33.0

