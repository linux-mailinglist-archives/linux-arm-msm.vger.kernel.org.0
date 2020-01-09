Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D1413624F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 22:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbgAIVNB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 16:13:01 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:25673 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728488AbgAIVNB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 16:13:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578604380; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=n7xvfC9v69G8KH0wvTvxiWwwtjJ3lQD2Ken4MMb8wZc=; b=uxS/czjxK8GB5fdHWvKsJRIVJnfcaWhBsfmIuBw32qq3EjiuR3dRs8lMXHbqUTPr6FZA+D8C
 QI45ywoC2bmCmyoEwz6lhB7cAAOyjlqOHQdaDceH2MNEqi2uUi+fJj93CEyZVB6bnz7D4Hrn
 sH7a3uXT1Gnvk+0onnl/sAo06oY=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e179754.7f131803b298-smtp-out-n01;
 Thu, 09 Jan 2020 21:12:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED195C447A6; Thu,  9 Jan 2020 21:12:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 635A4C433A2;
        Thu,  9 Jan 2020 21:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 635A4C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     robh+dt@kernel.org, georgi.djakov@linaro.org, evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 4/4] interconnect: qcom: Add OSM L3 support on SC7180
Date:   Fri, 10 Jan 2020 02:42:15 +0530
Message-Id: <20200109211215.18930-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20200109211215.18930-1-sibis@codeaurora.org>
References: <20200109211215.18930-1-sibis@codeaurora.org>
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
 drivers/interconnect/qcom/osm-l3.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
index 7fde53c70081e..df2cec3fa2913 100644
--- a/drivers/interconnect/qcom/osm-l3.c
+++ b/drivers/interconnect/qcom/osm-l3.c
@@ -28,6 +28,7 @@
 
 #define OSM_L3_MAX_LINKS		1
 #define SDM845_MAX_RSC_NODES		130
+#define SC7180_MAX_RSC_NODES		137
 
 #define to_qcom_provider(_provider) \
 	container_of(_provider, struct qcom_osm_l3_icc_provider, provider)
@@ -37,6 +38,11 @@ enum {
 	SDM845_SLAVE_OSM_L3,
 };
 
+enum {
+	SC7180_MASTER_OSM_L3_APPS = SC7180_MAX_RSC_NODES + 1,
+	SC7180_SLAVE_OSM_L3,
+};
+
 struct qcom_osm_l3_icc_provider {
 	void __iomem *base;
 	unsigned int max_state;
@@ -87,6 +93,19 @@ static struct qcom_icc_desc sdm845_icc_osm_l3 = {
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
+static struct qcom_icc_desc sc7180_icc_osm_l3 = {
+	.nodes = sc7180_osm_l3_nodes,
+	.num_nodes = ARRAY_SIZE(sc7180_osm_l3_nodes),
+};
+
 static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
 {
 	struct qcom_osm_l3_icc_provider *qp;
@@ -248,6 +267,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id osm_l3_of_match[] = {
+	{ .compatible = "qcom,sc7180-osm-l3", .data = &sc7180_icc_osm_l3 },
 	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
 	{ },
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
