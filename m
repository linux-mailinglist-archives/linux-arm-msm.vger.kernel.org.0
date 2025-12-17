Return-Path: <linux-arm-msm+bounces-85567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B4CC8C3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EF493093FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27AA34D919;
	Wed, 17 Dec 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nta7Ousy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPHRhvxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C04C34D4E8
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988387; cv=none; b=XWR1uu12DMGq/ZjKaUV8ywX5u3BLROX6LETeMIR+WubsQgBohV1eAl1sAsE3LGwHwjO6e24iDK5125eK/TseL4hmPpw8SEsdG7f8zs1qSIAkmUKDLhbh8NX/JGogQf6uGHN4tOKyculYJITI0TQ1WwoeaN4GJw6gGnx9UKU7yrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988387; c=relaxed/simple;
	bh=6/HmpwGYfmKbFRr3CJa27+uov7PaOyYXoGw/uFtok4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q1bQaHvaE1RQQGEBs2tUYM/2AKzFRNEHf7jXtduL//gOU1KEHYoxcykYP1/b+eMsdwHWn9KhZHXz8hqtD/mpeRrFroc8KX2058lafKPBmbGvBcDSU/nmSifANBiwznoA6BxKVc8GLdQS5pZjOPDH861rVNMHPggj3oTLjEMPLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nta7Ousy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPHRhvxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKooL2764399
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfN46sn+2SyB5Am2UdJ3F20SHbaJMD1DTMLIqCf/oiA=; b=Nta7Ousy6KfGEchU
	mr+tjHkjufseqs4S9PDpUoYNTKydOf1KxuKvtaCj84fE8ZHc+MoEUFEn3VayHSvK
	dNGrVeBEwTQn6hiOgAMOU5vV4888/SuiAD6tNKNowQcjr2RjZUlxnpShz1+wiJa+
	Nifgy3GoeFuzgVNRKHMYwNJz/ln2SK5YT3m7UuWhd2yoBM3zD0ud/rGGTL3uHgwF
	DB2bNCOphkI7yujI5SFNx9ZQuOYa5OXnpGGyqwGYsHRqu+a28ubOBUB9IaNXORzM
	/UGH8DBOKgxiI8OtdknHIVRKrsLqJKE33HedLItYT3JqhmoZlXHe+fzKAwhbQH7l
	2YeOWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefk5g0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1dea13d34so106992701cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988383; x=1766593183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfN46sn+2SyB5Am2UdJ3F20SHbaJMD1DTMLIqCf/oiA=;
        b=LPHRhvxV3bBEEh2xFg3OSkFd0YrF1ZYaHDSuRZZ1SXX2rLXys9NnoRWXzdwRmJoZ/j
         19E9M7nzNeJftTukheXhiYS15ZWqeTwPd1ABXtJV3ZDYc3scHA310hhcZEDnG0MaUEz3
         kF/p5kdk5h+xYMZV8tNMNgTs5sy5+nSno1Mf/phqKTldTrtY7jDTg3Pe7SIwoAUzh/um
         0yyN7YMnsECkKi1guEjzL5UyhVSA5iSekhaeUBLGnUXIGvnxhdpqWEMmXBMvbT9F5nIL
         F0w/Ml3dz12cb3ih+tcWKDOjqkcBkPc/CRcX8NZrwUxvcl45bzUyATA5fw0uBrukCXjy
         TAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988383; x=1766593183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qfN46sn+2SyB5Am2UdJ3F20SHbaJMD1DTMLIqCf/oiA=;
        b=FIUZqhqCc2pW9l3iknsDZOBdL3sfUNAesE0MiryI1vQeW/LdlaqwsTmSWleVX+wlLd
         RVQ9IhuQJmVTwSC6mSoiR2T2+vd4KiyFHlqxDJTV4JqT9LHfLdMEdWBhaZPhfYpqIfPZ
         cJ4xxb08ALpw57iHbtQP+a9rfu+sqd2BhEBWHweNpgCwMOfPCzT1Ue0gSfjcFVWxFSsK
         J+Eei2xs0IrI9E+Nm5xwC3gHgwQotypQdA9szXA4NWTNWbBqHUOAAYP8pi1EEXeydvs9
         OVc6opQVeBsvvsgscKHgU3NqgiEKPBkYFJW8Mu5XEQyu+cGA5Drex74BsCSEK0uKZFrw
         kNQQ==
X-Gm-Message-State: AOJu0Yy3Sb4W6WbH9wLZevj759wifZooAFwOc0aoMCbOis7UVX312c4n
	QRHD1SIPipDTnzt4HxBhATi3zGJ31Leoq7W8ogypBZv6yiUa0iQTfxUO54X/RXCAFFnUVcgF4ap
	qJ72cjT01vbJASrcPIqxk6eclMaLaR6A1oeM5bVLeLRnUrqTyB+7SwHxSrTOeQFCLrp3T
