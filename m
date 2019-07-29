Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B00D78B58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 14:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfG2MHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 08:07:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37394 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbfG2MHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 08:07:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 21B3C60E59; Mon, 29 Jul 2019 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402022;
        bh=nvRtpu0xns/v3uggBzp2m79ksAXZ7k13nV0HAQQx5+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fqyZBoC5shtE4c/KTBn5tfi2Si8FgS80Qlmsww40qVvGNsg3T0zMmNgSQFON05qLY
         MA8FCvSiTNGJrdtOAcN4QkIciwY9vYzjKKPC9cdAVjir4XfhHXQ/8BW+JXHYK5YmNy
         FwCO4+Yn4qU4NVJqpXAGO83MfDQDtUZ8I09X9Xpo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EB8260DAD;
        Mon, 29 Jul 2019 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564402021;
        bh=nvRtpu0xns/v3uggBzp2m79ksAXZ7k13nV0HAQQx5+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JgNn86SC3RJKYZRjZQGVcRyYza7nUptjDwgSXEpupZl3pb9tLkEwacquddtAqYMM+
         LMOM217pLEPT4QnFSLve7lHxIlbZ0OkSICxUneAwq3S7poIuivP35Tp2o8Nb7j4A9+
         edwa08oLwGrBXNjU2NZMIHC6l8VdbKHRyImI/baw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EB8260DAD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, vkoul@kernel.org,
        aneela@codeaurora.org
Cc:     mark.rutland@arm.com, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        clew@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/6] mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
Date:   Mon, 29 Jul 2019 17:36:31 +0530
Message-Id: <20190729120633.20451-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729120633.20451-1-sibis@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the corresponding APSS shared offset for SM8150 and SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479cc..d5dbfd5f8417f 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -119,6 +119,8 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = (void *)8 },
 	{ .compatible = "qcom,qcs404-apcs-apps-global", .data = (void *)8 },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = (void *)12 },
+	{ .compatible = "qcom,sm8150-apss-shared", .data = (void *)12 },
+	{ .compatible = "qcom,sc7180-apss-shared", .data = (void *)12 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_apcs_ipc_of_match);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

