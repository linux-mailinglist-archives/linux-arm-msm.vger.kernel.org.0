Return-Path: <linux-arm-msm+bounces-34021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A7999CB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F9C128405C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833E2209F43;
	Fri, 11 Oct 2024 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CYoTrqur"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECE319AD94;
	Fri, 11 Oct 2024 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628321; cv=none; b=SZNfVNYULuRwChetEk9ZZOCtxoJ3PUzCIqZjpxh6heeyEFQ1OC998tV+9A4oQvzqCMDDI7jtBWsmgvn/RMGYXK1NqFVLcWjITAKFlD5KHVK9FPFL0iLD+Kc7Bg6p+S5HA3B/fDiUyhUoT5Hm5rvXuLkB2HADjDndtV/NVi8WuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628321; c=relaxed/simple;
	bh=TFHYPuf+Mjf0FYTiO3ZCnvy4BrW2sBkG8S4zsDA4VFA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ul+i9PEWm0csMBXi7LI6Gufl1OVvKOVOQN6gidAHxoB8SVUybR4ldCpXAUj7tCcp48L3Wm39n++whJUqy6aSXlqlmgB7GQ+tKS1yIJ1Ve/+Lyv4Ub2ZeqK+dhw+EvCs5GNxtBZqXkYz9bv0/Ys4vbYjSQSSE3SNCVtTbhnqjA9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CYoTrqur; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B3gBiu004925;
	Fri, 11 Oct 2024 06:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ay1RLGTSFCUiiPOGe3vlxxn6
	yDKOrRtoFsq0y39tX/s=; b=CYoTrquroH6VCzM3n78XV1XMd1zmPpmCA8yKnddx
	GToNoV59b2hFXsv8gL13gZDCfDa9buuPGdLiEnGotfhYgve72Yp+j0W/Cx9b4vdI
	5CpQwN9i/Deyq2bHNT6TdlR3JBWgDZmC4/ZsdotG+qN38ZXd7uX7vMTVaP3WSyen
	GhhC2dgRWd7cMgy2lu9b0bsIRd6XW0b8eQDi44NDCXeGAzqbMZ4BjaingzLdP4IK
	6XKPTdNqH9jB5GZgFR7hm7yKcJju6S0nLuLKhZFJb9I/C6fJsynJ54DaARPJYScO
	zoNadqOjowwHTSliTnAoIekMtryniS+KUWbafwNOuFrXgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426g6na2u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6VmVA012907
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:48 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:31:45 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 2/4] dt-bindings: arm-smmu: Document Qualcomm QCS615 apps smmu
Date: Fri, 11 Oct 2024 12:01:10 +0530
Message-ID: <20241011063112.19087-3-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
References: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b3fplWy13m8Wtpxl87qbmN7pmmTwzwr3
X-Proofpoint-ORIG-GUID: b3fplWy13m8Wtpxl87qbmN7pmmTwzwr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=997
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410110042

Add devicetree binding for apps smmu on Qualcomm QCS615 SoC. SMMU function
is required by multiple functions including USB/UFS/Ethernet.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 92d350b8e01a..9e62c2cdda08 100644
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
-- 
2.17.1


