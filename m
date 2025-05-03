Return-Path: <linux-arm-msm+bounces-56662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ACAAA81AA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12BA93B4F23
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3651627CB35;
	Sat,  3 May 2025 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jm30w8tf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0727C869;
	Sat,  3 May 2025 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289520; cv=none; b=LMBKQ0lGn3ZsFiJ68CuVdTXViPf3dQI9ntWH1sU6SnEpvcUcmRaJNLHSFeCo19U197hmAfnTSFcmdeV2pv9smSMlYYPvG6tPv0M2F4j9i9D/P5w2n23mTnOZIRGDpLdGg9fQfT7Or9uDwHVHUOpHUja7qe9vfkg2PpiDB9g+Zvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289520; c=relaxed/simple;
	bh=ufaE+8XrxTdh6E5JR/dqtKR4VHqvjdmkeF3vUO9CYDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktoJjMsqD+1H154s3kzrrtvbdFgBpTdKe2Bn0CNMg7mZ/JVwPgByDAPgMvWa1Tol5L1xzBY9VcJ8KVQYhPV936In1ctdziYfgIcQIPlCqiomP/Sd6Lk1sV1EH48ckyFNXzS7KSpDUM90FyDqA5Fy78i6tmZDVMSWzjHrshBBshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jm30w8tf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436G16T000385;
	Sat, 3 May 2025 16:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8rU7HxdtWpI
	/6yNDc0XEeG/tCboih3a+9HWNxxM9xWg=; b=Jm30w8tfX5rY6U7YNQ5IT11jv47
	or9m75pcPiuWWitRFElRl2TmYIbr65lderU1m0jXaxKBmJXATS+Ztx5PSbWei74b
	EdB68QvjYLMQVt/eeYzbg5Iiu7rr2ENSYfXzvrM2+mMVImZ02WPCBSFysaGwTUzO
	iQmO6U7vE62LOx99RpqxBRrRpyJ+zUqhUzNHkpF8Dy87/GQC9YsN9nyTDEQbdvRM
	xITsjlqkOK1CVUYvl84BPaGWRkYgkwMvak0DddioO24bkVW1a8S6bzFqErhGqDl2
	d9ctPegKH7EcnsnJF1u1+KzJI6dzTR9ZnKyrqX1VIB+Jrb+Sx9awqfcq61w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98rh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOiY1029771;
	Sat, 3 May 2025 16:24:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1gf-1;
	Sat, 03 May 2025 16:24:53 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOlrk029826;
	Sat, 3 May 2025 16:24:53 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOqm3029895;
	Sat, 03 May 2025 16:24:53 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 421945015A2; Sat,  3 May 2025 21:54:52 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4 08/11] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Date: Sat,  3 May 2025 21:54:37 +0530
Message-ID: <20250503162440.2954-9-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX/1ubJ3XfeLvs
 njX7aJZMsemI4exBnjJoZRp8stNg395wKyMVu3zCjDwDiWNIV5gKjfss7tDumgjr+wjOgc/UTYu
 jAxWECjKyFOZ+QWFALwKrkF7r4UzF6eaIkyQCpJNaD/vbuO3ZjaRz4+W3o+H/GmxvIcBPR3N1eB
 vQ6ez/eT9B7R2lFM9UFPqTBVCsuKWlz7uU+MDrtWXrBHHppGGyRyY16yem/QXHSIcSIJ2p3eiLR
 p5yeFpCuV/4uDUEIyXtGkEOfuPSKQuB8qorSv820J5M7ViTWanAbdwZB+H6StG4jLSwFhylxSJC
 CJqz70WE6Tb4CEOcsuE32nLLSrJBJzYuiV/XH0PdRNqUHR4qXyY66AvzfD+MC4Y7fdD9aNsApgZ
 mfTysJYCEjuhu1O/5SYMDiu7CPsyfKzYFTY2N/900wCPbKNFymEXa7re2AZW7V+q8jLtpuQC
X-Proofpoint-ORIG-GUID: xPAD8_xlE_Al3unBT2IO6qe2OxetIM6B
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68164358 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=0NjA6WJkZe3NLfXfqlsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xPAD8_xlE_Al3unBT2IO6qe2OxetIM6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

In qmp_ufs_power_off, the PHY is already powered down by asserting
QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
stopping SerDes are unnecessary. Also this approach does not
align with the phy HW programming guide.

Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
SerDes calls to simplify the code and ensure alignment with the PHY
HW programming guide.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 2df61ec68dc7..1cbc255c7c74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1826,13 +1826,6 @@ static int qmp_ufs_power_off(struct phy *phy)
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


