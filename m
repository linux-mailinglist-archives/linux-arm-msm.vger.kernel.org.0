Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E567179938
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 20:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgCDTrx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 14:47:53 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:60108 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728998AbgCDTrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 14:47:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583351273; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=QSY+4EaWATqNN5zH6MDHQ3A6wTjmgb7ghaxFQeIgdxg=; b=t9YOlMHb3pOKtJCTG18EodOfnL7AYfSYjm1S8DJ8OMJM4v3XGppfgcFoxmsjxZuziq6C1yil
 n8DvgUsijJKwh2TbpY47ZhSxUtRa8qS1Tu6Z0eb4ibRAXMwie9MdA0VAWvkSskxJJYA8QBoM
 kX88kTLRVBL8qu5498T9o88EPAc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6005e0.7f635c1f10d8-smtp-out-n03;
 Wed, 04 Mar 2020 19:47:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21165C4479C; Wed,  4 Mar 2020 19:47:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DA3EC43383;
        Wed,  4 Mar 2020 19:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DA3EC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        jeffrey.l.hugo@gmail.com, luca@z3ntu.xyz
Cc:     agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 0/3] remoteproc: mss: Improve mem_assign and firmware load
Date:   Thu,  5 Mar 2020 01:17:26 +0530
Message-Id: <20200304194729.27979-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Two things came up in the effort of figuring out why the modem crashed the
entire system when being restarted; the first one solves the actual problem, in
that it's not possible to reclaim the main modem firmware region unless the
modem subsystem is running - causing the crash.

The second patch aligns the firmware loading process to that of the downstream
driver, which seems to be a requirement in 8974 as well.

The third patch aligns the mpss coredump sequence to that of the downstream
driver, which is expected to fix mba load failure during coredump.

Bjorn Andersson (2):
  remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
  remoteproc: qcom_q6v5_mss: Validate each segment during loading

Sibi Sankar (1):
  remoteproc: qcom_q6v5_mss: Reload the mba region on coredump

 drivers/remoteproc/qcom_q6v5_mss.c | 131 +++++++++++++++++++++--------
 1 file changed, 97 insertions(+), 34 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
