Return-Path: <linux-arm-msm+bounces-79433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A438C1A0DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DC5B14EFD7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C57334C35;
	Wed, 29 Oct 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNUjs9Wi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4Ol3EYg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11622334681
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737416; cv=none; b=mlDPU3aZXXl5MKJwXnMFoXbQ1lRgtNRP827wLCMZV5uuhp1Mv2HKQkiZK3dxrpjmftwLZM5eWPoEjGxqnYxSq0cxaJPUTbKscrC1eOVA18e8j8OYpqpRvP4/PU3dz57fAhh9NqfMWtFbLABDuv9fXgTUV7umuzowmFSERJcVIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737416; c=relaxed/simple;
	bh=8zvZqpFeuXSiqe4t+MpIJYoVCiPCsJm1Ov8cxUJVKCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k6kbXypBxfiLWeCNMxQVdxKk4GLWJqaVdMXJoz8kNsmKOMNjxbr/phzK2IX0HXsQMUpmUMMDGJZA0txbK21r5g+iUwoFGpf0cCyODLvS5YLJ2np0Dbuuttlu59D09LSx73Rh7cM9fE1CAExOSiqxUzDziBmeYDBELHOnT2ocWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNUjs9Wi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4Ol3EYg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vFp63755299
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=; b=aNUjs9WiPzPJbyID
	o5El/x/qjHFJZumDaOCr1WdSAX9BNRoLz0IUuDThNxzIO0CpQuKsL93IHl2S5aaF
	z/ZE/pD4bIDCoQoqAKJ7TOx4cXeb7FypdGKNI5/Mzdp2PArZgx5HJDLUSxwLqLZT
	scza5/NzsINlKasQLMXPjLGph/vrZ1ORukkiEqTTSgwDeAIYqjZCMgfBlfsJj313
	tYiy1ZsJ1APgYeeyTH6VNKoaiJkdDkQ56zHOaUk9FhBM5py/19eHPx31UXL4mCX6
	emrVXJWSHHcz36Gmr7Dl8AZDEbKXAA6jBCDOSV5HenhNc5tGXPxPb1HLjzeJB8mc
	63khLA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a02bfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 11:30:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso13784813a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737412; x=1762342212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=;
        b=E4Ol3EYg03P5/j5x6364/JsGtHzU84lfpic4l3hgBavTTi1T76iZHhMBNf6DQ6jIxr
         SGxLa8dypLaO5P0eM7uHTjKlUb48lzCOAklYn6Xr07qfSu+AK1dPXEdCJAOtWl4K+74I
         vgqmBXNLUhojAb5+hOPPITJOcIvj1fZ92izcT/AXt9CPoHQpYmhk/QFWL8ZZjgw4s/4s
         bKnwSzkFhiU+Kd5xbc6ME23hCrzO9wKmwCkX0s+jk+maLh2rF+md0SOPTSfFaK1umEud
         eYz23lQeAzf/VP9zp9dveKYsXoEKlmm5SNSBioEgcSCfPFYNtseqSLuk8xiVRIPwblpg
         oB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737412; x=1762342212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=;
        b=KapKUEYArhntkyPKGl1Am3c/39SsHlmX5kNAXD22mImLqLDuQaGzL0+lws7NeZvym4
         UPiEZfHic9pp76i3ttCg3I6ywgbA5UBsDjOSA85Pvb0nHbdwnu6GJMSMWKiMnDU7pZa7
         jJASVKLlw2BDZH0Pdi9X+zdB+TOD6onUWI4wD4mqa8PWyyAlKpy0wt5Y1IqF795rImnQ
         8nmsmQxXMOtgQ3TRsAv5wfH3RqTpH29fv0AKpyzQ1Q65FGbasheKY8GCrbobvQPlkthT
         V5TFd0GRiD73yp5pyWeHw5iZ8yb/UMrf2Y2CGbql/1A/poG3fOynTgpuX7VTDX1TbKoV
         myIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvVnXwlcB1ggV6ojS15xRtN0QyNfD4zNbTIF6YUYe+eR7aVTxEOv5MOY4I+8tRuuYBamo7htQ4hP77Ke9W@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrVap++GjwSvWwTOWA+scW7idOb69ejww3yevJkpOkWn3xwfk
	HUxHxiZfIjE3NtOiggNaFaJNZ5RSiyjvHGYDmR4rZk3QZ/69d0Cz6SfWEreDYluB38htKMqiwcL
	XVcExC1yeATZZ/JV/o6Tv0PItxL9VZWFBD5uZa2vVtDRnqW2TUHsjfd2LMYlW6RetUFWp
