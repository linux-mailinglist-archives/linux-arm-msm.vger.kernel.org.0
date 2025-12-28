Return-Path: <linux-arm-msm+bounces-86735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EFCE5301
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 18:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5159300BAC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 17:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6741A83F9;
	Sun, 28 Dec 2025 17:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OxIe5rbp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S6GFiRuo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B521FF30
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766941295; cv=none; b=pioJdw4RL8NmigvyRrAtr4UVkK6oI1oxHFc6hmjJCeNq0F+6XGZb0I4DTxk6uUvawKbZHMgAm1qvtRotZ+pEvSS88ZjLhX3N84793olP+CM0E4pKn+2CVWd0S8EmwxmCSFPR7XiWTYaZjDFn7XdMqtU6eQR3NcctGkgFxsB34o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766941295; c=relaxed/simple;
	bh=Z3Uvt1g22UCAzzm9Ye5G+m0KkYhJ6zD99kCW5R0yLXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBd03YzF7LVIOFM5sKNBIgIGgqPnfZ2Xe+v+t2SNoJS0G4G8IaLYwkc1GQuUkgtIJDsG3CvkTNz8PvBgsXdfo4jOJ3R8QADtAwGr1Yi6K/peCwu5MLz4jMFExDERr8559yvQF2zDEQuB7g+Xht9Ny6/1+1vgA201sxJU00yxPf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OxIe5rbp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S6GFiRuo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSFcqGD2938515
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgkVy6DtzgeepUjDzeDturVG3Tl9T2Q5JP6w6jnsXWk=; b=OxIe5rbp2AI8i7+J
	sleeImxYtFB3KisFURIXpg9dmVXd4NIXyRYm0tQJ5b48Hn0bowHUTIKrkZYveCir
	nYoggDNWbkg+78ugS03nRjCLWajSISquA4pA4JAkfiDbh/ZFzjb+R2dmvoSZSUIN
	NMyJjDm/ROaw61QVK06iQ0c/OYldcJesoP4oVJzWxobvYBNslwT8IDlCkBnPp9zG
	uOJMW5vppnC+tCKeXGfJo0HfilqH0H2CId8joKYbv+cN5TUGrNDXXdscYSke6qwP
	Bu7g96MuPfLHbDEqcoMmePWlhBKQpvV1YdSF8ONIwdfEv006lzMfJngDBHmiMSqZ
	PItqRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba55e2nvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 17:01:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso78393205ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766941292; x=1767546092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgkVy6DtzgeepUjDzeDturVG3Tl9T2Q5JP6w6jnsXWk=;
        b=S6GFiRuoCpbEOHsP81kGArXGdbKuzCGcmZNktIdrn1LHWloN4PLkLDi33P+Ol6nY0D
         1YUvf3Vh7U1nZwyHRIRcLzdTdapHKO42i7ubOrppeDka8cirVv6EqJ58bayY8XzwYz33
         /CnhT38ZPmQ8HDR3xbNU2xfa1/0x+ISRC9If6ff8JjLxOlYSJHdWXHxRZgq0qq14kC3w
         Ew/SslMl00hGTENG2NkB35Q2ybc5RA9PHHn87EEOqD8E7q5OchSFgjUcj7MuJVJPfIl3
         z6yQvxiV0t/86lAPlMrTvQoyt+qnVHreyClzz+2V6wmYX5yhJXB5gv0opTupsFpbl6BK
         S0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766941292; x=1767546092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EgkVy6DtzgeepUjDzeDturVG3Tl9T2Q5JP6w6jnsXWk=;
        b=ARiHNgqZktbIf+UTA76B8WHDrR4221K2GRUVbUxexNNReAiyD9yBoQOhA7QWhpIE0K
         rZ7vlcTMlJfzSEgpbTlEnyOThLTWk0NoAOXmwj1KMPSDjr+ZEjjh2OPZH0GsyFWPkUBo
         h7BxeChWzdMZHsVqm1KrR6badMlMDHVA1OX6BlHYN8r7vuxkFQ7xs2xX+CJsDDHHkxGm
         RNyV8noenA6rJr28GNmuodKwJQNo6cvEYlHhrJumkWup3hmmeRXg3bcNkNIcAVgC2pak
         iuADd1QvgnEFl7nsA1QbfC9uVJ/H2BoSRnqFNN8RQwdYs0SxXDMucQrIeE7YddCFGzQI
         nmKg==
X-Forwarded-Encrypted: i=1; AJvYcCXC/TKnOL8UJ6XZAnQHn6EiTrVVIEQmxXhS0LfemrUhZ8MhbjUHRktCLVPb7n/QupohcTVCn1xo0q3597sH@vger.kernel.org
X-Gm-Message-State: AOJu0YxZp4zcDmGDdGcmkqV3K1A3h/NjCLDCq0N/+zE1pQtaHLyYUFYG
	ytwyUjJeJu3A/+Y+5LX61W1q+oazKa3jXPjVd5AWP0SjCq6PrJ0sHGb4BJE8FGOd+PjZLFdHTnm
	6DjR9kNyROaZxVDa8DBc5tVydKs98m1JoImkIdvH2qZ43d7l+netlKFKl/2XdJ07BEO79
