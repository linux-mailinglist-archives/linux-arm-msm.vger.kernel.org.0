Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D455328D75
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 20:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240985AbhCATLh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 14:11:37 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30749 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240715AbhCATGV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 14:06:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614625552; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8dusOMR2FioRvirR8Z2x+dUBqtTvzGGg36FllLPNcGY=; b=EOpG8xwzRgo+rDpRt2N0ZTVPCGlVbCze5PlXHr6lSedIwnUpmWFl9GS+Zf6Pb2u6uyMjx85e
 lW48Qy8xGEsmLSuXVO9XTMAALv643vwNhunM8HpA75Zp5rd+yJvIyYDob+PUop823uBT8WhB
 rJ9ILfvyWBOpvYGqOoHDg7hNYrY=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 603d3ae61e1364c09d1b115c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 19:05:10
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1B1FEC433C6; Mon,  1 Mar 2021 19:05:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0C42C433CA;
        Mon,  1 Mar 2021 19:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0C42C433CA
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
        Leo Yan <leo.yan@linaro.org>
Cc:     Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2 3/4] coresight: etm4x: Add support to exclude kernel mode tracing
Date:   Tue,  2 Mar 2021 00:34:17 +0530
Message-Id: <defd34e2a8744fc93404abdaad2d429fa3f69850.1614624041.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On production systems with ETMs enabled, it is preferred to exclude
kernel mode(NS EL1) tracing for security concerns and support only
userspace(NS EL0) tracing. Perf subsystem interface uses the newly
introduced kernel config CONFIG_EXCLUDE_KERNEL_PMU_TRACE to exclude
kernel mode tracing, but there is an additional interface via sysfs
for ETMs which also needs to be handled to exclude kernel
mode tracing. So we use this same generic kernel config to handle
the sysfs mode of tracing. This config is disabled by default and
would not affect the current configuration which has both kernel and
userspace tracing enabled by default.

Tested-by: Denis Nikitin <denik@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 6 +++++-
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 15016f757828..dbd6b96f3a78 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1235,12 +1235,16 @@ static void etm4_set_default(struct etmv4_config *config)
 		return;
 
 	/*
-	 * Make default initialisation trace everything
+	 * Make default initialisation trace everything when
+	 * CONFIG_EXCLUDE_KERNEL_PMU_TRACE is disabled.
 	 *
 	 * This is done by a minimum default config sufficient to enable
 	 * full instruction trace - with a default filter for trace all
 	 * achieved by having no filtering.
 	 */
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE))
+		config->mode |= ETM_MODE_EXCL_KERN;
+
 	etm4_set_default_config(config);
 	etm4_set_default_filter(config);
 }
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 0995a10790f4..78ba2a0888fc 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -296,6 +296,12 @@ static ssize_t mode_store(struct device *dev,
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE) && (!(val & ETM_MODE_EXCL_KERN))) {
+		dev_warn(dev,
+			"Kernel mode tracing is not allowed, check your kernel config\n");
+		return -EACCES;
+	}
+
 	spin_lock(&drvdata->spinlock);
 	config->mode = val & ETMv4_MODE_ALL;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

