Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3948C29FC98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 05:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgJ3ELp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 00:11:45 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:46663 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726355AbgJ3ELN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 00:11:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604031072; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bhu3dVNa1poHcyO9P0oym7CJWWezz4vVImWxqI5HZAU=; b=oTr9qLsxUoyJk3lC5/0hLaMGQEF8nkteG7tYrrgTKYL6hD/a7KqQVmlgfye7vKNJ13cy1g9W
 HhZEAc8i5Y19yJz/b+HCcNpswYL8i5Pv7afaZYbx0TKiBN1orG07JU2GvCjrCsDrYbUD4sD5
 MkzxQ+QOnXcoskrCGGT10Co6+TY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f9b9259c3d7c9858af1b198 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 04:11:05
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E953C433C9; Fri, 30 Oct 2020 04:11:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F4D9C433FF;
        Fri, 30 Oct 2020 04:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F4D9C433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 00/12] Bug fixes and improvements for MHI power operations
Date:   Thu, 29 Oct 2020 21:10:45 -0700
Message-Id: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
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

v3:
-Fixed bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
-Mistakenly placed the free_irq() calls in mhi_pm_sys_error_transition()
-Moved it to mhi_pm_disable_transition()

v2:
-Addressed patches based on review comments and made improvements
-Added bus: mhi: core: Check for IRQ availability during registration
-Dropped bus: mhi: core: Use the IRQF_ONESHOT flag for the BHI interrupt line
-Split bus: mhi: core: Move to an error state on any firmware load failure
-Modified the following patches:
-bus: mhi: core: Disable IRQs when powering down
-bus: mhi: core: Improve shutdown handling after link down detection
-bus: mhi: core: Mark device inactive soon after host issues a shutdown
-bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
-Addressed the above as follow-up patches with improvements:
-bus: mhi: core: Prevent sending multiple RDDM entry callbacks
-bus: mhi: core: Separate system error and power down handling
-bus: mhi: core: Remove MHI event ring IRQ handlers when powering down

Bhaumik Bhatt (12):
  bus: mhi: core: Use appropriate names for firmware load functions
  bus: mhi: core: Move to using high priority workqueue
  bus: mhi: core: Skip device wake in error or shutdown states
  bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
  bus: mhi: core: Prevent sending multiple RDDM entry callbacks
  bus: mhi: core: Move to an error state on any firmware load failure
  bus: mhi: core: Use appropriate label in firmware load handler API
  bus: mhi: core: Move to an error state on mission mode failure
  bus: mhi: core: Check for IRQ availability during registration
  bus: mhi: core: Separate system error and power down handling
  bus: mhi: core: Mark and maintain device states early on after power
    down
  bus: mhi: core: Remove MHI event ring IRQ handlers when powering down

 drivers/bus/mhi/core/boot.c |  60 ++++++-----
 drivers/bus/mhi/core/init.c |  10 +-
 drivers/bus/mhi/core/main.c |  16 +--
 drivers/bus/mhi/core/pm.c   | 236 ++++++++++++++++++++++++++++++++------------
 include/linux/mhi.h         |   2 +
 5 files changed, 225 insertions(+), 99 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

