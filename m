Return-Path: <linux-arm-msm+bounces-32540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A20986CFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65BD31C2255B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255D2193089;
	Thu, 26 Sep 2024 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z1oe3Lkx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5A018EFC6;
	Thu, 26 Sep 2024 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333739; cv=none; b=cuZnfDPYzyBNPiDdyZiXc3aDMEvQ+s+A7l6+bHWqmkUruazEB6oAbIaSjKnTLx0CTYXwNyOvqzOCf34GMVTaROtMX6BQD1NFDzb1W1e+PFIcpO65HENOmw5HEPpfBQQ6JGfLo8LlDsECUHSzeiwsCGcnfElaY0TshKQWyoFTJAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333739; c=relaxed/simple;
	bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tt88b+9BiVZh4Lk6dBwBZvyL1Ueo3J2mCYVJUvK7W9rER0lUZbREm4ilYnOPbDbu6xYruvQwkudr8+sS7Ti9M+2gD1kdFmAqTSuf0+QeTeEJBgX9gx4k7kzq+/mOgfdR+WUnG8ehWKjyD5RkHCQpw+K/M8gG5I6/2J8HUXD1lg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z1oe3Lkx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5PDg010614;
	Thu, 26 Sep 2024 06:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqm2LjLXE/r1TJLp2pEnHWxRn3Y+3lElNlsr2cs//dg=; b=Z1oe3LkxENYtOUy7
	KjxY5XW0jX6XISspWH3xlCQ4okrcZv0eJqo+sQ+1j546CTVGBph3V2KjnTQ2OceZ
	OrWnHJsHf5Tu+Eny/cmh1dk7z8FCXST6h9qSvzUWOwEdXZN2WvigtnwGztC9PMKI
	xfEW/O6MCErwBeCWQWDZUIoKYvUZxS826QPtWkVIpsGdHapforPpsLmjPe/gixnS
	KrJw+2YDuTw/i1HWag7kWHYeT339G/w2xy5+UlZutKPUbakeNiOjV66gZlbLYidI
	DrhjUQvS1sHZCDoFAOjWiTeWUyKs4I9VisrKU2UoWbUcgamgbDk6HlXwHMO/qpTX
	zhBq0w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6xrqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6tGnX008073
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:17 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 23:55:09 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 26 Sep 2024 14:54:42 +0800
Subject: [PATCH v3 2/7] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240926-add_initial_support_for_qcs615-v3-2-e37617e91c62@quicinc.com>
References: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
In-Reply-To: <20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333702; l=708;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
 b=kvqXIZIbh3/VS0ThfCbtnL9LO0TRDZlMxzh/7kRQF7z0ydechawoh+KyodAOPaW63Vl/t6UTj
 jcz6jKRIOqIDwGv3ZKYDkBT04bWFVoqbfMw++u3W4kER7az6ROIzFww
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LRDKJ3x9rmi4VazUIWOYW0eC8QgoA_-E
X-Proofpoint-ORIG-GUID: LRDKJ3x9rmi4VazUIWOYW0eC8QgoA_-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=742
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260044

Add the ID for the Qualcomm QCS615 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..73a69fc535f6 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -278,6 +278,7 @@
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS615			680
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.46.0


