Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FECC1B3621
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 06:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgDVEUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 00:20:15 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18549 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgDVEUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 00:20:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587529204; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=0Ok93GJWyrMcrmPIyqLBZtZS7FS1V8QUfQQLkNG7V8I=; b=jBtUuSSBj0kGHWAU/KD8cAHcddHbm/IupTpWhGMgHLtCA0tNmu4/hYB32b4cqZBN+RGzzsBB
 iGcJdBtuXswBxJgFHU4cZqB0hfNB6czwkE3wahO0LtKjA2FkRd52k6NAoyXjrLtdXFVPC/AH
 9/Q03lF9owQgwwgQzQyLh+Xam2g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9fc5e6.7f621f9a6110-smtp-out-n01;
 Wed, 22 Apr 2020 04:19:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F3148C433F2; Wed, 22 Apr 2020 04:19:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 688A9C433BA;
        Wed, 22 Apr 2020 04:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 688A9C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 0/8] Bug fixes and improved logging in MHI
Date:   Tue, 21 Apr 2020 21:19:27 -0700
Message-Id: <1587529175-27778-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A set of patches for bug fixes and improved logging in mhi/core/boot.c.
Verified on x86 and arm64 platforms.

Bhaumik Bhatt (5):
  bus: mhi: core: Handle firmware load using state worker
  bus: mhi: core: WARN_ON for malformed vector table
  bus: mhi: core: Return appropriate error codes for AMSS load failure
  bus: mhi: core: Improve debug logs for loading firmware
  bus: mhi: core: Ensure non-zero session or sequence ID values

Hemant Kumar (3):
  bus: mhi: core: Cache intmod from mhi event to mhi channel
  bus: mhi: core: Add range check for channel id received in event ring
  bus: mhi: core: Read transfer length from an event properly

 drivers/bus/mhi/core/boot.c     | 74 +++++++++++++++++++++++++----------------
 drivers/bus/mhi/core/init.c     |  5 ++-
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     | 15 ++++++---
 drivers/bus/mhi/core/pm.c       |  6 +---
 include/linux/mhi.h             |  2 --
 6 files changed, 62 insertions(+), 41 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
