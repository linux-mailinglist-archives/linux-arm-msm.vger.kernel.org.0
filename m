Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47B31BA964
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 17:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgD0P7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 11:59:41 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39760 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727073AbgD0P7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 11:59:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588003180; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ucj+gc5/pcfKXwbgbp1GSdAM1Wgy+R2UP3HxP0CxH04=; b=jxSEYrOGH2BxwJ+IRu6a72mLxh+/XX32hdLCnTXPdHvDABjJORaQ/ke8o7S5vXeCoVfYSxS5
 Z7i8F1JwLec4razo1lnkN83fsrCZSDk50Wcf65ct9GK67OUh6p3gMKWFLH5brKGmMTJQWkJB
 WjTH0uXS7VU9MM3H97idH/HJnlI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7015e.7f1064a4c500-smtp-out-n02;
 Mon, 27 Apr 2020 15:59:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A267FC433D2; Mon, 27 Apr 2020 15:59:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9E8AC433CB;
        Mon, 27 Apr 2020 15:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9E8AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3 0/6] Misc MHI fixes
Date:   Mon, 27 Apr 2020 09:59:07 -0600
Message-Id: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A few (independent) fixes to the MHI bus for issues that I have come across
while developing against the mainline code.

v3:
-reorder series to put changes which are ready, based on reviews, in front
-change error from EIO to ETIMEDOUT when sync_power_up fails
-add change to correct a conflict of channel device names

v2:
-fix syserr reset log message
-fix power up error check code style
-add change to remove pci assumptions for register accesses
-add comment typo fix


Jeffrey Hugo (6):
  bus: mhi: core: Make sure to powerdown if mhi_sync_power_up fails
  bus: mhi: core: Remove link_status() callback
  bus: mhi: core: Offload register accesses to the controller
  bus: mhi: core: Fix typo in comment
  bus: mhi: core: Handle syserr during power_up
  bus: mhi: core: Fix channel device name conflict

 drivers/bus/mhi/core/init.c     |  7 +++----
 drivers/bus/mhi/core/internal.h |  3 ---
 drivers/bus/mhi/core/main.c     | 16 ++++------------
 drivers/bus/mhi/core/pm.c       | 26 +++++++++++++++++++++++++-
 include/linux/mhi.h             | 10 +++++++---
 5 files changed, 39 insertions(+), 23 deletions(-)

-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
