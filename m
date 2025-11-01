Return-Path: <linux-arm-msm+bounces-79972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A312C27711
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 05:00:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F01E4E2DEF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 04:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3706C26560D;
	Sat,  1 Nov 2025 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARCjd3mR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G2jkhru/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853ED263F52
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 03:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761969592; cv=none; b=UQoZsw8JtQ/enmfh4DcjRC8fqdGApJDtKpzPNy0BaNFJocc8Xn4ePOgyDSqRsPJ3EJsxE/QWVKgV0JOjd7N3bC6r1Ws+0+j8owfdiv1FHoI/VoM7Q+G4RVI0vqH0GoBuYU8P1JcTjRc7pJzZ0aUjUAuwbwGLtkDNnP99y23RIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761969592; c=relaxed/simple;
	bh=Yx47/v7UP2S9t4kbCJoO8vfIzHGQNKl3EuLxc5b7Of4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkWfYtfvyPp/wi2iQGutmrtEkJIfbX5KRn4uPHMAZJmidcxOIFA75XxolqEfdeosuTvIH6dphK7DvjQTopRtj3E7h6eUKxLl3rJBxtVVBpelY/3DVHFri/LfhRf/2RKQ2qyw7YQwbu7FjQy9DP1P4jslx09yDBtj7WkDcj2WnIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARCjd3mR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G2jkhru/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A13l4AS560355
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 03:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOuNrPNOxNtGjbqecQTezoMALC4gh5guIoDEvWHDAF8=; b=ARCjd3mRjjR+xne1
	2cTg7UmlpSzqP2pV5LVSpc3OclNEYf9+oXaVE6dFalPb7wY9gYGGM2AGB1qC+xzs
	qeNv24mCaZTUd8RlwUUP0yQZ3dfQz7xCz/snR3/tQXwf2Ht6AoMxcE8z1LzNJfq8
	z0Vlpb0cgfzQ/XYuOeIkWdSAwn3/0Kg6jHStDmAp7WVgtKYFoOiKvb5VXoGZOvPD
	iGOB0m3oX4ez7VM3wDZg+1H3Jf9u0Ams14giD6Bl3inq1arClVorKIkNl5OjRux6
	yP73RPqexEyceFzTtY+HvMp2NPpn56N05NJDEkuLLaVSE9BIyrFQfhh6R1ajrSYD
	bOPtXA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8g0ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 03:59:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290c9724deeso29816115ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 20:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761969588; x=1762574388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOuNrPNOxNtGjbqecQTezoMALC4gh5guIoDEvWHDAF8=;
        b=G2jkhru/RMUNB7Ml08cXmo73GunQHXOIyz2khe15x2rF20H7H7qEPQ5vW6dFQtkp7z
         Xn7Cl0BcMmlDNizDYiV1E31cbxkC3LodUbdhsjrsnPaN69Xbx6Dk4thO9TWkIezuRDv2
         gyGA364CHgU00yXD/XVHhkb0NSDGu+hd0vX5AzVVPFvF457BSbNxWO6Tg5fRew7DoNu4
         Un9rx4almR3XZhcaFUuejrwREfF0nlWZtHh8Ekh6zsztMrJud1miUxHdAuSmYPvDSbib
         soXZxy83Gl4n8cRuQiaej0HPTlrL4BIlDGrFbenvQCloCJy9XWhVBRDLvCnOv3WGhW1f
         NfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761969588; x=1762574388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOuNrPNOxNtGjbqecQTezoMALC4gh5guIoDEvWHDAF8=;
        b=Wkr0LyinSNnBV6VpnTspajvCUslZA/+ZLQMmsfpqlG6YXJ0Lv5Xmw20cfJsXryCfCo
         vSkiAbAbMigF0aVS595BCCksGwN5xLjECZQU8e8wWaZxge9BmwRMcjOIa9g7tgh4WYou
         /5PkLiXNYSi7H9FrOb0jq5wV742zcQ2MnJT8zWRxvkPZwr83MhtvrYuDz/6A8oSDp6fr
         QffWIOcupViA1jPNFOi/NDadYyTNdCkvTryhfhP/9oTwshUQsSRjcXliEss+1bJK1UmW
         5kGMvAvaUm1Eo3DeATST9hZ6pwBJXfq1xkWnL1xfyrc+aJOt6IeUnONXzQG3m+UXwQCE
         KkFg==
