Return-Path: <linux-arm-msm+bounces-38779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E60569D5A3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB1A3282645
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A730170A27;
	Fri, 22 Nov 2024 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XmfH8i8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782C7166F26;
	Fri, 22 Nov 2024 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261757; cv=none; b=jErXWdEQXdb83Qw6XKDba2kxyMoB8u23P1fanEDXc8fQlXdqAEv32DaOUzrQj0vdVsW68JJBhyIiuei48fD4LtrofRqEX74lOUs4DLIIXDOo5xlU+vqB5yyEEIgfKWRPlsRwq/lT1cmPjFiuNd4RGLGXLeRVy4OSfy7mMWmogNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261757; c=relaxed/simple;
	bh=WW6+F3YHt7Q0nVVbX10+QizyzfkqHmQ6PIAQm3WgLGI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KQg02iHnDigjtDfsfyN2813qlT9+JoX+XVKc1hhHzJpYDkLGsgyTki9qBMIIhDBUxtCoLoIHQ830uftXywvhiCAWZzY2wIlW5K35SDMn4D9MFVOAdUU4k8AcRTs6TyCwbGwUgTK5xuFSnih2jGiyZc1Y5wa8WANtsITBMh7uQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XmfH8i8W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM77Jem015637;
	Fri, 22 Nov 2024 07:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=L6jwY0jLoN/OUVAS1Flnk8
	KJib94VdADOkFeQ3Nyia4=; b=XmfH8i8WxQtD7ktFGfYr/hBYDegWP/G5U1UYeG
	nC28ncZGbjNrBXVbYFR1M+ciWQd/8KWwGKQrSdSQKZbmEz41XHHGxXErdWAAv4VH
	YMplnPMf7ciBwoKm9Fr6oKhAHyVLmI6TBTnjJQ9vbWFh1o9JS9Od9UDbPn1ctd9G
	GxQvyWjuvx03YYoTrmIK7pVT7kvrviisK8a56EsGcgklKbGa7iBMD4NzxD8s4rqc
	ObKtI5rmgFHGKJtcaRcDCW2d+qBABbBrmO8/43ivqENd1TSt9skfN0FkcyXMDUUx
	AfugWBYxfIiD93GJbf9LHQKtXtNdZ7BzRC+Te9Kikuwze2Ug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9kcgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:44:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7i7wl013351
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:44:07 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 23:44:03 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH V4 0/2] Enable TRNG for QCS8300
Date: Fri, 22 Nov 2024 13:13:44 +0530
Message-ID: <20241122074346.4084606-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5CdFZUxKHzWuWU3_0YpO7Pc9lbPFfSW0
X-Proofpoint-ORIG-GUID: 5CdFZUxKHzWuWU3_0YpO7Pc9lbPFfSW0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=577 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220063

Add device-tree nodes to enable TRNG for QCS8300

This series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Changes in v4:
 - Address the reg entry style
 - Link to v3: https://lore.kernel.org/all/20241113021819.2616961-1-quic_yrangana@quicinc.com/

Changes in v3:
 - Drop DT label as per review comments
 - Link to v2: https://lore.kernel.org/all/20241107121513.641281-1-quic_yrangana@quicinc.com/

Changes in v2:
 - Mistakenly uploaded the base dtsi change instead of marking dependency
 - Link to v1: https://lore.kernel.org/all/20241106110002.3054839-1-quic_yrangana@quicinc.com/

---
Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom,prng: document QCS8300
  arm64: dts: qcom: qcs8300: add TRNG node

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi                   | 5 +++++
 2 files changed, 6 insertions(+)

-- 
2.34.1


