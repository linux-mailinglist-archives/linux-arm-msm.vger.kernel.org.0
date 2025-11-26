Return-Path: <linux-arm-msm+bounces-83370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A8C881F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 06:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B0DA3404D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 05:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98D02E172D;
	Wed, 26 Nov 2025 05:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9n8yRIb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6Hu+neZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BBE26FA6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764134010; cv=none; b=el4TxcckxRmWWKeWaSLrPnXXgLN/T+1M8lRVwak8/OmTthEsrrnMrcL/06XpbzYPvC2hF7Fjg1sVGot0/vUo5za6hWH2l5u2BSx0VO8n1fUaMNt8OXbsAPB4fs3TLEImGG7OSvYKocx0t7OqihK2u9qOUAzhiFQW66Rctkcl764=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764134010; c=relaxed/simple;
	bh=MG7UGvYzsn5lXrMzbMUfn2qZB1I3aR/5fbwGzqFW3ok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nRjVRMTSvDaDIctCL+JdH6DgXYTRNUGQBgi/VEuzVqXzcJFIpJx7Co/78MQUyj6CSwgLABG9iAIuwURhlfDpZKfy3gxsxCIEft+XSQ4hf2Rv7UL51t39xsUqws0H3E2oEPNKA0x8Oi56L+3nME4exPHvNUsTA48Z0limkqYkBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9n8yRIb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6Hu+neZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNmgbn3317510
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5q6KSzZqsTnGCB74YbGzcb
	KSA0k8T+cLTdRdI9Vx7wE=; b=Y9n8yRIbNHC6KkfEaPLPgY2hPrbYrKQBJhoxiY
	Z/Aow17rl4xrsnOg64WbAudT1VG2p9aXSDqW4qeQizo+1BdTIqNB+76qFSUc5Ce7
	4n5XsYbufJHVwhQliJNeilYYEXml5mQAI4XyvzDxm8iFkJTac9Srider6NQxW7rT
	/wa2J00Q3JIxpVqynxv9ZofKLhYgIQIeNN6bO3wD0AkEOA9TKiXQ6PNBoRS/yhoH
	q7oOnZ7Qezifnc4bD+3onT2KJh21CTBhVbNsIRcZCoXZLirPdMrKYxyIx54TKQfE
	AVmwDgDA6DTYb8A7qkhohrFRqIymGAODp/ylsqcVrdgLBl+w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4and2qjay4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 05:13:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-299ddb0269eso78956535ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764134004; x=1764738804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5q6KSzZqsTnGCB74YbGzcbKSA0k8T+cLTdRdI9Vx7wE=;
        b=J6Hu+neZ5wG6UfRqkOUBne+vJnp3fQ9fjgSVMYpEhVDOayq8jgZVsPXiniLz4Tllx6
         6xoo+VipvuhZPWx6eU5ywBypb0BdTDvxZpja0pWd1RfrGDI6JLmd1ib9nDmzBEpcHgqP
         8UYuLIjJOGsETWR89DcU00JkDtPUuOXQ0kWAFN1OVyN+EUin4KTWh2TI52zdY7bbQheT
         RJWOICPI36ObgpYspgujl6ATr1bYXo6aUW9VTZg2FvhMewrdcNDfATRYDkwGCq5d/jea
         W1cbNXo3F+8QX2pWZ4dA7N1TVgEPQN8RLec3y2zL+ARvCE58s44Qy3L+kfvpM/Ti3GOd
         5cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764134004; x=1764738804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q6KSzZqsTnGCB74YbGzcbKSA0k8T+cLTdRdI9Vx7wE=;
        b=J54qVygvOdx+042X/fvsRv1BJWNdHWKxeHsGBX/Gj2U7+7G9/DKmMtAzps9YzW7y6X
         cZWdu+6xDya5/WGX0yMqChd57v3t/XdnNEi+iDwkQjVzR99oEopfGlZiuLnx3amY5fYs
         cyQOP4NyHwWy+hDcRF8PLGACn0euDmhclkQdmEprYGHkJKRl07SR19YO+MVWb6PZN9JJ
         +qdaG4qVgr79r88my4PynLqUuYlkRJxVqlB8HwepwQJMqSpWiglamClFokCzLHOPC4W1
         sGk+DUpYI0ddufJjuj3Xu+Dw4RvmHg9ZgHmKOKmSVD4/L3gFvxsCT5UfwPxt8Iuz3n+z
         gdwg==
