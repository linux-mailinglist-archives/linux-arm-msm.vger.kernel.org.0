Return-Path: <linux-arm-msm+bounces-88681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74ED17280
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A84A23063F64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AEE36BCF1;
	Tue, 13 Jan 2026 08:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkywUfzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRWIAQm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB5365A06
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291290; cv=none; b=CQOmYC3rXs7vmzcK5jSNDxyxinhy2my5HEaCyfHEh/i8ELHngTZbGtXfGCsFEtjDMaP50j+eX6uip7+on9qQb+s7HS3dAxbUG0sInMN/b24otzZ1X+jfjc1k0JvJhtfRIp0z36n+oTuvs9o3434A+7aBSQKXSMvZwbfeVZxkbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291290; c=relaxed/simple;
	bh=ZGFg0op8BVgENGg3aEwasvG/p/jStVsIO1p+IMgzA/E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTI/UIaHF7Oaej1Sag+QIZ/QfHd0gQasRfnXKfM1/d9+0/S/NBksywBAK11wb3xhkcTnxxOuQtEup//vGGpChVofad33K3vM3arjTPPunTi8SMiyxDRGvJSeZg3myHSTyHmpkxOBDcMHqMCgf8Ho3yjhm7JuCzOD2rWS5lEqxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkywUfzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRWIAQm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SqdM3868770
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGUsW9Nlhn7+0JuXr6dJYsO9rnx5Ii6nJqsMTG3srp0=; b=bkywUfznucgBxJZ6
	50/TNCi40EQ1Trx6W5XJdQtVEjCgdUgR500jczcm99y8g68NgMLlgB7fdxxIVCz3
	jCCMgkNo4tqJDm/TZNBqFU7hr/T5v6O9mCYxL/xlvs+RbDoWeXptm4ylbEnKv1qe
	Hb1kCTDdeltOoJWlaEybDlE5dsOYYxatUBBnwPGyL92+rGJmQMIaHFVsCD+pTgLW
	p2VGmRidkYZywKDodHw2Ox3WhK+TVs5/U7+tAE5/r6HAvpY74P5deraqr10K8Ej5
	xTDi2bAFag8NSJL8PSar6oWiNWYa66D4QGKIPYoh7LbJhp1d+bcxinrXZmj3mlYF
	oGjGXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8cux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:01:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f25e494c2so65797595ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768291273; x=1768896073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGUsW9Nlhn7+0JuXr6dJYsO9rnx5Ii6nJqsMTG3srp0=;
        b=BRWIAQm+OFf0mG84MOFEgauiTrziDO0srPdvHsEdjI/ebUnW6+tG3pKCk2wA3/9BSc
         rmFM7lM8K6mRuypWWji1jZ4LODGHgCflUsUL6IKIjEaMGclfTysVr4tPoN3Vqc4DUU4p
         66c8vLN1Ln5Jo2Nrhhjt0IQcKfNkImg0xx5qPA5A7klV1WN7o90yCmwv4eo/cfdrDjii
         NiWrmt3NyRePSd7WlnefwAXCXORzn7qVDrOrk5j3UAoClSoMl0a2aAZh3QfON8SoQeQn
         eVFkd0ec24fOOAfbjUtOrNUmeAi6GSv5N9wXsw/TJsRIeBBwQJUnxqAIbAlIcPHc2zvb
         o+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291273; x=1768896073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGUsW9Nlhn7+0JuXr6dJYsO9rnx5Ii6nJqsMTG3srp0=;
        b=OvvzyMZRezMKv9n0SGQ3+ps4rw8w6WveYhzd/xHTiQXM47UnwpOXJza0l4dontjVWC
         d2slYLJwqYJNt5rpsJ+ow3Lqvrx8ZSDBLvHnfDBVwBo/8QQenkVZLVIavo8T0xx+0tIe
         pkNn2w20jIDDzaj7A1bEVVrse06ohFSAfmQ34gHJvzOuxObMgAt/qMDdGamcf38fOESp
         vEmIgVGgrUtFA4Lsgn4oMhrUwj0Exna5w0mJ1bkZBxSP0vfWHaKBN02mBxUDZI37Clid
         egvMZR1uulgqDUxANK7yjyOOC446hf4TmA4teqf+TYSDV0qa5JceeQwAUe1NFh6HEw6a
         i4RA==
X-Gm-Message-State: AOJu0YzO14dhDXwkrujPpyww3vuysVLp/NXxO0sChWbmnKxKw1bKwlYq
	8XAk7dTfSLywUD+yn4EDopYHXILdHYB+USf8sx+opLfW84Y12u/splDOjuUm4IgWHtX8gznfol5
	z+HwJHtU+zLoZFwOaCx6grGtkUidA68/xXorS4RNtiOhbbHXVYIxdkJEWxV7RFkMNAo0W
