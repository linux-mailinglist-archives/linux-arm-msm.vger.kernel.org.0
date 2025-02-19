Return-Path: <linux-arm-msm+bounces-48539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D817A3C5E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868951885FDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51601F460B;
	Wed, 19 Feb 2025 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j5YPgnNd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020C8F58;
	Wed, 19 Feb 2025 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739985414; cv=none; b=axAaN957RYGoTNQbJgaaBUc41cAyD/fwHYeiR6ekDQQ0BQ9YUVR88ItBXcAenY995VQaO9uMsl7zVpN0LzQolAe20AaRak1bzDEUegHgSwkD7ppfmyWvwjDMmyJwkYzQZMrqPcnPU1VmCPBctCOgMYiQyWHEeT5av/Bvc1323O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739985414; c=relaxed/simple;
	bh=R/OdwvhxVB1hYtZC+4Q1DIFlz/AwuxZp29ASVZhUwKg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h5+Cidu4gfNXRIgKUGx80NCurN7ixsxAXB9MiNTj1ex63YajYL0U1FCE0G3x5aB9+EF46KrWdmR+vhQa0w0iKuuHglhNPV1CbjNiiyzFCLNJS+R7UB3rLzkY13i2LCdjRR7krg8pWw5IqzJKcYM3YOuvrT4W7pI/t5TvFCXyAOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j5YPgnNd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGGsiJ015223;
	Wed, 19 Feb 2025 17:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=giV5lsik2DYjuuq0yoMBwaS1Pe40hyptVuBM7BRGT/E=; b=j5
	YPgnNdyG3q+1XYQjpZ+RYOQ0rRNl+U7mXRgkb+MusHeB2qKn1k4chjJZOXXJh39L
	bvRQBDyZrmKCeSP+fZS2hcWHGwo/iI9vSkgQ/o2VCUP4gu1sPA3x/21JJIeLkFo/
	XQFB5lLtBKj9IMLa34m62N3BH45ixRmQe00CK+zPgKWb44qwl49MaIE2AE7bvUf3
	G+FrxEFU8D21gA80KiE2+ET0xNJ+qw/kv6SmmqiO9vT7e/59UlbbTNi+4YunwcQE
	/f24dt0d/gTjXStBw5++ZRt4NrW2wGMlmly/kqkSG3ft6F5E0PDEd/VlEDPBv7X2
	79QzPHHVxFT1LWZgE8Yw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4befr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 17:16:29 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JHGRbK009094
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 17:16:27 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 09:16:27 -0800
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <manivannan.sadhasivam@linaro.org>, <minwoo.im@samsung.com>,
        <adrian.hunter@intel.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "open
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] scsi: ufs: qcom: Remove dead code in ufs_qcom_cfg_timers()
Date: Wed, 19 Feb 2025 09:16:06 -0800
Message-ID: <547c484ce80fe3624ee746954b84cae28bd38a09.1739985266.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9eHrJXrHe7Bf8IV3c54awopguxktShWm
X-Proofpoint-ORIG-GUID: 9eHrJXrHe7Bf8IV3c54awopguxktShWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190133

Since 'commit 104cd58d9af8 ("scsi: ufs: qcom:
Remove support for host controllers older than v2.0")',
some of the parameters passed into the ufs_qcom_cfg_timers()
function have become dead code. Clean up ufs_qcom_cfg_timers()
function to improve the readability.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6e..d89faf6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -509,16 +509,10 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
  * ufs_qcom_cfg_timers - Configure ufs qcom cfg timers
  *
  * @hba: host controller instance
- * @gear: Current operating gear
- * @hs: current power mode
- * @rate: current operating rate (A or B)
- * @update_link_startup_timer: indicate if link_start ongoing
  * @is_pre_scale_up: flag to check if pre scale up condition.
  * Return: zero for success and non-zero in case of a failure.
  */
-static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
-			       u32 hs, u32 rate, bool update_link_startup_timer,
-			       bool is_pre_scale_up)
+static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_clk_info *clki;
@@ -534,11 +528,6 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, u32 gear,
 	if (host->hw_ver.major < 4 && !ufshcd_is_intr_aggr_allowed(hba))
 		return 0;
 
-	if (gear == 0) {
-		dev_err(hba->dev, "%s: invalid gear = %d\n", __func__, gear);
-		return -EINVAL;
-	}
-
 	list_for_each_entry(clki, &hba->clk_list_head, list) {
 		if (!strcmp(clki->name, "core_clk")) {
 			if (is_pre_scale_up)
@@ -574,8 +563,7 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
 
 	switch (status) {
 	case PRE_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, UFS_PWM_G1, SLOWAUTO_MODE,
-					0, true, false)) {
+		if (ufs_qcom_cfg_timers(hba, false)) {
 			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
 				__func__);
 			return -EINVAL;
@@ -831,9 +819,7 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		}
 		break;
 	case POST_CHANGE:
-		if (ufs_qcom_cfg_timers(hba, dev_req_params->gear_rx,
-					dev_req_params->pwr_rx,
-					dev_req_params->hs_rate, false, false)) {
+		if (ufs_qcom_cfg_timers(hba, false)) {
 			dev_err(hba->dev, "%s: ufs_qcom_cfg_timers() failed\n",
 				__func__);
 			/*
@@ -1348,12 +1334,9 @@ static int ufs_qcom_set_core_clk_ctrl(struct ufs_hba *hba, bool is_scale_up)
 
 static int ufs_qcom_clk_scale_up_pre_change(struct ufs_hba *hba)
 {
-	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
-	struct ufs_pa_layer_attr *attr = &host->dev_req_params;
 	int ret;
 
-	ret = ufs_qcom_cfg_timers(hba, attr->gear_rx, attr->pwr_rx,
-				  attr->hs_rate, false, true);
+	ret = ufs_qcom_cfg_timers(hba, true);
 	if (ret) {
 		dev_err(hba->dev, "%s ufs cfg timer failed\n", __func__);
 		return ret;
-- 
2.7.4


