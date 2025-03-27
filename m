Return-Path: <linux-arm-msm+bounces-52597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81AA72CD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D62293A5FFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C3E20D4E1;
	Thu, 27 Mar 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BrtF0Ngx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FEB1FF7D1;
	Thu, 27 Mar 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069212; cv=none; b=Y6+8bXYaBowQfKvvEq8ZkkzK2rop1eeutXM4JJioVyZm+j1MLK+aztpTp0qAhzgZnmquvi5tDpfHwXk/08k08FTyend04NCept3n3e8Q9JUiaddkVSgRrwCIQamugdaEijxlAmpDR7lacyeRigHLZjxjt6BQGLQOVkYrwC7Kzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069212; c=relaxed/simple;
	bh=96Owb78E2thV3EIFE/KrSP3invlfWid/GqlZPJEoYaY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=XULR8DFhi3aKuwLn67MnGVaAUK32AIVXy6DOKMTE33KbI73WE7ZUD6jQwr72DCGyhng6gt2q3EUVphV8N98l6oATRW09oMp3XDljZVz5jVw7Yir1jbRMRtshQFq08a3RbNx/NfEhBFBuR39zOCY9xjlw2O0YjUA1t27fTbPEB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BrtF0Ngx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jV48011085;
	Thu, 27 Mar 2025 09:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g3S0SIvq+yC3F431lcipLT
	399sAgU5MgM45kpSQ/k7I=; b=BrtF0Ngxq9NQ+GMew7i/7azXbQ1TAJ3keGhe/X
	YAF5L+XUzlsG27qlmgkOiAs2T4PL59J1FqoisIVUf45/+6mmrXGcAhqs+26BteCa
	XXEBOb0D/D4DeKMKl9ScEOiOGBUKYmirM0Sl0v4OfqFpHb5YH1TZCSTczEXAQw0r
	BFk4KyqR9G9bvGs31x9J1xeZBVjVmvOuixKU1tL0tS2A9Dvewlg92uT6lx9IlK8m
	B/fsn0ZNN0ZqxV0scMz4Kfi4LsSIqmPrY7Py+GJXDtevS3rpiYjj4MT/pL10kyhK
	o5Qux2fU+ZbCptny4IJqklYAmDAD1gCsd4JKsme0D6cIoveA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqgp9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9rOja013232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:24 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:18 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v3 00/18] clk: qcom: Add support to attach multiple power
 domains in cc probe
Date: Thu, 27 Mar 2025 15:22:20 +0530
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQf5WcC/43Nuw6CQBCF4VchWztmdlEEK9/DWMDsAJMgi1w2G
 sK7u9AYG2P5n+I7sxq4Fx7UOZpVz14GcW2IeBcpqvO2YhAbWhk0RzQ6BS+WHRF0TQP3qRkFOgv
 ejdJWYBN9sMSZRj6pIHQ9l/Lc9OstdC3D6PrXdub1uv7neg0IVHJi0oxzkxWXxyQkLe3J3dUqe
 /PRYkx+ayZoSBYx0aYg5G9tWZY3EASiWxYBAAA=
X-Change-ID: 20250218-videocc-pll-multi-pd-voting-d614dce910e7
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EKFtdZ8DHgAmCVqubKwFqgZ0tq1Q6YW0
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e52015 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=Ow-QB-rqKcuzJRoLveoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EKFtdZ8DHgAmCVqubKwFqgZ0tq1Q6YW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

In recent QCOM chipsets, PLLs require more than one power domain to be
kept ON to configure the PLL. But the current code doesn't enable all
the required power domains while configuring the PLLs, this leads to
functional issues due to suboptimal settings of PLLs.

To address this, add support for handling runtime power management,
configuring plls and enabling critical clocks from qcom_cc_really_probe.
The clock controller can specify PLLs, critical clocks, and runtime PM
requirements in the descriptor data. The code in qcom_cc_really_probe()
ensures all necessary power domains are enabled before configuring PLLs
or critical clocks.

This series fixes the below warning reported in SM8550 venus testing due
to video_cc_pll0 not properly getting configured during videocc probe

[   46.535132] Lucid PLL latch failed. Output may be unstable!

The patch adding support to configure the PLLs from common code is
picked from below series and updated it.
https://lore.kernel.org/all/20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com/