X-Gm-Gg: AY/fxX4lXzyRHwaM6MhI88r4HfTYuU+9TA6nTdi14qwrlC7U2FL+rmMGdqRSDlCYFE7
	xDvdCDzMGes0jMFY9zjPQOrwnqdO1kK7Q4p3PBEi4rHifvS2KiU+lpDtB8tLB5ByC8pWk6Q9xvK
	PINfR4McX0bxu1RcgXQ97HIMA0yvTeoAemj9OGbR9KCaheke9tMiNgxO/iK25CFgy9uAGkEV7tn
	5QD4s6+Usno6WNCmz6qSIyhPUq78XtCkIVkNXJep57J+JlrxPe2K2vtpfQzIWwqLLX87jCVtm/y
	xfMWUtHOIsfULLl8uVwvbsZWE3ErE6jwZblqy5ozsItvhOPfPI7tPFFlFevFwpM+yQ3AwJqLM0r
	D1WQAnBZlvMH+gTof3lJ/NHQieJ9z24hQBhI=
X-Received: by 2002:a17:902:f641:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a2f0d5e6b6mr328165645ad.29.1766941291496;
        Sun, 28 Dec 2025 09:01:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkVDTis+MO+jJ2XVc11RH1dUAvWYZWPtIZDBfV3hoUR9sZUoKcqO5XGZRumnuBx6nmZp35pg==
X-Received: by 2002:a17:902:f641:b0:2a0:acdb:ce0c with SMTP id d9443c01a7336-2a2f0d5e6b6mr328165215ad.29.1766941290854;
        Sun, 28 Dec 2025 09:01:30 -0800 (PST)
