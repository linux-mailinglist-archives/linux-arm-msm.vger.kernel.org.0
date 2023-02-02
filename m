Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86855688973
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 23:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjBBWBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 17:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbjBBWBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 17:01:17 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFFE5CD36
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 14:00:53 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nm12-20020a17090b19cc00b0022c2155cc0bso3144538pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 14:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vrP6x4T9y3LBVQTyEpVLcHcjo3vK9avyGJed9Ro+PY=;
        b=fDff1QUaUePyrEO4K8PPJaKVKrS67CDWzshdJihkORr3Ui4KtY4IlqYfEDwINOUrgc
         jcUkc/WY/hV+22kjwpG7NbLjhRLmn6hhUunsDgDto4c42tr1dygTqmITCJav1rljlcNB
         +vzWl29h+6Euy34nzxUXIXoBhcDrFDyAD+Dd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vrP6x4T9y3LBVQTyEpVLcHcjo3vK9avyGJed9Ro+PY=;
        b=f2Pj5vcX9kiO0cxPWalBzU1040mOEmpPnVKH5vwyJ7KulvkdnKqS/x6BogUnEYth7G
         Ht6jwDtp7lFG/LlfrvobYOlaZ5+4lTRTyMlSo02MfI71WfL8f7CM14Kg4h0qmeynVKB1
         36G/QLhFEac00hD+hubSqQGKK2N619OeqWGg6XAvYD0s+EnDCSWfyBNeXTqv4vHZHSUE
         1le07/5b5PTnTXj/Y0KKG/ksV0ZQuAkO0oiqJm7fEN6te0WV5/V+UF8yTLliT++2vki9
         OS/N1BSAuCk9M3poneLkIlWbsox4rweiEquW0UI1sYAXGj9lie/BN3t0GuuNVnsU3p1q
         Mjyw==
X-Gm-Message-State: AO0yUKV/DXkYiEiG8qjkPUUVn9b40pQa94H8Ba0dzeYKXLE2dNnhM4Kg
        97lXYQflYTZIRDeQ02XpcfnqFQ==
X-Google-Smtp-Source: AK7set+0gtbk39rHfzSVgEM302zYU0TbkQDgIf0uMcHrg3ewECuj1/fjtP9RbRAbvJ76kTaZkURYyA==
X-Received: by 2002:a17:902:cf08:b0:194:a6e0:3ba with SMTP id i8-20020a170902cf0800b00194a6e003bamr8169139plg.54.1675375236301;
        Thu, 02 Feb 2023 14:00:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f71:fcf9:d3e0:e9c0])
        by smtp.gmail.com with ESMTPSA id jb21-20020a170903259500b00192fc9e8552sm179629plb.0.2023.02.02.14.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 14:00:35 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     swboyd@chromium.org, mka@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-hw: Fix cpufreq_driver->get() for non-LMH systems
Date:   Thu,  2 Feb 2023 14:00:23 -0800
Message-Id: <20230202140005.1.I4b30aaa027c73372ec4068cc0f0dc665af8b938d@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a sc7180-based Chromebook, when I go to
/sys/devices/system/cpu/cpu0/cpufreq I can see:

  cpuinfo_cur_freq:2995200
  cpuinfo_max_freq:1804800
  scaling_available_frequencies:300000 576000 ... 1708800 1804800
  scaling_cur_freq:1804800
  scaling_max_freq:1804800

As you can see the `cpuinfo_cur_freq` is bogus. It turns out that this
bogus info started showing up as of commit 205f5e984d30 ("cpufreq:
qcom-hw: Fix the frequency returned by cpufreq_driver->get()"). That
commit seems to assume that everyone is on the LMH bandwagon, but
sc7180 isn't.

Let's go back to the old code in the case where LMH isn't used.

Fixes: 205f5e984d30 ("cpufreq: qcom-hw: Fix the frequency returned by cpufreq_driver->get()")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/cpufreq/qcom-cpufreq-hw.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 9505a812d6a1..957cf6bb8c05 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -143,40 +143,42 @@ static unsigned long qcom_lmh_get_throttle_freq(struct qcom_cpufreq_data *data)
 	return lval * xo_rate;
 }
 
-/* Get the current frequency of the CPU (after throttling) */
-static unsigned int qcom_cpufreq_hw_get(unsigned int cpu)
+/* Get the frequency requested by the cpufreq core for the CPU */
+static unsigned int qcom_cpufreq_get_freq(unsigned int cpu)
 {
 	struct qcom_cpufreq_data *data;
+	const struct qcom_cpufreq_soc_data *soc_data;
 	struct cpufreq_policy *policy;
+	unsigned int index;
 
 	policy = cpufreq_cpu_get_raw(cpu);
 	if (!policy)
 		return 0;
 
 	data = policy->driver_data;
+	soc_data = qcom_cpufreq.soc_data;
 
-	return qcom_lmh_get_throttle_freq(data) / HZ_PER_KHZ;
+	index = readl_relaxed(data->base + soc_data->reg_perf_state);
+	index = min(index, LUT_MAX_ENTRIES - 1);
+
+	return policy->freq_table[index].frequency;
 }
 
-/* Get the frequency requested by the cpufreq core for the CPU */
-static unsigned int qcom_cpufreq_get_freq(unsigned int cpu)
+static unsigned int qcom_cpufreq_hw_get(unsigned int cpu)
 {
 	struct qcom_cpufreq_data *data;
-	const struct qcom_cpufreq_soc_data *soc_data;
 	struct cpufreq_policy *policy;
-	unsigned int index;
 
 	policy = cpufreq_cpu_get_raw(cpu);
 	if (!policy)
 		return 0;
 
 	data = policy->driver_data;
-	soc_data = qcom_cpufreq.soc_data;
 
-	index = readl_relaxed(data->base + soc_data->reg_perf_state);
-	index = min(index, LUT_MAX_ENTRIES - 1);
+	if (data->throttle_irq >= 0)
+		return qcom_lmh_get_throttle_freq(data) / HZ_PER_KHZ;
 
-	return policy->freq_table[index].frequency;
+	return qcom_cpufreq_get_freq(cpu);
 }
 
 static unsigned int qcom_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
-- 
2.39.1.519.gcb327c4b5f-goog

