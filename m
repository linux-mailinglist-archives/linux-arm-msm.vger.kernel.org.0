Return-Path: <linux-arm-msm+bounces-57231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACDAAF557
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 291F9189857A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 08:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743CE221FCE;
	Thu,  8 May 2025 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZQowrLWV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D221D596;
	Thu,  8 May 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692217; cv=none; b=raYJQHKcrr3PVsyTMbARAh26Cpx6bBOCCQ2G0G+JPHLEtAwfkal/Bm2wrm45x4fhk+kF3iwteyiTgf1HazOtzOIlBJI2/P5jf90teHV9z9DofUgqW3frs7/pWvP5AA2vG7sDe9r5lR7byGWU9tFGBr4CmHwJpzjke8W7XNfVoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692217; c=relaxed/simple;
	bh=9IRZhpn9aPjXbC+3ZI72ksVpGu5ZPK1knhrphqAIKgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YkVBcvNHNHxvsFwnJGjTKBOujxvHJ5ZVJZqeJPl1Qfpsv7Ti09Posx+93UP3LOHCOVPkevymjECuV+71Iz5a9EvGqQeoz/gd4VNNg/TlAGT7jTz5fsmrHnqekkcFti7yvz/MAvvblAK4kh7rqicG+2XINn3JV9vE6mP8wvxvjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZQowrLWV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484XOfl002229;
	Thu, 8 May 2025 08:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0qC38Lo3Cws
	8W1OAXc6S0yEDsU5CcGbyXnjIINnlII0=; b=ZQowrLWV+rvaVUwm9PaaYCovhhH
	LWboFZI5Zi9Ek1YzPKIsXoTRBYYWCz759TIPaAwAorFK8ACvsS5BAq5Bp4lZFV61
	yAUHc4aM+CsHKCz9j0OjYk4iEhR4Oc+CiwyjfEK20/tuqtC84yKLuEZqapJNFlfk
	HqTmYXnERj8uo1pbCabjQpMve4x/Ms8EYhyeS4crBAc543S0ZLnH2tE3PBB7/7Zk
	LD/IJUa7BwJqNbUpnct/HS5xmuH2JqQwdgu1WqeiK/XpJT1B3BUvTrNybZeHSERn
	HNfH3/czmHOpbR+HcEy0IrdKUshC0kLZN+zVN/Rj/df+/HvCITwu1A5w37w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpfgh0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:43 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488Felj015326;
	Thu, 8 May 2025 08:15:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq5g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:40 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FYdg015232;
	Thu, 8 May 2025 08:15:40 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5488FeR9015306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:40 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 568F240CFD; Thu,  8 May 2025 16:15:39 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v3 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Date: Thu,  8 May 2025 16:15:14 +0800
Message-Id: <20250508081514.3227956-6-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfX8Gt7V3Ewdg1u
 gjs7bgcDRKs1e805Lo1grnuUnyKh+7r5Z8uBWukbn2inB9npIpiPwE1mC8YRcotGUSyIt5RPT9L
 C8RHVexQn5PF4B91M6TlFdQDJzkOc9B+gRtUoaUeBnSovw2dchy/HvoKCc2KZUnb0BCQn7m7E5r
 mte99CYLSiLAWjgQwkDuIobL4SJsI+h9jtmn9FLVJPVwTcQgNBua5exCaryZCANXVrdQey1gcGM
 X6CszKI22c25JcVytM97cjG4CKV8zGCpFiA/T2KwA6VBD2ODI6/4cjNIX8EMQQbE2NcjKf7mBZG
 YMUNte2kWaxQwJI+x/qQF+/1EEi4PT2KsN9OQ5L9ks6nP3ZGYVbJH/ZN9hCvMGnt+6r80jRcDP+
 t0gw5cx7I5JDZbJSgfaFWoJSSWzbgjnTAq9lLOAWRqft+wpfwjTlbx/acaUtYctImGwzSUm0
X-Proofpoint-GUID: mFh4YkiYOyOUUFmZkBKTAPY-kXeLMAoa
X-Proofpoint-ORIG-GUID: mFh4YkiYOyOUUFmZkBKTAPY-kXeLMAoa
X-Authority-Analysis: v=2.4 cv=J5Kq7BnS c=1 sm=1 tr=0 ts=681c682f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=ZID-MTkIcqpTFlPhiEUA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080072

From: Qiang Yu <quic_qianyu@quicinc.com>

All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
clocks provided by the TCSR device.

Hence, restore the vdda-qref request for the 6th PCIe instance by reverting
commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref
supplies"). For the 4th PCIe instance (Gen3 x2), add a new driver data
entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy of
sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.

Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 37 ++++++++++++++++++++----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ab90aafb3..c3c725744 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4142,6 +4142,33 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x4_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg x1e80100_qmp_gen3x2_pciephy_cfg = {
+	.lanes = 2,
+
+	.offsets		= &qmp_pcie_offsets_v5,
+
+	.tbls = {
+		.serdes		= sm8550_qmp_gen3x2_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_serdes_tbl),
+		.tx		= sm8550_qmp_gen3x2_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_tx_tbl),
+		.rx		= sm8550_qmp_gen3x2_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_rx_tbl),
+		.pcs		= sm8550_qmp_gen3x2_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_tbl),
+		.pcs_misc	= sm8550_qmp_gen3x2_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(sm8550_qmp_gen3x2_pcie_pcs_misc_tbl),
+	},
+	.reset_list		= sdm845_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list		= sm8550_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
+	.regs			= pciephy_v5_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+};
+
 static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 	.lanes = 2,
 
@@ -4164,8 +4191,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x2_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sm8550_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -4197,8 +4224,8 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x4_pciephy_cfg = {
 
 	.reset_list		= sdm845_pciephy_reset_l,
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= sm8550_qmp_phy_vreg_l,
+	.num_vregs		= ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
 	.regs			= pciephy_v6_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
@@ -5094,7 +5121,7 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 		.data = &sm8650_qmp_gen4x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy",
-		.data = &sm8550_qmp_gen3x2_pciephy_cfg,
+		.data = &x1e80100_qmp_gen3x2_pciephy_cfg,
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy",
 		.data = &x1e80100_qmp_gen4x2_pciephy_cfg,
-- 
2.34.1