This series is dependent on bindings patch in below Vladimir's series, hence
included the Vladimir's series patches also in this series and updated them.
https://lore.kernel.org/all/20250303225521.1780611-1-vladimir.zapolskiy@linaro.org/

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
Changes in v3:
 - Updated the videocc bindings patch to add required-opps for MXC power domain [Dmitry]
   and added Bryan & Rob R/A-By tags received for this patch on v1.
 - Included the Vladimir's bindings patch for SM8450 camcc bindings to
   add multiple PD support and updated them to fix the bot warnings.
 - Moved SC8280XP camcc bindings to SA8775P camcc since SC8280XP only
   require single MMCX power domain
 - Split runtime PM and PLL configuration to separate patches [Dmitry]
 - Removed direct regmap_update_bits to configure clock CBCR's and
   using clock helpers to configure the CBCR registers [Dmitry, Bryan]
 - Added new helpers to configure all PLLs & update misc clock
   register settings from common code [Dmitry, Bryan]
 - Updated the name of qcom_clk_cfg structure to qcom_clk_reg_setting [Konrad]
 - Updated the fields in structure from unsigned int to u32 and added
   val field to this structure [Konrad]
 - Added a new u32 array for cbcr branch clocks & num_clk_cbcrs fields
   to maintain the list of critical clock cbcrs in clock controller
   descriptor [Konrad]
 - Updated the plls field to alpha_plls in descriptor structure [Konrad]
 - Added WARN() in PLL configure function if PLL type passed is not
   supported. The suggestion is to use BUG(), but updated it to
   WARN() to avoid checkpatch warning. [Bjorn]
 - Moved the pll configure and helper macros to PLL code from common code [Bjorn]
 - Updated camcc drivers for SM8450, SM8550, SM8650 and X1E80100 targets
   with support to configure PLLs from common code and added MXC power
   domain in corresponding camcc DT nodes. [Bryan]
 - Added Dmitry and Bryan R-By tags received on videocc DT node changes in v1
 - Link to v2: https://lore.kernel.org/r/20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com

Changes in v2:
 - Added support to handle rpm, PLL configuration and enable critical
   clocks from qcom_cc_really_probe() in common code as per v1 commments
   from Bryan, Konrad and Dmitry
 - Added patches to configure PLLs from common code
 - Updated the SM8450, SM8550 videocc patches to use the newly
   added support to handle rpm, configure PLLs from common code
 - Split the DT change for each target separately as per
   Dmitry comments
 - Added R-By and A-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com

---
Jagadeesh Kona (15):
      dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
      dt-bindings: clock: qcom: Update sc8280xp camcc bindings
      clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
      clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
      clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
      clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8450
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8550
      arm64: dts: qcom: Add MXC power domain to videocc node on SM8650
      arm64: dts: qcom: Add MXC power domain to camcc node on SM8450
      arm64: dts: qcom: Add MXC power domain to camcc node on SM8650

Taniya Das (1):
      clk: qcom: clk-alpha-pll: Add support for common PLL configuration function

Vladimir Zapolskiy (2):
      dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
      arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc

 .../bindings/clock/qcom,sa8775p-camcc.yaml         |  2 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          | 20 +++--
 .../bindings/clock/qcom,sm8450-videocc.yaml        | 18 +++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 12 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +-
 drivers/clk/qcom/camcc-sm8450.c                    | 85 ++++++++++------------
 drivers/clk/qcom/camcc-sm8550.c                    | 81 ++++++++++-----------
 drivers/clk/qcom/camcc-sm8650.c                    | 79 ++++++++++----------
 drivers/clk/qcom/camcc-x1e80100.c                  | 63 +++++++---------
 drivers/clk/qcom/clk-alpha-pll.c                   | 63 ++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h                   |  3 +
 drivers/clk/qcom/common.c                          | 65 ++++++++++++++---
 drivers/clk/qcom/common.h                          | 20 +++++
 drivers/clk/qcom/videocc-sm8450.c                  | 54 ++++++--------
 drivers/clk/qcom/videocc-sm8550.c                  | 55 ++++++--------
 16 files changed, 377 insertions(+), 261 deletions(-)
---
base-commit: 138cfc44b3c4a5fb800388c6e27be169970fb9f7
change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


