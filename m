Return-Path: <linux-arm-msm+bounces-62000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E6BAE3768
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F0DD1895160
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 07:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CE02063FD;
	Mon, 23 Jun 2025 07:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uwzvan2r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137C1376
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664998; cv=none; b=MCAx2J7HU2ESbmJH8TBWCbOAkRzirsHn80ibgz1gu0JEa8NxTP/GGPvpQV2FoQlsXmfW1xrlzBEB0h+pE+RXkJmGqfUTIvSaKW/UkMEr4gOFXiEmWfB8+9dIGW5GIBg282fO2EvNNVzworahZTlXqghGoHoRIaUUCwhyQxytFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664998; c=relaxed/simple;
	bh=v2+PUpyQuEpd6Qy8uGCa9JWlCfSUOoQ6R2C6kBCVvKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfDUcTiTpYP5h85pD+ai/JWke8LMpP2ZpXjqGrfiJQJy4mjBGSzNY2gJM6TBuIqBY8jmG+Otcs+jb96pOsQSG5i3u0oVjrZ9TV5YCACbH7QIoPpM0CtJis/zx6u/L/eqqALzDJ1hKsjBaYZgLSAL/aG+EXOudUKCIVyL3qenHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uwzvan2r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N284mw017895
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/IEG3Lw7qKW
	3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=; b=Uwzvan2rmcOkWANaCOsJcAe7WUH
	vpolFjMg5ZOVt6TBIpC9H1WwSOQF8oGCE6F/+WgGJbvPygEgIILK2daFamh+KzxA
	ZAmmLzdBuZ4oe4k3xwtqHKpL8S02u4wdn9lbJthLf0WVLfJvn4z0Z24E38T5Kegq
	NDb578cFQ3kRcRu3Xn6K9wFlNtzGr7UDkK7cEq2B7jqHWaGJcul4XmPIcYhir7gb
	LrJWXqq4SHHa419PURk4Qbq0aZhr1D1ytUTUG2GskywlY+eAcL0KCsX//iJvf12b
	fafgXFmluxlXrESf8FaQWYkkYS2Uz2yaYlDPXKDJjalDhyv4pSoYZgaZRCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ewv78wuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:49:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0aa9cdecdso303434485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 00:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750664994; x=1751269794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IEG3Lw7qKW3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=;
        b=HFF1N5aeu25L9HC+upWNJW2zjSNDtpIrl0ycG0v/2BpwNBkrznqmgTWGULgXGbniBy
         aaWQ/wcaAZUJMvStoeinDfCrgQt8ID32uvmW9EPsu6T9TXxhTnPlprbPVICTIJDHH9CO
         59SSNFUIptxgJX3bTAZLDHyozYxdvxD5auQ6RZ4WFo+Bxw4Ke4AVlR+SkHGm/wFp9FlI
         iG+cj4yAiCfeCkytES2jq4ilgYCAHLXZw9URjTFti1k9i8TW+5dAphk54dwXB1b/9yjW
         HfT+u//XrwyZ8ADYpADNmVo5qgnP4hJ7A5NNlDKMMY0g5KJmtB6bNZwxdzGa2zVSpxyg
         xwjQ==
X-Gm-Message-State: AOJu0YxIGrXJ76y2HKWi3YsHOVeKwc26usniRrRdtsGfIUB9X8hrzRcT
	IhGEJkVXwRea1oe+hLqjh5TPZM4eb6rdFjFGV+8M95fHc3P9hefgHzGOioVlZJZRz6UDokkr8tv
	CpOmwtxkOFswtI0cDU7NUAJPGxNpTgaJjlgm22CHwy4JrEeJhMVMJe5kB1PuKOrn7vhT0
X-Gm-Gg: ASbGnctX7ywIaHNt0Z1i0xCHIV7OgjjzS2sqlHuge6fS+R98dxI3xhf/DnmOV/J/L6f
	7i7H6ofCOZGQtq6rLn4jX96U1c0zZ6zrxMjdQOvlNOcLm9ilUUdFU9Qf6UI7Jpdkv57egGEnuE4
	QdCv/Z4G2B/6aPSimnZQ19/VzvaeSEGvavivyX2X+vcTqsY+GIptACMB++pL+LO80l/HmCXmz5W
	6+70cIAP8Jm/KkHXKPu4P0RyK4nNvBnVWYD7PZSellinviTl5PpcIVUVshRjBoBnARkIuv+NkCp
	jhW1NxwAB7SqLOCLG1rOLp1UlVcE4ttEKS7e5ERG8/FsnpF+rCVk8sqrpVv0YBTIDhjpEeJSKJX
	M
