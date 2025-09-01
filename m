Return-Path: <linux-arm-msm+bounces-71417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BFDB3EBAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 17:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD593A51CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277762E6CBD;
	Mon,  1 Sep 2025 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jhICrvS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D09C2E6CAD;
	Mon,  1 Sep 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756742319; cv=none; b=YX/x21hqAcuJyr/rfPEPMfq/SvcHVJZTU1rT2aCfDz6ulYgUoOrTpBznznJe31G10U7T5uujpXhRe6FZH/zJWe/m2SBXbMlDubxdQhdoCyvJElcaWEYjDB+d+fPkgNVEFSlrrP2+IaMo9BniB28BZJU6Es5Xu4g3f5hosGSDxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756742319; c=relaxed/simple;
	bh=VGe+vvHN4XGRtfDrOLNuXGHb6FekmEO4tinbTA7LH/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dOUQq9vYJb9tg8sC7p8O2Vfq88XerZaL0+NHd5pPHinma+d2bEe8ExbCtvEgJs21lDZu2qRCDMCLujjwqtA0itzd5gUKE7On7fIBTgwAQxpN6tPUOCjWS3tRo/9X3OqS1VD8K1lgXT6fe8DPDEayvAXLxoLlCTG4E5qC/jh4E7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jhICrvS/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4BoD008805;
	Mon, 1 Sep 2025 15:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vG0Q4oPAdzsXOD/nYH3G6RUz404W2bmE7gYiyBnGQY=; b=jhICrvS/oH9MuZ3W
	oI3ODTyzOKmJjY6isC8ByABgOuYzuNNpXRXvjEva/IIO608mzWxUkNdD0Xhr6BoY
	oTDGbJlt0yWhBpGtvGFYKEaTh+gSZLqsok2q00Am5wYTPNHZvgHF6FDwu2DzGpEL
	XAPpmKN2zUiFASfD0EOKPGxklTOK1m89OqYEHmyCDFsa7EgdU6O2+EnQ7jORP5Yu
	J+vc7qS8Ss7ZhMdkw7eOHMSL4mMOr6QoYgcqX0aJ1Z5vhWltAW/qKOOIAlwnazPC
	6QHZeJfZW7hxAip8GEKfv0s//jUXaATe7X7NUXVDVdCctqgznmWxngdoFiY2AEWj
	G4Qqug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuw9p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 15:58:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581FwNj5013289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 15:58:23 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 1 Sep 2025 08:58:19 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mani@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH V4 2/4] ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
Date: Mon, 1 Sep 2025 21:27:58 +0530
Message-ID: <20250901155801.26988-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
References: <20250901155801.26988-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX7q1UVSrGwbUH
 5g3ch/OwP6V+w0AQmw/JNbQo5eGNxEXBviDk7tuPlpexVfAPyFW5eApg+trEeaOAcAnVMzPk32N
 4iGlKIIl21JYhurNsh1Mp/awBqF3rBfAE9hvuslR9pTzbP1VeBmgdch4yGlL952giqpGvGpFpe8
 5vic8y7pXxoNh9XYqUAwrJkQ+3K0RTiJVGwMyqgY7m8kemdMkIKd3n4yanjEqY88hzwMKda+Gxp
 rKj1msQuv99ztOmS9fmUWuXuNBrVwmff2Fjz547hy/QA3nvTp6ltWl3BbpTxbgaALmWdK5rwRRD
 x6DUm0u+aew28hv9Zwe/OyrOY9PjvxnSOsXexRd+3D+BdWo90AVFODMq7q83j/gXhyVfjjY4Gd7
 SpWDu4DZ
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b5c2a0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=BKJdvgQya1QnqZ38-EkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lPNfNt_Et5w7IrSY0lnDH1yeEhhTR16-
X-Proofpoint-GUID: lPNfNt_Et5w7IrSY0lnDH1yeEhhTR16-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

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


