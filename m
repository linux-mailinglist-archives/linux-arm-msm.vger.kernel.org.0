Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6216D45A1E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 12:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235179AbhKWLxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 06:53:21 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:37470 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235007AbhKWLxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 06:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637668207; x=1669204207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xv4hEsjW26SqodguJPybCav5NQE2PSNMV/braBNZuZs=;
  b=UlSFVD7VBABl7wfuTm5YC1bJ5trxARbzEA/YiKlR7Jrn0Z0K4IR7f2CJ
   Ou/LWcVATRz/wpROa3k5s1XJYdcn/MfM4fcsUFz9f+by9oiq/RJgFJtqP
   iyy/VCwcAizfIxKv1KjiR6KIdBtWcjECjI3OYu7Yhi61G14gFJwqRazQe
   M=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Nov 2021 03:50:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:50:06 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:50:06 -0800
Received: from c-skakit-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 03:50:02 -0800
From:   Satya Priya <quic_c_skakit@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        David Collins <collinsd@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <swboyd@chromium.org>,
        <mka@chromium.org>, Satya Priya <quic_c_skakit@quicinc.com>
Subject: [PATCH 2/3] regulator: qcom-rpmh: Add PMG1110 regulators
Date:   Tue, 23 Nov 2021 17:19:26 +0530
Message-ID: <1637668167-31325-3-git-send-email-quic_c_skakit@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1637668167-31325-1-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PMG1110 regulators.

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 12425f6..684143c 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -814,6 +814,11 @@ static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pmg1110_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510,  "vdd-s1"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmi8998_vreg_data[] = {
 	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
 	{}
@@ -1218,6 +1223,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.data = pm8998_vreg_data,
 	},
 	{
+		.compatible = "qcom,pmg1110-rpmh-regulators",
+		.data = pmg1110_vreg_data,
+	},
+	{
 		.compatible = "qcom,pmi8998-rpmh-regulators",
 		.data = pmi8998_vreg_data,
 	},
-- 
2.7.4

