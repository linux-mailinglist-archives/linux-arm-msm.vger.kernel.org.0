Return-Path: <linux-arm-msm+bounces-22405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1501E905000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30BA281AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37E716E876;
	Wed, 12 Jun 2024 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EvugnS9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE216D9D0;
	Wed, 12 Jun 2024 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186803; cv=none; b=RI8sGal26XzQUnEDoaPftpVEgv0Lfyy9Z4X5wI58q63PHpQF5M5s6EdwXPd3gOagE3vwyVZarq5Fz8qbhE1wQnbljE2aM4PJMcJEFLg27WSgAF9kmZjhC6U+04AL0CIX0iavanW+UxfOIFyfh9nM/2Da4FaT3Ysuv/LJw1blGuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186803; c=relaxed/simple;
	bh=IVKEwgNHIcsqKi3KaJI7BZKK53+kZnzMOSBZPucSbY8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jznB1gM6rN2hGRKGSYUv2qe7m4ZRm6n5JBtD5hUpUt25pCMRIte4AjUq/nLfjCXARQ32ypmjVbBA/3Lz0jB3oNHdft6tXuDkzulyqF551q60W4/zSNxILNXpuQVYwNj3QiHuWu9CuYQ1aY9rCPmwgXvj6q43y7WNLOx/iETgFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EvugnS9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C8mNew018016;
	Wed, 12 Jun 2024 10:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mgdW+0UCbIM/mwP/K73Pdv
	dIj9QE3kUeANIqtl06EOU=; b=EvugnS9ebwigKhx7n69+XitcVuP8U7H6BrgJpZ
	DtSb8KnjMnKHBSx7tkED3TWikaGtb4l82Qtdwi/eUXGqmOKqOymKJ32RlpyDOLAU
	l1vY5pvMEyXz7VCIekAFG7U/W9DrtCIzWbLCVkaWuD1VI3+naPNu3sCvspdtsV7x
	0WJ5dGqx4GQZHy05m5OKaU4BRfzOfilgA+YZlb9TKb77neiuHRyyk8T91UgBz8dG
	eriaSzB/IyCjPi327jmL+Y5wRkx9C9wCHFtLAMAaLEZkHwrpxxNXpOgGtQkx/fvd
	oB/1nunj1GQeFp7rHcjoT/UpkRljeMOhGNqa/xsi6HsmuUaw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjau4gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:06:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CA6a24013996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:06:36 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 03:06:31 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/8] Add support for SA8775P Multimedia clock
 controllers
Date: Wed, 12 Jun 2024 15:36:05 +0530
Message-ID: <20240612-lemans-v2-split-mm-series-12-6-v2-0-056e828b0001@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1zaWYC/42NQQ6CMBBFr2Jm7Rg6IUhdeQ/DoilTmYQWbLHRE
 O5uxQu4fP8n762QOAonuBxWiJwlyRQK0PEAdjDhzih9YaCK6qpRhCN7ExJmwjSPsqD3+FNgORu
 syVDL2lnjGIpkjuzktQduXeFB0jLF997L6rv+rc4KK1Tntibd61Y7vj6eYiXYk508dNu2fQCvi
 buQzgAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        <quic_imrashai@quicinc.com>, <quic_imrashai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pkfiWNrtj4hsYy7sfEux5eVoYheE5xCy
X-Proofpoint-ORIG-GUID: pkfiWNrtj4hsYy7sfEux5eVoYheE5xCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120073

Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
platform.

These multimedia clock controller and device tree patches are split
from the below series.
https://lore.kernel.org/all/20240531090249.10293-1-quic_tdas@quicinc.com/

Changes in this series compared to above series:
 [PATCH 1/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 3/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 5/8]: Updated bindings to reference qcom,gcc.yaml
 [PATCH 7/8]: Split updating sleep_clk frequency to separate patch
 [PATCH 8/8]: Newly added to update sleep_clk frequency to 32000

Taniya Das (8):
  dt-bindings: clock: qcom: Add SA8775P video clock controller
  clk: qcom: Add support for Video clock controller on SA8775P
  dt-bindings: clock: qcom: Add SA8775P camera clock controller
  clk: qcom: Add support for Camera Clock Controller on SA8775P
  dt-bindings: clock: qcom: Add SA8775P display clock controllers
  clk: qcom: Add support for Display clock Controllers on SA8775P
  arm64: dts: qcom: Add support for multimedia clock controllers
  arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P

 .../bindings/clock/qcom,sa8775p-camcc.yaml    |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml   |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml  |   62 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   59 +
 drivers/clk/qcom/Kconfig                      |   31 +
 drivers/clk/qcom/Makefile                     |    3 +
 drivers/clk/qcom/camcc-sa8775p.c              | 1849 +++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c            | 1481 +++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c            | 1481 +++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c            |  576 +++++
 .../dt-bindings/clock/qcom,sa8775p-camcc.h    |  107 +
 .../dt-bindings/clock/qcom,sa8775p-dispcc.h   |   87 +
 .../dt-bindings/clock/qcom,sa8775p-videocc.h  |   47 +
 14 files changed, 5925 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sa8775p.c
 create mode 100644 drivers/clk/qcom/dispcc0-sa8775p.c
 create mode 100644 drivers/clk/qcom/dispcc1-sa8775p.c
 create mode 100644 drivers/clk/qcom/videocc-sa8775p.c
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h

--
2.43.0

---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20240612-lemans-v2-split-mm-series-12-6-v1-0-178429d989fe@quicinc.com

---
Taniya Das (8):
      dt-bindings: clock: qcom: Add SA8775P video clock controller
      clk: qcom: Add support for Video clock controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P camera clock controller
      clk: qcom: Add support for Camera Clock Controller on SA8775P
      dt-bindings: clock: qcom: Add SA8775P display clock controllers
      clk: qcom: Add support for Display clock Controllers on SA8775P
      arm64: dts: qcom: Add support for multimedia clock controllers
      arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P

 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   59 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 1849 ++++++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  107 ++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 14 files changed, 5925 insertions(+), 1 deletion(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240612-lemans-v2-split-mm-series-12-6-42a28e9fcafe

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


