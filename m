Return-Path: <linux-arm-msm+bounces-85557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FE8CC8C2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE3430146D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F48033D51E;
	Wed, 17 Dec 2025 16:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ3gbyJw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEAQaZnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B826733E371
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988367; cv=none; b=YUnX5Jth2azAASLTHBRQEzCjIDwIxXg/qBBaRRKE6aHP1Tmu3+cAIUsNbJxves/d92czBibDoLda75HvsKfAa+eewIDnP4YuoVQmos3WQ5JmMR+zdH0AkCc8vW+EhmauaE26t4V3iB7OjmqX0K4QaZ5B70VQl6lRlM8ASjiKKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988367; c=relaxed/simple;
	bh=BCKkEB1I8veQ2OzHLYj0QCYAgsM2sZ3Ey5cdNxL2bL8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JgwCe+tUU5x3+yT7BsjL2ng0MgGTeVkkn6aoPkyhh7n/fJ0QqFq249MKtsKHMZCsOHf3bN7OYaxx3E+ZNul+rnNJiEFXi0rCs4TQIczMCJIl6eNMzQowWN+NbJLtIMa0UkGv0rmPZjho/soLB+IUfuBMotn8+BJ/HVLcufxKNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ3gbyJw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEAQaZnN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL6KU2503107
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7Zi8stO+QKUZ1ciH0c3g40
	M6500j5kNpvPdgPdqnTsI=; b=eQ3gbyJwMVVYWX0oLbQDy/4nMASfnAaIItGPrj
	R+/iwGYDq0HY7c/YjyxyZD/g3BjKGUoVaDOyARGD/yAzXugzMWT9AXahMVntveoC
	ZRsugKJoXJPjFc3LF7uWV+/9WI6gdEdifsVylKNQDe+jG6G29CdTWIlsVSOusRRe
	Nps6/vfGUiJuhq5mVqHJiPy6z+hzvcnAqQS2Y4qEM1dGYCqqRSaLW1N8b+GdQm5d
	Fp3egPVDHhik2QVRT2BUT68qe9t9b4UnkqFBwggnKYc5FjblQxUvzqIiUNnXVv40
	QFbDzXXFQzS5BLmTm55ImEORHZtqlM9G6crXMcMA4EWiyX0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa9n0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:19:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f35dcb9d4fso6256071cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765988362; x=1766593162; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Zi8stO+QKUZ1ciH0c3g40M6500j5kNpvPdgPdqnTsI=;
        b=GEAQaZnNdQqbKkMIbwmK9CuqJBHtAOT0iJE/3G+vdxnE+sDjyOZ2koA9NEDvL2uy1S
         7eAG4xxD+vuHLgn6bQY08teW08r3FAlgGoX587d2GT4qBVRTOeUtPlc7jLkxKEOoIgTS
         pxvUtRNXT1RTCBR/60dRCTIFqdr2WYDyupUxiabOd5Um5zc4hNslfC07rWQbGNI7jqWM
         PYY+P22Pd7GyF3Jviq4V+OCLy5aIYXP7MfHgK0jsNGKufQmKyOye/GkapfkU7hT+WB6G
         ZF1SXQasH13lDBkGMzD2Y+b78Feru+7MJOZ3P5HmHZYI/NiBgTL/GlQK5ADOE3cOtWk0
         Xhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988362; x=1766593162;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zi8stO+QKUZ1ciH0c3g40M6500j5kNpvPdgPdqnTsI=;
        b=N/Y+XLPQXaod8sznXamCAXTaBV59HSsXwfnT0H1yZ3nHke29XYCwaxYJn2YIcmlGoX
         rJ8ZZi95epDYzomwdVjwKB8uSpIuPxf4Uf3pmPes9jn6CrU655bG1iaVJ6O6orfaWqEo
         tkwydfNkIC355PxipsfhYqqBJeyVlaUxcU4P2Sg6R90Jrtk/6ofu8+3ZxamBnfbXqkU1
         lfT0VnRNAqmzoS2DFPDq6OqtjUS5Lgo2Ndk8MNmPrrmIOqe270YYL15GbliaSbFaKfWg
         PYZ//n3wZZ0XVBaLMlJlbFQYw+6ZzM3nwKgfsov8EF7L29cXy7uzm5eW0F/Kwpa1L0RD
         AsmQ==
X-Gm-Message-State: AOJu0YwwVsvASPdyQr8+vP0vcAOZK3IWsR8yfecelw94rF3Xof353ZY6
	F0jdaFUcZQqCi4OYwS0aQ7BG3q/Nlt4dT2peSoHWZtaYwfK27zkqh6PgVkdSDgLx5QuPjDVrF3y
	6TQZBp9rw3Kb+2zx1/W3rojkZaj/dHWrf9UhaMq/upa5LFNl4plMG5qEq6VJ8wVc4lPLV
