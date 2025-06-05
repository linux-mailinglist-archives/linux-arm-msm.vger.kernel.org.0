Return-Path: <linux-arm-msm+bounces-60292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F41ACEBE9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852D43ABCF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F1E1E6DC5;
	Thu,  5 Jun 2025 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PykBNQOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536A20B7FE
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749112257; cv=none; b=J74yYbPTEEhXAUDYBKpcGY/Hq4IcguCTEmcIH1v58ST91Da+1m+NtiyZouC6BMDS9bnakHIcrcuk8gxn70ASIg98z66ku6Pmmi/J3zUAURr3+ArzO5kwCt8sALOHD3GVrp6EvqquTnYDbMil49ozZbb506WBGLmMTVJsfAybFL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749112257; c=relaxed/simple;
	bh=mZuE27azPdIvbDzxvjiYb0E7ejogNzvkKRaIgbsTuhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bb+72kDL2u85erSSyqw2pgo2v1viqPsfLqp3d9fEGp0G+jNlW0aXoHiatIlezgTJaKJgCrDkq1ZDG4GcMgze5fgG7J4617ylOhXPw6QY9nqfLt5sWpC55TLkPNn7KTgcJwtHh9eJ0n8eOE8PWtyar6xOYTcQrh+/3pmofDPwH/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PykBNQOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5557FwHN000695
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 08:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	45WlQ/PAE3dUlwreJniG3qDKTMo5dFCVE7Tjs+AVG7I=; b=PykBNQOAhXIlEPgm
	qTPsHCBk1dkHfLEyvHo7Tx4DHjAgmJq2bGT25ArSluF47xkKAz/wkbiwlTzP0lg6
	BPvgPNZGIDewxu9fGqMOMKYEGzmgOF2/ejLJ3yAUkR/4scL6vuWrD9QWgsTRpeER
	g+nDKrGhYwho+XAWxuJiDpdlDQ8rjgf7IVHTtKJY7+6+pMGDSttE0QNMV+RdY5gm
	gCyc5OB81gZ8LQy8XdGiQIjRxVez7oC8pOJYzDsMhrFdxqpTtoT0IyvUUlIpS0qR
	i5WjAzVOORKateir4Z8yKDLZ4ofE4CmSG5Mo3BsP/qNO1FPfCMSV8J+TVPYR2Nh1
	PKW4ww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q8pcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 08:30:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7462aff55bfso773270b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749112254; x=1749717054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45WlQ/PAE3dUlwreJniG3qDKTMo5dFCVE7Tjs+AVG7I=;
        b=hXwEY6H0foCg8VMckWojDi/8LVLDSHyMbxbZLi9/fwfQnrcwNtbZxfZNnGMMhciarg
         VteP0Sjmf4U356S5DE3uQWkgPgeHhlSxPnCuTce6vP5tNOpHu3DOO87Xb2zDptAowNZT
         DBTROltzaG2sIvnBDgIVZOAmB0DYt52GjCiMN3eM+GidXQHDrZg2f15jXoXNYM6xqebq
         zrxxkevW66DNFghqBmQQuiMeWIEED9RRMHj+KwjmPZqJi8o7JejUlxdOmcE/dqGUc12s
         E4FbbAdETdnyvjJIKTZ8IsD40s3TFT3ydbMqAJ0cTkNHN1AoxV8TE6HylNzV4RGdl4Zb
         dcSw==
X-Gm-Message-State: AOJu0Yx/oIxROyG/rGEHs9SY4xGWbAbX1zHWpn/dPFi7mXJBTeeU2msu
	aadggiISyZmo2Y0svTpQvomhM7jn1HPUEB0gwquh81BqvGY61CJWEs+6P5axHVEJRY+HOBYKkTS
	ikyZ1xroSnlKtbE0ZwZeoMPFcOVao5un4Eelp0ePLu6H3gLK9rFVlIHlKSia3ZgD5kABh
X-Gm-Gg: ASbGncsAW6HJvLYIHD/KqUYQEhcdoleFM/+clIl3QLgnk3nGayuhmuVHLBqo1Bt+Hlr
	ueEaYmvUU6YbYlGf/PWgJ9YFS0rauP5PpC3hcxVW2coyVaHLBEnHvttd0h8QPdSD0WUybantKo2
	HhSk7Zk17f/p0WWmq+iw4QVNIxDvH4bsxHuasW82wTPvBRY9yJop2/f5YYuVrXIF5oLWsQVK9nE
	jRBSsay7jrT2/5TS5yCTkS117B6ooRpwQFW6Ss57KaTQC7HeAPLjenll+ByxzEuusfeTpM/2FQO
	m3DWeYfbnSOtUD1WMm8QihkEhkUaS5dhgUTVa71zHQdwT23aS+hd1x/wOQ==
X-Received: by 2002:a05:6a20:9383:b0:215:f505:b49f with SMTP id adf61e73a8af0-21d22c1d177mr9125222637.14.1749112253648;
        Thu, 05 Jun 2025 01:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqFjTLGfcXnF+9ATlP1SM7b6Sc3CJEbPIP/XGue/SHgpd/MXqwn+cWPa2kNnGocEAwKpsIBA==
X-Received: by 2002:a05:6a20:9383:b0:215:f505:b49f with SMTP id adf61e73a8af0-21d22c1d177mr9125181637.14.1749112253235;
        Thu, 05 Jun 2025 01:30:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb37d5dsm9819095a12.34.2025.06.05.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 01:30:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 14:00:37 +0530