X-Gm-Gg: AY/fxX5GT1cFl3Swzkd8KIQesuAWzS+/BD0WjW9G4AzddqARsY95fFuxXomvf6m7KNe
	GKmqJqlknAfqSmfmidaSSuIBImwzlma6C864DdX2Gy2IqOe4TDEIKLmIbPHTGPkk4/JHDd5ZNZN
	nwYI1DVftDC/AWtnhLdjHxO1XKwrP48RymAdRUUKsnCrrhB4cD0YOuFgjufvP3uKkbxEVeEHKSe
	LIW0tJEUEu7A3f2r7Pc30l90j3sJYqykbODDnmmJuUkEGkUWUO7NdSNX/qVw6Np/QLWRMc90FZS
	WOPI+XP9+5dpYkKvOR4++fHD/4Kuv91ky/fD/qCJnEI+fASAi6quvjG+EWlb2Qr2i0pq0UjMVR0
	yOdjnv6PmqIzrwnzGpdhIs7LBBq7t0tsM
X-Received: by 2002:a05:622a:a13:b0:4f1:b714:5864 with SMTP id d75a77b69052e-4f1d0165aaamr269467211cf.0.1765988383431;
        Wed, 17 Dec 2025 08:19:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzYwoZ5/uoNxipgqR9z4aoS1IJ9ExodTLWNDcXvN6jr8uFmuFNmFUGZM1k3UR4vMHYk24h1Q==
X-Received: by 2002:a05:622a:a13:b0:4f1:b714:5864 with SMTP id d75a77b69052e-4f1d0165aaamr269466541cf.0.1765988382772;
        Wed, 17 Dec 2025 08:19:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 17:19:16 +0100
Subject: [PATCH v2 10/12] dt-bindings: PCI: qcom,pcie-apq8064: Move APQ8064
 to dedicated schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-pci-qcom-v2-10-873721599754@oss.qualcomm.com>
References: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=11184;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6/HmpwGYfmKbFRr3CJa27+uov7PaOyYXoGw/uFtok4Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtgE7j6B/jRRDH3SKstx+rGFj+iW17tShwiVW
 EZXzhg6jeOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULYBAAKCRDBN2bmhouD
 14PID/0eoQ6sy8RNZAd6lM63OeyLFWMqgiu+WPwuG9bSjuPoK8HTweF09Nl4JY+3NLxDPVVqFs4
 K5STN+qE5QZBUJdvdtoezGLTcROV6NjyqmfcuxYRN+tb0qYFh06cgZrroDGJX7CKpViq2YV9eUq
 URNbe4uMM9VwgxjHbinWShUYAHjl0Y6Xgmn04h/efu7RS/baJWyvbPePatZZgH3jajTKhmjniZT
 SC2d7Tt5IH20UN4qtHnG+7XN9Mc31vLFa6b2+2b5HgUyL01NzDJqm0MWr5iYjYhhOdWGAiyyuec
 xUDYYLtBRvnvXpKrnGsTuVUOMGSJGqlgMMYsl1eMAQotCfcqw9bjnJC/4EJye0NUhHhwJpN0Sjy
 M62mQvqQRjJp6lLqXV+eizq418DD90MeySBTzSX2PoS8MKAnAea8mfBIEa+lCHlhqV6F/DXog4/
 indpi2gHb1l1LeH6o30Rj34EgszPPCUqvSpL3QkvTqIiUAlaRgvjpLJFeLwsJuHVybvl91L9ZE8
 z/PujA88np7+ZofpBx62tOcmCcoOp+VO/eZ/7ffL6BQh0SwBtdGi8oNVU+xVK8ZSmVc5I2V83AF
 ed2nmHSaGPAR9R6rIjCPGx0iqnNs4G/s0v28dpXLEviw9KBKrK29PXguWPbU+8VOghosMj2WTLT
 rz9he5/3sYQdodg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfX4UQI7hsaeEpC
 3Rs00rpcO5bURaS+FZZ08CSMSRnq5QMdsH1SmnNi34+bNpPgWqx3o1CpcTj2bO/4md7UQd2nuoc
 OrES2wnI67Ipe0GWOcwgW4QRWfekFLaAipnyu3FLSmxDuS1Lras4dw0aLpFsTUd1DEjP9+UUXJN
 a3R5OK+VVjPo/GzMaGwtz7CPKW0iKEa1OmhDAfoJs5QHSfjLKjO+CNs7vHdbTH0/uH5gj8NRaxL
 fOEU9D6iKSupoiz9TLIJpD03q3bVi7H+F5aVtqA/QJdLMtzZxwsEgHqgdl9PwTiO5tGSV+k/lwi
 nr+GEYmugyGoJ9LyFD8mwLyY/ExfiFLsieNtSJ/8YoMtl7Ua6HnLdtTVkUBfEpcnQ7kwE8Z+Bxz
 Isb3+rkFuf2+q6gTIFuZYXzRWMjQVQ==
