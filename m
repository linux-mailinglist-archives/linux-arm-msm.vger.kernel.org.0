Return-Path: <linux-arm-msm+bounces-20913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E128D340D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80068287A7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA47817B432;
	Wed, 29 May 2024 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="no9fW1+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297A17A938;
	Wed, 29 May 2024 10:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977404; cv=none; b=Xq8/RzdaPI1+2rUmQxEBQ9ERUwngSr+cS5P+McaNNGMODAzI6EEdQVQgQFSAEArKDbMV8v+q2wVyPrQLjhBtPIuGAWcpmDTjBnpfMbEME5XW9Jb3WFua2z/ozGuTFKPXYRhBipRmz+JnDdPjJyCupjf2GeFGsIkDWDoued02Fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977404; c=relaxed/simple;
	bh=mVuh3sLFYf3dhW7ig6nZKv8dApva04G3jazKkVcIBEk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VUD/ggmEJSEZplZSO8Y80MaLR+R7VZAitOnqi4GjFi8wtsPgFk8LuXEg8k91sAwRUgtpUzyWfTpvp+1txKwo0bVN+cMXlMy9ZxLLxAxsLfHnB9jyajfP2rzoN8xoB3QSttnXQzH7aixmGYAT0nQd+nq3yBBeWkrGn0b/IYK7N7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=no9fW1+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9G7pM001837;
	Wed, 29 May 2024 10:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ne8OJRXeqST9D1XIPRLgh8
	btohCleqYNYsDL9SG1+v4=; b=no9fW1+09sPLW4TZMzOJcU4U1cBAeuENElNY2n
	qu0B0VZ2yY7tzDE3Vv8AnZP1PIP65WfFG79VeUSBS9L95cwUlYuqURJBjgUS7zA9
	X4BnlGu9nAPD4swlRBX+P0M7lkmb5p4SykOVrn0vIb9Zzsl5HRDPKeoQ0XdMtbmi
	LFTVpv3l9mIjBu9trbwY/rGdPeV5WrjPJQBIZQnJlkTcRa/iN2aU+SPGx7jPyTLY
	WT2uefAFgFpO/OSXkiSQZ3CFTE32fSBR3Hw2+JF5udW1+3KhiQcheM0lc0voN26u
	0fxPzerSwxEBOqY+V4xhHSMrWtXMb+P+eQoF224gLlGArz7w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0g8rr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:09:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TA9uoM017117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:09:56 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:09:50 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v9 0/4] arm64: qcom: add AIM300 AIoT board support
Date: Wed, 29 May 2024 18:09:22 +0800
Message-ID: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -bVheU9NI1kwPBHSaj2UHPWxohrLnG23
X-Proofpoint-ORIG-GUID: -bVheU9NI1kwPBHSaj2UHPWxohrLnG23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

Add AIM300 AIoT support along with usb, ufs, regulators, serial, PCIe,
and PMIC functions.
AIM300 Series is a highly optimized family of modules designed to
support AIoT applications. It integrates QCS8550 SoC, UFS and PMIC
chip etc.
Here is a diagram of AIM300 AIoT Carrie Board and SoM
 +--------------------------------------------------+
 |             AIM300 AIOT Carrier Board            |
 |                                                  |
 |           +-----------------+                    |
 |power----->| Fixed regulator |---------+          |
 |           +-----------------+         |          |
 |                                       |          |
 |                                       v VPH_PWR  |
 | +----------------------------------------------+ |
 | |                          AIM300 SOM |        | |
 | |                                     |VPH_PWR | |
 | |                                     v        | |
 | |   +-------+       +--------+     +------+    | |
 | |   | UFS   |       | QCS8550|     |PMIC  |    | |
 | |   +-------+       +--------+     +------+    | |
 | |                                              | |
 | +----------------------------------------------+ |
 |                                                  |
 |                    +----+          +------+      |
 |                    |USB |          | UART |      |
 |                    +----+          +------+      |
 +--------------------------------------------------+
The following functions have been verified:
  - uart
  - usb
  - ufs
  - PCIe
  - PMIC
  - display
  - adsp
  - cdsp
  - tlmm

Documentation for qcs8550[1] and sm8550[2]
[1] https://docs.qualcomm.com/bundle/publicresource/87-61717-1_REV_A_Qualcomm_QCS8550_QCM8550_Processors_Product_Brief.pdf
[2] https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/Snapdragon-8-Gen-2-Product-Brief.pdf

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---

This patch series depends on patch series:
"[PATCH v2 0/2] arm64: dts: qcom: sm8550: Update some"
https://lore.kernel.org/linux-arm-msm/20240529100256.3158447-1-quic_tengfan@quicinc.com

v8 -> v9:
  - Update the patch commit message and some code comments
