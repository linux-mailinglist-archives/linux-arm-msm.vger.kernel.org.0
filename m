Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E652A9B13
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 18:45:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgKFRo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 12:44:59 -0500
Received: from z5.mailgun.us ([104.130.96.5]:33020 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbgKFRo7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 12:44:59 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604684699; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MR92eDzIAHHi0FSAiHSlFfFZzPNP3QFKJ2FdgfeC0xQ=; b=Mfewy4JvD/o2mvUX24jwT8xb/emNqr2eCMQxL0IaDOlMSlszPXKafzsfFo1A9uEP8O2JI4yH
 6QBYsp+GOIFMKVRZnl9cNoBfvMvsEllD2H0sqvvYhVq2wf4RkiQ9BIgwByY8FoJTYDAnNF/H
 4TvQ/Zo5M3EBqsivGG4HU1godtc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fa58b9a18b2aa4b1fb8e58f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 17:44:58
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E6B7C433FE; Fri,  6 Nov 2020 17:44:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E17EDC433FE;
        Fri,  6 Nov 2020 17:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E17EDC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 0/6] Minor bug fixes and clean-up for MHI host driver
Date:   Fri,  6 Nov 2020 09:44:44 -0800
Message-Id: <1604684690-31065-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series serves to clean up the MHI host driver by removing an
unnecessary counter and an unused function. It also renames a function to make
it clearly worded. There is currently no user of this exported function which
makes it is safe to do so now.

Bug fixes include adding a missing EXPORT_SYMBOL_GPL to a function, and adding
a return value check to bail out of RDDM download in kernel panic path.

An outlier among the group exports the mhi_get_exec_env() API for use by
controller drivers, in case they need to determine behavior on the basis of the
current execution environment.

This set of patches was tested on arm64.

v2:
-Removed the declaration for mhi_get_exec_env() from internal.h
-Improved on the error log message in RDDM download exit case due to unknown EE

Bhaumik Bhatt (6):
  bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
  bus: mhi: core: Add missing EXPORT_SYMBOL for mhi_get_mhi_state()
  bus: mhi: core: Expose mhi_get_exec_env() API for controllers
  bus: mhi: core: Remove unused mhi_fw_load_worker() declaration
  bus: mhi: core: Rename RDDM download function to use proper words
  bus: mhi: core: Skip RDDM download for unknown execution environment

 drivers/bus/mhi/core/boot.c     | 15 +++++++++------
 drivers/bus/mhi/core/internal.h |  2 --
 drivers/bus/mhi/core/main.c     |  2 ++
 include/linux/mhi.h             | 12 +++++++++---
 4 files changed, 20 insertions(+), 11 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

