Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0183ABE29
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 23:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhFQVdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 17:33:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23090 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231704AbhFQVdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 17:33:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623965471; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/uNYP8fzgxJwuefQM/nIR2XfvB9gkXTxZeS6A6u4dBc=; b=OA8SUv58MR3fNYd1qYnIBFOgCWs+vOF8+0Fde1TXQDBGo0y2hNL9H7zgJ3w9FP39t2IoWs8n
 f7CWE5sYcltpLiL0NunydL7q9jKwht3xfswrZlc/ps85D7r6DJoGtCADmLWBNsMrO2g6g3nk
 +nDdHHKU3qYXJCjqtxMG0q+4Z8M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60cbbf02ed59bf69cca57ed4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Jun 2021 21:30:42
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6364C43460; Thu, 17 Jun 2021 21:30:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05937C433D3;
        Thu, 17 Jun 2021 21:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05937C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 0/4] MHI event ring priority updates
Date:   Thu, 17 Jun 2021 14:30:31 -0700
Message-Id: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Event ring priorities have remained out of use and are set to 1 by default.
This series brings about an enum entry expanding use of the priority field by
adding high priority tasklet scheduling to the menu.

In some cases, tasklet scheduling delays can be a nuisance. An example would be
ath11k adding a610f3c65d3b ("bus: mhi: Wait for M2 state during system resume")
in response to it. This issue can be potentially avoided if the controller uses
a dedicated event ring for control packets with high priority tasklet scheduling
in place.

There are no functional changes added to the controller (pci_generic or ath11k)
drivers with this series and the only changes there are use of the enum in place
of a harcoded value of "1". In the future, controllers can opt in to have any
event ring scheduled in high priority.

Tested on: X86_64 architecture with SDX65 on Ubuntu 18.04 distribution.

Bhaumik Bhatt (3):
  bus: mhi: pci_generic: Use enum entry for event ring priority
  ath11k: Use enum entry for event ring priority
  bus: mhi: core: Enable support for event ring priorities

Hemant Kumar (1):
  bus: mhi: core: Add support for processing priority of event ring

 drivers/bus/mhi/core/init.c           |  3 +-
 drivers/bus/mhi/core/internal.h       |  2 +-
 drivers/bus/mhi/core/main.c           | 19 ++++++++--
 drivers/bus/mhi/pci_generic.c         | 66 +++++++++++++++++------------------
 drivers/net/wireless/ath/ath11k/mhi.c |  4 +--
 include/linux/mhi.h                   | 14 ++++++--
 6 files changed, 65 insertions(+), 43 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

