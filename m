Return-Path: <linux-arm-msm+bounces-61095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E92AD6CB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D7A17F32D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868B222DF96;
	Thu, 12 Jun 2025 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="o1r8QQSH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B922DA02;
	Thu, 12 Jun 2025 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722198; cv=none; b=pQrlsMS5lNR78Z1ARrbR4lrCOgU8ubgR8QtOENvCb8sMe0A3HGvyCFQVVyXanSTFZ8CmlvQe8sdWHs/+I0vCAsQjgviQuJN69mtjrlmVkDzK5IBcSEylkzU5GgviN61UAORjMcs/Y+B6HdVMuXptvGEH4SCwFg+f8mMHyPkNKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722198; c=relaxed/simple;
	bh=ohiZKLTsCmAX7wUdm2S2t15r7UHYouJjtV3g6qA78Os=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HXPv8S41oNJtkEvqSML8JCaMxvtBq0UdRO2jAH5Tf2O9uMx6dpZ4oAVapGo9jIirE1R6JDXiv8lUT0e12wZ79D7zN4bSvGOyxPxbXwU9cgdl9UKX6LS1y60S3Dala9/L9ziIsnBmlIxX4ANBaaCyT+LNVldQ/eo+6AzlYUaZppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=o1r8QQSH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7wA2j029379;
	Thu, 12 Jun 2025 09:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5l9bQ53EhKSgGSqxRgWh/x
	Pf61f7VELmbS19DohTVME=; b=o1r8QQSHEcrlZmcyPrTvNx37MOKTkfkLxXOGX9
	BlliGeOMhy0MQkAu/RmgH7L1Al/Hu+i4CmWnouieh/3lrL3FakdKH3VnWPmJKgRD
	SaNTq5uOncut2syCrFP/HuWqFMHyoIc1KY8QOIiXm2TK7F042at1j5/9q87YV9+b
	61tgIQEhT2HZKhFAxJiTujDtOye6FweNR3IZoAvSRAd1jSJZz7MZJNOeCiYgreqr
	Sy75TuCwd+QfAqaR/Fr6+y1i65KYdYc9ggxJj3aDx/vXLrXR7HZ4TNw4D5yz8GU/
	YpWs5f4f0wwg26JFQzHN4wCnXVFHdmt39/q1KH6rLGX+/hVg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6g2b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:56:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9uN8J019125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:56:23 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:56:16 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v9 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Thu, 12 Jun 2025 15:25:04 +0530
Message-ID: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPmjSmgC/x3NwQqDMAyA4VeRnBdoCzrqq8gONYtbWG23RGQgv
 vvKjt/l/w8wVmGDsTtAeReTWhripQN6pvJglHszBBd6N3iPH7LB97iuuEekXOmFVMumNWdWw0R
 zTOwWvgYHLfJWXuT7H0y38/wBHzclE3AAAAA=
X-Change-ID: 20250611-qcs615-mm-v9-clock-controllers-acb9ae0fe720
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon
	<will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
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
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX8TkfcmSiU+YX
 DAK3Fni68hRSEVCg4TPlrIpPIfYK8FRd8KEHNzEfDZjnxBmRWyjmeuvzuA/wOLhmC6g6OqC6hgg
 UJkucM7YzEAlEiPhLZOhY38ZqXUW44J8CFITceBpW25k22i1Zm4w3HjW6Jbz42kbDt2Tjb73yGx
 mGUQxo101haP6Snf6ElsFDsTACzf8wh7ZXUsh/yyeiFgkN2LkjZJalikeWTc9r6eJs3Goi5hELg
 /RuuMQBE9EaKf1hZtBx88KId+0r1FUmo51Gu3W6GV+KlPj5i5ok2NKX3D605KDMcBocXGd8DuJX
 2WsQTfwSWuhuOUrJNwycTYB+2cdfA5JaSoalDUoWP15eF4j0zP1qbn8SxCpGC7QTcjNpFlpX+IN
 SMI3ututbuVPRrcEyQ+1CVUW5UM48agcwT22AivpHwaSp++GZ26UgD8VLBvpVFCb+q8LFO+d
X-Proofpoint-GUID: uFFuPtTjrIr-pKimpVzCa-BywVv_ZZn4
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684aa447 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=ibGQlGnF6lNa58M2td8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uFFuPtTjrIr-pKimpVzCa-BywVv_ZZn4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120076

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Global clock controller support
https://lore.kernel.org/all/20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com/

Changes in v9:
- Reuse the qcom,sm6350-camcc.yaml for QCS615 [Vladimir]
	- Still carrying the RB-tag from Krzysztof on the CAMCC DT bindings from (v8)
- Added all the RB-tags received in (v8).

Changes in v8:
- Drop the properties which are already covered as part of gcc.yaml [Krzysztof]
- Drop the RB tag for dt-bindings for Camera clock controller.
- Link to v7: https://lore.kernel.org/r/20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com

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

 .../bindings/clock/qcom,qcs615-dispcc.yaml         |   55 +
 .../bindings/clock/qcom,qcs615-gpucc.yaml          |   49 +
 .../bindings/clock/qcom,qcs615-videocc.yaml        |   47 +
 .../bindings/clock/qcom,sm6350-camcc.yaml          |   11 +-
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
 17 files changed, 3838 insertions(+), 3 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250611-qcs615-mm-v9-clock-controllers-acb9ae0fe720

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


