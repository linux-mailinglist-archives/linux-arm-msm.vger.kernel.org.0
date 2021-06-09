Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765F93A123D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 13:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238867AbhFILVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 07:21:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64167 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234508AbhFILVN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 07:21:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623237559; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9BCtXHFVeSUEKomj+XrCPQRr1dpXwmUlcL1F5/BXyGI=; b=FO1WgEmaHtv/wtylDbnAZeeCb/cnFPb0Amo1/1gTOCWSazKS9IXFHfBsPGyAlWIoFD6l6zbx
 Mk3I3wKuxMYS4zGxD6LcSK+H+BFMMMW45S4dPYMczEav+CsqyuYVyrV5GCEe39ohDdADpjSw
 01HqA361BMy6JRPEGjso3beFfUM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60c0a3a751f29e6baef5f96d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 09 Jun 2021 11:19:03
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DF4BC4323A; Wed,  9 Jun 2021 11:19:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88721C433D3;
        Wed,  9 Jun 2021 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88721C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        manivannan.sadhasivam@linaro.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Wed,  9 Jun 2021 16:48:50 +0530
Message-Id: <1623237532-20829-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch series exposes functions to enable drivers to send their own
messages to AOSS (Always on Subsystem). It also adds a debugfs node for
qmp so messages can be sent to aoss for debugging and testing purposes.

V4:
 * Fix compilation error due to missing qmp_put
 * Minor typos [s/tarcks/tracks]

V3:
 * Remove devm memory allocation
 * Use refcount for qmp handle
 * Update qmp_get/qmp_put/qmp_remove function with refcount logic

Deepak Kumar Singh (2):
  soc: qcom: aoss: Expose send for generic usecase
  soc: qcom: aoss: Add debugfs entry

 drivers/soc/qcom/qcom_aoss.c       | 109 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h |  36 ++++++++++++
 2 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

