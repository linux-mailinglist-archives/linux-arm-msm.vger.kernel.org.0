Return-Path: <linux-arm-msm+bounces-59889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E951AC8FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98711188342C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 13:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6326EB79;
	Fri, 30 May 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eBT+XqcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749A3376F1;
	Fri, 30 May 2025 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748611270; cv=none; b=Z5+rqDweIfZI5knf/4EwIDHfcP2fYTjktwZDJL0DCoUz2mCWjOfNWzVB9dGyMFIAM9+b5hKVKca2VyUf5ymRxMjDk5AWt7NE7K/j26qmYQ9jNPRs+vr88+BTBEMH2Vbh56Ek+FpGxYqndjIRN7uHrAEnTtySIErr5CGN7v/Wk1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748611270; c=relaxed/simple;
	bh=PwXUXWT9DyeGI/kRb9Ez0UEJg7Zz3tLYEovJpqJVJTE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pADILID2Y0g93mwMoWd032nsLapMRhA964KtmsOniortjU8Fak7qptGa0g5bl6s48RVFBuodhfgQTtbYVyOA5ZxQ8r+pNz5clhtAKgN6u6oQYs+8MFJyS6zxUUv+dme+K5Xomz/2ewSQSMwLzRBwUCAZkiW4NhREcIqexHKk//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eBT+XqcO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAAF0Q013825;
	Fri, 30 May 2025 13:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l6myu8eCUg4zijyZo6hfCq
	Jjh+HSeDdZSggG+SVThYc=; b=eBT+XqcOfOWNSIgm013jFLFeiBH7ky+nm39ooo
	hjALN0jk3UuHbCgCkElV/Iohk9Cxf0osFybriipvFbhLQ7OQB69/O3xfg/O8voX3
	WY8kYw2Jp/TlCOwRrH6VmMDcpniu/l2uKIjwy+s3Y52IycnEN1+itc+neLc6RVRp
	oBY8Lvu079Ad4Us8S3CCz/VEIjXUiRkLyXQxcF/mdSEqiy4XA8hJjIsAFM803E6j
	7lsbQJcVk+5OZmdR84VU6KWzeF879yLv8QSDaMIA0dbZyeheR7d+pOdEjXkeDFtc
	whAdayvboTab+yk25ksXYM6RXNg0B/wqvojpZOneAXCp/sjw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm33r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54UDL1M7010765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 May 2025 13:21:01 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 May
 2025 06:20:55 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v5 00/18] clk: qcom: Add support to attach multiple power
 domains in cc probe
Date: Fri, 30 May 2025 18:50:45 +0530
Message-ID: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2wOWgC/43NQW6DMBCF4atEXtfVeMA2zqr3qLog4yEZiWAKx
 GoVcfc62aRVJNTl/xbfu6qZJ+FZ7XdXNXGWWdJQwr7sFJ3a4chaYmmFgBbQNDpL5ESkx77X50u
 /iB6jzmmR4aijM3UkDgbYqyKME3fyddffP0qfZF7S9H0/y+a2/s/NRoOmjh02gVsMh7fPi5AM9
 ErprG5yxodWgdvWsGhAEcAZPBDws1b90tBva1XRmmC7tosOHfpnrX5o1thtrS6a9YZchcFHMH+
 1dV1/AJ+oaMCyAQAA
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
	<dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OuF-czEiy0tJG3Wsyy0ToHPO59mn5GXg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDExNiBTYWx0ZWRfX/2ETrJTL+0UN
 i5s1GuOpnN8ZJn6XMafPay98hJVptek4lVMglv/dX8TaDrNj9WPFBLH4Nmo4naQLxuJLjVMDcsn
 /2fDjYlGjjWD8wVtzcYYh9uyvdbOqydP2F46voAP36EtRJ1Une9NttSKWWq+ZuJ8F6K1PQIEnEv
 SfyAkB8OwQfyhp2ZIdBefhMgbV3EVPNAvsYTJ3tQL5j4TYe0svacYU5iFh+LYUQX+eyifEPl6ZX
 nyktuVSDlZ4Gs9fiOQ1JwIyYZG8AQmG7GEwzCJo1QnOjWEjd66O246Qj1nxisO2qjgltw5gOP/F
 vNZRgJQe6Vxw7jG5rApzT5uONiaU/xZNgIrWfCA0cNoCeSvFomykSHsAffAmyRnYETXwG5f5OET
 4lM1SSPPlThyg0/4lK7dlVqu6CC7bnJnYHlE+xKEn+NgK0bXm9kmZcggSte5XIOq2ughP8qc
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839b0be cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=B-9y34bfxwdAmyIc5O0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OuF-czEiy0tJG3Wsyy0ToHPO59mn5GXg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300116