X-Gm-Gg: ASbGncsb4m7bMw4ySJUKnnLw2pCLjtJdFFmamWtfkPXO+HFN+LPqUUjMbGhRaOLCCrM
	zu60u5r2EPkS9TEXUEDRKQLS938j19fFYr8k9XBOibc1ll3OSMxKoyUtAnNkx/rMElfNJbmktgM
	9V754uNQBzqCMCvWx6gv2zcFu5TP/KIFEQ2Y6kLMCOXDatHmuPTnr1vHTTYZGp9wjzfvSXbf71B
	VzwG9DwZ/sCW52wzGHq8tFtlbhqavqkHxT/S4bOlyw5WEoxPCWOZUqzE733Cv6AOd1U86EiN9jP
	0Wgpctbn8cPhbs6LcS8/kkzk258Uvev9CwiZzrjgiG6lJWWTPEh6YqU1Va28OvDgjWW18KT9Vgh
	1Co/MphQgQUxEcqJbVVl5VKTEG9++Tjcyig==
X-Received: by 2002:a17:902:c40c:b0:294:e095:3d42 with SMTP id d9443c01a7336-294e0953f09mr29700585ad.18.1761737412190;
        Wed, 29 Oct 2025 04:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKen6ywCbIWN5KljQYyzqeB5TtouLUxaHfS6JF/boLobTCHja0f2s4KTk4RalY/HOi1jpb3Q==
X-Received: by 2002:a17:902:c40c:b0:294:e095:3d42 with SMTP id d9443c01a7336-294e0953f09mr29700195ad.18.1761737411609;
        Wed, 29 Oct 2025 04:30:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:54 +0530
Subject: [PATCH v7 1/8] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-1-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=5849;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8zvZqpFeuXSiqe4t+MpIJYoVCiPCsJm1Ov8cxUJVKCk=;
 b=AdOy0S3mZ/lZS6F+7uotar2aiTwAJgcCpLULu+p8hRxJ2GoC59XC6AshqTdWID39wa9X7F+yI
 SwyzihmiykADjAAaHp87ipSRmmDPYA9MGaLk/hG6c8rgLeeu4IkCPnu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfXyXTjSg7ZgrdL
 WUK9nIJua3dukgjT4F/PLB4hQGXyB15q7YXMaYMEtgCcTWsW/U4pZr81oeLoAA124G1Isfvi9Ei
 lCM0+DPckQ2u0O8VxC2xobx2rjbqX/XegkdBwPFd/+Gj9dq2G/aMHF8+Ys0QIOTH5hUP35NhSZQ
 TadEqMtoQS1Ry7Qpt0/bwcUpVleKbCgBMMfNIWNKiWMwjkVphLcNiWqomqJJJW/5qh2SU2ZE+Aq
 XM8RR4zbhewpJyXU48e3Zn07aDi9QJJOdgfz9I3wZGCiq7iOfCCBUvcjYEkVg5VM4tfNBsmGrXu
 7As0AQODDNRAW+e+hy5tiM7A8VVWxfEJuz4q9bboKXJ1AQTgzL+AZaIcHSOAj6WzeeSDdhOoO55
 pYIZQj1LUY46VL6E+CQLpjVWxAmoWw==
X-Proofpoint-GUID: A6zszly07Ne8aINpEvAWCY3e1ma2LjgN
X-Proofpoint-ORIG-GUID: A6zszly07Ne8aINpEvAWCY3e1ma2LjgN
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901fac5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=dWfasREweX4F4dHnDHIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085

Add a device tree binding for the Toshiba TC9563 PCIe switch, which
provides an Ethernet MAC integrated to the 3rd downstream port and
two downstream PCIe ports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


