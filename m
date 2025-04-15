Return-Path: <linux-arm-msm+bounces-54286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB3A89124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 03:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0266D17B3D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 01:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0284B207DEE;
	Tue, 15 Apr 2025 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFLQHUA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DA20010A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744680123; cv=none; b=ndKWOfwKJwp7vikscpx1u5U+jE01nC0fVG3DMoEm+haHT6JBkGtN6YXRUhXBGAlDFzinZdqyhpA7yeKbDqcDsyIMg87WGCnkSCQsXHTKAwcVI2XHYOkH2x1ZYgvYpdnB/F7RBrRfMLSgedeugLyfC+maG/9x+H8UOEU41/0ILrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744680123; c=relaxed/simple;
	bh=tUD9eJwvtLprAiDIkI+5zcEFlhQo51kGRBVOgkbb0Vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QjAqKbysLJXawKEzAfQV05zUxEpYD7dxiWH7tNQDh4yz+udHeBGzOZRxevGcWtmEJ75H1YsKWpEQgQ1jnXyYoduU+qRv8TvyO2sPnkCHkF4hYKgfdr/2TUaxCgVusokul99RT26OawQbCVf7YyuXNt4VukGDPLRDifmQULDOX5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFLQHUA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15KoB014550
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKXcVs9TLYIYoX5D9kRva9Njz4j3qneTEuSFzFkFN0M=; b=mFLQHUA7skPWlhUh
	hkB+u6H52iR0to2sOBWIXgKitxNKjSCJGsuy1DoQUOApboO0zu0MMutj9hKze35p
	PPJa5T8iExxSww5TWQyyijFAqRCUSAz5Y4LDf4pzXLyr3H8tGWLABjZFHbfXca4o
	tmtFPQh1C5m0YEaEmoixTLqM1JMOXZaT9YkOmTsZAWYdJIDBiswnWyiQgkaoJc/r
	XLhDZaPrpTFHPztItrsMMLbWTSuWvsXEy6EcMpiU5B7tjlEtT8l71ANozgMnSFoq
	yOa5lOfd8dDlBQK+vxNN34DeTIJkLmINImFR2vVfZnp/pQ+cyIACQk/8aahYYAAP
	FGKKRA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcx538-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 01:22:00 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6025007d8feso3870922eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 18:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744680119; x=1745284919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKXcVs9TLYIYoX5D9kRva9Njz4j3qneTEuSFzFkFN0M=;
        b=tftAUPYklmF5xgVPDL6ivM0FaQv9oIgvAHmK9fcTlVbCvIu+0omnswIK1l59/3ddff
         KlAjqxUsgdqTkauBi7CcDbG5+Jlpexyd4JLTjg+snbiHU49KKzscZV8A3kUd8VPetW9E
         A5Ge/RMPDzeYAsEhHutJW64aIJoehYyI80o0rn5Kiojks3LCZzsCYNvT4t+OXMXE8bTd
         qJF/LYCqUU8tt+EwBB+yog7FT+XsieLNviHxhJXZD9/2RLwLAbqSe9gIhHovV53cheRI
         jRxQYz5czBhR5TxyOBr+FEFw6iaNGxctAcMYM5XxMUzmSJjj+EEekw72ZzOYdGh8yrht
         LjAA==
X-Gm-Message-State: AOJu0YxY7Cf+r70ImGpAD0r6/xxSmIwyRJSjFByqUsOXCgqoqlyZh9TL
	5PnyCdm3PTrozhEJaEJ9/FNx8X8nzj6E9a0X7SDgmo6VFsLYl2XHKIolKw8/2dKpK+bVdL7BGNE
	t7DLD/2Kv6feDMpfFFTmvywKMHZzdEi+zfHniCXxHDaswmQNrSlULCSI4zqoCCR36
X-Gm-Gg: ASbGncu6bvIx3/7/VzTVmRaoI4D4iKxdVoq+WRLfgTRAENRUnrPgxJ7BvoYudXdY2xV
	w8i3GWIRPfcjaAnJeeRT/C0uGbN95/3f7JbTjQE3y6/9ADCARTA4RKj9BbAk+ibzSNsD+UL8rwo
	2Ipy2nGi9kbhiWwMv1/DkrSdCIScwh5HXDSqznPvmuNZK/4ElI87LxtJ1zrhuGceBsmuzWR7iKR
	phEJOGivccIoj0fC+lzvpgGV5D4jWh9FMrsr8qF2Oh+MnuZi9EJ1mdithcO5osgQKaT9GLtfQkh
	EgcbZ2JhoFChBsWJm8AV9bpHwi9Y/5SxhQz153Zqvaz1C3Y2KbRMjKh+RwTu+pLmpaTycKq0+i9
	HiguZt0+6H2Y=
