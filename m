Return-Path: <linux-arm-msm+bounces-57237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A241CAAF6E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 11:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E57464A24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED272263F43;
	Thu,  8 May 2025 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DUdoslVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109CA5A79B;
	Thu,  8 May 2025 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697168; cv=none; b=uo+ycJRqxO+KDGeU+wsDSgIOTR/z2+ug4dcttSXymBPoDhMHtRtTSxfK9DUzR+jpMEDR/pWAjh4k20eE/89rhdg6C1u+3YAzG/nC3qdholtk7OLIZ/ashFWZTtpdTjC5UDkNGj7mBuN2SPkS4lyFvJsdobV+Ubw3tbk2GZiyQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697168; c=relaxed/simple;
	bh=yHL36ocCfxeq/utyccr6VCpsFhL9r1LtxPcHbVSIKWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WrG00GCRsiz9NqnDJcrN6lDEzZk7D+4N8P4wY+F/sRMcgzkte9UgEsm3SPWwgyvU5+e87W6vdP2oI+FB49MJIuGkKgnLBVHsoBzzO1oUMpGFL9XdPtWmA3Dp8NHLHtmk+VEK0B+1Quu3QQA6e0+XI/8rp4NhXCmRcUV8mm0LBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DUdoslVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WThH014355;
	Thu, 8 May 2025 09:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qG/FDR4jIPDN3P1J0ZljbXUNk7DPM+48V6U
	+OK74WNc=; b=DUdoslVCDrMcoumeK6AALRF8fajFV0dk0MJZ2+sBHHwmEMCBU2+
	zAcZ9tqvyJW3bQUUqQS6v6GUKu1MxkqU8pAiQyxLc5yrurLNEHHPmDIsUHlrScWi
	t+1JxlHVN9pzpZ6ebd05aE5tkrgDV+mNLe/TFloacKgNOCcucXvKEgQD1aaM4oz9
	gEhVtPFhbd0OIQ9fkJuxmNd9KPAUuAHcR2oFFsgvw2FxnxbMf6Tng9HDcZiWJvth
	zgHkINWbLoPfuQZIDunJwIPwSFK5yCfZDSnvwkC6iEtVIYsFIOESN/dNmutcqZKk
	bfAPxTJ9NkSoRht3Qf3VDQrpThIBccf4UBg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4gt5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:39:01 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5489cwRr025863;
	Thu, 8 May 2025 09:38:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7mfnxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:38:58 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5489cwjg025855;
	Thu, 8 May 2025 09:38:58 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5489cvnQ025854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:38:58 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id B981E40D11; Thu,  8 May 2025 17:38:56 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] scsi: ufs: core: skip UFS clkscale if host asynchronous scan in progress
Date: Thu,  8 May 2025 17:38:51 +0800
Message-Id: <20250508093854.3281475-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: IMxl1a_7qZbu-8wh2KhYRZw49trfoYzV
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681c7bb6 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=avOu-EqILVl7MynqQNIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4NyBTYWx0ZWRfX1SG9hUeTQrVp
 QG2JxkGU5o0WdIz9c1qxFwGQjsFtXWpF15L6mnBqdmEARXDeAB0R6sjGpEhpwHPWgM9mH0jQD5H
 hHkASo7AP66iraOg+naV20aY1ZMdRpxuHY/M/zi+HD8mYEpMnjt3xRwFdPTt4ChH1HGSqoaiwKo
 +OUSX/DsyM8YfPPfPBPxz9SP+SIN9VLk5tjGzGVqGmc1jREJVmT+Y1rxx/vrm/+O+5xdHAyrNIh
 QfHQ3fgUEjntW+J4sqIIa/qsGZbIitOF191LcPWaQahX3d5vXV2ZH3Tv4DAjm4UE2i5WAGbQrM3
 Vg1zyciYNi1WD3a1ZKIy6/S2G546gEFx/6k291a1oJV3MZl+FLa8W4PgB6nlMwxsQcgpBahVkst
 WYDgF8qU0VXjwiz/xEUQYWiFOK7PgcjCwD8bC1p/yAhrYT8hEBJ8m1JydFmiNVFkHOEhWOCH
X-Proofpoint-ORIG-GUID: IMxl1a_7qZbu-8wh2KhYRZw49trfoYzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080087

When preparing for UFS clock scaling, the UFS driver will quiesce all sdevs
queues on the UFS SCSI host tagset list and then unquiesce them when UFS
clock scaling unpreparing. If the UFS SCSI host async scan is in progress
at this time, some LUs may be added to the tagset list between UFS clkscale
prepare and unprepare. This can cause two issues:

1. During clock scaling, there may be IO requests issued through new added
queues that have not been quiesced, leading to task abort issue.

2. These new added queues that have not been quiesced will be unquiesced as
well when UFS clkscale is unprepared, resulting in warning prints.

Therefore, use the flag host->async_scan to check whether the host async
scan is in progress or not. Additionally, move ufshcd_devfreq_init() to
after ufshcd_add_lus() to ensure this flag already be set before starting
devfreq monitor.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Move whole clkscale Initialize process out of ufshcd_add_lus().

v2 -> v3:
Add check for the return value of ufshcd_add_lus().
---
 drivers/ufs/core/ufshcd.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1c53ccf5a616..04f40677e76a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1207,6 +1207,9 @@ static bool ufshcd_is_devfreq_scaling_required(struct ufs_hba *hba,
 	if (list_empty(head))
 		return false;
 
+	if (hba->host->async_scan)
+		return false;
+
 	if (hba->use_pm_opp)
 		return freq != hba->clk_scaling.target_freq;
 
@@ -8740,21 +8743,6 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 
-	/* Initialize devfreq after UFS device is detected */
-	if (ufshcd_is_clkscaling_supported(hba)) {
-		memcpy(&hba->clk_scaling.saved_pwr_info,
-			&hba->pwr_info,
-			sizeof(struct ufs_pa_layer_attr));
-		hba->clk_scaling.is_allowed = true;
-
-		ret = ufshcd_devfreq_init(hba);
-		if (ret)
-			goto out;
-
-		hba->clk_scaling.is_enabled = true;
-		ufshcd_init_clk_scaling_sysfs(hba);
-	}
-
 	/*
 	 * The RTC update code accesses the hba->ufs_device_wlun->sdev_gendev
 	 * pointer and hence must only be started after the WLUN pointer has
@@ -9009,6 +8997,23 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 
 	/* Probe and add UFS logical units  */
 	ret = ufshcd_add_lus(hba);
+	if (ret)
+		goto out;
+
+	/* Initialize devfreq and start devfreq monitor */
+	if (ufshcd_is_clkscaling_supported(hba)) {
+		memcpy(&hba->clk_scaling.saved_pwr_info,
+			&hba->pwr_info,
+			sizeof(struct ufs_pa_layer_attr));
+		hba->clk_scaling.is_allowed = true;
+
+		ret = ufshcd_devfreq_init(hba);
+		if (ret)
+			goto out;
+
+		hba->clk_scaling.is_enabled = true;
+		ufshcd_init_clk_scaling_sysfs(hba);
+	}
 
 out:
 	pm_runtime_put_sync(hba->dev);
-- 
2.34.1


