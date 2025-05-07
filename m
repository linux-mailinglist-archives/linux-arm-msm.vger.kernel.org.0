Return-Path: <linux-arm-msm+bounces-57069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D5AAD674
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:52:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94B404E592C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B37C218EBE;
	Wed,  7 May 2025 06:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gQLkKhIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CF92116F4;
	Wed,  7 May 2025 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600696; cv=none; b=ghE2kGqLT8qqhCCL2B3fr9vUfodqzv8DxRDffGGcDDnRNpfPD/FqYA/Xms8G2PwJqis6Qe8xT5KazykftSRLn/B06I44ANwq+ZBlDVM9Xy0VXhGzXpWFSXBTFMQxU1Vel7ENv4JNKwnRwyfatjNFJtGxSc1hVa2c1jRKMBt7TCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600696; c=relaxed/simple;
	bh=ylNtMfjvu+q4orajowEjXHztUp21s4iaeJUauanM8oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pv02+ntVJjM6fYKUnGoYXMBdwduiFPJKfl2r1SYBZkJ/yoFaLwFlUWfBE76GaIiNm3pja+0wLUVxlhLAmAzKVRXmhR/pliViFtuL9dFtwogbIEbAaSAJlYD/HvcIHemL+X9n/S7uqBBAISmpmE9s+kELo2e3gZER1bfKGxUazok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gQLkKhIF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H4Fg021655;
	Wed, 7 May 2025 06:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l6vPSDr4+Mz2qLrL3AYZ67kUOJAkymZKwE8
	6Gy8EOoY=; b=gQLkKhIFrGNO0TM3M3nb5nKDVb85gdqYOly41p8jTpoo/QJxstS
	BjKg4Riwhwi1FWTS23w3+tjnBVLzjg+H/1oUcuqvJ2d/rbFyGL7MH3Ofhdcot5+Q
	939U8qDhClHLo+TdUe8f6AYxTAPNtUXaX1RZv6TJfMKQmjuVPkqmrirmRW7WyGTR
	Go+D7Gz+5jxKsEPKOUxBTKJO5Rkm/PGEWtBWtCR6BBTyXZq5y0WMfzbJKriX6R6B
	pQlSmzqZqTrcru6znSRs8PYoLtetu8MumnlEjUvPunqxLMXGiuquvq4Z8keHm/C+
	QjtIP6Qz5Ym6aiHDH8B0z2A8hzrGrWKHelQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtug44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pPn9009493;
	Wed, 7 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pOCb009459;
	Wed, 7 May 2025 06:51:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pOus009451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3089B5AE; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 0/8] qcom: Refactor sa8775p/qcs9100 based ride boards
Date: Wed,  7 May 2025 12:21:08 +0530
Message-ID: <20250507065116.353114-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
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
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=RWzv-jsSoAz4CCN1Pp0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: rr26_g_ZpBZTKxir5IxYisvRJXZH2fSg
X-Proofpoint-ORIG-GUID: rr26_g_ZpBZTKxir5IxYisvRJXZH2fSg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MSBTYWx0ZWRfXxUuEkuwBm5qR
 fI3q/Qtx/5kYesAVrsFjPZ5ddbZ7AM3gjLbfLtEoLhu5r+agtUqS8Fe8xYQE7GOHE3vkM1zxYqG
 ERHB8ZFOD/Mejq13r1jqmdRTwQ4/jfdk5Rqe1TxxDJN+LuWMXyRFlD8dSbx5wqE/hgTtCyvWBMI
 BWUBb+Z8Aiv5P5FzjXVBjSaEhELPHKix7/+mMvuG4RxqF7OSRibT8oGylSPa36Dl8T1GsiHSajX
 8umlL9ZncUrJsc5/evDXGuT67D3tCNZ0QvxCJakDzCLUnlJ1m2PaAypRxPJQFdkRizuEWYAhd1p
 J2M/z61W75DB+aiO5BGIRR7J7KWVtggnUmyAcCVorHO27vgVevnD4jHWYWwoskLxIyiz3fJQ18f
 leQESs7tqRV8IbPFx0Ay7rgY80Th3D6plxQH42QZv1uXAc8bccHKGZDiMfX/1XozCEJK+k/B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070061

