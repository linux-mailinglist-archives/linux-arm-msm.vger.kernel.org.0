Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8445F1CEA72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgELCDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:03:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17386 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728115AbgELCDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:03:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589249000; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x0TSpUhkeXeTC9dUNUB8kN5ovjs7zf0zTQz2/win20k=; b=PObqvF2ou0CyZVYUSkQKzykLmLgBL2Mz8Mwi/73JRRCjhwECZ74/m425SkQx//XxQhIn+GwD
 Yv3FFAPXCA075gugbyEFmA/1ccId4CVeQcNPsQxAPRjr8jPK4CMv3gzEDk5YhD+YXzrPN0Jz
 3Wwp/dakC2E0hJDQBhpB4/BUG40=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba03e5.7fae597371b8-smtp-out-n05;
 Tue, 12 May 2020 02:03:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39B7EC43637; Tue, 12 May 2020 02:03:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18A21C433CB;
        Tue, 12 May 2020 02:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 18A21C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 0/5] MHI Misc Fixes
Date:   Mon, 11 May 2020 19:03:04 -0700
Message-Id: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Patches are addressing MHI core driver bug fixes. Patches tested on
arm64 and x86 platforms.

Hemant Kumar (5):
  bus: mhi: core: Remove the system error worker thread
  bus: mhi: core: Handle disable transitions in state worker
  bus: mhi: core: Skip handling BHI irq if MHI reg access is not allowed
  bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
  bus: mhi: core: Handle write lock properly in mhi_pm_m0_transition

 drivers/bus/mhi/core/init.c     |  3 ++-
 drivers/bus/mhi/core/internal.h |  4 +++-
 drivers/bus/mhi/core/main.c     | 38 +++++++++++++++++++----------
 drivers/bus/mhi/core/pm.c       | 53 ++++++++++++++++++++++++-----------------
 include/linux/mhi.h             |  2 --
 5 files changed, 61 insertions(+), 39 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
