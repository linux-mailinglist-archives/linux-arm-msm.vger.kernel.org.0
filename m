Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1171328D6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 20:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238176AbhCATLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 14:11:05 -0500
Received: from z11.mailgun.us ([104.130.96.11]:24343 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235067AbhCATFy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 14:05:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614625530; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ba6OQaTorWDoty4vE97fErAm92Zsz5cMQKE02H+Mmlk=; b=sMOZfZG8q/hkP4gZMtBm3ZfmYXbs99KRIF4fonSYiPSS9AmlmgjgSkq3DDuHipE11JhZgdrj
 XGFpI+4+qo4607VkLy4Ywe28MZ6hvcilB4WRyOR9gbeZsaNqCOfOscNBjlp07vony32FX06k
 Bgl9ZCUvQ7jYwh33G/qF7Ev2ZUc=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 603d3aee1d4da3b75d0a4386 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 19:05:18
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C110CC433CA; Mon,  1 Mar 2021 19:05:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6EC70C433C6;
        Mon,  1 Mar 2021 19:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6EC70C433C6
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
Subject: [PATCHv2 4/4] coresight: etm3x: Add support to exclude kernel mode tracing
Date:   Tue,  2 Mar 2021 00:34:18 +0530
Message-Id: <0b165b2608eed1a61240539f4b812bd80b6ad1bd.1614624041.git.saiprakash.ranjan@codeaurora.org>
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
kernel mode tracing, but there is an additional interface
via sysfs for ETMs which also needs to be handled to exclude kernel
mode tracing. So we use this same generic kernel config to handle
the sysfs mode of tracing. This config is disabled by default and
would not affect the current configuration which has both kernel and
userspace tracing enabled by default.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c  | 3 +++
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index cf64ce73a741..d94f6b01ca09 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -195,6 +195,9 @@ void etm_set_default(struct etm_config *config)
 	if (WARN_ON_ONCE(!config))
 		return;
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE))
+		config->mode |= ETM_MODE_EXCL_KERN;
+
 	/*
 	 * Taken verbatim from the TRM:
 	 *
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index e8c7649f123e..f522fc2e01b3 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -116,6 +116,12 @@ static ssize_t mode_store(struct device *dev,
 	if (ret)
 		return ret;
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE) && (!(val & ETM_MODE_EXCL_KERN))) {
+		dev_warn(dev,
+			"Kernel mode tracing is not allowed, check your kernel config\n");
+		return -EACCES;
+	}
+
 	spin_lock(&drvdata->spinlock);
 	config->mode = val & ETM_MODE_ALL;
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

