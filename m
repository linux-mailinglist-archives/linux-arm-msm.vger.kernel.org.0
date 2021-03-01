Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DF9328D6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 20:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238214AbhCATKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 14:10:55 -0500
Received: from z11.mailgun.us ([104.130.96.11]:36025 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240898AbhCATFh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 14:05:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614625520; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=TvkfVde19wsy/9yIspcvXBHomEB+eqMNq0i1mBuIphk=; b=j5emB1NC2zgUZ5qJSnfu7Uk/aH+PAhrT9l0WhqbQaBWD+21hFsb1cT+cTwda7thEFrGMRlxk
 Lce2m5+kOFb1KwzwoHZ2e8FAIal1rbOqkYceRPcoNa6dA+eEolyKbwdPOje6ZMrm0atDt/j4
 1Le2sVTQ4knZDYOAqjocH1FmTTI=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 603d3acd1defdc70ae2b9b01 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 19:04:45
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CEDAC43469; Mon,  1 Mar 2021 19:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9675C433C6;
        Mon,  1 Mar 2021 19:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9675C433C6
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
Subject: [PATCHv2 0/4] perf/core: Add support to exclude kernel mode PMU tracing 
Date:   Tue,  2 Mar 2021 00:34:14 +0530
Message-Id: <cover.1614624041.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
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

But "Peter said even the regular counters can be used for full branch trace,
the information isn't as accurate as PT and friends and not easier but
is good enough to infer plenty". This would mean that a global tunable
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
kernel mode pmu tracing for all users including root which will be
generic and applicable to all hardware tracing families and which
can also be used with other interfaces like sysfs in case of ETMs.

Patch 1 adds this new config and the support in perf core to exclude
all kernel mode PMU tracing.

Patch 2 adds the perf evsel warning message when the perf tool users
attempt to perform a kernel mode trace with the config enabled to
exclude the kernel mode tracing.

Patch 3 and Patch 4 adds the support for excluding kernel mode for
ARM Coresight ETM{4,3}XX sysfs mode using the newly introduced generic
config.

[1] https://lwn.net/Articles/796866/

Changes in v2:
 * Move from kernel mode instruction tracing to all kernel level PMU tracing (Peter)
 * Move the check and warning to the caller mode_store() (Doug)

Sai Prakash Ranjan (4):
  perf/core: Add support to exclude kernel mode PMU tracing
  perf evsel: Print warning for excluding kernel mode instruction
    tracing
  coresight: etm4x: Add support to exclude kernel mode tracing
  coresight: etm3x: Add support to exclude kernel mode tracing

 drivers/hwtracing/coresight/coresight-etm3x-core.c  |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c |  6 ++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c  |  6 +++++-
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  6 ++++++
 init/Kconfig                                        | 11 +++++++++++
 kernel/events/core.c                                |  3 +++
 tools/perf/util/evsel.c                             |  3 ++-
 7 files changed, 36 insertions(+), 2 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

