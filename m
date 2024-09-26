Return-Path: <linux-arm-msm+bounces-32537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A76986CF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 08:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8588F1C21B75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 06:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD64218B49A;
	Thu, 26 Sep 2024 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iRZoG0KT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB8178CE2;
	Thu, 26 Sep 2024 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727333735; cv=none; b=sJLANyAnx97gNDfSezIAVfiwqXz0MFcI1OCBldTiy+2UjKqk7CFO0McMlwva2+SSUD3wHtXkEYyyf3M7yZsKox9c8kLonJe/TROEb3dCqbNO1e3DkXTOUrxrOEwW632wFP8qY35c+TPb/tliSVnz97aEM4W3eg8gEUPtH7zMj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727333735; c=relaxed/simple;
	bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tPRk2zhWF/lfZw7WDFxr9ui6416X0eEwBvAGW9VI2O/cLL6VanPQJizL0LKuF/ZwHvplJO2ne14f2Py5Sqg5KA6ZizvOjaIkLPnOh8irEMDgcYZB3N2U5IWsTI6gXWes7jsCuL1z4P5caoNZo8nLw4F82da0XbcwiQ0uaHEKNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iRZoG0KT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5NNq010569;
	Thu, 26 Sep 2024 06:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zY6WwSnWBK+sJbMEG9WnEhZquIYMOfDGtRU22+UrV6w=; b=iRZoG0KTASZSRUSA
	EQHxuOlv3p74ivS7Oi4naRqQVqq2ugVaT6xjynlo0EwNVJZf0sdiyK3OKOiH7OH1
	8dY/vMvYM408NyoMImfCKLGuQ8rkbM6wueAa1nD7tnOVKsVwgojjp/gHx+hcIdOb
	NWoN366/x5/m2inFZJaaAZYrIkfZUkyggO1U13Py6ZTefxN2mEa99sdHkZnWZGAW
	TEP0G1Jfj+kDBZ8GWEDk3+RCDxESr4ydihHjMkq5/fNEnvlVat8XCdLICYfi6C/c
	qdkUZxbLC8xsYkEEkI4rwYeoWueW8FZFa1/ngekAkHbx35Q+7Il3qb1kri9LK5Od
	xS+cqQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sph6xrqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q6tK6G031854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 06:55:20 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 23:55:13 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Thu, 26 Sep 2024 14:54:43 +0800
Subject: [PATCH v3 3/7] dt-bindings: qcom,pdc: document QCS615 Power Domain
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240926-add_initial_support_for_qcs615-v3-3-e37617e91c62@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333702; l=871;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=AtswLMPp1Wi7CQvp+HGZVxBi+0M87Go/UAkK7Kw+6RE=;
 b=vi69A2X0tnrLIU7YOElypZV6J3K/AE3yrHuSmsAXhAIFr1eyzcFPPabGr3jO4hxQEqFBooOJI
 oiD0bmuw/fpB3ZfyttLTf78pj2DaZwoxoGc9U/DTUjont1NlK4sArsR
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dGs3OACMHEYKFtu81gCZmCL4oHGpzGRd
X-Proofpoint-ORIG-GUID: dGs3OACMHEYKFtu81gCZmCL4oHGpzGRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxlogscore=829
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260044

Add a compatible for the Power Domain Controller on QCS615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b1ea08a41bb0..ac7ccd989441 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8255p-pdc
           - qcom,sa8775p-pdc

-- 
2.46.0


