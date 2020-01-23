Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0ADA1468C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 14:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgAWNM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 08:12:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:29324 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726227AbgAWNM5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 08:12:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579785176; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=dJUiHDrAH4zx5c0H7WtmCINZ82HtU0D5rEpE/ztuV5w=; b=s8tF6A1LwpTicYfTnmXRve/k3WLeJQjpu0jML7yZ2+bbqyNrlYNi2R461UP2xowkPW0cqO7B
 VawTBXJ3DfSNkdFcbfAoqREn02HOvgu1K1IbVhPe1LChVcbL1E8VHb0ntaudO5VCF9EjZ/V+
 Uu/l2UuFSGz4vVYyTewlivhz71M=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e299bd7.7f52251e85e0-smtp-out-n01;
 Thu, 23 Jan 2020 13:12:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F44BC433A2; Thu, 23 Jan 2020 13:12:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 796A8C43383;
        Thu, 23 Jan 2020 13:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 796A8C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        p.zabel@pengutronix.de
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Improve general readability of MSS on SC7180
Date:   Thu, 23 Jan 2020 18:42:34 +0530
Message-Id: <20200123131236.1078-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series aims to improve the general readability of the mss reset
sequence on SC7180 SoCs. No functional change intended.

v2:
 * Use regmap_read_poll_timeout for halt_nav and halt_axi
 * Redefine CONN_BOX_SPARE_0 to AXI_GATING_VALID_OVERRIDE
 * Update more details about pipeline glitch issue
 * Drop 2,3 patches from v1

Sibi Sankar (2):
  remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
  remoteproc: qcom: q6v5-mss: Improve readability of reset_assert

 drivers/remoteproc/qcom_q6v5_mss.c | 42 ++++++++++++++----------------
 1 file changed, 19 insertions(+), 23 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
