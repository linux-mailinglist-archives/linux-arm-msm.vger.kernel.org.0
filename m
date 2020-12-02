Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92362CCAA5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 00:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgLBXmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 18:42:04 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:28012 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728532AbgLBXmE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 18:42:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606952500; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ML0k+1w1cdrfiotHpg1TRWJI765NDUhymPNfbEq4eJU=; b=kHL+TMyZP1suObWxX0VxphkdWEePRsaTPC1aYFeaXC7JOWxaasNv7LuIIdcHo9XQ2vXb/44e
 B6FSgCcIGvRvJQ/TlRKOzV5VG0BSvyFbatHfyjup7KzQTEvqyIp+bZON13RlsG2lvkKkG0hS
 42GFd4Tf2Q3OuTIinYpUU4WZhtI=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fc8260107535c81bad66130 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Dec 2020 23:40:49
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AE22C43462; Wed,  2 Dec 2020 23:40:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 561D0C433ED;
        Wed,  2 Dec 2020 23:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 561D0C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 0/7] Updates to MHI channel handling
Date:   Wed,  2 Dec 2020 15:40:31 -0800
Message-Id: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI specification shows a state machine with support for STOP channel command
and the validity of certain state transitions. MHI host currently does not
provide any mechanism to stop a channel and restart it without resetting it.
There are also times when the device moves on to a different execution
environment while client drivers on the host are unaware of it and still
attempt to reset the channels facing unnecessary timeouts.

This series addresses the above areas to provide support for stopping an MHI
channel, resuming it back, improved documentation and improving upon channel
state machine handling in general.

This set of patches was tested on arm64 architecture.

v3:
-Updated documentation for channel transfer APIs to highlight differences
-Create separate patch for "allowing channel to be disabled from stopped state"

v2:
-Renamed the newly introduced APIs to mhi_start_transfer() / mhi_stop_transfer()
-Added improved documentation to avoid confusion with the new APIs
-Removed the __ prefix from mhi_unprepare_channel() API for consistency.

Bhaumik Bhatt (7):
  bus: mhi: core: Allow receiving a STOP channel command response
  bus: mhi: core: Allow channel to be disabled from stopped state
  bus: mhi: core: Improvements to the channel handling state machine
  bus: mhi: core: Add support to stop or start channel data transfers
  bus: mhi: core: Check execution environment for channel before issuing
    reset
  bus: mhi: core: Remove __ prefix for MHI channel unprepare function
  bus: mhi: Improve documentation on channel transfer setup APIs

 drivers/bus/mhi/core/init.c     |   9 +-
 drivers/bus/mhi/core/internal.h |  12 +++
 drivers/bus/mhi/core/main.c     | 229 +++++++++++++++++++++++++++-------------
 include/linux/mhi.h             |  45 +++++++-
 4 files changed, 220 insertions(+), 75 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

