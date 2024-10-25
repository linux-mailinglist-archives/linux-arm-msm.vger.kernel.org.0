Return-Path: <linux-arm-msm+bounces-35769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B819AF7EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03C44283584
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136D218BB90;
	Fri, 25 Oct 2024 03:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h3GCrFOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2DE18A6AB;
	Fri, 25 Oct 2024 03:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729825711; cv=none; b=fTnXMmndVjbTlecs1Pr3f8A34HVJvyMiOatVXjFSBk/DYpVJiNNeVCSpPNAvrS1TmMT7lYDVibx+3FHC41dFTtbIqUCt55BKYiiiSRhv3/TV/APcbV+g1MOV9p4GoS8rZoEW8aONEzNwPuKwSmogyho4eKNLECtWGcwIzFYW3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729825711; c=relaxed/simple;
	bh=qoSJY5JdiDzbQ2AvSiCH06l7nAviyIfw6PdINqwhdEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UO2nRg5B3Kuumfch+W5N7aQ9tWJfK8V1nIpaqsgUYwgDQcbX+EPbEA/XohcZyZkL3IEW+URMDxbiqsuWzE58nWMoH9gG0f/PJ2xwQx1+9qMv5DkzJ7RbgL0Not1rSKWTkDsLlscgj04mSSzFWkcV/QvQvuodwKsn6htWDSbZUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h3GCrFOk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OJn7G9018657;
	Fri, 25 Oct 2024 03:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zux7h0zyMNTY6/mdoZyz2neb
	ql9hbQ8VSDiOTsQzjn4=; b=h3GCrFOkrOITbfK8P9k8M2afEHnqTyKvrKbX49CM
	zgfSyBsxPqLJcqZzBvEd5X5aVqw0gWZp5+Ysei2xsI80XmZuxF+PMA2RD9Z1xKxQ
	C+xuFKuNnMNC67o5GaGOyJGC+tdlwE0CxItprhs1PvV5FZAOQFS+cBIaAlShB3gJ
	io3Q4yQg1V9GEmxFFmbalrofN47kXoSkLxYCyLKLFp0I7FUJPpLMvjyvRm1RKM6C
	r604ISt6wip/p9N7x2d7TrxDt7N0LAvWZj7fy0EbI86tXHeJ9bht90E12OLVFQ+I
	mFsmefDnTs7gmk0hH6IkVpcd01o6mb9OzYeUGJ500HkxIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em66fkc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P38FTF000683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:15 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 20:08:12 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v3 2/4] dt-bindings: arm-smmu: document QCS615 APPS SMMU
Date: Fri, 25 Oct 2024 08:37:30 +0530
Message-ID: <20241025030732.29743-3-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 40ZaWAhGQNAVON7uZKqplvGXCKjmeD3G
X-Proofpoint-GUID: 40ZaWAhGQNAVON7uZKqplvGXCKjmeD3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=990
 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250021

Add the compatible for Qualcomm QCS615 APPS SMMU.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 92d350b8e01a..d3093263d888 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,qcm2290-smmu-500
+              - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
@@ -555,6 +556,7 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
+              - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
-- 
2.17.1