X-Received: by 2002:a05:620a:470b:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3f99469acmr1779647285a.56.1750664993996;
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY4gsMYAPVe+IThSQyLPbP0O2YiBUFQ1tUyFy77BiLqNi6c7jvjbSIb56TYV2W/OPEXPL5bQ==
X-Received: by 2002:a05:620a:470b:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3f99469acmr1779645085a.56.1750664993561;
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17ac7sm8755313f8f.23.2025.06.23.00.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:49:53 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Date: Mon, 23 Jun 2025 09:49:36 +0200
Message-Id: <20250623074940.3445115-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XqT73KNEZ_Tgmx2pVei0CSyLEvqiBI99
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX7Zeclgn8VrBl
 ew1lGgDgDPkO2Ti+i87xazNEGXqDPwdLpY1T27L1yTDExnz9fKBAuxcl5il5vd1jaxvXWGISdYK
 7h4YbAjg5OkuxL/YcmKFIcpSn+OInFiiius3JF7fg8olfS1BFjFLo9sZtn8yNtbpG1rBJeqzrPt
 l7kONTuhpwraV7mpC1q1GzmSscQRzXwnFV9xOKkcvKfuuZdU1aKLL3NR0veSGq740zvJdIzMV03
 5WrrWJ0jaE0Fs6RsMap+einFynVCkAiv6FGXyfQBbT+DXKuyblOOb3grXTcWnF0PDNs3NuabjD9
 ORM6IfwrbLSuAhaLv2LEK5Ckxgtk7N+yE4CcTW0fbhdvmlTTIChvLX+8uPgB3K1CpLTZLlrI3JX
 4ZKrQOOwwq7X9SpmEKpYaslY/KqtSCFftCkjWpwJDSdQIQBjDFj+BmyHLu2Nz5PXgT5CFiLb
X-Proofpoint-ORIG-GUID: XqT73KNEZ_Tgmx2pVei0CSyLEvqiBI99
X-Authority-Analysis: v=2.4 cv=NtfRc9dJ c=1 sm=1 tr=0 ts=68590722 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045

Add a schema for the venus video encoder/decoder on the qcm2290.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-venus.yaml    | 117 ++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
new file mode 100644
index 000000000000..1b94a95ce514
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-venus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCM2290 Venus video encode and decode accelerators
+
+maintainers:
+  - Vikash Garodia <quic_vgarodia@quicinc.com>
+
+description:
+  The Venus AR50_LITE IP is a video encode and decode accelerator present
+  on Qualcomm platforms
+
+allOf:
+  - $ref: qcom,venus-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,qcm2290-venus
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: cx
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+      - const: bus
+      - const: throttle
+      - const: vcodec0_core
+      - const: vcodec0_bus
+
+  iommus:
+    minItems: 1
+    maxItems: 5
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: video-mem
+      - const: cpu-cfg
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - power-domain-names
+  - iommus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    venus: video-codec@5a00000 {
+        compatible = "qcom,qcm2290-venus";
+        reg = <0x5a00000 0xff000>;
+        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+
+        power-domains = <&gcc GCC_VENUS_GDSC>,
+                        <&gcc GCC_VCODEC0_GDSC>,
+                        <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "venus", "vcodec0", "cx";
+        operating-points-v2 = <&venus_opp_table>;
+
+        clocks = <&gcc GCC_VIDEO_VENUS_CTL_CLK>,
+                 <&gcc GCC_VIDEO_AHB_CLK>,
+                 <&gcc GCC_VENUS_CTL_AXI_CLK>,
+                 <&gcc GCC_VIDEO_THROTTLE_CORE_CLK>,
+                 <&gcc GCC_VIDEO_VCODEC0_SYS_CLK>,
+                 <&gcc GCC_VCODEC0_AXI_CLK>;
+        clock-names = "core", "iface", "bus", "throttle",
+                      "vcodec0_core", "vcodec0_bus";
+
+        memory-region = <&pil_video_mem>;
+        iommus = <&apps_smmu 0x860 0x0>,
+                 <&apps_smmu 0x880 0x0>,
+                 <&apps_smmu 0x861 0x04>,
+                 <&apps_smmu 0x863 0x0>,
+                 <&apps_smmu 0x804 0xE0>;
+
+        interconnects = <&mmnrt_virt MASTER_VIDEO_P0 0 &bimc SLAVE_EBI1 0>,
+                        <&bimc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
+        interconnect-names = "video-mem", "cpu-cfg";
+
+        venus_opp_table: opp-table {
+            compatible = "operating-points-v2";
+            opp-133000000 {
+                opp-hz = /bits/ 64 <133000000>;
+                required-opps = <&rpmpd_opp_low_svs>;
+            };
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+        };
+    };
-- 
2.34.1


