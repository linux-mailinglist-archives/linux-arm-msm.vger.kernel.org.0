Return-Path: <linux-arm-msm+bounces-20141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED28CB3A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 20:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647A31C20949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 18:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF4714901A;
	Tue, 21 May 2024 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gMRYkvEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666214885B;
	Tue, 21 May 2024 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716316847; cv=none; b=LJp2VQjib8uYFOGFNa4Ficey9F1FERe50443QEVQyz4gdhZdBfNrIZ+nnX5TRDyX2wMmf53umlKytFMAThxKRpzboFEBkgsnAOI0EXbJpHSn42Wynsezz8g204CrU4n3dx6Wu5GPMhHjGiCkUYa8NPQ4YjTL4YkslVGn+42W5Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716316847; c=relaxed/simple;
	bh=OTITmJIZA4Si7HogVcomdp51IgM6xst+VrN7IdSaVf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jdLFUW8brDzLxMRrQH/33hiv3aBApEpt4HyFacV8d1nph5tsBkYrbfB5EcbC8oTJZXOe3pxL0HHQ31ukJfflj3zM9jLTzYuIxiDH88nLC4lN81PhtUH1sO8HKCAq/4BUroNpYclm1cm3nd9w/pPeAn+U7oVuBiy5mqZtjMs9uIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gMRYkvEp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAFSRP010132;
	Tue, 21 May 2024 18:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=4tK395E3BNGPnsTLc8oXzJKzHE9Y3VtZZSlaaRbRHOc
	=; b=gMRYkvEpd9ILWOxDx/URCWTGEeoR+6mjzSTDpC8cyjgCyNJkzywxf/3L/uK
	WtUklj77XwhgYgDZYcn5A/ytu6kvdasYI/l14kI9+zUDQUce4l4qJAf/r2ou4ZYS
	f2GTYUDvdb8WCZKBf34tuA80uxoXcLUWcdCE/uw3sikdgn6TlQ0tqUMubGtLDJtd
	epoRbBCymrGk4PAhZngjUoYpQoMXYWHXdGo/HrQniPLQQCf1xIKjINTrbcgBbkug
	JPX8aI1i/MOxyZJdKSca02AZmEgyIuwMA7NCnWCgJh+cNhWczM7M1YP9P+Rr0csy
	T83S3dEzP/pCj4hEL6VolDYz7ZA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqapmmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LIcRMg016643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 18:38:28 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 11:38:27 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
Date: Tue, 21 May 2024 11:38:02 -0700
Subject: [PATCH RFC v3 5/9] dt-bindings: board: Document board-ids for
 Qualcomm devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240521-board-ids-v3-5-e6c71d05f4d2@quicinc.com>
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
X-Proofpoint-GUID: wzhMXF8efEPNHx8infPzGAvwXcwa_CcT
X-Proofpoint-ORIG-GUID: wzhMXF8efEPNHx8infPzGAvwXcwa_CcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_11,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405210140

Document board identifiers for devices from Qualcomm Technologies, Inc.
These platforms are described with two mechanisms: the hardware SoC
registers and the "CDT" which is in a RO storage.

The hardware SoC registers describe both the SoC (e.g. SM8650, SC7180)
as well as revision. Add qcom,soc to describe only the SoC itself and
qcom,soc-version when the devicetree only works with a certain revision.

