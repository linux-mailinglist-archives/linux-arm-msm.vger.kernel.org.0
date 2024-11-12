Return-Path: <linux-arm-msm+bounces-37578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC039C523F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E5B9B2EFAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5553420DD77;
	Tue, 12 Nov 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WKmTmni5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5B193092;
	Tue, 12 Nov 2024 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403737; cv=none; b=jD15OiiISKDGs2Gx2Pma/GPu+Kt6z6twOVVGpRmykaq8XngzWwm3wM2MqWxF2YBH1q7YwxwRQoL4uKZzq/+pwULtebo6FurPDa1NCk3ewIGFOH6nA6ORTy1Lz6yBXCqhMODu274xzDG9ASjMMOTiMVrWuecgwcVLzp/jGUhcZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403737; c=relaxed/simple;
	bh=Iqcpu5dcQSdTZdbmC3lb6ryuooz772ta1slnPdadoTU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WPbjTiYGu5vkc63sj9XrM0jBL0ZtH/6dJEiz029hqrKHXczhDSVxmxMmcQGkSXXQ3g3A2u69jHlFZb/ugcMABeR++0mEO5XU/U+y0wJsJZOCKX4P08mvMhxpl2vRtxaJONbzcS5b5YAjXVKy5mZMun4a8Aq7gmF/0TE99k0d2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WKmTmni5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC6AcpL004261;
	Tue, 12 Nov 2024 09:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UGjdtV5zSzLXMpIfCIzg9m
	G8AEFR1uAnZu7QX3u6OmQ=; b=WKmTmni5RQwUvBekaA4QYZOzkiqGdV9CbaYZ1s
	uiUFZATwdWmFcaTTp9ib3f9TD/GoVho8Pm0Nyo0mp8a2rV0v2J2EtzdByp9e85l5
	7sP8BIVDYzGJ4egGLZU+Dw2zwgwmBdXsck+faT3+LRn7dxd7wy7g0BAAtMYki2ly
	/5VtpEG0h4rru0JaJIlTjM1CA9mU75b9TvB7uxDqZ7AJ2M/8HYwkvOIcclPqYXlm
	P2EX1vyHsslK4DYopBbV0LIG5rI0KPvvJTU2jm++3cC/Oc7ljDeR7wTpfOyaFx5E
	dbXVUYnjzPSUd0KXs0F/B6g11uBuwYE0RsRpmcj1ees68izQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6gf5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:28:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9SnX4027955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:28:49 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:28:44 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mantas Pucka <mantas@8devices.com>, Abel Vesa <abel.vesa@linaro.org>,
        "Komal
 Bajaj" <quic_kbajaj@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] phy: qcom-qmp: Fix register name in RX Lane config of SC8280XP
Date: Tue, 12 Nov 2024 14:58:31 +0530
Message-ID: <20241112092831.4110942-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VykZcjz1v4ZcAW5Sig9Y23ED1PY6Lfrh
X-Proofpoint-GUID: VykZcjz1v4ZcAW5Sig9Y23ED1PY6Lfrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=731
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120077

In RX Lane configuration sequence of SC8280XP, the register
V5_RX_UCDR_FO_GAIN is incorrectly spelled as RX_UCDR_SO_GAIN and
hence the programming sequence is wrong. Fix the register sequence
accordingly to avoid any compliance failures. This has been tested
on SA8775P by checking device mode enumeration in SuperSpeed.

Cc: <stable@vger.kernel.org>
Fixes: c0c7769cdae2 ("phy: qcom-qmp: Add SC8280XP USB3 UNI phy")
Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index acd6075bf6d9..c9c337840715 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1052,7 +1052,7 @@ static const struct qmp_phy_init_tbl sc8280xp_usb3_uniphy_rx_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_FO_GAIN, 0x2f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_LOW, 0xff),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x0f),
-	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_SO_GAIN, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V5_RX_UCDR_FO_GAIN, 0x0a),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL1, 0x54),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_VGA_CAL_CNTRL2, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V5_RX_RX_EQU_ADAPTOR_CNTRL2, 0x0f),
-- 
2.34.1