X-Received: by 2002:a05:6870:ed96:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2d0d5f35c67mr9423171fac.30.1744680119152;
        Mon, 14 Apr 2025 18:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoEQEeee8czRaS6iisFw73lkZ3/rTzMXWM3Q9dNoS8x4rDjNCg7CxupqIw1sV3aQAevIyFRg==
X-Received: by 2002:a05:6870:ed96:b0:29e:65ed:5c70 with SMTP id 586e51a60fabf-2d0d5f35c67mr9423161fac.30.1744680118733;
        Mon, 14 Apr 2025 18:21:58 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968e090esm2652538fac.6.2025.04.14.18.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:21:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 20:21:51 -0500
Subject: [PATCH v7 2/6] dt-bindings: usb: Introduce qcom,snps-dwc3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-dwc3-refactor-v7-2-f015b358722d@oss.qualcomm.com>
References: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
In-Reply-To: <20250414-dwc3-refactor-v7-0-f015b358722d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Saravana Kannan <saravanak@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19997;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=tUD9eJwvtLprAiDIkI+5zcEFlhQo51kGRBVOgkbb0Vo=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBn/bSzWkhCHif56ojH/tbmh8xkst0OMlU3TFzdm
 A7qBKMzhnKJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZ/20sxUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcW27xAAyYt2fcYR1cubYjemMQcpqeNtlc2d9mj8K8aHigG
 dgN9T27+AG78PHuQuiQAAq/tvTDnnFbCjsV22SO5KxL/55Fz53DYU7p7/QdNJEDyVx1zDkUWf5A
 h3mUBa+mSFoo+6Mj1P75bDPAZtJoRs1jIHTekauN4ufbQf/pEmM6jQzzFk13nxJk/BEKbO4z+Jb
 XsKRW3c3v6FrqfqX7/PEsfP+CQbY6NErmoqdoOk5A7NlLwbmzw9dRdOknSjTv31rwLVq3GmaR+U
 xDml4M+XvsbVRhUGUFoR3kLRpAlCie+xKoYendyNbkUKTida9JUJFpE0eRDf7aGv32rQYwXi577
 mAc9X2wV7F3+MDRsoFkVngK8D/sLtc0v3clPmgZB1UyAEcu3U6HF1b+W44q6s1rcCHPYsjTalks
 rYjn1bPBRPkTnKJK4ImDg0AsJ2LMKofj5EMmVrI5RpXs5Ei8TuJmPtK+GLdFBhG9LaYSJZq+bqy
 frninJs+Sv6IHSBbTHNW0unF6tqFVyJZtBHYxgY5TYxF7n2RVzsgpKvPMy3ZQ8X9U4totfLGCpG
 +3lNU3cYwG5RYEqeXGq26GcgtARa8dJntQDfojuz0v4QScvnXo7MWwFig9vnSpvJC0MEW1jjgdM
 NaESeNZxASaD8Et0CpYz39nLptQsfnIZcUxT7poBMHx0=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fdb4b8 cx=c_pps a=wURt19dY5n+H4uQbQt9s7g==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=sxEQ-6IQeHkip0RCg1sA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3PKc69cbAbnM8eUTiqNzpVqUnFqMTfon
X-Proofpoint-ORIG-GUID: 3PKc69cbAbnM8eUTiqNzpVqUnFqMTfon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150005

The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
several of the snps,dwc3 properties (such as clocks and reset) conflicts
in expectation with the Qualcomm integration.

Using the newly split out Synopsys DWC3 core properties, describe the
Qualcomm USB block in a single block. The new binding is a copy of
qcom,dwc3 with the needed modifications.

It would have been convenient to retain the two structures with the same
compatibles, but as there exist no way to select a binding based on the
absence of a subnode/patternProperty, a new generic compatible is
introduced to describe this binding.

To avoid redefining all the platform-specific compatibles, "select" is
used to tell the DeviceTree validator which binding to use solely on the
generic compatible. (Otherwise if the specific compatible matches during
validation, the generic one must match as well)

Mark qcom,dwc3 deprecated, to favor expressing future platforms using
the new combined binding.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 622 +++++++++++++++++++++
 2 files changed, 634 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a681208616f3a260086cff5a28dc23d35bd96f9a..a792434c59db2e6ba2b9b3b8498ca43f0f8d1ec4 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -4,11 +4,22 @@
 $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm SuperSpeed DWC3 USB SoC controller