The CDT describes all other information about the board/platform.
Besides the platform type (e.g. MTP, ADP, CRD), there are 3 further
levels of versioning as well as additional fields to describe the PMIC
and boot storage device attached. The 3 levels of versioning are a
subtype, major, and minor version of the platform. Support describing
just the platform type (qcom,platform), the platform type and subtype
(qcom,platform-type), and all 4 numbers (qcom,platform-version).

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .../devicetree/bindings/board/qcom,board-id.yaml   | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/Documentation/devicetree/bindings/board/qcom,board-id.yaml b/Documentation/devicetree/bindings/board/qcom,board-id.yaml
new file mode 100644
index 000000000000..53ba7acab4c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/board/qcom,board-id.yaml
@@ -0,0 +1,144 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/board/qcom,board-id.yaml
+$schema: http://devicetree.org/meta-schemas/core.yaml
+
+title: Board identifiers for devices from Qualcomm Technologies, Inc.
+description: Board identifiers for devices from Qualcomm Technologies, Inc.
+
+maintainers:
+  - Elliot Berman <quic_eberman@quicinc.com>
+
+properties:
+  $nodename:
+    const: 'board-id'
+
+  qcom,soc:
+    description:
+      List of Qualcomm SoCs this devicetree is applicable to.
+
+  qcom,soc-version:
+    items:
+      items:
+        - description: Qualcomm SoC identifier
+        - description: SoC version
+
+  qcom,platform:
+    description:
+      List of Qualcomm platforms this devicetree is applicable to.
+
+  qcom,platform-type:
+    items:
+      items:
+        - description: Qualcomm platform type identifier
+        - description: Qualcomm platform subtype
+
+  qcom,platform-version:
+    items:
+      items:
+        - description: Qualcomm platform type identifier
+        - description: Qualcomm platform subtype
+        - description: Qualcomm platform major and minor version.
+
+  qcom,boot-device:
+    description:
+      Boot device type
+
+  qcom,pmic:
+    description:
+      List of Qualcomm PMIC attaches
+
+  qcom,pmic-id:
+    items:
+      items:
+        - description: Qualcomm PMIC identifier
+        - description: Qualcomm PMIC revision
+
+allOf:
+  # either describe soc or soc-version; it's confusing to have both
+  - if:
+      properties:
+        qcom,soc: true
+    then:
+      properties:
+        qcom,soc-version: false
+  - if:
+      properties:
+        qcom,soc-version: true
+    then:
+      properties:
+        qcom,soc: false
+
+  # describe one of platform, platform-type, or platform-version; it's confusing to have multiple
+  - if:
+    properties:
+      qcom,platform: true
+    then:
+      properties:
+        qcom,platform-type: false
+        qcom,platform-version: false
+  - if:
+    properties:
+      qcom,platform-type: true
+    then:
+      properties:
+        qcom,platform: false
+        qcom,platform-version: false
+  - if:
+    properties:
+      qcom,platform: true
+    then:
+      properties:
+        qcom,platform: false
+        qcom,platform-type: false
+
+  # either describe pmic or pmic-id; it's confusing to have both
+  - if:
+    properties:
+      qcom,pmic: true
+    then:
+      properties:
+        qcom,pmic-id: false
+  - if:
+    properties:
+      qcom,pmic-id: true
+    then:
+      properties:
+        qcom,pmic: false
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/arm/qcom,ids.h>
+    / {
+      compatible = "qcom,sm8650";
+      board-id {
+        qcom,soc = <QCOM_ID_SM8650>;
+        qcom,platform = <QCOM_BOARD_ID_MTP>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/arm/qcom,ids.h>
+    / {
+      compatible = "qcom,sm8650";
+      board-id {
+        qcom,soc-version = <QCOM_ID_SM8650 QCOM_SOC_REVISION(1)>,
+                           <QCOM_ID_SM8650 QCOM_SOC_REVISION(2)>;
+        qcom,platform-type = <QCOM_BOARD_ID_MTP 0>, <QCOM_BOARD_ID_MTP 1>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/arm/qcom,ids.h>
+    / {
+      compatible = "qcom,sm8650";
+      board-id {
+        qcom,soc = <QCOM_ID_SM8650>;
+        qcom,platform-version = <QCOM_BOARD_ID(MTP, 0, 1, 0)>,
+                                <QCOM_BOARD_ID(MTP, 0, 1, 1)>;
+        qcom,boot-device = <QCOM_BOARD_BOOT_UFS>;
+      };
+    };

-- 
2.34.1


