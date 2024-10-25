Return-Path: <linux-arm-msm+bounces-35767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054199AF7E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35F331C20BF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB50818B491;
	Fri, 25 Oct 2024 03:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfQVUnKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79EC8DF;
	Fri, 25 Oct 2024 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729825704; cv=none; b=BbSiFQxwL1864zWL/TGjKHYDFQ5nx/L5uyMV3vl1o3ktFAiYD6j7Hpvs1AhLwZMzpb8ljOakIaWfejpBvCGDpQAI4i+o7yrzSCxtaliwCtr3xoHIwKk7fN+EZEIqNEelRLXrzEEdZkAxpyca7m47syo6XEigWqNWPaW7wrOeHDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729825704; c=relaxed/simple;
	bh=Egjc8NHxJzN1bS6lXlCYWHNwh3S5xbMi+N50oid7zsI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zo8EsZjw/2/QUpj0OHm0d2I6ea7ZohSifhEw5r/dVUvVYqgaCGsIbkZ+KjgsNw5+PvevsN1TuCot0YgdJHd4a9kbm0EqtOAcCewsKarzxkunZKVqSiaFpYLd11kpje2OngfKneFS7MwX1WxbHthIyplsX+AUHEdr+/RbKIO5Tgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfQVUnKX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OM4jEM025435;
	Fri, 25 Oct 2024 03:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oMKJcqbkWLg4bpUmlxbTtWZ/
	M/XakWU6eNht5HpBcGw=; b=LfQVUnKXUsLDDUP7G9Hl73dpxq7hw1LK8jRhC+UK
	mtLu7bcIpd5aFbUPhVHIfxjpAI9Z02/tYwEuscczBMXrs79vG3pOM+K2b/TEraqu
	AyZBhYwy6UaZq4nKZvbMq3feCgkTKl+bjd/11XdoUosgaGSJVkKdbb5wub5wkDXf
	qrvESKNo4T9+zr6n+MVTkiCVBWnLPcEU3Bpn9qjMdKraeCijIKR4UWg9fxB0htq+
	2x9+rToB5JU3pYJ5zNQy3y1AsnWfGBDeiSwcBzRwAtUy35Ua6Yo9OBCYgJQFwZT0
	xcvfaFUFS/QnAe1fWkVI7KbN3JqQmmnFMKle3I8Zip3GUg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em40fjew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P38CcQ017837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 03:08:12 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 20:08:08 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH v3 1/4] dt-bindings: firmware: qcom,scm: document QCS615 SCM
Date: Fri, 25 Oct 2024 08:37:29 +0530
Message-ID: <20241025030732.29743-2-quic_qqzhou@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JZEvr6sHenYkBHDIeq_6Z7TdAHU-Ix2U
X-Proofpoint-GUID: JZEvr6sHenYkBHDIeq_6Z7TdAHU-Ix2U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250021

Add the compatible for Qualcomm QCS615 SCM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..2a94d02f11a1 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qcm2290
+          - qcom,scm-qcs615
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
           - qcom,scm-sc7180
-- 
2.17.1


