Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02B3282062
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 04:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgJCCHO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 22:07:14 -0400
Received: from z5.mailgun.us ([104.130.96.5]:35316 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbgJCCHO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 22:07:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601690834; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=K63rHzYks6lSC10q7DrVY5t8JDsCFdNGvwegnC6J6i4=; b=ff+UYeka6ecdHbE0/mYoAZVOzt2QSH9p47vjVBPdyhVQwDuqC/A7hSAlKqSDHaDbQEu/lyWj
 LOOSLa1vKWvA+oN7dDdindFvG1xK5G43Blc6bVwjsUu8DYKrwUyUr7TSNThbZYo2j5Ao7M7Q
 tZz0uYDHBp33hTrd3EPphPnP0Jc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f77dc98bfed2afaa619cc8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Oct 2020 02:06:16
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E0A2C433FF; Sat,  3 Oct 2020 02:06:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 063B4C433CA;
        Sat,  3 Oct 2020 02:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 063B4C433CA
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
Subject: [PATCH v6 0/4] Introduce mini-dump support for remoteproc
Date:   Fri,  2 Oct 2020 19:05:53 -0700
Message-Id: <1601690757-25726-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sometimes firmware sizes can be in tens of MB's and reading all the memory
during coredump can consume lot of time and memory.

Introducing support for mini-dumps. Mini-dump contains smallest amount of
useful information, that could help to debug subsystem crashes.

During bootup memory is allocated in SMEM (Shared memory) in the form of a
table that contains the physical addresses and sizes of the regions that
are supposed to be collected during coredump. This memory is shared amongst
all processors in a Qualcomm platform, so all remoteprocs fill in their
entry in the global table once they are out of reset.

This patch series adds support for parsing the global minidump table and
uses the current coredump frameork to expose this memory to userspace
during remoteproc's recovery.

This patch series also integrates the patch:
https://patchwork.kernel.org/patch/11695541/ sent by Siddharth.

Changelog:
v5 -> v6:
- Removed priv_cleanup operation from rproc_ops. The dump_segments list is
  updated and cleaned up each time minidump is invoked.
- Split patch #2 into 2 parts - one that adds the rproc_minidump function, and
  the other that uses the new function in the qcom_q6v5_pas driver.
- Updated structs in qcom_minidump to explicitly indicate the endianness of the
  data stored in SMEM, also updated member names.
- Read the global table of contents in SMEM each time adsp_minidump is invoked.

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

Siddharth Gupta (4):
  remoteproc: core: Add ops to enable custom coredump functionality
  remoteproc: coredump: Add minidump functionality
  remoteproc: qcom: Add capability to collect minidumps
  remoteproc: qcom: Add minidump id for sm8150 modem

 drivers/remoteproc/qcom_minidump.h          |  64 ++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c          | 105 +++++++++++++++++++++-
 drivers/remoteproc/remoteproc_core.c        |   6 +-
 drivers/remoteproc/remoteproc_coredump.c    | 132 ++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
 include/linux/remoteproc.h                  |   3 +
 6 files changed, 334 insertions(+), 3 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

