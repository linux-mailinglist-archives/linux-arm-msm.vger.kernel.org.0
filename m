Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4697835216A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 23:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhDAVQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 17:16:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39061 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234640AbhDAVQb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 17:16:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617311791; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=N1rfetjGj9Mgpic0F4KnoNz3E55UZDt9FIL0P3fkZzU=; b=aVpMSimMTbYizwwQKuq6qFMzJEZT7lCG1ndyfhDB3TtXmTHqAXRunLUnlHSi8Ng7uivfVNzN
 qyRjxWQxa2MICaM2YgOxQ2vDJ+Xxxe1L2vhpw/d7O0JePvY/BoxVRydlA4Qwq/ehpMLrygKF
 rWz8PheGrX4TAYVvZwRZlSsYaqU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6066382a74f773a66493f012 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 21:16:26
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98ACBC43465; Thu,  1 Apr 2021 21:16:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7345FC433ED;
        Thu,  1 Apr 2021 21:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7345FC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: 
Date:   Thu,  1 Apr 2021 14:16:09 -0700
Message-Id: <1617311778-1254-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Subject: [PATCH v8 0/9] Updates to MHI channel handling

MHI specification shows a state machine with support for STOP channel command
and the validity of certain state transitions. MHI host currently does not
provide any mechanism to stop a channel and restart it without resetting it.
There are also times when the device moves on to a different execution
environment while client drivers on the host are unaware of it and still
attempt to reset the channels facing unnecessary timeouts.

This series addresses the above areas to provide support for stopping an MHI
channel, resuming it back, improved documentation and improving upon channel
state machine handling in general.

This set of patches was tested on arm64 and x86_64 architecture.

v8:
-Split the state machine improvements patch to three patches as per review

v7:
-Tested on x86_64 architecture
-Drop the patch "Do not clear channel context more than once" as issue is fixed
differently using "bus: mhi: core: Fix double dma free()"
-Update the commit text to better reflect changes on state machine improvements

v6:
-Dropped the patch which introduced start/stop transfer APIs for lack of users
-Updated error handling and debug prints on channel handling improvements patch
-Improved commit text to better explain certain patches based on review comments
-Removed references to new APIs from the documentation improvement patch

v5:
-Added reviewed-by tags from Hemant I missed earlier
-Added patch to prevent kernel warnings on clearing channel context twice

v4:
-Updated commit text/descriptions and addressed checkpatch checks
-Added context validity check before starting/stopping channels from new API
-Added patch to clear channel context configuration after reset/unprepare

v3:
-Updated documentation for channel transfer APIs to highlight differences
-Create separate patch for "allowing channel to be disabled from stopped state"

v2:
-Renamed the newly introduced APIs to mhi_start_transfer() / mhi_stop_transfer()
-Added improved documentation to avoid confusion with the new APIs
-Removed the __ prefix from mhi_unprepare_channel() API for consistency.

Bhaumik Bhatt (9):
  bus: mhi: core: Allow sending the STOP channel command
  bus: mhi: core: Clear context for stopped channels from remove()
  bus: mhi: core: Improvements to the channel handling state machine
  bus: mhi: core: Update debug messages to use client device
  bus: mhi: core: Hold device wake for channel update commands
  bus: mhi: core: Clear configuration from channel context during reset
  bus: mhi: core: Check channel execution environment before issuing
    reset
  bus: mhi: core: Remove __ prefix for MHI channel unprepare function
  bus: mhi: Improve documentation on channel transfer setup APIs

 drivers/bus/mhi/core/init.c     |  22 ++++-
 drivers/bus/mhi/core/internal.h |  12 +++
 drivers/bus/mhi/core/main.c     | 190 ++++++++++++++++++++++++----------------
 include/linux/mhi.h             |  18 +++-
 4 files changed, 162 insertions(+), 80 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

