Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDA635066A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 20:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbhCaSfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 14:35:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59765 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234954AbhCaSfF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 14:35:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617215705; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=NtdQlRtPzwi1TkJW8PSL2jxovct9uThnkcdUwsBF9Lw=; b=DVF3Y07ENGfaTu4BDMWDx2yjKdociu2Mlg/yZMlOk0N819x1mukBDoESeA4DOv8ycon0Qtsc
 MO3JN+yKjoqBAff1/j5kEkloUT93s4jYrHhTLeGjYDAnFrVYMUSgmeGNRcqgpP7CxP1GtUYf
 xOsLGhgr4J93tuhyNi3SMmxLgDY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6064c0bc0a4a07ffdacecaa8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 18:34:36
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF2C5C43463; Wed, 31 Mar 2021 18:34:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05AE1C433C6;
        Wed, 31 Mar 2021 18:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05AE1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 0/2] Polling for MHI ready
Date:   Wed, 31 Mar 2021 11:34:23 -0700
Message-Id: <1617215665-19593-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v6:
-Fix return error code for mhi_poll_reg_field()
-Do not recode when returning from mhi_ready_state_transition() if polling fails

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

Bhaumik Bhatt (2):
  bus: mhi: core: Introduce internal register poll helper function
  bus: mhi: core: Move to polling method to wait for MHI ready

 drivers/bus/mhi/core/internal.h |  3 +++
 drivers/bus/mhi/core/main.c     | 23 +++++++++++++++++++++++
 drivers/bus/mhi/core/pm.c       | 34 ++++++++++++++++------------------
 3 files changed, 42 insertions(+), 18 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

