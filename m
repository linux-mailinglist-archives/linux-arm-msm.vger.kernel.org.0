Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 468C531F3F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 03:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbhBSCSf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 21:18:35 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:25543 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhBSCSf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 21:18:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613701096; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KXBmQrTe1oCKu+YG/EkON22IenY+Fs4c96sPuS8jH6g=; b=vB0LvqGDQOT6gExYHUnY4iX7JjKgsI7YhnnsrWChUFCMDH6KUXpRYsuy3q71X0JJqRTXvUqm
 0ZfhC+D4Relh4z9FkTLbXJrMX9BjdOzw4QAJNncU80rIeaurdAGUicqScs8eT819/8Lv6TLK
 YxB4T6JLlA4WVeaBcsm32PKVOKo=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 602f1fc37237f827dc9d4d09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Feb 2021 02:17:39
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C0BAC433CA; Fri, 19 Feb 2021 02:17:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 88EB3C433CA;
        Fri, 19 Feb 2021 02:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 88EB3C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 0/3] Serialize execution environment changes for MHI
Date:   Thu, 18 Feb 2021 18:17:29 -0800
Message-Id: <1613701052-38885-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v4:
-Addressed review comments for additional info logging for EE movements
-Updated switch case for EE handling in mhi_intvec_threaded_handler()

v3:
-Update commit text to accurately reflect changes and reasoning based on reviews

v2:
-Add patch to clear devices when moving execution environments

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

Bhaumik Bhatt (3):
  bus: mhi: core: Clear devices when moving execution environments
  bus: mhi: core: Download AMSS image from appropriate function
  bus: mhi: core: Process execution environment changes serially

 drivers/bus/mhi/core/boot.c     | 48 ++++++++++++++---------------
 drivers/bus/mhi/core/internal.h |  1 +
 drivers/bus/mhi/core/main.c     | 67 +++++++++++++++++++++++++++--------------
 drivers/bus/mhi/core/pm.c       | 10 ++++--
 4 files changed, 77 insertions(+), 49 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