Received: from work.lan ([2409:4091:a0f4:6806:90aa:5191:e297:e185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm27053925b3a.16.2025.12.28.09.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:01:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:31:02 +0530
Subject: [PATCH v4 2/5] dt-bindings: connector: Add PCIe M.2 Mechanical Key
 M connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-pci-m2-v4-2-5684868b0d5f@oss.qualcomm.com>
References: <20251228-pci-m2-v4-0-5684868b0d5f@oss.qualcomm.com>
In-Reply-To: <20251228-pci-m2-v4-0-5684868b0d5f@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-ide@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5734;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z3Uvt1g22UCAzzm9Ye5G+m0KkYhJ6zD99kCW5R0yLXs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpUWJZBBU6idHrl067Trml1v/iED+hvBV/J/neZ
 FwbwrikFlKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaVFiWQAKCRBVnxHm/pHO
 9bDyCACj9sp74ccPzpkJ1IG4951rGuWl8afBwQGBEi4fAyDDMKJv57y9xb2r3E4ZhIys7s22zjT
 DvdKi6U+IHgpnE5DOWQCjEuWm79P/Gfx+/juIaTkCbC8JXmzFMbfdyiNKgYhHoIKUpXSvA++3kq
 J6qKuqASYnaMz7hlXKUsU5KHPL/Z9bHUIVX+Z/mQju/dAXsblt96Nd55mfsKgc4LfvxzsqkOTJj
 AuA5VUMfteeSv2DHO2PHP/kjK09m7sy3dBcwyNwk2GLqg8RW57J9vFsGq3X+YN3vyKNnVwWJewe
 9j0czX0BdzpmH8hDO3DmYgLPw3qgUsRxjEi6kJBbhIFB+CMe
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1NiBTYWx0ZWRfX6kkeRkrBL90G
 P0jVNIlReCebPxySFQxApjSJVIhNNVtWQg+OUK0RBAIsg1ZjHk9yhJDBE4CLbLb/Vs7Ku/19Ujk
 SzsAuaNFJKy3vtnnipxy4mPe6DHwGnGfWkvA6HjfMrqRitOOpConbRJNeI0ahg6vpeaPfuK/ppO
 SIMXv7SxnX/JUCEnZmM3yLSPc5Qu2bXNtcxe6iZjotMTWDsajePZCTaNw05bE1eLm3J1rkQCf1Q
 +GNd/K1YEnwE+XDhCCwCV1sOHjvEeo1wrxB+/XjYzIy5PM4tPfdTTkvig5jclMgQknfl95jPURf
 fvLBV0PT+XoSj5DXPxQW5on5YyktSwGEWiBGp6tWLx8eV2fsL7oDr5SvhG9biIlpztW/fhG3hAf
 Ozg9lHym66Iq2ZGmxZ8QJV5J9e6Y8tVG0ps2Itg40DFHLrwJMY+d4L3y4uNlQdTIpiOZv23Ohhw
 HzYwb3leyOs4ZAD2b+Q==
X-Authority-Analysis: v=2.4 cv=UMDQ3Sfy c=1 sm=1 tr=0 ts=6951626c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=wQxqEM7SeJhtJFFEbD4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: fGyBs-GATnK5FnGozop16OlE1A1jNXAK
X-Proofpoint-GUID: fGyBs-GATnK5FnGozop16OlE1A1jNXAK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280156

Add the devicetree binding for PCIe M.2 Mechanical Key M connector defined
in the PCI Express M.2 Specification, r4.0, sec 5.3. This connector
provides interfaces like PCIe and SATA to attach the Solid State Drives
(SSDs) to the host machine along with additional interfaces like USB, and
SMBus for debugging and supplementary features. At any point of time, the
connector can only support either PCIe or SATA as the primary host
interface.

The connector provides a primary power supply of 3.3v, along with an
optional 1.8v VIO supply for the Adapter I/O buffer circuitry operating at
1.8v sideband signaling.

The connector also supplies optional signals in the form of GPIOs for fine
grained power management.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../bindings/connector/pcie-m2-m-connector.yaml    | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
new file mode 100644
index 000000000000..e912ee6f6a59
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-m-connector.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/pcie-m2-m-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCIe M.2 Mechanical Key M Connector
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
+
+description:
+  A PCIe M.2 M connector node represents a physical PCIe M.2 Mechanical Key M
+  connector. The Mechanical Key M connectors are used to connect SSDs to the
+  host system over PCIe/SATA interfaces. These connectors also offer optional
+  interfaces like USB, SMBus.
+
+properties:
+  compatible:
+    const: pcie-m2-m-connector
+
+  vpcie3v3-supply:
+    description: A phandle to the regulator for 3.3v supply.
+
+  vpcie1v8-supply:
+    description: A phandle to the regulator for VIO 1.8v supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph bindings modeling the interfaces exposed on the
+      connector. Since a single connector can have multiple interfaces, every
+      interface has an assigned OF graph port number as described below.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Host interfaces of the connector
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: PCIe interface
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: SATA interface
+
+        anyOf:
+          - required:
+              - endpoint@0
+          - required:
+              - endpoint@1
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: USB 2.0 interface
+
+      i2c-parent:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description: SMBus interface
+
+    required:
+      - port@0
+
+  clocks:
+    description: 32.768 KHz Suspend Clock (SUSCLK) input from the host system to
+      the M.2 card. Refer, PCI Express M.2 Specification r4.0, sec 3.1.12.1 for
+      more details.
+    maxItems: 1
+
+  pedet-gpios:
+    description: GPIO input to PEDET signal. This signal is used by the host
+      systems to determine the communication protocol that the M.2 card uses;
+      SATA signaling (low) or PCIe signaling (high). Refer, PCI Express M.2
+      Specification r4.0, sec 3.3.4.2 for more details.
+    maxItems: 1
+
+  viocfg-gpios:
+    description: GPIO output to IO voltage configuration (VIO_CFG) signal. This
+      signal is used by the M.2 card to indicate to the host system that the
+      card supports an independent IO voltage domain for the sideband signals.
+      Refer, PCI Express M.2 Specification r4.0, sec 3.1.15.1 for more details.
+    maxItems: 1
+
+  pwrdis-gpios:
+    description: GPIO input to Power Disable (PWRDIS) signal. This signal is
+      used by the host system to disable power on the M.2 card. Refer, PCI
+      Express M.2 Specification r4.0, sec 3.3.5.2 for more details.
+    maxItems: 1
+
+  pln-gpios:
+    description: GPIO output to Power Loss Notification (PLN#) signal. This
+      signal is use to notify the M.2 card by the host system that the power
+      loss event is expected to occur. Refer, PCI Express M.2 Specification
+      r4.0, sec 3.2.17.1 for more details.
+    maxItems: 1
+
+  plas3-gpios:
+    description: GPIO output to Power Loss Acknowledge (PLA_S3#) signal. This
+      signal is used by the M.2 card to notify the host system, the status of
+      the M.2 card's preparation for power loss.
+    maxItems: 1
+
+required:
+  - compatible
+  - vpcie3v3-supply
+
+additionalProperties: false
+
+examples:
+  # PCI M.2 Key M connector for SSDs with PCIe interface
+  - |
+    connector {
+        compatible = "pcie-m2-m-connector";
+        vpcie3v3-supply = <&vreg_nvme>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                reg = <0>;
+
+                endpoint@0 {
+                    reg = <0>;
+                    remote-endpoint = <&pcie6_port0_ep>;
+                };
+            };
+        };
+    };

-- 
2.48.1


