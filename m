Return-Path: <linux-arm-msm+bounces-57948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA74AB752C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2822189FC7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7ACD2868A4;
	Wed, 14 May 2025 19:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kFjF35DB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73172253B2;
	Wed, 14 May 2025 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249762; cv=none; b=UlXyFGcS7x504jWaqZkQPvgveeVxtMmAuo1t9NgoTpt+C/xO4Rv/64qQuLEDQJSLo+qVhXtunA53HfpjVaxVP64gwKk10VmHEivGtRM8c2aPAQ5EKKZVsI6mjHggIlsdjfVYeldX3pTajZEvrJk5krmeo7tyjUfx/q5sqVC2JLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249762; c=relaxed/simple;
	bh=q4rqXy5/KrOuBC1nS1oKY6C9bF9+/QngTYnPFyUC8fA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=s20N407YTkVq/NR0DF3oLEw+XDx4MYmjyHAAjFtw+d+9hjTHMI2mzPWBGd9zY9qZ5CA4HMGPwRkj4cyjU0Ek9oS+Ro6BQ3r6z74fK5zQ6AAwTwV+31XNqoo8s+6azAAhO0SmnA251VY3Gsu+Cr5ER76DIU0qgqOYO6gNw1rtI/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kFjF35DB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIG95i003115;
	Wed, 14 May 2025 19:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=H1RcdrJRSveW5UpLQ4aTdz
	BAphT2wSVD3kYJpWlIguw=; b=kFjF35DB/RLLkpU6sto8ycScw08mAyVYG3kbKM
	3lka/TY41GL83lgwR7wUWpUraLvv/wJe8hVdnh6g4CJz8OfijXT76xHYAe3Z0jGG
	2/Y631S57TWQ1TIxjd378EZztw92x+kxrLeR05jOkFlYaRPPKfc9R/JAljF3hU8W
	1WSgjR5P2SeEg/nIrRSe6e4OAVeVjVJNj90XP/4g+pRvlw+ici6rj83m0aENAl4X
	5AvlvUJl0JGEn/g6SMeuu78GpWTiQ7foY/3gpo9xnfVr+TjiU0Q+nj/nUNUrJX1f
	lUuAI+cluFZTw9pW/jnVyBYYlL9ohms7gaynd7Z4gMpdySqg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrbrrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54EJ9ErM027543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 19:09:14 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 May
 2025 12:09:08 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: [PATCH v4 00/18] clk: qcom: Add support to attach multiple power
 domains in cc probe
Date: Thu, 15 May 2025 00:38:45 +0530
Message-ID: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7qJGgC/43Nu47CMBCF4VdBrhk0noCTUPEeqy3CeAIjhTjkY
 u0K5d0xNICQEOV/iu9czCC9ymC2i4vpJeqgoU2xXi4MH6v2IKA+tSGkDZItIKqXwAxd08Bpaka
 FzkMMo7YH8M6uPUtpUXKThK6XWv/u+s9v6qMOY+j/72fR3tbv3GgBgWtxVJRSUbnfnSdlbXnF4
 WRucqSHlqH7rFHSkD2is7RnlHcte9Io/6xlSSvKTV3V3pGj/FWb5/kK/LzZYmQBAAA=
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
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Q7T7Xefphc6D4MWxixeDZaC34sODXrzh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NCBTYWx0ZWRfX8CZvCG6pHC67
 NZtNelAx5Z9u3eidUJbymLcGZPDt0mnS3e0YpCsHOVjCAvig4DFV3hs82PGEf09VXl/a15PPVtK
 jGswSf87Sc+NZjbICS9v6FYe5LjdEH+sZwdVNcb/xa4DArKjheh49+pfILhsqW7Ns/NSFQFC39E
 O1mQ5MmxHDxUJTJZLTfb9XbmLMAJy9zbBmn1FuCWqQSuW+CB7USOyg3cue1ErUKyg0T323e5E8h
 Z6HJhhgjlJD4qAAfeBRIX8elLPMKxthQ7z+nWjRQrEz85jIrzmnhitlI5wt1RzpWDRF1G6Qj247
 xch1AmC1DLnafolNQmKsNIru+VbfsVFLJlrydF98hFCXHbdG0dJ6dLw3JOzh3A6vaE/DpIGwo8Q
 1bCuKRrGv1WwQgq/ptiYdAPI5VtsVhLuhBQ4jsAM9ohxA3Rj6Ps0B2CbFZCkC3/CbszMj2b9
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6824ea5c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=cuGmt96sUe1wT0cz9w0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Q7T7Xefphc6D4MWxixeDZaC34sODXrzh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140174

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
      dt-bindings: clock: qcom: Update sc8280xp camcc bindings
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
      dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
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
 drivers/clk/qcom/common.c                          | 76 +++++++++++++++---
 drivers/clk/qcom/common.h                          | 10 +++
 drivers/clk/qcom/videocc-sm8450.c                  | 58 ++++++--------
 drivers/clk/qcom/videocc-sm8550.c                  | 59 +++++++-------
 16 files changed, 409 insertions(+), 261 deletions(-)
---
base-commit: 138cfc44b3c4a5fb800388c6e27be169970fb9f7
change-id: 20250218-videocc-pll-multi-pd-voting-d614dce910e7

Best regards,
-- 
Jagadeesh Kona <quic_jkona@quicinc.com>


