Return-Path: <linux-arm-msm+bounces-63141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A00DAEEFA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:19:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DCDC3E0CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF1B25E827;
	Tue,  1 Jul 2025 07:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRah61tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A5E21019E;
	Tue,  1 Jul 2025 07:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354382; cv=none; b=O/i9kWqazaP/x+lFA6dy8iKRH3EjIiNiqTyH7TtSJX0kocYz/ugBFZ1YFd/IU2bxYSh6p40vMDD7CKyUf/mGK/A33+3a64DN6TyFrROfvBYsGZbMGikyux94kEyGtveiKG8+3D8A1aW5nsIA8N8hvmBIQyaByKSWQ35cFXcjrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354382; c=relaxed/simple;
	bh=LLD3LKsomqXcF6GaEWeD5REzoyU+c/OMXcA3GCfDuB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jvLa7E84x/g3RFTRbI45P1IcXcCTmalGthTOB+PHYYi3G6ZrCJcpgpHqzQH5RfrP+d1frHY3HeNJ38cADSrZcog8BJE/EkVluUmX2TBCYzgOJjOrtsFCabF6YQxlBl/uw3F+aLBpkvDM9KrPIxVAX1cY7MugmCoHo/Nah/R80o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRah61tE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613k6xn008301;
	Tue, 1 Jul 2025 07:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c3rAmYVTWM5
	PGDBlrffbCwxUdCv9e/fospjdxjiA77o=; b=XRah61tEeuDj5VxSP8nORLczVHw
	GasZrdzkJu+c81hSuNCCqh3iGrYwoxaoxspHzzgnhD8MPQP3v1byDRqduUlqftCk
	c8IcIgijCt5lmMHOqP3q5hjmpNIr5vgpR0MZDVy53wyiB8INaAzfV2YhFnD9DAni
	3Mbb+yVuzlYkWiZ9yfbG/ab82s9byC4kvYtveU7V4RWCZA8ky131w8yWrqD4T30O
	uojm70X3Qgvo0b5o29MSIssDpz931+8tO4JsaQ+xgkex2Sn1ioK2giGlp8JsNtNa
	6HC05GxPUvWQaIJFUwvgTmh3T2dWlVaWJbE+gjPGVPPrGfHm+lcp0pEZZ6g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmv7s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5617JLoI029821;
	Tue, 1 Jul 2025 07:19:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fktsum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:21 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5617JKAs029813;
	Tue, 1 Jul 2025 07:19:21 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5617JKB6029811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:20 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id DCF9224053; Tue,  1 Jul 2025 12:49:19 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C controller
Date: Tue,  1 Jul 2025 12:48:50 +0530
Message-Id: <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vgQZC6g7bIdhHQMSWiVe5dNNu2tGJ3tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfX56T7xMOqque+
 sZNEO9P42YxZA++sf1zuohZ3lv80yzvAKIZ1IXsg9x4CJCC6QQZSyJexlwMD+8xM3MEqc4OU7fX
 ogYGP2mLheioUi5Qu7U1pl5e/N6oLfIbdUFupGeKBxG457zD63A3b2bbO/ovvq4G4kSS6X5ok+O
 QJGtMkKmi0IiT7ueGHzZa1VQZp+uCiptBhu65+16XUysh2ces4Ztz4DlWR0RiRJg2wrfTZmn9NP
 jCBF+oC9NrWK5j3hF73czHU1U5MhA+XMhDsO4NSUkH67xTMhwmStY5pFnwtZ3FM8WCvHVgA26K+
 BOJDfZpxaYhf3XDcXftkfMRXw6DzWi7+JbJHL3Geh8i2ohknz0eWQAbzdwp/6aNnuDA6J/pnE+5
 Zkoa3IQQzzo3/gT/wQ8X7f5vq/dcMAU2TsoxZpfEpUM/gN78aGsH4D/wMZDSLOfslzXBuCsj
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=68638bfc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=a4gNajxLRnOSRrId0dEA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: vgQZC6g7bIdhHQMSWiVe5dNNu2tGJ3tr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=1 suspectscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040

Add device tree bindings for the Qualcomm I3C controller. This includes
the necessary documentation and properties required to describe the
hardware in the device tree.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
new file mode 100644
index 000000000000..45022327aee7
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
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
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
+        clock-names = "se";
+        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.25.1


