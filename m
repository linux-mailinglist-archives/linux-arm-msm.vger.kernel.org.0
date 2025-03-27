Return-Path: <linux-arm-msm+bounces-52599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D836AA72CD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 10:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9E21898D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8046520D512;
	Thu, 27 Mar 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zo70I43q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13220D50A;
	Thu, 27 Mar 2025 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069223; cv=none; b=qIHKdVetQRHOboES1BK4Xr/3XoI33cs+xZD1sPp52yM7znpGPYl5jByU8v7UJtgxXJeK/LViJYQGrR7bGMRnjMJYtBeDw+EzjKnSAu3lAN5WqZJvJttrZLp6MNbjUOY4v2bxtK4kWWE74H6ZXGVz47NG+icyO5xOQJEuy4TE7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069223; c=relaxed/simple;
	bh=21cqXTg8DlrxhVMKjdIHaSy4+lNuMZuCwFFfa07torQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bog7rQavLdq66Vk3Q6AnMjLvbyUerL37ihL+Mv/oXenkb/zWdD95xYKzLk5iiH0dgVXVfl0GAf4LsF5yjzcZBo9B/5of0k+FGiBXFtLQTXdHRHYQFSlZL/tRjP9K5XX9MsxUshu0tUtZN6gjO2HtRNrkDbsxA8MH8OmaZP0mQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zo70I43q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jG8V013778;
	Thu, 27 Mar 2025 09:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUL2y8wQg/7LCPaMeEFTYomy2Uv+qaXI9wNras7/G8Q=; b=Zo70I43qr9Ofy3Oz
	w//8g2uAQZDmgYg4+i2yo4CqRG9h2FupFyaNK2MiErg0FWVk6OfEeC9J7d5igQs6
	EIs5/dh5vXYYdK/EbMgkUbWELijqfY3C2GyzAcmKmmo1I9Lix2k0MWVWU0/aYfZK
	y/1ToWdccx1MJw7OStO+Q2u2kLsDquZMVrkSidbhT/+fthKWsQVS4ELnMAWPnFs1
	c5GHlNZOkQIIn6FnVBaDtajZjXcFVZvD0YDJGIu1pduy3GMCfQ8WCDmxP8BD3TqR
	n0jTYezxuXuMkfXGkthl3hDFa5e1NM8X8vjZZBDMvCbGSf3F3AnxdI4lf+3d4Isp
	P8QA1g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffckfw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R9radB006571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:53:36 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Mar
 2025 02:53:30 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 27 Mar 2025 15:22:22 +0530
Subject: [PATCH v3 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250327-videocc-pll-multi-pd-voting-v3-2-895fafd62627@quicinc.com>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov
	<lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e52021 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=pUiOsZUKJ4xO5yAaYNEA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9DpKpW1ax0c5NuA2-tWRZeHfz6L-dEw2
X-Proofpoint-ORIG-GUID: 9DpKpW1ax0c5NuA2-tWRZeHfz6L-dEw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=771 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270066

Move SC8280XP camcc bindings from SM8450 to SA8775P camcc.
SC8280XP camcc only requires the MMCX power domain, unlike
SM8450 camcc which will now support both MMCX and MXC power
domains.

Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml | 2 ++
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml  | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
index 81623f59d11d73839e5c551411a52427e2f28415..127c369dd452608e5e7a52c7297b6b343d1c1bf8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -17,12 +17,14 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,qcs8300-camcc.h
     include/dt-bindings/clock/qcom,sa8775p-camcc.h
+    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
 
 properties:
   compatible:
     enum:
       - qcom,qcs8300-camcc
       - qcom,sa8775p-camcc
+      - qcom,sc8280xp-camcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 9e79f8fec437b9aecb5103092f6ff2ad1cd42626..883f12e3d11fa16384108434f6de120162226a28 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -15,7 +15,6 @@ description: |
   domains on SM8450.
 
   See also:
-    include/dt-bindings/clock/qcom,sc8280xp-camcc.h
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
@@ -23,7 +22,6 @@ description: |
 properties:
   compatible:
     enum:
-      - qcom,sc8280xp-camcc
       - qcom,sm8450-camcc
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc

-- 
2.34.1


