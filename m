Return-Path: <linux-arm-msm+bounces-44084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04523A03A6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A6F03A12F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613581E2616;
	Tue,  7 Jan 2025 09:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="chGxbntC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F81E2858;
	Tue,  7 Jan 2025 09:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240466; cv=none; b=TY0mceolN5S1Gs1ehryO90SGThaGOg+a4cofbtAZKlAO4l6EVygjwBOb/FMYFcMaQCzsZpEt1ClmFhjJCOGIwh2vf3TlekA6N0/vi9mC7veK1AXFwGp3uF7bkKBdoeX/UH8o7gBLJMxV8+gXpHhksva4EWIn6RJ1Mr5u7wmtxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240466; c=relaxed/simple;
	bh=QVSNAQB+bUL71CPnVunqacrugPM/ed1add24fObTszY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gKFyoxcgY8MWx+0aIlHbz2uzXUbYogemwrltGFIP4rbG+f+OhQgOoOHpGtHr/yiUpdnlmGR3LNtDSQekDIxNQ8RcYp7vdvqw+q3z2LHPgkzJBUC/cxo0ug8WjetEcrTes/bTrSxa+yCXIXO58ywz2YdcuIpyvlKq09SCOAf0V1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=chGxbntC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50742Y96015469;
	Tue, 7 Jan 2025 09:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kERBNtWX+gVIWdJRM3C+ADzPLLP1nd04Km7skhGlVAs=; b=ch
	GxbntCC/jNqwfAE3/nFDDlNljR8v9NWA3BcwNQc5Hz6txk6yJkjw2E+/D5IokXHc
	+NNgIzXfhmxTLQ2oCXjP4nzlKlDMr9wgYD3PRVZay4zQr/fvNXkGwRblOKbcumMl
	Q4VFJ2OIb8aAtEtj94n+gC2ziCITzgKYnCIk31nCOeouyrr/CUY0xJ5+fOFWOtEq
	kr1dkwpUy7JqpHZ0BKZIVvtokHTIPIAZplrUXK3UI4o+K3+0Lj8CnDWzMexAGN2t
	j2v53FkseYD+gQW7djYBOUFTla8hloo9sA59absDSS5mFYeP3MLlztna6cqV0MYU
	zC/bLZhvIU8CdoyY33uQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vw60kud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:00:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50790mrf015384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 09:00:48 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 01:00:44 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
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
Subject: [PATCH v6 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue, 7 Jan 2025 17:00:29 +0800
Message-ID: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: cldEeC_rc8UCt1LsnKiiLFNDfS58PYog
X-Proofpoint-ORIG-GUID: cldEeC_rc8UCt1LsnKiiLFNDfS58PYog
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxlogscore=916 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070073

Change since V5:
1. Fix the &CPUn vs &cpun issue in device tree file.

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
2.17.1


