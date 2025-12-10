Return-Path: <linux-arm-msm+bounces-84913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DFCB35EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FD1A301FF09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 15:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D1428469E;
	Wed, 10 Dec 2025 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJcxgI8c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvwvFq/s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9695626FA5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381863; cv=none; b=kmw7KZp3I9PirqXvX37GuJDCeeXx8uguRwlsnq4fZW4Tk5aqDzOoZc74Ve/P1ZE0yTUsLBnZbSjU+AUw9ksquk+Y+YO+f1VzWfqOzmh8AIeUiA72ERMd0GoQTMnwNTSXInCCj0S/cK6gGFadHUqPvPyFstPc5pXhDVvI8+eCbdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381863; c=relaxed/simple;
	bh=qjGkXyff0JOzXHAVjFAg4DNaOzEfBoQYUyu5QmS1S7g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rIor+mtwxYZngdIQ9e/etef2v128HMddubKCEEX4GyR57XL3DHPw5xi7JXfrHxpP19RzqE1nG0+kzVokfDOY324sN02JtGzj61vTD2acS9E7ZZS+Ww1CAfaq66h12li58kGoxky8fULEA5Ghtjg6ZK1NE+zNqDK8ZIp3JjL5GTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJcxgI8c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvwvFq/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8e2wK2669313
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+rUCr121SZ+QerPYflBRYtTCStaRS4LPAaBzx1rPUmQ=; b=YJcxgI8c/0JePLcl
	Gw2od2t9DwnaVf4yvQGjLt2Jexl5QtiVQqAZREIQjZ7fMDcjkcMTuNkUXLeWivbz
	02sxMeDB63aiLUX9W2v91LVBTkQQVdAhxQ1FEK5pMAuW+m07TTPjXIy1cG8395+A
	4y6HSi84gitgPorsuzRiRGtGHr6q+0vtY3sKt7TWu/WgYOVc3BZpCmkA08LtyjN5
	wr+s4dd6HvgZPsvLBIBMLavU2k/90SUrw1qcfTIPAyy/c1O4Lz8sjWpeVBpAmhwi
	aZ+zxdtWgoBGKatyAToQ6GyhNLbE6cZWaDk0IDNrIewQ6E7AGDWwS0BNrQyshKj9
	u0HDOQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay4ykhcf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:50:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297dfae179bso71685ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765381855; x=1765986655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rUCr121SZ+QerPYflBRYtTCStaRS4LPAaBzx1rPUmQ=;
        b=NvwvFq/scNTyASHWb1QN+iqrtTs8s6p3dUtqUi9bV5eev8kna+n+FJ6p+n5kiW6Mc+
         Cu0c/VlmmywBpSfcMu4no1TfJZxjMDSPbvvh2Fv3b1PXnmCQYo5fetsQS1rSc8Mu0yP9
         Eq2iu85GLFopwnPURRZPWdVLn9asVTnm7ALy392I37tL3vAtUkkHOojgPFac8iCd7CZ4
         Tp+GrRMmNzgqeFTYtylC1u2VzvveNiwYCGIjWnJvsrt4vpUEUS0D6ucoDhWDY7haHzrs
         QN1i1az8UvwcvW245EILGNf/U86zn9VvmGzMOvEamTN7zBJ3nQAUr4ZGir1qCZAOMW4i
         dIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765381855; x=1765986655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+rUCr121SZ+QerPYflBRYtTCStaRS4LPAaBzx1rPUmQ=;
        b=rTTrVhCXUaOsxeAhRGgYH1F7SfZvnpOQl78pL+GGs1zNMYddElc+cJHaG/TYo2qGNp
         J43h8AeRibGT5RfbIFki82WNe3lDbjpFoArcxhT2FScjbe2nMOFq8G3f8f8tT3Obnk81
         n7+BgAZwmRztgLI62XoYhpAp8M0J404Lt4lMSp799lmTUa5S3vpSQwlg7278UUPWDuCJ
         G5XM6zX4pS6Z0MD2Y/ieGuq3O78gbbpYQMcmmuodP8L5xnyXC6YBw/9cL0cn/smCkbfc
         plIebbxlOF1dVN6x3VIOT+5KSXAlVRQ0u9hJ30ig4G128rW9dt0yPZEH5P0uJHyNJEmo
         PYZg==
X-Gm-Message-State: AOJu0Yw0saM0AnouFr4b2Hd+5mkd+XdxzzxYIEcI6YW3eMmPLapp3Uau
	oZJDS0DOyj+VXl3ugksWyexU9PbfXA+pJ9LStSPd2GW8kiRbcJj7UFXD/RoS6Opv0AOggyVdUi7
	ok7dJvrQK+T1zBQqyLGNa/+fgJIZbQLwebho7KW6fnhd2mvcEk6z373vTE54bhCeUxBrV
