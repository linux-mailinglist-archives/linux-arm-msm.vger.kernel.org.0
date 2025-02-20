Return-Path: <linux-arm-msm+bounces-48592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7BA3D063
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B67317B630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5353E1DFD95;
	Thu, 20 Feb 2025 04:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VVd5OHgA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAAA1DA4E;
	Thu, 20 Feb 2025 04:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025396; cv=none; b=MoW5Wxbfg1XUliiyk8TXehsYoNCko2MLkgNBTYO7IxoGU59soLEsBAMGFNcMaW+jHDiWeYIsjK+D71v2QtU9PqhwZrmAhp/GsgD8p8oWNRPVN8cA9/tyTSjY192zQuglZzy/K1UcVEN1QRlPvM34veqEBTo/cK/dUMudAwCGbZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025396; c=relaxed/simple;
	bh=6vcS3VoH1xNHZUEUtzrCJWBN4fy1TabXnHcYOpnAfMk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jvLayXr0WSnkz8foFpYRfbWs2yWupPLOka3Zj9mQveScVt3HhgJFH5VhR/vSVOrOD7PWHqgJM5Zcft27NeOvke202GAVo7sTMqm7IojTOpP+hZ4Tsj5m9dtfHtJZXjWa5fBODhrpZJ05CGgTX1My4hQgdIoZMLyJu2TKgIri0Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VVd5OHgA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGVuEM012089;
	Thu, 20 Feb 2025 04:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e5Pr2H9Pf+t0Rh8BQURr7Q
	Y6tUrNvn1rGZodMMnsojk=; b=VVd5OHgAbLsL+cc/TkHyglnlghkmjhah29UsFr
	aPNBXEzReM2Ew3t1LqoY4k/LyLXh4TMYdupMwy1WCwoctxGISuIytcYHAj+2DUhu
	W9kyZUHl/hLlCvCwpR0VHMLaLJYKQgDtyz4Ehx1E2O36U6l2eas2BJtwAFo0eCe2
	DSArC3bmKTNk5T6KPCVlCJqJcRlLBr4Kdw6lCmPXsTkXKsgONaTQLpPPzgjHD/3v
	ySnnoyC0n4ntXWByWXkpp68dshQmDhg3r3FeSh08fwQRUwcqBW7BVmkHbEdZGwyO
	BU2SA0G35UnhCJfNVnLYwgFU4h7IvrrnDme+swWcy/QOB2Vg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1mukk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K4NAdC022251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:10 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 20:23:05 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v4 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Thu, 20 Feb 2025 09:52:49 +0530
Message-ID: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmutmcC/22NQQ6CMBBFr0Jmbc3QQoOuvIchBOogkwiFDhIN4
 e5W4tLle8l/fwWhwCRwTlYItLCwHyJkhwRcVw93UnyLDBp1jhqteoy1SDW53mYnrAIJzaI0Zm1
 hrdZ17iBOx0Atv/bstYzcscw+vPeXxXztL5jq/8HFKFTYpK5tTN6Ygi7Tkx0P7uh8D+W2bR997
 rT8ugAAAA==
X-Change-ID: 20250206-lpass_qcm6490_resets-204f86622a5c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G6i_pcUJEGj5cGlFki4POEMdkfrJuNsI
X-Proofpoint-ORIG-GUID: G6i_pcUJEGj5cGlFki4POEMdkfrJuNsI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200027

This series updates the low pass audio clock controller driver for reset
functionality. The patches are split from the below series.
https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

The QCM6490 board requires only the reset functionality from the LPASS
subsystem. Thus separate out the driver probe to provide the same on the
QCM6490 boards.

[v4]:
Changes in [v4] compared to [v3]:
- Update the documentation bindings to keep the clocks, powerdomain
  constraints. [Krzysztof]
- Update the driver to use 'of_device_is_compatible()' instead of
  'desc->num_resets' check. [Dmitry]
- Link to v3: https://lore.kernel.org/r/20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com

[v3]:
Changes in [v3] compared to [v2]:
- update to Documentation bindings adding constraints. [Krzysztof]
- split the DT patch for "Update protected clocks list" for QCM6490 IDP
https://lore.kernel.org/linux-devicetree/20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com/

[v2]:
Changes in [v2] compared to [v1]:
 - Updated the lpass_audio_cc_sc7280 probe to get the match_data for both SC7280 and QCM6490.
 - Separate regmap for resets [Konrad]
 - Split the lpassaudiocc compatible and GCC protected clocks list changes. [Dmitry]
 - Link to V1: https://lore.kernel.org/all/20240531102252.26061-1-quic_tdas@quicinc.com/T/

[v1]
  - Add a separate platform driver for QCM6490 resets.
  - Add device tree changes for protected clocks for GCC and LPASS AudioCC
    compatible update.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://lore.kernel.org/r/20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com

---
Taniya Das (4):
      dt-bindings: clock: qcom: Add compatible for QCM6490 boards
      clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    |  5 ++++-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  5 +++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  5 +++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c             | 23 ++++++++++++++++++----
 4 files changed, 33 insertions(+), 5 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-lpass_qcm6490_resets-204f86622a5c

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


