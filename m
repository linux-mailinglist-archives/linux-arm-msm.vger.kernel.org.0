Return-Path: <linux-arm-msm+bounces-61790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E6ADFE49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 09:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09DAD188FE09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0922B259CAB;
	Thu, 19 Jun 2025 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OBapyA5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A32571C5;
	Thu, 19 Jun 2025 07:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316578; cv=none; b=Uj8yRHOqNQ2hfOSCQRM9f2BV1VZw75lLltU/iSBoZwW3cwOA7Dj42szEmQWcLciZ1QmYwuEahsW6/zUwpSTnR4BHi0mZJSK6pceSzijQGgsNHbtUVbxuRK4+rP+z5jLOQnU5WhSkMk9QDfnIFiQ7Md/8otQHwhyQzDcPaPF8rZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316578; c=relaxed/simple;
	bh=2JI+YfrowwwUcoBJ2M58P69wLwPAB2vYNKdweZuO4VU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qrRGS50VKbWML9jebiYR3ME5v6wqS99EkOWVCdcxaFe5svGkIzVZ2J3r0UIOxOkMBKJAmBwi0CfS7S6brSj3O6Tndgwh3sSspHjmsVPUR+PWCx9N4pFR5SszHXw2AnaLbuDb7cfIvZbWrrBjXjU3YEq21hq1lucHlQF4/cHcB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OBapyA5P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IInDMZ032248;
	Thu, 19 Jun 2025 07:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3GFLc6L3D05CPEwQBB+vavRm
	RtyzaTOYISZFCs6voPo=; b=OBapyA5PvRDkMzwToP8VVdyisAu1gouZ978+gFit
	vqjxYEMYuvJfW4KnkxvbZuTy++Rki14clcxd8F4qYqlUI77Aa6cRLtv5VrEsU/pT
	X3ncDhgfkmS5a9cR4YwkOM4ymi4y75OI6uC6rT+4Ocu1OhxVGPrwlaAm0Lv7yhO3
	VQEQi+Im3CiDeKx9EYHjMn2/Y0FCGfVMr550N5489fTk0R2ljUwHdKMRz7nTLokb
	0OMtKO9V4xqEei9jHmm92oA1MqEjdxzwmIITHxk69SCzyLoiQz1RwJXzSkVyW6N4
	bDEznK/6yTk2hRKErwOCZH1YneDTrrMcTyoKwutX+WVHjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mpty9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55J72r3G012880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:53 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 00:02:50 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/2] dt-bindings: mmc: Add sdhci compatible for qcs8300
Date: Thu, 19 Jun 2025 12:32:24 +0530
Message-ID: <20250619070224.23428-3-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250619070224.23428-1-quic_sayalil@quicinc.com>
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA1OCBTYWx0ZWRfXwkxcYSgfCRii
 zZJ7eaFF+COiK8GnyBZydZyaInPXAKz0OkLigOqg3pLEp58yzX3bH5HJOGTKCnyu/RhKRsoDORA
 6ywkzANzce3/YAveLwYCFvsvj5PDDg+TZYNiU96YF82dqFvyX052VJVBkIuTQZDz4z0A0ZHyOhS
 kmwuAH7K7cttcjKxZOw4CJ8f7GAinzhyw7z1zQV2TTty0JtQZlzcF0XoAuanh84vgk45OuJntko
 6g/CJ2lkLv7rb3bsBKmxLEiRushB98CcP3XH2HUii/VThanqoCSnBy5BB6Boc393zRZwJEkCiPT
 zlmV5L64ANL3jkCbH/kiEPndeLn2jcSmAII/rOweKgNZI7qytlz7AC6UB5WLp8yGi1n7nI6iUCC
 M//ALOaokaUnkAnwkKXYT1s7oAqGF6GUh9evXuGdWX9OkVa+eCoL3loouLm+eCm06QOBAg46
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6853b61e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=KZcgMjtcvL42mtwMZ7kA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f-YML77QkSEyOTHui74vePQSGpR5N2Nt
X-Proofpoint-ORIG-GUID: f-YML77QkSEyOTHui74vePQSGpR5N2Nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=761 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190058

Document the sdhci compatible for Qualcomm qcs8300
to support function for emmc on the Soc.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 2b2cbce2458b..5ba2da8dbc7d 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -45,6 +45,7 @@ properties:
               - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
               - qcom,qcs615-sdhci
+              - qcom,qcs8300-sdhci
               - qcom,qdu1000-sdhci
               - qcom,sar2130p-sdhci
               - qcom,sc7180-sdhci
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


