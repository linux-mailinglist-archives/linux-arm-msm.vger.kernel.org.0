Return-Path: <linux-arm-msm+bounces-58102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C44DAB8C68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B336A00CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEA822A7F9;
	Thu, 15 May 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Unt8PqqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E12253EB;
	Thu, 15 May 2025 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326477; cv=none; b=S3XIZEEAO4LDuIQ/WRaEWdXkBFuMZ9Xs+RmiLGixm4oPSzmWEvjF0K2g32TVNm7ZLNDSU5fi0RLd3dZpf5K7x3Q+xXE8CvDGuLF1d1dDVfJno59x0ShxoEzJPsPKqBwrZsZwpgnHlZK3nd5M3x/Puzb4oN07cBRwIwpIJ0CfHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326477; c=relaxed/simple;
	bh=GVrTsLJpsgAxXogbNk8jt8UlUBmXsxrVgY3mMJYMGNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5MbuyRIz/8+JsvenpOdmxXyeLnRV7JkZHX1dSY7bpQCOm6LpVsm+U+EeWxDEeRoFut/Uir0ePexaL8xnFMcZ3GmTqHUjpML/vb5MlMuPyT6A1nAWKMGVO1EloSdJ3G/WsokIjScOvulVO8VUWNY6quF3mnt7l/XfFZ+Y9G0xEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Unt8PqqS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBxR016659;
	Thu, 15 May 2025 16:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1q3mGipUgA/
	EmwhXrwR/S8S3h5hec3GzsPN15RK0c8w=; b=Unt8PqqSObBfaHD6q68tS67nw4y
	uqQxye1ZY1dyn0P3klnLREYecuIM7Ak1fcZGzUe57rFQ/HBdo49YSMs66Ec1XEcG
	0LgxTL2i6YX74fo2mMw1ru3ETA1LxmuoE2YOubXHTZqcZOYnlYkOCX9HY9Hye9Be
	buCsB1Je8LpE7GkRBgiHSaARbhPEp6VF+L55ZfpDZyooiPGTmfbl+pBmmbUOUsK2
	3SomV8MD5kGEOt2UFbiQWcJPwDx4zJ9yaTNaEHu/c7GOLj9PCI/rpC/whs0Le01S
	FmUFNdvhYvKtiZrfa8L6ne9YNvMdlPHcT0kWypRfScIjMzS58wWXHQBfWAA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmq0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRRQN023561;
	Thu, 15 May 2025 16:27:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:33 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRXFP023644;
	Thu, 15 May 2025 16:27:33 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRWdl023642;
	Thu, 15 May 2025 16:27:33 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 49C8C5015B0; Thu, 15 May 2025 21:57:32 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 08/11] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Date: Thu, 15 May 2025 21:57:19 +0530
Message-ID: <20250515162722.6933-9-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX55MSJAFPoPt3
 aCY30UVyOap2FHslkszuk1hD4WNZwsZhPTlUQL/pQiUsfuPxky9PiFZaQBcibWWJr7GDD/nWd3O
 S2x3FKe4MjFS9waoxJSp6E3R6eNRUrUjtDCTNnySwf3+CrG0aHboSij/5Np8k9QCZaP5EQctTmv
 QRhK3zhDH4RkR2jSePR0mYKEWNn1e6djWT5SAUmx+Fie+0ifYFxUFlpFGnvZ4QEpjooL8hSVpzT
 bdWiPnKoWGoEuO2tWRUH5wgMaFYs/S6djzevcOr0sq5KSDNEQKOAcPVFtOMwgcofECZ0LWB9+0V
 rwbK6aZsa7IGTd9J8Pb3XCp9Ji+akpnY6EjqenyhWYNSvnBj30M5N5uBQhYff5J3KIa+fWXMpMD
 0VO6vuF5nrqdXdBEfECeb8ZE3iP+UCx0PA8BCfEoiqy+AcVEtDoJ/xSFlfGmT1HEzvp0XJm9
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=682615f9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0NjA6WJkZe3NLfXfqlsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: XrHuWMRx3wjcNz0n7UuXwR8t7jw8W1n-
X-Proofpoint-ORIG-GUID: XrHuWMRx3wjcNz0n7UuXwR8t7jw8W1n-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162

In qmp_ufs_power_off, the PHY is already powered down by asserting
QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
stopping SerDes are unnecessary. Also this approach does not
align with the phy HW programming guide.

Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
SerDes calls to simplify the code and ensure alignment with the PHY
HW programming guide.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index fca47e5e8bf0..abfebf0435d8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1827,13 +1827,6 @@ static int qmp_ufs_power_off(struct phy *phy)
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-
-	/* stop SerDes */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START);
-
 	/* Put PHY into POWER DOWN state: active low */
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
-- 
2.48.1


