Return-Path: <linux-arm-msm+bounces-103275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDsoJzBt32kzSwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:49:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33040368E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B2414300B9E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 10:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F43F314B76;
	Wed, 15 Apr 2026 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqlTHCBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D533F33A029;
	Wed, 15 Apr 2026 10:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250154; cv=none; b=GVkbAri3pxmvLPtE74foqM5bKl3DSLLC0hiFuzwwdy02ms1JacU5druwJ+CsxaUX1eoDztxcq1qpV5zaJyXRWuGzXjj/LFNQ9ONnT8SoYlHc37RngDoqjaqSzdd483Dl29+aGtuQAY5wpduxF5Z5n6fB6lQRS/xrQpIDycWU0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250154; c=relaxed/simple;
	bh=uyJxzmVKZYjm7UoqvEgdpvtymOMnz4JzEZ+bexIHW58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VSUz/T1QRX/2YpQNBpNpjP0FF4LXn7b9UgQkbeXRE0uJzxaIinV/CGlR+sVuAbzS/2K96hJpPK/bop7ayipPbSlJJqzjfXXI7cA4YdKQhHMxiKM6ONtKU7MpSyk7ObYmevVvG018K7tB+cHEiVFb4Q58joRiyt6sTJZF3WYaKlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqlTHCBA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9x5Cm1701751;
	Wed, 15 Apr 2026 10:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IaFZ/jUtQskyYUrB3PlnQwqoEyTQvXvwAD7
	+flNMQ0c=; b=oqlTHCBA7t2XPKa/dB22XrbxtI96oL1v1MfyGGdegY30c0qGZWB
	phaVe9Xp1lB8fCJsW52HMdSKRtuhls8bLF4pfnTaK7DTuAlqaLhMDvERo+INVmXf
	xIAsOztCpLgxTFSom7Ygv8j2yOPKZ+MXco9zyQGdxqNKAUmWcsSgcreOXnaKvU47
	lFiFLy/D6dqid1PJ1wEn1b5R1yJTM1NfOt7H1GmxUDhBLN9rybg0PWgC67YLzz+q
	HmyXRVVNA9SOffVD0z88uKuHEuoPnfVNmsG6nYbKLFjqiWMxZsLDtW15EMBb5WCD
	fid0ymr2PvAhT9YXwq2+3pkk2cS7R/7P0kA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56twbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:49:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63FAn1Gw016427;
	Wed, 15 Apr 2026 10:49:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4dg5d11btb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:49:01 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63FAn0ta016417;
	Wed, 15 Apr 2026 10:49:00 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 63FAn0UJ016415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 10:49:00 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id C1C5A5F0; Wed, 15 Apr 2026 16:18:59 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, abel.vesa@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] phy: qcom-qmp-ufs: Fix kaanapali PHY PLL lock failure after SM8650 G4 fix
Date: Wed, 15 Apr 2026 16:18:51 +0530
Message-Id: <20260415104851.2763238-1-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: VaDh0r7muCZ5B-hP0R8PE6ROCim5d6of
X-Proofpoint-GUID: VaDh0r7muCZ5B-hP0R8PE6ROCim5d6of
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69df6d20 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XlGZrpHi-DB37YRDZ8oA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5OSBTYWx0ZWRfXxjvJKeXvBW7K
 Cpya/QTkDp1q308W5imIci+VWyif3zP5yZ47lJOYUalU+/8vnh6dh0TMFgzdRbMXsYIUs9NIX2w
 bOg3ufs2qLeEF/DGvn0DyN122/akw2Pzn2eSrdqLVCqG5AeQrKOga6+xA9jBhrNv5LdUlfmsVjG
 Ivlo+eKQAj1skTzluY57NCUVxc22CeT22ZOrlKkq8TJJnaSSK7zpf39yQr4pg7Rafwu97wVrFZk
 7MjlTY4g4vXMR4BLHlgnJocVj5flM1yHrwEi+7iGQnT/g2GaH8qieutQLeV9TbmaFD2z1sjwbwd
 LdmeMJ3Fw7CVqr0AtmxUvnWUfFEmkKH+2yE+tbujJm5IJrgEK1H8iebzo0JS1C0NRWvzgAB9vS3
 E314os0vFdSrxQw9EBKGe7bDqFNZPDg2SD7qirU/UjDnG/Ia4nJkqVxC4xV1mvexg1MuArMY/cU
 wKw+g6e9wQ5EhRXHTrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150099
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103275-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nitin.rawat@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9D33040368E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
moved QPHY_V6_PCS_UFS_PLL_CNTL register configuration from the shared
sm8650_ufsphy_g5_pcs table to the SM8650-specific sm8650_ufsphy_pcs base
table to fix Gear 4 operation on SM8650.

However, this change inadvertently broke kaanapali and SM8750 SoCs
which also rely on the shared sm8650_ufsphy_g5_pcs table for Gear 5
configuration but use their own sm8750_ufsphy_pcs base table. After the
change, kaanapali PHYs are left without the required PLL_CNTL = 0x33
setting, causing the PHY PLL to remain at its hardware reset default
value, preventing PLL lock and resulting in DME_LINKSTARTUP timeouts.

Fix this by adding the missing QPHY_V6_PCS_UFS_PLL_CNTL = 0x33 entry
to the sm8750_ufsphy_pcs table, mirroring what the original commit
already did for sm8650_ufsphy_pcs.

Cc: stable@vger.kernel.org # v6.19.12
Fixes: 81af9e40e2e4 ("phy: qcom: qmp-ufs: Fix SM8650 PCS table for Gear 4")
Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 771bc7c2ab50..b87314c8379d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1112,6 +1112,7 @@ static const struct qmp_phy_init_tbl sm8750_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PCS_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_PLL_CNTL, 0x33),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x0f),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_RX_SIGDET_CTRL2, 0x68),
 	QMP_PHY_INIT_CFG(QPHY_V6_PCS_UFS_TX_POST_EMP_LVL_S4, 0x0e),
--
2.34.1


