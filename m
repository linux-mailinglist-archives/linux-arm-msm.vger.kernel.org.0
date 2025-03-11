Return-Path: <linux-arm-msm+bounces-50963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AFEA5C126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 13:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1576189B632
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACE5257AE4;
	Tue, 11 Mar 2025 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FLWnky1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362DA254851;
	Tue, 11 Mar 2025 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695917; cv=none; b=C07FnUn3u79c9BC+4zAhTxipqaAMOrEiBytuBD/acnBgOJjg2Xm1LCgACjbn7R6OdwvPbq6WVB8gSJ3xr318rlnpiaBQpAD/E13g1XvztoRZ2h9JTX6BXRlatl1BIAHBe/u7Geb52GkrjdIo0dVY67/uP+sjdREZl3s8sidmhNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695917; c=relaxed/simple;
	bh=tOC4a6rS4pO83Uat5baOuOYAKWb+IOE8TfO70UeozQs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pn3NcaXlXQJ1SAJY8cSHFxwr/RxAkbi9JyBbCjMk60/Yoig+Rl8wnsJzcho0P/mUCvrY0/XMuHVsRqqKux33hfULVZzcTCDDXtXmBEeozAy1Ku1jn/YV+C52EhCPR4eHEFNBRMOthgLC70nG8lHGMryhT4tBaQmWf+vk3Itw7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FLWnky1b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B7D9L5006478;
	Tue, 11 Mar 2025 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ib1CkaHHM9fW7bt/5BCVBpanhNZy7nbMQWz
	3XUMArjg=; b=FLWnky1bYPWud5xrJwdHe507s5JySZxI3kSvKiWpEU8wMWkbPLZ
	KvK/UxTmVTCY+Nd1AEVPeUtyJ3d4jw3SOCryrC3Gugv+BBMDRrhjYF9xEEDJx3r1
	wZ0+Boy2etf4hCU4Z2fUXVo3b4WC9BHMw2J2nSCYL7YGcbiKM9Syz6JjWyLFTIup
	eDQisLoi9Xwd1KepzgazKlMf/aRaPerMiSPGDf/JoNl5OghwILHyqB47xHghXeYE
	VwncExwiNwCeM5YFq5zFplX03GaalbjVIJCb57EuJxYlIAiDNRbKrujbxAGwy/+e
	F+P3A8gbtO4Z96WRsQtEsbAlc2SiQIL4dVQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f0q0ftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BCOnLi008102;
	Tue, 11 Mar 2025 12:24:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn373w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:49 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52BCOn0f008074;
	Tue, 11 Mar 2025 12:24:49 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52BCOmQI008066
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:49 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 1E70E58A; Tue, 11 Mar 2025 17:54:48 +0530 (+0530)
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
Subject: [PATCH v2 00/10] Add DSI display support for SA8775P target
Date: Tue, 11 Mar 2025 17:54:35 +0530
Message-Id: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-GUID: gFSbEyjamIQ1BBV0-m9Eaa4GTE2uKL87
X-Authority-Analysis: v=2.4 cv=KK2gDEFo c=1 sm=1 tr=0 ts=67d02b95 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=WrmDeuozqBCdE8BCuE0A:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: gFSbEyjamIQ1BBV0-m9Eaa4GTE2uKL87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110080

This series enables the support for DSI to DP bridge ports
(labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.

SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/
(ARM / arm64: dts: qcom: Use the header with DSI phy clock IDs)

Changes in v2: Fixed review comments from Rob, konard, Dmitry and  Krzysztof
    - Added additionalProperities in dsi and phy patternProperties in patch 3. [Rob's bot]
    - Updated example in qcom,sa8775p-mdss.yaml of patch 3:
        - Added port1 and port2 inside mdss0 ports.
        - Renamed dsi ports from mdss_dsi0_in to mdss0_dsi0_in and mdss_dsi1_in to mdss0_dsi1_in.
    - Updated the init load value for vdds supply of DSI PHY from
      150000uA to 48000uA as per chipset power grid in patch 4. [Dmitry]
    - Updated the init load value for vdda supply for DSI ctrl
      from 30100uA to 8300uA as per chipset power grid in patch 5. [Dmitry]
    - Rebase the series to use the header with DSI phy clock IDs to make code more
      readable in patch 6. [konard]
    - Added the interrupts-extended in patch 7. [konard]
    - Fixed the warning from DT checker against DT binding in patch 7. [Krzysztof]
    - Changed the connector node name from dsi0-connector to dp-dsi0-connector and dsi1-connector to dp-dsi1-connector
      respectively in patch 7. [Dmitry]
    - Added the vph_pwr for anx7625 vdda10, vdds18 and vdda33 supply to fix the warnings from DT checker in
      patch 7. [Rob's bot]
    - Addressed device tree comments in patch 7. [Konard]
    - Squash the DT patch 8 into DT patch 7. [Dmitry]
    - Added hpd_enable() and hpd_disable() bridge funcs in patch 9. [Dmitry]
    - Update hpd detection bridge op flags logic based on eDP connector in patch 10. [Dmitry]
    - Link to v1 : https://lore.kernel.org/linux-arm-msm/20250225121824.3869719-1-quic_amakhija@quicinc.com/

---

Ayushi Makhija (10):
  dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
  dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on SA8775P
  drm/msm/dsi: add DSI PHY configuration on SA8775P
  drm/msm/dsi: add DSI support for SA8775P
  arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
  arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
  drm/bridge: anx7625: enable HPD interrupts
  drm/bridge: anx7625: update bridge_ops and sink detect logic
  drm/bridge: anx7625: change the gpiod_set_value API

 .../display/msm/dsi-controller-main.yaml      |   1 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sa8775p-mdss.yaml        | 188 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 208 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 186 +++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  36 ++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
 11 files changed, 657 insertions(+), 12 deletions(-)

-- 
2.34.1