v7 -> v8:
  - rebase patch series on top of:
    https://lore.kernel.org/linux-arm-msm/20240502-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v5-0-10c650cfeade@linaro.org/
  - add pinctrl configurations for pcie0 and pcie1 in AIM300 SOM dtsi
  - move some common usb node settings to SoC dtsi
  - verified with dtb check, and result is expected, because those
    warnings are not introduced by current patch series.
    arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning
    (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary
    #address-cells/#size-cells without "ranges" or child "reg" property
v6 -> v7:
  - correct typos in the commit message
  - move mdss_dsi0, mdss_dsi0_phy, pcie0_phy, pcie1_phy and usb_dp_qmpphy
    vdda supply to qcs8550-aim300.dtsi
  - move the perst and wake gpio settings of pcie0 and pcie1 to
    qcs8550-aim300.dtsi
  - move the clock frequency settings of pcie_1_phy_aux_clk, sleep_clk
    and xo_board to qcs8550-aim300.dtsi
  - verified with dtb check, and result is expected, because those
    warnings are not introduced by current patch series.
    arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning
    (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary
    #address-cells/#size-cells without "ranges" or child "reg" property
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb:
    phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
        from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
        from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#

v5 -> v6:
  - move qcs8550 board info bebind sm8550 boards info in qcom.yaml

v4 -> v5:
  - "2023-2024" instead of "2023~2024" for License
  - update patch commit message to previous comments and with an updated
    board diagram
  - use qcs8550.dtsi instead of qcm8550.dtsi
  - remove the reserved memory regions which will be handled by
    bootloader
  - remove pm8550_flash, pm8550_pwm nodes, Type-C USB/DP function node,
    remoteproc_mpss function node, audio sound DTS node, new patch will
    be updated after respective team's end to end full verification
  - address comments to vph_pwr, move vph_pwr node and related
    references to qcs8550-aim300-aiot.dts
  - use "regulator-vph-pwr" instead of "vph_pwr_regulator"
  - add pcie0I AND pcie1 support together
  - the following patches were applied, so remove these patches from new
    patch series:
      - https://lore.kernel.org/linux-arm-msm/20240119100621.11788-3-quic_tengfan@quicinc.com
      - https://lore.kernel.org/linux-arm-msm/20240119100621.11788-4-quic_tengfan@quicinc.com
  - verified with dtb check, and result is expected, because those
    warnings are not introduced by current patch series.
    DTC_CHK arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb
    arch/arm64/boot/dts/qcom/sm8550.dtsi:3015.27-3070.6: Warning
    (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary
    #address-cells/#size-cells without "ranges" or child "reg" property
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb:
    opp-table: opp-75000000:opp-hz:0: [75000000, 0, 0, 75000000, 0, 0, 0, 0] is too long
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb:
    opp-table: opp-150000000:opp-hz:0: [150000000, 0, 0, 150000000, 0, 0, 0, 0] is too long
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb:
    opp-table: opp-300000000:opp-hz:0: [300000000, 0, 0, 300000000, 0, 0, 0, 0] is too long
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
    arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dtb:
    opp-table: Unevaluated properties are not allowed ('opp-150000000', 'opp-300000000', 'opp-75000000' were unexpected)
        from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#

v3 -> v4:
  - use qcm8550.dtsi instead of qcs8550.dtsi, qcs8550 is a QCS version
    of qcm8550, another board with qcm8550 will be added later
  - add AIM300 AIoT board string in qcom.yaml file
  - add sm8550 and qcm8550 fallback compatible
  - add qcm8550 SoC id
  - add reserved memory map codes in qcm8550.dtsi
  - pm8010 and pmr73d are splited into carrier board DTS file. Because
    the regulators which in pm8550, pm8550ve and pm8550vs are present
    on the SoM. The regulators which in pm8010 and pmr73d are present
    on the carrier board.
  - stay VPH_PWR at qcs8550-aim300.dtsi file
      VPH_PWR is obtained by vonverting 12v voltage into 3.7 voltage
      with a 3.7v buck. VPH_PWR is power supply for regulators in AIM300
      SOM. VPH_PWR regulator is defined in AIM300 SOM dtsi file.

v2 -> v3:
  - introduce qcs8550.dtsi
  - separate fix dtc W=1 warning patch to another patch series

v1 -> v2:
  - merge the splited dts patches into one patch
  - update dts file name from qcom8550-aim300.dts to qcs8550-aim300 dts
  - drop PCIe1 dts node due to it is not enabled
  - update display node name for drop sde characters

previous discussion here:
[1] v8: https://lore.kernel.org/linux-arm-msm/20240513090735.1666142-1-quic_tengfan@quicinc.com
[2] v7: https://lore.kernel.org/linux-arm-msm/20240424024508.3857602-1-quic_tengfan@quicinc.com
[3] v6 RESEND: https://lore.kernel.org/linux-arm-msm/20240401093843.2591147-1-quic_tengfan@quicinc.com
[4] v6: https://lore.kernel.org/linux-arm-msm/20240308070432.28195-1-quic_tengfan@quicinc.com
[5] v5: https://lore.kernel.org/linux-arm-msm/20240301134113.14423-1-quic_tengfan@quicinc.com
[6] v4: https://lore.kernel.org/linux-arm-msm/20240119100621.11788-1-quic_tengfan@quicinc.com
[7] v3: https://lore.kernel.org/linux-arm-msm/20231219005007.11644-1-quic_tengfan@quicinc.com
[8] v2: https://lore.kernel.org/linux-arm-msm/20231207092801.7506-1-quic_tengfan@quicinc.com
[9] v1: https://lore.kernel.org/linux-arm-msm/20231117101817.4401-1-quic_tengfan@quicinc.com

Tengfei Fan (4):
  dt-bindings: arm: qcom: Document QCS8550 SoC and the AIM300 AIoT board
  arm64: dts: qcom: qcs8550: introduce qcs8550 dtsi
  arm64: dts: qcom: add base AIM300 dtsi
  arm64: dts: qcom: aim300: add AIM300 AIoT

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi  | 405 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550.dtsi         | 167 ++++++++
 5 files changed, 903 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550.dtsi


base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
-- 
2.25.1


