Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E58359415
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 06:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbhDIEkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 00:40:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25658 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbhDIEkW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 00:40:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617943209; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=AfxvbqMHx3+3QG7Ar/bHDpYEdDPHiToorKK88hjnsDI=; b=btfLu9BusbHiWVDlSL8Fz09zIXCl7bk9HE8nnNn2snuU24iG9TP3aZ1Csvne6tLjIu7M+EJT
 JZpAQ7GiE/CwAhPZxAogfqI3j8bSJMvwNshHkYUJWyO+fSc6R+QAYdH+9O4RVXQSWtWb7IzD
 Yjk/QbfmEOk5tJymzUA2Ju+kfJQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 606fdaa82cc44d3aea05a3f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 04:40:08
 GMT
Sender: deesin=qti.qualcomm.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 72FABC43462; Fri,  9 Apr 2021 04:40:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D089C433CA;
        Fri,  9 Apr 2021 04:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D089C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=qti.qualcomm.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=deesin@qti.qualcomm.com
From:   Deepak Kumar Singh <deesin@qti.qualcomm.com>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Deepak Kumar Singh <deesin@qti.qualcomm.com>
Subject: [PATCH V2 0/2] soc: qcom: aoss: Expose send for generic usecase
Date:   Fri,  9 Apr 2021 10:09:46 +0530
Message-Id: <1617943188-23278-1-git-send-email-deesin@qti.qualcomm.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change from V1
Addressesed all review comments in previous set.

Deepak Kumar Singh (2):
  soc: qcom: aoss: Expose send for generic usecase
  soc: qcom: aoss: Add debugfs entry

 drivers/soc/qcom/qcom_aoss.c       | 91 +++++++++++++++++++++++++++++++++++++-
 include/linux/soc/qcom/qcom_aoss.h | 33 ++++++++++++++
 2 files changed, 123 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/soc/qcom/qcom_aoss.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

