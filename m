Return-Path: <linux-arm-msm+bounces-57234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21003AAF64A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 11:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F681BC55CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 09:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF8423D284;
	Thu,  8 May 2025 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xd84Beez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD620409A;
	Thu,  8 May 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695126; cv=none; b=HvQFFWwDK4ePrvbXsptsN87wEbpoL7Ty5TL0c1BdGryMKrYEK1qG5pRWpoOWPZF9Na4REnqqENXqaAMzPKnLnvd4TV7h+/2RL6j3jiCZ+mTlr41ROJdyVMadn8pb3SKHfotwQcBESdZJkgl+LYa4TmJvGktvd1gfH9HK2O9OcWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695126; c=relaxed/simple;
	bh=SDFW3a3KRIwQUZZ6xBN65niyqjhRSfMlSew2ThPpfc0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DyHX35kxmUKDOpWWYqkEBXUdzP557dtnRd59P7p8wkvmFc/oVk+d/gCE+SL+X6KAg177jtUWRPzUCp6CjyCliTAu+KZJeLzyHNbrQGqAoZwUxY0ZVOcgza5R78vvAxrkvKkGo47JbnkNDSvQDVlWuJPBLLsUGGibKyauQgVEVoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xd84Beez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484X8Cs009185;
	Thu, 8 May 2025 09:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TYqgRIf8cQ95XS8+LspgXdOve0woyrib+nY
	UFRQRL1c=; b=Xd84BeezfUCLizLm1+HhO53osnyRhvwGHi5PDxqda52xH7CrO8T
	AomQGQfvmFUPgf4LhYWD8+SuUmskQbSAVu91z6Clgq7/NuiaqU+XglAvnPdybHTA
	83EkiM+fHdNYl4E/PelKVewVKYk1L4+tia5e0zupYCZLdVhItbkf6QAklrU3A7c/
	2UdutimotwfY8drlcVPYUEtXEhFbEfE8rO+i6MUY/u9hL/LDxuX/bQS16bAVFx9W
	BE8MaIDtxPfYiTOh69mWa1sPRru0ljvPmxBNrDB7dmoJYiSUwUtKSq1JegkcZ8V6
	yEAnyvA5zt841azPeg9V0sglqOyqnPcj5Yg==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnperp8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:04:57 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54894rTq000428;
	Thu, 8 May 2025 09:04:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mqdxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:04:53 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54894rYx000412;
	Thu, 8 May 2025 09:04:53 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 54894qge000410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 09:04:53 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id BF43D40D09; Thu,  8 May 2025 17:04:51 +0800 (CST)
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
Subject: [PATCH v2] scsi: ufs: core: skip UFS clkscale if host asynchronous scan in progress
Date: Thu,  8 May 2025 17:04:45 +0800
Message-Id: <20250508090449.3264322-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4MSBTYWx0ZWRfX3po/8f18cUOi
 lN10n0aR/ntOAifVab0FOqGU0vFwzpUOm6yUYK4axcHCot/bDf52FLBuy59fLixou5h24Zpt53M
 WIE8ZoA7PcssGN7jmo/vzjE8FxCy1ctPOSe7iWC+LczZ/ViILWLQVL+szxPpb86CGriJApzUvRN
 gfM9BzOP22328S145g2cHza01OJQQOcPsHIvHL4bcwvGsqWNbXtxtctk9SbCDuhEIY5pj6GEU/S
 FkAaPrZFfozwQ88uakCnxWR8y9CwsQsz485nrLRX9W9oMSJpHStxV+mua+rLqG3RxudpFfOsD6Y
 bGuk3g7Of2ZbTIynxrxSe0Z7VtmvlNMP1wG+rhPaOxMbSa/+jrE/nFJrZotOMy45up9vpdHzqBo
 K3llEBDl3BYGgZZq5E1a4D84X7uAnl9i7FOBe5TLqavHYMJIjicdtSf9AkxG70xUkKLMJHZ8
X-Proofpoint-ORIG-GUID: 3I7ZUccAxA1De-F52ByyQk7aXSwLsHXt
X-Proofpoint-GUID: 3I7ZUccAxA1De-F52ByyQk7aXSwLsHXt
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681c73b9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=avOu-EqILVl7MynqQNIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080081

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
---
 drivers/ufs/core/ufshcd.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1c53ccf5a616..3fb414219c00 100644
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
@@ -9010,6 +8998,21 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 	/* Probe and add UFS logical units  */
 	ret = ufshcd_add_lus(hba);
 
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
+
 out:
 	pm_runtime_put_sync(hba->dev);
 
-- 
2.34.1


