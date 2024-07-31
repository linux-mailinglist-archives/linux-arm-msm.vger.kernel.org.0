Return-Path: <linux-arm-msm+bounces-27490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9B59426C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C661CB22B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C8149652;
	Wed, 31 Jul 2024 06:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IKNWu+Ib"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E2946F;
	Wed, 31 Jul 2024 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407441; cv=none; b=t2aBmHuJyuVvi4leFJFcA34kI48aksx1H4527eL/DzzjYyQdzkB9dpON4knE3TfHYUVDGdzBIoTD0GYkmgXdycmUE0EnHiQroZK1lCJrk2HT+vIBnoO/hMuDp8OlRsSpi23jWzUcgC9CSLDTbnCIbY03sVKgdL2SNnsLr1G0i6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407441; c=relaxed/simple;
	bh=VoZzbEbuygW6Y1XpQzhisNfDVfNbaJsOtSIPT4inSSk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=poXDVmy80y/kceDee1dSfKkSh8hOsgiDfUwIAQ5BTxu8S71p1KzVQBg/Zp3cuFtYd+dGKs9C0nKwBSYOVH8fA0O684nVR8KHnlpXD2L5t9ozujBU8t6f/5bwiflontH/WtnaUFqCjLJ6xV36K/hTCo9YmpQ5g7Uow2HWdlHjLN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IKNWu+Ib; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V5sfJN002730;
	Wed, 31 Jul 2024 06:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cKkOfFRtG2bqlHV27qO/MP
	E9anCpMPKWRTVkSmCEDPo=; b=IKNWu+IbSCDbVq8NKvT5ChCWRhJa9l+SC0r7HX
	H2Abstd5wnjHJjm6Pz7GSmYTxYv0iVRvdaQNQ98E7J37KUvFoS87bj2QrjXomYn7
	uFByQO3IaggSFSX4iVHYuoJ0Dbkpb3J1KNkBJJ0IeaIze9ckdIw/bryVQNwUcyXb
	PntvJeAAbpQ0mFAjqgEi9rmuviTGJiAw7Bbd76nVnwOlKj2uRRZzsl0LEGiXR5Q3
	JHE6oqCIrNQrPUdkiwyMil9aQUs7q2vvkAxLKtQ7I9IToIKQBcPNp4b8ueJ47aqV
	UBSqgv+ngXf1GrCF/ChEx46lR+v4JEeO0wcviA0ltgUM+ADQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqw7a47x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6U5ii032672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:05 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:29:59 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, <stable@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH V3 0/8] Add camera clock controller support for SM8150
Date: Wed, 31 Jul 2024 11:59:08 +0530
Message-ID: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0Ar3fT9FMecVPCpFyLz9coPLdi-dQtai
X-Proofpoint-GUID: 0Ar3fT9FMecVPCpFyLz9coPLdi-dQtai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310047

Add camcc support and Regera PLL ops. Also, fix the pll post div mask.

Changes in V3:
 - Split the fixes into separate patches, remove RETAIN_FF flag for
   gdscs and document the BIT(15) of pll alpha value.
 - Link to v2: https://lore.kernel.org/all/20240702-camcc-support-sm8150-v2-1-4baf54ec7333@quicinc.com

Changes in v2:
 - As per Konrad's comments, re-use the zonda pll code for regera, as
   both are mostly same.
 - Fix the zonda_set_rate API and also the pll_post_div shift used in
   trion pll post div set rate API
 - Link to v1: https://lore.kernel.org/r/20240229-camcc-support-sm8150-v1-0-8c28c6c87990@quicinc.com


Satya Priya Kakitapalli (7):
  clk: qcom: clk-alpha-pll: Fix the pll post div mask
  clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
  clk: qcom: clk-alpha-pll: Fix zonda set_rate failure when PLL is
    disabled
  clk: qcom: clk-alpha-pll: Update set_rate for Zonda PLL
  dt-bindings: clock: qcom: Add SM8150 camera clock controller
  clk: qcom: Add camera clock controller driver for SM8150
  arm64: dts: qcom: Add camera clock controller for sm8150

Taniya Das (1):
  clk: qcom: clk-alpha-pll: Add support for Regera PLL ops

 .../bindings/clock/qcom,sm8150-camcc.yaml     |   77 +
 arch/arm64/boot/dts/qcom/sa8155p.dtsi         |    4 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   13 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/camcc-sm8150.c               | 2159 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |   57 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    5 +
 include/dt-bindings/clock/qcom,sm8150-camcc.h |  135 ++
 9 files changed, 2456 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8150.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8150-camcc.h

-- 
2.25.1


