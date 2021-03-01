Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 808F0328D73
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 20:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241040AbhCATL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 14:11:26 -0500
Received: from z11.mailgun.us ([104.130.96.11]:47655 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240638AbhCATGD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 14:06:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614625537; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ULVELyq7nHvV0LfXa0HUzIZDmjd8NX9VXsFLlG6f5fY=; b=qDlW4PYnk+oWdpHSYSCFUaNaSuVNK+V1jWUqCjUU/zmIqFX4zYvaljzjeBoslryCkZAsF84o
 R8GoS80hQqm0fxURaU777bAz4SuaKgf4J0ou2rmnpUWWrkIqRqR44AjG8AfmKMMdeoudMXs8
 VSSGr0DItTkmWKFs3HyHhqVM+EU=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 603d3ad7608e0b56532754d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 19:04:55
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5824AC433ED; Mon,  1 Mar 2021 19:04:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57961C433CA;
        Mon,  1 Mar 2021 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57961C433CA
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
Subject: [PATCHv2 1/4] perf/core: Add support to exclude kernel mode PMU tracing
Date:   Tue,  2 Mar 2021 00:34:15 +0530
Message-Id: <def1a6b37cbb54cb15329765266ed90c2f7aa24e.1614624041.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
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

But "Peter said even the regular counters can be used for full branch
trace, the information isn't as accurate as PT and friends and not easier
but is good enough to infer plenty". This would mean that a global tunable
config for all kernel mode pmu tracing is more appropriate than the one
targeting the hardware assisted instruction tracing.

Currently we can exclude kernel mode tracing via perf_event_paranoid
sysctl but it has following limitations,

 * No option to restrict kernel mode instruction tracing by the
   root user.
 * Not possible to restrict kernel mode instruction tracing when the
   hardware assisted tracing IPs like ARM Coresight ETMs use an
   additional interface via sysfs for tracing in addition to perf
   interface.

So introduce a new config CONFIG_EXCLUDE_KERNEL_PMU_TRACE to exclude
kernel mode pmu tracing which will be generic and applicable to all
hardware tracing families and which can also be used with other
interfaces like sysfs in case of ETMs.

[1] https://lwn.net/Articles/796866/

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Suggested-by: Al Grant <al.grant@arm.com>
Tested-by: Denis Nikitin <denik@chromium.org>
Link: https://lore.kernel.org/lkml/20201015124522.1876-1-saiprakash.ranjan@codeaurora.org/
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 init/Kconfig         | 11 +++++++++++
 kernel/events/core.c |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 22946fe5ded9..34d9b7587d2e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1848,6 +1848,17 @@ config DEBUG_PERF_USE_VMALLOC
 
 endmenu
 
+config EXCLUDE_KERNEL_PMU_TRACE
+	bool "Exclude Kernel mode PMU tracing"
+	depends on PERF_EVENTS
+	help
+	  Exclude Kernel mode PMU tracing for all users.
+
+	  This option allows to disable kernel mode tracing for all
+	  users(including root) which is especially useful in production
+	  systems where only userspace tracing might be preferred for
+	  security reasons.
+
 config VM_EVENT_COUNTERS
 	default y
 	bool "Enable VM event counters for /proc/vmstat" if EXPERT
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 0aeca5f3c0ac..241cc9640483 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11770,6 +11770,9 @@ SYSCALL_DEFINE5(perf_event_open,
 	if (err)
 		return err;
 
+	if (IS_ENABLED(CONFIG_EXCLUDE_KERNEL_PMU_TRACE) && !attr.exclude_kernel)
+		return -EACCES;
+
 	if (!attr.exclude_kernel) {
 		err = perf_allow_kernel(&attr);
 		if (err)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

