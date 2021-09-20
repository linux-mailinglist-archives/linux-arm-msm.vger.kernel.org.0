Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBE74127C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhITVLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 17:11:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57466 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbhITVJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 17:09:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632172082; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=G3IVzzBfVgZWkFH3uGqzVuYGW1kOFbgXfF9zYJWD7A0=; b=wWVS5vD7XRx+/PaNRF+uWnfjMPvHoisoUDb6mXiYxvEGdHn1uuc5B6YLypRTE77+nnJiB3sM
 A3vhTscWqXeMutVeiUlEGFHH84LpePNH+oiVnvuoml1xy2GL4kX+pTiRg930vU4ywqRgeCZM
 FO9KybyjCxb+6UqUievCWpXB0cs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6148f832507800c880eb2710 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 21:08:02
 GMT
Sender: nguyenb=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AEE1C43460; Mon, 20 Sep 2021 21:08:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-berry.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 662F7C4338F;
        Mon, 20 Sep 2021 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 662F7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/2] Put Qualcomm's ufs controller to hibern8 during clock scaling
Date:   Mon, 20 Sep 2021 14:07:48 -0700
Message-Id: <cover.1632171047.git.nguyenb@codeaurora.org>
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

Asutosh Das (2):
  scsi: ufs: export hibern8 entry and exit
  scsi: ufs-qcom: enter and exit hibern8 during clock scaling

 drivers/scsi/ufs/ufs-qcom.c | 12 +++++++++++-
 drivers/scsi/ufs/ufshcd.c   |  4 ++--
 drivers/scsi/ufs/ufshcd.h   |  2 ++
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

