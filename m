Return-Path: <linux-arm-msm+bounces-40359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2A09E44C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24C5A165D7A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814C1F03FC;
	Wed,  4 Dec 2024 19:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="laWfwfby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F51C3C1F;
	Wed,  4 Dec 2024 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341066; cv=none; b=H5fAmQhB3RmMSR54DOwDC5uCAWJYeuTlrrMNqOkN6lvxNN24ZCDgiI98v6BAVn+XgAMKcEpSbX7OKtuiLCx3F+Lrkd1d1cC/p6FUxmqvlmCE+eZac+alntN9S6+Tg9vPQQ8unou1sWWC8wsypBB1JI5QfkxMYqaWLLO6NyWsEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341066; c=relaxed/simple;
	bh=i+aZQ7pNxIDERryH/wFzRNbRnyQtHrSyce+j8Y50dIg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sBAsqjIJWKeUDMKf0DTk/1xIPsKzdm/0qWvrymGQTYYP1ph7m4nYXn+uxgKEMUzy1TY4oi+xsnx3VmutQI+4pejdqZU2ap9keMUcq0Q4F7FoKXmnIxVzxe3fkAYEqko+u7JCQvy1uq10bCRBWS3BEkP6f1D3n2TYL5ITn5ot8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=laWfwfby; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4GIM4n024065;
	Wed, 4 Dec 2024 19:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WODLAJk42mCopfvblmGFF0
	a+uKhmx6oZsPEUVFz6sf4=; b=laWfwfbyidozToeyWNEjOKJfn2wZqmO6D8MxB7
	U60LjPkLzFgCDdRD75j3BrOhOEHS6zA8X847vFTFsWekgQBM3obiKmMj3pJyVDtN
	YszHxtbe8V7pubUDGTDl9zax2Df6rDXu2MjlzhT0DLdRNJAm7EN2LhKPFMBv3Wgu
	Qs2cHCvEWQqjb8Ru13R8L8WOxL7Iex5x3R15hgu7cF3yJlqayf5eJW2sYhu5fP8j
	nBusB0FtIGSmSFPKZUkPNMS+IQbOH+1fg6GbjxVs4fHOBmY5LXCnulUqDns5OHVy
	o0cOKX/Fph+oMhGK2j2WWN77m2VundSEkGSHXYSk4bYhdnnw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnywa55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 19:37:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4JbcRu018548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 19:37:38 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:37:38 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH v3 0/8] clks: qcom: Introduce clks for SM8750
Date: Wed, 4 Dec 2024 11:37:12 -0800
Message-ID: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGivUGcC/x3MSQqAMAxA0atI1hbaWutwFZHiEDU40ogI4t0tL
 t/i/wcYPSFDGT3g8SKmfQtI4gi6qdlGFNQHg5baKC2N4DXPUunWhk/0rltmFqgtqrYwyrYWQnh
 4HOj+p1X9vh/WEIhYZAAAAA==
X-Change-ID: 20241204-sm8750_master_clks-e26e1b9416b6
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733341058; l=2688;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=i+aZQ7pNxIDERryH/wFzRNbRnyQtHrSyce+j8Y50dIg=;
 b=QwcFbbYsS8LA0xZJAZIsFCpZ7jST7othk6TOAjTJ/uMuX2e9gs+KzOv7hB7peOknsZJmbEC26
 PpinNazyYoJDqRSOF2eGbjwg3UZdb5cn4TtdYm+j2AijV1U0vTfkiim
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AmkfZW5UH2N_JiB5e295RQaxQX-6sCIO
X-Proofpoint-GUID: AmkfZW5UH2N_JiB5e295RQaxQX-6sCIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=640 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040150

Add GCC, RPMH, and TCSR clocks for the SM8750 SoC.

The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
consumer mobile device SoCs. See more at:
https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Changes in V3:
- removed unused rfclka4 and rfclka5 from clk-rpmh [Dmitry]
- split the SC7280 match table to a new commit [Dmitry]
- There are bindings difference between SM8650 and SM8750, so bring back
  the v1 binding https://patchwork.kernel.org/project/linux-clk/patch/20241021230359.2632414-5-quic_molvera@quicinc.com/
  and fix the unused bindings.
- Update the DT indexes as per the GCC bindings
- Use the qcom_cc_probe() instead of qcom_cc_really_probe() for TCSRCC [Dmitry]

Changes in V2:
- removed unneeded rpmh macros, bcm ops
- renamed CXO_PAD to CXO
- ordered rpmh compatibles in alpha order
- reordered clk_alpha_pll regs
- removed redundant bindings for sm8750
- revised gcc driver for pcie 0

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Taniya Das (8):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for SM8750
      clk: qcom: rpmh: Sort the match table alphabetically
      clk: qcom: rpmh: Add support for SM8750 rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for controlling Taycan PLLs
      dt-bindings: clock: qcom: Add SM8750 GCC
      clk: qcom: Add support for GCC on SM8750
      dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for SM8750

 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |   62 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.c                   |   14 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +-
 drivers/clk/qcom/gcc-sm8750.c                      | 3274 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-sm8750.c                   |  141 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |  226 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h       |   15 +
 12 files changed, 3786 insertions(+), 1 deletion(-)
---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241204-sm8750_master_clks-e26e1b9416b6

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


