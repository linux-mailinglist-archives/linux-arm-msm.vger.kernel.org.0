Return-Path: <linux-arm-msm+bounces-33919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D849991B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD73C1F267D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532731C9B93;
	Thu, 10 Oct 2024 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gcr3X+6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4F1CDFCB;
	Thu, 10 Oct 2024 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586743; cv=none; b=mJJIVsrVG+P/mlwLFt6FV5IurJNRcfzvW/V2wnnVEXUNcQUqo/kpQl+FlJGDotb8yxbTbq1JvkTgEOJYbD92Xnq/hHSWjjXq/kzFE9KPNGqf8fl/KdlQOwupptKbjG/r5tu/6nGdQ0IUJcehCyWPptNK4MiqWDyFgFpSgU17RME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586743; c=relaxed/simple;
	bh=EUpVs7K66Zr7JjXFtP5vwk0CEZGRLh4gbhryYwMvN+s=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ETMNHiQL0IS2gdJ4bmHbC+vy0JjX21NVBJ1xcG2UGn95wwh1Az9UC2lidrR7rKO4Vd3svlGH/lopPcWuOtBc4+SNmYZYCoImimRCNA1vdH5dMeIVu13hImw+XKwiNxxrwIpm7IwNZg60NhvjQiW2yxZ43IyoZus/e/FJNNTAEXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gcr3X+6P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACWS8b011352;
	Thu, 10 Oct 2024 18:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nd63vaGxJiqCYtQj0CNWoa
	q9wm+Z9QM/ORIEM2y0Pt0=; b=gcr3X+6PiXGpdS2imrs2NH6G7MJTvcBV1gYlNx
	DaGqxfqFWn+4dRF6H3wzKgq78nSf7XhTRw1Gq+fYixMJ4bEXvlpf95UUnUP4iU2P
	4ntek4b5/Ah5fjgPCtb66zAy/reWbU2nfM5qGVw2aS7n2E+zrrj6ouiWijqphhlX
	Yv08yiNqCY+Iu2yrKtafkpJ/ldC0zjQpKGbmcBxN8qFn+iLE0I8mHv3KBjQe2aOw
	+DbOXdvXQJzkQ9fgwdeoqLpVA90xpgUSmDLB0dOtTP5VNkEwaRJ7DxMouDY1pHDG
	SKOxLo1X97jaWoX9HvQBQv86fF9N4bBSm4S7DukrCtU7/tFg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthugfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:58:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIwtFY019181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:58:55 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:58:50 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v5 0/8] Add support for videocc, camcc, dispcc0 and dispcc1
 on Qualcomm SA8775P platform.
Date: Fri, 11 Oct 2024 00:28:30 +0530
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYjCGcC/y3NwQrCMBCE4Vcpe3YhjQkRX0U8hGZq99AYs20RS
 t/doB6/Ofyzk6IKlK7dThWbqDxzgz91NEwxP8CSmska63rTG9Z4CcEXnmfeHFcocuISl2GCsrP
 h7BNGb6OhligVo7y/+dv954rX2l6W/3gcHyMyPRmDAAAA
X-Change-ID: 20241010-sa8775p-mm-v4-resend-patches-42735def52a0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sqsOdff03max4xpZJeyJgbD4xjfq99kA
X-Proofpoint-GUID: sqsOdff03max4xpZJeyJgbD4xjfq99kA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100125

[v5]
  Rebased the device tree patch to add clock controller nodes.

[v4]
  Changes in [v4] compared to [v3]
  Videocc: Update the mvs0/mvs1 gdsc to use HW_CTRL_TRIGGER [Konrad and Qualcomm
  internal discussions]
  Camcc:   Add new clock to the clock tree.
  Change the patch order for 'Update sleep_clk frequency to 32000 on SA8775P' [Krzysztof]

Changes in [v3] compared to [v2]:
  Update the qcom_cc_really_probe() to use &pdev->dev, for the CAMCC, DISPCC & VIDEOCC drivers.

[v2]
https://lore.kernel.org/all/20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com/
Changes in [v2] compared to [v1]:
  [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
  [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
  [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000
  These multimedia clock controller and device tree patches are split from the below [v1] series.

[v1]
https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom: Add SA8775P video clock controller
      clk: qcom: Add support for Video clock controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P camera clock controller
      clk: qcom: Add support for Camera Clock Controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P display clock controllers
      clk: qcom: Add support for Display clock Controllers on SA8775P
      arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P
      arm64: dts: qcom: Add support for multimedia clock controllers

 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   57 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 1868 ++++++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  108 ++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 14 files changed, 5943 insertions(+), 1 deletion(-)
---
base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
change-id: 20241010-sa8775p-mm-v4-resend-patches-42735def52a0

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


