Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F80375C00
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 21:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbhEFTxN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 15:53:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:60851 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhEFTxL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 15:53:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620330733; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=6hsvNiLm6snfgYT1gETxO981lyXB3iHndDKxbMsOxfE=; b=MpnJ65BMz84PRELbuUcQDidpJdEgqUAgjMzr81kmp21WFJNiczXA9/bX6iv2OdH8+ZIcXwU6
 Uyj1E/gn++TREavgJansH82ovZtRrrS+to9qp0YUDkFv1ZIa11xmjb2nNmeP2cmIxIKAg9Om
 NJ7/LCFqVZCbe303ZGXyHbomdYg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 609448dafebcffa80f1626c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 May 2021 19:51:54
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C7816C433D3; Thu,  6 May 2021 19:51:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4F74C433D3;
        Thu,  6 May 2021 19:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4F74C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, linux-wireless@vger.kernel.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 0/6] BHI/BHIe improvements for MHI power purposes
Date:   Thu,  6 May 2021 12:51:39 -0700
Message-Id: <1620330705-40192-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series improves the power up behavior by allowing MHI host driver to
set BHI and/or BHIe offsets early on in the preparation phase and fail pre-power
up if offsets are not found or not within a limited MMIO region. This also
allows MHI host to clean up the offsets in the unprepare after power down phase.

Going forward, controllers will be required to specify a reg_len field which
will be used to check whether the BHI/BHIe offsets are in range or not.

This series has been tested on X86_64 architecture with the PCI generic driver
as controller and an SDX55 device.

v4:
-Added reviewed-by tags
-Updated range check patch to include BHI/e offsets in the error message

v3:
-Added reviewed-by tags
-Updated order of reg_len in mhi_controller structure documentation

v2:
-Added reviewed-by tags
-Moved reg_len entry in mhi_controller structure to allow for a packed struct

Bhaumik Bhatt (6):
  bus: mhi: core: Set BHI/BHIe offsets on power up preparation
  bus: mhi: core: Set BHI and BHIe pointers to NULL in clean-up
  bus: mhi: Add MMIO region length to controller structure
  ath11k: set register access length for MHI driver
  bus: mhi: pci_generic: Set register access length for MHI driver
  bus: mhi: core: Add range checks for BHI and BHIe

 drivers/bus/mhi/core/init.c           | 61 ++++++++++++++++++++++++-----------
 drivers/bus/mhi/core/pm.c             | 28 +++-------------
 drivers/bus/mhi/pci_generic.c         |  1 +
 drivers/net/wireless/ath/ath11k/mhi.c |  1 +
 include/linux/mhi.h                   |  2 ++
 5 files changed, 50 insertions(+), 43 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

