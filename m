Return-Path: <linux-arm-msm+bounces-21766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDE8FCF55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13F85B2D726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B295C4C6E;
	Wed,  5 Jun 2024 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d1Gf75UX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68DB393;
	Wed,  5 Jun 2024 12:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591571; cv=none; b=Bx75dv69QrqcnfQT9RUI1QPkj4uoAEuFT8oZEhzvEUKEYmzwFX9998rupsQaUefXtIn8tm3MFhl9OjWtNdd+cpf7udkAy6BnklghqM8gyQswS1LPjCRpgp8jNEn6XtbDitqD+YBU7nedtjx5YPQT3CIUpW3zBDi0ioLIAn66qq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591571; c=relaxed/simple;
	bh=YkSxrwjWv7KZd09MEiQ5rhr4XLuFIHsreDoepNS/jvI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LLejZzh7joUmkZ0LwzPFSzhVlKlaActl2EkUcf8yGUJ/7QcSIfIXbmGXMnsH5SWx6jTYpHmTWPCa7ImhRWDTzeG6tZezIuuWl790dC6kyCLclWAGxU43h324vB842iE+tyElAY/I2kEx81XNmyhEzyHGjeTlGChO8BLvukmL4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d1Gf75UX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1Mf0031662;
	Wed, 5 Jun 2024 12:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fPt4WMFNWxC7lyDAZjNRmr
	RW9T9rPixJCG+EYa6lnAc=; b=d1Gf75UXpn70nsOcwCTc+xt8tU3uvSO+rLbA2u
	LIlIkl/0x+igVXryj7EAQfguvH/ryUTVhzvNBhgOpokPWWyg4CF/S6arxnXolxDo
	MIbCuWoxhg2HPKtYMj4EcVhD2F4qUNlYCiW5ksMMKR/hWtrjkzTYMad5crXVy4+g
	9gwULj8yINivw5AsEYgvf557+AGeeIkViBhZHes9YjymqjRz27iU5A8S9lKcY2n+
	EwGtDrI5NHtVf+Er/F98rHr2a0sfvpXfcLpoJGVz3bB0ZaWtI6q3xuWmGV4JKUED
	j1YN3HR+Cs2AI/tOXHWzT9CZeLu9bYBaVVpqf36HfBUhCo1A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk898ttg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:45:59 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455CjwD3024417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:45:58 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 05:45:55 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v15 0/4] add clock controller of qca8386/qca8084
Date: Wed, 5 Jun 2024 20:45:37 +0800
Message-ID: <20240605124541.2711467-1-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HpZm9ELIWt_-TIm51apxwwoBNYczvwsL
X-Proofpoint-ORIG-GUID: HpZm9ELIWt_-TIm51apxwwoBNYczvwsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406050096

qca8xxx is 4 * 2.5GBaseT ports chip, working as switch mode
named by qca8386, or working as PHY mode named by qca8084,
clock hardware reigster is accessed by MDIO bus.

This patch series add the clock controller of qca8363/qca8084,
and add the clock ops clk_branch2_prepare_ops to avoid spin lock
used during the clock operation of qca8k clock controller where
the sleep happens when accessing clock control register by MDIO
bus.

Changes in v2:
	* remove clock flag CLK_ENABLE_MUTEX_LOCK.
	* add clock ops clk_branch2_qca8k_ops.
	* improve yaml file for fixing dtschema warnings.
	* enable clock controller driver in defconfig.

Changes in v3:
	* rename clk_branch2_qca8k_ops to clk_branch2_mdio_ops.
	* fix review comments on yaml file.
	* use dev_err_probe on driver probe error.
	* only use the compatible "qcom,qca8084-nsscc".
	* remove enable clock controller driver patch.

Changes in v4:
	* add _qcom_cc_really_probe function.
	* commonizing the probe function.
	* remove flag CLK_IS_CRITICAL from clocks only needed
	to be enabled in switch device.
	* update device tree property reg to 0x10. 

Changes in v5:
	* commonize qcom_cc_really_probe.
	* add halt_check for the branch clocks.
	* fix the review comments on nsscc-qca8k.c. 

Changes in v6:
	* rename clk_branch2_mdio_ops to clk_branch2_prepare_ops.

Changes in v7:
	* remove the clock flag CLK_IS_CRITICAL.
	* optimize the file nsscc-qca8k.c.
	* identify & fix the comments from Stephen.

Changes in v8:
	* add dependency on ARM in Kconfig.

Changes in v9:
	* take the clk_ops clk_rcg2_mux_closest_ops to remove the
	  redundant freq_tbls.

