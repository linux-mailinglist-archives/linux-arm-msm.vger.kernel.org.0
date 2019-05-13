Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAED1B3CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 12:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728959AbfEMKUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 06:20:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55910 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727690AbfEMKUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 06:20:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5E27A60DA8; Mon, 13 May 2019 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742844;
        bh=zS8DrOz5WurZvcV/n0BwH0EBgvkhjyGk4NDqv1Y+o6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IR1D3bp5NcaU3rCQKTB2AEp9Vp0Qc0bOhwkeToZsAZkdPbH+FJLzFIDxnz68j+Cde
         8OPen/xQfG5OXe0+D2XdDzq/p93BVah74832hg7V0Gvuh4WdyqGNIGG3nbiBM3AX/r
         PPf4H+D4kdy77Gn4hb/SrY3d5OR0NR8crwaWyYvs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B2DB60A0A;
        Mon, 13 May 2019 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557742843;
        bh=zS8DrOz5WurZvcV/n0BwH0EBgvkhjyGk4NDqv1Y+o6s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bwVRFOy7nd6up2G5sI/5VF1g+de7UGc8sUf7vooSgACfsBdvO8XzNJacPwBxQ3wp6
         WrgpMvrMaPYcH4RsEBPuDeMC1xw0NQAHp9Y3hd/X4GDVgi1UWHx6/hkT7MnJ+Btces
         5OTL82HmBv8RwjbszSnYNtuylls+cVQiXXrBeiTc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B2DB60A0A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org
Cc:     david.brown@linaro.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        marc.w.gonzalez@free.fr, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 3/9] soc: qcom: rpmpd: Modify corner defining macros
Date:   Mon, 13 May 2019 15:50:09 +0530
Message-Id: <20190513102015.26551-4-sibis@codeaurora.org>
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

QCS404 uses individual resource type magic for each power-domain, so
adjust the macros slightly to make them reusable for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[sibi: Extend rpmpd corner pair to a generic rpmpd pair]
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/rpmpd.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
index 94015ece40e9..bac4499c269d 100644
--- a/drivers/soc/qcom/rpmpd.c
+++ b/drivers/soc/qcom/rpmpd.c
@@ -16,7 +16,8 @@
 
 #define domain_to_rpmpd(domain) container_of(domain, struct rpmpd, pd)
 
-/* Resource types */
+/* Resource types:
+ * RPMPD_X is X encoded as a little-endian, lower-case, ASCII string */
 #define RPMPD_SMPA 0x61706d73
 #define RPMPD_LDOA 0x616f646c
 
@@ -27,46 +28,41 @@
 
 #define MAX_8996_RPMPD_STATE	6
 
-#define DEFINE_RPMPD_CORNER_SMPA(_platform, _name, _active, r_id)		\
+#define DEFINE_RPMPD_PAIR(_platform, _name, _active, r_type, r_key,	\
+			  r_id)						\
 	static struct rpmpd _platform##_##_active;			\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = {	.name = #_name,	},				\
 		.peer = &_platform##_##_active,				\
-		.res_type = RPMPD_SMPA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
-		.key = KEY_CORNER,					\
+		.key = KEY_##r_key,					\
 	};								\
 	static struct rpmpd _platform##_##_active = {			\
 		.pd = { .name = #_active, },				\
 		.peer = &_platform##_##_name,				\
 		.active_only = true,					\
-		.res_type = RPMPD_SMPA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
-		.key = KEY_CORNER,					\
+		.key = KEY_##r_key,					\
 	}
 
-#define DEFINE_RPMPD_CORNER_LDOA(_platform, _name, r_id)			\
+#define DEFINE_RPMPD_CORNER(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
-		.res_type = RPMPD_LDOA,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
 		.key = KEY_CORNER,					\
 	}
 
-#define DEFINE_RPMPD_VFC(_platform, _name, r_id, r_type)		\
+#define DEFINE_RPMPD_VFC(_platform, _name, r_type, r_id)		\
 	static struct rpmpd _platform##_##_name = {			\
 		.pd = { .name = #_name, },				\
-		.res_type = r_type,					\
+		.res_type = RPMPD_##r_type,				\
 		.res_id = r_id,						\
 		.key = KEY_FLOOR_CORNER,				\
 	}
 
-#define DEFINE_RPMPD_VFC_SMPA(_platform, _name, r_id)			\
-	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_SMPA)
-
-#define DEFINE_RPMPD_VFC_LDOA(_platform, _name, r_id)			\
-	DEFINE_RPMPD_VFC(_platform, _name, r_id, RPMPD_LDOA)
-
 struct rpmpd_req {
 	__le32 key;
 	__le32 nbytes;
@@ -96,12 +92,12 @@ struct rpmpd_desc {
 static DEFINE_MUTEX(rpmpd_lock);
 
 /* msm8996 RPM Power domains */
-DEFINE_RPMPD_CORNER_SMPA(msm8996, vddcx, vddcx_ao, 1);
-DEFINE_RPMPD_CORNER_SMPA(msm8996, vddmx, vddmx_ao, 2);
-DEFINE_RPMPD_CORNER_LDOA(msm8996, vddsscx, 26);
+DEFINE_RPMPD_PAIR(msm8996, vddcx, vddcx_ao, SMPA, CORNER, 1);
+DEFINE_RPMPD_PAIR(msm8996, vddmx, vddmx_ao, SMPA, CORNER, 2);
+DEFINE_RPMPD_CORNER(msm8996, vddsscx, LDOA, 26);
 
-DEFINE_RPMPD_VFC_SMPA(msm8996, vddcx_vfc, 1);
-DEFINE_RPMPD_VFC_LDOA(msm8996, vddsscx_vfc, 26);
+DEFINE_RPMPD_VFC(msm8996, vddcx_vfc, SMPA, 1);
+DEFINE_RPMPD_VFC(msm8996, vddsscx_vfc, LDOA, 26);
 
 static struct rpmpd *msm8996_rpmpds[] = {
 	[MSM8996_VDDCX] =	&msm8996_vddcx,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

