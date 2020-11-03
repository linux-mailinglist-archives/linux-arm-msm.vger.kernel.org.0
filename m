Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3279A2A45C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 13:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgKCM63 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 07:58:29 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:16929 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729089AbgKCM61 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 07:58:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604408307; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Vl1gSkuYNKu59mDRMCZ/CekkC7CyDy0hSBNDzA19YYI=; b=E+dTPstG/eXOuHQPFqTQJkr9wKISjSRAB7wrfIPdctYSyWfMLQEDH4O3lM4cu8bFguENdUBp
 onEZpizOIsAgkIx33iO7QlZXKbO6tLs3k4+T5o4t15/aM9EU+nZVHvl7mXupygY0S7jsn3P7
 GTfEo6u+0ZoQnt/FpN3iCDLoC60=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa153ecb64b1c5b78f96c51 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 12:58:20
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46297C3853C; Tue,  3 Nov 2020 09:19:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C27CC38537;
        Tue,  3 Nov 2020 09:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C27CC38537
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
Subject: [PATCH v7 0/4] Introduce mini-dump support for remoteproc
Date:   Tue,  3 Nov 2020 01:19:16 -0800
Message-Id: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
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
v6 -> v7:
- The STR_TAB size is calculated dynamically now instead of a predefined size.
- Added comments to indicate details about the reserved null section header. More
  details can be found at https://refspecs.linuxfoundation.org/elf/elf.pdf.

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

 drivers/remoteproc/qcom_minidump.h          |  64 +++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c          | 105 ++++++++++++++++++++-
 drivers/remoteproc/remoteproc_core.c        |   6 +-
 drivers/remoteproc/remoteproc_coredump.c    | 140 ++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_helpers.h |  26 ++++++
 include/linux/remoteproc.h                  |   3 +
 6 files changed, 341 insertions(+), 3 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_minidump.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

