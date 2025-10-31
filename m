Return-Path: <linux-arm-msm+bounces-79861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2BC24B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C536140616C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC45345CD0;
	Fri, 31 Oct 2025 11:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiWbgn0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UguW/VaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E84345CAD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761909137; cv=none; b=W2bcDDmGcDdTHQ5uxkmVxQ+WApozFFaN/NhH1X4zUHguAzReFN7RMwR//LNPJx24ZOza9ajG6keJdeD1/01zJlTbeWJ7tqEXCT4CwxD+XQn3ILeoQstQEs602Vg1wAG0CVpZ6FhlOX0pz/SrG0SD5hVoDvYCvx6qpGGttX4BJCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761909137; c=relaxed/simple;
	bh=E6iSKeM/o/IJZELA0LAoymBiBk6BPTb2AFMqNSnlB2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrgrrf/H0BolEJfMldoaRFOx3E7RyNUHJRdI/tr2/ujcUNeuPOaW9qVvOM2MImM2IUdAgwmXTHXJXPhhSYNsWyEFbsDr+zWoAfAc/dygIIgCaH51p9LfZBA/HDwlFUboKPhvGV3bl1h3sGQh4k5kcbQswvOpCGLIAWAKpyjUN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiWbgn0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UguW/VaT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59VA0SFM1571314
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iX8CUTI7t7KJeW7LRtJ8rkcBGpOqzKSm1soYkYb2O1g=; b=EiWbgn0zauUyktSB
	XbUuN1Ew/FqqalYUjUozxZtOHbQv08a4tJcL2Xf/aYSD5yvaPAD+NJnTzuJ5tMrh
	ykZUJ54sL8nhCoReEqNkZEFcHnfUgsY4/h8gqMKQtBNZ4aPeoNrc1P2vtVvDsPUV
	B8PO1eYhdtiZe48z3H39mx4+OD3Tj9GbgzbHmyTiR0nrdAm2j2IlpgUt6y8m2EPz
	Os4szCsFD3nAbQVzjPUvV4zPI9hKg4J1V9+itAmsRJmAMrGopiaxXQTjEdSiMW1g
	wSB0GmMn/gPUpIRQsHxD6h6ayipRjBq57LlqFumV5snLPbB1XGn/dE+r++vGDI8b
	njNQMg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc1cwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:12:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7900f597d08so2116348b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761909131; x=1762513931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iX8CUTI7t7KJeW7LRtJ8rkcBGpOqzKSm1soYkYb2O1g=;
        b=UguW/VaTauPCFpA3CJyozqWdjhb7VX58EZamQwPIgk9a7D+5kPTgmakzYh5N80Judy
         lrbyb95BciwT081W593+b+Tk/AloKcTv79Sr7rUCQI9/itVSQeVvIbvcrf5poh3+4Dtr
         8NBCGpYtJKYPqKDCY3R7is6wqj3EauwPUcTdABrNCxuNmXRFdiE7n9xjkRxl1Pn+NrIX
         A0KkzFWP67D78O+tD5UVJeLLrwPzCcu0jzJHjWVhoRMHD4LJV2MMokHuu1bcUEsCup35
         6ZyfXA69as3r0BTi9lGb/TK4riKxBeR7gRiGYEwdiZzSVQnK8pa4L/yQYex6DOWkoYO/
         LtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909131; x=1762513931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX8CUTI7t7KJeW7LRtJ8rkcBGpOqzKSm1soYkYb2O1g=;
        b=tjCwGlPQNrMjM/GlqoUoIkUe4HJEvFdF1L3LVulVZWW/+PKBk1Qb8kBAr6xYDalJBo
         MgQf8mX5QcQoFOn9LNo5ScpIeLDKHF+fTFGQJYA2uL/1RSDNkDz7oMdtA53EHYlwagqs
         DWjcU/j1Tz9rZ6+8hCxm7SIkKwceTTPpWBMbs5IBtTK6NMo5kN7HnzPFRPp/yv6jHlFn
         Iap6HqgIaTlFANA4PmjvhDDXfdBp2BDrtSiUUNgcjhNhXHlsgfODKAIDi0hR64Mi3Dpq
         C0QA8+Xd1HYbsosG36qN33hoDrPuM9/uHDcD9ljmqy8IuEN/P6rZSgux0tUaPRsclMEy
         a2ug==
