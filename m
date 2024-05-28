Return-Path: <linux-arm-msm+bounces-20725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C88208D19EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3897E1F22C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 11:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B5A16C867;
	Tue, 28 May 2024 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KfyW62/P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369916C849;
	Tue, 28 May 2024 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716896635; cv=none; b=hUlC3nWk77zpTOiEEWkC5q9q/tTkw7s0glp4xX4GVpKtep/wce2CqTcvum8hXOE9+r2OovYAii608O+4YKdLVmTftqXFwZ4n7JvUhcuxcFqpKx0NO3WieeUgBo28hg/bLWSBsaYfR6SkMZiujcjjBOhrjTK1tn6aRSMuX9AHdqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716896635; c=relaxed/simple;
	bh=HT8UoLvuzaAWSnPcgEviqzEwUvabn2/pzZgk55vt0io=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hoEZAlZ1I/7+2Y8nijzcd4hkeMQJfMkCVVv0lgFLzcrRZ6YSH7nlnV3ZcOKhMyzG+gYUQ9v7PkUzhZgHjajShoStn2UNHla4G0o8cNZvjSNndE8Vbkm8IHV7umzxSUfL9Ijk+6Z3awKTT97BDVcrudDjIhC6wbmclwCfyViJwsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KfyW62/P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SArqId030893;
	Tue, 28 May 2024 11:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0FAGocEjcBEmncpoJtA9QF
	vm1wrW5g5AZndFgjfE1Bo=; b=KfyW62/P3/ff+E2HWt+YQmgMt7BNB8IaCMyQbA
	S8/gOQP/3rd34hArZuxp/zvSm61rd3P/nDMHbuv8ThXWybtpHdXsL+JngOf6QZBZ
	AoIFjBFDKVSSi9Dhkph/QfuPEbxDy13Hs6Eq6TadBiXRhAEdSYEs8O+lBwH0YJx4
	zaIdQCCpFaOR0Khpqab0/x9LfzRAPAxsN0bfvLWGpuwb2qzZlS/CZFcvb7ks2/+j
	QxJoXBQikZwJpL20RTRMHmNgVLDZ38xbIJhzzywZmVPlL7aln3rwghSiCApSB0ua
	rXcEHkQ6/9EDgsSXBMFnRc2sytcZZ0jL5bY7z9FcLgCOSLng==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qdvcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:43:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44SBhfBb024744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 11:43:42 GMT
Received: from hu-ajipan-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 May 2024 04:43:36 -0700
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
Subject: [PATCH V3 0/8] clk: qcom: Add support for DISPCC, CAMCC and GPUCC on SM4450
Date: Tue, 28 May 2024 17:12:46 +0530
Message-ID: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
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
X-Proofpoint-GUID: EXb4yiK3u9kYrUGqZ8ivuKDZ_CKxBLZx
X-Proofpoint-ORIG-GUID: EXb4yiK3u9kYrUGqZ8ivuKDZ_CKxBLZx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_07,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280087

This patch series add dt-bindings, driver and device tree support for DISPCC, CAMCC
and GPUCC on QCOM SM4450 platform and also includes a fix related to LUCID EVO PLL
config issue in clk-alpha-pll driver which is required for correct scaling of few
supported frequencies in graphics clock controllers on SM4450.

Changes in V3:
- [PATCH 1/8]: Updated commit tags order and added Reviewed-by: tags
- [PATCH 3/8]: Fixed reusing of pll0_config and added Reviewed-by: tags 
- [PATCH 6/8]: Updated commit text and added Reviewed-by tags
- [PATCH 8/8]: Updated node order for gpucc.
- Link to v2: https://lore.kernel.org/all/20240416182005.75422-1-quic_ajipan@quicinc.com/ 

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


