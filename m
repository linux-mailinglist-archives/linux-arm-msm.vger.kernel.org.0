Return-Path: <linux-arm-msm+bounces-28738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58039541BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C95287EC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5914578B4C;
	Fri, 16 Aug 2024 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SQK6dyLc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE28464D;
	Fri, 16 Aug 2024 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723790009; cv=none; b=CPDmzOrRobrsxgqAAs3+dnbpH/VaQ8PH+j1mZ8j765GqcmLTVdxcCTznfu2t1NeBLvWA//uNk19XmQT1Y7lcgjDI2+zLgNFsOTLM6EiiC6DsL8umW6L0F/ILdG7u1MZA7L2qdC6UJJnuqZXiu5xFSupSzSMvhpcDF133W9x8u0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723790009; c=relaxed/simple;
	bh=InQ7KO4PcxameFWzTEVRVp6UxYDiKATaWj88aDibv/U=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=q7q5O0kGga3mbtl9bcmFmeAmK8CmSAdU2s/fu/BFffEt70Tp66slQKyEHS94c1spUdyhvrdmCftuU0IL/q45kQtuSJR8PguVtM7+WKGWYZ2/zWUjBvJ+Rz1fUYbR/1nzg16TlBzb3uIGwAa2QvTdOsglE0ngZvEnCTljOHnqaL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SQK6dyLc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G6P363028854;
	Fri, 16 Aug 2024 06:33:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rep/IfrloD1cfaSNPsBzjP
	tySR9esiZjE+0Rk5/xjL4=; b=SQK6dyLcDGa+m5e+3D0mq8Lc3BBguwhhXP3FIr
	DA40zkKrueCmnMhCT/enE9hDPC2QFZyVae3VPTQFF/YG97xyHxaqhvHxE2IQXsUb
	6AOwR1sDkzIQn/AjFQ1jp88L1TNA6Y15psVp9pFkARlmB8gh6rwGFx20mv+CaFiW
	Fi8+aTz1Y+VwxOJBKsUup0HceQQIeTQoUhxN1z3W/NbP9jXCr5bCPXm1q3jmZz8d
	Z9VSzVNLR21AMaoaya/dhNj+g6cOVuKCPoYCVzC1vouU6mMk3oCmy8zXIMYGdOyo
	UhBF9O20CFQ22HUe/FU2OQeHVVkoSVqmKOAL7gdtYvaqMzfA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4116h5ue8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G6XIjl010376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:18 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 Aug 2024 23:33:14 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v4 0/8] Add support for SA8775P Multimedia clock
 controllers
Date: Fri, 16 Aug 2024 12:01:42 +0530
Message-ID: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7yvmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0NT3eJEC3Nz0wLd3FzdMmNdI/NE80Qj01QLIKkE1FNQlJqWWQE2L1o
 pwDHE2QMkWmaiFFtbCwBNW/nEbAAAAA==
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
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hj1LCESIXsCzyJ63izi9TbIPbx7uogD6
X-Proofpoint-ORIG-GUID: Hj1LCESIXsCzyJ63izi9TbIPbx7uogD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160045

Add support for videocc, camcc, dispcc0 and dispcc1 on Qualcomm SA8775P
platform.

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
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240715-sa8775p-mm-v3-27a7a25e87a2

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


