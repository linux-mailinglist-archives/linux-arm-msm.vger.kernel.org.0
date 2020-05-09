Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF851CBC76
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 04:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgEIC06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 22:26:58 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54989 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728353AbgEIC05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 22:26:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588991217; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YtPxi5kfb+cESe9JYSmogjGyixblplgPG0hQEsBH8Jw=; b=C42SvG0bIU+85i2ZZH3W81M7knwxgyjXlEvS8a+ipPoJQiJ8YrdkW6o/p80vOUauyNRtraje
 PSKxz2gQtmTY8mTHKMXPA06yaQYIpzZjPRgbclYQjpBlv01Dzbvhw17REnQS+0kCVd9DjWB5
 0Ln5m3wDT0RHzwATK1sr5yijNKA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb614f0.7f4f9b90d6f8-smtp-out-n05;
 Sat, 09 May 2020 02:26:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1B9AC43636; Sat,  9 May 2020 02:26:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0BBBC433F2;
        Sat,  9 May 2020 02:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0BBBC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v7 0/8] Bug fixes and improved logging in MHI
Date:   Fri,  8 May 2020 19:26:40 -0700
Message-Id: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A set of patches for bug fixes and improved logging in mhi/core/boot.c.
Verified on x86 and arm64 platforms.

v7:
-Updated commit text for macro inclusion
-Updated channel ID bound checks
-Fixed non-uniform placement of function parameters to be within 80 characters
-Sent to correct Maintainer email ID

v6:
-Updated the MHI_RANDOM_U32_NONZERO to only give a random number upto the
supplied bitmask

v5:
-Updated the macro MHI_RANDOM_U32_NONZERO to take a bitmask as the input
parameter and output a non-zero value between 1 and U32_MAX

v4:
-Dropped the change: bus: mhi: core: WARN_ON for malformed vector table
-Updated bus: mhi: core: Read transfer length from an event properly to include
parse rsc events
-Use prandom_u32_max() instead of prandom_u32 to avoid if check in
bus: mhi: core: Ensure non-zero session or sequence ID values are used

v3:
-Fixed signed-off-by tags
-Add a refactor patch for MHI queue APIs
-Commit text fix in bus: mhi: core: Read transfer length from an event properly
-Fix channel ID range check for ctrl and data event rings processing

v2:
-Fix channel ID range check potential infinite loop
-Add appropriate signed-off-by tags

Bhaumik Bhatt (4):
  bus: mhi: core: Handle firmware load using state worker
  bus: mhi: core: Return appropriate error codes for AMSS load failure
  bus: mhi: core: Improve debug logs for loading firmware
  bus: mhi: core: Ensure non-zero session or sequence ID values are used

Hemant Kumar (4):
  bus: mhi: core: Refactor mhi queue APIs
  bus: mhi: core: Cache intmod from mhi event to mhi channel
  bus: mhi: core: Add range check for channel id received in event ring
  bus: mhi: core: Read transfer length from an event properly

 drivers/bus/mhi/core/boot.c     |  75 +++++++++----------
 drivers/bus/mhi/core/init.c     |   5 +-
 drivers/bus/mhi/core/internal.h |   5 +-
 drivers/bus/mhi/core/main.c     | 156 +++++++++++++++++++++-------------------
 drivers/bus/mhi/core/pm.c       |   6 +-
 include/linux/mhi.h             |   2 -
 6 files changed, 129 insertions(+), 120 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
