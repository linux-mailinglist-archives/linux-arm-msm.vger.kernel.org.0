Return-Path: <linux-arm-msm+bounces-62039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB22AE3D5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04560166090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 10:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB68245023;
	Mon, 23 Jun 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFTDNmbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B961E23ED5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675883; cv=none; b=WNU2Ht4TejUwZrPiRXUTTNFtHFeRrBf6f82KZErJxjiU0Ysx3BJYFPfzA/XEQRbYPPqrV8stqXDMj+yxAojDpsL2ojU44lIwthr4q9cimI+IlrbOoprfWVbmwmUSurRT9XBO6DTsjdg9KcIYJYGlDNq5VIcRCRubYhtjXAyLCCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675883; c=relaxed/simple;
	bh=v2+PUpyQuEpd6Qy8uGCa9JWlCfSUOoQ6R2C6kBCVvKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LReWJRCR8KrEic1en2vSXjLB1gvauj8xSieU4+bFlbRWy9ikbwyTlf6YWGH3T1bS5UFmKkHLE82+aplLbgFDIOZvoEZPskbRPtV6YMIo18OkQqxtgOjiQfvReefo321GpaxXN9Pnt95nb09VipHfPWD9UAysXMaSg62gwZbSZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFTDNmbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LjkX006119
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/IEG3Lw7qKW
	3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=; b=aFTDNmbC4gERKiqYpPjNcyRg6VB
	a1+LFmWTF+y5RykWGGeOBOq9ntqj7WL873c8hyvO83obJMTB1YwIvq6maVL5GjQ4
	g6WL0wExK8GSABXZAMpUai0GBpYdK1ZddIb9PdyWvTMMZ7kR6JhC+08hn6pDObY1
	bGSuBcKdILA0Slm7rwvCDm+5HO9nTA5vyEnY6rJe27hxjVlhnNwmrWU1zdtOeF57
	IKhEfHgy4EjLnQ8eWZcKO3LBjd+umCP46yPjwsKRZ8OTx9g8hpUjQIiKmcnz5Thi
	h/KAx3hrzrjxZH4UsCC5qdNJdNK5qFSz0leRUa2Aza+jZPjsFDqCuwTYo3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8dg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 10:51:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38f565974so680244385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 03:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675873; x=1751280673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IEG3Lw7qKW3BELpNeKdPEcAL7+R57y3cNniHNfPDSA=;
        b=M9XRI9LnttVAz0tj0JIAMhsr9jhIW+Qj8NPPVcOIcih9h7GJXOB52aQyxyA0gV3lK3
         banQDYbHCi+HJ290YVDRE6M7JkuZ1WRPlH8iALYVjwYZrU6+weoPgm68M199va/oZ8Zj
         cUi0HFpqYQVhA6swpU6oBAD+oQLCxam4BREwVpNSRXEz4pXF7i7Rx0nM1TAQhe2ZyFQB
         KYSjiPAynLcPf3b3EzQn02Aqt6V4Y/jSECaERSHnSc0B1qYH+yRDlmCwOE8O+zVCRI56
         PWHLbplX66Avxr8equ3zGiGSzBSYZFu/MJP7qBlH7EPrXT4SdYN3hFOGbw0opYSM8vuf
         bj4Q==
X-Gm-Message-State: AOJu0YzYV+82qoHb8GIb8iG1hdF/naLtL2jBx8iQRG75DVEUw1GTd4as
	elUQPmaowH8uPeNcDIHyT5RPUx1OPkGi7qPbeu48weYuRah0aAZks3z5Wn6aPVmUyRWOOn6Qcxp
	kdz541WU63Egk1Xj4ZfSGnvOA8eYSQhGhgeZKL8VvS++GLcDkK3NA8vykjCHyJB0NK4F0
X-Gm-Gg: ASbGncsq0t1+gTkVTMVfn95bHTYefNk0iLfHgGUA6yEJO4/xQqR4Q/hVCp9lQk8MoJY
	J3aYWB2X/QkmvBf3mZp6vh/Yv1Q8iooZYa+tGFQpRBf+UdJMaRVlW3cvlHS2YtLcNUfsGAWc8Sh
	jktliqUJWnIDwpm+NNKVMXz0JfENgBqa3k2vMi/7f/J22oqz4XLEp0jt/Y/Mh/orumKdfqjS6cU
	nsDTR4xWpi5IkIPkDOaNBXDMFbdWKd2nlb+8wjf98lxX25XiqhTAzMRk6LLPzNC/MtFyFuZAoEv
	ckFmM5v1UXXYmcdzkhQHflTCFmArWwbSqLpVPEPgQWlxpu87DTTh94EHEVO4T56i2B8YJfDg3Cw
	A
X-Received: by 2002:a05:620a:190a:b0:7d3:ce9a:565b with SMTP id af79cd13be357-7d3fc02d785mr1549173085a.14.1750675872903;
        Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeczlrp2KZQuD787VGdM6ojUIpBwCMHv7W0cpZRLBJhUTOy72V7bvnKIlMEc3J+WFbW7fSOw==
X-Received: by 2002:a05:620a:190a:b0:7d3:ce9a:565b with SMTP id af79cd13be357-7d3fc02d785mr1549169785a.14.1750675872434;
        Mon, 23 Jun 2025 03:51:12 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45365af83easm100821835e9.25.2025.06.23.03.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:51:11 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Date: Mon, 23 Jun 2025 12:51:03 +0200
Message-Id: <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uT7BIKsqVTdvnDcqKQ4kJiYBDMhramYz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NSBTYWx0ZWRfXwVLu9QQt/zVD
 yjxvK50YiZgpjQLtcRGCVBN3kaYF99j3N90OuhKxi0hfs2Rs05ub27hU6AgOE9xOMSWWWyPaVaP
 EN0NL57jznwZ+jcL3vfPcAJc7tcHZBJkIhCL1BpC6LQeh2oSQe8+fXFlD2oDzuf1LBcqS01W3BV
 CME3ICRvTwNWZNdQKMjMSfRCDmPQ7sGgXN0AFdbJfhrTNTUl1MnAI7H66eOrKRB/F63FwGLZCgX
 /RajPiIRCxROXZ74XfSbZv40aDdnHCG1KyM9p0kWwGb2qdo8ieZ2RxZSVuHpVsiCVBzE6bUMcT4
 AwmRmrLfme9CcYUmL+ngo+LRZWZdmd1Gm+TiWUN7tGHtx58qX0mfS+WMwKPzVZYKvFwtaL9dH9l
 OMRq7doJvyjM/VTjlDbkJ2uvDbPBTpH7MxpI5s8WIJaJQkngV11pC7Cg8o8F/r0ObKCbeD+3
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685931a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UBg8vxrJu69tSQrAULkA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uT7BIKsqVTdvnDcqKQ4kJiYBDMhramYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230065

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


