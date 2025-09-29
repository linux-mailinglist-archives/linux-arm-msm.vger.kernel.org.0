Return-Path: <linux-arm-msm+bounces-75502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26949BA90A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 13:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87F043AD04A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FAF3009F2;
	Mon, 29 Sep 2025 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AkKecnYe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660B29D289;
	Mon, 29 Sep 2025 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759145756; cv=none; b=JomMe0jYJiZx2EkInog6cf9RqtP6Uv4iI2elt+X/u2jybXqQ31OXuryBa5oFEvZilzA6uOFnHIB+qOy2N3VpCBZsqgni9vLbEKv1kvdXmceJ9v8H2m5sED5/mHGT9+tmT0PJi5yHvuVcw/U9YDSPIkwZYyEoluOdd2y2vSLRwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759145756; c=relaxed/simple;
	bh=N8aGMvEs+6YWczAbfQM3PGgz4vkhjXeMjxj1/7Egs8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CaF8t6fvJ0CrdDkwOa1hX8ZUGPQ5eWQy0sBr84SCZRMzNPqSX4DZXZ/zsUbWkrKOl+G+i80AxL7dgaP6ZHszMDwQ/rUUD+pizxJjn5LPfCKyDNALtqWynEV/O+5++1aqakWiRNSu0vm3bxK9VvZfX/AZpgTzO+jUYMMtHo0DzY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AkKecnYe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T9eYPM005609;
	Mon, 29 Sep 2025 11:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9vBYvBvC0kw
	Z2+dNivYM4ivf+0gWpVuIFaI/hGbDLBM=; b=AkKecnYeyoPn4gwtPXjINU4nbhr
	DoWWoFTwpxOi+6IngB9BlZ8YAv9MxzTU7IAZalgn7HTZ0vdcUShRD+KE3WOpZYUD
	w7IZFVmueEO40ZVQNTuDAe8qt8BIpiloB2PxtmNUw3liCgxyQtDdhvsfI/ED6V5A
	QTSDuXTPrnPZ/huDozXQqDfIpiliTfLeYwLXFK8iWSTdpqRk0qrsFBWmfcCh6JdL
	WXke8WyYSF4NLTqgx/j4DV2dZeYpqdhgfastEwEXw7yODcDcPnVg3nBlbUA6jdd/
	ldhvTwUWpdDGzgo8qS41MqzkuT63uJ839PwfrI0N6Duzv+QhQ+/Vqlg+ptA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqw0ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58TBZk1B008895;
	Mon, 29 Sep 2025 11:35:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49e90kvy61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58TBZkjM008890;
	Mon, 29 Sep 2025 11:35:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 58TBZkNg008887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Sep 2025 11:35:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 3E5895D0; Mon, 29 Sep 2025 17:05:45 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v4 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and HS200 modes
Date: Mon, 29 Sep 2025 17:05:12 +0530
Message-Id: <20250929113515.26752-2-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929113515.26752-1-quic_rampraka@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Brr7V5Mgd2PX40V-jxn-9KAPdkqSaRPm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXwFuYNocTkprK
 C3yO+hdP7G5x30Ad/E6Usxds0NMnSilVeKZp0MaoPeFVqhHReTOQARP304BG80yfVKDjRds5vKd
 v43jJNZh5p+mGryNXChHYzfrNjuZa2cwyoH/sAk90IJjTzKze51F9L5iSLjVmYsI/MNt2wbF1KM
 v3TsNH0yoaHZkUKJSAyg1bgc3/ebkDPk4mx97XF/+nmKsA0jvfmqVdZgUNWZLulID3jFODk3zui
 rRe1PwHiyCliBx+lNSFBj/br3R88PbWUKDShzPxcL52c2sa2GwVeg3me8An6fzrzQy6Flnrp0xB
 n0zwKwkKXAGffnVUwn1xSrwYVaeoIpw3ck7Ag0uVHLN3gukdJ8QsHpOyDFmnpJLPzONpzMMulWp
 T2llLY31IAp8DlwXV011K6zD/1vaVg==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da6f15 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=vHOnQIpKCKEMfiAZHeEA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: Brr7V5Mgd2PX40V-jxn-9KAPdkqSaRPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Document the 'dll-hsr-list' property for MMC device tree bindings.
The 'dll-hsr-list' property defines the DLL configurations for HS400
and HS200 modes.

QC SoCs can have 0 to 4 SDHCI instances, and each one may need
different tuning.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 22d1f50c3fd1..a60222473990 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -137,6 +137,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: platform specific settings for DLL_CONFIG reg.
 
+  qcom,dll-hsr-list:
+    maxItems: 10
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: platform specific settings for DLL registers.
+
   iommus:
     minItems: 1
     maxItems: 8
-- 
2.34.1