X-Gm-Message-State: AOJu0YxCtwAD/aPcnMqpVHccp/rdTr/mPb+siZZ0k5cHh8+ZGIvIEm6E
	DEU8599IgLOIxdz5Pb/FBqYDT6HbybwgSDDFWItpqoAVRmQjXuC65RL190HkSYeKgd/jm3+GFg1
	UGWxQ0gb3pTy31cAI/+WT7z0Z6qNnt+XaZ4ptunl5xTV3o8l3xfoWshZNajXLP05RaIKF
X-Gm-Gg: ASbGncuvSiEkyrcAFqafSNA3LoVHgg/IH2GjwF3zs9mDcOOGJyon8hf6U3NFUDnm9Cr
	CbNcPEJNXAaWwC5UdxsKSASxqEYg/ku56DFpapsyVmOb7Epz1qHx3mzbupH9+1ixaND+WToIrxA
	wI7b9RnJgTD8/Aqzh2nm6PSeS05XthdEx+PUsaRU//saUYIBHhpRlOaDB0zo7wvYpY2S0SuxdtM
	OghmtlsX3IZN7PTzZtjKrhZPZG6H9OTEyNW5Vp4h5BsJlCMoIJ5sMUwvKBIz/rLIYfio6TDAXcn
	Rc0oDgYTjDbSY4TynjS6W8HdrVhLYDsxzlsf2cgAwuDpu96GEkPLlZ+o592/6drIX6Iz0pQaI2s
	tRF8EYEXNCOeyX+JAm47Gh2NO8Mjk2zTsk6aQwX+5nD1A
X-Received: by 2002:a17:903:2ca:b0:297:e231:f410 with SMTP id d9443c01a7336-29baae65be1mr55800885ad.13.1764134004141;
        Tue, 25 Nov 2025 21:13:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU4VnLm6yYcgfnNSUrh4/UqP9bZ4wm6EEdBXVnMeGjCkEZYcUkYix6vQ83gL6RzD176yiZ/Q==
X-Received: by 2002:a17:903:2ca:b0:297:e231:f410 with SMTP id d9443c01a7336-29baae65be1mr55800505ad.13.1764134003627;
        Tue, 25 Nov 2025 21:13:23 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a870sm183591315ad.34.2025.11.25.21.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 21:13:23 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v5 0/3] spmi-pmic-arb: Add support for PMIC arbiter v8 for
 Glymur and Kaanapali
Date: Wed, 26 Nov 2025 10:42:52 +0530
Message-Id: <20251126-pmic_arb_v8-v5-0-4dd8dc5dc5a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSMJmkC/23M3wqCMBTH8VeRXTfZH+e0q94jQubZzEE622oU4
 rs37SKKbg58D/w+MwrGWxPQPpuRN9EG68YUYpch6NV4Ntjq1IgRJihlHE+DhUb5tokVLstaS0m
 F5kqgtJi86exj046n1L0NN+efGx7p+n07hBVfTuSYYFC60qVi0AI5uBDy611dwA1Dng5auVh8C
 PpLFInQNdXQdqSWIP8Qy7K8AErknrHwAAAA
X-Change-ID: 20251123-pmic_arb_v8-669d7715d3a5
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764133999; l=3555;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=MG7UGvYzsn5lXrMzbMUfn2qZB1I3aR/5fbwGzqFW3ok=;
 b=eU4xGjG3R06YLCWnU2xYz8HIRgl0p1UmG9+/4z5O4K+iekdqYwvmLyuYUn3dsWXNgMbBab1FT
 KMe6SPvDNLWD31YMw4m/a7XkAx74BqiNAgByYrY1TQThwi1qv9E5vfC
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA0MCBTYWx0ZWRfX8NxOl0JjNvIo
 MaMTlrh14KogNbS1vWPjU7tbOJqTTNaLIUmT7tDh3QMQUKqv0HoNEDvnIqKlEd//VlhxOZkTWwE
 jMcBV6q0MjvMwI8jtCCIxME7XfYRaQlyxFZ559i84T/M1kOzmon88LGDCASuBxRZhhNnjMN31OD
 gNPf0Qz1qMj+eQ7iuqq5bC2uVtY9+EXjaAhSHtgWghFs448cOe58b7v1cv/ebfGkMUD89WRbGQX
 ka/9eOeLXZhBeqnATyHXPerv6bpInmpk6LYtI3x1P+XmgKi8U+asw7HCtApgKhBVGNWX7Z7pcva
 5XzwHnkNoKyUkvvXGW+3j6rqj41Nb/QS2NRmilKYc8gEMk4Rg3z+P+5jmmDgFkVObB5u6UE34II
 7T5WIXUheMpz0VGmdwb+UFsPdzJ+Yg==
