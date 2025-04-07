Return-Path: <linux-arm-msm+bounces-53365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 919EEA7DD46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 14:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 558B416F034
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 12:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D361B23875A;
	Mon,  7 Apr 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X6+ar7cN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00608226CF8;
	Mon,  7 Apr 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027827; cv=none; b=pDtqeQ8PGpZffJIOKFv19aWnKm7Y0QrjEm0+5i899a/Zwb7FDz3t5wkPALFX8tYxWfl3+KqW9AwlkBdSLyPL97VYmdAHGGuR5+rT6R8NajMUw3M7sjAGw/A29f3h2BNMgiPLGF+qUbToJG+iMRsWwnWyL11R2/Bp7FoTxL+oadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027827; c=relaxed/simple;
	bh=OgFWpzAKMfG7wFvOhcCVUBKquuyOE59uxBnd336OQd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZkbXOMFzhxBLMNK8MgmA2jnPrCgy5Z3qSYJpFyeebC4IiEmtJjAdm41WybAL1FbUKVgecyF6OteCBgHmEA32ATV/MH4n/4w6aLU1RuoB9WZ0tEUS6KWP0C/OK/PRrLiOOYba+/TPCpaklqoZ3zZTklvnPovEc03bDJ3E3YcvOPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X6+ar7cN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dl82010401;
	Mon, 7 Apr 2025 12:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eMHC3qBre7Cx3jMNFbAkbNrtN1K26u4iegL
	mKKlUW60=; b=X6+ar7cNmlMGcWceLcm+/x8R2NR4+ikmFmXvRCdbKAK0pOr7uqb
	VnYQwoF4iisvYKKF35Sez6/XO5Rw10mNuErBf85iQSndRsAN00jrpg6Ci7yvo0So
	sMZvaR88mcAjDC9ZtbK/ixmkneAa+9MsIk+oRcxn9ZXyJsQbBW/t2pKgF0N9MEfh
	04iArnqvXa7cK7Da+9XQ/JYbho5uVOQLBQ4FoSPI9gEr07galqh8l5ZCxTH90IwG
	JnGTdJvT/THiYGEkQbnnbbPJx0maMAzW/zpisgPVcDFBM5XFj7brZQGCQ5shHd2V
	nEV6LmTpmSMcg+R+GQBMybalWAXNZ8ik74Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2m6df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 12:10:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 537CABuD014304;
	Mon, 7 Apr 2025 12:10:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45ufe8q6af-1;
	Mon, 07 Apr 2025 12:10:11 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 537CAACu014289;
	Mon, 7 Apr 2025 12:10:11 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 537CAAKu014288;
	Mon, 07 Apr 2025 12:10:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D2A08501586; Mon,  7 Apr 2025 17:40:09 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        quic_mapa@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V1] phy: qcom-qmp-ufs: check for mode type for phy setting
Date: Mon,  7 Apr 2025 17:40:08 +0530
Message-ID: <20250407121008.22230-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-ORIG-GUID: ILZgk981LSd1yt3Y9SLTcd37QuMFKu0V
X-Proofpoint-GUID: ILZgk981LSd1yt3Y9SLTcd37QuMFKu0V
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f3c0a7 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=udVkWoAwuaFyegVQXPwA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070086

Generally all target supports Rate B but for very few like SM8550,
two sets of UFS PHY settings are provided, one set is to support
HS-G5 Rate A and another set is to support HS-G4 and lower
gears with Rate B.

Commit b02cc9a17679("phy: qcom-qmp-ufs: Add PHY Configuration support
for sm8750") apply Rate B setting for SM8550 gear 5 without checking
for mode value (Rate A or Rate B) from Controller driver which caused
issue as SM8550 support rate A for Gear 5.

Fix this by adding mode check before applying Rat B phy setting.

Fixes: b02cc9a17679 ("phy: qcom-qmp-ufs: Add PHY Configuration support for sm8750")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Closes: https://lore.kernel.org/all/430ed11c-0490-45be-897b-27cad9682371@quicinc.com/
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 45b3b792696e..b33e2e2b5014 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1754,7 +1754,8 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
 		qmp_ufs_init_all(qmp, &cfg->tbls_hs_overlay[i]);
 	}

-	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
+	if (qmp->mode == PHY_MODE_UFS_HS_B)
+		qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
 }

 static int qmp_ufs_com_init(struct qmp_ufs *qmp)
--
2.48.1


