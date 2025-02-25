Return-Path: <linux-arm-msm+bounces-49247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02027A439C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83B827A7E80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CB002676EA;
	Tue, 25 Feb 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNm5N69b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB372676C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476127; cv=none; b=HoHVV8seDNP5W+n9UPBNa/S5NkUaikj291JGNBl+DkrJo/4ptce6LVfB1NO34ZT46NG/mJDfSOp6cnXAKpPQgUBHmfbnim8URkTV6KQpp7wbMgQEAoGRWp7dZm4zAcRLOZbIIOq/4xX55zT05OpGusUvzwsuaO9kP41JJ8Mv/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476127; c=relaxed/simple;
	bh=O6QdMw9pPsUSonExw1v1X4uasyeeZLrOu/yWsY9TlUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSq61+KyvwCGieBjUgVMGIcQUIYXFRrUnsEjljNZls4H/f21vS0W+CUcnjr3DUgP+i29sRLhs2yUieG1TwCAqxMkt775Xlw0Q2W6EzQu5PN3UlP0eUIopQzRhBE32ZWvaPE2bZ4ydZ2Zx3D4Wb1LgboeISr56D9QdXa2FfAUKns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNm5N69b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8N4mk020060
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4aoaq0mjDOgIfsvFB0lVTIIe96cGBXl/hbTV2ZPb/9Q=; b=eNm5N69b5os5DY5X
	e+LeoRScIDgVKhf7EfRP8vq+aTAGREow7fMMROK7+gNMQOOioxoKjTj8pPPyOKIx
	ZGBeUqgwn1m3yHaj5OT+Pyxh6vu3CY5ZzIwpsDFvVIhS4YvhMgsS4fNPqWBEuQns
	hKu6n3f66OjMb8ubIQJnUXrxw0ywQYZIYnC+7jMlH9Ksn6y/rg1e+Vpd1DjBMdB5
	GFs+qjYMx4NMA1AAWdFTshA4CRPb4bF4bSENGELPl1IS5K1zeWvGB5U1Z3TLtS6u
	6Kdphgy7Nw1jKsHruG43KXq/ha33C1674IamyiSEsEMWDaiMC7ZPxge9u9n9xHY6
	RaA7rA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2r798-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:35:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so11805246a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476124; x=1741080924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4aoaq0mjDOgIfsvFB0lVTIIe96cGBXl/hbTV2ZPb/9Q=;
        b=ia0yepI+rbQ3m0KTggYDAu4jREyX/bB+1N+gJEgQFKZ5/J3gFYTTcQIwKszVG9y83T
         wDlxJ5BD58EelHCRn2NI5qYxEIwTvfKN51NVpz8aVlRx4jKOXxwEOYrSb2eod4uMrgKI
         JTgtkqZ+bXpQZnJk+a1W1NWeDsdj56PL/JZDJNOlVmNdFNJvqVB/CeJsjXr5Gx9Cs9vH
         ZgR9kKC7ryxdXRkZ7NMTqZk5LlepmFYC5C/THStSMlTjVf5YTYzBMQgUPTp/mWafya3i
         jvo4SaH3u5zpgk2QdXBFquAbxCHLIF22bkylvil9lCCZLQ8uY4PFt2j5O92FDLy11T89
         mVOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjq6pdhcBScMvxYEZX9YAowhXGObfCdOx1QZdeuP94icCYHUlTcs8ETaXJduJtJpMapti4c7EZlktdKNua@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ePpzFqvVYwkpFjTkq6P3Cuo6RzUNGPZtQ9lehdu9nhCY72eM
	vOBwzGc3yLe0eoIhAn4AA+FuS6Cs6+GgG2MmV1dZR8VbzxZB7LeJtUKkQhwVO90vq1yi1CT1pCn
	T2fVmGJy+GYNYqI3k8uEp8mV0n2qsGcqSDuHhFoDee5Y9gwrVXWJfoZWcQPrETANe
