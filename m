Return-Path: <linux-arm-msm+bounces-53778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E1A83DC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06AE84C4490
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E646A20E037;
	Thu, 10 Apr 2025 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q1syEIIk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE120E003;
	Thu, 10 Apr 2025 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275692; cv=none; b=F2vHUa4BNtBJV8SfnptIjBoIU6+eydTksIZ0sc2a+zIUtEzWAx5kRs74KY8OZ3O6OHUp+wKsHnjOUN6p2iaBHrONMQ/jO/OL0b+rmMKIZ4XdSlMoKs1YlG4c+MWz0q0reoxO5ZA3ozNMM/jz290TGsksiILkqlrQ9EA8bMQRbHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275692; c=relaxed/simple;
	bh=n84yXriYAlJGgwsr5WmZHVb0kFL1NWW1ka59YoBdSbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3d0WFt78ZBdMMl7zv0LExgHucWZz9cxAoXe4CK3exIa7lRZUcCbvohlcOWbztZrTDkRcx6EZYPlRwMDr+jh5EN+tpvbsXFCKkGJZ2IfV3ZC0gturn5wdfG9DPevz2qFQ4QicBjBb6lOF3gUhx35O6Cau0Zzu9DqNskawC3RcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q1syEIIk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75PPe010704;
	Thu, 10 Apr 2025 09:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OHjUsftWKuY
	mlxAqdXeUUAwRiJpc9HzmFoI+LT8d6lY=; b=Q1syEIIkn3gzQFgE4soLHEZlxFO
	uQmDr+xe8wpwcLC4g3G0FVeMTZULMUh3BsjP/dyJIflFrNAVjsnPHfo0tjK4fFk5
	7GwnnzvlrMUE3VjK0RIaZQFJ+/Meg0PdcGkDJbJcg2P14Yj2xMAJ1ttVvz611SeI
	SxZHmTXemiIsyT1gcUxfF4y8Y7qdHyYAUYe+SmoZuDFtF4XvEzfWSOICQvNzy7Wb
	qFUp14DTohnSvtAO4ekcbs0tBW6tCAJEuQ+JYgQylDNDVzar1UQd6eUsRHgUftP4
	R93QW7xRFa+zpKKmdnu+v18P4gpoeAidvIlft6m8jshvaqenwGik0XO3KQQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3p857-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:01:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53A916sg008758;
	Thu, 10 Apr 2025 09:01:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 45ue7g3rbf-1;
	Thu, 10 Apr 2025 09:01:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53A9166A008750;
	Thu, 10 Apr 2025 09:01:06 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 53A916MI008749;
	Thu, 10 Apr 2025 09:01:06 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8673450158F; Thu, 10 Apr 2025 14:31:05 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 1/9] scsi: ufs: qcom: add a new phy calibrate API call
Date: Thu, 10 Apr 2025 14:30:54 +0530
Message-ID: <20250410090102.20781-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: xaYzo0_pqMzhnOYgFGi3o0YqSvoha2Fq
X-Proofpoint-ORIG-GUID: xaYzo0_pqMzhnOYgFGi3o0YqSvoha2Fq
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f788d5 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jLEhXYc_IhqhhXrxegcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100067

Introduce a new phy calibrate API call in the UFS Qualcomm driver to
separate phy calibration from phy power-on. This change is a precursor
to the next patchset in this series, which requires these two operations
to be distinct.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b37449fbffc..4998656e9267 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -473,6 +473,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;
 	}
 
+	ret = phy_calibrate(phy);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to calibrate PHY %d\n",
+			__func__, ret);
+	}
+
 	ufs_qcom_select_unipro_mode(host);
 
 	return 0;
-- 
2.48.1