In recent QCOM chipsets, PLLs require more than one power domain to be
kept ON to configure the PLL. But the current code doesn't enable all
the required power domains while configuring the PLLs, this leads to
functional issues due to suboptimal settings of PLLs.

To address this, add support for handling runtime power management,
configuring plls and enabling critical clocks from qcom_cc_really_probe.
The clock controller can specify PLLs, critical clocks, and runtime PM
requirements using the descriptor data. The code in qcom_cc_really_probe()
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
Changes in v5:
- Reversed order of patches 2 & 3 to add MXC support in SM8450
  camcc bindings first and then moved SC8280XP camcc to SA8775P
  camcc to have single power domain support for it.
- Added return code for qcom_cc_clk_pll_configure() and
  returned -EINVAL in case if PLL config or registers is
  NULL in patch 6 [Bryan]
- Added separate CBCR's list for SM8650 videocc and
  updated clk_cbcrs list based on compatible in patch 8[Konrad]
- Added R-By tags received on v4
- Link to v4: https://lore.kernel.org/r/20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com

Changes in v4:
- Updated the SC8280XP camcc bindings patch to fix the
  required-opps warning reported by kernel bot
- Updated the description of power-domains, required-opps of SM8450 camcc
  bindings as per review comments on v3 [Bryan]
- Moved the PLL config checks to calling function code [Dmitry]
- Removed qcom_clk_reg_setting struct and regmap_update_bits() code.
  Added a .clk_regs_configure() callback that clock drivers can implement
  if they require to update some misc register settings [Dmitry] 
- Moved the PLLs and CBCRs data to a separate qcom_cc_driver_data
  struct to avoid bloating up the CC descriptor structure
- Updated the videocc and camcc driver patches to incorporate above
  qcom_cc_driver_data change
- Updated the commit text of DT patches [Bryan]
- Added the R-By, T-By tags received on v3
- Link to v3: https://lore.kernel.org/r/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com

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
      dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
      clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
      clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
      clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
      clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
      clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
      arm64: dts: qcom: sm8450: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8550: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8650: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8450: Additionally manage MXC power domain in camcc
      arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc

Taniya Das (1):
      clk: qcom: clk-alpha-pll: Add support for common PLL configuration function

Vladimir Zapolskiy (2):
      dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
      arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc

 .../bindings/clock/qcom,sa8775p-camcc.yaml         | 15 ++++
 .../bindings/clock/qcom,sm8450-camcc.yaml          | 20 +++--
 .../bindings/clock/qcom,sm8450-videocc.yaml        | 18 +++--
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 12 ++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  6 +-
 drivers/clk/qcom/camcc-sm8450.c                    | 89 +++++++++++-----------
 drivers/clk/qcom/camcc-sm8550.c                    | 85 +++++++++++----------
 drivers/clk/qcom/camcc-sm8650.c                    | 83 ++++++++++----------
 drivers/clk/qcom/camcc-x1e80100.c                  | 67 ++++++++--------
 drivers/clk/qcom/clk-alpha-pll.c                   | 57 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h                   |  3 +
 drivers/clk/qcom/common.c                          | 81 +++++++++++++++++---
 drivers/clk/qcom/common.h                          | 10 +++
 drivers/clk/qcom/videocc-sm8450.c                  | 58 ++++++--------
 drivers/clk/qcom/videocc-sm8550.c                  | 66 ++++++++--------
 16 files changed, 421 insertions(+), 261 deletions(-)
---
base-commit: 138cfc44b3c4a5fb800388c6e27be169970fb9f7
change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