X-Gm-Gg: AY/fxX6A6euuOWw0f3nsJtTJteIGx2Ub2I8AnK1i0H6LsG4KSqHYPeJ9jKrz1p1RcJo
	LYhOLx58XmFubNROOg8QOp2niebyVSzagLBa8ghLZ1HSbXrj6IOqT6CnugjrzB2AIr59Kimkh0y
	mZTDvoxmVb0QmiQsB8rtldyS/iMh2nUqjMOn6Tpi/7Pu5YOjbr50oOrQTKevIDDkmVvRuII97W+
	n2ViZQh/LKElO5lEdglt4J6jB2R692oKLA2l8QGfs2poIiek+Bmh/8Zku7yWrfywD9G03WYJ9AD
	Is7EE5f5jZiGcVJNDE8HZkut1cSQRs/UcU5BBMkqOyVskFfkPDeCNPKsoMGn3P00us+Gd2A6+qX
	iAVkxPqZUFnpxV/wt5HZUP45nspLagA1oh7DQqpN7
X-Received: by 2002:a17:903:178e:b0:295:596f:84ef with SMTP id d9443c01a7336-29ec2d3516cmr30281165ad.31.1765381855067;
        Wed, 10 Dec 2025 07:50:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBZg3CDmb5QXrh/vHnqknn5K8usGXHeluV8lbexssAYjUj5YTX6hrPcmb2zIpMYU2GXSoGfg==
X-Received: by 2002:a17:903:178e:b0:295:596f:84ef with SMTP id d9443c01a7336-29ec2d3516cmr30280815ad.31.1765381854620;
        Wed, 10 Dec 2025 07:50:54 -0800 (PST)
Received: from hu-rdwivedi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ed93e470fsm7780175ad.41.2025.12.10.07.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:50:54 -0800 (PST)
From: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
To: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, ram.dwivedi@oss.qualcomm.com,
        anjana.hari@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/3] dt-bindings: ufs: Document bindings for SA8255P UFS Host Controller
Date: Wed, 10 Dec 2025 21:20:32 +0530
Message-Id: <20251210155033.229051-3-ram.dwivedi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251210155033.229051-1-ram.dwivedi@oss.qualcomm.com>
References: <20251210155033.229051-1-ram.dwivedi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iP0wmeZqZ8fFUOPwTGFf79-X1yZfHkdK
X-Authority-Analysis: v=2.4 cv=Mfthep/f c=1 sm=1 tr=0 ts=693996e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VcM-S10TGioI4za7RKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: iP0wmeZqZ8fFUOPwTGFf79-X1yZfHkdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyOSBTYWx0ZWRfXygQuLAwIorXV
 PQvHP7o3H/XvFITCNQijIegbSWWWyy+Z8+VOF1Ot+NgceaHfz94oB3T52MRSHHYdE7aQw0GeQaf
 rmUPlltyyHcM7fN6wbFt65Jv80fXV1uUHEnTJut4Sjg8NHlDyAomfXafoDEwlyTjY7tn6SitS24
 sEBQzEG/nHbtbstPRKdL68k/R5e3q8oYpvaLCUVBQqFRqIdQKmjOm4ZdlkKZrtxHzV4F053uCdu
 a5elgt02C7aCaITj5sKBCzhsEBI+ZA/E05JLaGe8vbRmXV4MqTkQUqU3U3yFWFfmw9afeZwqHMZ
 HBHZrkVANy0HaRVJu0/y1oN13gWtNEP+cntMMlBDohz/+4nrMMag1zbyNvCdDBzTxQQveK89abO
 LbC063uAbrXaHCiDQ/O1hCFRuzzY8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100129

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
 .../bindings/ufs/qcom,sa8255p-ufshc.yaml      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
new file mode 100644
index 000000000000..ec006f7de752
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -0,0 +1,62 @@
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
+  - Anjana Hari <anjana.hari@oss.qualcomm.com>
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ufshc@1d84000 {
+            compatible = "qcom,sa8255p-ufshc";
+            reg = <0x0 0x01d84000 0x0 0x3000>;
+            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+            lanes-per-direction = <2>;
+
+            iommus = <&apps_smmu 0x100 0x0>;
+            power-domains = <&scmi3_pd 0>;
+            dma-coherent;
+        };
+    };
-- 
2.34.1


