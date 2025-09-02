Return-Path: <linux-arm-msm+bounces-71670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C817AB40B06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 18:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0F76188A1B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B9B342C92;
	Tue,  2 Sep 2025 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YUSDfCzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06CC341AC3;
	Tue,  2 Sep 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831777; cv=none; b=G4Q+MHpTDFhRCTIPdsVZdRtAmRoqbaDqlZy1WCEZYsbLGt6xn6m94MvLtvxM6Ru4DBb2ZBR3Yu+HlFhEqSz485aJEx/d97K4yKf1H3nralkZLzFGwHHZwDxCvkWfPxVlq8i1q1JtJK+cuNPyhm0onwQbmIQt9VduJJxcKQxpWyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831777; c=relaxed/simple;
	bh=VGe+vvHN4XGRtfDrOLNuXGHb6FekmEO4tinbTA7LH/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qeNh/CNEJ1z2aFP7ZJYmQ00f+dGwXVMRA6K7nx1sSICTKf87X4RxHnqqKxM5OsX5bXKBv12tgA235+0LKitYVw0i4Y8+0uyrKwBhzh+YrHV717wN2+PYLB7N6UdX/r0rIzMbVCYio0+y4JdJho7kG73bTCH6dc5ldL0ur9xTus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YUSDfCzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqZQ2001977;
	Tue, 2 Sep 2025 16:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vG0Q4oPAdzsXOD/nYH3G6RUz404W2bmE7gYiyBnGQY=; b=YUSDfCzitjKZGBGN
	nrkrwqFVOFHpJoVq2z/gItH41at5RUfv5G7005DwKXQ8bv0PGBOe7tZMq9Zig6ew
	DuupGfZKSMpWtu1rvAveQeFnTEse+F/mcdiDxV0s899w+lmb1c6swHW/TFhWqHFu
	l1KMfhZReMZS1PMERLYpdwaxLV4UzrGHH5WpSqb0oYPM72cH42rVVfsRU3Xi1nJW
	YDqnrofQC0bNg8Tt27aTZQX31zr5PkxaXMzig6COppZLu2Pp6od9C4eRsS/XcXMn
	bronfDLc8vZzPwehsDEnalbmjMYbL1uQ6943r0oiphwIoH7oJqlNsD+8Xby/+eJa
	3tklDg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy4esr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:49:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 582GnMtH032013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Sep 2025 16:49:22 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 2 Sep 2025 09:49:18 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V5 2/4] ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
Date: Tue, 2 Sep 2025 22:18:58 +0530
Message-ID: <20250902164900.21685-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
References: <20250902164900.21685-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b72013 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=BKJdvgQya1QnqZ38-EkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -gUEXRyKOu1fuuAvbhOryeLasVetxpTr
X-Proofpoint-ORIG-GUID: -gUEXRyKOu1fuuAvbhOryeLasVetxpTr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXyCGlmh1TA+Zc
 DM1q5PfJ3occrwX5OU+34Jh1wGzZqLc7oXJf+VvaUlMaGlMZjnSYpibYpW8nuTbhfZ0E+yabWVD
 seHdT+rySNcXwn/j7ohn9Pc+UCstiwuU4T/OswvStBENovg0S7n8ebYAIcRXZg2u2nmzTpmAe4Y
 zDZGcOcQZyUzHokOgg6IdadnQUfeIQNth2q91JO4xFv9cjK820gFOAX3Fz96yHeiStrTeBOryGU
 hMatkqTh/4uPK+Q1qZva5oJMRqwBmEPQLzAQx3sSGEBhRLWu4AYPti1jDI0iQgAgCFef1SyEe+H
 U+MXTYOc3sXbuMVA2vP0TxkN1vmu/eZFmBShbiVsx8+u2okCYf7GE7gsGr1XjcSs0pkLbkof3FN
 Gx8GswM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

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


