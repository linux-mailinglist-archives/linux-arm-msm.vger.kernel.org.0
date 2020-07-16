Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B587C222277
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 14:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgGPMgx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 08:36:53 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23365 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728591AbgGPMgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 08:36:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594903011; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sflIu4AwEqhFBtCPgCnov73hE7oMHRzwQkJlK9vFROE=; b=rEXd9xAwYIrkEThcvnQ1UR/IbEIuJk7jZWf0RzexxXSXOCh2pUMmroQ1D3QQVdIaAmi0Athb
 VlFQThnRBLHNTB7fqnRvfAc+YpWXQVaxQR5L7/vvErDVmGXndOY9erLf0Tu3xFo/WngevW7Y
 QErXclevUYBDPcjRQDeJdlbmlaM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f1049e18423214e138c58d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Jul 2020 12:36:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EF858C4339C; Thu, 16 Jul 2020 12:36:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97761C433CB;
        Thu, 16 Jul 2020 12:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97761C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/3] remoteproc: qcom_q6v5_mss: Add MBA log extraction support
Date:   Thu, 16 Jul 2020 18:06:29 +0530
Message-Id: <20200716123630.21892-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716123630.21892-1-sibis@codeaurora.org>
References: <20200716123630.21892-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SC7180 the MBA firmware stores the bootup text logs in a 4K segment
at the beginning of the MBA region. Add support to extract the logs
which will be useful to debug mba boot/authentication issues.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 41 ++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 95e21ed607cb9..4ddf084b2c6fc 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/devcoredump.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -37,6 +38,8 @@
 
 #define MPSS_CRASH_REASON_SMEM		421
 
+#define MBA_LOG_SIZE			SZ_4K
+
 /* RMB Status Register Values */
 #define RMB_PBL_SUCCESS			0x1
 
@@ -139,6 +142,7 @@ struct rproc_hexagon_res {
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_mba_logs;
 	bool has_spare_reg;
 };
 
@@ -200,6 +204,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_mba_logs;
 	bool has_spare_reg;
 	int mpss_perm;
 	int mba_perm;
@@ -518,6 +523,19 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 	return val;
 }
 
+static void q6v5_dump_mba_logs(struct q6v5 *qproc)
+{
+	struct rproc *rproc = qproc->rproc;
+	void *data;
+
+	data = vmalloc(MBA_LOG_SIZE);
+	if (!data)
+		return;
+
+	memcpy(data, qproc->mba_region, MBA_LOG_SIZE);
+	dev_coredumpv(&rproc->dev, data, MBA_LOG_SIZE, GFP_KERNEL);
+}
+
 static int q6v5proc_reset(struct q6v5 *qproc)
 {
 	u32 val;
@@ -838,6 +856,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 {
 	int ret;
 	int xfermemop_ret;
+	bool mba_load_err = false;
 
 	qcom_q6v5_prepare(&qproc->q6v5);
 
@@ -931,7 +950,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
-
+	mba_load_err = true;
 reclaim_mba:
 	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
 						false, qproc->mba_phys,
@@ -939,6 +958,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	if (xfermemop_ret) {
 		dev_err(qproc->dev,
 			"Failed to reclaim mba buffer, system may become unstable\n");
+	} else if (qproc->has_mba_logs & mba_load_err) {
+		q6v5_dump_mba_logs(qproc);
 	}
 
 disable_active_clks:
@@ -968,7 +989,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	return ret;
 }
 
-static void q6v5_mba_reclaim(struct q6v5 *qproc)
+static void q6v5_mba_reclaim(struct q6v5 *qproc, bool err_path)
 {
 	int ret;
 	u32 val;
@@ -1006,6 +1027,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
 				      qproc->mba_size);
 	WARN_ON(ret);
 
+	if (qproc->has_mba_logs && err_path && !ret)
+		q6v5_dump_mba_logs(qproc);
+
 	ret = qcom_q6v5_unprepare(&qproc->q6v5);
 	if (ret) {
 		q6v5_pds_disable(qproc, qproc->proxy_pds,
@@ -1255,7 +1279,7 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 						false, true,
 						qproc->mpss_phys,
 						qproc->mpss_size);
-			q6v5_mba_reclaim(qproc);
+			q6v5_mba_reclaim(qproc, false);
 		}
 	}
 }
@@ -1297,7 +1321,7 @@ static int q6v5_start(struct rproc *rproc)
 	return 0;
 
 reclaim_mpss:
-	q6v5_mba_reclaim(qproc);
+	q6v5_mba_reclaim(qproc, true);
 
 	return ret;
 }
@@ -1313,7 +1337,7 @@ static int q6v5_stop(struct rproc *rproc)
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "timed out on wait\n");
 
-	q6v5_mba_reclaim(qproc);
+	q6v5_mba_reclaim(qproc, false);
 
 	return 0;
 }
@@ -1717,6 +1741,7 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
+	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
 			     qcom_msa_handover);
@@ -1808,6 +1833,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = true,
 	.has_spare_reg = true,
 	.version = MSS_SC7180,
 };
@@ -1843,6 +1869,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
+	.has_mba_logs = true,
 	.has_spare_reg = false,
 	.version = MSS_SDM845,
 };
@@ -1870,6 +1897,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8998,
 };
@@ -1900,6 +1928,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8996,
 };
@@ -1933,6 +1962,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8916,
 };
@@ -1974,6 +2004,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8974,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

