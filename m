Return-Path: <linux-arm-msm+bounces-86302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A1BCD88F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A7CA30034BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E73831A558;
	Tue, 23 Dec 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWcahKFe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YMuWyDsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF1D128395
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481392; cv=none; b=f0J6naPnkgxkq9y9i2yuRJyrgs+vC72xPwEZGQw5LSXQm7nAuxt2dzUuaW9kLQsMVeTVOHllPR4lPMvtEftX341tU3x1n5EHNb7KZzJZsBKKg5O9xr+UytVFN6o0pVi7DB/DDmkipLhmHNiwpGQfiJRdmfRE+xePkMD/tMX+rQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481392; c=relaxed/simple;
	bh=VG9Yc/Ztp5a99ek/5VbjwSWG3pwWefSVP9Qc0r25dQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HejX6Uq8iQdopvVViJRSCcN71o0r5Mm0urgb0o3dK8UHJEGsMSgR/tRQ1fw4WaTeX7ai8vmcGGZMYyMMhVNxPGBHJS3MDAPmWwhTIpYQMkgGjV8gFFBXB6V6cJFhTUJcFzY31dmQDs2O+hSzpl/JnhLWW/6DYpbA0yzEKYtKEfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWcahKFe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YMuWyDsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN32Aa61889146
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AVg8wbVKdA1+SXjGfkmL44
	d4AfhbsnZkLtmnEiP+VbM=; b=ZWcahKFelLJ9zyXAY1Z9gN1okubWmynGqZYLyN
	u2v0jxuDX0HGWYw+ClcHaQu0HkLqaXUu6DOPbGDfKLrZnO2sZd918N7RVotiBAre
	8rnlsOXT7yk60YH/U6ueOj9Q7CRoY6OPrvYLLDim32z7TiyFEXkPSBTyB2ztXkma
	P9y6Jnt8wxZ+IvIgjMC1t84i5gQ2az/ZsO3gXnLTT8sPBcanJZNQN7VG4hpI+EpD
	+a2nEKl4iUnjpdti9HIopLJF9Y6fDRAPyTq78XchPidQukLSbW89EAyXt2FOLmAx
	vo9OCHR1DXpF5Cd4FChiLpAwxw5MZhcSR3A9VTm59fxI9lHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ajy84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso102165095ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481389; x=1767086189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AVg8wbVKdA1+SXjGfkmL44d4AfhbsnZkLtmnEiP+VbM=;
        b=YMuWyDsDBb00WxkJ0zXuVz8bxG3YHmBJEOqwBBGmBebkDNy4+X5wP7pPpE2rI9qIPq
         QQ4c8aCfdxYVq9lZGNAOyN7uF5UTWZV1KH8Sm0HTvsB5MZJpncJxgpSYhXU4YH+E5hyq
         ds6CGCMSqZKbE9iG+0SOOfkhdUfU9xxOy9Tlskc5LCir/ftOfW23fi0t7ID9XwRWLZvW
         AgLu0dLTknzbiOeaRHYqt4e6XNeCgkZz1HYfnPBTsHV2d6h9QNjGgvBIvseoS/o6Ul4B
         DHmyxpIIi/UUWo1r0wLiBQE783ZrC7Tkrxl+ekePeSQXkjx93RhPtl7OzesG//ScmCCr
         J5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481389; x=1767086189;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVg8wbVKdA1+SXjGfkmL44d4AfhbsnZkLtmnEiP+VbM=;
        b=NQJkwnn9bOwlD+JZ/hX+3o9cHsOFIRFnPzes1n25NgP1pPeX1tPALqMxMMFaT/dnyV
         0rY0ox5U+iP03CVD8ttwoiB5Oa62Cbcg17EISf3PcU1sq/2ppBtrTf4sofXZmNBg/jwi
         wjk6g2GCjkY9A3VXHKVcE5qVPCZCPXjfOSm8x0QYSAR+Jy4p3SaIRPnYzhxtVTwWWUAy
         0DIKhy4uHTSwRYp5BFi/ULzRTJdIvfffhzaPqvWKTYI0z9eb5MVYND2YJoOqEMcTmIbX
         O4s9TeUGtWNj7EmOUwkuxU1bF6LLcf9vK17klXsDeY0GdXV0xuQxFCsv6YA6e20xDIvf
         6XFA==
X-Gm-Message-State: AOJu0Yx7SBsd+dGReDG32vpzGWlznRkN6L7kaZ15IGxVWWh/k1F4hL5q
	avixtSaXSyoO9KB5fux4tSRB5+fDCyAonZ4+uuXtZnA2FuRbT1JGP41+pQGK/Fmgly5U7wjoCcB
	7w33a3jHgeJDzQDB862vwuG6EEbZkTyZAUhyNo9JjZvQ8FqTFaNnLNJUPIziWJ04xYkAw
X-Gm-Gg: AY/fxX5PLrDaZwERI1HpO7n0Zbe4ruVUlTORkrZKHNa/fg7ZNczwQxMZmcOuc7bm8Fb
	qpAeOJlzBKTmgOn7xRA3al2fs1aGXeHqHtUcyxUtgiMrO8NTMxQtHP6x2fUaPNtw8K4zXRP4sH3
	NvdHdszQB5aNsz9pcXXF3HjIiKdIGgRI0UanHufn0fmejIzWu8sVchs6vz1ZZB1yrVbUHOQTEcS
	3N2f18Yc0sbVqO1oIp8a3A9vCtYLmIxNDFibBYEzPUbzKJ72dvQujIAMojpPJJ/IoiKEZF1oz2F
	pFLvTOGJiJNWve9adBt+XCOCOrFxfuWk1x1jDVVvXSxJ3LeLZ+uGUMuh5v6zjL5Ll3b16+YUkmT
	gl7E9xnTmhbxO83yL/CKbLuslb4wzNAvGS/+NQEQbkec=
