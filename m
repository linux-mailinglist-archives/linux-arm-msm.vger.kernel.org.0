Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754A022FF3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 04:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgG1CCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 22:02:42 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:50051 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726863AbgG1CCh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 22:02:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595901756; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o71f0Tbkh59kye12un+v6NKiOPfQP8PUVUL1Dc2TK4c=; b=EVxrCGx48TDzNAUhk55Mj38JfKnYEgyf0F6Ncg9qTlzQkT9OaGxWbMwIBX4r44ascBUmXbSp
 4B4Oz211QrCM4qKuzM58EWZ2/HXqbRfczCUJHWI/eFOVIadun+q6yEFP0en1QkGBXi/TG+bj
 FpTiEayvKA0Nw6VCmHuvcDUhSg8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f1f87387186ea1ee1763525 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 02:02:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3228BC43391; Tue, 28 Jul 2020 02:02:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B9FFC433C6;
        Tue, 28 Jul 2020 02:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B9FFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 00/11] Introduce features and debugfs/sysfs entries for MHI
Date:   Mon, 27 Jul 2020 19:02:09 -0700
Message-Id: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Save hardware information from BHI.
Allow reading and modifying some MHI variables for debug, test, and
informational purposes using debugfs.
Read values for device specific hardware information to be used by OEMs in
factory testing such as serial number and PK hash using sysfs.

This set of patches was tested on arm64 and x86.

v6:
-Introduced APIs for allocating and freeing the MHI controller so as to ensure
that it is always zero-initialized.
-Moved gerrits around for counter introduction.
-Fixed documentation for sysfs.

v5:
-Removed the debug entry to trigger reset and will be addressed in a seperate
patch
-Added patch bus: mhi: core: Use counters to track MHI device state transitions
-Updated helper API to trigger a non-blocking host resume
-Minor nitpicks also fixed

v4:
-Removed bus: mhi: core: Introduce independent voting mechanism patch
-Removed bus vote function from debugfs due to independent voting removal
-Added helper resume APIs to aid consolidation of spread out code
-Added a clean-up patch and a missing host resume in voting API

v3:
-Add patch to check for pending packets in suspend as a dependency for the
independent voting mechanism introduction
-Include register dump entry for debugfs to dump MHI, BHI, and BHIe registers
-Update commit message for the debugfs patch
-Updated Documentation/ABI with the required info for sysfs
-Updated debugfs patch to include a new KConfig entry and dependencies
-Updated reviewed-by for some patches

v2:
-Added a new debugfs.c file for specific debugfs entries and code
-Updated commit text and addressed some comments for voting change
-Made sure sysfs is only used for serial number and OEM PK hash usage

Bhaumik Bhatt (11):
  bus: mhi: core: Remove double occurrence for mhi_ctrl_ev_task()
    declaration
  bus: mhi: core: Abort suspends due to outgoing pending packets
  bus: mhi: core: Use helper API to trigger a non-blocking host resume
  bus: mhi: core: Trigger host resume if suspended during
    mhi_device_get()
  bus: mhi: core: Use generic name field for an MHI device
  bus: mhi: core: Introduce helper function to check device state
  bus: mhi: core: Introduce counters to track MHI device state
    transitions
  bus: mhi: core: Introduce debugfs entries for MHI
  bus: mhi: core: Read and save device hardware information from BHI
  bus: mhi: core: Introduce APIs to allocate and free the MHI controller
  bus: mhi: core: Introduce sysfs entries for MHI

 Documentation/ABI/stable/sysfs-bus-mhi |  21 ++
 MAINTAINERS                            |   1 +
 drivers/bus/mhi/Kconfig                |   8 +
 drivers/bus/mhi/core/Makefile          |   5 +-
 drivers/bus/mhi/core/boot.c            |  17 +-
 drivers/bus/mhi/core/debugfs.c         | 409 +++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c            |  81 ++++++-
 drivers/bus/mhi/core/internal.h        |  37 ++-
 drivers/bus/mhi/core/main.c            |  27 +--
 drivers/bus/mhi/core/pm.c              |  26 ++-
 include/linux/mhi.h                    |  30 ++-
 11 files changed, 623 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
 create mode 100644 drivers/bus/mhi/core/debugfs.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