X-Forwarded-Encrypted: i=1; AJvYcCUS43mmzrf1OifposWfBPWuRQTjuIyyfBpDbKBvQXlimngtXLuSqrz1AdNsiA5b4WTePVMF8WLZHm7tsC3g@vger.kernel.org
X-Gm-Message-State: AOJu0YzOrDmGP0k5js1ExXvCSIS6B3Xhix4DsM3MUCEs5GPE7W9r3FN4
	rQ22vvG5XtfgTJLNxrq+dBUqQ2DT+1uSxRmZmmubeFFAJYcWjxiz54/fX6SlxMg3WkU/1ol0MeP
	OCxWS/5N5A8uD12UBR80coK3OD2Lgc3O75KkzWSJnUXRjLH3FsHNNcm08vdMll8I+Pd6u
X-Gm-Gg: ASbGncs/g5hAOcph0+e7v2o5Ww/OBreBItwRyUTLUjI6LzIOQi9RfnTe/ZkGIdCAnAF
	IcL5Zo6SmlE7sArnyXCQfVW+7A+nI4GR0VyeisXVntw3JxlnLtNKHdcknYojHQhyaMi1Yb7Y3Sb
	pXQSxZs24EB2Wi7BbNUmwov45dykjXxkBujLOHo4fDKWDtUufnm9DaKz7z+cyq5PN2pgofOzYUi
	L9BMzrHtgIJQr8zYJ1CDXgWGS4bueEAuYijnfqy0RayUfbE5i9Y65atVoZptdO4SR3g4lbbhDy9
	bz6l3QtyP6t8mKvFxB5nmX/3NKC3A+OKVbgGBprSC9AWv57wo6NApOnR+Osq1phrspBNaYdkyPs
	dZCdQpeA46hmmL2zgyMGD8Sj8IOPn4ULq+A==
X-Received: by 2002:a05:6a00:1749:b0:7a5:9cf5:b341 with SMTP id d2e1a72fcca58-7a777760c0dmr3911507b3a.7.1761909131125;
        Fri, 31 Oct 2025 04:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/hATFn3fl63MJdz4ubpFEE+4fraBcVc83mI2pkumj6TLEm2CM2y+wAEarS2kI1O/ocVDQSg==
X-Received: by 2002:a05:6a00:1749:b0:7a5:9cf5:b341 with SMTP id d2e1a72fcca58-7a777760c0dmr3911450b3a.7.1761909130535;
        Fri, 31 Oct 2025 04:12:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8d7793fsm1887363b3a.25.2025.10.31.04.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:12:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:41:58 +0530
Subject: [PATCH v8 1/7] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-tc9563-v8-1-3eba55300061@oss.qualcomm.com>
References: <20251031-tc9563-v8-0-3eba55300061@oss.qualcomm.com>
In-Reply-To: <20251031-tc9563-v8-0-3eba55300061@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761909120; l=5904;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=E6iSKeM/o/IJZELA0LAoymBiBk6BPTb2AFMqNSnlB2A=;
 b=CN1Au2JKH4NoyfYr+tnhjRCGcJ5iDxAtH3BfxsEuqyngtgAC7QuVoBanO7qTtjsTbjg2LTLy1
 WwGd89oAuWaATF56JUkuRLP9v6uQpBvve12QpX5E8wwKlPTMRhFwQWJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwMSBTYWx0ZWRfX+pu3el6iDRdx
 G8ldUs3VpE1hP/8BNg/1wTBdfCLjUhkTlO9SlrioFihEFY90pcc2FfdZKiZPNn1lxwkd11odoZc
 IQd50JerNq/zSWCRpZuvmzRf57FUAiLSMCGY0Erk4n4RsZTjT5mL7I9nag2aoJba3p9byUq0jPb
 ijpDvbERAZYjqyYCUWD6ob5fdDGY5zVcRs33OZuy2yRR0UWJSDR0UbOf7LqyVlK2b9lPa4aYTaJ
 0FZZWAXoqIx/WBzfTR4NVjm123kYi24nG4LM+qrUfQAmB5xnP9hE1OXyeitT6OPoMTGX/TnazB1
 oZb8Up80sLm6C2OdMwRsj9X7KGtkBkLvIFXriuDi101RJtQG2iYerioHeJNDWcE8/2tDqxMRp4v
 UfcsRm4Tqqq/lMZQdmeJc5C0FkCzjA==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=6904998c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dWfasREweX4F4dHnDHIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -sCpjLq-Do306rWHfMepjNC4h_jP08CX
