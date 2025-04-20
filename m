Return-Path: <linux-arm-msm+bounces-54819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E41AFA94725
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 10:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE5F3B75FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Apr 2025 08:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F511E3DFC;
	Sun, 20 Apr 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UKeSrWnh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D91E25FA;
	Sun, 20 Apr 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745137058; cv=none; b=e+VwY4gKfhwLZHZQ/yAB7LTk32TPgK6sFYU9mcr3L68TObZn8tsjQIrsOm5wKcuKhwKQiTBc/9i62MfXPN24A06wvl9kcIR2Ri6E5aoJUAI3GoKfWU05rBx4ZjbpMcXpsQVsPMsaYoUGvyb26sfOCFdMWbbLjAtZaqjmCmz69Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745137058; c=relaxed/simple;
	bh=2/GvcO0cE6oGv0CG997Lc1D0sRCdeFP6HVwHyfoo+0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bud/IzVRB9mszm2pYicfp9EeFT5mkzh37c7/VhtnNixu03R9AeIidcivUrX2+AMmNigoyl4GeurCMFMJPBaOLhjyyhvgbZG+1iWhdDLAolxg0Y9y6mAe3cZd04pbnEaTR/hi7dnWH+Z+Pi65Yic3FwqjvNw3dDc7vj/gj6Gd4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UKeSrWnh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53K4xotV025023;
	Sun, 20 Apr 2025 08:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cIUGqMCgjeY
	tMzqCYfsXV9KkN/1bfjrp9B8onbQRBKE=; b=UKeSrWnhRCQQzDVF1mATUA1LBhY
	Ekwy0QTB4ueQBZVwLtiRQhcZY4B45pju8AbG/229GRFVUgIp2DEw2ZH6rSMRRUM7
	jzIjhbf+saPrzX4sBAhXcY9al+M4FJKyrS208z+LtjtwBtyVc38XgbWra4FJol4R
	ew5BJPHmTYDewCvU9v5mIWp6K54auc9OwYXqQ9+SByzU9Ei9CLA1MvgzTgJ2RZ0d
	eN+b6sMpJInS0mbOYjbOfn/OawpVAxwHb34stFUVqyzKRBIN18eHCQNOWyJH6H7Q
	b8Ya/EYuhMx5YAXizOEHbGkD3vN7MsyBczOjdXjzxAzeSDrefyLqsngPGow==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435j9pbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:17:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53K8HPeh010760;
	Sun, 20 Apr 2025 08:17:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wkk9w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:17:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53K8HP71010754;
	Sun, 20 Apr 2025 08:17:25 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53K8HO9g010753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Apr 2025 08:17:25 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 4BEFB2409F; Sun, 20 Apr 2025 13:47:24 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Sun, 20 Apr 2025 13:45:28 +0530
Message-Id: <20250420081530.2708238-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250420081530.2708238-1-quic_msavaliy@quicinc.com>
References: <20250420081530.2708238-1-quic_msavaliy@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6804ad99 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=a4gNajxLRnOSRrId0dEA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zf_ZU8FP-S4ZPyPaRNWNn8uzyug4eyga
X-Proofpoint-ORIG-GUID: zf_ZU8FP-S4ZPyPaRNWNn8uzyug4eyga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200067

Add device tree bindings for the Qualcomm I3C controller. This includes
the necessary documentation and properties required to describe the
hardware in the device tree.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
new file mode 100644
index 000000000000..433e096eddf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
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
+    const: qcom,geni-i3c
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
+        compatible = "qcom,geni-i3c";
+        reg = <0x00884000 0x4000>;
+        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.25.1


