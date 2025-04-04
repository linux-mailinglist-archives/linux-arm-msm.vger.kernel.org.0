Return-Path: <linux-arm-msm+bounces-53224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4C7A7BBD2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 13:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5805C3A7565
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CEF1E51EC;
	Fri,  4 Apr 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DJRuhY5A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340AD51C5A;
	Fri,  4 Apr 2025 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767775; cv=none; b=SdfplQo693QtDwWcahg2wB8gHsiTIa0N87Ml/9GgSYjle0CoJ3/JnlfYQeYl4cy/30U8GX2frJfGArvIZb+5Tvr/GM96khOyUlYV/C6Qqgkz27crnOTXkYJ1bW4duWcEfRJDRcUhfv0y8tmrcjSxkfq1zPZ8rY1biTYx5SgJA3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767775; c=relaxed/simple;
	bh=8E65pfwqDLoAFjeqxMb/Wu1QFitlB0SNCIyH+fLpw3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pvHtCUldkSvXLTLCEDrVirHk1CeCqDhZmL/ZMNyQhC1B9VCMgiriYBomt+nsQyTusuXPEkUPDP1SUTIZ3EFn59iWQ7pi8+Q2W8TuRn2xES+5UKw/TvAZ6WkMrYd+TG76FxAdl10gQoNOKqURNAJcKm3x3+Y2L63jkNMcFb9oO1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DJRuhY5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534899RH006480;
	Fri, 4 Apr 2025 11:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ri9UqNiAHV/8oOvW2WwNOLjf1SeK01rF6vQ
	VFdvqCvA=; b=DJRuhY5AYwauIGUYXCDqrO4M67Mvg1gK6RwtPPQIE8YzDATX1y1
	Xir3wudfN6jJzcGG9cVOKdhkHMIMRuk4BEFwWkKekHS3KdtJsbkPiFFoyc3hx4yj
	fmWEs6TsWLL0FEKEnJ27sMKkYX8P8A2fYqmfMKMWZQ7DBEJz599Ih1SvI+Sh+Vzx
	BLpV9gXmfEdcXgEPolAdNHtphCcUWYbL5H7acny29jTIM+f1qLYVToGcmy+DJQqR
	8I6WtZi+s6dJQ8JkeUUXcKQavCceb1fR0TS7zZUZa/ZH+nA0FiC/z4VFMv74j8+l
	9M9dMj8efxP8BVhVLxtvffIVTdS1Zh/IVkw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45tbnkrh03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 534BtjGX016527;
	Fri, 4 Apr 2025 11:55:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45p9xmaej2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:45 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 534BtjUA016500;
	Fri, 4 Apr 2025 11:55:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 534BtiSi016494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:45 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 24F7B58A; Fri,  4 Apr 2025 17:25:44 +0530 (+0530)
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
Subject: [PATCH v3 00/10] Add DSI display support for SA8775P target
Date: Fri,  4 Apr 2025 17:25:29 +0530
Message-Id: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tSATyzKEJKVlxRgKYaSjoEoN551JYM0Z
X-Proofpoint-GUID: tSATyzKEJKVlxRgKYaSjoEoN551JYM0Z
X-Authority-Analysis: v=2.4 cv=X9xSKHTe c=1 sm=1 tr=0 ts=67efc8c6 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ujnruDPweMBSjgDv7-sA:9 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040082

This series enables the support for DSI to DP bridge ports
(labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.

SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/
(ARM / arm64: dts: qcom: Use the header with DSI phy clock IDs)

Changes in v3: Fixed review comments from Dmitry and Krzysztof
    - Added qcom,sa8775p-dsi-ctrl compatible based on the set of clocks
      which are associated with it in patch 2. [Krzysztof]
    - Drop the blank line and add contains instead of items in pattern
      properties of dsi ctrl and phy in patch 3. [Krzysztof]
    - Updated the node name from anx7625@58 to bridge@58 for anx7625
      dsi-dp bridge in patch 7. [Dmitry/Krzysztof]
    - Updated endpoint label name for input output ports of analogix bridge chip in patch 7. 
    - Check the DP or eDP confiuration based on the aux node in patch 9. [Dmitry]
    - Link to v2 : https://lore.kernel.org/all/20250311122445.3597100-1-quic_amakhija@quicinc.com/

Changes in v2: Fixed review comments from Rob, konard, Dmitry and Krzysztof
    - Added additionalProperities in dsi and phy patternProperties in patch 3. [Rob's bot]
    - Updated example in qcom,sa8775p-mdss.yaml of patch 3:
        - Added port1 and port2 inside mdss0 ports.
        - Renamed dsi ports from mdss_dsi0_in to mdss0_dsi0_in and mdss_dsi1_in to mdss0_dsi1_in.
    - Updated the init load value for vdds supply of DSI PHY from
      150000uA to 48000uA as per chipset power grid in patch 4. [Dmitry]
    - Updated the init load value for vdda supply for DSI ctrl
      from 30100uA to 8300uA as per chipset power grid in patch 5.[Dmitry]
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

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,sa8775p-mdss.yaml        | 183 ++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 208 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 186 +++++++++++++++-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  34 ++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
 11 files changed, 650 insertions(+), 13 deletions(-)

-- 
2.34.1


