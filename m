Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8EC41AB73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 11:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239715AbhI1JIC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 05:08:02 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25401 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239623AbhI1JIB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 05:08:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632819982; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=utekfrmQSteIxS/+pMgDvuoB47HyInX9NBcN8+iyXNo=; b=uL2pYz3b8zl59PK2I6nYf67KCr+Eqal9nJ4CDXyo+jHvqVG0FhENWWyrfOfojoWvZHWoLfpr
 A/kTnKRM/UzQy+8kbJCWnHtF622ZVeCPcEsQJd33Tv/gvpmTEIHBYJDHgxoJp3pEl/V8RmX+
 YJZxcXPGHY1jcIIZsJw+DUkbWRM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6152db0e8578ef11ed376e5a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 09:06:22
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0B88C4360C; Tue, 28 Sep 2021 09:06:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-berry.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 18472C43460;
        Tue, 28 Sep 2021 09:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 18472C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/2] Put Qualcomm's ufs controller to hibern8 during clock scaling
Date:   Tue, 28 Sep 2021 02:06:11 -0700
Message-Id: <cover.1632818942.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Asutosh Das tried to upstream this change about a year ago.
We would like to resume his work because Qualcomm's ufs controller
needs to be in hibern8 before scaling up/down the clocks.
Just like ufshcd_uic_hibern8_exit() is already being exported,
we would like to export ufshcd_uic_hibern8_enter() so that
Qualcomm's ufs controller can be put in hibern8 state.

Changes from v1:
- Removed the extra ufshcd_uic_hibern8_exit().
- Moved the ufshcd_uic_hibern8_enter() above the current ufshcd_uic_hibern8_exit().

Asutosh Das (2):
  scsi: ufs: export hibern8 entry and exit
  scsi: ufs-qcom: enter and exit hibern8 during clock scaling

 drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
 drivers/scsi/ufs/ufshcd.c   |  4 ++--
 drivers/scsi/ufs/ufshcd.h   |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

