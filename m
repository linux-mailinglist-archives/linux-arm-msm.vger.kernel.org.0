Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A918A1B3D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbfEMKVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:21:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57112 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbfEMKVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:21:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A23AE6133A; Mon, 13 May 2019 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742862;
        bh=j17qIR3BojET2TpDawz2tsLoDZdsKT4XbQ6tUloMJ4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czCUEBmALbJx7v1ridcI8moS0kY5nJ/evnEU/JTbgaiZf7WhCvv+HcZK1Qn+TL86M
         3XI4RISkAZMsQl3ulamLyMJkHbXF+ySQuAX3IA5yeoDLSugp2y1wNlWRvfYMTKcuha
         ebPpUb1Rjs0CUGoN59yPttL1OSJY1PA9LicWi0Aw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB7F1611DC;
        Mon, 13 May 2019 10:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742861;
        bh=j17qIR3BojET2TpDawz2tsLoDZdsKT4XbQ6tUloMJ4c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZEHlaYb6n0BvjrboXmtxmjRHV5Kr4fLaTgZv8fyixXKJ2wfYu4mfag4AG0P8V9O8
         460OvJBzqiqzT9Mn9WYXNWdHcw/28yBlN+H++KiV0+W7DNazsstthJuEIaS+jjomMe
         XrOqEzrsgbdtqpj2nJ+sT5ApTl8wAkoFtBwVxbPg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB7F1611DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 8/9] soc: qcom: rpmpd: Add MSM8998 power-domains
Date:   Mon, 13 May 2019 15:50:14 +0530
Message-Id: <20190513102015.26551-9-sibis@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the shared cx/mx and sensor sub-system's cx and mx
power-domains found on MSM8998.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 63db8b26642c..3c1a55cf25d6 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -20,9 +20,12 @@
  * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
+#define RPMPD_RWCX 0x78637772
 #define RPMPD_RWMX 0x786d7772
 #define RPMPD_RWLC 0x636c7772
 #define RPMPD_RWLM 0x6d6c7772
+#define RPMPD_RWSC 0x63737772
+#define RPMPD_RWSM 0x6d737772
 
 /* Operation Keys */
 #define KEY_CORNER		0x6e726f63 /* corn */
@@ -136,6 +139,38 @@ static const struct rpmpd_desc msm8996_desc = {
 	.max_state = MAX_8996_RPMPD_STATE,
 };
 
+/* msm8998 RPM Power domains */
+DEFINE_RPMPD_PAIR(msm8998, vddcx, vddcx_ao, RWCX, LEVEL, 0);
+DEFINE_RPMPD_VFL(msm8998, vddcx_vfl, RWCX, 0);
+
+DEFINE_RPMPD_PAIR(msm8998, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(msm8998, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(msm8998, vdd_ssccx, RWSC, 0);
+DEFINE_RPMPD_VFL(msm8998, vdd_ssccx_vfl, RWSC, 0);
+
+DEFINE_RPMPD_LEVEL(msm8998, vdd_sscmx, RWSM, 0);
+DEFINE_RPMPD_VFL(msm8998, vdd_sscmx_vfl, RWSM, 0);
+
+static struct rpmpd *msm8998_rpmpds[] = {
+	[MSM8998_VDDCX] =		&msm8998_vddcx,
+	[MSM8998_VDDCX_AO] =		&msm8998_vddcx_ao,
+	[MSM8998_VDDCX_VFL] =		&msm8998_vddcx_vfl,
+	[MSM8998_VDDMX] =		&msm8998_vddmx,
+	[MSM8998_VDDMX_AO] =		&msm8998_vddmx_ao,
+	[MSM8998_VDDMX_VFL] =		&msm8998_vddmx_vfl,
+	[MSM8998_SSCCX] =		&msm8998_vdd_ssccx,
+	[MSM8998_SSCCX_VFL] =		&msm8998_vdd_ssccx_vfl,
+	[MSM8998_SSCMX] =		&msm8998_vdd_sscmx,
+	[MSM8998_SSCMX_VFL] =		&msm8998_vdd_sscmx_vfl,
+};
+
+static const struct rpmpd_desc msm8998_desc = {
+	.rpmpds = msm8998_rpmpds,
+	.num_pds = ARRAY_SIZE(msm8998_rpmpds),
+	.max_state = RPM_SMD_LEVEL_BINNING,
+};
+
 /* qcs404 RPM Power domains */
 DEFINE_RPMPD_PAIR(qcs404, vddmx, vddmx_ao, RWMX, LEVEL, 0);
 DEFINE_RPMPD_VFL(qcs404, vddmx_vfl, RWMX, 0);
@@ -164,6 +199,7 @@ static const struct rpmpd_desc qcs404_desc = {
 
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
+	{ .compatible = "qcom,msm8998-rpmpd", .data = &msm8998_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

