Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADCE140BA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 14:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAQNvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 08:51:50 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:33336 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728739AbgAQNvt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 08:51:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579269108; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=69k9DR17sNPfrI1O1H7UPJ9rZN1wXwjUe6sDIdpAqPg=; b=rFSxx4nLKWNryrQ2BeXxYj/oKYw8Sx+KcCmkss/LHv29zDjRCTKBHJwLBVk85U0g7YHuGUiL
 XLfmKoh5RoNo6uR42qZyDhMUBEUrlYieQXhKdABNVo2OZQYS3jqNeBQaEncm/ayltB5JAO72
 fkOcRWgdig3ViXrjrp+swBiREDM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e21bbf0.7f9299b69f10-smtp-out-n03;
 Fri, 17 Jan 2020 13:51:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA135C447A2; Fri, 17 Jan 2020 13:51:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB030C447A6;
        Fri, 17 Jan 2020 13:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB030C447A6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        p.zabel@pengutronix.de
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 0/4] Improve general readability of MSS on SC7180
Date:   Fri, 17 Jan 2020 19:21:26 +0530
Message-Id: <20200117135130.3605-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series aims to improve the general readability of the mss reset
sequence on SC7180 SoCs. No functional change intended.

Sibi Sankar (4):
  remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
  remoteproc: qcom: q6v5-mss: Improve readability across clk handling
  remoteproc: qcom: q6v5-mss: Rename boot status timeout
  remoteproc: qcom: q6v5-mss: Improve readability of reset_assert

 drivers/remoteproc/qcom_q6v5_mss.c | 69 +++++++++++++++++-------------
 1 file changed, 40 insertions(+), 29 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
