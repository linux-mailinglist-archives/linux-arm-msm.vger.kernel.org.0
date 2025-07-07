Return-Path: <linux-arm-msm+bounces-63951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF0AFBD22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E43948130D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 21:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0961828540E;
	Mon,  7 Jul 2025 21:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VAtLvwWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225728724E;
	Mon,  7 Jul 2025 21:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922215; cv=none; b=R/bHTZzr9Orl4PRqLC5T+eoCQrasOTUwSMosy6vVVwuZUNdzPErp5Nd3m/9iEPpK8KQi6YiJfPkCZmY22Cql3pnSUVOvLxdjgj6xPOC/HcpQmmncmDvVB+vMtCF0r5igeppQR2VYQDu7qK62+OnannFw9HjK/P+MjaqwYCKMhx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922215; c=relaxed/simple;
	bh=hG84qV+KfStj6ry4qZlMKSx03j2D34Jdw4tAZC3Wiss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCmwSIjyvPhbeK1CbM70NCICVS3hUgq2x0iXZlo28n9dAiwxZMaUIBPwDkPFNkeF4CZEDBxE2ZS9BLCJbQQFdlFu8w+6vef2PKmDrkkZYlvn2oNjZB/Gx974z/Vkz1kL9oA3S0ZeGFZUcXTguIbMa0uA86FLHG2YRvZ+NYg7Z6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VAtLvwWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567Ij1LQ023655;
	Mon, 7 Jul 2025 21:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QmGFuEexZ1c
	MSUqFmIGDYcqGuzgfFpGnakB5jQriJPo=; b=VAtLvwWmyfbnD00hsbMGkIzhkJs
	g0TAGlsQNktS4PlUIm5lsqaKuJUjk1QJGhczJWf02I8isIUfME/2H3nSjmHdAYWN
	yPFlsr/aXnfYyuNTEzrq2Cn2Inc5CPjzrbg+0+ZLlmPDgiIcTVzJ7m1zPw0rcX9i
	K35nxo+eGUIukdS8IPtPJ0EvU+z0jQcLuCd0RP8Gwok5lS8GLvKvY9rTby10NGYH
	dQb0Xuot3GMYiaAB4vMF49Jyea24ZMPTc/w9Dh35HUxF/UDR0mw/2LMINSkQtna8
	ZUjKj892wqRYnlqfkS2y3gfgEEF6jCqzrhgONwlhcPW2DU1MEbc9zLZoXhg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0w88yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 21:03:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 567L36Ja015177;
	Mon, 7 Jul 2025 21:03:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4knn2s-1;
	Mon, 07 Jul 2025 21:03:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 567L36bo015167;
	Mon, 7 Jul 2025 21:03:06 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 567L36Zr015166;
	Mon, 07 Jul 2025 21:03:06 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id ADEFB57186C; Tue,  8 Jul 2025 02:33:05 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 3/3] scsi: ufs: qcom: Enable QUnipro Internal Clock Gating
Date: Tue,  8 Jul 2025 02:33:00 +0530
Message-ID: <20250707210300.561-4-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250707210300.561-1-quic_nitirawa@quicinc.com>
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kH2gag92QeQ7GfzJU9uaCyVjJLL_xoyl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0MSBTYWx0ZWRfX6Tf9z1POC7VL
 wXu6gahcmiZ22xDOsWaNJIOOP77IfWWecERfbhva3wlbWtXpprKj7Y64vm0OP9w58GDy/SSwv8v
 4TJ6ddZ9Lipskd96wtI5zbi36/XWLDxO+NChXtI+ZkN1avC3yRcifN8yfn2MQtymrcxfcUkd4Mj
 HXuuLMye8JvbXL9SD4t5V4ms7k6alhSh4rY4DVJ4IR0QURq3Y8iFYvTzBN7D7wt7Q07m5SA9S4w
 G1+ikSTHPuRCtUouFcE7yFdC4QBe4S98EHOxOe6MRWG7UUlqGzS0c6DJj5+yZuHCYHmQis4gXm2
 QEcAqxLMTjK0lLWoMcxj3zBpfe9yDOe1fNYtSsOAmfchhspmz8ebSgac92yUBWsK9YCSX2pK/kP
 mtEDTK0piOmunI0VoEhk++Z/q8UXWW2Ds5GoEeRjHldoOLYlHyeN7uenQkwOb4R+j+esj8Xv
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686c360e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=AaFWqURAGA-n2MsR6FgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: kH2gag92QeQ7GfzJU9uaCyVjJLL_xoyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070141

Enable internal clock gating for QUnipro by setting the following
attributes to 1 during host controller initialization:
- DL_VS_CLK_CFG
- PA_VS_CLK_CFG_REG
- DME_VS_CORE_CLK_CTRL.DME_HW_CGC_EN

This change is necessary to support the internal clock gating mechanism
in Qualcomm UFS host controller.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 21 +++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index dfdc52333a96..25b5f83b049c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -558,11 +558,32 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
  */
 static void ufs_qcom_enable_hw_clk_gating(struct ufs_hba *hba)
 {
+	int err = 0;
+
+	/* Enable UTP internal clock gating */
 	ufshcd_rmwl(hba, REG_UFS_CFG2_CGC_EN_ALL, REG_UFS_CFG2_CGC_EN_ALL,
 		    REG_UFS_CFG2);

 	/* Ensure that HW clock gating is enabled before next operations */
 	ufshcd_readl(hba, REG_UFS_CFG2);
+
+	/* Enable Unipro internal clock gating */
+	err = ufshcd_dme_rmw(hba, DL_VS_CLK_CFG_MASK,
+			     DL_VS_CLK_CFG_MASK, DL_VS_CLK_CFG);
+	if (err)
+		goto out;
+
+	err = ufshcd_dme_rmw(hba, PA_VS_CLK_CFG_REG_MASK,
+			     PA_VS_CLK_CFG_REG_MASK, PA_VS_CLK_CFG_REG);
+	if (err)
+		goto out;
+
+	err = ufshcd_dme_rmw(hba, DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
+			     DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN,
+			     DME_VS_CORE_CLK_CTRL);
+out:
+	if (err)
+		dev_err(hba->dev, "hw clk gating enabled failed\n");
 }

 static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 0a5cfc2dd4f7..e0e129af7c16 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -24,6 +24,15 @@

 #define UFS_QCOM_LIMIT_HS_RATE		PA_HS_MODE_B

+/* bit and mask definitions for PA_VS_CLK_CFG_REG attribute */
+#define PA_VS_CLK_CFG_REG      0x9004
+#define PA_VS_CLK_CFG_REG_MASK GENMASK(8, 0)
+
+/* bit and mask definitions for DL_VS_CLK_CFG attribute */
+#define DL_VS_CLK_CFG          0xA00B
+#define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
+#define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
+
 /* QCOM UFS host controller vendor specific registers */
 enum {
 	REG_UFS_SYS1CLK_1US                 = 0xC0,
--
2.48.1


