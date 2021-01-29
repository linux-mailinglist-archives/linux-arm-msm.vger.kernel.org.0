Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0BC308D1B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 20:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbhA2TIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 14:08:45 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:60044 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhA2TG6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 14:06:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611947193; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7vMq+j0bLCzEeUJ30r82syZD6LFTIUQzve2rWEp2Ea0=; b=BaoJP0agEYQ6lGlgvJNcWempTRUPniKnGKYokDcVrP3xZIosOF6jTNALSx2z+hw8wnO6KpTc
 o4KoJMKuE43q2VOYaQ/pU6pjtSF8Kw4J2KhDYvytUkfmbgRQaPz92ETtt4oanRqDro67UkQZ
 0aT3p3mws4RltD0CjSLXqx8YfAA=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60145c9ef71e8b9934a9c292 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 19:06:06
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 68AA0C433CA; Fri, 29 Jan 2021 19:06:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84ED2C43462;
        Fri, 29 Jan 2021 19:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84ED2C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Leo Yan <leo.yan@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 4/4] coresight: etm3x: Add support to exclude kernel mode tracing
Date:   Sat, 30 Jan 2021 00:35:13 +0530
Message-Id: <da8cef63e6edd48fc958101a2f5f62f37e65284b.1611909025.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On production systems with ETMs enabled, it is preferred to exclude
kernel mode(NS EL1) tracing for security concerns and support only
userspace(NS EL0) tracing. Perf subsystem interface for ETMs use
the newly introduced kernel config CONFIG_EXCLUDE_KERNEL_HW_ITRACE
to exclude kernel mode tracing, but there is an additional interface
via sysfs for ETMs which also needs to be handled to exclude kernel
mode tracing. So we use this same generic kernel config to handle
the sysfs mode of tracing. This config is disabled by default and
would not affect the current configuration which has both kernel and
userspace tracing enabled by default.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c  | 11 +++++++++++
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 5bf5a5a4ce6d..4da3bfa66b70 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -195,6 +195,9 @@ void etm_set_default(struct etm_config *config)
 	if (WARN_ON_ONCE(!config))
 		return;
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE))
+		config->mode |= ETM_MODE_EXCL_KERN;
+
 	/*
 	 * Taken verbatim from the TRM:
 	 *
@@ -239,6 +242,7 @@ void etm_set_default(struct etm_config *config)
 void etm_config_trace_mode(struct etm_config *config)
 {
 	u32 flags, mode;
+	struct etm_drvdata *drvdata = container_of(config, struct etm_drvdata, config);
 
 	mode = config->mode;
 
@@ -248,6 +252,13 @@ void etm_config_trace_mode(struct etm_config *config)
 	if (mode == (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER))
 		return;
 
+	if (!(mode & ETM_MODE_EXCL_KERN) && IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE)) {
+		dev_err(&drvdata->csdev->dev,
+			"Kernel mode tracing is not allowed, check your kernel config\n");
+		config->mode |= ETM_MODE_EXCL_KERN;
+		return;
+	}
+
 	/* nothing to do if neither flags are set */
 	if (!(mode & ETM_MODE_EXCL_KERN) && !(mode & ETM_MODE_EXCL_USER))
 		return;
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index e8c7649f123e..26642dafddbb 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -164,7 +164,8 @@ static ssize_t mode_store(struct device *dev,
 	else
 		config->ctrl &= ~ETMCR_RETURN_STACK;
 
-	if (config->mode & (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER))
+	if ((config->mode & (ETM_MODE_EXCL_KERN | ETM_MODE_EXCL_USER)) ||
+	    IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE))
 		etm_config_trace_mode(config);
 
 	spin_unlock(&drvdata->spinlock);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