X-Gm-Gg: AY/fxX4KBMBk8oz0D4mtOqY++XeoOTKtrHvzhyFgO4YSgR8ID5dfRK4TTk8m0M//f5b
	LAvCZJJo/f9INY4xfWIT1sQK7B1yXoDmfVmjlS3sQClDyMP5UQChpXouQkdXEJf1oWw7u9CP8IL
	01WctlDYixU+yhXVhkwa43H3C93SAk7U1FoADeW1Weg95cUxdGt/GHdED9OnvYMrJmCXH/ZoFCz
	4d/tPTM6W6ZF4e0UNZZ9O2eIM4O3A16dQ2fjgrLEGnNcpg6RmSX7pI/PBt+LdGdGk8odPGCPiWW
	eFrPKBqzA5dPCIX2keeps5tItYshOu5cxU53TC+3Ps2592kqsaddc+Ign0CnqJlZmQGy9J26ZP0
	2E9w8KKKUyQ1n8u6zKn2d9B0ljmF2tzwA
X-Received: by 2002:a05:622a:a05:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f1d05fcf44mr250626981cf.67.1765988361855;
        Wed, 17 Dec 2025 08:19:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaw3ciIBdtY6mKVEaoqlYaW4c2Ws3PE0HJ2m+1Be/iqJaLvZL1ukBYoswY72Xt7wljAMZmKQ==
X-Received: by 2002:a05:622a:a05:b0:4ee:4a3a:bcf5 with SMTP id d75a77b69052e-4f1d05fcf44mr250626361cf.67.1765988361257;
        Wed, 17 Dec 2025 08:19:21 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29be92sm1987868666b.10.2025.12.17.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:19:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/12] dt-bindings: PCI: qcom: Move remaining devices to
 dedicated schema
Date: Wed, 17 Dec 2025 17:19:06 +0100
Message-Id: <20251217-dt-bindings-pci-qcom-v2-0-873721599754@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrXQmkC/22NwQ7CIBAFf6XZs2sAqWk9+R+mB6BAN1Go0DSah
 n8X69XjTPLmbZBtIpvh0myQ7EqZYqggDg2YSQVvkcbKIJhoORM9jgtqCiMFn3E2hE8TH2iMlJ2
 VndJtB3U6J+votWdvQ+WJ8hLTe39Z+df+gpyd/gdXjgwNc2cmudKu19c7BZXiMSYPQynlA9orO
 /C5AAAA
X-Change-ID: 20251029-dt-bindings-pci-qcom-cc448e48ab58
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2622;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BCKkEB1I8veQ2OzHLYj0QCYAgsM2sZ3Ey5cdNxL2bL8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtf8WOUM5vSNA9ORa17fJqhnetiMC1IrIzScY
 xENcH+/X0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULX/AAKCRDBN2bmhouD
 1x59EACOdEMZE6FZAex3TbbTnQkZ0OdgONs9J7GBoA6pttZnjUBlzEPduTPCV5H4yVlgAnAb1SC
 y8qbrbRP+xaxRhfzO/3uXqAWYPTHl+dCcXmtrXsVICFemUktvXLQYOEjnoGkX/Iys+JePvAiOS7
 Cv/JnQbeSmnof3p0XBth+F7UPdPJFr14wXC8gcK0H/U/4LF4/+tf9QTuKp3Ruxb8Rdibnc32aGe
 Vj+k0Ey7sGDYF1jCWANpON7nJJS2wdXed8wmSqL8TIyMZ1xNQy7O4ULRc5evAxt/YZhyALiR/MP
 yrRsbMwHhA2/8jEFhUz5O4MwNtScpvRYfNGKbx6c+fzGF1SDYcbP7JKfNMpMX693pTnmnAiO4jY
 yzo60Ndt3SkwaH9RhFV/f6GDfiRb69w+26AQzGNpWktoOinomk3A8cV3A7yhWzOeV+QKaFuS8PG
 +ioaC/dC4e+20Ixc/23USSHWI0S4bMS/CJc7sXstiZ7+u0vFS0JjrcS28JA6fUYmcqMYR3yHfjS
 4qEwgEXgVuDfQTtoPy9HwQKBvVMAeRMEJD5ntkThdHkdYQ4EuShkJO4zGrGNYuam50NUqbukXCk
 3is3xphfki0nMYbRcMCs/WZr4o2AieC/9Dw6PxpExfEAMZfDPrD2T5tSmafXN2qsrC792ApYrZy
 ZKhXAQvGRZXmCRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: oo5UqvhwXGZwGvRXFLG6GFBl0WhZjmvf
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942d80b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LWjGyiJ7OsTq8DBmh6IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyOCBTYWx0ZWRfXycQAcT+Mcn2y
 SKdzYe2Foe3OsBTJ6Iq+3KY99r3Bwgf5Lb71ofDxXnfRkWJyX75iTVK9lGVsrdRO04HWkSHITr6
 WOWopmetX7U/wlqddcJeK6VTjjx8wVtYmN0EI+TnuQr54D4t7qtz5nvUbm7tEtK99B5nCRgA8kA
 D4YZMJNRmgf96ZzscaDom/2HCHYCDmO3umxiaMXan28z3s67i2KHYoMzhj84NBB762wQVuFMD+l
 TLamstbD/PSXsEKYVCtnqhXZKNoctPjvujAyEW2uW7fxvfKenQPPsCF4k+FjiMHfQxoCJS2XOew
 7/LRGmF5Z2S9n3fw2YUn4ZiHq6a1zTBg2MqbxkWvgLOLzUIR9gEX69Qj2gU7MEtm9AoAs3WELpF
 jD0/OSweEKEgfPB0F5ASHbJ60zbGcw==
