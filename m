Return-Path: <linux-arm-msm+bounces-37507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C29C4AC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35BC21F23852
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017141F583B;
	Tue, 12 Nov 2024 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DTUXqxZj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD51EE01E;
	Tue, 12 Nov 2024 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371305; cv=none; b=Tnuu/BrdJ/VrOHuhFEhbOI8vMUnNoYrU0IFpUE912qROT70m2vl3PP+M4qNVEgMsoBpUyWhjGlUI1ms3fSWwGuEkkUB9v7vZjFCAy+Lo9VZNKeTg32GNA5uA0S4DPzk9YkT2WBfmXZobKOAJJ2CQqb+8jR1S56dqbsIk4rPKeBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371305; c=relaxed/simple;
	bh=a5y5UQhDLZtQhfp0kyQsgcLSFYEFlXcbP9yOekeQoLQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eB8Up7E4TxlxfInFyCFh4TxIlJtVy/iojaBL7AafbgArQQk5tnviOF/DALWZmHkSGsXLvcTjcTnvfADTMaMAnIL2TVo+RgocE7mY/v65xGgw5pswkpDAwx0CBCdFDCX5PPwW7US61WmTuOI4eWhdrT411OTtBnw0b5j4IIh98/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DTUXqxZj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABGK4i7023176;
	Tue, 12 Nov 2024 00:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=z/POHtmN/E7HPK6fi+VLJh
	/ax+5c754knTUKNMlshcQ=; b=DTUXqxZjnIACQLgeIsE/njXuckc24ciiYGqMhT
	WYiOOah18U2a6tOetKW+TYaKBFRn9qFNrEqDPdzu67yLgVe2fw90fG6h+Ntt2mMg
	goMxOOlJlcCxjfc9hjTud/jO7Bt4Dk2GsrYJmru5Bvlb+YTTkuz5XsRa8D86IZ/S
	OeeNul3g7MhwNlmrNqqvHZD07bVqriN35ZshIMFsLc0et9WSgq/lgB2uU1HaDdWp
	8SAzRit+CzFWPvuoW6w+kwBfx8A1BeDsr4AK6Cn91FZ/TauhZC1A529de3heOCxV
	BJvt87eCCUIhJRFM0ya3leyuDyZAdXzaREwWhwk9dFhtWW7w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60a9pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SH5P032442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:17 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:17 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 0/7] clks: qcom: Introduce clks for SM8750
Date: Mon, 11 Nov 2024 16:28:00 -0800
Message-ID: <20241112002807.2804021-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OiXQ6Y5vHDZ1oe-hmxEeeBWNM7vi8PL2
X-Proofpoint-ORIG-GUID: OiXQ6Y5vHDZ1oe-hmxEeeBWNM7vi8PL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=593 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120002

Add GCC, RPMH, and TCSR clocks for the SM8750 SoC.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Changes in V2:
- removed unneeded rpmh macros, bcm ops
- renamed CXO_PAD to CXO
- ordered rpmh compatibles in alpha order
- reordered clk_alpha_pll regs
- removed redundant bindings for sm8750
- revised gcc driver for pcie 0

Taniya Das (7):
  dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
  clk: qcom: rpmh: Add support for SM8750 rpmh clocks
  clk: qcom: clk-alpha-pll: Add support for controlling Taycan PLLs
  dt-bindings: clock: qcom: Add SM8750 GCC
  clk: qcom: Add support for GCC clock controller on SM8750
  dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller
  clk: qcom: Add TCSR clock driver for SM8750

 .../bindings/clock/qcom,rpmhcc.yaml           |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml      |    2 +
 .../bindings/clock/qcom,sm8650-gcc.yaml       |    8 +-
 drivers/clk/qcom/Kconfig                      |   17 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/clk-alpha-pll.c              |   14 +
 drivers/clk/qcom/clk-alpha-pll.h              |    7 +
 drivers/clk/qcom/clk-rpmh.c                   |   28 +-
 drivers/clk/qcom/gcc-sm8750.c                 | 3274 +++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8750.c              |  147 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h   |  226 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h  |   15 +
 12 files changed, 3738 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-sm8750.c
 create mode 100644 drivers/clk/qcom/tcsrcc-sm8750.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h


base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


