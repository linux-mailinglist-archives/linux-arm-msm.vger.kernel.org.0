Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B62B1CEAC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgELCd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:33:26 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:48689 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727892AbgELCdZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:33:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589250805; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Gbr4Wkuy19BTnIwtPfWPtF/ww5i3nDtSAgM8uj6hhSc=; b=DMnMoXL9WABRoGOtRpqpgkpwbE5ay39OEjZ616fXasQ+mcoiY2Be04Y6Iw0mJ1EELW2ZGK/F
 dX8ULRTLWq+E/1RamYMW/XBzOyVmxy0CC1Xrw1tSVVDX1WC5dnxRIaqexttwzlgjwPf2IJqc
 ka2VZrzGFNU47M1jlJNe2B7nxUE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba0af5.7f9e883e93e8-smtp-out-n04;
 Tue, 12 May 2020 02:33:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18F44C432C2; Tue, 12 May 2020 02:33:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EF04C433F2;
        Tue, 12 May 2020 02:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5EF04C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 0/6] Introduce features and debugfs/sysfs entries for MHI
Date:   Mon, 11 May 2020 19:33:10 -0700
Message-Id: <1589250796-32020-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce independent bus and device voting mechanism for clients and save
hardware information from BHI.
Allow reading and modifying some MHI variables for debug, test, and
information purposes using debugfs.
Read values for device specific hardware information to be used by OEMs in
factory testing such as serial number and PK hash using sysfs.

This set of patches was tested on arm64 and x86.

Bhaumik Bhatt (6):
  bus: mhi: core: Introduce independent voting mechanism
  bus: mhi: core: Use generic name field for an MHI device
  bus: mhi: core: Introduce helper function to check device state
  bus: mhi: core: Introduce debugfs entries and counters for MHI
  bus: mhi: core: Read and save device hardware information from BHI
  bus: mhi: core: Introduce sysfs entries for MHI

 Documentation/ABI/stable/sysfs-bus-mhi |  25 ++
 drivers/bus/mhi/Kconfig                |   8 +
 drivers/bus/mhi/core/Makefile          |   5 +-
 drivers/bus/mhi/core/boot.c            |  17 +-
 drivers/bus/mhi/core/debugfs.c         | 431 +++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c            |  80 +++++-
 drivers/bus/mhi/core/internal.h        |  29 +++
 drivers/bus/mhi/core/main.c            |   6 +-
 drivers/bus/mhi/core/pm.c              |  79 ++++--
 include/linux/mhi.h                    |  39 ++-
 10 files changed, 672 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-mhi
 create mode 100644 drivers/bus/mhi/core/debugfs.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
