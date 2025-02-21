Return-Path: <linux-arm-msm+bounces-48828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D781A3EFE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA5B71784E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047CC202C33;
	Fri, 21 Feb 2025 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GLdqKr/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D2B67E;
	Fri, 21 Feb 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129647; cv=none; b=oRW1y/PiNZ3rJfFt5piO0tgCCnQbKy7U5LVheX+9SDMusjVMyELEudHdLbGC92t2aD9m8nDN493+03DdqddLWG575Vpurugut0jYYkj6OIxGz2p+VRoFYdpDAqBNn2PXXQaPIBVYAmn9VBLsPS19q0lIj5L3MVTCz5oF4hE7/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129647; c=relaxed/simple;
	bh=zhzdKnB1NEIhksi1wIO5sOvVAsPeqqvhkcNG/t+NWpE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=by4DIwBRaQlxfgsudP06gn45ymyC3/Co1xBl0e7v4YDAHjOML000Ip/mR/dsVcIfJoNFK5aoSoO0CmEHTxUsd8oaH7GAcl0zJFvAvDvvYTNeabrQfSDi8xUDEUClay1ttI33FpuAbbgirsRq/GuusS0u8mbcpAwbHwzwAimGi6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GLdqKr/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6x42g002702;
	Fri, 21 Feb 2025 09:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nIrFihGCxximWuYDb1lhIE
	vQ6LYJWGGxztqcAsIqSc4=; b=GLdqKr/ghK3wG/mstC/Nsfc6jAm2k82Gpof4RG
	g98DVy/aLNm5zZE63AXyt3LFXbUZSkfGYNLFQpMSipBGXi3i9xOVTXnV/lIdHeiV
	eC3cKRyMbJvuvum5cXhGNkQ9rSrwmfEE0xYy274Ot9n6mPBmQER5yZAElUbwBzZ1
	3Z6wySMyREdArBN28tYsR2MzzmZ7+y3hIXuHY7+RVTOPNT2/vjGvB7+dvATq8t3D
	flQJH9CEoi8k76jaIus1yIFd6xTJsfy+rga9mJM/Qm61nkf5eABrm9pkB+DN1Xw6
	vUmTsRYqPnn1ehzW/6HRqKRvuiub+ZvM5kqtHfKtZGyw4jVQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2hdvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9KXPn030748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:33 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:20:28 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v5 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Fri, 21 Feb 2025 14:50:11 +0530
Message-ID: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAExFuGcC/x3MPQqAMAxA4atIZgO1GFGvIg41Rs3gXwtFkN7d4
 vgN770QxKsE6IsXvEQNeh4ZVBbAmztWQZ2zwRpLxtoKbw5NRRgJ9x2ZsZ262i3s2o4JcnV5WfT
 5j8OY0gf3dg0XYQAAAA==
X-Change-ID: 20250221-qcs615-v5-mm-cc-8b94afca89c5
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ogHBi25dwJnY2W1fFopbkQ1SBHXJLL-
X-Proofpoint-GUID: -ogHBi25dwJnY2W1fFopbkQ1SBHXJLL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210071

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v5:
- Update ARM64 || COMPILE_TEST in all Kconfig to resolve kismet warnings.
- Fix sparse errors in GPUCC.
- Link to v4: https://lore.kernel.org/r/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com

Changes in v4:
- Drop patch Update the support for alpha mode configuration as this
  patch was picked - https://lore.kernel.org/all/20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com/
- Update the bindings to include "qcom,gcc.yaml" [Dmitry]

Changes in v3:
- update PLL configs to use BIT and GENMASK for vco_val and vco_mask for all CCs [Bryan O'Donoghue]
- Link to v2: https://lore.kernel.org/r/20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com

Changes in v2:
- cleanups in clk_alpha_pll_slew_update and clk_alpha_pll_slew_enable functions [Christophe]
- update PLL configs for "vco_val = 0x0" shift(20)  [Bryan O'Donoghue]
- update PLL configs to use lower case for L value  [Dmitry]
- Link parents for IFE/IPE/BPS GDSCs as Titan Top GDSC [Bryan O'Donoghue, Dmitry]
- Remove DT_BI_TCXO_AO from camcc-qcs615           [Dmitry]
- Remove HW_CTRL_TRIGGER from camcc-qcs615         [Bryan O'Donoghue]
- Update platform name for default configuration   [Dmitry]
- Link to v1: https://lore.kernel.org/r/20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (10):
      clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
      dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
      clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
      clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
      clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
      dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
      clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
      arm64: defconfig: Enable QCS615 clock controllers

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   54 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   73 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   66 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   64 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/camcc-qcs615.c                    | 1591 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  170 +++
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-qcs615.c                   |  786 ++++++++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  525 +++++++
 drivers/clk/qcom/videocc-qcs615.c                  |  332 ++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 17 files changed, 3939 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250221-qcs615-v5-mm-cc-8b94afca89c5

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


