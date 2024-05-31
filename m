Return-Path: <linux-arm-msm+bounces-21252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D838D5F98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EDD1F24004
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47116156223;
	Fri, 31 May 2024 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GYHCUUvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B63155CA6;
	Fri, 31 May 2024 10:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151003; cv=none; b=k/weKs2oh92CbYxsz+M2zFbZWjDbJQu2Vnq9JHKnR4/5fgUPf3T9Po4zBc1Rhhp2ANhOpXy1Htw2cWQ34W4h1XE3K18TdCct4iM5+2IUUVeoySnhT3aeKMzAqN/579nQN5ez5p+DaOg46r40/xSxYkuktva5V6jDObMQssSp1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151003; c=relaxed/simple;
	bh=6AzQkUhyzXBRpeK6WLnSe2/pAaPmql1nIkYdd6ZuNQs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lB/Ub8aDxQ+w+MV/CfQVQeiu3fLfH+CB2RWsU3cQF89PNVzC8jLed8prr48rjBubIaZkt+tSQGoD0u6vn9HVWhUcG2/sSmxsEQXkZ6uz4IB3vZppj5shwaSn+yskv/DWgQPUUtSfaRVzC6z3HDHyxzuNljBukdLd26T95l5Inrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GYHCUUvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8eG8x015878;
	Fri, 31 May 2024 10:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zyH6LUyq43h2avSORdoqZCLs
	2I7xNLFBnpmRlzWK0+4=; b=GYHCUUvhQ6m8n6jNwTrbD69VRof7ZJ1rH9QjsXBE
	phhkdVNz0A08BUXF2eqf65AEsETa0Sz9pbDV0FNZrCauBZBQY2M07rjd6WLZxM+K
	+Pu8vJV0StkrDkdNnM+FPos7+qibw/yGgrnizQyHpG3whBK4fdTjGZL1QmvmNmFL
	b8T6gX81QbnwqAImrg6yy5heCAh1HpkbHDvp6RwUhpfrr7kaMKdiv+FBziAbOFq9
	zpdURWBlWZIQFuW+a0rVPSHRfSjKtlfE0+OXtsKW8Uy+vG6VfufpJAhthY/2WKol
	prkbB2IJ6TKddTey3G9XChgYDH+yoccmBG383DCkMovq/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n6jjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VANGoW012665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:16 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 03:23:12 -0700
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
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add compatible for QCM6490 boards
Date: Fri, 31 May 2024 15:52:49 +0530
Message-ID: <20240531102252.26061-2-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531102252.26061-1-quic_tdas@quicinc.com>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
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
X-Proofpoint-GUID: _MbkjpjJFWTCdjVhYuvp4u72XPpXIQMY
X-Proofpoint-ORIG-GUID: _MbkjpjJFWTCdjVhYuvp4u72XPpXIQMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310077

Add the new QCM6490 compatible to support the reset functionality for
Low Power Audio subsystem.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
index deee5423d66e..5d6f74cf9c43 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
@@ -26,6 +26,7 @@ properties:
 
   compatible:
     enum:
+      - qcom,qcm6490-lpassaudiocc
       - qcom,sc7280-lpassaoncc
       - qcom,sc7280-lpassaudiocc
       - qcom,sc7280-lpasscorecc
-- 
2.17.1


