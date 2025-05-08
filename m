Return-Path: <linux-arm-msm+bounces-57225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BCAAF523
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698E31BC786C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A6D21D5AF;
	Thu,  8 May 2025 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YfNJliM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385E21018F;
	Thu,  8 May 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691595; cv=none; b=EO/wnQBIu6TuJRX23UibzhfwY9tbyG1bNkQnXGidL6BSpxAy/XzOiM29ehFApDuEEoxV43ihFE6JDveZlAmFouOUMQoAjA8ZWbEVtOL+AqKZpM2pqr+bKLh+G90jjnd5C3xMPoezu4VY0AdEX/euXyS+VvgM4NqPvuMsvoGQKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691595; c=relaxed/simple;
	bh=SeaJFQyN+Jgqcbwwx1GEs6uyzWMNyfeHGNk0yvHFNes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e7m/PdDt8cvD1h8Z+wj5RQHPoYEjEnqHLyBuhAjRyVJpS5A1x9p82GNOApJlpQYaK7bVHE1n2B9nRCmxENUi3MwuNnXP5qtfcH7s8ZsYL043TUkSsuPTxau8z8fAe9m0Q8+jEsfwCwgVwhpp9qnYPXlgWSIe5DFsOGTtwFv6g4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YfNJliM2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WnDI016860;
	Thu, 8 May 2025 08:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JZSYlY5LSq90+AfJ6VFESTbxi5r5XoyqRpM
	YqEywCXQ=; b=YfNJliM23eHvxeIymvRBd2eKz1EZ2bpKmqLJImGV/kdsAdsoKlO
	KmuaAqTYlEer/RS+V4oKawmA5RNz9d5kwg0KL/rr8/VrIfBtdnbOJWUjPr2h5mgQ
	Rz6KiEBW/Bc4t54yq5A+CDY2oLbpPPeOS4hHI9Ju+cHkXvQEv2CyqoB2doXi7ben
	Nro3k8HDsT/i6z3gO2oMywWburmngGicRi9F701Rlm0Ojy8q5zUrzGjwEhumbM28
	YScbsvMehNZwdXCbO0ZVjqRKwOb4DHlgixP565ntAv4fd6DY+Zyeewof7cygb1t9
	BA/0gsjuU0e4TQTI7P2whZVsajO689ccHNQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp68gfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:06:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 548866bB005123;
	Thu, 8 May 2025 08:06:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq3u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:06:06 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 548866EF005114;
	Thu, 8 May 2025 08:06:06 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 548865cj005106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:06:06 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id C969C40D0D; Thu,  8 May 2025 16:06:03 +0800 (CST)
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
Subject: [PATCH] scsi: ufs: core: skip UFS clkscale if host asynchronous scan in progress
Date: Thu,  8 May 2025 16:05:00 +0800
Message-Id: <20250508080503.3225174-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MCBTYWx0ZWRfX7blO2ID0jNEd
 XwCqJ3LWH1J3uwcoa67n3eYZRbUUQt0HJYgSOubWhuh6OvM57e/sbU70nEBN57dMkZ5vyuLwox0
 hksJQ1P2v2s+cXEybaNxFOygPZDBExYd96/NMDeC4PsawfiO8cZHEsBwUBbX8wn9gQv/fXMRaT5
 OQCtquWiiHYsYBnzxhj90sCw7sFNiTw5GvX7FI82h4ouuSdK5nu/5Y/8pDc7hRrzDPF3MnatgRw
 O9ORT/ZHDOTp69iwz+3w4dx+FNpKMIxchJm3bfU0lKWRAgJsGh/+cfAuMi9XrrFs6H1b4XajHdv
 bEg+mgCNaJLRhpY+G2IeBbGkAUV/pmSxJD6Ug2w04YxuAwc63Ky/NxaeabKjLCCLe9ui0v9l8/2
 RS/7ZTyWzi7N7r0gKea5LI7gZGh6V0ZK2DdtNxn1ojcZPYl6nUosYnO6tJLQ67Lq7t+EA9O2
X-Proofpoint-GUID: oiHZqRBlZfi20E8qimhw2lrAG6Q4-LWn
X-Proofpoint-ORIG-GUID: oiHZqRBlZfi20E8qimhw2lrAG6Q4-LWn
X-Authority-Analysis: v=2.4 cv=BvGdwZX5 c=1 sm=1 tr=0 ts=681c65f1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=avOu-EqILVl7MynqQNIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080070

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
 drivers/ufs/core/ufshcd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1c53ccf5a616..ce94fe4ab095 100644
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
 
@@ -8746,13 +8749,6 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 			&hba->pwr_info,
 			sizeof(struct ufs_pa_layer_attr));
 		hba->clk_scaling.is_allowed = true;
-
-		ret = ufshcd_devfreq_init(hba);
-		if (ret)
-			goto out;
-
-		hba->clk_scaling.is_enabled = true;
-		ufshcd_init_clk_scaling_sysfs(hba);
 	}
 
 	/*
@@ -9010,6 +9006,12 @@ static void ufshcd_async_scan(void *data, async_cookie_t cookie)
 	/* Probe and add UFS logical units  */
 	ret = ufshcd_add_lus(hba);
 
+	/* Initialize devfreq and start devfreq monitor */
+	if (!ufshcd_devfreq_init(hba)) {
+		hba->clk_scaling.is_enabled = true;
+		ufshcd_init_clk_scaling_sysfs(hba);
+	}
+
 out:
 	pm_runtime_put_sync(hba->dev);
 
-- 
2.34.1


