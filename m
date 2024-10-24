Return-Path: <linux-arm-msm+bounces-35690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE69AE6B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3DB21C22820
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267B51F585D;
	Thu, 24 Oct 2024 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zshhtt6l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13DA1F5832;
	Thu, 24 Oct 2024 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776722; cv=none; b=UbnwBTzh4jM6DmQq5kAyIy0ObtGC/67oyEY5Q/780EeV1P2dX4YpWYr2x1WjwQ8LFjkpxbUs5Y3Q8FoN1yLWnBxh8fwTTLLXQXaGeL/F98ofhao5BDnY0NywraRIM7K3lwv0+E9+tTqkOUa8fxrQTraVff1OjX8qg/phgIcXX7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776722; c=relaxed/simple;
	bh=67FVR1NJ1kKoMK08GxB7Tiqlx7E99d8fivrq9nHc6Ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B255C2WHvNQtsvpZ70K6tlYBKMLyMp088q7mPiN4UQX/M0NWiXjblMr9SPwtBvuiS3bi+4uXEwMO8U5EDOIK8FFw0rdRBZHDMc6YH/7bQxMoyT1S+qMNYnb21ojvMAUvMme5WxxQ+QUf6qe24xoPuyS5qbOMygp0EEIvdBDEYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zshhtt6l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O8rllI031148;
	Thu, 24 Oct 2024 13:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB5659tbRJphbUUbtRZBuaVOYMcMiRdBiXEgTSGMymU=; b=Zshhtt6l7C/BgHS5
	SmmDwBvQUm++sVQ34d2oLJId4bL9pUs26etY0eAsSxfRQ3sWXbKsndCDwf0IBj3k
	eCGGtMg+HzRA+dRoVxWVjpSprNWvtXTTNK9NlNDnsjR7J+9k4AkFPBej/sEznNIx
	R/UumBML9c8bsRgkfPfS5Nf+JWtDJ8sIEk0rHU4IcyzPtmKLQ8FhQbnIrHk0BK1M
	x5pXXzmz0KuKV5Fr85tX32xcsUbljK0tjPh1t++z44Ff7mQ0hYCjZLNmIui7s3EO
	ipsDQ7vPmt3xkGa7RD82Nkk4sza6Qj43g0wofpWFTYsUSoUPJafyeN0RBqFtPldj
	M0Palw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3vwug8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODVpXu024033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:31:51 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:31:47 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:16 +0530
Subject: [PATCH v2 3/6] dt-bindings: clock: qcom: Add CAMCC clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-3-76c905060d0a@quicinc.com>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HO-X79z15BZkt5klnbaenLeYNG8xxn2H
X-Proofpoint-ORIG-GUID: HO-X79z15BZkt5klnbaenLeYNG8xxn2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=1
 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=912 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

The QCS8300 camera clock controller is mostly identical to SA8775P, but
QCS8300 has one additional clock and minor differences. Hence, reuse the
SA8775P camera bindings and add additional clock required for QCS8300.

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


