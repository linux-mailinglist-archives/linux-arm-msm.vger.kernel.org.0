Return-Path: <linux-arm-msm+bounces-53104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA19A7A443
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 15:48:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57FF11898B31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 13:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF0024EAA0;
	Thu,  3 Apr 2025 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LBEvt/ST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DE24E00D;
	Thu,  3 Apr 2025 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688051; cv=none; b=nfqHEoupG5KzzZGlOOWSdN/eeLuzfdsY8FKRjBVS/rCcAG98JJNWpvR04YN4vQ4tlo/Wh1z/Fno6JI1EKSNWNojtoJYNp6AqtEkO+7kz8aoDnf/b3jnNa+zio9dOvQaO3MblHKglnizj+6a8qjXQszrOo7GbOZkBU8GRzPUUGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688051; c=relaxed/simple;
	bh=1Ht9xkywU/8GvEA+YH9pogbDuXfoBJPYqG9Jddynecc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mtv3hmhDlb2bRmQMCXrjN+P+oMUv9xU9HxB/UFrl6eZMSzEyTTQka89d5vNeYlHXQvyh0t39tTXtpnpYMg6THI9L2h7VBPKTYujJqOdKm37aLM0ZxG9L51o2VKq6dw9BG2SFwRPmxeA8f+PmQnNy53/EM8ePml93Nd/RjFzwQNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LBEvt/ST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rwZY027242;
	Thu, 3 Apr 2025 13:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yDWm8LPQ/gS
	c32viTyJ03QHutCa4wrTV4Fgf/rumgrE=; b=LBEvt/STyDgNtYFAAGSEVZxDm8J
	N7qu578XUl9JUObERtaHkhEUb28Jtbue1oRDfTBvH3Utn4LoRSIGfhTNLsaVAlkY
	PB+PL0mx+TKg6d0+zJJRvdMgc9nS/C95jS4V4OJVkBNyg1XQL3zLLFTFVxnDjXLl
	aATU6QAdtDgJtAa3AFLCUnAertSHyILqFv5WMLNqodiZItFOiJnF9ytpOuoSX5kI
	e8+79cGogziJER7EXrgXoZd/sXSh4fmiznElD2y/2FHYHBIMZChWcHKrigsA2xah
	gPeWmAb+5OsXnUd02ZIhhOZ2/wclCVV0abrJO+ywt9IV10wxXq7necDjfGA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapvtch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:46:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 533Dkr2u020597;
	Thu, 3 Apr 2025 13:46:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45p9xmx9kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:46:53 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 533DkrBR020591;
	Thu, 3 Apr 2025 13:46:53 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 533Dkq4F020589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:46:53 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 585582484F; Thu,  3 Apr 2025 19:16:52 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Thu,  3 Apr 2025 19:16:42 +0530
Message-Id: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ee9150 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=a4gNajxLRnOSRrId0dEA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _ihdKW0sMwy2k-KoC0_o3m1Fj7ty5bBI
X-Proofpoint-GUID: _ihdKW0sMwy2k-KoC0_o3m1Fj7ty5bBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=3
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030062

Add device tree bindings for the Qualcomm I3C controller. This includes
the necessary documentation and properties required to describe the
hardware in the device tree.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 .../bindings/i3c/qcom,geni-i3c.yaml           | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
new file mode 100644
index 000000000000..25f0d92204d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
@@ -0,0 +1,63 @@
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
+    - qcom,geni-i3c
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: se
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
+        compatible = "qcom,geni-i3c";
+        reg = <0x00884000 0x4000>;
+        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+        clock-names = "se";
+        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.25.1


