Return-Path: <linux-arm-msm+bounces-51746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAAAA676D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0538178385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9DB20F076;
	Tue, 18 Mar 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lMXcawRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BD20E317;
	Tue, 18 Mar 2025 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309401; cv=none; b=gdRVmGlLDreUUqHisbtG7h6FOyKDLf+uWrD5+RS4/L8KOUJuFsBRt8ZDaPnamOmuqED92s9CQEou4jiaNHMzwZuOdrTFyMF9XeYKZqstVvmiqN4KOg29H/Y3E13+DpIeCq3uIPtvEVfibPQkGHmCsCSdigSWyuaWNu8mtQqhAh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309401; c=relaxed/simple;
	bh=xsbhiTRwH0nsVkqmb4PiRjp4ogaqQIfjH1cyg6ozYKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewxtb5XwbnIYcPD1ohpb9jP9Q2v70XJL4fYmHv2yNfkoTFRa93BKKOAjkncVxmeK5bE9pWyIdgPJ2BwOP3QJBMs+s+ADiKEeKj2LOE7Orx4Dt5I/mm4jeQHfY5Jy26owBqIQBlZKHLygjdaiks6CzxRxzxN5C4atvYVBg3a8X4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lMXcawRC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9B2fE017976;
	Tue, 18 Mar 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q8Uj+hzMsRo
	7D0JUQTQUU2qUCqDKD2bgUUcr/44iNqo=; b=lMXcawRCPdKhqEFOFjwE7l7P9bI
	+7Nd2U0Mtv+c7+bj4z5W6Oj3wnOt8PJ1itt+WVbGTrP0klFNYG2JRqpWAV/IEoch
	8y0z8vNglr/elezgebvNwyH27u/qL5nPipNDPEzbvKDk8tCiSC0wJIPmPaRm/vNp
	gHxFw7EGm/Mbo42ce1cotRtESQMLtmvTyjXCLBpnRwVTNUrEsLIK1mB5PfT2pDkC
	vs+OZbN6R3sY4GtopXgnRPKIuIwftvGT127m7EZRo6TzdF5iCXpKmdrAXoXKHgjN
	ARfzuIvRm4oMy/Qpk/8yU5tQ4Pqo92DySOmgg3n22yQDvXQa0LHTJNdwNsg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy0jtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 14:49:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52IEnm1o004305;
	Tue, 18 Mar 2025 14:49:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 45dkgmfv8n-1;
	Tue, 18 Mar 2025 14:49:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52IEnmWL004296;
	Tue, 18 Mar 2025 14:49:48 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 52IEnmLU004293;
	Tue, 18 Mar 2025 14:49:48 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 8233B501582; Tue, 18 Mar 2025 20:19:47 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Can Guo <quic_cang@quicinc.com>
Subject: [PATCH V2 2/6] phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
Date: Tue, 18 Mar 2025 20:19:40 +0530
Message-ID: <20250318144944.19749-3-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: iz_eQCwoZu1Xq-qOAv7NDsu9HosJF4GH
X-Proofpoint-ORIG-GUID: iz_eQCwoZu1Xq-qOAv7NDsu9HosJF4GH
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d98810 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ZEhkBkkNTqPGxlI-GDwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180109

Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
puts enabling regulators & clks, calibrating UFS PHY, starting serdes
and polling PCS ready status into phy_power_on.

In Current code regulators enable, clks enable, calibrating UFS PHY,
start_serdes and polling PCS_ready_status are part of phy_power_on.

UFS PHY registers are retained after power collapse, meaning calibrating
UFS PHY, start_serdes and polling PCS_ready_status can be done only when
hba is powered_on, and not needed every time when phy_power_on is called
during resume. Hence keep the code which enables PHY's regulators & clks
in phy_power_on and move the rest steps into phy_calibrate function.

Refactor the code to retain PHY regulators & clks in phy_power_on and
move out rest of the code to new phy_calibrate function.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index bb836bc0f736..0089ee80f852 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
 	return 0;
 }

-static int qmp_ufs_init(struct phy *phy)
+static int qmp_ufs_power_on(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
 	return 0;
 }

-static int qmp_ufs_power_on(struct phy *phy)
-{
-	int ret;
-
-	ret = qmp_ufs_init(phy);
-	if (ret)
-		return ret;
-
-	ret = qmp_ufs_phy_calibrate(phy);
-	if (ret)
-		qmp_ufs_exit(phy);
-
-	return ret;
-}
-
 static int qmp_ufs_disable(struct phy *phy)
 {
 	int ret;
@@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
 	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
+	.calibrate	= qmp_ufs_phy_calibrate,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
 };
--
2.48.1


