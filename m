Return-Path: <linux-arm-msm+bounces-21251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6508D5F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2896B1F2237E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D683E152188;
	Fri, 31 May 2024 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dePtKJsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6015217E;
	Fri, 31 May 2024 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150998; cv=none; b=OiFnLVMS7CatAA2icvn3YDd+xhXZNj0HfJAttrPZIV3C465hLjK2A/52487OrRR2gkRoQOrRV5Q2ylaFnn6qEi4VgW2t8OmONvvsDmmT4mUivfAAbNZmEpVjcsy3MUHcOq/rSEQkzRNcJkBIroukkgt+KUKH4s83SMba2W5EpHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150998; c=relaxed/simple;
	bh=ivY1RK9CsSl4Vu834TA4KZSM7clN9/1U4l63N50ZI58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oupUQq1mhMlXmZfblJNCnH7SiUQiubBUCrpKN5rMzx6MZyCcX5cR1+4fWlggOejzSnZg4eJIK946UwgMS3G050o3VLUa+UhM5wF8wLNrhQaRxzf5lxRtqUyorAtztZb6Nj9qAiPG2ZFhkkBmeP8ZVZsLqaCHJKzJd8wXoBCGptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dePtKJsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V4gf7L006624;
	Fri, 31 May 2024 10:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=xqHT/lx4BU0YX0wZd/m+cOJU4o4wF7wnQaBAwX7AAmA=; b=de
	PtKJsjByGK5984q/cvSKmfm4lVfEMoLQlo9VCeYFcG7wJGmv3nLe8R3De83UaLor
	TLxsNstI5B4zUt8IoaE7iEWd93ijq+YBMHfRfSp4sXZhBNDkHJikc4wps0f4eTYj
	xOWHNpEctvvR4vDSNyK4HqMJsrBw8458Ijidvbm6/FK+rLiHA0zSAvpie3YLCjsA
	E8ONSdqekqhj4YSRidY4UgulhdQDDCzmHwOQJwHa2Ri1VZNjzLO5vn5v8mP0cZIe
	4NE9sVM2x5LMROkOcIbYcVyCxOLblbXf7uqujZKDG7b/ZILvJPnyP9x1Di7Zl+HV
	JQ3fD/48N7kPVrrei8NA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ye96bmv7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VANChx019243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:12 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 03:23:07 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/4] Update LPASS Audio clock driver for QCM6490 board
Date: Fri, 31 May 2024 15:52:48 +0530
Message-ID: <20240531102252.26061-1-quic_tdas@quicinc.com>
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
X-Proofpoint-GUID: xM9yCGNzTfSHpOyjy9JPMWZdXf7d8UMe
X-Proofpoint-ORIG-GUID: xM9yCGNzTfSHpOyjy9JPMWZdXf7d8UMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=752 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310077

This series updates the low pass audio clock controller driver for reset
functionality. The patches are split from the below series.
https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

The QCM6490 board requires only the reset functionality from the LPASS
subsystem. Thus separate out the driver probe to provide the same on the
QCM6490 boards.

Taniya Das (4):
  dt-bindings: clock: qcom: Add compatible for QCM6490 boards
  clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for
    QCM6490
  arm64: dts: qcom: qcm6490-idp: Update protected clocks list
  arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

 .../clock/qcom,sc7280-lpasscorecc.yaml        |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 28 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  7 ++++-
 drivers/clk/qcom/lpassaudiocc-sc7280.c        | 28 +++++++++++++++++++
 4 files changed, 62 insertions(+), 2 deletions(-)

--
2.17.1