X-Forwarded-Encrypted: i=1; AJvYcCV3xUgn0Jk6s0J/shXZgeM3G4UM1zzgezoqTodkD9XYkoO+k85jjHoeTHaT1VExOzCFlrg/4GWFhZiHvRIf@vger.kernel.org
X-Gm-Message-State: AOJu0Yza5fWwdTQjN9ELAYVNxfm44ZQJScumniWg9oh1y4D9BQKIv2yK
	Yj8OdPtKEHZGtWOAXfiEXY3e8m3/NhyRXOek5tUofgWcPuj7H2nWLZOA1aV49pw8a6EQN0pGDas
	+DOARDomdMiOZ691k/ksJwv1sA0ZcK98vPyLe4KmbScQp5KUXsbPhbY/z/EjHkX8WakrR
X-Gm-Gg: ASbGnctKMSkHxChbdJRfDwA7f0KCcjhHVnRoO2b8nPByW41oPEl1H3gow/iNmI8RhpT
	IBQdDFA16SFmHI3L83UDGfpbg0fh6+1crs52ICd2p0kMsDq9U4z8a/DXjB14OsTFhNA8F3kPosY
	J+7nhODAnS3/SQjYBFiviH3Z5GiaYAxR8leLeFs5gm7hrRYSum96UPrBet8cJR9y/etlAc8OPXs
	e402v+DuFA9VbR//Izo72Vu+E+nFSFJfa9gIu9vEDu28gDyCyzsidjEvFBs5r4Z7Wo5/sR/7Nfv
	BzJ0blidRGidp+8GYFp6xOA+IXHJioZrGcyCaIQqXdQLfC6F2D5ODafX6CSxBXp2eNWTe4bNe6N
	Fa7J4DiTaGezN3u3HEyrXzYjeP52xQzVn5Q==
X-Received: by 2002:a17:903:234b:b0:295:3e41:5aa1 with SMTP id d9443c01a7336-2953e415cc4mr43463895ad.21.1761969588185;
        Fri, 31 Oct 2025 20:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEou51Q4Z7vnpG3VKsqD3DPTzo9lSyIzhBdN0I3SsB9JhOkCBLILKQLgfWf8OK/OV1KgNHzng==
X-Received: by 2002:a17:903:234b:b0:295:3e41:5aa1 with SMTP id d9443c01a7336-2953e415cc4mr43463495ad.21.1761969587623;
        Fri, 31 Oct 2025 20:59:47 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm41490725ad.2.2025.10.31.20.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 20:59:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:29:32 +0530
Subject: [PATCH v9 1/7] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tc9563-v9-1-de3429f7787a@oss.qualcomm.com>
References: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
In-Reply-To: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761969577; l=5917;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Yx47/v7UP2S9t4kbCJoO8vfIzHGQNKl3EuLxc5b7Of4=;
 b=6ZhmnVVExo5QQm+sgn0bDG4eLmae4mGL05kLPko5sybEGRHO3CWJHXMYEewwqs2/nLEBHxP7O
 HGjTNqhbVXFBxs24h1ou4jhppEtQOBNYvV9bsEbxJwwqdsHmvZJaGzl
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 3epkvOHvew48BaFYn5zZkeFXAMMMnutV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzMCBTYWx0ZWRfX8HS/BGdgub4H
 0OQy32NOJLe0pCV1itXtPhz76LXOBSAYSR6WaOTNEnglsrssFBa8RgeqLvxUbuyp+SlWvOnxCAO
 E2SgzNHvRVG2lj3pxv2O1hokSTeEbqzGL5UISZwf2Ac5BOk/eISnZjNlUBuYV6pVJMzP/xn3xy9
 pmz1i45mUjk9Y1Gs2Wm0+3hAJ0qGUNZeMIKUsf/5ZvhQQqP3QLefLa5G+LbdL6f0wziCNr6wh4p
 G01n2XvP0nvTew7o5+KoSHFL0i9x3IXjHf7urPt5tknKkpTpcBKzmn51E/36+eDv5B/XUe8tGxM
 A3tRktF6o3vQarfzz8k4sEeR5JxJpIDeu3CaL+05Gw3HYIMTZjKkCH7MJ/zPmL4BvSSV26ZGgNc
 yoaLI0SgMYwvbJsVgTeku7B1LuPDSQ==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=690585b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dWfasREweX4F4dHnDHIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 3epkvOHvew48BaFYn5zZkeFXAMMMnutV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010030

Add a device tree binding for the Toshiba TC9563 PCIe switch, which
provides an Ethernet MAC integrated to the 3rd downstream port and
two downstream PCIe ports.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 179 +++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fae466064780959833e7102164a124086bd9099e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9563 PCIe switch
+
+maintainers:
+  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
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
+      used to configure tc9563 to change FTS, tx amplitude etc.
+    items:
+      - description: Phandle to the I2C controller node
+      - description: I2C slave address
+
+patternProperties:
+  "^pcie@[1-3],0$":
+    description:
+      child nodes describing the internal downstream ports of
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
+          intersymbol interference and some reflections caused by
+          impedance mismatches.
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


