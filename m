Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2412709D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbgISCC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:02:57 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:54999 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgISCCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:02:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600480964; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=BURDtrM4/JhTY390gcc6/L/mWWU1YCPB+gfT4j3BWUs=; b=H+pHxCcWpoifhp+xNvnR0/syDm28rU3l+CogB5KymezTDzJEGvmmQFABdseMYFwgBdWBiJ05
 mU1HAR+KlOwKt6NSEOjakYR7dhQQKchiuUv6yM7RPwB/CO+IlxtpJFxLb3DmWpZo3q5MItDv
 G8duNezWcjtYROd2biW105//FEk=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6566c436c8ce93e8ab2056 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:02:44
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE024C43382; Sat, 19 Sep 2020 02:02:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 19B96C433CB;
        Sat, 19 Sep 2020 02:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19B96C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 00/10] Bug fixes and improvements for MHI power operations
Date:   Fri, 18 Sep 2020 19:02:25 -0700
Message-Id: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bug fixes and improvements for MHI powerup and shutdown handling.
Firmware load function names are updated to accurately reflect their purpose.
Closed certain design gaps where the host (MHI bus) would allow clients to
operate after a power down or error detection.
Move to an error state sooner based on different scenarios.

These patches were tested on arm64 and X86_64 architectures.

Bhaumik Bhatt (10):
  bus: mhi: core: Use appropriate names for firmware load functions
  bus: mhi: core: Move to using high priority workqueue
  bus: mhi: core: Skip device wake in error or shutdown states
  bus: mhi: core: Use the IRQF_ONESHOT flag for the BHI interrupt line
  bus: mhi: core: Disable IRQs when powering down
  bus: mhi: core: Improve shutdown handling after link down detection
  bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
  bus: mhi: core: Move to an error state on any firmware load failure
  bus: mhi: core: Move to an error state on mission mode failure
  bus: mhi: core: Mark device inactive soon after host issues a shutdown

 drivers/bus/mhi/core/boot.c     | 59 ++++++++++++++++++++++-----------------
 drivers/bus/mhi/core/init.c     | 10 ++++++-
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     | 28 +++++++++++++------
 drivers/bus/mhi/core/pm.c       | 62 ++++++++++++++++++++++++++++-------------
 include/linux/mhi.h             |  2 ++
 6 files changed, 108 insertions(+), 54 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

