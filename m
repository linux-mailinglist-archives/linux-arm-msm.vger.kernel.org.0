Return-Path: <linux-arm-msm+bounces-87343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE5CF105E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 14:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 228993024D60
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CAB30E0ED;
	Sun,  4 Jan 2026 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M30HtGUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC61FE44A;
	Sun,  4 Jan 2026 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534316; cv=none; b=Sfwv4fczKVBd4jXgyHut33UdxbqOlYeXjdOmP/GNwsG3HTvu43h7J8s1ZUJOdpCxDPcudnoxKaGFo9zLEf44Y9iEiC4U8wSZzaC233NHMW2UOLyfyYtgO324RGu3P6QcCnQJQtp8yUOA9Vcd50lpikD/BrWeY/q7UanD0t6gtNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534316; c=relaxed/simple;
	bh=MysRRMWXINPs9gij6InHpxH35NrMeeaBpOg6rSaoG6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T4q/Ly3kwVgn1Ca+9P96+k74Vxs4LU2hyLj2XR7ADqdG+yt/+ee9dtYx+ceCW0xbMtVdMBLc2ORbr7h99V3hdL8Koduwe5OjEj4d4ilC90AjxYy5DkwC7JtibzFyCbCFDFiyC7lqhqdMbkvDQOUbkUajZy0CUUgTVSTbHULRKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M30HtGUF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6044sbrm1423404;
	Sun, 4 Jan 2026 13:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Kwa8bMibbOkc38n+/WUktOMZHjpkrztNyB
	NTyLhl3w=; b=M30HtGUFKGeWK+2cIo2/d9X6Bbvmk6LPEMQHjWyjJx+KBb6BQRX
	mfvvHRVfUCeeKPH8MlEPN0n4ZgLgBgBbodHV0KTH6jzUGnjJCDyzlGg0wJzcyio4
	Rj4ko2REYI9AIV7cJ5oH75il8eo3hC0BZWDZHV+D5lTMMY13UI8h7OnTaePQ6JN5
	2A/qGi0fm82v5bLbSYCmDvq/CAXD+he6CH/juvtnDr0xpiYIyiFtN4E2ZIHsHVIL
	/noJERXcBSOVUZCicTW3psPXyIMHCM6Rnl1gKCxlhesMmB8xkKTzakpu5yrr8TQf
	d5+J4X7odUEvnl09SxZ11LaliYUp6rwwFnA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertcjank-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 604Dila1017230;
	Sun, 4 Jan 2026 13:44:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4bev6kkx3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 604Dilkm017208;
	Sun, 4 Jan 2026 13:44:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 604Dilme017200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Jan 2026 13:44:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 8464A59C; Sun,  4 Jan 2026 19:14:46 +0530 (+0530)
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
Subject: [PATCH v5 0/5] Add DSI display support for QCS8300 target 
Date: Sun,  4 Jan 2026 19:14:37 +0530
Message-Id: <20260104134442.732876-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vU58X6oliAyZIPubuQCvG5gTcvGvl6Ru
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=695a6ed4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=RHkTxhJYF7RHL4dZ0YsA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vU58X6oliAyZIPubuQCvG5gTcvGvl6Ru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDEyNiBTYWx0ZWRfX9kHUnzebEf5V
 /pRnT1KWvpNq2WkCKH9aHOhqp/kmk32Fb1CF10vQj3UAg8wY8S8Amb4JDlcBsiDeu+tD08sf+dK
 r7vJBB5uveAggpDo5dBrGtsSwSZ2irX/OlUUHW9kvHIIZ4hfJMhSN+MqrPEO8fq2hoj175/Bv1k
 Qz3RG7XjE4EFzjAP1nEUOH5mHsgfwTCM4isxeRuWnNtKyQiPRdgwVR/garN9pGXfO1q8T2JN4Sn
 hUN9uTpx0Uk9T8iSQCEFLK9ZiIhYKzTsw9ZZbQaN+mez4JN8Umfwa0FXq+J+VXX1u1hz5tFiVNi
 zpBSURCmQaBcxzeI0fMs84I1kh//itTPY2HcCsYY7zICF61EWNhvUs1KeOevDIROwCvaDU+51Dj
 AEw+V5+uDQTANM9YleMav46O20k/wzthTsefA8+HnKGNWYi85R8M0noZ58A7Cx52D5zTpWV6QCp
 aTbX9erKZGniF6qZlNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601040126

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/all/20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com/
(Enable DPU and Display Port for Qualcomm QCS8300-ride platform)

Changes in v5: Addressed review comments from Krzysztof
   - Patch 1: Updated commit description. [Krzysztof]
   - Patch 2: Updated commit description.
   - Patch 3: Added reviewed by tag from Krzysztof. [Krzysztof]
   - Link to v4:
     https://lore.kernel.org/all/20251225152134.2577701-1-quic_amakhija@quicinc.com/
 
Changes in v4: Addressed review comments from konard and Krzysztof
   - Patch 1: Update commit description to clarify PHY compatible string
              details.[Krzysztof]
   - Patch 2: Update commit description to clarify CTRL compatible string
              details.
   - Patch 4: Added new lines at few places. [konard]
   - Patch 5: 
            - Moved regulator always-on and boot-on properties at the end of
              the node. [konard]
            - Added new lines at few places. [konard]
            - Made the tlmm gpios entries sorted based on gpio index
              number. [Konard]
            - Drop output-high property. [konard]
   - Link to v3 :
     https://lore.kernel.org/all/20251125013302.3835909-1-quic_amakhija@quicinc.com/

Changes in v3: Addressed review comments from konard and Dmitry
   - Patch 2: Remove qcom,qcs8300-dsi-ctrl from clk details. [Dmitry]
   - Remove PHY and CTRL driver support. The CTRL and PHY versions for
     Monaco are the same as LeMans, and Monaco will use the same CTRL
     and PHY based on the fallback compatible string [Dmitry/Konard]
   - Patch 5: Rename the regulator used and arrange the compatible, reg,
     address and size cell for i2cmux in proper order. [Dmitry]
   - Link to v2:
     https://lore.kernel.org/all/20251006013924.1114833-1-quic_amakhija@quicinc.com/

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
             compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and
     qcom,qcs8300-dsi-phy-5nm compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1:
     https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

Ayushi Makhija (5):
  dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
  dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on QCS8300
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 .../display/msm/dsi-controller-main.yaml      |   5 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |  30 +--
 .../display/msm/qcom,qcs8300-mdss.yaml        | 102 +++++++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 102 +++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 177 ++++++++++++++++++
 5 files changed, 402 insertions(+), 14 deletions(-)

base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8 ("next-20251219")
-- 
2.34.1


