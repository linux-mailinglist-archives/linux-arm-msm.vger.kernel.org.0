Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A89269FBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgIOH1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgIOHY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:24:56 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA4AC061354
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:49 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z17so1523805pgc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZH8HXU7SC1tFN7UNiQ/tfF4dLOJ73Vyel3dCxDeEf2w=;
        b=zd88twPMnxcgsO7ROS0hnIWeioJKbqZm4rZ8Iwn6J97VziZW6557H4ZKtphwDixN4G
         003H3FP07SC9zq33wGNpB0m7wITlpG19DmWuwCdL5nOjPbs69EfjLKXjZoQlEtMb0msA
         K9QX2ZyvGaoiM1YCUFwsDIC/7nMT3SNbrlnDn3Q+SlcsuA6H900bitsn5SpZOs39NMF1
         u7hW78ZrU4la+OdwW0cFLNr5l9WUTabQbn+zMqaY48APE7RHH+5ZRAxx281hzAmVSRLp
         KyLQVPJoE5JwdHZwVT2AXSWghFU18nsW53Jm8LiyoQcpuWb5eM06x8Ac23bDh+CvednY
         xf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZH8HXU7SC1tFN7UNiQ/tfF4dLOJ73Vyel3dCxDeEf2w=;
        b=ZVsmJaFkcxEjF61RWTCDozrzzOwfyjtKTlsul0dwsqPRWeyHqZA1EZ4OIE+Gs5VqId
         bzTbnl1NJeFRULlTO+2yKrdZG3DwPdoIzheFECKGa+DvAbv5FsQ3OvFpcbyash9P32E5
         n16ZgjGhU4fOxLLsTiK/e8xxgBipf4qNemBYF/BL9TlzNeFVK9CnOl1HuVyo0tmSGyKy
         HWrjlGJL1BlZaRIQQcl90zSwP6L4K+w4Q+cH/QSu6iIjEnq+hZ7JIpy7+KUlpwyN9LQY
         sfgAQg8HClsX29BX/8sUBIUvrD4NI+fuh2DShbZZ39GqXJGmMtkuvOcLgOvLluLxvs+o
         34vA==
X-Gm-Message-State: AOAM530n4WDupiLZGmCmZXX634h0D6kOYWPjGIX4YOO/TDHjwZy8kgtN
        QYk2KxETm3RdzTDaQa71Ftak
X-Google-Smtp-Source: ABdhPJyFRSV2yr/yncH+ZVpG9SFciIQWqpWWAoPLBbz9QoRzM1y67LU0o0pp6xVrIuWkHeGg9HdwmQ==
X-Received: by 2002:a63:2204:: with SMTP id i4mr13652576pgi.107.1600154688592;
        Tue, 15 Sep 2020 00:24:48 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m24sm10701501pgn.44.2020.09.15.00.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 00:24:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/5] cpufreq: qcom-hw: Use devm_platform_ioremap_resource() to simplify code
Date:   Tue, 15 Sep 2020 12:54:21 +0530
Message-Id: <20200915072423.18437-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
References: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_platform_ioremap_resource() is the combination of
platform_get_resource() and devm_ioremap_resource(). Hence, use it to
simplify the code a bit.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ccea34f61152..8a303783927f 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -244,7 +244,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	struct of_phandle_args args;
 	struct device_node *cpu_np;
 	struct device *cpu_dev;
-	struct resource *res;
 	void __iomem *base;
 	int ret, index;
 
@@ -267,13 +266,9 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 	index = args.args[0];
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	if (!res)
-		return -ENODEV;
-
-	base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!base)
-		return -ENOMEM;
+	base = devm_platform_ioremap_resource(pdev, index);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	/* HW should be in enabled state to proceed */
 	if (!(readl_relaxed(base + REG_ENABLE) & 0x1)) {
-- 
2.17.1

