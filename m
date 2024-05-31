Return-Path: <linux-arm-msm+bounces-21207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 189E28D5D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94342B236AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E19115573C;
	Fri, 31 May 2024 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KWfhAKx9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC8B1420D0;
	Fri, 31 May 2024 09:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146217; cv=none; b=BMLDezvetSdoDXdnVL3hfuL5N8XLddPhiswJQ8KDtYoLQkc/ObNtp5RmfzUdVji5mu5KeD0i6M+EjXm3jD4ep5q4NyUGlNlx1v2aY1bOPFg4GkffmdQ3Xfw1jT2P3FJL2flIBMBRodLTXHQEN+YGqB+z90+pRKbZdT4a8VjSEnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146217; c=relaxed/simple;
	bh=Avphpw4pEyJkzJ1Davm8WACDIUtPlK6hl0fu05JomEI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mrlsOLCeFsutXgBBnSlFG/NCgqSkQ0YyVZDW4PFRwwDZBj5pxigo3u4B3zldPNs29bBTwgGx3Y3sGOmAjUkKqeqrY1Ab5Nm6O5bsTYwKdDd5DfC95iS0vrqsaFq8zJrmCvwA2FAzDHi6EwGLXNC2YsajiVzps/jvzk5xrz0GhAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KWfhAKx9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMGGxM015853;
	Fri, 31 May 2024 09:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=BoO+194ArcepsZQDIP7Z3fcG35b6SSKIofkw3pIP+hw=; b=KW
	fhAKx9AbkMO4oSYUtWfR60VRxz1Q9359JbZjA12kA55TPgq77uQtmOQ+lotZt+Nx
	BMrFZZkJVuc4C3dRneG7r3KhuCXoDCaXvzC2zSedx2dSBSKhZSHAbp39TH2TJ0Fz
	Rpow7aaIWF/K+SbIQw+sJEYWNs1SY71tDMlD09uGVuNCjkyurZeNkdgnuCDHd362
	HUw9oU7x3OHjXLdv2Y4OtsVNFJLVg3OZFgOSziOpPqZhmBYKljwmogd1G0+zpki1
	mTOVqJIB43AOkMK5Jes7pZPLGr1Sm3xo39dElryr08wODS2RA6uZWtf8lUxP9ihJ
	r9ngBGjnvi018WJDsgZg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ss66a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V93S2n023918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:28 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:03:24 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 00/13] Add support for SA8775P Multimedia clock controllers
Date: Fri, 31 May 2024 14:32:36 +0530
Message-ID: <20240531090249.10293-1-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i7JV4XHqO_wpSNbFHevhl9eO8G0tnHrt
X-Proofpoint-GUID: i7JV4XHqO_wpSNbFHevhl9eO8G0tnHrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=741 bulkscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Update GCC, GPUCC clock controllers and add support for multimedia
clock controllers on Qualcomm SA8775P platform.

Taniya Das (13):
  clk: qcom: gcc-sa8775p: Remove support for UFS hw ctl clocks
  clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
  clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
    gcc_ufs_phy_ice_core_clk
  clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON
    flags
  clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
  clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
  dt-bindings: clock: qcom: Add SA8775P video clock controller
  clk: qcom: Add support for Video clock controller on SA8775P
  dt-bindings: clock: qcom: Add SA8775P camera controller
  clk: qcom: Add support for Camera Clock Controller on SA8775P
  dt-bindings: clock: qcom: Add SA8775P display controller
  clk: qcom: Add support for Display Controllers on SA8775P
  arm64: dts: qcom: Add support for multimedia clock controllers

 .../bindings/clock/qcom,sa8775p-camcc.yaml    |   76 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml   |   88 +
 .../bindings/clock/qcom,sa8775p-videocc.yaml  |   75 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |    2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   59 +
 drivers/clk/qcom/Kconfig                      |   31 +
 drivers/clk/qcom/Makefile                     |    3 +
 drivers/clk/qcom/camcc-sa8775p.c              | 1849 +++++++++++++++++
 drivers/clk/qcom/dispcc0-sa8775p.c            | 1481 +++++++++++++
 drivers/clk/qcom/dispcc1-sa8775p.c            | 1481 +++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c                |  154 +-
 drivers/clk/qcom/gpucc-sa8775p.c              |   41 +-
 drivers/clk/qcom/videocc-sa8775p.c            |  576 +++++
 .../dt-bindings/clock/qcom,sa8775p-camcc.h    |  107 +
 .../dt-bindings/clock/qcom,sa8775p-dispcc.h   |   87 +
 .../dt-bindings/clock/qcom,sa8775p-videocc.h  |   47 +
 16 files changed, 6027 insertions(+), 130 deletions(-)
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
2.17.1


