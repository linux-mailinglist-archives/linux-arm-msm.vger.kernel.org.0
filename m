Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFAD5BF736
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 09:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiIUHLk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Sep 2022 03:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbiIUHLG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Sep 2022 03:11:06 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C128305A
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:10:59 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id u69so5060247pgd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Sep 2022 00:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=GmBYAuZT3UkYQ0amM6hXETgJRs/yrsroazuSEnOCz/A=;
        b=x70B1DnEkY19F7U3l13W5RE7SVQdPaGCUny/+45RG7C4bj49tMGHaYCau+eLCVFpO8
         Y14aOVc5aZGJTfJuV6QVbDCKDLCfimtpR4uNCRaB6vHqQDuRlQqW6ESQaXBmQWBRsEya
         gUjDjUQTHwUu7uxm/JonljBYtAk7Sz/NHSE/QsX6dOaCTRNkddT2FyrsXVxxb7FGiWMV
         QBqFX90Z7fX1ZZ69ItqQsKm6YjzON43wZcEyFdQkEWLYhdYXXgxporCsx3mi0SzHF/DT
         l4dL4joj8av3MAZ/qTydEVsBIOLy7geFw8fZjofkMo+krbD1smW5V4KrFi/7vtJLMZM6
         IZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=GmBYAuZT3UkYQ0amM6hXETgJRs/yrsroazuSEnOCz/A=;
        b=vE+jXstzDAC8y9vXR/ptYp2jiq5jjBQj6U9ORWDDF3SOMC1HVyh1lbTz2qBenbYl5F
         dni6wSF0ZULljvopKxTNRe36MxlDz2z1BeiY8kOPWg6rvUvgrU/EkV91D0U7AXtUOTJA
         gJp0TPNOB5sTm02svaHZ9jIu9169uG6AFxwOmUKk6bH5qVVyWxmCa+GwK7/OZa+STaqa
         QqS+hC0cP64miZ5Mp9btHfoti3XnIVY57tBOQ6bAyxxmIsDKCIyc1spIXON83QA5ydbQ
         VqL/iUx8i0j5b5vBw0Ad3hsRnJBQT6rNVFuxReuXdkgMsSmisvceAKTXgybwRVYkZzY8
         G8aQ==
X-Gm-Message-State: ACrzQf2vp4RX3chC9JWNnGmNNYpoztOMEy6zyVptbHROS0RLl2DTan+w
        c7UuXR3EEURHkDP7SJyksxF7/vJ1Y29udw==
X-Google-Smtp-Source: AMsMyM7z35WUVyMkD66TRjI+260b1lLsLFL41qgp2UvPZru59JOz0Xt8+tw/Jy2pNNMyeHS287uVLA==
X-Received: by 2002:a05:6a00:1ad0:b0:545:b61b:fe7 with SMTP id f16-20020a056a001ad000b00545b61b0fe7mr27079571pfv.25.1663744258613;
        Wed, 21 Sep 2022 00:10:58 -0700 (PDT)
Received: from localhost ([122.171.20.238])
        by smtp.gmail.com with ESMTPSA id b130-20020a621b88000000b0053e468a78a8sm1227692pfb.158.2022.09.21.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 00:10:57 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "v5 . 18+" <stable@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-cpufreq-hw: Fix uninitialized throttled_freq warning
Date:   Wed, 21 Sep 2022 12:40:51 +0530
Message-Id: <8342b10a2716ec267ab89ea827f851b78b68470a.1663744088.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commit 6240aaad75e1 was supposed to drop the reference count to the OPP,
instead it avoided more stuff if the OPP isn't found. This isn't
entirely correct. We already have a frequency value available, we just
couldn't align it with an OPP in case of IS_ERR(opp).

Lets continue with updating thermal pressure, etc, even if we aren't
able to find an OPP here.

This fixes warning generated by the 'smatch' tool.

Fixes: 6240aaad75e1 ("cpufreq: qcom-hw: fix the opp entries refcounting")
Cc: v5.18+ <stable@vger.kernel.org> # v5.18+
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index d5ef3c66c762..bb32659820ce 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -316,14 +316,14 @@ static void qcom_lmh_dcvs_notify(struct qcom_cpufreq_data *data)
 	if (IS_ERR(opp)) {
 		dev_warn(dev, "Can't find the OPP for throttling: %pe!\n", opp);
 	} else {
-		throttled_freq = freq_hz / HZ_PER_KHZ;
-
-		/* Update thermal pressure (the boost frequencies are accepted) */
-		arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
-
 		dev_pm_opp_put(opp);
 	}
 
+	throttled_freq = freq_hz / HZ_PER_KHZ;
+
+	/* Update thermal pressure (the boost frequencies are accepted) */
+	arch_update_thermal_pressure(policy->related_cpus, throttled_freq);
+
 	/*
 	 * In the unlikely case policy is unregistered do not enable
 	 * polling or h/w interrupt
-- 
2.31.1.272.g89b43f80a514

