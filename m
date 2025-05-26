Return-Path: <linux-arm-msm+bounces-59444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB03AAC4258
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B433B955A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AC6210F5A;
	Mon, 26 May 2025 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jd8haZ90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB791F1927;
	Mon, 26 May 2025 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273933; cv=none; b=lCJwZY3aYFL2EavQ+02vnvAunjq2GHESvQTfKLYFbrdnv4K+JckuHBria2+ScsMulCmfZMQ9NNTIimp/sbaAC/HtQ1ik4Eaoaox8KdWnH38yQvi4uk50fnmOAZMWUgsnK5In/uSO4RJAVk6jISflc8kripgldG9oOGFeJFmcrlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273933; c=relaxed/simple;
	bh=6B/O/dK5/LSpl+RqtpmMIpffKkfTuit2uraFaj4IGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvu8nwZ7TrZIEgvB5PNwATmfytkEEpTTkWyFFigBH+zasf6sTC2SJcL+4At9UJpOYT5UlCaKyx8UHIUF+5ofOzVsdVrNN6B5LZDsTbT4APqKnT9b+MjWAkXLr6UtAjWruyDvUXbCzo2CAGW7QoOp9Ld9KsNC0FtjOhW+VLL/DBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jd8haZ90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9ijqL002328;
	Mon, 26 May 2025 15:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7+HkiFNu/hw
	W8yszJs8J52IoKHV5FgJKwzjTW5SWCF0=; b=Jd8haZ90nz/jRNXr5JHztWA2/ki
	d1IggCoybnnwH/NwsaDxCgbMJ+FGROZE80L/4PEBoqlb9KaALtdaOtp4wVFov7uq
	DOp8DZup91cpHcpl+OdU8PfRmd8a32jtmqLcEwcPiDc0RFKWz3mrFX3X138TDBLd
	6+U7rO48p3liGH+7eMCh9VYgtkn8SPK4FGbm04cVkC9vau2sgE2V4N34vp4DOBjq
	kB0mmJzfwmzP+q+VIE353V/8MIUolMqks5JHGniaysOs6l/jCiHsWhAe7jkEYQU+
	MHexL8vpbiybEvCrUExF57PTdRnoqiZi0m6i0VRt2kyqgVxVIY4923SptGQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vnxa0tq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcRjX032451;
	Mon, 26 May 2025 15:38:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcOOd032404;
	Mon, 26 May 2025 15:38:26 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcQeY032440;
	Mon, 26 May 2025 15:38:26 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D10F061B877; Mon, 26 May 2025 21:08:25 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 03/10] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and qmp_ufs_power_on
Date: Mon, 26 May 2025 21:08:14 +0530
Message-ID: <20250526153821.7918-4-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: aaMwhqjQQ1lR0i4lVZoNHo1JyPXoKkPh
X-Authority-Analysis: v=2.4 cv=HvJ2G1TS c=1 sm=1 tr=0 ts=68348af6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=jENGRIT2ScPjwYuSNhQA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aaMwhqjQQ1lR0i4lVZoNHo1JyPXoKkPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX6ARGd5B3OhzA
 T1ikJdjeIr/n9Kfn9fPY3Q+PqAtzguJvxVWiqGqZhhlbbDdWx8zk6cW+qCmLRXAshWP8205R1Kp
 BhnO+zkeJjflgHZmAbJLpLmS+9tnq6WfaHMcOVFxAGN2Og2MQn+CnH2A7tCDl+d3o2Wb2Mv+qfF
 TXUqBwXdNzimZ2v7v29ucOjYGJfgrX2N+vnNEGpcVwTSg24FRnfVmolRwe9Ex/o4TkiixNk9Pbc
 bPnMu4Y9ZIx2TU7iw0Q2/ipjQJnG4p4uZDT8kl/iVhgTChAxBMhe84AnFNDj58trc6ngHOfQ83Y
 OUXFw7kf8EEOsBbbL5OnaBKTpUdjxWWPThKOkTg/2S8I0tIqBfglPIndKpAWEjNaHRM54/hLE1p
 s2UdVqGGIZyGATXkOW/jwfp4zgvamyApn/S+lG1cFZyS+lirc0XohoNQS5/zRKKaf4ebKmFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260132

Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
qmp_ufs_phy_calibrate to better reflect their functionality. Also
update function calls and structure assignments accordingly.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index b33e2e2b5014..a67cf0a64f74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1838,7 +1838,7 @@ static int qmp_ufs_init(struct phy *phy)
 	return 0;
 }

-static int qmp_ufs_power_on(struct phy *phy)
+static int qmp_ufs_phy_calibrate(struct phy *phy)
 {
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1899,7 +1899,7 @@ static int qmp_ufs_exit(struct phy *phy)
 	return 0;
 }

-static int qmp_ufs_enable(struct phy *phy)
+static int qmp_ufs_power_on(struct phy *phy)
 {
 	int ret;

@@ -1907,7 +1907,7 @@ static int qmp_ufs_enable(struct phy *phy)
 	if (ret)
 		return ret;

-	ret = qmp_ufs_power_on(phy);
+	ret = qmp_ufs_phy_calibrate(phy);
 	if (ret)
 		qmp_ufs_exit(phy);

@@ -1941,7 +1941,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 }

 static const struct phy_ops qcom_qmp_ufs_phy_ops = {
-	.power_on	= qmp_ufs_enable,
+	.power_on	= qmp_ufs_power_on,
 	.power_off	= qmp_ufs_disable,
 	.set_mode	= qmp_ufs_set_mode,
 	.owner		= THIS_MODULE,
--
2.48.1


