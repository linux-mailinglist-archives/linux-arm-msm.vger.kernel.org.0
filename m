Return-Path: <linux-arm-msm+bounces-63339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6357CAF0ECC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:05:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C617B7A3760
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7791123E355;
	Wed,  2 Jul 2025 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EqWGslRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3123C4F8;
	Wed,  2 Jul 2025 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447111; cv=none; b=afIDt98CsbQOz6eBi3t0iQ1EfOuruBmNkOD+Htaf376lRL/xXiPBZWXdNjA7018+E0nWdXoHuGrsengW1miBM0JWBriYA3Mscmk8D2CeZHMBsYoE26s5/HsyBpfaDQXpANLD2Poq963Qu5sKKwdftfbY7gRi2Z5fl9FjskKWf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447111; c=relaxed/simple;
	bh=vNRQKApqJ/kf0tpK2TLkMDG+83vzB03kX/Ng4twSWIw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=C4tx2oBGbBIaZ+apaXqBmXsOCKV7qRN9i4tuEYkE7vMm+J4y2Z9X3fdNiG8ds/xs2H/lJALPvMSLn4NdxoHt4fhY11a5yxhg4xauHisufmMAiJhPdCW0x6YrdufjsxaGtSt1l3z4vhQfIbkTU/8uAANANFn402EI6unw6y1VR6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EqWGslRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625EQ8j019593;
	Wed, 2 Jul 2025 09:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXjxVJuLbR0bZarzteGS3X
	HFE+YJkwhZvlD7ytid9ug=; b=EqWGslRPAeSLGeCBvFfL0svK0kcbHZYARya7hV
	o8l+Xogv4D+KN87KFiyE/jzuXPMSq9BFlS56I86fGeeNFeSOSBflb7Gn0T51GC4o
	Knqe5ySXQoLOE1AWMQZyF2zovSmD+++IQdAMuIRb2rq8sU1BKMSnnlC+xlKpagok
	wyHkNJWn53Dwh2LA2zjIhlqcmHgxzzJcuoAXRO4jCDNjkzKWKRypov0CR5EsveMN
	zJnxg2hHWTi8K1jUvIx7buKcjPsSlUYF2mGkIkgKFSTRahzxopwnw2IbQEhl9PuR
	N4Wcl/Q1UPuypPQRyibXzh/Kwfs0Pj6S2jP7BygKoFijZZJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxm0m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:04:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56294wuT000577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:04:58 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:04:51 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v11 00/10] Add support for videocc, camcc, dispcc and gpucc
 on Qualcomm QCS615 platform
Date: Wed, 2 Jul 2025 14:34:20 +0530
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABX2ZGgC/42NQQ6CMBAAv0J6dk1bKKAn/2E4kGWRjdBKi0RD+
 ncLL/A4c5jZRCDPFMQ124SnlQM7m0CpUyZwaO2DgLskhJbayFIbmDGUysA0waok4OjwCejs4t0
 4kg/QopF51eWFUpVIlZennj/H4t4kHjgszn+PYyrs+v/4biUQFrU2pr/Irr7Nb0a2eEY3iSbG+
 ANRlpJc0wAAAA==
X-Change-ID: 20250625-qcs615-mm-v10-clock-controllers-ac5037d34117
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfX5gTmk8SIV1v+
 tc69bWV1/Zb2o5W/M0ix4VL6ic3Za3U2ef4aEFKLHw3eqPE3BH0gWhtwbalyIRe2uaiQMaPyEkz
 +3bMbwEdsJg52Pl2R8ykGYk7iVVvTUXd5KFJgYVlxg/Ed2zhS24iE8qi7eu7PcRHSB3b8UysL3M
 ZUpIzJnBXlIiyl7sT8BQoZsDszT5SUwlTSeSrIAbgDOQQvsfsrEMmz64C/Px8x3Mj1+FzQtw1Jb
 mF355XIoi7weG1qEkGs/To0CR2um+mwgk8XXYjaOrm7yHwECZG2axC/NkVw9OhHgUGTQvYDh+3K
 3ZHqRJmdonYJ2DRF7a77i44IEXb2Io59UCzuinLAYx1u9FhcN4dP08vA6GJcEgClGPtL3OQPLm8
 dI3YvMzM1BG99zPfw0D693hChHkF9maHfTXmlHUYyPNw19WQSfe8ewqLuhXj9Ba/1R4titBE
X-Proofpoint-GUID: X_anmW8x3g2stvS8yFCBKYZYGzLkT1mK
X-Proofpoint-ORIG-GUID: X_anmW8x3g2stvS8yFCBKYZYGzLkT1mK
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6864f63b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=ibGQlGnF6lNa58M2td8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020072

Add support for multimedia clock controllers on Qualcomm QCS615 platform.
Update the defconfig to enable these clock controllers.

Changes in v11:
- Add a new reusable helper function to extract PLL_L_VAL, PLL_ALPHA_VAL and
  PLL_USER_CTL / PLL_VCO_MASK [Dmitry]
- Add static to fix bot error in gpucc
- Link to v10: https://lore.kernel.org/r/20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com

Changes in v10:
 - Fix comments in the clk-alpha-pll to do the following [Konrad D]
	- use regmap_set_bits()
	- remove unnecessary barrier
	- reverse-Christmas-tree sorting
 - Align to recent qcom helpers for Camcc, dispcc, videocc, gpucc.
 - Add RB-by tags for CAMCC, DISPCC, GPUCC.
 - Link to v9: https://lore.kernel.org/all/20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com/

Changes in v9:
- Reuse the qcom,sm6350-camcc.yaml for QCS615 [Vladimir]
- Carrying the RB-tag from Krzysztof on the CAMCC DT bindings from  (v8).

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
 drivers/clk/qcom/camcc-qcs615.c                    | 1597 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |  192 ++-
 drivers/clk/qcom/clk-alpha-pll.h                   |    1 +
 drivers/clk/qcom/dispcc-qcs615.c                   |  792 ++++++++++
 drivers/clk/qcom/gpucc-qcs615.c                    |  531 +++++++
 drivers/clk/qcom/videocc-qcs615.c                  |  338 +++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      |  110 ++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     |   52 +
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      |   39 +
 include/dt-bindings/clock/qcom,qcs615-videocc.h    |   30 +
 17 files changed, 3866 insertions(+), 21 deletions(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250625-qcs615-mm-v10-clock-controllers-ac5037d34117

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