This series redefine DT structure for sa8775p/qcs9100 based ride/ride-r3
boards by introducing SOM for sa8775p, qcs9100.
It also introduces ethernet dtsi with two variants of capabilities.
It also refactor all common parts of ride boards to ride-common dtsi.

Below are detailed explaination on each type of HW variants supported:

# Ride HW information
-----------------------------
Ride is a modular hardware system with several smaller daughter cards
connected to single backplane board and each daughter card is stacked on
top of each other. I will try to explain each daughter card with HW
components and how it is connected to construct the ride-hw.

Backplane board:
  - It contains an MCU (Aurix TC397), CAN/LIN transceiver,
    Audio/GNSS/IMU-I2C signals, Fan header
  - It holds & connects all the daughter cards.

SOC card:
  - It contains:
    - SOM:
      - One of QCS9100M/QAM8775p SOM.
      - Each SOM is composed of either qcs9100/sa8775p SOC,
        along with DDR & PMICs.
      - Each SOM can be mounted to same SOC-daughter card of ride-hw.
    - In addition to SOM, it also has
      - 4x UART, 2x USB 3.1 & 1x USB 2.0
      - Memory: 1x OSPI, 2x UFS-3.1
      - Debug: JTAG/QDSS header
      - PCIe0, PCIe1 & Display signals
      - Reset button
  - It is connected to backplain board via B2B connector.

Display card:
  - It contains:
    - 4 eDP ports & 2 DSI-DP bridge
    - I2C GPIO expander & I2C switch
  - It is connected to SOC-card via B2B connector.

Camera card:
  - It contains:
    - 4 Quad DE-serializer, each supporting 4 MIPI CSI inputs
    - Total upto 16 Cameras ports are supported.
  - It is connected to backplain board via B2B connector.

Ethernet card:
  - There are two variants of ethernet card each with different capabilities:
    - [Ethernet-v1] card contains:
      - 2x 1G RGMII phy, 2x 1G SGMII phy(enabled currently)
      - Total 4 phy supported, only 2 phy are enabled and it is used in ride.
    - [Ethernet-v2] card contains:
      - 2x 1G RGMII phy, 2x 2.5G HSGMII(enabled currently) & 10G PCIe
        based MAC+PHY controller
      - Total 5 phy supported, only 2 phy are enabled and it is used
        in ride-r3.
  - Either [Ethernet-v1] or [Ethernet-v2] is connected to backplain
    board via B2B connector.

PCIe card:
  - It contains:
    - PCIe connections to SOC-card
    - NVME, 2x WLBT module QCA6696/QCA6698 (Wi-Fi & bluetooth solution)
      & GNSS module
  - It is connected to backplain board via B2B connector & PCIe signals
    are connected to SOC card via flyover cables.

Sensor Card:
  - It contains 3-Axix compass & 6-Axis 3D IMU (accel/gyro) module which
    are communicating via I2C
  - It is connected to backplain board via B2B connector.

Front panel card:
  - It does not contain any active circuitry, only ports are available
    - Audio-in/out ports
    - USB hub ports
    - CAN/LIN ports
    - 12V power off switch
  - It is connected to backplain board via ribbon cable.


Considering outlined h/w description, following are ride configuration
variation each platform supporting:

Between qcs9100 & sa8775p ride/ride-r3 boards, SOM is changing; And between
ride & ride-r3 ethernet is changing.
Excluding these differences all other cards i.e SOC, display, camera,
PCIe, sensor, front & backplain are same and are refactored in ride-common.
If any variant of these cards comes up in future we need to refactor
ride-common accordingly.

Since we don't have a document yet which formally describes qcs9100 ride
board with [Ethernet-v1] card, I am removing the board and we can re-enable
after complete documentation is available.

Considering current outlines of all daughter cards, following defines
ride/ride-r3 variant boards:
  - sa8775p ride    : QAM8775p SOM + [Ethernet-v1] + other daughter cards
  - sa8775p ride-r3 : QAM8775p SOM + [Ethernet-v2] + other daughter cards
  - qcs9100 ride-r3 : QCS9100M SOM + [Ethernet-v2] + other daughter cards

Below is the pictorial diagram for updated DT structure depicting all our HW.
- SOM dtsi:
  - qam8775p-som.dtsi specifying sa8775p based SOM having SOC, PMICs,
    Memory-map.
  - qcs9100-som.dtsi specifying QCS9100M based SOM having SOC, PMICs, Memory-map
    updates.
