Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C81AF32B136
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232713AbhCCBJ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:09:27 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:13298 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347613AbhCBFtj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 00:49:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614664153; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Ybi3GMTHSC3dMvQ1EPDjrYqQVz6WecFKeNUwjqK0ZuM=; b=vdJnUenMiJkpcCzyWIKGxzn+fwLUm/VVGvTfVKzdoGG+2UKc4KE2YH+FLbg5/XqObyUeuU27
 dFJfWPevOOYyhqgnDZ10mXMPT3sI4ZmD2bi7pwT75wZRUtfUrEGmLGKVniOu3aOv0GskydOZ
 GdlzL5oOMMrqLgO0nfNdfEiEvoU=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 603dd1b512935cdcee4da29e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 05:48:37
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1B97C43463; Tue,  2 Mar 2021 05:48:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB623C43461;
        Tue,  2 Mar 2021 05:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB623C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] soc: qcom: rpmhpd: Add sc7280 powerdomains
Date:   Tue,  2 Mar 2021 11:18:12 +0530
Message-Id: <1614664092-9394-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
References: <1614664092-9394-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domains exposed by RPMH in the Qualcomm Technologies Inc
sc7280 platform

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/soc/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index 7ce0635..2a0c55f 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -217,8 +217,27 @@ static const struct rpmhpd_desc sc7180_desc = {
 	.num_pds = ARRAY_SIZE(sc7180_rpmhpds),
 };
 
+/* SC7280 RPMH powerdomains */
+static struct rpmhpd *sc7280_rpmhpds[] = {
+	[SC7280_CX] = &sdm845_cx,
+	[SC7280_CX_AO] = &sdm845_cx_ao,
+	[SC7280_EBI] = &sdm845_ebi,
+	[SC7280_GFX] = &sdm845_gfx,
+	[SC7280_MX] = &sdm845_mx,
+	[SC7280_MX_AO] = &sdm845_mx_ao,
+	[SC7280_LMX] = &sdm845_lmx,
+	[SC7280_LCX] = &sdm845_lcx,
+	[SC7280_MSS] = &sdm845_mss,
+};
+
+static const struct rpmhpd_desc sc7280_desc = {
+	.rpmhpds = sc7280_rpmhpds,
+	.num_pds = ARRAY_SIZE(sc7280_rpmhpds),
+};
+
 static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,sc7180-rpmhpd", .data = &sc7180_desc },
+	{ .compatible = "qcom,sc7280-rpmhpd", .data = &sc7280_desc },
 	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
 	{ .compatible = "qcom,sdx55-rpmhpd", .data = &sdx55_desc},
 	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