X-Received: by 2002:a17:902:e846:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a2f2a3587emr110669845ad.28.1766481389296;
        Tue, 23 Dec 2025 01:16:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5CDUf0DW0KwHRj2MZfztHU8oSvgoeruZN+oe8H/s+rmsBQ33CEC+cbT5Dx21OxR3v/cxm4A==
X-Received: by 2002:a17:902:e846:b0:2a0:9656:a218 with SMTP id d9443c01a7336-2a2f2a3587emr110669555ad.28.1766481388801;
        Tue, 23 Dec 2025 01:16:28 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d76ceesm122507585ad.91.2025.12.23.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:16:28 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add firmware-managed PCIe Endpoint support for
 SA8255P
Date: Tue, 23 Dec 2025 14:46:19 +0530
Message-Id: <20251223-firmware_managed_ep-v4-0-7f7c1b83d679@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONdSmkC/33NwQ6CMAyA4VcxOzvCNsYWT76HMWRAC0uE4aZTQ
 3h3BycPxEuTv0m/ziSAtxDI6TATD9EG68YUxfFAmt6MHVDbpiY855JxVlK0fngZD9VgRtNBW8F
 EEWUrmS5KKTVJl5MHtO9NvVxT9zY8nP9sTyJft/+9yGlOlVGCCa5ErvDsQsjuT3Nr3DBkaZCVj
 eKXUvuUSBSiVqw2pdZY71DLsnwBGS50gQgBAAA=
X-Change-ID: 20251216-firmware_managed_ep-ff5d51846558
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        quic_vbadigan@quicinc.com, quic_shazhuss@quicinc.com,
        konrad.dybcio@oss.qualcomm.com,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481382; l=1764;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=VG9Yc/Ztp5a99ek/5VbjwSWG3pwWefSVP9Qc0r25dQo=;
 b=TvT/mcOIFWaluCRUX3jueXAaOE0th1lrb+QttW7hksTWV6NmBig8vg+3SpVr6hOg6ZrZSTPSY
 F1zsfC7jyaTDk32Q7pjxrxIR38g3VllmvxEbcI1g3kklk3EESUTfD0E
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfXzxWn+4L0Kxtp
 JPXLt9FcjWZgNimKlfbPDiPBm8pWoFMP16QeaV3fxgkbVQv2ykIKNQYWaT/Zyso10PfvL56771N
 lU6xPwyRxeWqpPHg3EdjDV8rJZfjPrXx25eU3X5GPW/pEi5ja+5RufMxsohlsTYeyPAMJDq96bJ
 Qgp0Ohf+hW/hjoAyVJ4vxgaCuvOxC1jm5l4wxa+uUNYH4P7tF9Pr4/h5DctnBhhQ9U9HX4kIkqF
 dmtFq+oEJ70bLH1Wi+aUNYuWcQxKfPLWMiWe4VKYf7FLMUjESxuonEriQKTmBqdnBc1L5SG/ZkM
 TjSItKorHtELBotnJWVyU/L890Jj32XuEyon0ZgbhhLId50KNgYMOteLHWQG6qITXmbw/YvoQ4S
 q3NIs2TzRFZMc0kggdt1Ewz6wcYtOPDIHdZuKscmrNFM7o3ALlrm3ywXrbrc6+7PEtEAsWwnKWH
 30mPU397PQB0xRejvtw==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a5dee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=3jyur01tNAjp9li57p8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: D_p4v2fq9pw_OBjp5U7NHRR2LaJ2Z1uR
X-Proofpoint-ORIG-GUID: D_p4v2fq9pw_OBjp5U7NHRR2LaJ2Z1uR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

This patch series introduces support for Qualcomm SA8255P platform
where PCIe Endpoint resources are managed by firmware instead of
Linux driver. So the Linux driver should avoid redundant resource
management and relies on runtime PM calls to inform firmware for
resource management.

And document the new compatible string "qcom,sa8255p-pcie-ep" for
SA8255P platform in the device tree bindings.

Tested on Qualcomm SA8255P platform.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Changes in v4:
- Updated compatible string.
- Updated dt binding file name to match with compatible.
- Link to v3: https://lore.kernel.org/r/20251217-firmware_managed_ep-v3-0-ff871ba688fb@oss.qualcomm.com

Changes in v3:
- Updated compatible string in dt binding example node.
- Link to v2: https://lore.kernel.org/r/20251216-firmware_managed_ep-v2-0-7a731327307f@oss.qualcomm.com

Changes in v2:
- Updated dt binding as suggested by Krzysztof.
- Updated compatible string to match file name and compatible.
- Updated driver as suggested by bjorn.
- Link to v1: https://lore.kernel.org/r/20251203-firmware_managed_ep-v1-0-295977600fa5@oss.qualcomm.com

---
Mrinmay Sarkar (2):
      dt-bindings: PCI: qcom,sa8255p-pcie-ep: Document firmware managed PCIe endpoint
      PCI: qcom-ep: Add support for firmware-managed PCIe Endpoint

 .../bindings/pci/qcom,sa8255p-pcie-ep.yaml         | 110 +++++++++++++++++++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c          |  82 +++++++++++----
 2 files changed, 172 insertions(+), 20 deletions(-)
---
base-commit: 563c8dd425b59e44470e28519107b1efc99f4c7b
change-id: 20251216-firmware_managed_ep-ff5d51846558

Best regards,
-- 
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>


