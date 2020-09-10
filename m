Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5331263BC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 06:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgIJENo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 00:13:44 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:37448
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbgIJENm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 00:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599696157;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=Rtie8eEmO4OBgzmmJQ8JyZck8s/KP5C8npRs7rdJFBY=;
        b=b713AXkJypMv8dFwRLrrqQGWZ0CfDHGSJNUBVBnPh6XQ5hhCKxsNi2zHhRNabk9S
        BR9PDIYzpOyTRPp/xH82YbiJoAtoaZiK1859wwmR5TH60jU9YrQ8BsaS0/dmtzZpfXG
        v4jk0tRuO0y9jLIl61SyW9Qnkds3IVQYFKVoYuHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599696157;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=Rtie8eEmO4OBgzmmJQ8JyZck8s/KP5C8npRs7rdJFBY=;
        b=VibLV032BrVRD13lPEc5ur1T92X1wpP+TzJuWL5DX4H0vDjPROuWX4krIfR0444p
        HCfnEZuOxCQpiDDT2aX148ExSOQcpwyGLeGfkY54Rj3NJhmLGAX9C62ol2v8TiZmvZ2
        ELysLA6FCkMu3ovH8z7/lN8cF/o0md8jeCsZTfOc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5B6BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] Introduce mini-dump support for remoteproc
Date:   Thu, 10 Sep 2020 00:02:37 +0000
Message-ID: <01010174755239f4-80e8cfe8-2445-40ac-a36f-b740fd1cdd4a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2020.09.10-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sometimes firmware sizes can be in ten's of MB's and reading
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

