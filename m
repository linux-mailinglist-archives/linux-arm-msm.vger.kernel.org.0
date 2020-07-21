Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24BEE227EE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 13:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgGULaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 07:30:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46084 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729476AbgGULaB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 07:30:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595331000; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wosPSlwsBh5PjjklANk60w8OaWbCI+oq9TQCJekWQYw=; b=pHC+pWoqi7FpMZTItCoAFM6Olrcio1ZelZr7ahakuaCJn6XIMPjcsic9+VrrkZq18Wp9ehRV
 +xicgcxFrMf+f84C1Wa24PqfPOWJwd5w2GWLcFQXHzTInrmv6X79z21yj/3mbGv4135ecFqP
 AJhiAsW/L5/mZYW/neIck6xr9hE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f16d1b703c8596cdb6d2cc0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 11:29:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E9CCC433CA; Tue, 21 Jul 2020 11:29:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3F88C433CA;
        Tue, 21 Jul 2020 11:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F3F88C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Add MBA log extraction support
Date:   Tue, 21 Jul 2020 16:59:35 +0530
Message-Id: <20200721112935.25716-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721112935.25716-1-sibis@codeaurora.org>
References: <20200721112935.25716-1-sibis@codeaurora.org>
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

V2:
 * Don't dump logs in mba_reclaim path [Bjorn]
 * Move has_mba_logs check to q6v5_dump_mba_logs [Bjorn]
 * SDM845 mss was incorrectly marked to support mba logs

 drivers/remoteproc/qcom_q6v5_mss.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 49cd16e050533..945ca2652e7d6 100644
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
 
@@ -141,6 +144,7 @@ struct rproc_hexagon_res {
 	int version;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_mba_logs;
 	bool has_spare_reg;
 };
 
@@ -202,6 +206,7 @@ struct q6v5 {
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
+	bool has_mba_logs;
 	bool has_spare_reg;
 	int mpss_perm;
 	int mba_perm;
@@ -521,6 +526,26 @@ static int q6v5_rmb_mba_wait(struct q6v5 *qproc, u32 status, int ms)
 	return val;
 }
 
+static void q6v5_dump_mba_logs(struct q6v5 *qproc)
+{
+	struct rproc *rproc = qproc->rproc;
+	void *data;
+
+	if (!qproc->has_mba_logs)
+		return;
+
+	if (q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true, false, qproc->mba_phys,
+				    qproc->mba_size))
+		return;
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
@@ -839,6 +864,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 {
 	int ret;
 	int xfermemop_ret;
+	bool mba_load_err = false;
 
 	qcom_q6v5_prepare(&qproc->q6v5);
 
@@ -932,7 +958,7 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
 	q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
-
+	mba_load_err = true;
 reclaim_mba:
 	xfermemop_ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, true,
 						false, qproc->mba_phys,
@@ -940,6 +966,8 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	if (xfermemop_ret) {
 		dev_err(qproc->dev,
 			"Failed to reclaim mba buffer, system may become unstable\n");
+	} else if (mba_load_err) {
+		q6v5_dump_mba_logs(qproc);
 	}
 
 disable_active_clks:
@@ -1298,6 +1326,7 @@ static int q6v5_start(struct rproc *rproc)
 
 reclaim_mpss:
 	q6v5_mba_reclaim(qproc);
+	q6v5_dump_mba_logs(qproc);
 
 	return ret;
 }
@@ -1717,6 +1746,7 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
+	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM,
 			     qcom_msa_handover);
@@ -1808,6 +1838,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = true,
 	.has_spare_reg = true,
 	.version = MSS_SC7180,
 };
@@ -1843,6 +1874,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = true,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_SDM845,
 };
@@ -1870,6 +1902,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8998,
 };
@@ -1900,6 +1933,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	},
 	.need_mem_protection = true,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8996,
 };
@@ -1933,6 +1967,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
 	},
 	.need_mem_protection = false,
 	.has_alt_reset = false,
+	.has_mba_logs = false,
 	.has_spare_reg = false,
 	.version = MSS_MSM8916,
 };
@@ -1974,6 +2009,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
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

