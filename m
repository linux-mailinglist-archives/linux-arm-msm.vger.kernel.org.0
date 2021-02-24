Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B099324778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 00:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhBXXYH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 18:24:07 -0500
Received: from z11.mailgun.us ([104.130.96.11]:30246 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236220AbhBXXYD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 18:24:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614209017; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=fyuTlAO3vB+Mn96a0UMu0l9OIZLkZw2lfkiewOW3LhY=; b=eyskfTcpJOoW20bh32I2ARKQKatRBayYdMX3dSb5zdjTQT2cTWgVnZln+s42U2794o/6PK3L
 T5xP9y+32zGAvUxzRVbjFmvtWtTlFf/GwtBSnyq85Mwbn9kza9bnx/CKg0drs25mt0typtFR
 jYrTIshyMd8V1iowlS67PLmUSic=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6036dfe0ba0866383071de12 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 23:23:12
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F1BB5C43464; Wed, 24 Feb 2021 23:23:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CA05CC433ED;
        Wed, 24 Feb 2021 23:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CA05CC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 0/4] Serialize execution environment changes for MHI
Date:   Wed, 24 Feb 2021 15:23:01 -0800
Message-Id: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v6:
-Add patch to improve debug message
-Fix switch-case fall through warning for EE serialization patch
-Address review comments and update commit text

v5:
-Update commit text for "clear devices when moving execution environments" patch
-Added test platform details that were missed out in the cover letter
-Merged two if checks in to a single one for EE serialization patch

v4:
-Addressed review comments for additional info logging for EE movements
-Updated switch case for EE handling in mhi_intvec_threaded_handler()

v3:
-Update commit text to accurately reflect changes and reasoning based on reviews

v2:
-Add patch to clear devices when moving execution environments

Note: This patch is first in series of execution environment related changes.

During full boot chain firmware download, the PM state worker downloads the AMSS
image after waiting for the SBL execution environment change in PBL mode itself.
Since getting rid of the firmware load worker thread, this design needs to
change and MHI host must download the AMSS image from the SBL mode of PM state
worker thread instead of blocking waits for SBL EE in PBL transition processing.

Ensure that EE changes are handled only from appropriate places and occur
one after another and handle only PBL or RDDM EE changes as critical events
directly from the interrupt handler and the status callback is given to the
controller drivers promptly.

When moving from SBL to AMSS EE, clear SBL specific client devices by calling
remove callbacks for them so they are not left opened in a different execution
environment.

This patchset was tested on ARM64.

Bhaumik Bhatt (4):
  bus: mhi: core: Destroy SBL devices when moving to mission mode
  bus: mhi: core: Download AMSS image from appropriate function
  bus: mhi: core: Process execution environment changes serially
  bus: mhi: core: Update debug prints to include local device state

 drivers/bus/mhi/core/boot.c     | 51 +++++++++++++--------------
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     | 76 +++++++++++++++++++++++++++--------------
 drivers/bus/mhi/core/pm.c       | 10 ++++--
 4 files changed, 83 insertions(+), 55 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

