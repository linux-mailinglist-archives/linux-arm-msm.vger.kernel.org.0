Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD23619FFE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2020 23:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgDFVFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Apr 2020 17:05:37 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18186 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725933AbgDFVFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Apr 2020 17:05:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586207136; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SbimLU8r3+FaMh0qlreNkY8X8m5XbfbUdLj+XfQh8CE=; b=FONofLitoWmr3O7P+fTwslexQfuPgxaWqCJUFTt7OyqiaN9KAyME4UQQzzyE2zM9x0jPtAMO
 EbpRuGTDDSm0F+0rJ+bHWRXTW+seLaiCLBNHnhr+f9senqEqAq5+iGuQg5h4FPypRTNZMiBJ
 pPGXH2reaRZbS+6ODYBmxWU4UH0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8b999f.7ff88ffa0b20-smtp-out-n03;
 Mon, 06 Apr 2020 21:05:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58551C433F2; Mon,  6 Apr 2020 21:05:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98914C433D2;
        Mon,  6 Apr 2020 21:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98914C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH 0/3] Misc MHI fixes
Date:   Mon,  6 Apr 2020 15:04:34 -0600
Message-Id: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A few (independent) fixes to the MHI bus for issues that I have come across
while developing against the mainline code.

Jeffrey Hugo (3):
  bus: mhi: core: Handle syserr during power_up
  bus: mhi: core: Make sure to powerdown if mhi_sync_power_up fails
  bus: mhi: core: Remove link_status() callback

 drivers/bus/mhi/core/init.c |  6 ++----
 drivers/bus/mhi/core/main.c |  5 ++---
 drivers/bus/mhi/core/pm.c   | 26 +++++++++++++++++++++++++-
 include/linux/mhi.h         |  2 --
 4 files changed, 29 insertions(+), 10 deletions(-)

-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
