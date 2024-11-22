Return-Path: <linux-arm-msm+bounces-38780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A76949D5A44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A79E1F2357F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97A6170A31;
	Fri, 22 Nov 2024 07:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BOwMXFkv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CC016C695;
	Fri, 22 Nov 2024 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261794; cv=none; b=NY69jTB2TvFsy6Xm6ou4uhYXWuVKD0Iiz2g0qKWbBuRE3qUlcoDhpoWNqKykkzQa6pJECZTCAXyvxfRLxI8duayOotpt2+2G7ZS0uPaGQP7XM7TXYwYmnlhJqVAcZ3yKN1XmfC9EIDwmbvO8jrar7426EsNSEdMX7Gw+xtZowi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261794; c=relaxed/simple;
	bh=zuAg3jddV2JVzG9hjteBYSTqOYlve5FOthk55IOXXmk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fws8SDm5mcJJppTW5VAfoKa7tqAmUfVQtGhUaJ+6MaHZLTXfMQhLafWyzK7txo64flQ5cfDAmMvZQy9Nhm+3rm1qOGJWarYaB4fUdxk54hBoubCYyCMti0WcTVXAljgKdh2itKCrGNV8uOfnihMYFE9q0ddSSrXBugOoy62leUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BOwMXFkv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALKwoLC003946;
	Fri, 22 Nov 2024 07:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=PAeWzpRZdiOM8oGZZzYhFjcJG/6nNhejF1UWG+tcHfY=; b=BO
	wMXFkv6RcWBOgRMA9VnXKcW3vIccADNznHkNSyHUFMwX1JuUD5KV75ZciR24Nw/L
	JlHyGZbYG9qd5JBpgzRMdym7loes5M9+pIh7M/pclpSUWI3gs+kv8H5YSchNir7U
	wD+ntNPA0m/yKxdx5qO4bpUygFg0+9RKekU12oYCe4JeSnHChRwzIySr7CQoKcN2
	FQy5NPcHqEwHBYI3wFAWYWqydWXoRUvUFL+nndF70FfvGXz0MGcZXjQdAO9jbPnH
	p2Vfc8KzGpR5c0O9MJzQDjVk76N8Enm3lQKpvD4hmEaZ5MopbjcCcK+MWvp5TeJt
	q/hHrKc0o7lnua/BG9IA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3ek2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:49:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7nglY001587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:49:42 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 23:49:39 -0800
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 0/2] Add support for GPU SMMU on QCS615
Date: Fri, 22 Nov 2024 13:19:20 +0530
Message-ID: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o7ibM_9_aV_4CknYjW-ulMzqgkVRLza5
X-Proofpoint-ORIG-GUID: o7ibM_9_aV_4CknYjW-ulMzqgkVRLza5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=891
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220064

Enable GPU SMMU function on QCS615 platform. GPU SMMU is required
for address translation in GPU device.

device tree dependency:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

gpucc dependency:
https://lore.kernel.org/all/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com/
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/

SCM dependency:
https://lore.kernel.org/all/20241105032107.9552-1-quic_qqzhou@quicinc.com/

Qingqing Zhou (2):
  dt-bindings: arm-smmu: document QCS615 GPU SMMU
  arm64: dts: qcom: qcs615: add the GPU SMMU node

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  3 ++-
 arch/arm64/boot/dts/qcom/qcs615.dtsi          | 27 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)


base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
prerequisite-patch-id: 8a2454d5e07e56a6dd03f762f498051065635d85
prerequisite-patch-id: 9ac14d92d33487fa1b8590df2bfc21aa6a07c47d
prerequisite-patch-id: b06463a967744ad6a9e3ce9d8edeed676548ae7f
prerequisite-patch-id: f9680e3c90d8f05babbcadd7b7f5174f484a8275
prerequisite-patch-id: 6820b3043b3fd091dbf5823be999216b38f83f4e
prerequisite-patch-id: 005f7e4772a8900d8b53067e80f04ca5199d7e6c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 14c92e8198d2a4ba02bbaec069939c3fc742f6c6
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-patch-id: 7a4200d4bbbfb97973af933b611c31c768181d7b
prerequisite-patch-id: df2550174f20fc281930b7660c4d08b1cf03abe4
prerequisite-patch-id: 6d52dd659917c7d2c24789a0874f6a964cb4fe36
prerequisite-patch-id: 68e0ad0308fe6e1c4e8b71013b92223eeb1fd08b
prerequisite-patch-id: a4f1010d6b115c921334de819563f431bfd53658
prerequisite-patch-id: 90b9c37691ae5337863d9538cddddf3c15733a6f
prerequisite-patch-id: 085c292085c8fe52c724e5a2b590907f94010aca
prerequisite-patch-id: 4c0b32009ac43d6c46dbb72bfa62e44acd9b7187
prerequisite-patch-id: b2fb240e25d48232e67f379d4ed1a170f3c3a067
prerequisite-patch-id: df38b84507c9e62c724dca4ec0bc7c8442feaa3c
prerequisite-patch-id: bcb1328b70868bb9c87c0e4c48e5c9d38853bc60
prerequisite-patch-id: 8844a4661902eb44406639a3b7344416a0c88ed9
prerequisite-patch-id: 8937b0848eb8b32dc21d044fa43a33a2efbe345d
prerequisite-patch-id: 4db9f55207af45c6b64fff4f8929648a7fb44669
prerequisite-patch-id: 89ce719a863bf5e909989877f15f82b51552e449
-- 
2.17.1


