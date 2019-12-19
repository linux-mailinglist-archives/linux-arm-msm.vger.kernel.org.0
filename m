Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB87125ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 06:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbfLSFp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 00:45:26 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:58293 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725996AbfLSFp0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 00:45:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576734325; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=x6DO8XFiQIG79wBQeDvjsylUmPKRxCL8a0jiGOwzMNc=; b=ljh2nQ3hQLeGU7eQ+WKZ85rVqRV/VIjDEpVp2+zJY3ikN13C2871GK8C1QDZpUEt4whHSwHt
 uqArnzgTe/IpeuDTFri+uzikvcpJ48vTp8JmRViv3VcytR2cMAUhuKCrIDbM5zQzdguNUOcc
 ZuOzHfmar7ZxhwJpQW4MxcyebzU=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb0e73.7f4943671730-smtp-out-n02;
 Thu, 19 Dec 2019 05:45:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5EC8C48B01; Thu, 19 Dec 2019 05:45:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5CA0C2BB93;
        Thu, 19 Dec 2019 05:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5CA0C2BB93
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 0/2] Add Modem support on SC7180 SoCs
Date:   Thu, 19 Dec 2019 11:15:04 +0530
Message-Id: <20191219054506.20565-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for booting the Modem Q6 DSP found in
Qualcomm's SC7180 SoCs.

V2:
 * split the series according to SoC
 * Duplicate code across q6v5proc_reset
 * add Rob's 'Reviewed-by' tag

Sibi Sankar (2):
  dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL binding for SC7180
  remoteproc: mss: q6v5-mss: Add modem support on SC7180

 .../bindings/remoteproc/qcom,q6v5.txt         |  23 +-
 drivers/remoteproc/qcom_q6v5_mss.c            | 199 +++++++++++++++++-
 2 files changed, 219 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