X-Proofpoint-ORIG-GUID: eHxERG79r_eFS3segpPdvowNfcgXoAB2
X-Proofpoint-GUID: eHxERG79r_eFS3segpPdvowNfcgXoAB2
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942d820 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=-DzKK8azUWmf2IRN-tYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170128

Move APQ8064 and IPQ8064 PCIe devices from qcom,pcie.yaml binding to a
dedicated file to make reviewing and maintenance easier.

New schema is equivalent to the old one with few changes:
 - Adding a required compatible, which is actually redundant.
 - Drop the really obvious comments next to clock/reg/reset-names items.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-apq8064.yaml | 170 +++++++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie.yaml         | 127 ---------------
 2 files changed, 170 insertions(+), 127 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-apq8064.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-apq8064.yaml
new file mode 100644
index 000000000000..eb5b81d1defc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-apq8064.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/qcom,pcie-apq8064.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APQ8064/IPQ8064 PCI Express Root Complex
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Manivannan Sadhasivam <mani@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pcie-apq8064
+      - qcom,pcie-ipq8064
+      - qcom,pcie-ipq8064-v2
+
+  reg:
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: elbi
+      - const: parf
+      - const: config
+
+  clocks:
+    minItems: 3
+    maxItems: 5
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: core # Clocks the pcie hw block
+      - const: iface # Configuration AHB clock
+      - const: phy
+      - const: aux
+      - const: ref
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: msi
+
+  resets:
+    minItems: 5
+    maxItems: 6
+
+  reset-names:
+    minItems: 5
+    items:
+      - const: axi
+      - const: ahb
+      - const: por
+      - const: pci
+      - const: phy
+      - const: ext
+
+  vdda-supply:
+    description: A phandle to the core analog power supply
+
+  vdda_phy-supply:
+    description: A phandle to the core analog power supply for PHY
+
+  vdda_refclk-supply:
+    description: A phandle to the core analog power supply for IC which generates reference clock
+
+required:
+  - resets
+  - reset-names
+  - vdda-supply
+  - vdda_phy-supply
+  - vdda_refclk-supply
+
+allOf:
+  - $ref: qcom,pcie-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pcie-apq8064
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+        resets:
+          maxItems: 5
+        reset-names:
+          maxItems: 5
+    else:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+        resets:
+          minItems: 6
+        reset-names:
+          minItems: 6
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,gcc-msm8960.h>
+
+    pcie@1b500000 {
+        compatible = "qcom,pcie-apq8064";
+        reg = <0x1b500000 0x1000>,
+              <0x1b502000 0x80>,
+              <0x1b600000 0x100>,
+              <0x0ff00000 0x100000>;
+        reg-names = "dbi", "elbi", "parf", "config";
+        ranges = <0x81000000 0x0 0x00000000 0x0fe00000 0x0 0x00100000>, /* I/O */
+                 <0x82000000 0x0 0x08000000 0x08000000 0x0 0x07e00000>; /* mem */
+
+        device_type = "pci";
+        linux,pci-domain = <0>;
+        bus-range = <0x00 0xff>;
+        num-lanes = <1>;
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        clocks = <&gcc PCIE_A_CLK>,
+                 <&gcc PCIE_H_CLK>,
+                 <&gcc PCIE_PHY_REF_CLK>;
+        clock-names = "core", "iface", "phy";
+
+        interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "msi";
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 0x7>;
+        interrupt-map = <0 0 0 1 &intc GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+                        <0 0 0 2 &intc GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+                        <0 0 0 3 &intc GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+                        <0 0 0 4 &intc GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+
+        resets = <&gcc PCIE_ACLK_RESET>,
+                 <&gcc PCIE_HCLK_RESET>,
+                 <&gcc PCIE_POR_RESET>,
+                 <&gcc PCIE_PCI_RESET>,
+                 <&gcc PCIE_PHY_RESET>;
+        reset-names = "axi", "ahb", "por", "pci", "phy";
+
+        perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+        vdda-supply = <&pm8921_s3>;
+        vdda_phy-supply = <&pm8921_lvs6>;
+        vdda_refclk-supply = <&v3p3_fixed>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+            bus-range = <0x01 0xff>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
index 5af56911d204..c9b41c2254b1 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
@@ -18,10 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - qcom,pcie-apq8064
           - qcom,pcie-apq8084
-          - qcom,pcie-ipq8064
-          - qcom,pcie-ipq8064-v2
           - qcom,pcie-msm8996
       - items:
           - const: qcom,pcie-msm8998
@@ -78,12 +75,6 @@ properties:
   vdda-supply:
     description: A phandle to the core analog power supply
 
-  vdda_phy-supply:
-    description: A phandle to the core analog power supply for PHY
-
-  vdda_refclk-supply:
-    description: A phandle to the core analog power supply for IC which generates reference clock
-
   vddpe-3v3-supply:
     description: A phandle to the PCIe endpoint power supply
 
@@ -127,26 +118,6 @@ anyOf:
 
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-apq8064
-              - qcom,pcie-ipq8064
-              - qcom,pcie-ipq8064v2
-    then:
-      properties:
-        reg:
-          minItems: 4
-          maxItems: 4
-        reg-names:
-          items:
-            - const: dbi # DesignWare PCIe registers
-            - const: elbi # External local bus interface registers
-            - const: parf # Qualcomm specific registers
-            - const: config # PCIe configuration space
-
   - if:
       properties:
         compatible:
@@ -168,44 +139,6 @@ allOf:
             - const: config # PCIe configuration space
             - const: mhi # MHI registers
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,pcie-apq8064
-              - qcom,pcie-ipq8064
-              - qcom,pcie-ipq8064v2
-    then:
-      properties:
-        clocks:
-          minItems: 3
-          maxItems: 5
-        clock-names:
-          minItems: 3
-          items:
-            - const: core # Clocks the pcie hw block
-            - const: iface # Configuration AHB clock
-            - const: phy # Clocks the pcie PHY block
-            - const: aux # Clocks the pcie AUX block, not on apq8064
-            - const: ref # Clocks the pcie ref block, not on apq8064
-        resets:
-          minItems: 5
-          maxItems: 6
-        reset-names:
-          minItems: 5
-          items:
-            - const: axi # AXI reset
-            - const: ahb # AHB reset
-            - const: por # POR reset
-            - const: pci # PCI reset
-            - const: phy # PHY reset
-            - const: ext # EXT reset, not on apq8064
-      required:
-        - vdda-supply
-        - vdda_phy-supply
-        - vdda_refclk-supply
-
   - if:
       properties:
         compatible:
@@ -250,19 +183,6 @@ allOf:
         resets: false
         reset-names: false
 
-  - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - qcom,pcie-apq8064
-                - qcom,pcie-ipq8064
-                - qcom,pcie-ipq8064v2
-    then:
-      required:
-        - power-domains
-
   - if:
       not:
         properties:
@@ -312,10 +232,7 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,pcie-apq8064
               - qcom,pcie-apq8084
-              - qcom,pcie-ipq8064
-              - qcom,pcie-ipq8064-v2
     then:
       properties:
         interrupts:
@@ -327,50 +244,6 @@ allOf:
 unevaluatedProperties: false
 
 examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    pcie@1b500000 {
-      compatible = "qcom,pcie-ipq8064";
-      reg = <0x1b500000 0x1000>,
-            <0x1b502000 0x80>,
-            <0x1b600000 0x100>,
-            <0x0ff00000 0x100000>;
-      reg-names = "dbi", "elbi", "parf", "config";
-      device_type = "pci";
-      linux,pci-domain = <0>;
-      bus-range = <0x00 0xff>;
-      num-lanes = <1>;
-      #address-cells = <3>;
-      #size-cells = <2>;
-      ranges = <0x81000000 0 0 0x0fe00000 0 0x00100000>,
-               <0x82000000 0 0 0x08000000 0 0x07e00000>;
-      interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
-      interrupt-names = "msi";
-      #interrupt-cells = <1>;
-      interrupt-map-mask = <0 0 0 0x7>;
-      interrupt-map = <0 0 0 1 &intc 0 36 IRQ_TYPE_LEVEL_HIGH>,
-                      <0 0 0 2 &intc 0 37 IRQ_TYPE_LEVEL_HIGH>,
-                      <0 0 0 3 &intc 0 38 IRQ_TYPE_LEVEL_HIGH>,
-                      <0 0 0 4 &intc 0 39 IRQ_TYPE_LEVEL_HIGH>;
-      clocks = <&gcc 41>,
-               <&gcc 43>,
-               <&gcc 44>,
-               <&gcc 42>,
-               <&gcc 248>;
-      clock-names = "core", "iface", "phy", "aux", "ref";
-      resets = <&gcc 27>,
-               <&gcc 26>,
-               <&gcc 25>,
-               <&gcc 24>,
-               <&gcc 23>,
-               <&gcc 22>;
-      reset-names = "axi", "ahb", "por", "pci", "phy", "ext";
-      pinctrl-0 = <&pcie_pins_default>;
-      pinctrl-names = "default";
-      vdda-supply = <&pm8921_s3>;
-      vdda_phy-supply = <&pm8921_lvs6>;
-      vdda_refclk-supply = <&ext_3p3v>;
-    };
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0


