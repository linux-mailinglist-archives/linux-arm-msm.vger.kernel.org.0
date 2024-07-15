Return-Path: <linux-arm-msm+bounces-26119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B8930F7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A51D1F219D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C9C174EDB;
	Mon, 15 Jul 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HSlpAX4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B115824B5B;
	Mon, 15 Jul 2024 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721031818; cv=none; b=W/fK5h68jRnDGQnL3wkQjr/49cPGOt5T8bDmvWrP5huLl/CCQ7svlGmhH6aWQAm6OCkuLOOLBHomGKmA0p9CcTtd57+Acgoj76d/IZqXB28lF4QT+sAk1oYM9gYcdP+GG/gK1PbNQ2y1JqIkXRY2bKr/Oeua9HALoqPQG3+WBMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721031818; c=relaxed/simple;
	bh=hlJ+5oqJCxwikNsWZHSJo1gIJmTcG8j5tNnNqq218EM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CIoAsknFu8njteQK0a+v4kT0K9pya0rd1eV3IzZzGTD4K8A2dNVhph6gV0R+gsjMoGW/Tk/xfrfXUj2ZQO7m18Y3y0v4HKRjzZEwtiTV2U5fWffkZFg5ilQUywQ78hrS71sa9TWhPLDC/XIaBez7JF0/bZlwjn9LsLHyTiaPhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HSlpAX4I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2dEAh001859;
	Mon, 15 Jul 2024 08:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pDiXEl9bmaoZqbeEvBwani
	dIAFfKFdjGFFzepEPHpHo=; b=HSlpAX4IzxHSCC4XvQnLBrP+qIT3wU77gzNcjj
	3wDD68Y6UkJJ40ZGI06FKPytp56FQJRU+t0Srt+GeKH6VvxkXQsQE3T6hO12Fl7u
	a0eECnFHezDYsOvTt1oAeexAw2BGtCABqdAQ1wTCBZyuykT0AZbZyZ+9lHUTD/gL
	dMv3YkEWw/R0W1wozsBuY5HmuwDdEQWEl/doD3JM16q5ad/jpOPR7cO2PY52nn0f
	3min8PU76HdpUggImpvTpgAJjRd779f3FcVa6a/qj2HKnGX32U5JtAZTaXdbbC75
	KizQHrj9pVnbcsRnacX6NNuImKHCpH7Jsypb1TxjWHvz8A9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bf9ebcxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46F8NVi0013003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:31 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 01:23:26 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 0/8] Add support for SA8775P Multimedia clock
 controllers
Date: Mon, 15 Jul 2024 13:53:15 +0530
Message-ID: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHPclGYC/x2MQQqAIBAAvxJ7bsEsWekr0UFqqz1ooSCB+Peky
 8AcZgokjsIJ5q5A5CxJ7tBk6DvYLhdORtmbg1Z6UjQYTM4SmQe9xzyiJkdOG7aN0Jon8iHv/1s
 gj7DW+gHbKnW6YwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aDqSBwBoOHYKcaZRFrBqgmBek5srBady
X-Proofpoint-GUID: aDqSBwBoOHYKcaZRFrBqgmBek5srBady
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407150065

Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
platform.

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
      arm64: dts: qcom: Add support for multimedia clock controllers
      arm64: dts: qcom: Update sleep_clk frequency to 32000 on SA8775P

 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   56 +
 drivers/clk/qcom/Kconfig                           |   31 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/camcc-sa8775p.c                   | 1849 ++++++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c                 | 1481 ++++++++++++++++
 drivers/clk/qcom/videocc-sa8775p.c                 |  576 ++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  107 ++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 +
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 14 files changed, 5922 insertions(+), 1 deletion(-)
---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240715-sa8775p-mm-v3-27a7a25e87a2

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


