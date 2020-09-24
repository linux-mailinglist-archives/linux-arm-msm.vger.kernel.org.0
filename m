Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D385277C75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Sep 2020 01:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgIXXwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 19:52:10 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:24276 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgIXXwJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 19:52:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600991529; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=84Zm6i7Jvic5qpawkUmAOufJMHIQOCTsiMPn8kZct3k=; b=inioXzwX06+eOHRL9HwdfkQ8jMeZwEo/eZmsZMeesjJqIjLIjXCGs76McLlo0PpNRyJ1wkKR
 +KKH1A+kdMFG1RMmKVndRJ8XPShhjE5RjO4vrnoz9nbn/wom9ypkb+Y+ChbE7Rqmszsg+d74
 FpvVOLxd/NdwMvrorU7lG2GIRc8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f6d310c89f51cb4f12e93cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Sep 2020 23:51:39
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6EC06C433F1; Thu, 24 Sep 2020 23:51:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F6E3C433C8;
        Thu, 24 Sep 2020 23:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F6E3C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 0/3] Introduce mini-dump support for remoteproc
Date:   Thu, 24 Sep 2020 16:51:25 -0700
Message-Id: <1600991488-17877-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sometimes firmware sizes can be in tens of MB's and reading
all the memory during coredump can consume lot of time and
memory.
Introducing support for mini-dumps. Mini-dump contains smallest
amount of useful information, that could help to debug subsystem
crashes.
During bootup memory is allocated in SMEM (Shared memory)
in the form of a table that contains the physical
addresses and sizes of the regions that are supposed to be
collected during coredump. This memory is shared amongst all
processors in a Qualcomm platform, so all remoteprocs
fill in their entry in the global table once they are out
of reset.
This patch series adds support for parsing the global minidump
table and uses the current coredump frameork to expose this memory
to userspace during remoteproc's recovery.

This patch series also integrates the patch:
https://patchwork.kernel.org/patch/11695541/ sent by Siddharth.

Changelog:
v4 -> v5:
- Fixed adsp_add_minidump_segments to read IO memory using appropriate functions.

v3 -> v4:
- Made adsp_priv_cleanup a static function.

v2 -> v3:
- Refactored code to remove dependency on Qualcomm configs.
- Renamed do_rproc_minidump to rproc_minidump and marked as exported
  symbol.

v1 -> v2:
- 3 kernel test robot warnings have been resolved.
- Introduced priv_cleanup op in order to making the cleaning of
  private elements used by the remoteproc more readable.
- Removed rproc_cleanup_priv as it is no longer needed.
- Switched to if/else format for rproc_alloc in order to keep 
  the static const decalaration of adsp_minidump_ops.

Siddharth Gupta (3):
  remoteproc: core: Add ops to enable custom coredump functionality
  remoteproc: qcom: Add capability to collect minidumps
  remoteproc: qcom: Add minidump id for sm8150 modem remoteproc

 drivers/remoteproc/qcom_minidump.h          |  64 +++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c          | 107 ++++++++++++++++++++-
 drivers/remoteproc/remoteproc_core.c        |   6 +-
 drivers/remoteproc/remoteproc_coredump.c    | 138 ++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
 include/linux/remoteproc.h                  |   5 +
 6 files changed, 344 insertions(+), 3 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

