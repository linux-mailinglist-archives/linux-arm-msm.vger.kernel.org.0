Return-Path: <linux-arm-msm+bounces-58095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B59D8AB8C54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6659C3AAEE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B911A21FF4D;
	Thu, 15 May 2025 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LbM1pP7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E21121E0B2;
	Thu, 15 May 2025 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326473; cv=none; b=dFXFnTmj0n3OXPA8CiIsIW479gFJaUvI37Dg3p5t9zTiAOe7RffYA0OySgwXSD/nKLDOG7slr7QHCTaSuPtj7iUaVmhgceM3skiMkAW2XZXkf7L+q5MB0glZZrKN3cT6ggW20iVvTmSRbJLFdo+QjbeTapzoISfwoKS7sFArfQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326473; c=relaxed/simple;
	bh=ODlwDn7mWOdHaZi9LQuUdkrRueBSs4irntnvUW0Kw64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrJGDUwzJo7gOVLuuiPIltDe5Bnn+hsHHEgPmNFmVYqZCrm+AwS9E02fb5k4U0AfveoiyZ+cdhtSpodhUVcfj8yF2hEu1+gDVQHwd87Hflm25XFQQg9BibzX6hfqMFtuvoW8qqpoNd2ueODEfwbPjMHIFGb2bikNABGgUNwu7wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LbM1pP7+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCJH007843;
	Thu, 15 May 2025 16:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IgDWW+Mz5cI
	QlJCaHgPvgdL6vfBP0EnLvWOEhSUxXzg=; b=LbM1pP7+3qjoXVb5RcMQtmClNnC
	Uq4JFKId0y4YjtFBUVmhiKkEmhq253SuTNHcyFCSOa4I2uucnllAFs7UCNaXsm2Y
	cQ/KnECnFLjcwVM5lJNfZn6gH/yOnZGtYTVmOzkVUuLyz+1kjBBdtlogFwmeFqk/
	/TrxYfJTj7vmA6ZErZnHFB6gDEZsZt1ihltmq3hIL/gh5Ti4X3yvd9nkBrJivWe5
	T7MxDL6gbxW2NlICQ/QQDHYydjbPewsVasURxhv1QSeuU0KGg1w5UhW2A9AEWTjd
	tA5pIy3qGrBsReWg2pj19fWaLtmGUPagsuQRJz3YTSLlAn2OWGTVnmxoJRw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpxuv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRQMa023545;
	Thu, 15 May 2025 16:27:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRQjp023540;
	Thu, 15 May 2025 16:27:26 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRPtD023537;
	Thu, 15 May 2025 16:27:26 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 681F25015B1; Thu, 15 May 2025 21:57:25 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 01/11] scsi: ufs: qcom: add a new phy calibrate API call
Date: Thu, 15 May 2025 21:57:12 +0530
Message-ID: <20250515162722.6933-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: aFlGPPMjhHrkYxKD2E3BB3X0AJWSaUDh
X-Proofpoint-ORIG-GUID: aFlGPPMjhHrkYxKD2E3BB3X0AJWSaUDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfXz//8jwHEEef8
 8r9K6GeDLEVzayLS1M0kKe5yvUPYTTrvA3ljS5bTu+kCdhlJgZhc1ly4jA8vy65ENoEO+JPaAbT
 XL/48fcdaMhRZWX+HdKrr/VYUCgYEV4MIb8BHzAA5M9fcCExgKUSDD20QnanG0H+yZnbhQX/lyG
 BPAyX/UTjHVvUXPMuPaUj5KnBqXCR0Xfkn2K8KiUVsznZcO5MoUGfLNO+Om5U/buPOMdlWwHJAT
 QT7eT5rP1Z80JxMOfsQJw7WxRdkdEagx7XgN3yeq0QDbjaZqTygax3/8QEfqFkzYh5ZhwP/lVyU
 Rs3OmV5IIYJSjkgTd4FtNbPmzPL0H3Tdd8TnOtkI1vN0gkkhXbaXWyIl8pSoqaILZHb7XDfFnAU
 Z2nfWA1sCEcDQuFNZ3EtvaTS8u/zb4ISNnrMRrJxPHvm6kwxCdaRrxTH+5o1usSO9rOMedOj
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682615f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jLEhXYc_IhqhhXrxegcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150163

Introduce a new phy calibrate API call in the UFS Qualcomm driver to
separate phy calibration from phy power-on. This change is a precursor
to the next patchset in this series, which requires these two operations
to be distinct.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 37887ec68412..23b4fc84dc8c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -531,6 +531,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 		goto out_disable_phy;
 	}
 
+	ret = phy_calibrate(phy);
+	if (ret) {
+		dev_err(hba->dev, "Failed to calibrate PHY: %d\n", ret);
+		goto out_disable_phy;
+	}
+
 	ufs_qcom_select_unipro_mode(host);
 
 	return 0;
-- 
2.48.1