Subject: [PATCH v4 1/2] dt-bindings: PCI: qcom: Move phy & reset gpio's to
 root port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-perst-v4-1-efe8a0905c27@oss.qualcomm.com>
References: <20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com>
In-Reply-To: <20250605-perst-v4-0-efe8a0905c27@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749112243; l=4305;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mZuE27azPdIvbDzxvjiYb0E7ejogNzvkKRaIgbsTuhY=;
 b=JpvQJTfKOzsPUnxBNZ9GCINo/hwqV56gA/WXaqGSBdv9k3YYpjKjgTh0aiUk1REPlEmBiAOwH
 aDgxCvbwTBhDx54eH/7iOeUuQKvoaA+IO4rI8Vw/ZOvlOgZIiCIXOTO
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 0UDzloe_AcetayFpgRNV4rsW3FUyUWyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA3NCBTYWx0ZWRfX1kDnTS8UOeDY
 kWoHBA7tgVseFMBno7clpeqPVpJ6LPgO/aSchAfr+kBO/0EtOFhyULukdM/2ieuBnnOLiqkvOYW
 I6BpgFKB80I3fKhxo6eyw+tSw3Bg87NYTFjmBdJ3HCbz29BGD/rfssMffYszJ1YKJbBCplThmRU
 1pLWonlsVxJ2XvYef+Q4BnpOVVnJ+BJWN3PONxmSr7MexjF6cOqrpg5oieBCjjIitXTEfL402K6
 zvJ8GfUmruLFT3MAtvGJVD8f3QSkj+TuzmAibzywubVBBd5j4xkGi8CmiATkvN+ln5VfjyPrq8j
 vKiQgel8rbyxl2K6xvy7OhK/jIxRFwOS4gylUVWASJqDb06loELilG70EWp23csWkCn1NwgwhC1
 Ry99jkEFt9tDlB5TPf19lzebdr2Q+LxRmK7HyxqDz9SOiULdolqxCZoFUpMcnumPjj1kACyo
X-Proofpoint-ORIG-GUID: 0UDzloe_AcetayFpgRNV4rsW3FUyUWyL
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=684155be cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zZdbXEcupTeRExCOI60A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050074

Move the phys, phy-names etc to the pcie root port node from host bridge
node, as agreed upon in multiple places one instance is[1].

Update the qcom,pcie-common.yaml to include the phys, phy-names properties
in the root port node. There is already reset-gpios defined for PERST# in
pci-bus-common.yaml, start using that property instead of perst-gpio.

For backward compatibility, do not remove any existing properties in the
bridge node. Hence mark them as 'deprecated'.

[1] https://lore.kernel.org/linux-pci/20241211192014.GA3302752@bhelgaas/

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pci/qcom,pcie-common.yaml  | 32 ++++++++++++++++++++--
 .../devicetree/bindings/pci/qcom,pcie-sc7280.yaml  | 16 ++++++++---
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
index 0480c58f7d998adbac4c6de20cdaec945b3bab21..ab2509ec1c4b40ac91a93033d1bab1b12c39362f 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
@@ -51,10 +51,18 @@ properties:
 
   phys:
     maxItems: 1
+    deprecated: true
+    description:
+      This property is deprecated, instead of referencing this property from
+      the host bridge node, use the property from the PCIe root port node.
 
   phy-names:
     items:
       - const: pciephy
+    deprecated: true
+    description:
+      Phandle to the register map node. This property is deprecated, and not
+      required to add in the root port also, as the root port has only one phy.
 
   power-domains:
     maxItems: 1
@@ -71,12 +79,18 @@ properties:
     maxItems: 12
 
   perst-gpios:
-    description: GPIO controlled connection to PERST# signal
+    description: GPIO controlled connection to PERST# signal. This property is
+      deprecated, instead of referencing this property from the host bridge node,
+      use the reset-gpios property from the root port node.
     maxItems: 1
+    deprecated: true
 
   wake-gpios:
-    description: GPIO controlled connection to WAKE# signal
+    description: GPIO controlled connection to WAKE# signal. This property is
+      deprecated, instead of referencing this property from the host bridge node,
+      use the property from the PCIe root port node.
     maxItems: 1
+    deprecated: true
 
   vddpe-3v3-supply:
     description: PCIe endpoint power supply
@@ -85,6 +99,20 @@ properties:
   opp-table:
     type: object
 
+patternProperties:
+  "^pcie@":
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
 required:
   - reg
   - reg-names
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index ff508f592a1acf7557ed8035d819207dab01f94d..4d0a915566030f8fbd8bf83a9ccca00fbc7574bd 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -165,9 +165,6 @@ examples:
             iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
                         <0x100 &apps_smmu 0x1c81 0x1>;
 
-            phys = <&pcie1_phy>;
-            phy-names = "pciephy";
-
             pinctrl-names = "default";
             pinctrl-0 = <&pcie1_clkreq_n>;
 
@@ -176,7 +173,18 @@ examples:
             resets = <&gcc GCC_PCIE_1_BCR>;
             reset-names = "pci";
 
-            perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
             vddpe-3v3-supply = <&pp3300_ssd>;
+            pcie1_port0: pcie@0 {
+                device_type = "pci";
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                bus-range = <0x01 0xff>;
+
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+                phys = <&pcie1_phy>;
+
+                reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+            };
         };
     };

-- 
2.34.1


