Return-Path: <linux-arm-msm+bounces-32654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962C9881F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25C652814D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53CD1BB680;
	Fri, 27 Sep 2024 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IEG760Dk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B51A0BE6;
	Fri, 27 Sep 2024 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430881; cv=none; b=nXCqSfgD/pc0mVgcC9vju2WPVTnqq8Yoi3/8zrs/XjpjxESBG0oHecjRQEGTyrV1562gjaOnxDn2x2kv2hb5fKlUfsSgQ5ysIxY2rH5PzskmOOKD1AtT+42eQV4SGgMolhcOfPaldxgyJedgXTUaOsJYrYYd57bDt6MfzFc+ICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430881; c=relaxed/simple;
	bh=oT9Q/TpkBEoot6OUBpP3yBJ74AEvJq1gLL/uQyImQqc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hy/DumFmVK3hlyffSE8A4b2fa0aFfTbKgZp0pXRH3JiIARDsPKHEllDKQyRvBxHtETVE87Book0EBV7fym+3OPkS2yhgUYOv/BhgE+w8vT4Tb8y4MUHQ7vHMyVQ5gzTQGwC3AIrEQLRdg0hg4cp6ppR7U9306yjrxecIesWBTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IEG760Dk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6dw8r002835;
	Fri, 27 Sep 2024 09:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yhkzXu9JkYArgHu8UCmrjF
	ztkEHupuh3mNsEx59SM1w=; b=IEG760Dk5obWthd8/gLIjG8B/frm6tpX62nLfZ
	fRk2OnjyvXo9+Viv9NxEK2vxguB2aIFvqHDBKju+9XwYtEf3G92DzYPQtexvfomI
	URgZ9noPiU103JS2ogxJ2wJMyBEQuMSdXKP0oyq8vNvvGx+5PpaNuRb4i6uqTJWM
	U1NWELBiHARG6JNqWui6qwLw+I3AuW4xEyabf/GsACKOrf4qn6jUfy5T2MwbW6/T
	XIhYA/L2ZgqKTh9oj9QD85kWLJb+UU1xKKJDLC8cI7MfUZaOXVKaytNqxpZECFHN
	Ysqbte1sK8tXhbCNnKcANn4m0qsU2EdnrRRruO8wdRDDaPhw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakt5h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 09:54:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48R9sRST031691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 09:54:27 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 27 Sep 2024 02:54:27 -0700
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
Subject: [PATCH v5 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Fri, 27 Sep 2024 02:54:09 -0700
Message-ID: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3jDNfUk1iXMB3a-mIZnPhdiyY7EZZ7xH
X-Proofpoint-GUID: 3jDNfUk1iXMB3a-mIZnPhdiyY7EZZ7xH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=889
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270069

Change since V4:
1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
2. Update commit message --- comments from Rob Herring <robh@kernel.org>

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


