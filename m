Return-Path: <linux-arm-msm+bounces-76001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A580BBBCF62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 03:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598241893492
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 01:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5E01E5B7C;
	Mon,  6 Oct 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EU00O/sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D8E1A5B8B;
	Mon,  6 Oct 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759714789; cv=none; b=BsXycdkxFJbqGztmqy3/OEuDGUFPonCGzFN2/pzrc0b2BJsgwwin+YFxrzketWIRPrp13EEMWz0M5tgcwzAVV35rMGF0eHhGl/tPfZLqmKKBI9UFbqvHYVoSgp1HC7VMK9YqxnohMHtf+g/bC/ya46oTJq7+EJchZW3UOOuMVmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759714789; c=relaxed/simple;
	bh=I8LHzaCyuwEi5aXfc5t4dSaECGFzFNj8DzHEMCH/3XE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnKradNPDo8c/Vn33eQkKK9OT2bQifLs7Er+5snUYoVuIgnRwY2hTFB/2UDyM/j6cuy2qtQzhYTtx7lymMuTTxQW0pv/46Zf7BvOFgqiUa3EwNrTC4EGOHMmZIhEDUC09rwpwZiDGU2z4nGsIDeuCCmk8dwUQsetS55tfOHTEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EU00O/sc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961TISJ029512;
	Mon, 6 Oct 2025 01:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZQ20TrJx56MIAQbbFiFHQsUiddpASWVSqFE
	H9Dr3/j0=; b=EU00O/scrDTLsslpUWcah9bDgUZWY/+4SDcqUaROCYT88LQVRAm
	fiwuWB6EL9QB1pc7da8K+w/B2a6gbwRxpE0msRfGRLtVLIQJdHiLHUHHjM8nE0vn
	N+3flG30uZPvZ9+Jwngo7zfUVX14yOuFh7bxxhksWlcJhc28VVVGzT7s+D2L5Vnr
	DU1wzEnUWuZ0jQ/WAYq2wNgw8GbxYlmmU2ciDJ6u4o9NGZsSzrhMYQT4D2mk/tl6
	M6FP7wGnTT8Ck2LXdhQTDEIcHRjr2u9dNQ4fTkdO7zQ9XRSOuXquyg5JRoMF+HTg
	ZpUMko/RHuCCjwlksjndJX5ef++eseA1fqg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgjtcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRbk003771;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRbP003739;
	Mon, 6 Oct 2025 01:39:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dQUV003733
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 41B2F589; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v2 0/7] Add DSI display support for QCS8300 target
Date: Mon,  6 Oct 2025 07:09:17 +0530
Message-Id: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfXx6pc1BUoXCIJ
 deEgZLGI5WVS1nKBnI3/l6CLcBJ9yrydRl+IYaNYLssmEDYAW3im3aVdjZsBW1V7vtJP7J680RB
 +KDr2bWwSGnyKwDucVte7wQBPFsocgb3WT0Kr2bUGT2d2s15kLPbCvSup9KSAyRZnd91krtMEkF
 DHYVd8QuiMvQYXA6Fx3ZpQYo2Xi3i13S2yu4nykCuBKyPkCVubGCs+M/zmRYG3uaxDQCj/awlKs
 VitNjXs7mqUzWgvoz0cDdXEL2cNjX6UM7iREZZ8fakyBgvM8UyR4uaTbgTwSbMBR9Ugdxgw3RAF
 RmzFvhjeb3/HAdaoNRZHt4L2rM7xE3Pl1vFsrHk7z9zle2gliEIOiP9EbcVgMULXjsnhcfNpEGA
 xCBrDVFIbhWrJM7A1wkNBugD+YkdgQ==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e31dd3 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=RBJW5-z34AXF7GF-XkcA:9 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: 4VfwXkwE01znua1HYR4rDahDG3fkCA9j
X-Proofpoint-ORIG-GUID: 4VfwXkwE01znua1HYR4rDahDG3fkCA9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/all/20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com/
(Display enablement changes for Qualcomm QCS8300 platform)
https://lore.kernel.org/all/20250917-dts_qcs8300-v6-0-5c862aa80f64@oss.qualcomm.com/
(Enable DPU and Display Port for Qualcomm QCS8300-ride platform)

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
              compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1: https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

Ayushi Makhija (7):
  dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
  dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on QCS8300
  drm/msm/dsi: add DSI PHY configuration on QCS8300
  drm/msm/dsi: add DSI support for QCS8300
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 .../display/msm/dsi-controller-main.yaml      |   6 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |  30 ++--
 .../display/msm/qcom,qcs8300-mdss.yaml        | 102 ++++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 170 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         |  98 +++++++++-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +++
 9 files changed, 431 insertions(+), 14 deletions(-)

base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a ("next-20250929")
-- 
2.34.1


