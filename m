Return-Path: <linux-arm-msm+bounces-20146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CB18CB3B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0509282747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46301149C5E;
	Tue, 21 May 2024 18:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L0MXGCCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C25149015;
	Tue, 21 May 2024 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316849; cv=none; b=G+Ox6kj3FdqUlQQBXufC1QQDyugQ+6lMYoKwonXk6LF93Ijk7SnFVxLC35zAwAwZylbpLyaX6QopNGSfUWOQk+iHSzLdlSC5UgsLkw+Gn0Ge6gN2JEmAkO2Ok7WvO5f5zws0t3jXbkrP3msdS8ury1xMoO+PIeSVW77nvZWKJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316849; c=relaxed/simple;
	bh=fJZRV+CAjyRUT84/2+WIP065O9yKSuj8xXlIDi/4Mgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qPuKLaQCfRfJkN1bnxuBh9aLgUhACNiQ5Vk79h9ntlqsH4spjLq4ZQWMIBoDx+YsAdc43uz6AIXSfO1ZIztCu33h5cv7zZQ41Y8d7EUtYCf7di2FBSxOe+1sxCAW9GFLyKK4RO7yUry3VmZplCW9SZUc3/t9GFq5iqHfRgzOwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L0MXGCCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LB0dRb026034;
	Tue, 21 May 2024 18:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=w9kemqzJHc5KJi/07GjBPv3Z1LtbiWjO0RJr47YrswM
	=; b=L0MXGCCD3LckxCy2bdHIMNbnB4BhahbK2eF0mrXpAflvFA7UMCGtEPy5jCQ
	mtIpy3h97XjW5A42mUsvqv8Hp1XAaLNPgVUV00hqx4X+zjwsN72urkCe4+5yZ7px
	Uknl1Rm410j40iB9HFG/A42XVT6cBAZ2SFNgtQlii2RzJh99jVXZooJ4/C9KG6ca
	+WKcc9X90g1oyU0PaCDGsHdSz55x7pT19K7FulCeX0tA32gBjCwAdxKx4VN4ArUL
	apDrl2LinU8rxGbcTic8z79daik/3fEIL+z8nWdTNYrfu03UrJUxQlx7/O+DTfK4
	P50oyrGH/iJa61XZSZgKykjesbQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tffjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:27 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcQvq014562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:26 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:25 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:37:59 -0700
Subject: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-2-e6c71d05f4d2@quicinc.com>
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
In-Reply-To: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Amrit Anand <quic_amrianan@quicinc.com>,
        Peter Griffin
	<peter.griffin@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Andy
 Gross" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, "Chen-Yu
 Tsai" <wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Jon
 Hunter" <jonathanh@nvidia.org>,
        Michal Simek <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        Elliot Berman <quic_eberman@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jbqTOGfdpodzcZLbBh5dXd8IYSoeJOXS
X-Proofpoint-ORIG-GUID: jbqTOGfdpodzcZLbBh5dXd8IYSoeJOXS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=962
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210139

Device manufcturers frequently ship multiple boards or SKUs under a
single softwre package. These software packages ship multiple devicetree
blobs and require some mechanims to pick the correct DTB for the boards
that use the software package. This patch introduces a common language
for adding board identifiers to devicetrees.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .../devicetree/bindings/board/board-id.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Documentation/devicetree/bindings/board/board-id.yaml
new file mode 100644
index 000000000000..99514aef9718
--- /dev/null
+++ b/Documentation/devicetree/bindings/board/board-id.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/board/board-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: board identifiers
+description: Common property for board-id subnode
+
+maintainers:
+  - Elliot Berman <quic_eberman@quicinc.com>
+
+properties:
+  $nodename:
+    const: '/'
+  board-id:
+    type: object
+    patternProperties:
+      "^.*(?!_str)$":
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+      "^.*_str$":
+        $ref: /schemas/types.yaml#/definitions/string-array
+
+additionalProperties: true

-- 
2.34.1


