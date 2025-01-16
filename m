Return-Path: <linux-arm-msm+bounces-45234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3FA1364B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9735E1661CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A181D90B9;
	Thu, 16 Jan 2025 09:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klivSI/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322DC1D90DB;
	Thu, 16 Jan 2025 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737018791; cv=none; b=jN1v3AVO0+qBkHbBlTnc404TMDjTHLll8rF73eJEwCB+6DGkkJdiANcMLE4p58oFHM79Rd+JVF6TOXb3BfhEIwq5gaulv/tARfaTmhjWucrmIwq4ehIwq0+sfBo10fiHdQccc3GeUMTIv2htgOosIXr5cAai/NYnVDli5QiJxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737018791; c=relaxed/simple;
	bh=s32R7Z5olqGLC1ixjklio+OQMeBk4GmAyD+75caulVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eM27jtM/sHQBfK9Aq9DjBsPnnu+n9ufFQIAQJjzz5RN/qlvsKnoF+fpAj3lVmT7n63NhmLgCUvHo17Gmg/5ePPSdeVgNKdniLIfm5U7f+63jQM3D7/bgu8uylZErhdN6DbEfABF+uEDDN392t97c4zMtv9TYKM/hnpZEemwj/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klivSI/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G85r20006706;
	Thu, 16 Jan 2025 09:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E/B4RC/CYA6
	opO8SlHzqwoeCuDHZELHmDDuzV1utiFQ=; b=klivSI/Dn6rYYP2hbFmw0O4AGdi
	YBKP18x4HEs+aU0ZGN77mdHXR6X078Ki2n2fy4EF24oiPIcUPbnuCVHHEzbyKjm2
	PBvkbAZb/0F5ojXQpRY3g8V1zMB9v97yMCzLAy8Ckkp1ga1zECUE5RuRDYAc7Zxt
	wskKFZqPwIFTrKklKM4WJflCi+jjlE9LG0fh9WoGR8MW4HJC6xAmZXg8E111ExIs
	R4R26YGaEglK2f1LgliO9W/S/kFE5T3gmH2M9ErUlMI+eswYcyn0kbuo38d8Qh+K
	cqM/BPj+pqsRWqc30wvHbV32v4gGsq/HXS4FtdpJuwh9+sFUVg8nbVHr9xg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446xa4r5kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9Ci03032498;
	Thu, 16 Jan 2025 09:12:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4442bf51rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:44 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50G9CiRh032492;
	Thu, 16 Jan 2025 09:12:44 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50G9Ci4U032490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:44 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 8D1F540BF9; Thu, 16 Jan 2025 17:12:43 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
Date: Thu, 16 Jan 2025 17:11:43 +0800
Message-Id: <20250116091150.1167739-3-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 256F37nh8W8haEm1YM7oybGGgP2jPAon
X-Proofpoint-GUID: 256F37nh8W8haEm1YM7oybGGgP2jPAon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160067

From: Can Guo <quic_cang@quicinc.com>

If OPP V2 is used, devfreq clock scaling may scale clock amongst more than
two freqs. In the case of scaling up, the devfreq may decide to scale the
clock to an intermidiate freq base on load, but the clock scale up pre
change operation uses settings for the max clock freq unconditionally. Fix
it by passing the target_freq to clock scale up pre change so that the
correct settings for the target_freq can be used.

In the case of scaling down, the clock scale down post change operation
is doing fine, because it reads the actual clock rate to tell freq, but to
keep symmetry with clock scale up pre change operation, just use the
target_freq instead of reading clock rate.

Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b6eef975dc46..1e8a23eb8c13 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -97,7 +97,7 @@ static const struct __ufs_qcom_bw_table {
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up);
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -524,7 +524,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 			return -EINVAL;
 		}
 
-		err = ufs_qcom_set_core_clk_ctrl(hba, true);
+		err = ufs_qcom_set_core_clk_ctrl(hba, ULONG_MAX);
 		if (err)
 			dev_err(hba->dev, "cfg core clk ctrl failed\n");
 		/*
@@ -1231,7 +1231,7 @@ static int ufs_qcom_set_clk_40ns_cycles(struct ufs_hba *hba,
 	return ufshcd_dme_set(hba, UIC_ARG_MIB(PA_VS_CORE_CLK_40NS_CYCLES), reg);
 }
 
-static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
+static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct list_head *head = &hba->clk_list_head;
@@ -1245,10 +1245,11 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 		    !strcmp(clki->name, "core_clk_unipro")) {
 			if (!clki->max_freq)
 				cycles_in_1us = 150; /* default for backwards compatibility */
-			else if (is_scale_up)
+			else if (freq == ULONG_MAX)
 				cycles_in_1us = ceil(clki->max_freq, (1000 * 1000));
 			else
-				cycles_in_1us = ceil(clk_get_rate(clki->clk), (1000 * 1000));
+				cycles_in_1us = ceil(freq, (1000 * 1000));
+
 			break;
 		}
 	}
@@ -1285,7 +1286,7 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 	return ufs_qcom_set_clk_40ns_cycles(hba, cycles_in_1us);
 }
 
-static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
+static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba, unsigned long freq)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_pa_layer_attr *attr = &host->dev_req_params;
@@ -1298,7 +1299,7 @@ static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
 		return ret;
 	}
 	/* set unipro core clock attributes and clear clock divider */
-	return ufs_qcom_set_core_clk_ctrl(hba, true);
+	return ufs_qcom_set_core_clk_ctrl(hba, freq);
 }
 
 static int ufs_qcom_clk_scale_up_post_change(struct ufs_hba *hba)
@@ -1327,10 +1328,10 @@ static int ufs_qcom_clk_scale_down_pre_change(struct ufs_hba *hba)
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
@@ -1349,7 +1350,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (err)
 			return err;
 		if (scale_up)
-			err = ufs_qcom_clk_scale_up_pre_change(hba);
+			err = ufs_qcom_clk_scale_up_pre_change(hba, target_freq);
 		else
 			err = ufs_qcom_clk_scale_down_pre_change(hba);
 
@@ -1361,7 +1362,7 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 		if (scale_up)
 			err = ufs_qcom_clk_scale_up_post_change(hba);
 		else
-			err = ufs_qcom_clk_scale_down_post_change(hba);
+			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
 
 
 		if (err) {
-- 
2.34.1


