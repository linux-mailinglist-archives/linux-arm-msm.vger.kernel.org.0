Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC7E3FB4AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Aug 2021 13:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236551AbhH3LjJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Aug 2021 07:39:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55383 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236523AbhH3LjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Aug 2021 07:39:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630323490; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Hk+iwrjCrFy+LpqAj/ekV8lghLzWqj2rVYGU/ecRJdc=; b=ByKFiaLM0xpuShffbepqrYVlgO0JPcRiWJoPQsUlvy6D6SXopQI9fKlyPwVdMuBGT/vYS2k+
 Yth6dq5LeK/h4ePFtOmD04JsYu/4zRhxa3uHcJgTZ8asvOuZ20AV1HwajQuITGigmI1dpaXq
 OgbgCwfH9o9pUG65pftGTw6XK+Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 612cc3094cd9015037be341c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Aug 2021 11:37:45
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AB7AC4360D; Mon, 30 Aug 2021 11:37:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22F01C43460;
        Mon, 30 Aug 2021 11:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 22F01C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V7 0/2] qcom aoss qmp_get and debugfs support patches
Date:   Mon, 30 Aug 2021 17:07:29 +0530
Message-Id: <1630323451-7160-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Change from V6]
soc: qcom: aoss: Expose send for generic usecase
  Changed comment for qmp_put
  Added comment after put_device in qmp_put

soc: qcom: aoss: Add debugfs entry
  Removed CONFIG_DEBUG_FS check

Deepak Kumar Singh (2):
  soc: qcom: aoss: Expose send for generic usecase
  soc: qcom: aoss: Add debugfs entry

 drivers/soc/qcom/qcom_aoss.c       | 86 +++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h | 38 +++++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

