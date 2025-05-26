Return-Path: <linux-arm-msm+bounces-59446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 851CCAC4261
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E72F17959A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E5C215179;
	Mon, 26 May 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bvKZVVCs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD51F4CA9;
	Mon, 26 May 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273935; cv=none; b=fQvdA9IYOGaRkFlN959VdNgpZHShqsLb2s+VmD4g9DLpbsY7pLo59yeReG3ouw900+scDgkEa5JEsosLRZouztp5/8J2w0h2c6KrdYCRTM8r5ttCbFNv9BcmxSo1wVNqxZ9IV4Ln9hdokBtgGJh8erDU55zNX7gxU6HViXwmKB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273935; c=relaxed/simple;
	bh=sm+Weq3uvzJVR8DHTJ/9ZuZHxbTE4fXD5PR08Htpf8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiptbIu+b0CfqjA6c1biXbyjjLIivtDfA4Vur8b09PprTA9uPuLSDDeFiWjDCNdNPIJ8upYvP+MZwzppaUNPFED3pcmXNlPSKa8mUyCEyfsM+kFOc3Trg2bEh5VXbWaRVWcj+bi2obLUxN3y34Mj+zNc6KsERwNZB6R2+FgqJiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bvKZVVCs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9ic4R002280;
	Mon, 26 May 2025 15:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L73Cp5NdBBz
	xzo/79A6ikNvwhMR6tZjtrpsy2tST6y4=; b=bvKZVVCskoKpRN4pI6NECECWJsX
	Gt+ch6QiRuVz4xFnfsWRMbp1XSBTNUx7yNGO1ul7l4LLjVUvS21+x2mMcRzqKPYU
	FubRCW2yq0akHw1cETaNzd914Nb/BrNZ04hXk5BtwjE/c3ZYJnfuZOIvg3I1ljvX
	46M8ydWTq72DV/nQSoiKWGpsoO1LEr17evnZ9Ky1pmozqAB1rVugCKoMclzG6ZHL
	6sbsNrjFyWc5P8Hq+DTbKUiJV6EyPlGUokfBSeF+VnS4O3t6mmw+1h7O+j5yvBi7
	+7v94yns4PV/agTL6hV67Q2cC41IihQoM9m/IuVhjInS/VR1DGstF9koZaw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vnxa0tqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcR78032469;
	Mon, 26 May 2025 15:38:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:30 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcRQP032457;
	Mon, 26 May 2025 15:38:30 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcRBa032454;
	Mon, 26 May 2025 15:38:30 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8D13B602733; Mon, 26 May 2025 21:08:29 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 08/10] phy: qcom-qmp-ufs: Remove qmp_ufs_exit() and Inline qmp_ufs_com_exit()
Date: Mon, 26 May 2025 21:08:19 +0530
Message-ID: <20250526153821.7918-9-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: H0ZNYB9fuaP41Z1WF4sBerfeRymIhraH
X-Authority-Analysis: v=2.4 cv=HvJ2G1TS c=1 sm=1 tr=0 ts=68348afa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=oh2laS7BmKQVZinv5AcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: H0ZNYB9fuaP41Z1WF4sBerfeRymIhraH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX0X0lQSj0BiTi
 Y+uBWISNmSG+F5zfBIOxznvjgHEWO9G5oGPCVnw4gb9dgqEQKrj99AMFAJjEyVzthee1TNlwLOG
 CGoQ4mfV/4H4EKBiBsTQ5dCTdGMy6pGClQR95cC3eLhTpanR/C+1AFYMPVgTOcp1pONWla3XLEJ
 kOOtjcPOtFjE2UF+ggmkhS3mwJ2ErGI4OJWhKqsAy1eRbVw0awMYWgphVe64ljkfnWhrQbiGgIB
 kIdIBUBvh3RTbKftwbQweG4G2/CEg+l7o1ZncqG2RxN3S9z63qced6BH6ewRGkgdstxaeUtmokX
 Lu5w1aUCSs5rvLemrpzxtidyCGqUW+BoACuZ+fIGqJRcPC+a1rK4Ov/7mzCd+gNkFerlkjhHswn
 uPzKgqlYYrdl0prtm0M3EMDVmsmT/C+6KXSrd2THXrQnNSAc6SmrSJdPpQb8l1jZiVLED0vl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260132

qmp_ufs_exit() is a wrapper function. It only calls qmp_ufs_com_exit().
Remove it to simplify the ufs phy driver.

Additonally partial Inline(dropping the reset assert) qmp_ufs_com_exit
into qmp_ufs_power_off function to avoid unnecessary function call
and to align with the Phy programming guide.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index e0dc5fa43dee..00bde65733cb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1758,19 +1758,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }

-static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-
-	reset_control_assert(qmp->ufs_reset);
-
-	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
-
-	return 0;
-}
-
 static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
@@ -1849,7 +1836,9 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);

-	qmp_ufs_com_exit(qmp);
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+
+	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);

 	return 0;
 }
--
2.48.1