+title: Legacy Qualcomm SuperSpeed DWC3 USB SoC controller
 
 maintainers:
   - Wesley Cheng <quic_wcheng@quicinc.com>
 
+# Use the combined qcom,snps-dwc3 instead
+deprecated: true
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,dwc3
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8dac5eba61b45bc2ea78b23ff38678f909e21317
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -0,0 +1,622 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SuperSpeed DWC3 USB SoC controller
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  Describes the Qualcomm USB block, based on Synopsys DWC3.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: qcom,snps-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,ipq4019-dwc3
+          - qcom,ipq5018-dwc3
+          - qcom,ipq5332-dwc3
+          - qcom,ipq5424-dwc3
+          - qcom,ipq6018-dwc3
+          - qcom,ipq8064-dwc3
+          - qcom,ipq8074-dwc3
+          - qcom,ipq9574-dwc3
+          - qcom,msm8953-dwc3
+          - qcom,msm8994-dwc3
+          - qcom,msm8996-dwc3
+          - qcom,msm8998-dwc3
+          - qcom,qcm2290-dwc3
+          - qcom,qcs404-dwc3
+          - qcom,qcs615-dwc3
+          - qcom,qcs8300-dwc3
+          - qcom,qdu1000-dwc3
+          - qcom,sa8775p-dwc3
+          - qcom,sar2130p-dwc3
+          - qcom,sc7180-dwc3
+          - qcom,sc7280-dwc3
+          - qcom,sc8180x-dwc3
+          - qcom,sc8180x-dwc3-mp
+          - qcom,sc8280xp-dwc3
+          - qcom,sc8280xp-dwc3-mp
+          - qcom,sdm660-dwc3
+          - qcom,sdm670-dwc3
+          - qcom,sdm845-dwc3
+          - qcom,sdx55-dwc3
+          - qcom,sdx65-dwc3
+          - qcom,sdx75-dwc3
+          - qcom,sm4250-dwc3
+          - qcom,sm6115-dwc3
+          - qcom,sm6125-dwc3
+          - qcom,sm6350-dwc3
+          - qcom,sm6375-dwc3
+          - qcom,sm8150-dwc3
+          - qcom,sm8250-dwc3
+          - qcom,sm8350-dwc3
+          - qcom,sm8450-dwc3
+          - qcom,sm8550-dwc3
+          - qcom,sm8650-dwc3
+          - qcom,x1e80100-dwc3
+      - const: qcom,snps-dwc3
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - cfg_noc:: System Config NOC clock.
+       - core:: Master/Core clock, has to be >= 125 MHz for SS operation and >=
+                60MHz for HS operation.
+       - iface:: System bus AXI clock.
+       - sleep:: Sleep clock, used for wakeup when USB3 core goes into low
+                 power mode (U3).
+       - mock_utmi:: Mock utmi clock needed for ITP/SOF generation in host
+                     mode. Its frequency should be 19.2MHz.
+    minItems: 1
+    maxItems: 9
+
+  clock-names:
+    minItems: 1
+    maxItems: 9
+
+  dma-coherent: true
+
+  iommus:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: usb-ddr
+      - const: apps-usb
+
+  interrupts:
+    description: |
+      Different types of interrupts are used based on HS PHY used on target:
+        - dwc_usb3: Core DWC3 interrupt
+        - pwr_event: Used for wakeup based on other power events.
+        - hs_phy_irq: Apart from DP/DM/QUSB2 PHY interrupts, there is
+                       hs_phy_irq which is not triggered by default and its
+                       functionality is mutually exclusive to that of
+                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
+        - qusb2_phy: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
+                      expose only a single IRQ whose behavior can be modified
+                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
+                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
+                      of PHY address space.
+        - {dp/dm}_hs_phy_irq: These IRQ's directly reflect changes on the DP/
+                               DM pads of the SoC. These are used for wakeup
+                               only on SoCs with non-QUSB2 targets with
+                               exception of SDM670/SDM845/SM6350.
+        - ss_phy_irq: Used for remote wakeup in Super Speed mode of operation.
+    minItems: 3
+    maxItems: 19
+
+  interrupt-names:
+    minItems: 3
+    maxItems: 19
+
+  qcom,select-utmi-as-pipe-clk:
+    description:
+      If present, disable USB3 pipe_clk requirement.
+      Used when dwc3 operates without SSPHY and only
+      HS/FS/LS modes are supported.
+    type: boolean
+
+  wakeup-source: true
+
+# Required child node:
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          items:
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8064-dwc3
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Master/Core clock, has to be >= 125 MHz
+                for SS operation and >= 60MHz for HS operation.
+        clock-names:
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8996-dwc3
+              - qcom,msm8998-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm6350-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq6018-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 4
+        clock-names:
+          oneOf:
+            - items:
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq8074-dwc3
+              - qcom,qdu1000-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs404-dwc3
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3
+              - qcom,sc8280xp-dwc3-mp
+              - qcom,x1e80100-dwc3
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        clocks:
+          maxItems: 9
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+            - const: noc_sys
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm660-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 5
+        clock-names:
+          oneOf:
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: iface
+                - const: sleep
+                - const: mock_utmi
+            - items:
+                - const: cfg_noc
+                - const: core
+                - const: sleep
+                - const: mock_utmi
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,sar2130p-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8180x-dwc3-mp
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8350-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clock-names:
+          minItems: 5
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: xo
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5018-dwc3
+              - qcom,ipq6018-dwc3
+              - qcom,ipq8074-dwc3
+              - qcom,msm8953-dwc3
+              - qcom,msm8998-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 3
+          maxItems: 4
+        interrupt-names:
+          minItems: 3
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-dwc3
+              - qcom,qcs404-dwc3
+              - qcom,sdm660-dwc3
+              - qcom,sm6115-dwc3
+              - qcom,sm6125-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 5
+        interrupt-names:
+          minItems: 4
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: qusb2_phy
+            - const: hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5332-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 4
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-dwc3
+              - qcom,ipq8064-dwc3
+              - qcom,msm8994-dwc3
+              - qcom,qcs615-dwc3
+              - qcom,qcs8300-dwc3
+              - qcom,qdu1000-dwc3
+              - qcom,sa8775p-dwc3
+              - qcom,sc7180-dwc3
+              - qcom,sc7280-dwc3
+              - qcom,sc8180x-dwc3
+              - qcom,sc8280xp-dwc3
+              - qcom,sdm670-dwc3
+              - qcom,sdm845-dwc3
+              - qcom,sdx55-dwc3
+              - qcom,sdx65-dwc3
+              - qcom,sdx75-dwc3
+              - qcom,sm4250-dwc3
+              - qcom,sm6350-dwc3
+              - qcom,sm8150-dwc3
+              - qcom,sm8250-dwc3
+              - qcom,sm8350-dwc3
+              - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
+              - qcom,sm8650-dwc3
+    then:
+      properties:
+        interrupts:
+          minItems: 5
+          maxItems: 6
+        interrupt-names:
+          minItems: 5
+          items:
+            - const: dwc_usb3
+            - const: pwr_event
+            - const: hs_phy_irq
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+            - const: ss_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8180x-dwc3-mp
+              - qcom,x1e80100-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 11
+          maxItems: 11
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-dwc3-mp
+    then:
+      properties:
+        interrupts:
+          minItems: 19
+          maxItems: 19
+        interrupt-names:
+          items:
+            - const: dwc_usb3
+            - const: pwr_event_1
+            - const: pwr_event_2
+            - const: pwr_event_3
+            - const: pwr_event_4
+            - const: hs_phy_1
+            - const: hs_phy_2
+            - const: hs_phy_3
+            - const: hs_phy_4
+            - const: dp_hs_phy_1
+            - const: dm_hs_phy_1
+            - const: dp_hs_phy_2
+            - const: dm_hs_phy_2
+            - const: dp_hs_phy_3
+            - const: dm_hs_phy_3
+            - const: dp_hs_phy_4
+            - const: dm_hs_phy_4
+            - const: ss_phy_1
+            - const: ss_phy_2
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        usb@a600000 {
+            compatible = "qcom,sdm845-dwc3", "qcom,snps-dwc3";
+            reg = <0 0x0a600000 0 0x100000>;
+
+            clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+                     <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+                     <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+                     <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+            clock-names = "cfg_noc",
+                          "core",
+                          "iface",
+                          "sleep",
+                          "mock_utmi";
+
+            assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+                          <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+            assigned-clock-rates = <19200000>, <150000000>;
+
+            interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
+                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dwc_usb3", "pwr_event", "hs_phy_irq",
+                          "dp_hs_phy_irq", "dm_hs_phy_irq", "ss_phy_irq";
+
+            power-domains = <&gcc USB30_PRIM_GDSC>;
+
+            resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+            iommus = <&apps_smmu 0x740 0>;
+            snps,dis_u2_susphy_quirk;
+            snps,dis_enblslpm_quirk;
+            phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+            phy-names = "usb2-phy", "usb3-phy";
+        };
+    };
+...

-- 
2.49.0


