Return-Path: <linux-arm-msm+bounces-56658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04DAA819E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 18:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06A511B633E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 16:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC5127A939;
	Sat,  3 May 2025 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RrwjlilM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73881F1508;
	Sat,  3 May 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746289515; cv=none; b=TJs6j9/4mkAWeWqvqcWkVAPPRFXyiiuvSxEQ8kq0P2liFhuAD3H5nECh1aUxG7U2LxId5MfedBEMNpJNQfd/zHLo3Nau60jUlP9P3YFaw0C41OW4IajqHf8XifKK519O8Q0DtjeYhCmwFcPmL8NuoSM61zhbsTGDZVl9JImnEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746289515; c=relaxed/simple;
	bh=lGxx0xcmSC6aYPTUvYvkXGNcIwmdZpACrGVuxDGh9y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O+TZ9AcBTiuFpXRv9VgbHEtmyq8I6WR5qD2D6NtMprfYwxMcTNYgYWmKvzGQ8n+SMjdCuJ/SIgPQHDut6+ZMep/hPNhIGOCLOhi8sTSo7y9q1Fr0r/7lCIeFfArBP88FjKZjWUyYodosekYkTXZpMaLwooLdiV3XK6rb9Dlh+YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RrwjlilM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543F0vOU023721;
	Sat, 3 May 2025 16:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gyyYLbUYOCa
	BtHLywKsV0CcmUMbcvTs0+snjbNX1iKE=; b=RrwjlilMcEFVROyVZS2PjeWHas4
	nxjlWlKfz2AicGPS6bc8ZID/OCzCaUyuUAP2lPrpE0KAszd36lCWT1zfVUPZV7M+
	wAa3m9NLgKHi+VmL4Ixod84Q5Eu1WEIXu7vTZvZ1OMx7nea5aoEUU9SrtzoAx6QB
	gLlpyIbK8U4EMvhNBwgFuEDKJq1QQoNrZXGGBSZWZbMKT2XGIGYmISEHlncwEn7s
	LIByqJKPM1itjRx6l12LN5UCFLY24npC7CE43OqsyoJTPwU+cKoQ7uSOnv0bTT15
	uSUGrjqo35wKIPsezLJuxDwN46RNSBwSQndpbI6ud5P9B1mX0drcK0WXhFw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfgsf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 16:24:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543GOkqR029818;
	Sat, 3 May 2025 16:24:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 46dc7kb1ff-1;
	Sat, 03 May 2025 16:24:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543GOgxU029746;
	Sat, 3 May 2025 16:24:46 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 543GOkhV029809;
	Sat, 03 May 2025 16:24:46 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 7E30E5015A2; Sat,  3 May 2025 21:54:45 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V4 03/11] phy: qcom-qmp-ufs: Refactor phy_power_on and phy_calibrate callbacks
Date: Sat,  3 May 2025 21:54:32 +0530
Message-ID: <20250503162440.2954-4-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nS6O4KPA0-a1AnoaV6Gp9lYF48utZNgp
X-Proofpoint-GUID: nS6O4KPA0-a1AnoaV6Gp9lYF48utZNgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1MCBTYWx0ZWRfX6hJ/SjC2k2C4
 bpGIWSv47e14AOTWlYiXnbhXnwYSAY/jMhltFgIXYsOJlE+1HZ5rxV9JcwZyU9rLV2mZI2lrvD2
 YpCC0jRLgz7QyMBHRSOqew5x4Xvqf2XReejqM+59cEKOwOei3OG9Xq8mcLLAdtYZvzStzh5d2cu
 p1VSxwgp88tai8yiuqTEuJb3Ln7uN8acXLCoYiSkMyRyEukZKrrDh5EmbN1nIaZYyPuUHkGBpcX
 hPfBI7yugDuVkhmp7OKp5jOLTTgasq9UTf13gQEo5dbIv8sYPg0Px8MZ2J6daqM+fhqxv58vKDe
 /QYYU+c++WexE4VE/rmUDugbi9Q2jpPyHUbnJ0B0tRpg/m+m3BrFcP6OaqwrDPK2/xMHSIYkHKc
 nKaro74aS2F62I9scPtvaZnEfe90ADO6Sgi8cqdMLb6LTdRkoACat/l0v4vMVO/Qij7iPjA+
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68164352 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=ZEhkBkkNTqPGxlI-GDwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030150

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

Also move reset_control_assert to qmp_ufs_phy_calibrate to align
with Hardware programming guide.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 26 ++++++-------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index bb836bc0f736..636dc3dc3ea8 100644
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
@@ -1824,10 +1824,6 @@ static int qmp_ufs_init(struct phy *phy)
 				return ret;
 			}
 		}
-
-		ret = reset_control_assert(qmp->ufs_reset);
-		if (ret)
-			return ret;
 	}

 	ret = qmp_ufs_com_init(qmp);
@@ -1846,6 +1842,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
 	unsigned int val;
 	int ret;

+	ret = reset_control_assert(qmp->ufs_reset);
+	if (ret)
+		return ret;
+
 	qmp_ufs_init_registers(qmp, cfg);

 	ret = reset_control_deassert(qmp->ufs_reset);
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


