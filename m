Return-Path: <linux-arm-msm+bounces-49296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10ADA43F2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E45867A4609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4F626869C;
	Tue, 25 Feb 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YSMtFM2W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE170267708;
	Tue, 25 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485934; cv=none; b=dFG62RYURenlLZabervrlrY4wVTqeDFL4NrO+abXJogXbw36U4HkXADXfDvzxiR9TY2qFCmIZXtqlD34PDDhpJhy3Jutdi+Gs251FeeUWlziFaeTWUQ43tZ4fUqGnytQP02Q1H1sI5xlXlWzLHUIYZLzaIP/3qvvWUAARVrrd+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485934; c=relaxed/simple;
	bh=zZnlWU34hZd8eIaYIRIvp7egmHlmucmN/e+gmghOIdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M5GBax55okY/5XcBjBqcjeLlVZPlt1Bhx1z5a0meuHpchVNNiDW+jGrPI+Xzh5ZZHxhPu1LfyUrPq5hvOI0iC5SyUyqqENiMa01UsvM/s5ugo5oPSIHL2yXsbiDMhk5UM/iqYlFr6ihg9wk9LU0lt91X6DUB+zbOC6mxpZ8dOuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YSMtFM2W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8Bfue001967;
	Tue, 25 Feb 2025 12:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3QoUj4zRYPoC3y4sbSiF6nLnX7XTbkJOpFB
	rC7r5oIQ=; b=YSMtFM2WIxBpr+ngtNtiu6umbB73VpqUveYZegTmeebnQfC88+4
	/zeF3ePIuPHrVKPDHLM8pJSkUwUrEwsN9BVIEz1sewtcjyo5XqOfLYdysOcO+LhW
	TngwWcI2J0/9b7sHy83hEwMbQqjy5WbiHROwlDkiu0pzSEDU+gHH5YxKI3ECm4XN
	GH6phX7cEiNgW7yF1a8W/6zs0dIA+mbhg8Dlt2CO9wmyriGhD5Gpc2F3YJKv2diN
	IM+3w7wdH/nCL7eBJC6hDwDcJY0ykF15NdbU3nhxr2DzR0r7iIG3VpX1WdtcQQSl
	gp4HJuahwWfhqIMYyh/34rr2Z7yjhYE/R2Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7rk0mqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIXoX004488;
	Tue, 25 Feb 2025 12:18:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:33 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIXVB004460;
	Tue, 25 Feb 2025 12:18:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIXnt004452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 805154DA; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH 00/11] Add DSI display support for SA8775P target
Date: Tue, 25 Feb 2025 17:48:13 +0530
Message-Id: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: udqKFAYimeEFL6qbMfV6tQ_fHF0L96c6
X-Proofpoint-ORIG-GUID: udqKFAYimeEFL6qbMfV6tQ_fHF0L96c6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250086

This series enables the support for DSI to DP bridge ports
(labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.

SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

Ayushi Makhija (11):
  dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
  dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on SA8775P
  drm/msm/dsi: add DSI PHY configuration on SA8775P
  drm/msm/dsi: add DSI support for SA8775P
  arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
  arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
  arm64: dts: qcom: sa8775p-ride: enable Display serial interface
  drm/bridge: anx7625: enable HPD interrupts
  drm/bridge: anx7625: update bridge_ops and sink detect logic
  drm/bridge: anx7625: change the gpiod_set_value API

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sa8775p-mdss.yaml        | 170 +++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 198 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 183 +++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  24 ++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
 11 files changed, 614 insertions(+), 12 deletions(-)

-- 
2.34.1


