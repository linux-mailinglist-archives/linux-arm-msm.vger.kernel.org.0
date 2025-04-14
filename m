Return-Path: <linux-arm-msm+bounces-54177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929AA87AAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 10:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4B0D188F85B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 08:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A3525A631;
	Mon, 14 Apr 2025 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PunuDS0h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114711CD2C;
	Mon, 14 Apr 2025 08:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620196; cv=none; b=AzvwKuE2KBeBHWzjIyJheD275iLXKb/4d9LLO3h6C/lvVmlwgNBoNxGjFRkeOlWn4GLLQZxM1l5T64ezgExAVhv51lPJjSEFEf9bNWqK0TVY6LDv5t1EhIXS034DrJEhH4+h5psl4x17MDqCdKhrI7lfgUW6q3m4pqU8agsmHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620196; c=relaxed/simple;
	bh=KgICRCjVo1x4XDi50OpxJdWdDtQS5jLrteYalNjE5Ig=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aFzetGmG8M40O7/L/pBJBktRJp+Q9vhWrwCsyeh2Cy876kER5kAgNWS/lrEbC0xnSCdpBl3ZfIt12fjgAmOoejwO4XwMM/9sdrywpD8HJeZHkfNbFm9UjDt4904gJeBk24TrsA6SoyzvktwkO2W9rO4JGfwZaeVWlBvKYJE3P7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PunuDS0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DHa1xh001993;
	Mon, 14 Apr 2025 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WXq4f+qNSQa/AaUN4fDNIH
	XG0CZfYvmELgN3BHkzoyY=; b=PunuDS0hoya2+4Q01Mj1GC18AMnMm8sWCWavbR
	w4XO03Pe0Oil2isqMfRS2hyFwsmbWHkhfbz+6F6mBkqZ7FZQGjWrELf73v1axB8U
	7tEifr/DPNaIIAdxNNtJXu+9PTeoaupO7W3IsyOR0EltAJDrd/Z1HuOGOR5nQWnx
	7vGQ+qCkmXhMIM/4yWI7gvKhLgHEZHI6XVfrPxNNIkkxySd8Ij5ylv23ud9oMfZy
	xwx0PIrq95y6U5M8yvMWqcQiNykuitueVw1/M6GqqtE4hL4qCgNRhsY9UGeJiMWB
	mDTaBMYVmkrGpEZaNO7S41EWPjfcZF3JX2Ebc6zrajBo/2tQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj93v5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:43:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E8h3rg031892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:43:03 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Apr 2025 01:42:57 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v7 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Mon, 14 Apr 2025 14:12:11 +0530
Message-ID: <20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTK/GcC/x3NTQ6CQAxA4auQrm3C/CDiVYwLqUUbhxlsDTEh3
 N2Jy2/z3gbGKmxwbjZQXsWk5Ir+0AA9b/nBKPdq8K3v2ugivsmOrsN5xrVHSoVeSCV/tKTEaui
 HMZxCGOPgJqiRRXmS739wue77DyI1imdwAAAA
X-Change-ID: 20250414-qcs615-mm-v7-clock-controllers-29b3833b491f
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
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G2iDjs8pC2RDSxwd8K1LDDMl56oCMAiy
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fcca98 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=qvAcXBSyIl58lO48RIsA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G2iDjs8pC2RDSxwd8K1LDDMl56oCMAiy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140061

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v7:
- Update DT bindings for CAMCC, DISPCC, VIDEOCC, GPUCC to remove the
  common bindings and add reference to "qcom,gcc.yaml" [Krzysztof]
- Fix the following in the alpha pll code [Bjorn]
	- double space removal in clk_alpha_pll_slew_set_rate
	- fix the alpha_width from dynamic to 'ALPHA_REG_BITWIDTH'
	- cleanup the programming of lower/upper_32_bits of 'alpha'
	- update the comment for 'mb()'
- Link to v6: https://lore.kernel.org/all/20250313-qcs615-v5-mm-cc-v6-1-ebf4b9a5e916@quicinc.com/

Changes in v6:
- Remove wrongly RB-By tags which got introduced in v4 and was carried
  to v5 as well.
- Adding the reference where the tags were added and dropped.
  -[01/10] clk: qcom: clk-alpha-pll: Add support for dynamic update for slewing PLLs
    - RB-By from Imran (v2)
  -[02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera clock controller
    - RB-By from Krzysztof (v2), drop wrong RB-By from Dmitry (v5)
  -[03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock controller driver
    - R-By from Bryan (v2)
  -[04/10] dt-bindings: clock: Add Qualcomm QCS615 Display clock controller
    - Drop wrong RB-By from Dmitry (v5)
  -[05/10] clk: qcom: dispcc-qcs615: Add QCS615 display clock controller driver
    - R-By from Dmitry (v1)
  -[06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics clock controller
    - Drop wrong RB-By from Dmitry(v5)
  -[07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock controller driver
    - R-By from Dmitry (v1)
  -[08/10] dt-bindings: clock: Add Qualcomm QCS615 Video clock controller
    - Drop wrong RB-By from Dmitry(v5)
  -[09/10] clk: qcom: videocc-qcs615: Add QCS615 video clock controller driver
    - R-By from Dmitry and Bryan (v3)
  -[10/10] arm64: defconfig: Enable QCS615 clock controllers
    - Drop wrong RB-By from Dmitry (v5)
- Link to v5: https://lore.kernel.org/r/20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com

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

 .../bindings/clock/qcom,qcs615-camcc.yaml          |   51 +
 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   63 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   57 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   55 +
 arch/arm64/configs/defconfig                       |    4 +
 drivers/clk/qcom/Kconfig                           |   35 +
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
 17 files changed, 3905 insertions(+)
---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20250414-qcs615-mm-v7-clock-controllers-29b3833b491f

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


