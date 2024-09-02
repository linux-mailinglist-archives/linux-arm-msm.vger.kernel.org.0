Return-Path: <linux-arm-msm+bounces-30395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB6968692
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 13:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09890B23F77
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 11:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6131D6C68;
	Mon,  2 Sep 2024 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i7PgdnAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C11D67A1;
	Mon,  2 Sep 2024 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277692; cv=none; b=GTzFwbqRajd7ZzAR6V4AzG4/qwNIlLEhb6hSPCHe0yAxdHI7zZyxeOUYToYcR+1uC1p+tVru15EmAYwx4CXUyiULcWXeHbrXgLnhekZGSTYfqlm6Ff37a0POplNNUkTIhpiXRH4jYJ+Zpax0UwnLa0T2uf2mqx+0Pewh+fSQNh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277692; c=relaxed/simple;
	bh=xv9RTyrY2YdiOK26ifjwaZIOl9RR5ISuy6sY+L0GNEY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mKkVsvZ9ubBIMXwXXuiQAVn6mIPMMGL/5S6fcME6i8CQsuV4hyXcHYl2t68K9ontTyIb0PT3hSlPjoURg776bMHS+dm7ejUMpxovPIZd38O0VBoVed0gAyvHB7EGpY9DWnUURcMjozVG/g4xczLkf+QGvwBg1Zbf6WLgIoI8ne8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i7PgdnAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482B3fRW003309;
	Mon, 2 Sep 2024 11:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=vg+Rw9NLwO5MqfbNuhjdC69lcjqK8RkT6HzrLJTrC3g=; b=i7
	PgdnAdzfkgQ6MaD1nvpZcZb+1SjbL8EdtSWZGnddIB0GJlME2poYRZsWPzwTLd3F
	JfECfs0v4hvX6hsAFhgdb58uq9XWZIWta2Dojd7CdWSTNXc/ipKL+mnERrl+Lkwh
	GUy83YL2ppGUgC3VpoNnRwkUGMAnHAO3kwIcRNGzuMlPhZhzf1h5UY7BUGOODwZ0
	dXm5lUAjFNoDhvJ/xDkzSYRaPWVjBi+4WM4AEH2mLbOUdJisJGWd7eiJ7vZjYMbU
	LOuInRpOupgtw5YCcMhxbPr80xAj8ngvnGpIp/ZtZMnU9vk6U8KV4iYZ3lBrB+nN
	9IewXFFOYTZdbfbhpkzw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvf8vhud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Sep 2024 11:48:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 482Bm2b6017858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Sep 2024 11:48:02 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 04:47:58 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH V5] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Mon, 2 Sep 2024 17:17:37 +0530
Message-ID: <20240902114737.3740-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v1VeKsK4V4clikGNS7R2Uf3p_BAD6N_y
X-Proofpoint-ORIG-GUID: v1VeKsK4V4clikGNS7R2Uf3p_BAD6N_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_02,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409020095

Commit 8db8f6ce556a ("scsi: ufs: qcom: Add missing interconnect
bandwidth values for Gear 5") updates the ufs_qcom_bw_table for
Gear 5. However, it misses updating the cfg_bw value for the max
mode.

Hence update the cfg_bw value for the max mode for UFS 4.x devices.

Fixes: 8db8f6ce556a ("scsi: ufs: qcom: Add missing interconnect
bandwidth values for Gear 5")
Cc: stable@vger.kernel.org
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
Changes from v4:
- Updated commit message.

Changes from v3:
- Cced stable@vger.kernel.org.

Changes from v2:
- Addressed Mani comment, added fixes tag.

Changes from v1:
- Updated commit message.
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c87fdc849c62..ecdfff2456e3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -93,7 +93,7 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
 	[MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
 	[MODE_HS_RB][UFS_HS_G5][UFS_LANE_2] = { 5836800,	819200 },
-	[MODE_MAX][0][0]		    = { 7643136,	307200 },
+	[MODE_MAX][0][0]		    = { 7643136,	819200 },
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-- 
2.17.1


