Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBDB834D89A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Mar 2021 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhC2Txm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 15:53:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59912 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231319AbhC2TxN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 15:53:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617047592; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ILpcC/45O6BYH3Fs0WBPgvv/ScmmEng5mDUsxp+BOpM=; b=l7Sby1JUmbQ/410FRcDmIo5o4fMsAqMPPCwOXqH06Lppr5tH7fQZsWKeRwlN4sXphFjO0ULV
 47hGXCBaa6bqMEhc2rCwh6+mQevdgtvWZ7Aqeo+3O95CdhYX1QkYSe2vq5oZBGPLHCHkx5fO
 C5Cw1wAWaETPlIV6d5aUGvhYn3o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60623027876af85fc47c3b6f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 19:53:11
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2C26C43461; Mon, 29 Mar 2021 19:53:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D4BEEC433C6;
        Mon, 29 Mar 2021 19:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D4BEEC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v5 0/2] Polling for MHI ready
Date:   Mon, 29 Mar 2021 12:53:01 -0700
Message-Id: <1617047583-12104-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v5:
-Use fsleep in place of udelay or usleep_range to accommodate better delay use
-Drop patch for polling during RDDM panic path as new API cannot be used there

v4:
-Added reviewed-by tag
-Return appropriate error code from mhi_poll_reg_field()
-Fixed bug where mhi_poll_reg_field() returns success if polling times out
-Added an interval_us variable in mhi_ready_state_transition()

v3:
-Removed config changes that crept in in the first patch

v2:
-Addressed review comments
-Introduce new patch for to use controller defined read_reg() for polling
-Add usage in RDDM download panic path as well

Use polling instead of interrupt driven approach to wait for MHI ready state.

In certain devices, it is likely that there is no incoming MHI
interrupt for a transition to MHI READY state. One such example
is the move from Pass Through to an SBL or AMSS execution
environment. In order to facilitate faster bootup times as there
is no need to wait until timeout_ms completes, MHI host can poll
every 25 milliseconds to check if device has entered MHI READY
until a maximum timeout of twice the timeout_ms is reached.

This patch series has been tested on an arm64 device.

Bhaumik Bhatt (2):
  bus: mhi: core: Introduce internal register poll helper function
  bus: mhi: core: Move to polling method to wait for MHI ready

 drivers/bus/mhi/core/internal.h |  3 +++
 drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c       | 32 +++++++++++++++-----------------
 3 files changed, 41 insertions(+), 17 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

