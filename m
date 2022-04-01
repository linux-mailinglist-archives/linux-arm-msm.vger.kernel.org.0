Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D04E4EE8E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Apr 2022 09:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343770AbiDAHQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Apr 2022 03:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343769AbiDAHQY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Apr 2022 03:16:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCF03D49C
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Apr 2022 00:14:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bu29so3328449lfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Apr 2022 00:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=se1WsznpofUY5alulIL6V0fVeQduefquDyJntWc5gYE=;
        b=LpJ+SHKdSKR9knLES20AxuK7StRZ899txeFOxS58+eNYIMsiac+iq8/YBG7su2Bid7
         Rk6vf8s6EJIbwN8hayGSykK7dgWXnmJ/zeQemk94QGS0t/GM+hD3T4sdNnQ/uY/GpLWM
         8XNRl0RGZ/RCOszS/Le33s/9zTLvhpC97sfqWu/DJzokgPDn8htBXNtzCL8DFMV/g/3w
         7ovXNYi81q0lpnG40HqftMxTTJ+l7pSfR9AjkDjWQQB9mz2J3KegFKpeJYqjcg5fY0fm
         nNJWpFHXtdFa8y4nnzdoN0jzbeX17kIYEE6leM8oSXcVXiEhHfTH99a/FBTlxWYQDJ53
         jGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=se1WsznpofUY5alulIL6V0fVeQduefquDyJntWc5gYE=;
        b=opTYQGjr0RavdP0oBwLPdZQRaJpfuYEVZlZpYTGJUlrHFtkQ3IYiPuwrE8RjwTjsHw
         7/Mjd08Bv58dpNX/8sGse2NWSh6jgpjDe7PMsIMOBMHkZNW5bMcsOTW+5jCK00c0wtTk
         zRyrMlvjS+p1fZ0wp/kcrEVjubkU57JwXVrmTs40vP+3sff5fnxwbyNEEcE3VVUUuL2u
         l4N9VJBuGPzz5TM9Bdut5KVZrwUcRDTnTsJ1/79BpYbQy9EgGZKM7r0wrp45V3fGVHru
         nz2WexdO6Ccm0Sifl4w6gqamqcDkWXmcEFyGeuho+D79n1tUYa98HVepRXh1Y+s/Z7oX
         MJEg==
X-Gm-Message-State: AOAM530toAOovikOqy8IJlPpwnsk3dJxUiA7XCyyt3ouMbAD4/ocSWVw
        Wnr5Z64Cx2dYARxehZJWrSD9SA==
X-Google-Smtp-Source: ABdhPJwokTq7YdlJEaAnvN+Wz8DTOqYtf2JPq1DWjcz+2CmIvnuyAxp1efdRIi2v7RK3iQ6JKabqFQ==
X-Received: by 2002:a05:6512:1116:b0:44a:834c:e70e with SMTP id l22-20020a056512111600b0044a834ce70emr12619838lfg.155.1648797271020;
        Fri, 01 Apr 2022 00:14:31 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id x28-20020a19e01c000000b0044a3aca1c39sm152198lfg.255.2022.04.01.00.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 00:14:30 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v2 1/2] cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
Date:   Fri,  1 Apr 2022 10:14:23 +0300
Message-Id: <20220401071424.2869057-2-vladimir.zapolskiy@linaro.org>
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

It's noted that dcvs interrupts are not self-clearing, thus an interrupt
handler runs constantly, which leads to a severe regression in runtime.
To fix the problem an explicit write to clear interrupt register is
required.

Fixes: 275157b367f4 ("cpufreq: qcom-cpufreq-hw: Add dcvs interrupt support")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* added a check for pending interrupt status before its handling,
  thanks to Bjorn for review

 drivers/cpufreq/qcom-cpufreq-hw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index f9d593ff4718..e17413a6f120 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -24,6 +24,8 @@
 #define CLK_HW_DIV			2
 #define LUT_TURBO_IND			1
 
+#define GT_IRQ_STATUS			BIT(2)
+
 #define HZ_PER_KHZ			1000
 
 struct qcom_cpufreq_soc_data {
@@ -31,6 +33,8 @@ struct qcom_cpufreq_soc_data {
 	u32 reg_dcvs_ctrl;
 	u32 reg_freq_lut;
 	u32 reg_volt_lut;
+	u32 reg_intr_clr;
+	u32 reg_intr_status;
 	u32 reg_current_vote;
 	u32 reg_perf_state;
 	u8 lut_row_size;
@@ -345,11 +349,19 @@ static void qcom_lmh_dcvs_poll(struct work_struct *work)
 static irqreturn_t qcom_lmh_dcvs_handle_irq(int irq, void *data)
 {
 	struct qcom_cpufreq_data *c_data = data;
+	u32 val;
+
+	val = readl_relaxed(c_data->base + c_data->soc_data->reg_intr_status);
+	if (!(val & GT_IRQ_STATUS))
+		return IRQ_HANDLED;
 
 	/* Disable interrupt and enable polling */
 	disable_irq_nosync(c_data->throttle_irq);
 	schedule_delayed_work(&c_data->throttle_work, 0);
 
+	writel_relaxed(GT_IRQ_STATUS,
+		       c_data->base + c_data->soc_data->reg_intr_clr);
+
 	return IRQ_HANDLED;
 }
 
@@ -368,6 +380,8 @@ static const struct qcom_cpufreq_soc_data epss_soc_data = {
 	.reg_dcvs_ctrl = 0xb0,
 	.reg_freq_lut = 0x100,
 	.reg_volt_lut = 0x200,
+	.reg_intr_clr = 0x308,
+	.reg_intr_status = 0x30c,
 	.reg_perf_state = 0x320,
 	.lut_row_size = 4,
 };
-- 
2.33.0

