Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363513A5FF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 12:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbhFNKYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 06:24:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54082 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232771AbhFNKYC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 06:24:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623666118; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Y4R+CI7JZXnnd2CPaAK0ArA0rsN6FK6Bg7xXP9MJpmM=; b=ucRHq88mDCcMQf84wLy2ubkTpPBhvgtxehcjhfbK55D7W2Rm7X3wcULCRdv/IfzMhxFEfOYw
 MtEYSK9aK1d8QE7h+FJi7RQHACEAWlxGM+ijvFyLcldtc1FKRyWMJ/H3qFlVAdh9T39Umoo0
 GQxOM5YPyAK2Fvp2Yyy/laLbWu4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c72dc4e27c0cc77f3e122e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 10:21:56
 GMT
Sender: deesin=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CC15C4323A; Mon, 14 Jun 2021 10:21:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCB26C4338A;
        Mon, 14 Jun 2021 10:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCB26C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org, manivannan.sadhasivam@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V4 0/2] soc: qcom: aoss: Expose send for generic usecase 
Date:   Mon, 14 Jun 2021 15:51:32 +0530
Message-Id: <1623666094-2924-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Changes from V3]
Add qmp_put declaration in qcom_aoss.h

Deepak Kumar Singh (2):
  soc: qcom: aoss: Expose send for generic usecase
  soc: qcom: aoss: Add debugfs entry

 drivers/soc/qcom/qcom_aoss.c       | 109 ++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h |  38 +++++++++++++
 2 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