- sa8775p-ride-common.dtsi specifying ride common daughter cards for all ride
  boards. This include SOC-card, display, camera, PCIe, sensor, front &
  backplain cards.
- Ethernet variants dtsi:
  - sa8775p-ride-ethernet-88ea1512.dtsi specifying ethernet card which
    uses 2x 1G - SGMII (Marvell 88EA1512-B2) phy in Main-domain
  - sa8775p-ride-ethernet-aqr115c.dtsi specifying ethernet card which
    uses 2x 2.5G - HSGMII (Marvell AQR115c) phy in Main-domain

+---------------------------------------------------------------------------------------------------+
|                                                                                                   |
|                        sa8775p.dtsi                                                               |
|                             |                                                                     |
|                 +-----------------------+                                                         |
|                 |                       |                                                         |
|                 v                       v                                                         |
|          qam8775p-som.dtsi        qcs9100-som.dtsi                                                |
|                 |                       |                                                         |
|                 v                       v                                                         |
|              (AUTO)                   (IOT)                                                       |
|                 |                       |                                                         |
|                 |                       |                                                         |
|                 |                       |                                                         |
|                 | +-----------------------+---------------< sa8775p-ride-ethernet-aqr115c.dtsi    |
|                 | |                     | |                                                       |
|                 | | +-----------------------+----------+--< sa8775p-ride-common.dtsi              |
|                 | | |                   | | |          |                                          |
|       +---------+ | |                   | | |          |                                          |
|       |         | | |                   | | |          |                                          |
|       |         v v v                   v v v          |                                          |
|       |   sa8775p-ride-r3.dts    qcs9100-ride-r3.dts   |                                          |
|       |                                                |                                          |
|       | +----------------------------------------------+                                          |
|       | |                                                                                         |
|       | | +------------------------------------------------< sa8775p-ride-ethernet-88ea1512.dtsi  |
|       | | |                                                                                       |
|       v v v                                                                                       |
| sa8775p-ride.dts                                                                                  |
|                                                                                                   |
+---------------------------------------------------------------------------------------------------+

This series provides code refactoring changes for sa8775p/qcs9100
ride/ride-r3 boards from previous discussion [1] excluding any new
features or boards.

No functional impact, and it is verified with comparing decompiled DTB
(dtx_diff and fdtdump+diff).
The only difference is that *-som compatibility has been added in all boards
and qcs9100-ride board is removed.

[1] https://lore.kernel.org/all/20241229152332.3068172-1-quic_wasimn@quicinc.com/

---

Wasim Nazir (8):
  dt-bindings: arm: qcom: Remove bindings for qcs9100 ride
  arm64: dts: qcom: qcs9100: Remove qcs9100 ride board
  arm64: dts: qcom: sa8775p: Add ethernet card for ride & ride-r3
  arm64: dts: qcom: sa8775p: Create ride common file
  dt-bindings: arm: qcom: Add bindings for qam8775p SOM
  arm64: dts: qcom: sa8775p: Introduce QAM8775p SOM
  dt-bindings: arm: qcom: Add bindings for QCS9100M SOM
  arm64: dts: qcom: qcs9100: Introduce QCS9100M SOM

 .../devicetree/bindings/arm/qcom.yaml         |   3 +-
 arch/arm64/boot/dts/qcom/Makefile             |   1 -
 arch/arm64/boot/dts/qcom/qam8775p-som.dtsi    |   9 +
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts  |  10 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts     |  11 -
 arch/arm64/boot/dts/qcom/qcs9100-som.dtsi     |   9 +
 ...75p-ride.dtsi => sa8775p-ride-common.dtsi} | 169 +--------------
 .../qcom/sa8775p-ride-ethernet-88ea1512.dtsi  | 205 ++++++++++++++++++
 .../qcom/sa8775p-ride-ethernet-aqr115c.dtsi   | 205 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  42 +---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  42 +---
 11 files changed, 450 insertions(+), 256 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/qam8775p-som.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9100-som.dtsi
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => sa8775p-ride-common.dtsi} (86%)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-aqr115c.dtsi


base-commit: 33035b665157558254b3c21c3f049fd728e72368
--
2.49.0


