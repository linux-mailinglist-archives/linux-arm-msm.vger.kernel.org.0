Return-Path: <linux-arm-msm+bounces-21237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCC58D5EE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A276628188F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B537C6EB;
	Fri, 31 May 2024 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bsb4vr0r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E171CD35;
	Fri, 31 May 2024 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149125; cv=none; b=JmKlylAD4vUHbPdYexIXJciZ+prDTmmJTNKOWeteAwbEYb7SRNi7K+YDF3el6eE8QkUjBDGujIlqLoWhVNFeVUr3zANw81M9y4di0S7xi4lxp3Tl1vr5oe772kmegwzIAbvSZ4Oblw7TCes9s7Mtf/zom7zA/wH+FkWp5Hj71+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149125; c=relaxed/simple;
	bh=Csaa3tt3xr9DechulIPvuOls8GvhzdSpwi1pkFEl4CE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EIshbtLmPhg2L4OqG/AqFSqEWcYe8C8CfneIzHYOlxWGk4chV3XlB5JTPxIe9hKDM2WFIjD4nVQ9PPRchWwVRkf7kVN4VVvEBZK7Uez905zQNikootrBDxVKw4iqZJPS35iPgMnuo+x7wYehpjnT9YtMpOR0gsX0StAyiwjVGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bsb4vr0r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9AAGZ020826;
	Fri, 31 May 2024 09:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4GDTEZEvr5D+uqFK1E8+9SzBVC37kZcctSCb3223QFI=; b=bs
	b4vr0rDE/ML4bdeRfUU1WNFH69QqlOnNe84U0MP5hSGWxXbHzZ5EUfgHLdaBhnkM
	AerVY97dJTH8ClWsWzG0KLo3AZL8XvQBVmsvIwbotLHKq2mK8aSi9kWqYnzB4XUs
	0kRjwRX4wWP/z9H7ZNQjvau8wI2cGUPAtgleYAnfntfrmu8CJhYV7y9D/FqDvMIi
	jCLV4upRojzRCRVjBbAKneABasVcWnY5aTQvr/jVmXeke3rDOoIuitbVR7JpTwAN
	nqLphXgc6/V5kt8bTTdKcurg2imQFLp7pIiGyEmro0sg/147gCmvUjA6kv0RxJWH
	34qT4fGc/T2FqJMhDhEA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2hed0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:52:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9pxww007409
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:51:59 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:51:55 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        Taniya Das
	<quic_tdas@quicinc.com>
Subject: [PATCH v3 0/3] Add updates for clock controllers to support QCM6490
Date: Fri, 31 May 2024 15:21:39 +0530
Message-ID: <20240531095142.9688-1-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P2LLaKOMm-e1gU9Nx01utIk5XARe7u36
X-Proofpoint-ORIG-GUID: P2LLaKOMm-e1gU9Nx01utIk5XARe7u36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=743 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310073

[v3]
   1. Patches for LPASS Audio has been split from this series.
   2. Updated the commit text as per the comments.

[v2]
  1. Move the implementation to support the lpass resets for the SoC
  using device tree property to new SoC-specific compatible.
  2. Separate the regmap conflict warning to a new patchset.
  3. Separate patch to handle the transition delay for GDSC and the mem
  core bit update for UFS ICE clock.
  4. Separate the device tree board specific changes to handle the
  protected clocks and lpass audio clock node. Remove the unnecessary
  disables of the lpass nodes.
  Link to v2 - https://lore.kernel.org/all/20240318053555.20405-1-quic_tdas@quicinc.com/

[v1]
   1. Adding the "qcom,adsp-skip-pll" property to dt bindings.
   2. Fix to skip the lpass pll configuration on qcm6490 derivative boards.
   3. Enable the force mem core for UFS ICE clock and update the gdsc
      transition delays.
   4. Fix to add the camera titan top gdsc as parent to all camera gdscs.
   5. Update protected clocks list and disable few of the lpass clock
      controller nodes for qcm6490-idp and qcs6490-rb3gen2 platforms.
   Link to v1 - https://lore.kernel.org/all/20240208062836.19767-1-quic_tdas@quicinc.com/

Taniya Das (3):
  clk: qcom: sc7280: Update the transition delay for GDSC
  clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
  clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs

 drivers/clk/qcom/camcc-sc7280.c   | 24 ++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c     | 13 +++++++++++++
 drivers/clk/qcom/gpucc-sc7280.c   |  7 +++++++
 drivers/clk/qcom/videocc-sc7280.c |  7 +++++++
 4 files changed, 51 insertions(+)

--
2.17.1


