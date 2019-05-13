Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB901B3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbfEMKUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:20:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56786 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbfEMKUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:20:53 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 61B7061157; Mon, 13 May 2019 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742852;
        bh=tx4lpJiLY6uEc/yWnowsmX4GLmrZr+OIrz370A8ASUs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YxKtefOBGA6kXjwXzpBADDvLLGBuQPpNvUpqrkVK52/AiE3kiLWcSRbPgELZFRAWK
         ayfaaLL/xc9plrNGcoOCuR3hVkZuq/+BlcsETWb6fpe64aMAtjavdeJ+uwXVa74OzI
         DvN3dhHClQ7HzxelYiFbMfvpwrh4I31et7FRZ6Eg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CEE860FE9;
        Mon, 13 May 2019 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742851;
        bh=tx4lpJiLY6uEc/yWnowsmX4GLmrZr+OIrz370A8ASUs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BNgGssgFWVc/BaKNK48lFGC4JXMJmNmd1G6Ms1fcvnGs44PnbKKijIDXqVJ/bPLfX
         FPFHYpyW7gii50BEp6Rh44O1fC6jLgGKh2kMpPEWZQK+iOOmHOv00J1ATkE6dueAAy
         0j7pr/ADfbR5PcyWLHD7a639R/58U4oiAn2hFvaM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CEE860FE9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 5/9] soc: qcom: rpmpd: Add QCS404 power-domains
Date:   Mon, 13 May 2019 15:50:11 +0530
Message-Id: <20190513102015.26551-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513102015.26551-1-sibis@codeaurora.org>
References: <20190513102015.26551-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the shared cx/mx and the low-power-island's cx and mx power-domains
found on QCS404.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[sibi: Fixup corner/vfc with vlfl/vfl]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 52 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index bac4499c269d..63db8b26642c 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -20,11 +20,16 @@
  * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
+#define RPMPD_RWMX 0x786d7772
+#define RPMPD_RWLC 0x636c7772
+#define RPMPD_RWLM 0x6d6c7772
 
 /* Operation Keys */
 #define KEY_CORNER		0x6e726f63 /* corn */
 #define KEY_ENABLE		0x6e657773 /* swen */
 #define KEY_FLOOR_CORNER	0x636676   /* vfc */
+#define KEY_FLOOR_LEVEL		0x6c6676   /* vfl */
+#define KEY_LEVEL		0x6c766c76 /* vlvl */
 
 #define MAX_8996_RPMPD_STATE	6
 
@@ -55,6 +60,14 @@
 		.key = KEY_CORNER,					\
 	}
 
+#define DEFINE_RPMPD_LEVEL(_platform, _name, r_type, r_id)		\
+	static struct rpmpd _platform##_##_name = {			\
+		.pd = { .name = #_name, },				\
+		.res_type = RPMPD_##r_type,				\
+		.res_id = r_id,						\
+		.key = KEY_LEVEL,					\
+	}
+
 #define DEFINE_RPMPD_VFC(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
@@ -63,6 +76,14 @@
 		.key = KEY_FLOOR_CORNER,				\
 	}
 
+#define DEFINE_RPMPD_VFL(_platform, _name, r_type, r_id)		\
+	static struct rpmpd _platform##_##_name = {			\
+		.pd = { .name = #_name, },				\
+		.res_type = RPMPD_##r_type,				\
+		.res_id = r_id,						\
+		.key = KEY_FLOOR_LEVEL,					\
+	}
+
 struct rpmpd_req {
 	__le32 key;
 	__le32 nbytes;
@@ -115,8 +136,35 @@ static const struct rpmpd_desc msm8996_desc = {
 	.max_state = MAX_8996_RPMPD_STATE,
 };
 
+/* qcs404 RPM Power domains */
+DEFINE_RPMPD_PAIR(qcs404, vddmx, vddmx_ao, RWMX, LEVEL, 0);
+DEFINE_RPMPD_VFL(qcs404, vddmx_vfl, RWMX, 0);
+
+DEFINE_RPMPD_LEVEL(qcs404, vdd_lpicx, RWLC, 0);
+DEFINE_RPMPD_VFL(qcs404, vdd_lpicx_vfl, RWLC, 0);
+
+DEFINE_RPMPD_LEVEL(qcs404, vdd_lpimx, RWLM, 0);
+DEFINE_RPMPD_VFL(qcs404, vdd_lpimx_vfl, RWLM, 0);
+
+static struct rpmpd *qcs404_rpmpds[] = {
+	[QCS404_VDDMX] = &qcs404_vddmx,
+	[QCS404_VDDMX_AO] = &qcs404_vddmx_ao,
+	[QCS404_VDDMX_VFL] = &qcs404_vddmx_vfl,
+	[QCS404_LPICX] = &qcs404_vdd_lpicx,
+	[QCS404_LPICX_VFL] = &qcs404_vdd_lpicx_vfl,
+	[QCS404_LPIMX] = &qcs404_vdd_lpimx,
+	[QCS404_LPIMX_VFL] = &qcs404_vdd_lpimx_vfl,
+};
+
+static const struct rpmpd_desc qcs404_desc = {
+	.rpmpds = qcs404_rpmpds,
+	.num_pds = ARRAY_SIZE(qcs404_rpmpds),
+	.max_state = RPM_SMD_LEVEL_BINNING,
+};
+
 static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,msm8996-rpmpd", .data = &msm8996_desc },
+	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ }
 };
 
@@ -231,7 +279,9 @@ static int rpmpd_set_performance(struct generic_pm_domain *domain,
 
 	pd->corner = state;
 
-	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER)
+	/* Always send updates for vfc and vfl */
+	if (!pd->enabled && pd->key != KEY_FLOOR_CORNER &&
+	    pd->key != KEY_FLOOR_LEVEL)
 		goto out;
 
 	ret = rpmpd_aggregate_corner(pd);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

