Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A49E323626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 04:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbhBXDpa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 22:45:30 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:60986 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233375AbhBXDp3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 22:45:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614138311; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4oiqTcU0UcA3Z9PvqVhIcmsZkhn4+p9KAxzS9qYBZ50=; b=QHX8Czu7KkNKg3yxmtEcO61d7KuCuRRzzWIyavw/CxtlVUyylxPmosTGYcD+U08yAAff6y2q
 L5HERgZD3bSE2IPdMeWuIimawCpQ5MZP7AQADXxPWR3K1NOT7v99osEqyIP8mdSGBQnmr9hx
 06C6+z4rEWcHsfLCCsuBakTkvoc=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6035cba6ba0866383080fa48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:44:38
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E94AC433C6; Wed, 24 Feb 2021 03:44:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3DCEDC433CA;
        Wed, 24 Feb 2021 03:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3DCEDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 0/3] Polling for MHI ready
Date:   Tue, 23 Feb 2021 19:44:27 -0800
Message-Id: <1614138270-2374-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Bhaumik Bhatt (3):
  bus: mhi: core: Introduce internal register poll helper function
  bus: mhi: core: Move to polling method to wait for MHI ready
  bus: mhi: core: Use poll register read API for RDDM download

 drivers/bus/mhi/core/boot.c     | 20 ++++++--------------
 drivers/bus/mhi/core/internal.h |  3 +++
 drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c       | 31 ++++++++++++++-----------------
 4 files changed, 46 insertions(+), 31 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