Changes in v10:
        * fix the patch CHECK and improve the comments.

Changes in v11:
	* update the clock names to reflect hardware connecton.
	  NSS_CC_MAC4_SRDS1_CH2_XGMII_RX_DIV_CLK_SRC ->
	  NSS_CC_MAC4_SRDS1_CH3_XGMII_RX_DIV_CLK_SRC

	  NSS_CC_MAC4_SRDS1_CH2_XGMII_TX_DIV_CLK_SRC ->
	  NSS_CC_MAC4_SRDS1_CH3_XGMII_TX_DIV_CLK_SRC
        * resolve the qcom_cc_really_probe merge conflict based
	  on the latest code.

Changes in v12:
	* fix the compile error caused by the parameter of
	  qcom_cc_really_probe updated from pdev to &pdev->dev in the
	  new merged clock driver gcc-sm4450.c and camcc-sm8550.c.

Changes in v13:
	* fix the compile error caused by the parameter of
	  qcom_cc_really_probe from pdev to &pdev->dev in the new
	  merged gcc drivers.
	* use the freq_multi_tbl for the same frequency config, which
	  is introduced by Christian's patch set below.
	  <clk: qcom: clk-rcg2: introduce support for multiple conf
	  for same freq>.
	* add dependent patch set link.

Changes in v14:
	* Rebase the patch series.
	* Reset clock controller after enabling reference clock.
	* remove the link of dependent patch series since it is merged.

Changes in v15:
	* Rebase the patch series.
	* fix the compile error caused by the parameter of
	  qcom_cc_really_probe from pdev to &pdev->dev in the new
	  merged qualcomm gcc drivers.