X-Gm-Gg: AY/fxX4UsZplZsw2xdx0uthMtTHk7XdxaQTtWg+5BFVO8GCMl1VY9rfbr7js2gRytDi
	Cd3UKl0C0ZXFfYt3xo5V1fASbAAXEnbMYUfE43WkNGa1MJE84wFMnCxZgCU/e2eTpDNE8O8upwI
	b5EEdTwM9uqhtXjJxsBlo+e1JQwYD7goiF7xZtFSRvYFh+vW/NTsQgLtFxm7tX5u6OtXS630iQm
	aD4FZdX0n6sG33XRLLyJUKQNT0NSddi/icnzkwlb50axBJBTOUKYLqRdztVRtrdAyfwA1VGrd0O
	m0l9+mycNOZhF31wchz616OaigjovLd9X1Jt3E83dzEYuFtAEQuF8qasREWFCgWex4YuvgX8m4/
	9AZS6PHrc4BE6vGIu/eTUQFPgiBKaVkXTIheM5uJN
X-Received: by 2002:a17:903:32cb:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a58b4c0c2bmr19650355ad.13.1768291272950;
        Tue, 13 Jan 2026 00:01:12 -0800 (PST)
X-Received: by 2002:a17:903:32cb:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a58b4c0c2bmr19649745ad.13.1768291272318;
        Tue, 13 Jan 2026 00:01:12 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c15sm191132725ad.27.2026.01.13.00.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 00:01:11 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anjana Hari <anjana.hari@oss.qualcomm.com>
Subject: [PATCH V5 2/4] dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
Date: Tue, 13 Jan 2026 13:30:44 +0530
Message-Id: <20260113080046.284089-3-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
References: <20260113080046.284089-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qdH85Da5EkLRoNSBh_hK_su-GgjKMAzu
X-Proofpoint-GUID: qdH85Da5EkLRoNSBh_hK_su-GgjKMAzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NiBTYWx0ZWRfX7NSJwNhAHXn4
 p/UKgqf7+3PtAvy0SEwHYFlFOEo8M+AkY3/ib6GDb9xCxQKaz229UpN88dhqVjCEb2Dl2j94qJC
 /ciRtnQxmMVVZjhWPE2u54ti8s9kT5mPL0b51LkENlZHXUlPgMyIXEQDWPlSol+w40H80WHIcs5
 zA5kCm3YuZGhCyDRuJ6rhU8D02hGIO7r16fHnD1MaKJQ9XpuAuv8rWh5xOabiUa4CitYmjVxEhr
 l8/NjPsXggEjXuiH5Pok2nI6O+YfMQdQXG9X66viRYr5o2+8Bi7VB/vawfaXMLPZaTN6IQ++P7D
 92DgtPKh8k8bfy4KWEYMjQOPcWCfwsU9Z5JjGG+5cilXGV3UvuIiPWyk99ghFgWpCZ6Fg3MO8mM
 RlW319SyeOmsNfKrIuder1v7moXFamH9eIPBmRgLRnU0qw8K6zwnODPcsXnNSU3ki85jA4vLTMI
 3vBLEFdTQvDPHMuu/MQ==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=6965fbc9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VcM-S10TGioI4za7RKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130066

Document the device tree bindings for UFS host controller on
Qualcomm SA8255P platform which integrates firmware-managed
resources.

The platform firmware implements the SCMI server and manages
resources such as the PHY, clocks, regulators and resets via the
SCMI power protocol. As a result, the OS-visible DT only describes
the controller’s MMIO, interrupt, IOMMU and power-domain interfaces.

The generic "qcom,ufshc" and "jedec,ufs-2.0" compatible strings are
removed from the binding, since this firmware managed design won't
be compatible with the drivers doing full resource management.

Co-developed-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Signed-off-by: Anjana Hari <anjana.hari@oss.qualcomm.com>
Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
---
 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
new file mode 100644
index 000000000000..75fae9f1eba7
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/qcom,sa8255p-ufshc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P UFS Host Controller
+
+maintainers:
+  - Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ufshc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - iommus
+  - dma-coherent
+
+allOf:
+  - $ref: ufs-common.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ufshc@1d84000 {
+        compatible = "qcom,sa8255p-ufshc";
+        reg = <0x01d84000 0x3000>;
+        interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+        lanes-per-direction = <2>;
+
+        iommus = <&apps_smmu 0x100 0x0>;
+        power-domains = <&scmi3_pd 0>;
+        dma-coherent;
+    };
-- 
2.34.1


