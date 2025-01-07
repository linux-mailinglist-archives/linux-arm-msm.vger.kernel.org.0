Return-Path: <linux-arm-msm+bounces-44085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99635A03A73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31E9D3A10AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 09:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F42B1E3780;
	Tue,  7 Jan 2025 09:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P0f62+FF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E386E1E376E;
	Tue,  7 Jan 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736240470; cv=none; b=HKRPK+LN6hjlQCj43hKM9ux2rq2Mkd5wj+r+lr8TrVBtltvxGiQzKZ566fgALCTHQoV6h24ZbORo9GeCLRvRuQF9rGbPZ+CbRL6+Q6Co533g/9WDYiQ+J36CvkFqOqljava0XzZAVNIm0TH7KK8iXbUH6lqTQ4JCjiFzTja5c40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736240470; c=relaxed/simple;
	bh=h7sqaIqWGyqg0LHSJqNMawx2NXhKH0HiwQMGJgNAHKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iqu9kLVOQKuUtdC7tQCFXytBPQqIoq2OzuOJLmAAjmMZSe/T0ih+YfxlGHD1gYlf4aESQk+rr4sC6qquJotxl26orcv8NfNe5YMqZI7R4NxMp+wMg0Bk8W+yBisElia7TN9upNphHmGIipAEOo8XuGQSYci4lWDKUXkpHtQWjg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P0f62+FF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506Mv1lL022313;
	Tue, 7 Jan 2025 09:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3UCEm3eFJ/K1dbabHvxRqJat
	AGq05o5L4VYUe8y+MXM=; b=P0f62+FFwmL7kMHYkgHSc7YzK/ZKz/fVh61Fgnjz
	EMtyNzMnph6BzX0X+9b8ELiQY6IvAdroD0p2nJtJr9xUvTn1yIxb8RmNqp9v4ZUC
	TAQ3zZWSRxeMwYGizN6FuN1A+c8QGJT314eL6Sb8mEwD3AAoDEokEUGg/1Qd+Qku
	WO45KdW9I9KDU8u3DBVLAQolv7nzJ0Cqa0djw1ZeTQBqIscrlewxbFFQAzRkk3nv
	tS2LHP+lqSOlUUit8IJYMLIHft/SGGin632WL++qKBSUnWQmy+JhHgnQJtUDpfYs
	Wd/kLWtI9mb1TEAG+37hkIGHI1LzVaO2fGhLf31DagoIRQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440rdq971g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:00:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50790qT4015469
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 09:00:52 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 01:00:48 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: coresight: Update the pattern of ete node name
Date: Tue, 7 Jan 2025 17:00:30 +0800
Message-ID: <20250107090031.3319-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
References: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 1yM8Pf3hgSJ2Hu9Vko0tHkwtX1vGHp8F
X-Proofpoint-GUID: 1yM8Pf3hgSJ2Hu9Vko0tHkwtX1vGHp8F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070074

The device full name is embedded trace extension. There is no good fit
in generic names list for the embedded trace extension. ETE is abbreviation
of embedded trace extension and the number is the CPU number that ete is
associated. Change the pattern of the node name as it won't affect any
device tree node as of now.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
index f725e6940993..9c2c9ac9705a 100644
--- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
@@ -23,7 +23,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^ete([0-9a-f]+)$"
+    pattern: "^ete(-[0-9]+)?$"
   compatible:
     items:
       - const: arm,embedded-trace-extension
@@ -55,13 +55,13 @@ examples:
 
 # An ETE node without legacy CoreSight connections
   - |
-    ete0 {
+    ete-0 {
       compatible = "arm,embedded-trace-extension";
       cpu = <&cpu_0>;
     };
 # An ETE node with legacy CoreSight connections
   - |
-   ete1 {
+   ete-1 {
       compatible = "arm,embedded-trace-extension";
       cpu = <&cpu_1>;
 
-- 
2.17.1


