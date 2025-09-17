Return-Path: <linux-arm-msm+bounces-73949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E79F5B7FEF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C73F626C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F0F2ED866;
	Wed, 17 Sep 2025 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I2TuB/RC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6292C2ECE9C;
	Wed, 17 Sep 2025 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118244; cv=none; b=lfo2h6cPj1cu2ZGsQSgmEAwcBhXUJrie+Bv0hcwI5fVhGWB/K91k0uT1ELEotMFVeANiDSy9uihL+fkuvyA1EnbOtl/4H8JB23n6jxGEsDNHpOJOi9/4bGUfhFR8paqajqttFTipymt6r3uHxbor7sAIqOd6HdJuB/MwcFvNi2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118244; c=relaxed/simple;
	bh=uyjOGa1ULkbUr9hoCBFAT6SlKfZysW7rApa04khvzNM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+ZdK4anQVbfB3lQW/tLzvybxmFgg86txIC9+8D1O0ZYrU7yZfzBv+Fpcp0CHJVcgYKOv3Dg7XHXadslggTODdaixOjzns+gEVVd01aUke18CcFX2Ul+hbzK+el/2F6c5TL1qmNHzgXpVXb0gmRFPmLuVb59LniEb4ZFruw8vfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I2TuB/RC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xap0018272;
	Wed, 17 Sep 2025 14:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDdbPHJQSUBBke62x7P5h4J7gGETxD6GhuWCYpeHdww=; b=I2TuB/RCljVsKX/L
	cuSB6gRykStguGsj4/5XtJ7vmNk5iTAYZA0rWdnsxJ8ZsZT8tjFaUs2q3tveXeiF
	j0BRUR60OX6vMvFtjbacpJAJzGvf9kU3n+do+hs1kA40ygTVadK0ntmOLZPnRio9
	7dEnUi7sVlLG+FQ7fditJ38UP3Gm0k39a0VhRll57efmZmPZOlKAc55YCA2hwfs6
	1iWYVYla2VpuWs5iBAwOGEPgeWckIO4iranwze3Bq0M3DK1umuDjJMs1qbhZp1BT
	wOAhYtkYO0SbIaS2Nu03rqj/uLIlbwK/K5xwBLJSqNmU0XCFSTwoLtHfzmZ4rWOo
	C5bIJg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwaky7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HEA44C015403
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 14:10:04 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 07:10:01 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V6 2/4] ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
Date: Wed, 17 Sep 2025 19:39:31 +0530
Message-ID: <20250917140933.2042689-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
References: <20250917140933.2042689-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cac13d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=hD80L64hAAAA:8 a=COk6AnOGAAAA:8
 a=BKJdvgQya1QnqZ38-EkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxH6+j6Gs7fvX
 4vuphBlIfKrOEX5/CWH7GNSruC0LBuyt9KbQknVmbnDhv0t6u/0H3fKCJxnI/Cni223g53YPe6L
 Gnrv6wi6HsAoW7B/c09jiRt4rj4Rh/sUyc7P4iKMsjdgYUsISwOauJNIKS6OendcqDYiOiGHunT
 Us1w971Iq/o5D9xvKNSQTDXdvwJKO3L3g3oTi0GABRFedrIkgrb1uqwUOpLw8SSXlI7RjWtBAE7
 sndRr1rVVj/r0YEp18O1gvsY9P/Z5qtLeFEDDHw/eWSOlsMaaKWG8vkEhtiJyJwlK4FPhhwbegQ
 paP3iaSf39Yln42T6LqHmgaTd2tjka91Eig9753ufzfyljrACy0xnn3wGl2MQ2y5G4DtrpiiAhY
 enfsub/+
X-Proofpoint-GUID: IysEXEQbMrnIbznxQJnBLQpIgrBeV9-c
X-Proofpoint-ORIG-GUID: IysEXEQbMrnIbznxQJnBLQpIgrBeV9-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Remove the redundant else block that assigns PA_HS_MODE_B to hs_rate,
as it is already assigned in ufshcd_init_host_params(). This avoids
unnecessary reassignment and prevents overwriting hs_rate when it is
explicitly set to a different value.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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


