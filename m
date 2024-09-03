Return-Path: <linux-arm-msm+bounces-30456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F996938C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE141F2438F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 06:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D681CEABC;
	Tue,  3 Sep 2024 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JgO0j+et"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6401CEACD;
	Tue,  3 Sep 2024 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725344529; cv=none; b=m2TZo01s4Qf5UmFXUzdWVVEJ66ZQvBgekxdANQ9XwdSYlfkrTxBNcYsLDQ9NdZRrjGCMAC6p/WMExaPUiVyl+K8mbQbfq1c5Nxn4HosvyQc/X4wGchhwBVNmEtEdLGiDtbVJX1Y73oFrqWZNoNbBGayqLvdepsBV0Ecz1PasiZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725344529; c=relaxed/simple;
	bh=WKlyUNqOFxqBaMswcPnliJFqDsWeZTAs2OtYpvhfmNo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=koTs6/Z77xe0VMuFrI26uC1TFtGnvaygnjogeJvsnrrCCaI1x87NiF2uozNG+QfWjHV6RY7LMf8Qx5lDb19hA4vCNF27X3ScVg/1C7jM4R6pWJMY9kcX7rJ2P6W+Mf8TAMJdYqQOPOqDiVzCmy9olBaA0zSTjIIRLq6/3jGK3yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JgO0j+et; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482NhjUx021042;
	Tue, 3 Sep 2024 06:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L5RXsEUcpD44RQdmyOQEKS
	I5vZlXjzpnrt4y8IC07Jo=; b=JgO0j+etvDJp4sE8bXJ9X1RlExUO+SKkZmE2FU
	UvyIaevr6VnlEmJww2Qm1ikrBebg3konYc1dR7Zmm3aoeTqEK5tg4QGiTIlzFi/F
	eVCkvvNMzQY9kJ/0H4avvpwfa5ldIK5L0iFfEqHWXXOQ69uuJTMN39pidgYGFGSg
	opVpv3kuQs44/8q9+2YTDJjWIUc65wbTdUfLksCK/vB2HMK/JxG8V+OT9UsYWZYm
	XFwV9wh9XT9ajUd13p5RrE2D32V5+JMMViLFRVJRyW/Vaprqyw7SqnXBgZpAwe+B
	zw8wPtRqEiETIwEdhtSqbFkDPUjTC1jl+FNtzY/8MJsPROTQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buj6xb7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 06:21:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4836LqsC010076
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 06:21:52 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Sep 2024 23:21:49 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH 0/4] soc: qcom: llcc: Add llcc support for the QCS8300
 platform
Date: Tue, 3 Sep 2024 14:21:28 +0800
Message-ID: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOmq1mYC/x3MTQqAIBBA4avErBNGK7KuEiGiUw1EPyNEEN09a
 fkt3nsgkTAl6IsHhC5OvG8ZuiwgLH6bSXHMBoOmxg4rdYZkK0S3riG4KHyRKO9t67GptTUacnk
 ITXz/12F83w9z+HV2ZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725344509; l=964;
 i=quic_jingyw@quicinc.com; s=20240829; h=from:subject:message-id;
 bh=WKlyUNqOFxqBaMswcPnliJFqDsWeZTAs2OtYpvhfmNo=;
 b=fnIsJtgD3LDc7ss4uPt2L4XgitoC9s2uNgJS7BLMIjUlKjdLOb7Ii1i4jtVetLrg22FCYRusB
 zZtgO5C31iLCy7czLRHHCuP7joz2/knHvEHi7gtUd8UtSf0lCBfK1D6
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=3tHAHZsIl3cClXtU9HGR1okpPOs9Xyy1M0jzHw6A/qs=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: N6aypJxM_k6xTDaGxVp41xv0aA89rg-7
X-Proofpoint-GUID: N6aypJxM_k6xTDaGxVp41xv0aA89rg-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_06,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=823 impostorscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030049

Add llcc support for QCS8300 platform, there is an errata on the QCS8300
SoC to get bank num, define a property "num-banks" in the devicetree node
for errata.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
The device tree node of QCS8300 LLCC will be submitted in the following
dts changes.

---
Jingyi Wang (4):
      dt-bindings: cache: qcom,llcc: add num-banks property
      dt-bindings: cache: qcom,llcc: Document the QCS8300 LLCC
      soc: qcom: llcc: add errata to get bank num
      soc: qcom: llcc: Add llcc configuration support for the QCS8300 platform

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  7 ++++
 drivers/soc/qcom/llcc-qcom.c                       | 39 +++++++++++++++++++---
 2 files changed, 41 insertions(+), 5 deletions(-)
---
base-commit: eb8c5ca373cbb018a84eb4db25c863302c9b6314
change-id: 20240903-qcs8300_llcc_driver-aa87a0541821

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


