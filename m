Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D61B3171572
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgB0K5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:57:14 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:52864 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728897AbgB0K5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:57:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582801034; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=bWiblcEWScCJYEfbQMEzjMSpqvKdPVVjBFxBNYRuRKc=; b=iVoPiNWxqYoLKyufvvn+Lz6ri4QX5SunEEDJTWUN1kYocyqaI2d48ZYvPEqtdqgbm7mZkZDC
 wNcxW7qp124HDxzbDjO3qOIreu8ZYQdt8SfIXa7HyfG1SxYyHFqNuzaIiBtUxW+YPvwV/rNO
 sUDI4jEG+DIZf6vo/zPTX247OXA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57a086.7fee9b1a3d50-smtp-out-n01;
 Thu, 27 Feb 2020 10:57:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9DC3C447A9; Thu, 27 Feb 2020 10:57:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C8F0C4479D;
        Thu, 27 Feb 2020 10:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C8F0C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        saravanak@google.com, viresh.kumar@linaro.org,
        okukatla@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 5/7] interconnect: qcom: Add OSM L3 support on SC7180
Date:   Thu, 27 Feb 2020 16:26:29 +0530
Message-Id: <20200227105632.15041-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200227105632.15041-1-sibis@codeaurora.org>
References: <20200227105632.15041-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Operating State Manager (OSM) L3 interconnect provider support on
SC7180 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/interconnect/qcom/osm-l3.c | 15 +++++++++++++++
 drivers/interconnect/qcom/sc7180.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index bbf8133195972..a03c6d6833dfc 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -14,6 +14,7 @@
 
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 
+#include "sc7180.h"
 #include "sdm845.h"
 
 #define LUT_MAX_ENTRIES			40U
@@ -82,6 +83,19 @@ const static struct qcom_icc_desc sdm845_icc_osm_l3 = {
 	.num_nodes = ARRAY_SIZE(sdm845_osm_l3_nodes),
 };
 
+DEFINE_QNODE(sc7180_osm_apps_l3, SC7180_MASTER_OSM_L3_APPS, 16, SC7180_SLAVE_OSM_L3);
+DEFINE_QNODE(sc7180_osm_l3, SC7180_SLAVE_OSM_L3, 16);
+
+static struct qcom_icc_node *sc7180_osm_l3_nodes[] = {
+	[MASTER_OSM_L3_APPS] = &sc7180_osm_apps_l3,
+	[SLAVE_OSM_L3] = &sc7180_osm_l3,
+};
+
+const static struct qcom_icc_desc sc7180_icc_osm_l3 = {
+	.nodes = sc7180_osm_l3_nodes,
+	.num_nodes = ARRAY_SIZE(sc7180_osm_l3_nodes),
+};
+
 static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 {
 	struct qcom_osm_l3_icc_provider *qp;
@@ -242,6 +256,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id osm_l3_of_match[] = {
+	{ .compatible = "qcom,sc7180-osm-l3", .data = &sc7180_icc_osm_l3 },
 	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
 	{ }
 };
diff --git a/drivers/interconnect/qcom/sc7180.h b/drivers/interconnect/qcom/sc7180.h
index c2d8388bb8809..c6212a10c2f61 100644
--- a/drivers/interconnect/qcom/sc7180.h
+++ b/drivers/interconnect/qcom/sc7180.h
@@ -145,5 +145,7 @@
 #define SC7180_SLAVE_SERVICE_SNOC			134
 #define SC7180_SLAVE_QDSS_STM				135
 #define SC7180_SLAVE_TCU				136
+#define SC7180_MASTER_OSM_L3_APPS			137
+#define SC7180_SLAVE_OSM_L3				138
 
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
