Return-Path: <linux-arm-msm+bounces-33152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4A799114E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80FED1C2368C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 21:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559301AE008;
	Fri,  4 Oct 2024 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bn09piJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9C1B4F14;
	Fri,  4 Oct 2024 21:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077067; cv=none; b=DooT6qsKW7sT76hy/yDFAVPCV/Lwb0aYXb7CpjA7TQwICO+LmF40YV2mlO7g/ErtGEgFYz6oIBugBX07lu1+ChpSOT90D3/FAzN6XbakAZjihMMv/Ojv1FqlpkKJHdLcNIN4/xm9D5QH5dROn66NqcQrAej1rlJXxBy3AK3Wny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077067; c=relaxed/simple;
	bh=K8QQuCcgEoB0Q/fSJMyIy/O8BgM0uWG0H4wK+BbDIfM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGPLgRoPYW1T6OPYuHhgStlYqUMOPW8gx91JmtWTd04mdTLgX123XBuBCSc25U+XFlSBwXjFs8exHIIcNCvaPud9KLd0TiGHmjrwlvkqLOnEw8vWuGeYmo0mZ1EaMnB+jVaCOf/mnqQl22uJndnWDg6ND/D5XzfaC0Uhj/GLEhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bn09piJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494ATt59025857;
	Fri, 4 Oct 2024 21:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39SXQRUtqv3dCuCRZORbE6PdS2UKo6iBfrj136WCLLI=; b=Bn09piJpkl74aL3s
	oV7yotchFWX3d/egigHvPBkjRtE9Eua3a+f+oUUu/Z/P+EzYMp50y+VAXhE/cM3C
	K2PqiyEuFGYLbfDCwn9qSgSzDRRiAH/l2GYLjC8S9PcL2lFv5TZ9uB8PgT/mR2b4
	SwMDMxG1qjYeE6OGkEllDfFaYCO3otByBSDLwPCzxrXjtkQ6tL1bgxLj5iLbHLx0
	7msP9K9U4oYl5DR6mwHkfYmVPokDFF6nDFlCLcoSZeHGAevxL07E/dQ8frMZ+GOx
	B6YlTBJz0o9mQ/j2C5ZGoO3wVNJLCIKnGHXC+sRZieidyRu7m4aBjZTfECYnBgHA
	9Ln9+g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kk9rc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 21:24:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494LOLsr028204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 21:24:21 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Oct 2024 14:24:16 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Shiraz Hashim
	<quic_shashim@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH 1/6] dt-bindings: remoteproc: qcom,pas-common: Introduce iommus and qcom,devmem property
Date: Sat, 5 Oct 2024 02:53:54 +0530
Message-ID: <20241004212359.2263502-2-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004212359.2263502-1-quic_mojha@quicinc.com>
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tp2FVau3JffewU54Y8bYH2Tadybq9hSw
X-Proofpoint-GUID: tp2FVau3JffewU54Y8bYH2Tadybq9hSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=627
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410040148

From: Shiraz Hashim <quic_shashim@quicinc.com>

Qualcomm’s PAS implementation for remote processors only supports a
single stage of IOMMU translation and is presently managed by the
Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
such as with a KVM hypervisor, IOMMU translations need to be set up by
the KVM host. Remoteproc needs carveout memory region and its resource
(device memory) permissions to be set before it comes up, and this
information is presently available statically with QHEE.

In the absence of QHEE, the boot firmware needs to overlay this
information based on SoCs running with either QHEE or a KVM hypervisor
(CPUs booted in EL2).

The qcom,devmem property provides IOMMU devmem translation information
intended for non-QHEE based systems.

Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
Co-Developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml  | 42 +++++++++++++++++++
 .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 20 +++++++++
 2 files changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..068e177ad934 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -52,6 +52,48 @@ properties:
     minItems: 1
     maxItems: 3
 
+  iommus:
+    maxItems: 1
+
+  qcom,devmem:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      Qualcomm’s PAS implementation for remote processors only supports a
+      single stage of IOMMU translation and is presently managed by the
+      Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
+      such as with a KVM hypervisor, IOMMU translations need to be set up by
+      the KVM host. Remoteproc might need some device resources and related
+      access permissions to be set before it comes up, and this information is
+      presently available statically with QHEE.
+
+      In the absence of QHEE, the boot firmware needs to overlay this
+      information based on SoCs running with either QHEE or a KVM hypervisor
+      (CPUs booted in EL2).
+
+      The qcom,devmem property provides IOMMU devmem translation information
+      intended for non-QHEE based systems. It is an array of u32 values
+      describing the device memory regions for which IOMMU translations need to
+      be set up before bringing up Remoteproc. This array consists of 4-tuples
+      defining the device address, physical address, size, and attribute flags
+      with which it has to be mapped.
+
+      remoteproc@3000000 {
+          ...
+
+          qcom,devmem = <0x82000 0x82000 0x2000 0x3>,
+                        <0x92000 0x92000 0x1000 0x1>;
+      }
+
+    items:
+      items:
+        - description: device address
+        - description: physical address
+        - description: size of mapping
+        - description: |
+            iommu attributes - IOMMU_READ, IOMMU_WRITE, IOMMU_CACHE, IOMMU_NOEXEC, IOMMU_MMIO
+          enum: [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
+                  25, 26, 27, 28, 29, 30, 31 ]
+
   qcom,smem-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: States used by the AP to signal the Hexagon core
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 7fe401a06805..503c5c9d8ea7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -139,6 +139,26 @@ examples:
         power-domains = <&rpmhpd RPMHPD_LCX>, <&rpmhpd RPMHPD_LMX>;
         power-domain-names = "lcx", "lmx";
 
+        iommus = <&apps_smmu 0x3000 0x0>;
+        qcom,devmem = <0x00110000 0x00110000 0x4000 0x1>,
+                      <0x00123000 0x00123000 0x1000 0x3>,
+                      <0x00124000 0x00124000 0x3000 0x3>,
+                      <0x00127000 0x00127000 0x2000 0x3>,
+                      <0x0012a000 0x0012a000 0x3000 0x3>,
+                      <0x0012e000 0x0012e000 0x1000 0x3>,
+                      <0x0012f000 0x0012f000 0x1000 0x1>,
+                      <0x00144000 0x00144000 0x1000 0x1>,
+                      <0x00148000 0x00148000 0x1000 0x1>,
+                      <0x00149000 0x00149000 0xe000 0x3>,
+                      <0x00157000 0x00157000 0x1000 0x3>,
+                      <0x00158000 0x00158000 0xd000 0x3>,
+                      <0x00165000 0x00165000 0x1000 0x3>,
+                      <0x00172000 0x00172000 0x1000 0x3>,
+                      <0x00173000 0x00173000 0x8000 0x3>,
+                      <0x0017b000 0x0017b000 0x2000 0x3>,
+                      <0x0017f000 0x0017f000 0x1000 0x3>,
+                      <0x00184000 0x00184000 0x1000 0x1>;
+
         interconnects = <&lpass_ag_noc MASTER_LPASS_PROC 0 &mc_virt SLAVE_EBI1 0>;
 
         memory-region = <&pil_adsp_mem>;
-- 
2.34.1


