Return-Path: <linux-arm-msm+bounces-52530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FEA71840
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 15:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 077F2171DE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8461F3BA4;
	Wed, 26 Mar 2025 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MJqY/D1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FA41F30DE;
	Wed, 26 Mar 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742998671; cv=none; b=fIU+ZyVv4wiR4YwOx1kQjPs/qM5C+6e0uO5sK5Dcg1lm8WnMUBXxsOVjRNbtHhhj7pLvMQJCyl0eU+aAntMQoTcpNj0IJj//J5nU/Qq51jYPXP+0bIrAgTJ7bQcejObf7lappOclXwlmXkeNgu6+kgzeu6QvVtkB2SSD1GlHBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742998671; c=relaxed/simple;
	bh=4pL88zhaTrtz08iaJB+lwNAuWxdH56NNz0MVeYuP+K0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qwLWfSadfkerVNRaHk9FCL4Dgb0+1dTrAiU/zZPwvoL34vsbE9RWM85UFoTFAMSouCUPF5NXimya5GiUgIPMFYl9QvmlQ8BgTe7EyOGZJlOK0zYmGIrqr+t/licl3PzFYOPPMvveI3SNnkEVpvwW3xpvTu3JloH8RrebmnzyJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MJqY/D1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73HLG023688;
	Wed, 26 Mar 2025 14:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=84w8+n9S60N
	uO1JmtRW94BX/g7X83vxhQZeH65GjYiU=; b=MJqY/D1P8ynx9yiBnuluDkTtRWi
	nlLrKRc0aey8J0pHDpxN3tsoPC3b6n9KNU9+PM0Zu0c3j5+DBmwrunv0rhyvncKA
	zqGpFNR5sQ7PXNci/iKyRGZfa09HzoAtma7xTJygFEcIL/8JXdVxKxepj0DPnvU/
	q0Vl41m4JYCXNoVhkaeSMtEBs/Su9zSwTGF/tRaiGWjdnB++njb0N1/f/J5PY5pd
	9QzS0GGaLPF5hfCPKsSAm+03C8sd1pjlYpq9/JbtaTNX73sWhucjYC7oxBjED589
	ll9mUokj26vPs6rnXDUeK6/93eb/neycMYyiMTwdHipSI2L/phjchCL/laA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf1ys8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEHeWi025752;
	Wed, 26 Mar 2025 14:17:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45hp9mdsgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52QEHdW8025746;
	Wed, 26 Mar 2025 14:17:39 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 52QEHdi6025745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:39 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id B103D2343B; Wed, 26 Mar 2025 19:47:38 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 1/3] dt-bindings: i3c: Add Qualcomm I3C master controller
Date: Wed, 26 Mar 2025 19:46:39 +0530
Message-Id: <20250326141641.3471906-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: x_ZftTWIb5rh_sRyrIi3OyjIdtJrwPqo
X-Proofpoint-GUID: x_ZftTWIb5rh_sRyrIi3OyjIdtJrwPqo
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e40c87 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=a4gNajxLRnOSRrId0dEA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260087

Add device tree bindings for the Qualcomm I3C controller. This includes
the necessary documentation and properties required to describe the
hardware in the device tree.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 .../bindings/i3c/qcom,i3c-master.yaml         | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
new file mode 100644
index 000000000000..af6b393f2327
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/qcom,i3c-master.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Geni based QUP I3C Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
+
+description:
+  I3C in master mode supports up to 12.5MHz, SDR mode data transfer in mixed
+  bus mode (I2C and I3C target devices on same i3c bus). It also supports
+  hotjoin, IBI mechanism.
+
+  I3C Controller nodes must be child of GENI based Qualcomm Universal
+  Peripharal. Please refer GENI based QUP wrapper controller node bindings
+  described in Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
+
+allOf:
+  - $ref: i3c.yaml#
+
+properties:
+  compatible:
+    const: qcom,i3c-master
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
+
+    i3c@884000 {
+        compatible = "qcom,i3c-master";
+        reg = <0x00884000 0x4000>;
+        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+        clock-names = "se-clk";
+        interrupts = <&intc GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.25.1


