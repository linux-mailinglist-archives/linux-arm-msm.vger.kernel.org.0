Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BBF285FA7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgJGNBB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 09:01:01 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:33796 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbgJGNBB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 09:01:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602075659; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Ampq9i94Z2y+v4ESFzjpNequ3NQaL38eIA6M3XkpyyU=; b=SLBNnzxkXeqyN8qgx5RWmtt2q4t14MXIJRNpzCRXdw/FvUaGHxRmp2wgMn7FERcWb4jKE2OK
 Q9Qadd/RCpFLAB/tfk6RACQ3HJ3rWGrv0df7ssQtcOiXhy/UZi7ANAMiO7bLYVkgQ+X+dt6t
 mp/oGkj+UB5YypU+KiQuyqpMaWg=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7dbbf9d6d00c7a9e29a098 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Oct 2020 13:00:41
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A5801C433FF; Wed,  7 Oct 2020 13:00:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 105FAC433CB;
        Wed,  7 Oct 2020 13:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 105FAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, denik@google.com,
        leo.yan@linaro.org, peterz@infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 0/2] coresight: etf/etb: NULL Pointer dereference crash fixes 
Date:   Wed,  7 Oct 2020 18:30:23 +0530
Message-Id: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There was a report of NULL pointer dereference in ETF enable
path for perf CS mode with PID monitoring. It is almost 100%
reproducible when the process to monitor is something very
active such as chrome and with ETF as the sink and not ETR.
Currently in a bid to find the pid, the owner is dereferenced
via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
owner being NULL, we get a NULL pointer dereference.

Looking at the ETR and other places in the kernel, ETF and the
ETB are the only places trying to dereference the task(owner)
in tmc_enable_etf_sink_perf() which is also called from the
sched_in path as in the call trace. Owner(task) is NULL even
in the case of ETR in tmc_enable_etr_sink_perf(), but since we
cache the PID in alloc_buffer() callback and it is done as part
of etm_setup_aux() when allocating buffer for ETR sink, we never
dereference this NULL pointer and we are safe. So lets do the
same thing with ETF and ETB and cache the PID to which the
cs_buffer belongs in alloc_buffer() callback for ETF and ETB as
done for ETR. This will also remove the unnecessary function calls
(task_pid_nr()) in tmc_enable_etr_sink_perf() and etb_enable_perf().

Easily reproducible running below:

 perf record -e cs_etm/@tmc_etf0/ -N -p <pid>

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000548
Mem abort info:
  ESR = 0x96000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
<snip>...
Call trace:
 tmc_enable_etf_sink+0xe4/0x280
 coresight_enable_path+0x168/0x1fc
 etm_event_start+0x8c/0xf8
 etm_event_add+0x38/0x54
 event_sched_in+0x194/0x2ac
 group_sched_in+0x54/0x12c
 flexible_sched_in+0xd8/0x120
 visit_groups_merge+0x100/0x16c
 ctx_flexible_sched_in+0x50/0x74
 ctx_sched_in+0xa4/0xa8
 perf_event_sched_in+0x60/0x6c
 perf_event_context_sched_in+0x98/0xe0
 __perf_event_task_sched_in+0x5c/0xd8
 finish_task_switch+0x184/0x1cc
 schedule_tail+0x20/0xec
 ret_from_fork+0x4/0x18

Sai Prakash Ranjan (2):
  coresight: tmc-etf: Fix NULL ptr dereference in
    tmc_enable_etf_sink_perf()
  coresight: etb10: Fix possible NULL ptr dereference in
    etb_enable_perf()

 drivers/hwtracing/coresight/coresight-etb10.c   | 4 +++-
 drivers/hwtracing/coresight/coresight-priv.h    | 2 ++
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 4 +++-
 3 files changed, 8 insertions(+), 2 deletions(-)


base-commit: 3477326277451000bc667dfcc4fd0774c039184c
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

