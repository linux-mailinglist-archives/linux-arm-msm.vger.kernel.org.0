Return-Path: <linux-arm-msm+bounces-70127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DAB2F50D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A03017DE3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6EC2F8BF9;
	Thu, 21 Aug 2025 10:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R4f5fj+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5DB2F8BD0;
	Thu, 21 Aug 2025 10:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771412; cv=none; b=NqDYz8xAIY9hLjXpl025cUn8dEcWaEqd+fswrKnZwI0SMHZzCoCn1EqDMqIEodCSCMKH4ELspZwGVw6QNUrqoC0lTNi3F/JV9k3Y5tijV5tyk/keBgsAx7E0fSv8yXkqQTL7DaJBcW+OIPE/i1X5/ZoNGHMkRrMe2QyomgVS1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771412; c=relaxed/simple;
	bh=VGe+vvHN4XGRtfDrOLNuXGHb6FekmEO4tinbTA7LH/U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WGCXWkipTUQOZq6ga/sh5A5G3jYM3y54wNSVmYvXsLHl1eIs9z6RRtQbhXuXDB4RegvrclNKkLP1mYxWMfqXQnfd/JHrAJlTHjB9ZU+/7xvgajoVIUwd8TFKdUJPrBF8fOCnKu+tzCIOhXTdBphXOwLhwdePe2HeqE7CW7fjDPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R4f5fj+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b87k012775;
	Thu, 21 Aug 2025 10:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vG0Q4oPAdzsXOD/nYH3G6RUz404W2bmE7gYiyBnGQY=; b=R4f5fj+hBODKQEcG
	GMdWGYWKw+wKsPsxKQTAn528IphzTsOcy2Z7RrSDBYFtOrM2i/NYU8gOydBc0TVs
	pKR7mPumFbxLWctL5+lr/HKmywRMQRzZlonF878LIYWAEVQYeCR8/uHQoC7kwwmo
	eq5DFN+3EqwU42C6ODGZLRJ4m/DtyLmrx+3hJRVvNwHqDSeTdOK79MqxmgDk5f0n
	e/rTBm78khFqaoFeZREM/kziKL7VsZSEwoGOHb64pY28DT/6Skog56whPREncyc5
	K+BeNL96tVDhBLKTPrcEz+SKJd0rYLIBlYMqlhyysoZv7a6FWdi9a61PXMpb/qZX
	/94DTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8au8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LAGdei000534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 10:16:40 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 03:16:34 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/4] ufs: ufs-qcom: Remove redundant re-assignment to hs_rate
Date: Thu, 21 Aug 2025 15:46:07 +0530
Message-ID: <20250821101609.20235-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
References: <20250821101609.20235-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX8j5ZJ0QXnTbz
 q83fJbFi3f9tNFyyZdB8fimZ1UJzgPS+i7BKSKV3Vb4wG+0TlY11ReJHWH1qLteuxpoEaI8iDcW
 OPs7qicDOrkA3TGSlCTiFA5btVauQGnul3tSuyoWKPB8ajJeABZ1Lfc6wr2nZP7ZvCaMSnMkiEu
 fawGBIqcvaYRo8N/AeQBR5pf2OJVoGYDuuUy9bon1j/Jx/UzjWH4xooA+8UwZbPu3M5ZgLfmtTY
 ghhn0ENfVUcEXILAohinEekLQT+Do3EDjP6dBwfXje1VZeMOVObNpBVcjUyQTi/lURIDRVQQTAK
 a9fCdMpdEn0+jUNdqvmofmWrDsIKjEk4CwEin//daf5K3eQFIKO84ywwfTAxq6l5ZrvVkdyMvu2
 82blZdiiZ4j4SsNPbueE06FkVn8gkQ==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a6f209 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=BKJdvgQya1QnqZ38-EkA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: UbTWA_uCbkjn86eglmAvI-Kd--kwl5O_
X-Proofpoint-ORIG-GUID: UbTWA_uCbkjn86eglmAvI-Kd--kwl5O_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

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


