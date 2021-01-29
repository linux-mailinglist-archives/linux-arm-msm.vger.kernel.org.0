Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4D5308D14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 20:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbhA2THZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jan 2021 14:07:25 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:40484 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232971AbhA2TGp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jan 2021 14:06:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611947178; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ANvyaZfiudWjkHRRQ6nes+pa/rluHPq6WULZ8ERI6Eg=; b=RYHauocghKlVevW1poj5Un//anFvKEejisTL0AZ/gjuxvsH+Ks6u2B+cneSaFHrcJgBq6da+
 glT37Y9a6/AN4Pay42PlCqEeSnhX1PUCG7tH9Ca6QqvA9Ry/xUeeqECqT4nZpSz/BqSUN1hp
 Gt1qSDEDUpH7/QPG+grbCTu8Lz0=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60145c848f2d32c2c57cf414 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 19:05:40
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7F47DC43464; Fri, 29 Jan 2021 19:05:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AC1EC433CA;
        Fri, 29 Jan 2021 19:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AC1EC433CA
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
Subject: [PATCH 1/4] perf/core: Add support to exclude kernel mode instruction tracing
Date:   Sat, 30 Jan 2021 00:35:10 +0530
Message-Id: <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hardware assisted tracing families such as ARM Coresight, Intel PT
provides rich tracing capabilities including instruction level
tracing and accurate timestamps which are very useful for profiling
and also pose a significant security risk. One such example of
security risk is when kernel mode tracing is not excluded and these
hardware assisted tracing can be used to analyze cryptographic code
execution. In this case, even the root user must not be able to infer
anything.

To explain it more clearly in the words of a security team member
(credits: Mattias Nissler),

"Consider a system where disk contents are encrypted and the encryption
key is set up by the user when mounting the file system. From that point
on the encryption key resides in the kernel. It seems reasonable to
expect that the disk encryption key be protected from exfiltration even
if the system later suffers a root compromise (or even against insiders
that have root access), at least as long as the attacker doesn't
manage to compromise the kernel."

Here the idea is to protect such important information from all users
including root users since root privileges does not have to mean full
control over the kernel [1] and root compromise does not have to be
the end of the world.

Currently we can exclude kernel mode tracing via perf_event_paranoid
sysctl but it has following limitations,

 * It is applicable to all PMUs and not just the ones supporting
   instruction tracing.
 * No option to restrict kernel mode instruction tracing by the
   root user.
 * Not possible to restrict kernel mode instruction tracing when the
   hardware assisted tracing IPs like ARM Coresight ETMs use an
   additional interface via sysfs for tracing in addition to perf
   interface.

So introduce a new config CONFIG_EXCLUDE_KERNEL_HW_ITRACE to exclude
kernel mode instruction tracing which will be generic and applicable
to all hardware tracing families and which can also be used with other
interfaces like sysfs in case of ETMs.

[1] https://lwn.net/Articles/796866/

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Suggested-by: Al Grant <al.grant@arm.com>
Tested-by: Denis Nikitin <denik@chromium.org>
Link: https://lore.kernel.org/lkml/20201015124522.1876-1-saiprakash.ranjan@codeaurora.org/
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 init/Kconfig         | 12 ++++++++++++
 kernel/events/core.c |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index af454a51f3c5..31b4d1f26bce 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1832,6 +1832,18 @@ config DEBUG_PERF_USE_VMALLOC
 
 endmenu
 
+config EXCLUDE_KERNEL_HW_ITRACE
+	bool "Exclude kernel mode hardware assisted instruction tracing"
+	depends on PERF_EVENTS
+	help
+	  Exclude kernel mode instruction tracing by hardware tracing
+	  family such as ARM Coresight ETM, Intel PT and so on.
+
+	  This option allows to disable kernel mode instruction tracing
+	  offered by hardware assisted tracing for all users(including root)
+	  especially for production systems where only userspace tracing might
+	  be preferred for security reasons.
+
 config VM_EVENT_COUNTERS
 	default y
 	bool "Enable VM event counters for /proc/vmstat" if EXPERT
diff --git a/kernel/events/core.c b/kernel/events/core.c
index aece2fe19693..044a774cef6d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11866,6 +11866,12 @@ SYSCALL_DEFINE5(perf_event_open,
 		goto err_task;
 	}
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE) &&
+	    (event->pmu->capabilities & PERF_PMU_CAP_ITRACE) && !attr.exclude_kernel) {
+		err = -EACCES;
+		goto err_alloc;
+	}
+
 	if (is_sampling_event(event)) {
 		if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
 			err = -EOPNOTSUPP;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

