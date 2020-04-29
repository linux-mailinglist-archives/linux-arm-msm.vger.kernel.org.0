Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AE31BE931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 22:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgD2Uwl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 16:52:41 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:62431 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726456AbgD2Uwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 16:52:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588193560; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=p1T77UuTyTPUkQiCdjRiexComvsqP6jWBbVEBaDSv+4=; b=VLfqAXOHF1m6JbZm93aez7aDlZI/C1fRLCb+RbDErVAL9txVZ+Ypz5RawFcRNqUnYZJTRFO7
 b4viPfTxeCe7kJTBXzGH1iL2Ktr+imy9swbVnOOH3xFbTQVRg2/S+fYkWiUEeVdmt0iemf1q
 7CtjNVTKJH8aZ0mTsUjyyqBUU/U=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9e916.7f3cb7adfab0-smtp-out-n05;
 Wed, 29 Apr 2020 20:52:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6D6EC433CB; Wed, 29 Apr 2020 20:52:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45213C433D2;
        Wed, 29 Apr 2020 20:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 45213C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 0/9] Bug fixes and improved logging in MHI
Date:   Wed, 29 Apr 2020 13:52:22 -0700
Message-Id: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A set of patches for bug fixes and improved logging in mhi/core/boot.c.
Verified on x86 and arm64 platforms.

v3:
-Fixed signed-off-by tags
-Add a refactor patch for MHI queue APIs
-Commit text fix in bus: mhi: core: Read transfer length from an event properly
-Fix channel ID range check for ctrl and data event rings processing

v2:
-Fix channel ID range check potential infinite loop
-Add appropriate signed-off-by tags

Bhaumik Bhatt (5):
  bus: mhi: core: Handle firmware load using state worker
  bus: mhi: core: WARN_ON for malformed vector table
  bus: mhi: core: Return appropriate error codes for AMSS load failure
  bus: mhi: core: Improve debug logs for loading firmware
  bus: mhi: core: Ensure non-zero session or sequence ID values

Hemant Kumar (4):
  bus: mhi: core: Refactor mhi queue APIs
  bus: mhi: core: Cache intmod from mhi event to mhi channel
  bus: mhi: core: Add range check for channel id received in event ring
  bus: mhi: core: Read transfer length from an event properly

 drivers/bus/mhi/core/boot.c     |  74 +++++++++++++++----------
 drivers/bus/mhi/core/init.c     |   5 +-
 drivers/bus/mhi/core/internal.h |   4 +-
 drivers/bus/mhi/core/main.c     | 120 +++++++++++++++++++---------------------
 drivers/bus/mhi/core/pm.c       |   6 +-
 include/linux/mhi.h             |   2 -
 6 files changed, 110 insertions(+), 101 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
