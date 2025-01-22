Return-Path: <linux-arm-msm+bounces-45793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C69F7A18F1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39B0161AEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1342101A0;
	Wed, 22 Jan 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OohxqFP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B41A8F9E;
	Wed, 22 Jan 2025 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540260; cv=none; b=VbrNnpGNe901fu3sO0kbfSZkjCWnjAsw2cavbgOlotliyNbuHMj5ep6XWGM7d90Goh9/gc0u+DFkahjOSkSyjyGVhSJ0yNq7xkODLkV0ke4Czbm7Y0vGLzIncC/al8c6BpOAel5JuDRoI1KJfH897nJosy8vlnQ2gWp6cDF3VRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540260; c=relaxed/simple;
	bh=Y+1UXEv0sAS1R8lC0TcZYUVNq1Dn8rSBBl2edGAYp1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jAZSk78/za4x03D+9804RXNZX2+2tbQIbeFGw3WrQIE+f86hMsLURG+/768RFw1+Nhrf8ThvJxGZCGQO/IZSrvG7DoFwzqtGcW95hcG8jZOpuiqP+esL/GrTIGgqsBe60rcCsU3FuVxYXKRr2DDb0nhrJbgsd8ffDFStVKYvxf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OohxqFP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M9oZSD002851;
	Wed, 22 Jan 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QR0iLWPag26
	XA2+Ww2nhvdtQgvnJfCbI95nJwwfTHak=; b=OohxqFP4gKXsdRyQdfMB0H3BXzW
	K69/Q1neFxUPC2lM8bvotsWm4UD8yHYvrr3SZ1Au2ShRD4XZZjof+QwpzI/33+ji
	uWUfgvVX1xAG8irPJaOxBS2YH1ftDGKRnKI/ZliqPYRMDXjlczgGIoVROqIf69mw
	JK1QpkiHvV5SVfYLqRBkEqXMwdFH3HrkBsZ13xRXxkOyjzuFOBTZ8wEO9a8XuAtc
	gjf3X4xE011skJE6jlpYs9ccUEyMmgUUAY+Q5i1YmzT0Drdbbpsa7P3BrfopsXO3
	hpAWmseZdMAODT+YrvgowpsIJzT8aZmv4WoyY5ex67Vnl0MOp1LCgs8ZjKA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44axd8g17h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:58 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA2uwR013290;
	Wed, 22 Jan 2025 10:02:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485ckuanh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:56 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA2tZC013284;
	Wed, 22 Jan 2025 10:02:55 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50MA2tfN013283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:55 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id A766440CEA; Wed, 22 Jan 2025 18:02:54 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
Date: Wed, 22 Jan 2025 18:02:08 +0800
Message-Id: <20250122100214.489749-3-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 50V0PblW44zVGbOdz5Q8JJSpBZ_R8CmG
X-Proofpoint-GUID: 50V0PblW44zVGbOdz5Q8JJSpBZ_R8CmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220073

From: Can Guo <quic_cang@quicinc.com>

Instead of only two frequencies, If OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies. In the case of
scaling up, the devfreq may decide to scale the clock to an intermidiate
freq base on load, but the clock scale up pre change operation uses
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
---

v1 -> v2:
1. Modify commit message to make it more clear.
2. Use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl().
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


