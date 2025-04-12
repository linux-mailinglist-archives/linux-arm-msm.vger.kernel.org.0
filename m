Return-Path: <linux-arm-msm+bounces-54083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A9FA86A28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9899B8C5E63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E53149C4A;
	Sat, 12 Apr 2025 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUnWp1QI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB52148850
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422622; cv=none; b=KVnCEFrDuyxxU8TlBe7tAU6lYBwCh95/mGed06D8Osz00OyBkCSuwnBkCl9rs65DSLgJwkBp6xWkJLawspE+OYLM/ktqUlpe8A49GNtmnv/z5xFbUF/v494rSf2jYzrXNEMFWCt69eMEAVonKzOib9s+nosqBanNtuQnOFA5kcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422622; c=relaxed/simple;
	bh=7ly/vSNVAuPVCxwMQpXO/Ek3UE6d2PYuZ48w37OvQM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J866spozqcO2Zlm730j+AqisR0Z3BtHEPh0uKWKNq/40H9aEY+0mcddZYc/nILdOhykrUydSwM2j+47p+sh+aEuLorJyKTet+imDsRgQWnuTmaeGjdJu3DwVEfHa7FTr3/Pa7PypKbgAX1pICNe66y58sFWmCG6eU4fAoDTAnoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUnWp1QI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C0K3OK006438
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYUdwD+yD0sHQnFUbyYkCiBi9QABRY3UZ6pKNYaCBAA=; b=cUnWp1QIi2LaUZHH
	137ehiPJ5Xyd1HLTgWcaJCCSZPUD7fZNU0L52DgY3OfgV6JrZpVrqzAgmSmriN6a
	eN4jPv6BkI7GqvWmUIwZGuX/8zqmIcKdcFWB488qpmd2KCUaQt3sgnYMWscj5PHp
	SDc3VtwEkeQ9AAOC4itriFR1PITVu0IxmkPg1QCuBHC827QMjSkez7zjPhQARvla
	/wmYrYmq2vTwXDx/e1XWcpFvusPSD+1Mo4wtUWfVnM1t0Q/XhnxZpm9Ijv1aaWBr
	SqbBrGR0xFDAK+B4qNiN1X9PKaieW19P2ku9J6KKDGBM3uwcrl05AZ0dKDq9p6vI
	9ZmXuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq03sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so2736490a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 18:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422618; x=1745027418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYUdwD+yD0sHQnFUbyYkCiBi9QABRY3UZ6pKNYaCBAA=;
        b=leR+5fQ28Pt2Pj9KBYuL09kzDyIKgNak06+Y7JbTOJOeJMOM/EtFpeckOEELrIU7rq
         SM6x334LxfcKdIW92wJvzrKDLSty2c5o514J6VIS7Zelz9bDq0vq85dt29v5jyFzfoNX
         wlFpqUSU9wRq9gWg7eLGnfJhN70FEjNGORPEjl/hwHt2tOPi1X7WJWHfNRBeP5NU5Nne
         vrLrlV7ffUGi7ukvvxeDP42rM7Z4e7cWVPSO90lqey+HbaotCykYwSQH4wQVF889WWpw
         5GhOjxF2NAqoOtdbR3n6UC8SednWA8CUlimlrxWtisYbV5cQ/ZpBjjcZ50S37irdHujo
         3m/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIpyQ9WN1+aBpfOyMIDesT3CIIl/2vjDkBQlQU+/UOuWQkETHi4SUCPlXlfsbDPt8m1q+nArk5zwvFanX6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tsBPHx6lgrey2lBcLcYVVPLwLZVJFo1K4oBGvuFdF8fQf+Ql
	T9TxG51tmq531d7YqEAKgigCoD0xGUuTsuud7OPG7rlRQk1NU9cdpafxyeG84mJtupVnQTP3ksv
	ta5JTXnN+Tf3f5nbwqmScYQwsWeJ4rcboKM0Ew0Ns6Y9fOG9o0b9wkcpw2t/XUjTZ
X-Gm-Gg: ASbGncuFM7jgUgNwanKN1pGDHZ79iMGdpo5wv8H6YnWhK7mWfjUJnmDaaUn62Qbk3f0
	zAxMoBjIKnBEKzJ/PeRjyKZSyMWhCc2VsU16DKyovg9DB4GJHzbJ/SCIdXDqvMrDzQ3NdMuyaIl
	+2x2nfoNe11mXVBP57sXi/nsEKoI7d6h/oJDvms0n+/5PBti+Ob9j2nHzbmgvcIVoDQ1fuWTK41
	ackgt+4s8HMyDLmQGJh8O33P+W820FDPl7V2TBZAqRdjaCnjlrD1wRuiZej/Zn7l2l3wuVDBYps
	TyRUKeE8Ld8dmPn+y7qEFVbcV1hAVuPt+qz1thh0jPdzBUw=
X-Received: by 2002:a05:6a20:9f90:b0:1f5:8de8:3b27 with SMTP id adf61e73a8af0-201797a3bb6mr7953664637.14.1744422617927;
        Fri, 11 Apr 2025 18:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/ARda/x6auCifeCwpJgjOXecgsYCVR7/FzGiQ/xq8xxj7pXpDboMkT8bNdi/Rf1wTFO19FA==
X-Received: by 2002:a05:6a20:9f90:b0:1f5:8de8:3b27 with SMTP id adf61e73a8af0-201797a3bb6mr7953622637.14.1744422617491;
        Fri, 11 Apr 2025 18:50:17 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:17 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:50 +0530
Subject: [PATCH v5 1/9] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-1-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=5799;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=7ly/vSNVAuPVCxwMQpXO/Ek3UE6d2PYuZ48w37OvQM4=;
 b=aLxfFILnCX3l/0pFxyuXFOK57feDqGnrYE3vTLZ58VtO55oaL/xUskcYUPIn8rHe1KQcXBfmh
 pd9IoDMmF/cA5kxDbJRhonEpa2oIsFGr8TLDyZsp3LRNxozVmyMKAuk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: q3oNOuQDSWk-si4dGd2oXAUtVOE-YVem
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67f9c6db cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=dWfasREweX4F4dHnDHIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q3oNOuQDSWk-si4dGd2oXAUtVOE-YVem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120011

Add a device tree binding for the Toshiba TC9563 PCIe switch, which
provides an Ethernet MAC integrated to the 3rd downstream port and
two downstream PCIe ports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..82c902b67852d6c4b0305764a2231fe04e83458d
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
+  - Krishna chaitanya chundru <quic_krichai@quicinc.com>
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
+  reset-gpios:
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
+  - reset-gpios
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
+                reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
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


