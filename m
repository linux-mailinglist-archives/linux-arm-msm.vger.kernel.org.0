Return-Path: <linux-arm-msm+bounces-20274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409BE8CC9F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 01:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78806B21107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E7D1487C6;
	Wed, 22 May 2024 23:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ldjcPls5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AF82E631;
	Wed, 22 May 2024 23:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422094; cv=none; b=edIl5rTn8VJdrZwTv3wx5g9FkChM3Tl6eA2nEM2VqZpj2U2pz54sfL5uBxnJOzUtArXggwfssvW49raEEIDaTXUifc70QougIhkuSybi2BwhLdVvjHjQrpmGoJ11or+v52i+FletQKB3FMuRgWRJcsMjvtPHhfE41cGQQwDf9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422094; c=relaxed/simple;
	bh=Wzxdnp5XO5Gk8JeUZhpdnJbMxxnyzhO4T7hcTyJAUq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jdqOrqHjG3v3BT7TTgN7IqCxlNjkgOOn5P3v/bs9VONrqoOU2urF+DBZ9wieQxRmpJWqzSmXqSQWGii2o7VDkDew+blwufXUgyqAlPPj9Nr9CZpXRYK4MJWc0zZO+rvYvtbOzfFJzJucTnag9ViY09uWF0xlQRJ27hZI6inV6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ldjcPls5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44MKvvYt001874;
	Wed, 22 May 2024 23:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xtjs0+95UyS0oZvi0YIw5LIDSHAwyXY4Y6Fx3l5/VrI=; b=ld
	jcPls5oQfxFkhZqqlqDRr7yHDxetqexBX/EJ5161qkKp47daq+gpE8JqDEfPl1/w
	BDf7wPkOEJL2AptBh7fplrI6SU+4oFKfZ8pAQrRZbKvk0raiMp31U+6fqyG4zsvU
	XhfRS3sorD9s/JP094v6TjoQXF1ohvT1V2ijDtllDDfMq7OzvA5R2lEDCny1IDsj
	1lN5zaKGh2o2Rw/zLX+rR2pyAnlS7KawR65IWD4COcb479u205mpWxIjES2ebkLH
	3IIlGGpFrGDqH7VDBFfwdwjnHr6BZt8/C0KeKYfwmgTxJAvKm5zpJZd1u17UBF4w
	OLf5hD5CuOgqoIW5EOkw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pq5j9x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:54:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44MNsbYG029337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 23:54:37 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 16:54:37 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Frank
 Rowand" <frowand.list@gmail.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Amrit Anand <quic_amrianan@quicinc.com>,
        "Peter
 Griffin" <peter.griffin@linaro.org>,
        Caleb Connolly
	<caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>, Doug Anderson
	<dianders@chromium.org>,
        Simon Glass <sjg@chromium.org>, Chen-Yu Tsai
	<wenst@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Michal
 Simek" <michal.simek@amd.com>,
        <boot-architecture@lists.linaro.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH RFC v3 2/9] dt-bindings: board: Introduce board-id
Date: Wed, 22 May 2024 16:54:23 -0700
Message-ID: <20240522-board-ids-v4-2-a173277987f5@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240522162545887-0700.eberman@hu-eberman-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DpkhxoH8UqRFLEMMCaRQiDEKebv4G9j2
X-Proofpoint-ORIG-GUID: DpkhxoH8UqRFLEMMCaRQiDEKebv4G9j2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_13,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220166

Device manufcturers frequently ship multiple boards or SKUs under a
single softwre package. These software packages ship multiple devicetree
blobs and require some mechanims to pick the correct DTB for the boards
that use the software package. This patch introduces a common language
for adding board identifiers to devicetrees.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .../devicetree/bindings/board/board-id.yaml        | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/board-id.yaml b/Documentation/devicetree/bindings/board/board-id.yaml
new file mode 100644
index 000000000000..894c1e310cbd
--- /dev/null
+++ b/Documentation/devicetree/bindings/board/board-id.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/board/board-id.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Board identifiers
+description: |
+  This node contains a list of identifier values for the board(s) supported by
+  this devicetree. Identifier values are either N-tuples of integers or a
+  string. The number of items for an N-tuple identifer is determined by the
+  property name. String identifiers must be suffixed with "-string".
+
+  Every identifier in the devicetree must have a matching value from the board
+  to be considered a valid devicetree for the board. In other words: if
+  multiple identifiers are present in the board-id and one identifier doesn't
+  match against the board, then the devicetree is not applicable. Note this is
+  not the case where the the board can provide more identifiers than the
+  devicetree describes: those additional identifers can be ignored.
+
+  Identifiers in the devicetree can describe multiple possible valid values,
+  such as revision 1 and revision 2.
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
+      "^.*(?<!-string)$":
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description: |
+          List of values that match boards this devicetree applies to.
+          A bootloader checks whether any of the values in this list
+          match against the board's value.
+
+          The number of items per tuple is determined by the property name,
+          see the vendor-specific board-id bindings.
+      "^.*-string$":
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: |
+          List of strings that match boards this devicetree applies to.
+          A bootloader checks whether any of the strings in this list
+          match against the board's string representation.
+
+          String-based matching requires properties to be suffixed with
+          -string so that a bootloader can match values without otherwise
+          knowing the meaning of the identifier.
+
+examples:
+  - |
+    / {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "example";
+      board-id {
+        // this works with any boards where:
+        // some-hw-id = 1, other-hw-id = 1, some-id-string = "cat"
+        // some-hw-id = 1, other-hw-id = 1, some-id-string = "kitten"
+        // some-hw-id = 1, other-hw-id = 2, some-id-string = "cat"
+        // some-hw-id = 1, other-hw-id = 2, some-id-string = "kitten"
+        some-hw-id = <1>; // some-hw-id must be "1"
+        other-hw-id = <1>, <2>; // other-hw-id must be "1" or "2"
+        some-id-string = "cat", "kitten"; // some-id-string must be "cat" or "kitten"
+      };
+    };
+
+additionalProperties: true

-- 
2.34.1

