Return-Path: <linux-arm-msm+bounces-19952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CD18C7E9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 00:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96E451F22446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 22:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF061EB2B;
	Thu, 16 May 2024 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6oNxWC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8501A2C01;
	Thu, 16 May 2024 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900384; cv=none; b=ZCNwmmw2JxNYVgnw5njgKFc5k/rkie79nAtHarOzLx3PzQMc48bkbQ1a31m97iURXoTt/soLHyNFSsv2rULqTZlr12qKSH+8PEEcED0KptisjP5zroloRqgG69qdAuT092ELldGX4RhtBLG8/NFPxiugWtXl1Mbvpgcd/3s8oes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900384; c=relaxed/simple;
	bh=Jjc+GJYzicTjx6js4GerbYp99kWiJrFUOJeZVVAgHEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PINZ8c5SXg/6yuSCszP0LbzXxjoOgToXG0ZJ+LJUDxW7MOEvJ3pJwg7cdpOiXIV2kSydejPeANSi3sVtLwVa+gbl3boquR7463v6FmYjHRRJXH/+di80gAyQChnQQOS//No406ynasDwaqPITo+KH/edPTL1RWWNviJZ6DQHiv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6oNxWC+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKNAhZ007332;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=Ema2+2A9vujXjn0yFcon4n+NzkviWKE52u8O3MUlHwE
	=; b=F6oNxWC+hp0VJ6CjvibKqboMLMJ7xBqwimqcbRdjK2MGS7FGVkBX9MnihdY
	MgEAZShB8RfjhWD649NsNTbwOxPeiJZ6eE10baGSAaiiKz/StNqnAgz8HdBWZcBv
	UiHWoUUAOT38qbP6F5z9PHXHNeK7foRH5En2RfC4v2OM+w/GHuxq7uOS3C2DW1xb
	klBsRlCemm9yrRcuDMizyqhf4RFfZkHG3xid7OtzvbeqIf+Eo6wRF+peK7+1BjXe
	JXjVYKaup2vkjSR2jxDzA7yEfIP80XY7daGuBN8y+toAv9aYQSjuZSS2cdwPooND
	T0SCaECA2TG/1wijbPu4Iq6wZWQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47f46tq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6K4012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:06 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:06 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:23 -0700
Subject: [PATCH 5/7] dt-bindings: remoteproc: qcom,pas: Add hwlocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
In-Reply-To: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=824;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=Jjc+GJYzicTjx6js4GerbYp99kWiJrFUOJeZVVAgHEA=;
 b=xzKylqpOHoFsq+WH5F1VcT5ZBBSUftVR5DOi6x/eDdh53M9L28Z0uUCMfA2Kba58JK8k0g4LI
 KNlskJ2vMmQByp0hvzE3BSh7EY0SflJfnxW/rZ9PHo6ZwDgynCLOJiT
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1lqfqvuSgY5gUydpbDu7lFNE6Ah42Gts
X-Proofpoint-ORIG-GUID: 1lqfqvuSgY5gUydpbDu7lFNE6Ah42Gts
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=897
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

Add hwlocks property to describe the hwspinlock that remoteproc can try
to bust on behalf of the remoteproc's smem.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..483a8ff5f47e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -77,6 +77,9 @@ properties:
       and devices related to the ADSP.
     unevaluatedProperties: false
 
+  hwlocks:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names

-- 
2.25.1


