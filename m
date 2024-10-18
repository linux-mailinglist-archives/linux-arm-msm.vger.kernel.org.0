Return-Path: <linux-arm-msm+bounces-34946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728999A3CF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B39C1C20B48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC881202F6F;
	Fri, 18 Oct 2024 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="baemcu1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542E7202F9F;
	Fri, 18 Oct 2024 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249990; cv=none; b=BwRAv5a2gzx5Oi2gEImZW637wsT5762p5XunH5sh9sqtZIxpwRazag9KHQsPal358iRN7QvqlxhMw1pcO8Ob+2XHpfGwzKh/1ALobIRAjGJK0m9IHwcQLwW0+1UE76mFrhh3TlJnSHCHkMRdiyYnk4fGq9qFVT4ahhOfYdkN+Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249990; c=relaxed/simple;
	bh=M57XZNBnA1wQlrIJdsAcTtBv9RE1VBTqkxhYnLkDYz0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UZ9e+5EJigb/VYAzePAJrhnsC9fXtzbFf9/a21m6dvD7lTHuXl1zoQfrmQWUYzozdi7LeRsIA/+l2LXxmAuUk8aV5xhEycIaYxNQx+LIeRHxLTUHGcOjCgipbxCFmAfMK94BWQwFKomoBm+2W46AzOeUWuJr6CQgKiQ9efSTOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=baemcu1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4ABll007525;
	Fri, 18 Oct 2024 11:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUMMlBQSU9tptNLOErIRoYwyzPosH6EvgoD54RUGEwM=; b=baemcu1RxfOetE+a
	Zps3dcL9qK08BZx205cMEZmW9v23PBODdV5d9415UTPPWFnLalDPdgMqHUVWg0Jo
	62LG5jAH/md3/MWFOD+XLlKMoT+QJBL3qLB96gklvOJRJ/mThnuZz6eV8GppfAoQ
	8QaPrTjJtiyKjv+jV6b5EVO1A6eFyq6JkvN18gzW4xPhGEtP69SMkK55LrWwkz31
	ESjOQNxSB7qWdXrxM3Q2a2V2jVxEfcD0r9rpxyqaAOBrLrsfDoLb4IDibSa3fZOA
	t0YMWzDj0Sfi17KUZY8LV1KEdx7okfcCgykDwy3bx+M7D8LG2HeG4EZQdTYCxW0/
	vsQqmA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42athc4xac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IBD4f4013923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:04 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 04:13:00 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 18 Oct 2024 16:42:31 +0530
Subject: [PATCH 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-qcs8300-mm-patches-v1-3-859095e0776c@quicinc.com>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
In-Reply-To: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aNIPJq2qb3hptPyR40Cp33L37wsPoed3
X-Proofpoint-ORIG-GUID: aNIPJq2qb3hptPyR40Cp33L37wsPoed3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 mlxlogscore=813 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180071

Add support for qcom camera clock controller bindings for QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 1 +
 include/dt-bindings/clock/qcom,sa8775p-camcc.h                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
index 36a60d8f5ae3..18cbc23b9a07 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-camcc
       - qcom,sa8775p-camcc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,sa8775p-camcc.h b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
index 38531acd699f..36ac587a981a 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-camcc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
@@ -93,6 +93,7 @@
 #define CAM_CC_SM_OBS_CLK					83
 #define CAM_CC_XO_CLK_SRC					84
 #define CAM_CC_QDSS_DEBUG_XO_CLK				85
+#define CAM_CC_TITAN_TOP_ACCU_SHIFT_CLK				86
 
 /* CAM_CC power domains */
 #define CAM_CC_TITAN_TOP_GDSC					0

-- 
2.25.1


