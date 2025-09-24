Return-Path: <linux-arm-msm+bounces-74648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D48E2B9B841
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821AA4C4F5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC6E31A7EB;
	Wed, 24 Sep 2025 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX5D/B7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668431A573
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739085; cv=none; b=pq5X1PqaFux4rIJqRcHVd2DSckvg3z3YFAcmzrCHhWs6GbCeVnNUWq2kSiVZvHWJzw4ovZtpsD4Aeaak5oPyo59lN0Yj6wj5HY610avr6Q+C//tzerfw5BsCKT+oEAH/HBHfTWOE8P6zLeKT5v7Xq5YDatP4Uv6s5eW5bQjkr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739085; c=relaxed/simple;
	bh=x/yB3U0JOrNOZ2V9rL6+/azkb/Ffu+YJQwvpcwVJLj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZGnbs19NRO7meuKZ1Z/r22sYVGG9SYv6LwK92O82rbSyASoyT+ubQWj9/jGLiQs5Q3rsFcPvLZlBZLv0fFOVbK3js6wpAGzg9JA+j9N63NApzxYyj4YjPSgO5JXTambdQ+WhvY19/7A4fIIvUeQBs0WUB+ccvnzH8KpXkXYbhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX5D/B7o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODDCnr018200
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9RNW1M1uDCL
	xCSHh9UIK713brM5SN9OdS/M6VDwK+XM=; b=cX5D/B7o/uCfC4dHhPFpLHqpeEt
	ezYPkmdcqQBHHuuvo6JTlQotW9CQES8jhMUnzIarfPKGzt9RXmcDdtKXa3v+r8xw
	hATn3jqd2XHpcj6JJKwFy/J1aQ3Tlr0EXXsbJ9eckymWqbf6KubVhMWrQy47MLpZ
	fABS32iNjRoF1YECqTyZi1BxYcKB3BFeuwmPjRsDkoNGO+/E7dZeg1HmFOdUWZC4
	hT7K4fTZ59sT6ffiZIRuFwbq+sUHyikuvVD2mo2K6QdgV1rvUYqazYpjZm81Iaho
	0gSz5TOvX8sVgf3Rbuoro2uyxuPeqqr/GmdqVRLCzRK2JmglWt5HHxUwtzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk9cc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:38:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b55153c5ef2so77591a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739082; x=1759343882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RNW1M1uDCLxCSHh9UIK713brM5SN9OdS/M6VDwK+XM=;
        b=PFxRGnsX2gbQGizFEjCJkuXj+V0ZVIgoHjPOmjUAtsh4Vc/TkGo2qpxoX83AwTTHSt
         LISo9MffdO5iklMAp47G/9wbBcylpVxJbSCtO0TCOQYbfSOnaSFBLQUjmV8KVkixoIO1
         +JXc6eiYvxfk8brioq7D8HPKfKEqfnt+w6sJpDIG+4xxxwk5afAn5c6MQ3A34NjUBXtC
         KYXfesRxs7U5EXXTBxO1GN7GPGuyISOjK3teJPLz0WGYNXU9GWBduMHuZ0KUx6wIDSlI
         m1PJQ0/s/E12Y9oRWkbkuKr5tTNg/fhKJXaNRWJM7Tf0yslPDyTBF9Tsg/ZHZPECITSs
         VQbg==
X-Forwarded-Encrypted: i=1; AJvYcCUnz9QyeqJjlP35t0qloZ/YldIYFmFpCBn3+QQzMexCS32rITWemolrMMubDQ5+WRQ8pe65M1wSkdgH98bP@vger.kernel.org
X-Gm-Message-State: AOJu0YyWH9L6v796UIJxtk97IoMFd+pDR5GPPqstKHeQQumIi6QpwO0q
	2ec6PISuJzLWa/ZScoQe6lZFDzvEr8ySjI3kxioChs1D/Ml3J9vgHKG8yE8vV1cF5WN33Tyx5Ao
	KVLA5T29FDIYScWu1Ntn01HDHsiApua3uHwU/EBvL3lTbtG7i21fCP9CRewVRjuqb8AFn
X-Gm-Gg: ASbGnctWmBVOglUpfIkP5heCNIopWVTGrxMXmAazNnrHhz1QXz+k7dPJW1i8vUf7TYg
	e+Qc0ZZgxA/l2aqe1o4aS37NsOqJiLffp/34vblCOyp4ASMUBz9ubkpRCSlglI1iiavYh6VD7GN
	UhFMBpCXAYbW6uexh98cP0igzcWhjdOmKJdZoUw2WJ9GjiWfznB0oaOMGnF0Nexuld9K3Alwigd
	aruncmktRWqXl4w8SBcjf0KIRAa8DxpMflPG1bAmcxJfF8imrcxLJsnwtLojCU4K3amDRGreh8d
	UNNI2QZrAs56/3nPhzmPrMAyxDed/9zW57UpBXsoGN+eQ1o498cfK5sNzR3MMncuMZDiKLbrCP4
	W5R6yieAHzd8bXkKFV+g3nobB5Xb5UtilSNlr3SAO1m7OX93UhXF4tPo=
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr754834637.8.1758739081486;
        Wed, 24 Sep 2025 11:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQozrNUM5/5vTV2ruPG6yCF0B0PeRf3UGyZidkCzWFRA+CJQBk6NhKsxQ/GiS8C6ISg1ZxLQ==
X-Received: by 2002:a05:6a20:a127:b0:220:10e5:825d with SMTP id adf61e73a8af0-2e7bfc1d570mr754806637.8.1758739081070;
        Wed, 24 Sep 2025 11:38:01 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:38:00 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: mailbox: qcom-ipcc: Document Glymur physical client IDs