X-Proofpoint-GUID: -sCpjLq-Do306rWHfMepjNC4h_jP08CX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310101

Add a device tree binding for the Toshiba TC9563 PCIe switch, which
provides an Ethernet MAC integrated to the 3rd downstream port and
two downstream PCIe ports.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..a957a4bc38d6c91a13797f848b0e2faa64eb02f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9563 PCIe switch
+
+maintainers:
+  - rishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
+
+description: |
+  Toshiba TC9563 PCIe switch has one upstream and three downstream ports.
+  The 3rd downstream port has integrated endpoint device of Ethernet MAC.
+  Other two downstream ports are supposed to connect to external device.
+
+  The TC9563 PCIe switch can be configured through I2C interface before
+  PCIe link is established to change FTS, ASPM related entry delays,
+  tx amplitude etc for better power efficiency and functionality.
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0623
+
+  reg:
+    maxItems: 1
+
+  resx-gpios:
+    maxItems: 1
+    description:
+      GPIO controlling the RESX# pin.
+
+  vdd18-supply: true
+
+  vdd09-supply: true
+
+  vddc-supply: true
+
+  vddio1-supply: true
+
+  vddio2-supply: true
+
+  vddio18-supply: true
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle to the parent I2C node and the slave address of the device
+      used to do configure tc9563 to change FTS, tx amplitude etc.
+    items:
+      - description: Phandle to the I2C controller node
+      - description: I2C slave address
+
+patternProperties:
+  "^pcie@[1-3],0$":
+    description:
+      child nodes describing the internal downstream ports
+      the tc9563 switch.
+    type: object
+    allOf:
+      - $ref: "#/$defs/tc9563-node"
+      - $ref: /schemas/pci/pci-pci-bridge.yaml#
+    unevaluatedProperties: false
+
+$defs:
+  tc9563-node:
+    type: object
+
+    properties:
+      toshiba,tx-amplitude-microvolt:
+        description:
+          Change Tx Margin setting for low power consumption.
+
+      toshiba,no-dfe-support:
+        type: boolean
+        description:
+          Disable DFE (Decision Feedback Equalizer), which mitigates
+          intersymbol interference and some reflections caused by impedance mismatches.
+
+required:
+  - resx-gpios
+  - vdd18-supply
+  - vdd09-supply
+  - vddc-supply
+  - vddio1-supply
+  - vddio2-supply
+  - vddio18-supply
+  - i2c-parent
+
+allOf:
+  - $ref: "#/$defs/tc9563-node"
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+            bus-range = <0x01 0xff>;
+
+            pcie@0,0 {
+                compatible = "pci1179,0623";
+
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+                device_type = "pci";
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+                bus-range = <0x02 0xff>;
+
+                i2c-parent = <&qup_i2c 0x77>;
+
+                vdd18-supply = <&vdd>;
+                vdd09-supply = <&vdd>;
+                vddc-supply = <&vdd>;
+                vddio1-supply = <&vdd>;
+                vddio2-supply = <&vdd>;
+                vddio18-supply = <&vdd>;
+
+                resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+
+                pcie@1,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x20800 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x03 0xff>;
+
+                    toshiba,no-dfe-support;
+                };
+
+                pcie@2,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x21000 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x04 0xff>;
+                };
+
+                pcie@3,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x21800 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x05 0xff>;
+
+                    toshiba,tx-amplitude-microvolt = <10>;
+
+                    ethernet@0,0 {
+                        reg = <0x50000 0x0 0x0 0x0 0x0>;
+                    };
+
+                    ethernet@0,1 {
+                        reg = <0x50100 0x0 0x0 0x0 0x0>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


