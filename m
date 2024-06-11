Return-Path: <linux-arm-msm+bounces-22310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF8903D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 15:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DB811F2242C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 13:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529C217CA10;
	Tue, 11 Jun 2024 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gBHpdoUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F947F7A;
	Tue, 11 Jun 2024 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718113114; cv=none; b=FKhcCnGTtfX1ZCQdF+zRToExuDLC2wDwSuTBdzvNybV801L+xITEEpkTdCC0N7n3QZBKu1rBa7B1r4anzbjGlWIwzUMvm6ar5F1YYdGGxbWV5fpnL8AT0CBlhfhXvBbfaSTGD0HSbpmM7vGyg9mr1D8eks9o7vRw6FgnCWc4aik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718113114; c=relaxed/simple;
	bh=gmpbs7daVQsy3/1FXy7yuLz6FDIlj6i6xTlS8xlezPU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZaLe3VHgVhNL28jXB1A1JsdUbUeTcNSJglhefaU8ciMPb21/7T56odA1AXvQn55tMHx6o2KFVl+X/Etx6+/tVyADYwLfGn/id2MB4J4oDX8SoraD9Wte/Hnec/sQ04u1/qfMtafinvilaPeHmt0OdHJOkLOFAGIqSN7cjKZFKyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gBHpdoUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B9g8Wu018402;
	Tue, 11 Jun 2024 13:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lECHIcGMhrxBkzvs8TUnS3
	MeZMm4+W9YCpT7HYbPSsA=; b=gBHpdoUuGgQgwzDpWGblrTmYcupXYY/3arkB/l
	d9eR2tjn263hJFZKpnYBGxSGL9omVBZwDP5c3sXvd/S+ERaFmxAr3hkV2w3fTit0
	XqA10Rzz2kCs4AoGwwJa2lwTHRgSg5hTaiZze/uLZVAoIODiNW52CkEXgkJc8L0w
	l4/u6GqHfmjCR35nCdr3Qw0IyGwgXAPoQ0f51csqVymt6c+XtE2aQLmi22yeB+vV
	3zKMZGWjPFq8/mRC7hM2qOxNC68T56TIpEkXY2W5ByJrjdTUpoxNgrDKiWyjKVEM
	Fn/+t2Cw8Yyxl861g/I0lF95g7iemNQRnBHlCD9vcro+x+gA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm6b8m6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:38:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BDcQwI018243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 13:38:26 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 06:38:21 -0700
From: Ajit Pandey <quic_ajipan@quicinc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
Subject: [PATCH V4 0/8] clk: qcom: Add support for DISPCC, CAMCC and GPUCC on SM4450
Date: Tue, 11 Jun 2024 19:07:44 +0530
Message-ID: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Bfop7SZxK_d8j7bFtG6_OIrudapLbDV_
X-Proofpoint-GUID: Bfop7SZxK_d8j7bFtG6_OIrudapLbDV_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110099

This patch series add dt-bindings, driver and device tree support for DISPCC, CAMCC
and GPUCC on QCOM SM4450 platform and also includes a fix related to LUCID EVO PLL
config issue in clk-alpha-pll driver which is required for correct scaling of few
supported frequencies in graphics clock controllers on SM4450.

Changes in V4:
- [PATCH 8/8]: Sorted nodes with address and minor updates for review comments on v2.
- [PATCH 7/8]: Added Reviewed-by: Konrad Dybcio received in v2.
- Link to V3: https://lore.kernel.org/all/20240528114254.3147988-1-quic_ajipan@quicinc.com/

Changes in V3:
- [PATCH 1/8]: Updated commit tags order and added Reviewed-by: tags
- [PATCH 3/8]: Fixed reusing of pll0_config and added Reviewed-by: tags 
- [PATCH 6/8]: Updated commit text and added Reviewed-by tags
- [PATCH 8/8]: Updated node order for gpucc.
- Link to V2: https://lore.kernel.org/all/20240416182005.75422-1-quic_ajipan@quicinc.com/ 

Changes in V2:
- [PATCH 1/8]: Updated commit text adding stable kernel signoff for Fixes patch
- [PATCH 2/8]: Updated commit msg and added Reviewed-by: Krzysztof Kozlowski tag
- [PATCH 4/8]: Updated commit text as per review comments in v1
- [PATCH 5/8]: Added Reviewed-by: Dmitry Baryshkov tags received in v1
- [PATCH 7/8]: Fixed duplicate reset entries warnings
- [PATCH 8/8]: New patch for adding dispcc, camcc and gpucc device-tree nodes
- Link to V1: https://lore.kernel.org/all/20240330182817.3272224-1-quic_ajipan@quicinc.com/

Ajit Pandey (8):
  clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
  dt-bindings: clock: qcom: add DISPCC clocks on SM4450
  clk: qcom: Add DISPCC driver support for SM4450
  dt-bindings: clock: qcom: add CAMCC clocks on SM4450
  clk: qcom: Add CAMCC driver support for SM4450
  dt-bindings: clock: qcom: add GPUCC clocks on SM4450
  clk: qcom: Add GPUCC driver support for SM4450
  arm64: dts: qcom: sm4450: add camera, display and gpu clock controller

 .../bindings/clock/qcom,sm4450-camcc.yaml     |   63 +
 .../bindings/clock/qcom,sm4450-dispcc.yaml    |   71 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml     |    2 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi          |   38 +
 drivers/clk/qcom/Kconfig                      |   27 +
 drivers/clk/qcom/Makefile                     |    3 +
 drivers/clk/qcom/camcc-sm4450.c               | 1688 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |    2 +-
 drivers/clk/qcom/dispcc-sm4450.c              |  770 ++++++++
 drivers/clk/qcom/gpucc-sm4450.c               |  805 ++++++++
 include/dt-bindings/clock/qcom,sm4450-camcc.h |  106 ++
 .../dt-bindings/clock/qcom,sm4450-dispcc.h    |   51 +
 include/dt-bindings/clock/qcom,sm4450-gpucc.h |   62 +
 13 files changed, 3687 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm4450.c
 create mode 100644 drivers/clk/qcom/dispcc-sm4450.c
 create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-gpucc.h

-- 
2.25.1