Date: Thu, 25 Sep 2025 00:07:23 +0530
Message-Id: <20250924183726.509202-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vVs5JcLdkgogNdi9tMO-8SIfO4S40j4q
X-Proofpoint-ORIG-GUID: vVs5JcLdkgogNdi9tMO-8SIfO4S40j4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX5bG9yCgP+DmC
 NqedQ1FrnHB8ajiZ/MTknRn/x3GFhdXK2yonOvqRsU0EUZWi9LP83/UM4iT/2uWGAVq5LnEKiJo
 vzD11owoUmjASx29BLmfbn3Z5GEvNlkO/MUMUkmVEQHxPDx/v/8bZ0JusNMYqwKD8dsDg7TZtw+
 AxBq1ZsQlcJYoB5fxYFY/DIFvEtH3JlmChBU5kqEbjI6GXqU9IZkpbJwztSNCkcYc40PweGldCh
 hdpDxVY/JUqmsZY4LlJwpgaxduXz/Abf38sHu4pa+OixsZwBru04D+3MumCGduEClex/50Qve/8
 W5Lg0tVXkHatKrfvlAb4HKwogF1oPNR2n7sJkLdNyHVWWvCH2ouXlxj2eJInEQSBuKfFnnezi4p
 QRglkStE
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d43a8a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QlhcEh-tmJ1xmMBebrMA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Document the physical client IDs specific to Glymur SoCs. Physical client
IDs are used on newer Qualcomm platforms including Glymur, since the Inter
Process Communication Controller (IPCC) HW block no longer has the virtual
to physical mapping in place.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

https://patchwork.kernel.org/project/linux-arm-msm/patch/20250922-ipcc-header-v1-1-f0b12715e118@oss.qualcomm.com/
^^ patch seems to assume physical IDs are common across SoCs but it doesn't
seem to hold true on Glymur.

 include/dt-bindings/mailbox/qcom-ipcc.h | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
index fd85a79381b3..61cef29e43f0 100644
--- a/include/dt-bindings/mailbox/qcom-ipcc.h
+++ b/include/dt-bindings/mailbox/qcom-ipcc.h
@@ -36,4 +36,65 @@
 #define IPCC_CLIENT_GPDSP0		31
 #define IPCC_CLIENT_GPDSP1		32
 
+/* Platform specific physical client IDs */
+
+/* Glymur physical client IDs */
+#define GLYMUR_MPROC_AOP		0
+#define GLYMUR_MPROC_TZ			1
+#define GLYMUR_MPROC_MPSS		2
+#define GLYMUR_MPROC_LPASS		3
+#define GLYMUR_MPROC_SLPI		4
+#define GLYMUR_MPROC_SDC		5
+#define GLYMUR_MPROC_CDSP		6
+#define GLYMUR_MPROC_NPU		7
+#define GLYMUR_MPROC_APSS		8
+#define GLYMUR_MPROC_GPU		9
+#define GLYMUR_MPROC_ICP		11
+#define GLYMUR_MPROC_VPU		12
+#define GLYMUR_MPROC_PCIE0		13
+#define GLYMUR_MPROC_PCIE1		14
+#define GLYMUR_MPROC_PCIE2		15
+#define GLYMUR_MPROC_SPSS		16
+#define GLYMUR_MPROC_PCIE3		19
+#define GLYMUR_MPROC_PCIE4		20
+#define GLYMUR_MPROC_PCIE5		21
+#define GLYMUR_MPROC_PCIE6		22
+#define GLYMUR_MPROC_TME		23
+#define GLYMUR_MPROC_WPSS		24
+#define GLYMUR_MPROC_PCIE7		44
+#define GLYMUR_MPROC_SOCCP		46
+
+#define GLYMUR_COMPUTE_L0_LPASS		0
+#define GLYMUR_COMPUTE_L0_CDSP		1
+#define GLYMUR_COMPUTE_L0_APSS		2
+#define GLYMUR_COMPUTE_L0_GPU		3
+#define GLYMUR_COMPUTE_L0_CVP		6
+#define GLYMUR_COMPUTE_L0_ICP		7
+#define GLYMUR_COMPUTE_L0_VPU		8
+#define GLYMUR_COMPUTE_L0_DPU		9
+#define GLYMUR_COMPUTE_L0_SOCCP		11
+
+#define GLYMUR_COMPUTE_L1_LPASS		0
+#define GLYMUR_COMPUTE_L1_CDSP		1
+#define GLYMUR_COMPUTE_L1_APSS		2
+#define GLYMUR_COMPUTE_L1_GPU		3
+#define GLYMUR_COMPUTE_L1_CVP		6
+#define GLYMUR_COMPUTE_L1_ICP		7
+#define GLYMUR_COMPUTE_L1_VPU		8
+#define GLYMUR_COMPUTE_L1_DPU		9
+#define GLYMUR_COMPUTE_L1_SOCCP		11
+
+#define GLYMUR_PERIPH_LPASS		0
+#define GLYMUR_PERIPH_APSS		1
+#define GLYMUR_PERIPH_PCIE0		2
+#define GLYMUR_PERIPH_PCIE1		3
+#define GLYMUR_PERIPH_PCIE2		6
+#define GLYMUR_PERIPH_PCIE3		7
+#define GLYMUR_PERIPH_PCIE4		8
+#define GLYMUR_PERIPH_PCIE5		9
+#define GLYMUR_PERIPH_PCIE6		10
+#define GLYMUR_PERIPH_PCIE7		11
+#define GLYMUR_PERIPH_SOCCP		13
+#define GLYMUR_PERIPH_WPSS		16
+
 #endif
-- 
2.34.1


