Return-Path: <linux-arm-msm+bounces-47395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32553A2E875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C9F71884F46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066EB1CAA82;
	Mon, 10 Feb 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eb+TDdi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8AF1C9B97;
	Mon, 10 Feb 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181766; cv=none; b=dxukiJRHFZkVqZOJBreRb0xkSlfyR+lYTRLMvSf8pNC6JG+XwBSNeUGKdO+LjUbc92cR82D/tr/xkkSBzQDEpcT4bGZ6MBDHqhYbl2isogt2pP56QqMfp1D4iluz9kacYSDg+inzM8hrnXZhqOoQAAEDzhOHgC0VI3EifiWimyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181766; c=relaxed/simple;
	bh=KsifX+SI3C9ydRvkJiO+RHklpEGqsNxEU81bZs79DeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AIp+ufGwXjT4B6lyNqmKMzk8BaFZ7Qu6K5kmY6mRSMkPal60e9vW9M2qe4jf7z+NeImSva7OaU2UqHRuN51dInTLfuc8TQNULfdU9UnadJvLYP6SGdcBC++w3iTtwHNLPqokG0fTAVDWVNzfq0rDRNrUZXx89F8IpJ0pD+wwv1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eb+TDdi2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9gNhV022140;
	Mon, 10 Feb 2025 10:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZbNeAT+Nk5q
	dxjOenvov1AVtd8JOupOgkIV9SkeOqwU=; b=eb+TDdi22ws9pbK+uaLd86VI/2u
	kCvI4REEagC07BnIbkOyFF2yiORMQ+o4bx+GqVNVqy4anSkfwipBHaUEWQ6MuhkF
	gy8Rzn8wg6aljY72VycIn58m2k5B61QnXzuFbVJ88lirmGy7Zo7PrYiKGHHIZbPe
	Oyn5udZYt7zFk84aKnf65QSUyk9bAPc3zLFgcB4FXhGC7zjx6gEOZJ/0tBqtdBcl
	kNsDwhL2nJ6t3eFObkIllAMcqKYCm0KrVmfpFWgrkZYW4gBNG0ENMnaXWdzo/+qV
	pCOGOknC40a1Q9o9iGhTJorRP5fNY9niuXzYtUsXy/iveLxRegs3ty78oRw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0esby50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:29 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2Qje011643;
	Mon, 10 Feb 2025 10:02:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkj1g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:26 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2Qlt011636;
	Mon, 10 Feb 2025 10:02:26 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51AA2PCH011633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:26 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 2807540BF7; Mon, 10 Feb 2025 18:02:25 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
Date: Mon, 10 Feb 2025 18:02:05 +0800
Message-Id: <20250210100212.855127-3-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
References: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PHyPeO0nFCITJVt1l423_CPnaOXG7tev
X-Proofpoint-ORIG-GUID: PHyPeO0nFCITJVt1l423_CPnaOXG7tev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100084

From: Can Guo <quic_cang@quicinc.com>

Instead of only two frequencies, if OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies. In the case of
scaling up, the devfreq may decide to scale the clock to an intermediate
freq based on load, but the clock scale up pre change operation uses
settings for the max clock freq unconditionally. Fix it by passing the
target_freq to clock scale up pre change so that the correct settings for
the target_freq can be used.

In the case of scaling down, the clock scale down post change operation
is doing fine, because it reads the actual clock rate to tell freq, but to
keep symmetry with clock scale up pre change operation, just use the
target_freq instead of reading clock rate.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
---

v1 -> v2:
1. Modify commit message to make it more clear.
2. Use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl().

v2 -> v3:
Commit message typo fixed.
---
 drivers/ufs/host/ufs-qcom.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b6eef975dc46..a1eb3cab45e4 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/time.h>
+#include <linux/units.h>
 
 #include <soc/qcom/ice.h>
 
@@ -97,7 +98,7 @@ static const struct __ufs_qcom_bw_table {
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -524,7 +525,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 			return -EINVAL;
 		}
 
-		err = ufs_qcom_set_core_clk_ctrl(hba, true);
+		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
 		if (err)
 			dev_err(hba->dev, "cfg core clk ctrl failed\n");
 		/*
@@ -1231,7 +1232,7 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
 	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
 }
 
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
@@ -1245,10 +1246,11 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 		    !strcmp(clki->name, "core_clk_unipro")) {
 			if (!clki->max_freq)
 				cycles_in_1us = 150; /* default for backwards compatibility */
-			else if (is_scale_up)
-				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
+			else if (freq == ULONG_MAX)
+				cycles_in_1us = ceil(clki->max_freq, HZ_PER_MHZ);
 			else
-				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
+				cycles_in_1us = ceil(freq, HZ_PER_MHZ);
+
 			break;
 		}
 	}
@@ -1285,7 +1287,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 	return ufs_qcom_set_clk_40ns_cycles(hba, cycles_in_1us);
 }
 
-static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
+static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_pa_layer_attr *attr = &host->dev_req_params;
@@ -1298,7 +1300,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
 		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, true);
+	return ufs_qcom_set_core_clk_ctrl(hba, freq);
 }
 
 static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
@@ -1327,10 +1329,10 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
 	return err;
 }
 
-static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
+static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba, unsigned long freq)
 {
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, false);
+	return ufs_qcom_set_core_clk_ctrl(hba, freq);
 }
 
 static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
@@ -1349,7 +1351,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (err)
 			return err;
 		if (scale_up)
-			err = ufs_qcom_clk_scale_up_pre_change(hba);
+			err = ufs_qcom_clk_scale_up_pre_change(hba, target_freq);
 		else
 			err = ufs_qcom_clk_scale_down_pre_change(hba);
 
@@ -1361,7 +1363,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_post_change(hba);
 		else
-			err = ufs_qcom_clk_scale_down_post_change(hba);
+			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
 
 		if (err) {
-- 
2.34.1