X-Proofpoint-GUID: oo5UqvhwXGZwGvRXFLG6GFBl0WhZjmvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170128

Changes in v2:
- Rebase - Mani's email address changed, but I think I used the proper
  @kernel.org one.
- Add Rb tags
- Link to v1: https://patch.msgid.link/20251103-dt-bindings-pci-qcom-v1-0-c0f6041abf9b@linaro.org

Some time ago I already moved several devices from qcom,pcie.yaml
binding to a dedicated binding files for easier reviewing and
maintenance.

Move the remaining one which makes the qcom,pcie.yaml empty thus can be
entirely removed.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      dt-bindings: PCI: qcom,pcie-sm8150: Merge SC8180x into SM8150
      dt-bindings: PCI: qcom,pcie-sdx55: Move SDX55 to dedicated schema
      dt-bindings: PCI: qcom,pcie-sdm845: Move SDM845 to dedicated schema
      dt-bindings: PCI: qcom,pcie-qcs404: Move QCS404 to dedicated schema
      dt-bindings: PCI: qcom,pcie-ipq5018: Move IPQ5018 to dedicated schema
      dt-bindings: PCI: qcom,pcie-ipq6018: Move IPQ6018 and IPQ8074 Gen3 to dedicated schema
      dt-bindings: PCI: qcom,pcie-ipq8074: Move IPQ8074 to dedicated schema
      dt-bindings: PCI: qcom,pcie-ipq4019: Move IPQ4019 to dedicated schema
      dt-bindings: PCI: qcom,pcie-ipq9574: Move IPQ9574 to dedicated schema
      dt-bindings: PCI: qcom,pcie-apq8064: Move APQ8064 to dedicated schema
      dt-bindings: PCI: qcom,pcie-msm8996: Move MSM8996 to dedicated schema
      dt-bindings: PCI: qcom,pcie-apq8084: Move APQ8084 to dedicated schema

 .../devicetree/bindings/pci/qcom,pcie-apq8064.yaml | 170 +++++
 .../devicetree/bindings/pci/qcom,pcie-apq8084.yaml | 109 +++
 .../devicetree/bindings/pci/qcom,pcie-ipq4019.yaml | 146 ++++
 .../devicetree/bindings/pci/qcom,pcie-ipq5018.yaml | 189 +++++
 .../devicetree/bindings/pci/qcom,pcie-ipq6018.yaml | 179 +++++
 .../devicetree/bindings/pci/qcom,pcie-ipq8074.yaml | 165 +++++
 .../devicetree/bindings/pci/qcom,pcie-ipq9574.yaml | 183 +++++
 .../devicetree/bindings/pci/qcom,pcie-msm8996.yaml | 156 ++++
 .../devicetree/bindings/pci/qcom,pcie-qcs404.yaml  | 131 ++++
 .../devicetree/bindings/pci/qcom,pcie-sc8180x.yaml | 168 -----
 .../devicetree/bindings/pci/qcom,pcie-sdm845.yaml  | 190 +++++
 .../devicetree/bindings/pci/qcom,pcie-sdx55.yaml   | 172 +++++
 .../devicetree/bindings/pci/qcom,pcie-sm8150.yaml  |   1 +
 .../devicetree/bindings/pci/qcom,pcie.yaml         | 782 ---------------------
 14 files changed, 1791 insertions(+), 950 deletions(-)
---
base-commit: 12b95d29eb979e5c4f4f31bb05817bc935c52050
change-id: 20251029-dt-bindings-pci-qcom-cc448e48ab58

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


