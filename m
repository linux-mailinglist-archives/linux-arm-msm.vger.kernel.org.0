Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7053F1ED4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 19:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhHSRR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 13:17:27 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:41308 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbhHSRRY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 13:17:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629393408; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9OrzBDI9aonJAy5nn5cFhKWv9b0xLY+sStEgxrDvSeg=; b=AicoFHqaqKPFiP/UHnpHsQ09vU4BwbzJGQaJSXXLT9XyY4p2rTu+tB4DZSVa351R5cPuol4v
 m7H90MvyaT0TLDiAdKKNJsD506FLKc1ia6R+bHLGxjR/7tQ6crsgi25n8gSAlNyPIxxqXWan
 C46O6hySQ4kPWkjFZrb7AhZR1oA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 611e91d466ff1079045f183f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 17:16:04
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7BADC4338F; Thu, 19 Aug 2021 17:16:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C431CC4338F;
        Thu, 19 Aug 2021 17:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C431CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        quic_jhugo@quicinc.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 0/2] MHI MMIO register write updates
Date:   Thu, 19 Aug 2021 10:15:52 -0700
Message-Id: <1629393354-20769-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of MHI MMIO writes, the register field write function needs to do reads
before writes are performed. Propagate read failures such that callers are made
aware of those and can take appropriate action instead of running blind.

Optimizing the MMIO initialization function to use mhi_write_reg() in most cases
should also be done to improve design.

These patches were tested on X86_64 architecture with Ubuntu 18.04 and SDX65
attach.

v2:
-Fix testbot reported missing set of changes from pm.c

Bhaumik Bhatt (2):
  bus: mhi: core: Bail on writing register fields if read fails
  bus: mhi: core: Optimize and update MMIO register write method

 drivers/bus/mhi/core/boot.c     | 25 ++++++++++-----
 drivers/bus/mhi/core/init.c     | 70 +++++++++++++++++++++++------------------
 drivers/bus/mhi/core/internal.h |  7 +++--
 drivers/bus/mhi/core/main.c     |  9 ++++--
 drivers/bus/mhi/core/pm.c       | 18 ++++++++---
 5 files changed, 80 insertions(+), 49 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