X-Gm-Gg: ASbGncukIoQGO//MofDAZH5hYhBDLKQ2CsbSgBqr/BYtMxXB1e4hqmX89Sqbc2AKNkg
	YGCeFro2U8b6WFbtfZlavRHKVFS7+Xc/jOzn4RRvRmDEpZ7mzc6wgcpOPaIOqfwIeKUsMmQ3juS
	HA5sosbiQlDKGfx2SPcuheqvsfQGVSAHJCfo+enPSY+wEhfjxMGDbzvWv+Vhzg9x1Lm8/x/TgsZ
	1iYXjMH9Tji0qL6ecaoncWUpvxVrioilfV4aQqr+fAQDuErsMsdJmLzqhAbAw1a80dDLy3OcAbj
	i60OQzr84pwSHm7JOvsCxk3BjeXS1+fPz85D9CUqrM84pxOGVWI=
X-Received: by 2002:a17:90a:d643:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2fce7af3f27mr23590178a91.23.1740476123976;
        Tue, 25 Feb 2025 01:35:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEx8Q/7kpUvvQms6TaGdhGF/1FWj1acg1b6gZtuWR3LDxMd/AjBckVUsJULl3AKvVV8BfYDKQ==
X-Received: by 2002:a17:90a:d643:b0:2ee:8031:cdbc with SMTP id 98e67ed59e1d1-2fce7af3f27mr23590147a91.23.1740476123583;
        Tue, 25 Feb 2025 01:35:23 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3dec52sm1080770a91.20.2025.02.25.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:35:23 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 15:04:06 +0530
Subject: [PATCH v4 09/10] dt-bindings: PCI: qcom,pcie-sc7280: Add 'global'
 interrupt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-qps615_v4_1-v4-9-e08633a7bdf8@oss.qualcomm.com>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
In-Reply-To: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
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
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476062; l=2266;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=O6QdMw9pPsUSonExw1v1X4uasyeeZLrOu/yWsY9TlUk=;
 b=b1gIs1M9+w2uwq8aKEXnUyCHK9+vOyRbRv5s4qKcQEAZdCgZPuRWhO+GdKlQIBt9b/Bn2pEXT
 uruNXKmtI+CCHawO8jaBl+e3bTGGIRKv6bJTzcR/Oz3rUUio2gnzg1U
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 18FYZMPtV0VOlEgD1im-cm6IBi6FN4u3
X-Proofpoint-GUID: 18FYZMPtV0VOlEgD1im-cm6IBi6FN4u3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250066

Qcom PCIe RC controllers are capable of generating 'global' SPI interrupt
to the host CPU. This interrupt can be used by the device driver to handle
PCIe link specific events such as Link up and Link down, which give the
driver a chance to start bus enumeration on its own when link is up and
initiate link training if link goes to a bad state. The PCIe driver can
still work without this interrupt but it will provide a nice user
experience when device gets plugged and removed.

Hence, document it in the binding along with the existing MSI interrupts.
Global interrupt is parsed as optional in driver, so adding it in bindings
will not break the ABI.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
index 76cb9fbfd476..7ae09ba8da60 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc7280.yaml
@@ -54,7 +54,7 @@ properties:
 
   interrupts:
     minItems: 8
-    maxItems: 8
+    maxItems: 9
 
   interrupt-names:
     items:
@@ -66,6 +66,7 @@ properties:
       - const: msi5
       - const: msi6
       - const: msi7
+      - const: global
 
   resets:
     maxItems: 1
@@ -149,9 +150,10 @@ examples:
                          <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
+                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-names = "msi0", "msi1", "msi2", "msi3",
-                              "msi4", "msi5", "msi6", "msi7";
+                              "msi4", "msi5", "msi6", "msi7", "global";
             #interrupt-cells = <1>;
             interrupt-map-mask = <0 0 0 0x7>;
             interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>,

-- 
2.34.1


