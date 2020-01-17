Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCC13140BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 14:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgAQNwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 08:52:01 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:58236 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729017AbgAQNwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 08:52:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579269120; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=USlJdlKMx5yIrdTVykTKpAm9eip0V27f956uFncn3rE=; b=S6Fp/xqhe5gjFvnFdsRoYWvRjXi2gyRLGavGfFibjxfY0TXo22UHskhShCLMrrnR99MvLkgt
 h0JquNvlQ4iUPVRy7U4iHFfBq9ww8JzERNcNDT83FWUmfVbxH3/dsroNzJ5XpCD9uP02fuPm
 uVDFy1M06hBxi2moHt8IBPwo/dA=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e21bbff.7fc55b16ace0-smtp-out-n02;
 Fri, 17 Jan 2020 13:51:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2283C447A5; Fri, 17 Jan 2020 13:51:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CA3AC447AA;
        Fri, 17 Jan 2020 13:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CA3AC447AA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, evgreen@chromium.org,
        p.zabel@pengutronix.de
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 4/4] remoteproc: qcom: q6v5-mss: Improve readability of reset_assert
Date:   Fri, 17 Jan 2020 19:21:30 +0530
Message-Id: <20200117135130.3605-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200117135130.3605-1-sibis@codeaurora.org>
References: <20200117135130.3605-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define CONN_BOX_SPARE_0_EN and fixup comments to improve readability of
Q6 modem reset_assert sequence on SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 6a98e9029c70b..8c9cfc213d5ff 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -71,6 +71,7 @@
 #define NAV_AXI_HALTREQ_BIT		BIT(0)
 #define NAV_AXI_HALTACK_BIT		BIT(1)
 #define NAV_AXI_IDLE_BIT		BIT(2)
+#define CONN_BOX_SPARE_0_EN		BIT(0)
 
 #define HALT_ACK_TIMEOUT_MS		100
 #define NAV_HALT_ACK_TIMEOUT_US		200
@@ -415,16 +416,26 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
 		ret = reset_control_reset(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 	} else if (qproc->has_halt_nav) {
-		/* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */
+		/*
+		 * SWWA for the pipeline glitch issue seen while
+		 * putting the Q6 modem on SC7180 into reset:
+		 * 1 - Assert PDC reset
+		 * 2 - Set CONN_BOX_SPARE_0_EN
+		 * 3 - Withdraw the halt requests
+		 * 4 - Assert MSS reset
+		 * 5 - Deassert PDC reset
+		 * 6 - Clear CONN_BOX_SPARE_0_EN
+		 * 7 - Deassert MSS reset
+		 */
 		reset_control_assert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), BIT(0));
+				   CONN_BOX_SPARE_0_EN, 1);
 		regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
 				   NAV_AXI_HALTREQ_BIT, 0);
 		reset_control_assert(qproc->mss_restart);
 		reset_control_deassert(qproc->pdc_reset);
 		regmap_update_bits(qproc->conn_map, qproc->conn_box,
-				   BIT(0), 0);
+				   CONN_BOX_SPARE_0_EN, 0);
 		ret = reset_control_deassert(qproc->mss_restart);
 	} else {
 		ret = reset_control_assert(qproc->mss_restart);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
