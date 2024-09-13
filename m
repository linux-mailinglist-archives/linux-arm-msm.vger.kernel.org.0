Return-Path: <linux-arm-msm+bounces-31690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3F5977C24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C54B1C218D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 09:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885DE1D7982;
	Fri, 13 Sep 2024 09:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VqyGjwZ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19199190047;
	Fri, 13 Sep 2024 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219497; cv=none; b=a3aAk/vBhkE6qJYuT5rqUNr+PxTj/2yihu/jNKU1uHybF93xQaoSA1WoUrwmqimeJcx35WEgQwjMxFA6EfhYWFcGZepQ/TbZkyypyUnojeFg5JNB8EeXsxezwYNI/mLXvnuTsd8qIzpIRayUxHFUTcv+ZAgI/Wtb1C0PljJN7vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219497; c=relaxed/simple;
	bh=v6vGoChMEVFJAK+Yda/YVDBJ73NP5D0RXOI+dSKcZS8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c9Gt40kYvrCrRjxkDpSkYiwXPaaBvIEwfy93FGJCh03Amfh1PWpJe7qrgdcWiHnctXo3oE1RTbWipizupfB/s/mw/y654YLy7cPkOooCN2boSGseiTO0yd8Kh0Oz7na+BHXOKlwJb+rwX6qMtech8oVBPiXR2Ufjy+r2/5JonBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VqyGjwZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMBfEA030470;
	Fri, 13 Sep 2024 09:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YGLQHUcv7RR43tPczoXh95
	ob0kYtGEhBnH35KBdNEOA=; b=VqyGjwZ8/5lALtWqcyguZCGA0zOedbC6qk6mlu
	v+p2T0br8ZbDOq3niuX6SvOvY+vMCXxQuD0gzWtyI4vjIrEUGEwPBWlt4VDaNMoT
	cUEp8CfBwJQUBbqSagNcbOr+GFSiBeQZRd/0i+ot5uYlj6YfcMSWNVL5kmZGXoyo
	OnrlOqRg509op7rsc0TVsoseWmPCLnfieoEqx6JWBKvVrCHCcR5kGuHpEAJu+FTG
	nvZTo3AUT8nltYX61fqX2+FzBFZvi64Sn5gxH2YQkcWihzfcXR+Gm0DwAeZI4PMX
	iS28p7xKIrgf1/wVirNFJo4nLep9Fw59b1X20YQXYxjmqd9A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5a8afn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 09:24:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D9OfR0007092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 09:24:41 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 02:24:41 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Fri, 13 Sep 2024 02:24:27 -0700
Message-ID: <20240913092430.31569-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xDCMXUeLP8bCbz1khI2-tUZbVOmRfXOg
X-Proofpoint-ORIG-GUID: xDCMXUeLP8bCbz1khI2-tUZbVOmRfXOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=918 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130064

Change since V3:
1. Use ^ete-[0-9]+$ for the pattern of node name -- comments from Rob Herring

Change since V2:
1. Change the name in binding as 'ete'.

Change since V1:
1. Remove the pattern match of ETE node name.
2. Update the tmc-etr node name in DT.

Mao Jinlong (2):
  dt-bindings: arm: coresight: Update the pattern of ete node name
  arm64: dts: qcom: sm8450: Add coresight nodes

 .../arm/arm,embedded-trace-extension.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          | 726 ++++++++++++++++++
 2 files changed, 729 insertions(+), 3 deletions(-)

-- 
2.46.0


