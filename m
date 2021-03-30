Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EB634DE02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 04:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhC3CMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 22:12:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53954 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhC3CMP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 22:12:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617070335; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=U1KRemA3vtl9/LXkcqU9ty5Cl02WvzLxfxiDa4aqy1c=; b=l05sxeTuTNWWtkfJKGXAxRRKHl7aebiGh1UFgoK82B0xRrO8cbzIOfXrvrirkVeEztH2FyRg
 GX460ZSnDhiExC/wHmohL3fANW00RUU5QcC7IspWuUbAAjrWKxuQ9vY7E9zGpW+c1TMC6UFT
 HVTmtTNo+QN/hx3HUryfjPNyZO0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 606288f9c39407c3270ccd74 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 02:12:09
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64107C43461; Tue, 30 Mar 2021 02:12:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 939BFC433CA;
        Tue, 30 Mar 2021 02:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 939BFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 0/7] Updates to MHI channel handling
Date:   Mon, 29 Mar 2021 19:11:40 -0700
Message-Id: <1617070307-5775-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Bhaumik Bhatt (7):
  bus: mhi: core: Allow sending the STOP channel command
  bus: mhi: core: Clear context for stopped channels from remove()
  bus: mhi: core: Improvements to the channel handling state machine
  bus: mhi: core: Clear configuration from channel context during reset
  bus: mhi: core: Check channel execution environment before issuing
    reset
  bus: mhi: core: Remove __ prefix for MHI channel unprepare function
  bus: mhi: Improve documentation on channel transfer setup APIs

 drivers/bus/mhi/core/init.c     |  22 ++++-
 drivers/bus/mhi/core/internal.h |  12 +++
 drivers/bus/mhi/core/main.c     | 192 ++++++++++++++++++++++++----------------
 include/linux/mhi.h             |  18 +++-
 4 files changed, 163 insertions(+), 81 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

