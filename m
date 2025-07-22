Return-Path: <linux-arm-msm+bounces-66140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69BB0E158
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19347541BB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2CA627A47F;
	Tue, 22 Jul 2025 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fthk8f8L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45F27A462;
	Tue, 22 Jul 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200699; cv=none; b=mrAgT6v5jQczkQSD+3IJOif3HjTne9AVBcfmQCjMImC9e0ANNqJjUYgj66+Sr44Q1QRweVkLHPsZSU8YdLwoxFuI2eahLIkeZB3zpY2iy9NQcTY2mNq36nKKzqRleqUaUPElygoeKvl3FCjo1iPSXG0gJwo05v+rksXKT9SkJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200699; c=relaxed/simple;
	bh=eeBStxMZZgVEaFKtMujnmvcCb0wyrzJKkcjszyAAi4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwHpWv8lSq0q3eFL4ZQ0d8cuVcV1QVToPoJEG82I9G/xHAUUZCJkfY/xlymCKTT7DkMCdwwLyd3OVjmhd8P6x1o3m5lgTDXnu4XsTDkcR265dAk54uL7XOYKdmRKpYx3HH7dBRSvWH40qE98cgwDQXbGiGLAcNr9xg9JCBfYvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fthk8f8L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MERcIV020176;
	Tue, 22 Jul 2025 16:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahdVn3Ig4TsG6ClOkmF7vVkXGBgSNztWsEfG/VZTUVk=; b=fthk8f8LkISDc1vz
	xmflwuRPVuVT3KJpUZNHBfCI7KQttXvldLC83VAFOvxRrDiRB2EBREIW4vN/9bNu
	R6owEGZdM6I2F9mvXXUXZ5ejKUHVWXRKrhLPtg894nteP9dpraSFPCPvBUMjTei9
	8wfsGerSsES3IkTGA2uy25DMPN6tWP5+OLEEyEeR6myucxLZCyWSee8P82w3lLTq
	rLQBV0pphHai0qvtFZoyEFutj5SaWq+WHjBYhJBqbkjnXzn6NkfBN72OdSRVS8RC
	SVy7AVOhHLs1s65nq2CmsGMYqdjm+1euZ4iQ0jU0yZKO1mxL3b1zuxeND+dT01/v
	YK7biQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na0gvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56MGBOrj009989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:24 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 09:11:19 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ufs: ufs-qcom: Add support for DT-based gear and rate limiting
Date: Tue, 22 Jul 2025 21:41:01 +0530
Message-ID: <20250722161103.3938-2-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AFbVchxT_CndBFADVprzllHGzSuD7it8
X-Proofpoint-ORIG-GUID: AFbVchxT_CndBFADVprzllHGzSuD7it8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNCBTYWx0ZWRfX50ZDj1jfNvyD
 4m+OAk4NFdbjl6TyQuHk3PGqnRHbu62axx5K90FUrqbAZHnD2IWJmYXT1Fwmv/Z8bxFKPUf5zz6
 bqnu1XCCbsvyZC54Jj8wZ4SKn4GKQotzAFKkb+ThePefVK6sEO6/cEQ9JKBPT1XgljdyMFb7dW/
 szwcYwV/wTRf2dp8LNVgKZ/Wkb/U1bzaK0YvjavQKgTKEQci9P0ReM00Hm2FWb8i7DPsY+RYxmZ
 KiL0V4bpegcsEIt1b7SreZGczHBcWiM4WMDoDlhImbx4U47wEIKYVoT+F1EYD/c/ltG1Hgc/QUV
 8IPdFAGDGx2zrHc/4dbh6RjnfgS2qJ+DbCGIzZjT4+yz44acYyjQLSfmj6ZIz/hZmQv6fYN29Nb
 rfpPIHXjEA0FA/Z3SMuc/EeHMv+Gf+Xs5P4OhVJxOFqWKEqQJ0TZxbmadQaDW82ftmpNeck+
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fb82c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=hdcEVJbxkXptCJyuGLoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220134

Add optional device tree properties to limit Tx/Rx gear and rate during UFS
initialization. Parse these properties in ufs_qcom_init() and apply them to
host->host_params to enforce platform-specific constraints.

Use this mechanism to cap the maximum gear or rate on platforms with
hardware limitations, such as those required by some automotive customers
using SA8155. Preserve the default behavior if the properties are not
specified in the device tree.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4bbe4de1679b..5e7fd3257aca 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -494,12 +494,8 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 	 * If the HS-G5 PHY gear is used, update host_params->hs_rate to Rate-A,
 	 * so that the subsequent power mode change shall stick to Rate-A.
 	 */
-	if (host->hw_ver.major == 0x5) {
-		if (host->phy_gear == UFS_HS_G5)
-			host_params->hs_rate = PA_HS_MODE_A;
-		else
-			host_params->hs_rate = PA_HS_MODE_B;
-	}
+	if (host->hw_ver.major == 0x5 && host->phy_gear == UFS_HS_G5)
+		host_params->hs_rate = PA_HS_MODE_A;
 
 	mode = host_params->hs_rate == PA_HS_MODE_B ? PHY_MODE_UFS_HS_B : PHY_MODE_UFS_HS_A;
 
@@ -1096,6 +1092,25 @@ static void ufs_qcom_set_phy_gear(struct ufs_qcom_host *host)
 	}
 }
 
+static void ufs_qcom_parse_limits(struct ufs_qcom_host *host)
+{
+	struct ufs_host_params *host_params = &host->host_params;
+	struct device_node *np = host->hba->dev->of_node;
+	u32 hs_gear, hs_rate = 0;
+
+	if (!np)
+		return;
+
+	if (!of_property_read_u32(np, "limit-hs-gear", &hs_gear)) {
+		host_params->hs_tx_gear = hs_gear;
+		host_params->hs_rx_gear = hs_gear;
+		host->phy_gear = hs_gear;
+	}
+
+	if (!of_property_read_u32(np, "limit-rate", &hs_rate))
+		host_params->hs_rate = hs_rate;
+}
+
 static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -1337,6 +1352,7 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	ufs_qcom_advertise_quirks(hba);
 	ufs_qcom_set_host_params(hba);
 	ufs_qcom_set_phy_gear(host);
+	ufs_qcom_parse_limits(host);
 
 	err = ufs_qcom_ice_init(host);
 	if (err)
-- 
2.50.1


