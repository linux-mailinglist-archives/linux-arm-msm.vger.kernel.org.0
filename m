Return-Path: <linux-arm-msm+bounces-31702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9772977EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FCCAB2337B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 11:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC3D1D88BC;
	Fri, 13 Sep 2024 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kiYloyEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1D1D67B8;
	Fri, 13 Sep 2024 11:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228565; cv=none; b=UeEcj4q6uSRRu/Xgnn9IVRRlM0ZdvB3NrjYmSSyT/y2rxxHNkQyVdDiatmf4Gf9H/3YqDmOzhOiPCGBzXyf/e99o4kfvElGChNXEZkvfWq4mUZN4StZVhkjrFhGrQDQppP/HkLIKLY3MUEodb7IH3QDLsmCiz4Lgj58lPg7hRdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228565; c=relaxed/simple;
	bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nrVbrdrR8zagJ3TjLBGRfmFvv2Z56ykDekAVIImp8JYdy7c+1NyqWK2fTY1UU4zAKRhm+M7+uVRA5Yfb7kPNIbvqERsVUCDbJf3SQk/fyzYeSbR3OHK3PWcNIsSOxhfBeBWw2gEu8spcQlFwCuHfWE6Ezs4wUR3jss1JqGWDuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kiYloyEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAnPDN020973;
	Fri, 13 Sep 2024 11:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqm2LjLXE/r1TJLp2pEnHWxRn3Y+3lElNlsr2cs//dg=; b=kiYloyEmC43aP2xc
	xMHRL3Ss61JriTTRoGPBIwjzwIln3ULxQsjnnchi4pYD7vKViIUufuBYIvLczv9T
	fCrnrks0bbb6QWjpfp2fFHZoKMCnlcDW8VsrBFVV4G4hfq52k02nrLwRra3XjzZ0
	yeZW201uDLaqrIRReq3+p/3zZHYRWx7vqZpyq0pawgecxjKgKSjTiFgfKbw5mFvX
	ztCBOCRah2Epl7MIv1ghvpU1+m1R4jpYsKx5FGyDDR6RjPrh3hP0PKEko+w3G9S7
	JV3zKZ6CI0NOdf2pD1k8cFgU93FUCFqIRWNh+XKSw17sacqxpE1NiC9NwkI3lDBu
	5JsD2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pgjk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DBtk4n011210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:55:47 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Sep 2024 04:55:41 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 13 Sep 2024 19:55:24 +0800
Subject: [PATCH v2 2/6] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240913-add_initial_support_for_qcs615-v2-2-9236223e7dab@quicinc.com>
References: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
In-Reply-To: <20240913-add_initial_support_for_qcs615-v2-0-9236223e7dab@quicinc.com>
To: <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Thomas
 Gleixner" <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726228536; l=708;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=gIP0/TCZdf9SS0xaxin/HqkuUE20HR2NpxJlMV7qgmE=;
 b=FoQCiFKkY07HVekMWfqtY6XC+rF8C9v+Vib7VVdWsywEH5Rb7jrK5E5n6Ic73BKYKYYlQ1C4e
 Dcyn5XjKbt6DtCWwfWSa0IKOalp6AX1ZPsECizZDUGvyF+LDI0l6Sic
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7LRxZnoGwmj5a2vmAqcurzxpB62OKniX
X-Proofpoint-GUID: 7LRxZnoGwmj5a2vmAqcurzxpB62OKniX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=594 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130083

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