X-Authority-Analysis: v=2.4 cv=dZyNHHXe c=1 sm=1 tr=0 ts=69268c75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=OUK7M_EUaPGKAuIlalkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: cOm5yDke9U6gs_FCv6jgrZHPugDTiy7Q
X-Proofpoint-GUID: cOm5yDke9U6gs_FCv6jgrZHPugDTiy7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260040

This patch series updates the SPMI dt-bindings and driver to add
support for PMIC arbiter v8, targeting Qualcomm SoCs Glymur and
Kaanapali.

SPMI PMIC Arbiter version 8 builds upon version 7 with support for
up to four SPMI buses.  To achieve this, the register map was
slightly rearranged.

Device tree changes are not included in this series and will be
posted separately.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v5:
- In patch 3, removed unused variable `ret` from _pmic_arb_init_apid_v7().
- Link to v4: https://lore.kernel.org/r/20251124-pmic_arb_v8-v4-0-d91dcbf097c7@oss.qualcomm.com

Changes in v4:
- Collected Reviewed-by tags from Rob Herring on patches 1 and 2.
- Made following changes to address Konrad's comments on patch 3:
  - Moved bitfield.h inclusion for alphabetical order.
  - Added mask macros for use in spec_to_hwirq and hwirq_to_* macro
    definitions and updated their definitions.
  - Updated if() check in qpnpint_irq_domain_translate() to use FIELD_MAX().
  - Added helper functions _pmic_arb_read_apid_map() and 
    _pmic_arb_init_apid_v7() for common use between versions 7 and 8
    in .init_apid callbacks, to reduce code duplication.
- Removed pmic_arb_dump_apid_map() as logic for dumping mapping table is
  now kept in a single place, in helper function _pmic_arb_read_apid_map().
- Link to v3: https://lore.kernel.org/all/20251024-pmic_arb_v8-v3-0-cad8d6a2cbc0@oss.qualcomm.com/

Changes in v3:
- Split out some common DT properties into separate binding file and updated
  existing files to reference the common file for properties moved out.
- Also updated Glymur binding file to reference above common properties.
- Kept David Collins alone as maintainer for new binding files added.
- Squashed kaanapali compatible change shared as separate patch earlier:
  (https://lore.kernel.org/all/20250924-knp-spmi-binding-v1-1-b4ace3f7a838@oss.qualcomm.com/)
  into Glymur binding patch.
- Corrected comment formatting in drivers/spmi/spmi-pmic-arb.c to fix a
  kernel bot warning.
- Updated definitions of spec_to_hwirq() and hwirq_to_*() macros in same file
  to fix other build errors reported by kernel test bot and removed a comment
  made irrelevant by this change.
- Link to v2: https://lore.kernel.org/all/20250924-glymur-spmi-v8-v2-0-202fc7a66a97@oss.qualcomm.com/

Changes in v2:
- Split into two series: SPMI (this series) and PINCTRL.
- Included the DT bindings in this series, previously posted separately.
- Fixed kernel robot reported issue by including bitfields.h.
- Link to v1: https://lore.kernel.org/all/20250920-glymur-spmi-v8-gpio-driver-v1-0-23df93b7818a@oss.qualcomm.com/

---
David Collins (1):
      spmi: spmi-pmic-arb: add support for PMIC arbiter v8

Jishnu Prakash (2):
      dt-bindings: spmi: split out common QCOM SPMI PMIC arbiter properties
      dt-bindings: spmi: add support for glymur-spmi-pmic-arb (arbiter v8)

 .../bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml   | 150 ++++++++++
 .../bindings/spmi/qcom,spmi-pmic-arb-common.yaml   |  35 +++
 .../bindings/spmi/qcom,spmi-pmic-arb.yaml          |  17 +-
 .../bindings/spmi/qcom,x1e80100-spmi-pmic-arb.yaml |  21 +-
 drivers/spmi/spmi-pmic-arb.c                       | 304 +++++++++++++++++----
 5 files changed, 445 insertions(+), 82 deletions(-)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251123-pmic_arb_v8-669d7715d3a5

Best regards,
-- 
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


