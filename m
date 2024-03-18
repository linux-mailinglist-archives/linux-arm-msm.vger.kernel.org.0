Return-Path: <linux-arm-msm+bounces-14319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47287E32A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051F3282916
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A3E20B34;
	Mon, 18 Mar 2024 05:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jH3sPvcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5A2209B;
	Mon, 18 Mar 2024 05:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740210; cv=none; b=i5jwsE+7TK6bFABTt9kvd34wvI4Qz8gMsAe6ev7d1WbAvwRXIMcK9Hck2j2uk46a8P901rkkqsQ5fOQXPsCkxK5XjMFfi9rG8kU6Zq5dzkb8RUdWbbg6DwdUYkb5j1PYEtcBKs4ltTYayArIYEMcCkGXuIRfRVX4d78NFqFwbhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740210; c=relaxed/simple;
	bh=LK6IfA5eRoFyujLB5CQMokWL0RSR2DcC81zeDvDTciE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TEBMjpbz+uWZK86RmSFz+YLNXouM9cQm9N7vYo6jLqJ/WRULjQhwY9Vjab/Qlkba/om0h7zPrd+gPIM6OGvES9Z70cktTMLtuFXgoq73cN1rfxxchv47V9MU2lh4iwcng+dUrK0MvJNnfgGulGkPugPnZvnOygVhwQ7AWw5+230=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jH3sPvcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I5QBxB022050;
	Mon, 18 Mar 2024 05:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=RqKqz3BLcYT+IxKMoi1VcaKV3cqEo2vvOtKvioPMh7M=; b=jH
	3sPvcGcNp75xFdNZXoZRL8S2IqtWEaIo+c30I+sVX0XOoPlwTTa2oUgzsg0/IJYR
	ZkLrgbv1iqbQi9/9UKKDKiiCShY4/rso63HKAVazFQmuKOOUGGbfR7WOvBM+9KPn
	6zkcvUSJivEtZ3KSsAZmMv3EZP5x2FZHBad2BXVgZmzxhqtiQKTTXekq+ywnso9h
	oZm8S6wdUn+HqRXarZDb8ZEcLt5s5dMCaKXBstvf4Kh+FCGIHFoxCy+91xWXPRrN
	as0r19M38sokoM4kwEfCiSDQASZm7bNRs8kNxiwsScuFf4CZzkcwV/RB5lHXX9mj
	jOqf4r+oKg+dNgHuiKzA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtds4kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5ahpr031162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:43 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:36:39 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/8] Add updates for clock controllers to support QCM6490
Date: Mon, 18 Mar 2024 11:05:47 +0530
Message-ID: <20240318053555.20405-1-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rrQe5UZB2Km-j0CGkEK_xgjMg3Vtzxno
X-Proofpoint-ORIG-GUID: rrQe5UZB2Km-j0CGkEK_xgjMg3Vtzxno
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=605 mlxscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403180040

This series updates the clock controller drivers and devicetree nodes
for QCM6490 boards.

[v2]
  1. Move the implementation to support the lpass resets for the SoC
  using device tree property to new SoC-specific compatible.
  2. Separate the regmap conflict warning to a new patchset.
  3. Separate patch to handle the transition delay for GDSC and the mem
  core bit update for UFS ICE clock.
  4. Separate the device tree board specific changes to handle the
  protected clocks and lpass audio clock node. Remove the unnecessary
  disables of the lpass nodes.

[v1]
   1. Adding the "qcom,adsp-skip-pll" property to dt bindings.
   2. Fix to skip the lpass pll configuration on qcm6490 derivative boards.
   3. Enable the force mem core for UFS ICE clock and update the gdsc
      transition delays.
   4. Fix to add the camera titan top gdsc as parent to all camera gdscs.
   5. Update protected clocks list and disable few of the lpass clock
      controller nodes for qcm6490-idp and qcs6490-rb3gen2 platforms.
   Link to v1 - https://lore.kernel.org/all/20240208062836.19767-1-quic_tdas@quicinc.com/

Taniya Das (8):
  dt-bindings: clock: qcom: Add compatible for QCM6490 boards
  clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for
    QCM6490
  clk: qcom: lpassaudiocc-sc7280: Fix the regmap conflict warning
  clk: qcom: sc7280: Update the transition delay for GDSC
  clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
  clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
  arm64: dts: qcom: qcm6490-idp: Update protected clocks list
  arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../clock/qcom,sc7280-lpasscorecc.yaml        |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 28 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  7 ++++-
 drivers/clk/qcom/camcc-sc7280.c               | 24 ++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c                 | 13 +++++++++
 drivers/clk/qcom/gpucc-sc7280.c               |  7 +++++
 drivers/clk/qcom/lpassaudiocc-sc7280.c        | 15 ++++++++++
 drivers/clk/qcom/videocc-sc7280.c             |  7 +++++
 8 files changed, 100 insertions(+), 2 deletions(-)

--
2.17.1


