Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58A0C4F8886
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 22:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbiDGUdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 16:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbiDGUdP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 16:33:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD87436177
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 13:18:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p15so11575078lfk.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huurU9WHq5dIUzhYwjsLBcK95YDkjjO/5/wQyYMjeE0=;
        b=kO/JnDUYAxj6xJQ8ecKfBGbwdBTZf0VtsMSfVR4GgCzwqeQAuj/fuMEV1eUPRTTU8m
         fpBcSKb15i6oHcgkLrkb6oXEXSbQwdfXl0pYKhJVZKMB92XHF5041k6usIFUZ4NUHLiB
         Kg+WBvxUfy7ZaLmyzLG7vgfFb9AiEpXtACH79HXnk+0sreU54Ogrc5NQ6aMfrhvxkj0f
         0WrDOt9PPfLJm1HZnumUvZM0TMEBCStdSIMWWpZM66Wq4pYHQe1TGlSsA1TpVZ1z7f8L
         9KoNmrwTA1cOHDDt3ttzbTJB1QhvdmAIx+bSt+6neBgYwoLdhKYvJ6lsPinelzdPhZU/
         IKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=huurU9WHq5dIUzhYwjsLBcK95YDkjjO/5/wQyYMjeE0=;
        b=s00/2NiHkfor2HwsbtP0Y/lSToLCrwaqrJMXI9TerzMsSbTdUNwvf87NdenG+rK125
         MVuRu2CZXyKZSk9JcAd/kr2fvf6ePuFzIaNQa8YLU/Sq3uGPQ3ReazloEpPNplZg230z
         2NXqZgggvXfgFMwUrqbZNDGD8CLCg32seXgaDHpZOlH+ma5Fh/pJAeFIiM1tilEFyeC5
         UxmUSdqouuvAUGlR74WWo4PUmIEGGCU5JOkwzG8ZWyOtak87897+gV+dscJ8hCYhL0qn
         5GUTKsIkSRo2b/dRjRtH6nkLJDQ43CoCFd3otanDy6k+VP18L2FId1ydNG82YyBg2+oL
         4tuQ==
X-Gm-Message-State: AOAM531Ym6eHkFGp2AXtkniAoAh9Fn2Do394+DiLkkhJ36c572BGFURT
        TPcnKpzc9XZL8Twa7end2nt+Gwd9jWxcdUk+
X-Google-Smtp-Source: ABdhPJwNWLdCX26Ydac0jFMKPK9+xiyVwaofEqq42dG1ejfsoS9u924482KEYqhtAjolj85YHmTE5A==
X-Received: by 2002:a05:651c:a07:b0:249:922b:163 with SMTP id k7-20020a05651c0a0700b00249922b0163mr9655748ljq.179.1649362165071;
        Thu, 07 Apr 2022 13:09:25 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id p17-20020a19f111000000b0044a6522f9acsm2251298lfh.135.2022.04.07.13.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 13:09:24 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v3] cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
Date:   Thu,  7 Apr 2022 23:09:19 +0300
Message-Id: <20220407200919.3054189-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's noted that dcvs interrupts are not self-clearing, thus an interrupt
handler runs constantly, which leads to a severe regression in runtime.
To fix the problem an explicit write to clear interrupt register is
required, note that on OSM platforms the register may not be present.

Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v2 to v3:
* split the change from the series and returned to v1 state of the fix
  by removing a minor optimization
* added a check for non-zero reg_intr_clr value before writel

Changes from v1 to v2:
* added a check for pending interrupt status before its handling

 drivers/cpufreq/qcom-cpufreq-hw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 0ec18e1589dc..0253731d6d25 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -24,6 +24,8 @@
 #define CLK_HW_DIV			2
 #define LUT_TURBO_IND			1
 
+#define GT_IRQ_STATUS			BIT(2)
+
 #define HZ_PER_KHZ			1000
 
 struct qcom_cpufreq_soc_data {
@@ -32,6 +34,7 @@ struct qcom_cpufreq_soc_data {
 	u32 reg_dcvs_ctrl;
 	u32 reg_freq_lut;
 	u32 reg_volt_lut;
+	u32 reg_intr_clr;
 	u32 reg_current_vote;
 	u32 reg_perf_state;
 	u8 lut_row_size;
@@ -360,6 +363,10 @@ static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
 	disable_irq_nosync(c_data->throttle_irq);
 	schedule_delayed_work(&c_data->throttle_work, 0);
 
+	if (c_data->soc_data->reg_intr_clr)
+		writel_relaxed(GT_IRQ_STATUS,
+			       c_data->base + c_data->soc_data->reg_intr_clr);
+
 	return IRQ_HANDLED;
 }
 
@@ -379,6 +386,7 @@ static const struct qcom_cpufreq_soc_data epss_soc_data = {
 	.reg_dcvs_ctrl = 0xb0,
 	.reg_freq_lut = 0x100,
 	.reg_volt_lut = 0x200,
+	.reg_intr_clr = 0x308,
 	.reg_perf_state = 0x320,
 	.lut_row_size = 4,
 };
-- 
2.33.0

