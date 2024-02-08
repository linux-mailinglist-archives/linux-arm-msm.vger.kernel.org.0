Return-Path: <linux-arm-msm+bounces-10135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB97F84DA1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A671F22800
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 06:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF2867E69;
	Thu,  8 Feb 2024 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GgJ9vn7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1867C6D;
	Thu,  8 Feb 2024 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707373738; cv=none; b=QWbTfgLMhGemtS5yPsulAk1T8UrmnwGAui6KZnjMtHaOEhAR/SvaRgCDHPq65dWsafvDIEdQlM1c37NC6O/kZ9uxlTy/EbyCd2oLEWfLaknN9ukDvHWcpUTBX1TqSBMoxA6OJcNG98nzenQkNtF+DTEWDjYYAAEVR+A3DoLfknI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707373738; c=relaxed/simple;
	bh=+PQ/NbZ1lLun+5izVKbJZ2760SEKcu5Vmmlj4ZFwwls=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n85Ld24Wi5FBU+4nrGD+2YRmRq1yGH8RJbnhDGVPiQfxyXenczmKEZ3LahyFTPkiG3scclfYge3nV9kDUZHj41T8P/VZB8ocvBjhGbdxpW/cv3KMzx71l0xxJxZZi8wE8J3RnV4MHms1Y2yKncsB5eEHGQ4L9HIhflBEg1lravk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GgJ9vn7v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4185K600015520;
	Thu, 8 Feb 2024 06:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=u1s+OpGFVLIdVtj/EL+KSKkrQjIv/IecYjNqZ55l10g=; b=Gg
	J9vn7vB20IGWC7uF71Da918QLGlhKvtVqFpL+9h8js+oRrJ2tgAwGxsZBocxjOzh
	WsphQMfYYpGub1S5d3sH5Czv0NWwd9Ufw5Oj4sIOyhltcvPEUteh6lRFxLh0eyrw
	tYaSoQnjaFFybLtyV6lXIvGJhFHIV5rwtShWSW/RxrftNuQHOQwWr1yhASCA1Lvq
	NB3O/ibevbrzqRw789toBR6Bw1iYai2C3LVX6s8FcSX18A2e9PZDaov3NMHjnpIb
	e4fQim0T4lmANj9OLo77IHKQYqp/lwQjZ3nI0Zi7Cvg+yMeYOXaqI49+/JJXMV7/
	gRi7m0xZykcFwxj2HlPA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w44fwjt43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 06:28:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4186SpmX028828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Feb 2024 06:28:51 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 7 Feb 2024 22:28:47 -0800
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/5] Add updates for clock controllers to support QCM6490
Date: Thu, 8 Feb 2024 11:58:31 +0530
Message-ID: <20240208062836.19767-1-quic_tdas@quicinc.com>
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
X-Proofpoint-GUID: 0G8W1pakJxBkMEjmABsoMPtMlldwaTSq
X-Proofpoint-ORIG-GUID: 0G8W1pakJxBkMEjmABsoMPtMlldwaTSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_01,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 mlxscore=0
 adultscore=1 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=671
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080032

This series updates the clock controller drivers and devicetree nodes
for QCM6490 boards.

1. Adding the "qcom,adsp-skip-pll" property to dt bindings.
2. Fix to skip the lpass pll configuration on qcm6490 derivative boards.
3. Enable the force mem core for UFS ICE clock and update the gdsc
   transition delays.
4. Fix to add the camera titan top gdsc as parent to all camera gdscs.
5. Update protected clocks list and disable few of the lpass clock
   controller nodes for qcm6490-idp and qcs6490-rb3gen2 platforms.

Taniya Das (5):
  bindings: clock: qcom: Add "qcom,adsp-skip-pll"  property
  clk: qcom: lpassaudiocc-sc7280: Add support to skip PLL  configuration
  clk: qcom: sc7280: Update the transition delay for GDSC
  clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
  arm64: dts: qcom: Update protected clocks list for qcm6490 variants

 .../clock/qcom,sc7280-lpasscorecc.yaml        |  5 ++
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 54 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 50 ++++++++++++++++-
 drivers/clk/qcom/camcc-sc7280.c               | 24 +++++++++
 drivers/clk/qcom/gcc-sc7280.c                 | 13 +++++
 drivers/clk/qcom/gpucc-sc7280.c               |  7 +++
 drivers/clk/qcom/lpassaudiocc-sc7280.c        | 14 +++--
 drivers/clk/qcom/videocc-sc7280.c             |  7 +++
 8 files changed, 168 insertions(+), 6 deletions(-)

--
2.17.1


