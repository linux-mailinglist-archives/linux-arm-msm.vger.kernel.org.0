Return-Path: <linux-arm-msm+bounces-31492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7F9975084
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA3C5B253CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CE118784E;
	Wed, 11 Sep 2024 11:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Inx68+rT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F11187355;
	Wed, 11 Sep 2024 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053081; cv=none; b=YfEImyMPeDhKRcwK56o51XS43CthigJawD0SckaOEc5g03G7ctBYcg0GfqmbkFUXtZHlj+UDoMP1xmoVS6TOWQdv3eEc7LsvySJr252WioWszSraTL4+DzfCbIvAJNruoqJ9LzeBQ2slvOtfeGVVpp6LIycDvGtdFHu9Y4w4upM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053081; c=relaxed/simple;
	bh=Ww4Y3RjSPdo9lCpWGo9q8eP9kW0mh1Uh1ZCVKQz5pvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=L6LDf/7AGDehNYQ+qJp99bkGk4z3I7RubVy7tGcw3vt7F3k+cAswuQXBmwjaZFjlGb6VMRwYJq17d61DclgmpIRHwh3/hXp8pyvt/JkVHn8w2zzS2tNoUpFQcApR3xRnShiwJWfXLgHzrEHsccWpaS337RRSLwvjEhRjvTMqFoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Inx68+rT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B332Nh024935;
	Wed, 11 Sep 2024 11:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kdNAsJ+KBOg007XOJddlzwWK5X8K1Z0PTIy6zjGXUlQ=; b=Inx68+rT/36uJLUa
	kbheGiidYFTqsc5liaBqPm6jh4b7uHOG5/enjnmMiBS4EKh//j8keeVnLkzTNWgt
	fLmnQPn9o2wFUjS/i+A9xTXucs4cZN13rdQNfn0LU8e1KRJZ7UciNBSxR5Z+daDt
	+za7idOBSaTHecH/GeCr37HyinjHz5zWUjj75oIhLn39CAA8NREdnYIbnZcrzHLJ
	72j9bI2on44XzLzflagSgfVhW+wg3TFm8WccjorjF03lzIWRL+QYCFXGgOodEV7z
	1EWivP741UtlXCB32b/T+kwyQk4wKCylg046kftPi1vElnHila9n+nS0Agxhj3V0
	8a2NvQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy731d7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BBBE9A016669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:14 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 04:11:09 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Wed, 11 Sep 2024 19:10:55 +0800
Subject: [PATCH v2 1/4] dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240911-add_qcs9100_support-v2-1-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726053065; l=691;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=Ww4Y3RjSPdo9lCpWGo9q8eP9kW0mh1Uh1ZCVKQz5pvk=;
 b=MSg2ZFlA34yuiFNqaCRbiP+HnhGUpRAu4tzMUecwqoVzKDgg1lIGL/ShX1hPb1YY+2IkAAXJv
 /7eBEdSaTDlDz5z08/3OrIgm/T7PCYeA0M9dInL/MaEippbyWdmBAF/
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5bcjMOjGz7tREuemF4fZ5_K83BM4GWqL
X-Proofpoint-GUID: 5bcjMOjGz7tREuemF4fZ5_K83BM4GWqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=555 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110083

Add the ID for the Qualcomm QCS9100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8332f8d82f96..c187a60d4d1f 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -276,6 +276,7 @@
 #define QCOM_ID_QCM8550			604
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
+#define QCOM_ID_QCS9100			667
 #define QCOM_ID_QCS8300			674
 #define QCOM_ID_QCS8275			675
 

-- 
2.25.1