Luo Jie (4):
  clk: qcom: branch: Add clk_branch2_prepare_ops
  dt-bindings: clock: add qca8386/qca8084 clock and reset definitions
  clk: qcom: common: commonize qcom_cc_really_probe
  clk: qcom: add clock controller driver for qca8386/qca8084

 .../bindings/clock/qcom,qca8k-nsscc.yaml      |   86 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/apss-ipq6018.c               |    2 +-
 drivers/clk/qcom/camcc-sc7180.c               |    2 +-
 drivers/clk/qcom/camcc-sc7280.c               |    2 +-
 drivers/clk/qcom/camcc-sc8280xp.c             |    2 +-
 drivers/clk/qcom/camcc-sdm845.c               |    2 +-
 drivers/clk/qcom/camcc-sm6350.c               |    2 +-
 drivers/clk/qcom/camcc-sm7150.c               |    2 +-
 drivers/clk/qcom/camcc-sm8250.c               |    2 +-
 drivers/clk/qcom/camcc-sm8450.c               |    2 +-
 drivers/clk/qcom/camcc-sm8550.c               |    2 +-
 drivers/clk/qcom/camcc-x1e80100.c             |    2 +-
 drivers/clk/qcom/clk-branch.c                 |    7 +
 drivers/clk/qcom/clk-branch.h                 |    1 +
 drivers/clk/qcom/common.c                     |    7 +-
 drivers/clk/qcom/common.h                     |    2 +-
 drivers/clk/qcom/dispcc-qcm2290.c             |    2 +-
 drivers/clk/qcom/dispcc-sc7180.c              |    2 +-
 drivers/clk/qcom/dispcc-sc7280.c              |    2 +-
 drivers/clk/qcom/dispcc-sc8280xp.c            |    2 +-
 drivers/clk/qcom/dispcc-sdm845.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6115.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6125.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6350.c              |    2 +-
 drivers/clk/qcom/dispcc-sm6375.c              |    2 +-
 drivers/clk/qcom/dispcc-sm7150.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8250.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8450.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8550.c              |    2 +-
 drivers/clk/qcom/dispcc-sm8650.c              |    2 +-
 drivers/clk/qcom/dispcc-x1e80100.c            |    2 +-
 drivers/clk/qcom/ecpricc-qdu1000.c            |    2 +-
 drivers/clk/qcom/gcc-ipq5018.c                |    2 +-
 drivers/clk/qcom/gcc-ipq6018.c                |    2 +-
 drivers/clk/qcom/gcc-ipq8074.c                |    2 +-
 drivers/clk/qcom/gcc-mdm9607.c                |    2 +-
 drivers/clk/qcom/gcc-mdm9615.c                |    2 +-
 drivers/clk/qcom/gcc-msm8917.c                |    2 +-
 drivers/clk/qcom/gcc-msm8939.c                |    2 +-
 drivers/clk/qcom/gcc-msm8953.c                |    2 +-
 drivers/clk/qcom/gcc-msm8976.c                |    2 +-
 drivers/clk/qcom/gcc-msm8996.c                |    2 +-
 drivers/clk/qcom/gcc-msm8998.c                |    2 +-
 drivers/clk/qcom/gcc-qcm2290.c                |    2 +-
 drivers/clk/qcom/gcc-qcs404.c                 |    2 +-
 drivers/clk/qcom/gcc-qdu1000.c                |    2 +-
 drivers/clk/qcom/gcc-sa8775p.c                |    2 +-
 drivers/clk/qcom/gcc-sc7180.c                 |    2 +-
 drivers/clk/qcom/gcc-sc7280.c                 |    2 +-
 drivers/clk/qcom/gcc-sc8180x.c                |    2 +-
 drivers/clk/qcom/gcc-sc8280xp.c               |    2 +-
 drivers/clk/qcom/gcc-sdm660.c                 |    2 +-
 drivers/clk/qcom/gcc-sdm845.c                 |    2 +-
 drivers/clk/qcom/gcc-sdx55.c                  |    2 +-
 drivers/clk/qcom/gcc-sdx65.c                  |    2 +-
 drivers/clk/qcom/gcc-sdx75.c                  |    2 +-
 drivers/clk/qcom/gcc-sm4450.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6115.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6125.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6350.c                 |    2 +-
 drivers/clk/qcom/gcc-sm6375.c                 |    2 +-
 drivers/clk/qcom/gcc-sm7150.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8150.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8250.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8350.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8450.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8550.c                 |    2 +-
 drivers/clk/qcom/gcc-sm8650.c                 |    2 +-
 drivers/clk/qcom/gcc-x1e80100.c               |    2 +-
 drivers/clk/qcom/gpucc-msm8998.c              |    2 +-
 drivers/clk/qcom/gpucc-sa8775p.c              |    2 +-
 drivers/clk/qcom/gpucc-sc7180.c               |    2 +-
 drivers/clk/qcom/gpucc-sc7280.c               |    2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c             |    2 +-
 drivers/clk/qcom/gpucc-sdm660.c               |    2 +-
 drivers/clk/qcom/gpucc-sdm845.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6115.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6125.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6350.c               |    2 +-
 drivers/clk/qcom/gpucc-sm6375.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8150.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8250.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8350.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8450.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8550.c               |    2 +-
 drivers/clk/qcom/gpucc-sm8650.c               |    2 +-
 drivers/clk/qcom/gpucc-x1e80100.c             |    2 +-
 drivers/clk/qcom/lcc-ipq806x.c                |    2 +-
 drivers/clk/qcom/lcc-msm8960.c                |    2 +-
 drivers/clk/qcom/lpassaudiocc-sc7280.c        |    4 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c         |    2 +-
 drivers/clk/qcom/lpasscorecc-sc7280.c         |    2 +-
 drivers/clk/qcom/mmcc-msm8960.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8974.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8994.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8996.c               |    2 +-
 drivers/clk/qcom/mmcc-msm8998.c               |    2 +-
 drivers/clk/qcom/mmcc-sdm660.c                |    2 +-
 drivers/clk/qcom/nsscc-qca8k.c                | 2221 +++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8550.c              |    2 +-
 drivers/clk/qcom/videocc-sc7180.c             |    2 +-
 drivers/clk/qcom/videocc-sc7280.c             |    2 +-
 drivers/clk/qcom/videocc-sdm845.c             |    2 +-
 drivers/clk/qcom/videocc-sm7150.c             |    2 +-
 drivers/clk/qcom/videocc-sm8150.c             |    2 +-
 drivers/clk/qcom/videocc-sm8250.c             |    2 +-
 drivers/clk/qcom/videocc-sm8350.c             |    2 +-
 drivers/clk/qcom/videocc-sm8450.c             |    2 +-
 drivers/clk/qcom/videocc-sm8550.c             |    2 +-
 include/dt-bindings/clock/qcom,qca8k-nsscc.h  |  101 +
 include/dt-bindings/reset/qcom,qca8k-nsscc.h  |   76 +
 113 files changed, 2610 insertions(+), 109 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qca8k-nsscc.yaml
 create mode 100644 drivers/clk/qcom/nsscc-qca8k.c
 create mode 100644 include/dt-bindings/clock/qcom,qca8k-nsscc.h
 create mode 100644 include/dt-bindings/reset/qcom,qca8k-nsscc.h


base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
-- 
2.34.1


