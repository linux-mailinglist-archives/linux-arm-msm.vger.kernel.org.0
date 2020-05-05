Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE2D1C641C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 00:48:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgEEWri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 18:47:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16951 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729170AbgEEWrh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 18:47:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588718857; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UjYtfzsCuuezQPd0Hb5Vo+ec14plHVnuK/Pw66j+4G4=; b=Rvsqkvz0VnHL5tj/dgcU1mlFsEwftcv/WIudVQ8+dTembT5i8abI3/qQVAdDImvhoI1PJhqC
 sFEIBVOX1QUnqQqGfrMOXqI/BTp8W8DRQ8U5JIhTS0DlrQ2MweeKWDen01rvw7wEGEm5Gf7I
 q3cJ7xARC9tdTUIg1kDQu4xtBrY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb1ecf8.7f7940673960-smtp-out-n03;
 Tue, 05 May 2020 22:47:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCDAFC433BA; Tue,  5 May 2020 22:47:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19ECBC433CB;
        Tue,  5 May 2020 22:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19ECBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 0/8] Bug fixes and improved logging in MHI
Date:   Tue,  5 May 2020 15:47:04 -0700
Message-Id: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A set of patches for bug fixes and improved logging in mhi/core/boot.c.
Verified on x86 and arm64 platforms.

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

 drivers/bus/mhi/core/boot.c     |  75 ++++++++++++------------
 drivers/bus/mhi/core/init.c     |   5 +-
 drivers/bus/mhi/core/internal.h |   5 +-
 drivers/bus/mhi/core/main.c     | 124 ++++++++++++++++++++--------------------
 drivers/bus/mhi/core/pm.c       |   6 +-
 include/linux/mhi.h             |   2 -
 6 files changed, 108 insertions(+), 109 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
