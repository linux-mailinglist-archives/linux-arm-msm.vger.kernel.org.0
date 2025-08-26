Return-Path: <linux-arm-msm+bounces-70909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 502EEB36D35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 449274E0339
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD41F27780C;
	Tue, 26 Aug 2025 15:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JlFgzwfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567D275AE6;
	Tue, 26 Aug 2025 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756220978; cv=none; b=NNCbuLKLevTx8DhWMK64pl9ihRGs9hL9Y0ZM3C9NYjicVFVA1+0raKY+9td3CycCRWN6uyJGCscJoxnukfgGnRWQOwqWVuM2gDhCAX+O06XpzynBs++YeEhn8QFTjroG/kBe3TO0/Y9k3y5SFtrYk0j8ZG/SgrbWJn1lefED9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756220978; c=relaxed/simple;
	bh=VGe+vvHN4XGRtfDrOLNuXGHb6FekmEO4tinbTA7LH/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eYXrTodt/d/j9JtPBQuLSvtUka7ul/LO/cNE906d/xfImdf7XFHlKaYdqErKYcS/iA+wt9rdBHsQ1tF9ikuFTckKVluXTShmB9A4Oe8CCvjsaMoNrnQlPlzjaB1mqH9oLNC66u/vVA03TW6/8qE7l+3tq/W2onJmpZCxXyDB4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JlFgzwfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8T2x2027946;
	Tue, 26 Aug 2025 15:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vG0Q4oPAdzsXOD/nYH3G6RUz404W2bmE7gYiyBnGQY=; b=JlFgzwfTFgnl7Iem
	IiS9iHeilc6DdI65hVDp/2FLbQZpcC/NN2wmZwrnW6vvwbpyatO2ypxL/Cboxg5e
	c6xiqWbAnokr05vTzZfnq2fkPf+RSAZY8eTbJYGmBT8WFffpL0TV59OSgqqY0Uly
	6jzAZtJm3zVs2qP3jZeHwiOsoH0cMvRN41vcP2OBijLldjQV7Wee2Fdwmk7sjBDB
	n5PJXJzBH1vot1fLRRtbndV9DmkJKSmNJk3zU6E7dGitEupAZRup3bomrTbbjvIz
	bGIr8VpUjbC35G0f/CNc2OcotxbGigN6OJ7KR8U62d9hy7Uyv7/o4DBzz+vPom/l
	+Niz+A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtpeumka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57QF9OV8019912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 15:09:24 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 26 Aug 2025 08:09:19 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V3 2/4] ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
Date: Tue, 26 Aug 2025 20:38:53 +0530
Message-ID: <20250826150855.7725-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EmTiDhSJh2KGqlLO9vKLiEVVQLdqCzJx
X-Proofpoint-ORIG-GUID: EmTiDhSJh2KGqlLO9vKLiEVVQLdqCzJx
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68adce25 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=BKJdvgQya1QnqZ38-EkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX4nW3G7CqeNL9
 mL1zp11fxmZxhiNMutym7M5GE5WWGRGi/3xAIVLswGT/8OWa0ePmxMV1sIRJI4QRhzaUonS11aT
 G9UzXcgG+OendBHmBmQeOtBQe86WpxqgMGul1Mkf393GtaZTPQH22HADl/t1jiR7qrQHKujdV6n
 mll6ilDnXloInojkI+uuPbXtqSCuixQ+ookDVG5AKLqD0G6E9Y+Ggw7oXglWFixGz9r3vm/Zdlb
 NjWA5WbQxaXlY0Tr6RFLCb6OxGKDrpm3vQmwGDxQHyxMjFJXB0TvVUfLvtO5wM+QfIdajfTdLJ5
 zOaOe94I1SHnN5vkNpl+5hy+6Zu1KEQKbppNerqgNAkhioj6mlnMVMPugtwJj53TJiU68UTbFz7
 ao4cmJW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Remove the redundant else block that assigns PA_HS_MODE_B to hs_rate,
as it is already assigned in ufshcd_init_host_params(). This avoids
unnecessary reassignment and prevents overwriting hs_rate when it is
explicitly set to a different value.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9574fdc2bb0f..1a93351fb70e 100644
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
 
-- 
2.50.1


