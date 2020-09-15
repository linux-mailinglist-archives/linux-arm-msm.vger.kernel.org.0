Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02971269FBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgIOH1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbgIOHY5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:24:57 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6CDC0612F2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:57 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j34so1506549pgi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oBilyFEf2/Z1J1tQYW2nP7ZczzAuGj9cFol63jX5QX4=;
        b=c4p1+4NV8NlRzHFAx/uaoR2of/ipTcrRTAY9oJ5/Unn+O8Y3rY9sp4v8IGjx++3I4r
         SQE/jrzc3GvToZgsexffViU0bU4gxhB4jn8e7r8Wgj6WZONFg9rHG7/EWTiD5LSQL1cN
         sx7kAdf6ra1WKzU3T+FAT1AIJ/Gvb9jto+75QuGdepiFVzW7cxVS9a/m00DapVflZYfZ
         pGXwNmTCmgzVEdYWTrQRc9ATICYARqOHfNurbxl7hAMXgD7EXjDO/M1pime+K5lzNEjQ
         MsU2Whc+HCUIO9vMhpGT+tyPqd1m0tPAr9Jh985YurvzyyIr5rfD426v1/6+jMW+TeXp
         QSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oBilyFEf2/Z1J1tQYW2nP7ZczzAuGj9cFol63jX5QX4=;
        b=ACya/awBoxcZnnPBKp4gE5BX1X13yVCK5SN2ocbic3HsqED9aJpS2nX3iQr8pUt8mQ
         f34Ax9ipVXht8rXYn5j0H0hkSyk01YKsFxcS6cBZMNMcg6wJiGyGKExjubV3Q2AYy7Z0
         o8R57qdkKScnLkHKAAeRkwEGnXyNz/NcrarWrfOz5SzAysjlXv7K9oIy1tPLhtCuV7rL
         jQcy/V9Y2HNDaDmAUhUrT8OEQOVeEdGMka5XUrQXLyY42AYT9vdb7+wEyzIGj0ygjmdD
         3mGLwiZjJkPjYPNlUqjTkFClt54gFomIFXJXm/dcDQFDbgQyKZuXCDQdDiIHoT3hJKIw
         F55w==
X-Gm-Message-State: AOAM530ZNlUSfyH7zUY7KMiiNQxLgz5CPcaAvt9z7IdBuF2k9Ncvhoqb
        zWqelmZkpRVuUZMiR+cn0w1m
X-Google-Smtp-Source: ABdhPJzKMwHn18/aJgA+m+x05Z3G9Ii3hfInh23MjGpnxaaAD9SIavHD2LgB0dnAdxapI9FuMenKoA==
X-Received: by 2002:a62:4e8a:0:b029:13c:1611:653b with SMTP id c132-20020a624e8a0000b029013c1611653bmr16134936pfb.13.1600154696590;
        Tue, 15 Sep 2020 00:24:56 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m24sm10701501pgn.44.2020.09.15.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 00:24:56 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 5/5] cpufreq: qcom-hw: Add cpufreq support for SM8250 SoC
Date:   Tue, 15 Sep 2020 12:54:23 +0530
Message-Id: <20200915072423.18437-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
References: <20200915072423.18437-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 SoC uses EPSS block for carrying out the cpufreq duties. Hence, add
support for it in the driver with relevant dev data.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Amit Kucheria <amitk@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index e3c46984a037..c485be839172 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -256,8 +256,17 @@ static const struct qcom_cpufreq_soc_data qcom_soc_data = {
 	.lut_row_size = 32,
 };
 
+static const struct qcom_cpufreq_soc_data epss_soc_data = {
+	.reg_enable = 0x0,
+	.reg_freq_lut = 0x100,
+	.reg_volt_lut = 0x200,
+	.reg_perf_state = 0x320,
+	.lut_row_size = 4,
+};
+
 static const struct of_device_id qcom_cpufreq_hw_match[] = {
 	{ .compatible = "qcom,cpufreq-hw", .data = &qcom_soc_data },
+	{ .compatible = "qcom,cpufreq-epss", .data = &epss_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);
-- 
2.17.1

