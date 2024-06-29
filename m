Return-Path: <linux-arm-msm+bounces-24698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4A91CA54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 03:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 881DD1F24470
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 01:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CE7A953;
	Sat, 29 Jun 2024 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jfEcE70r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9C66FB9;
	Sat, 29 Jun 2024 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719626079; cv=none; b=Wm26mdnYc5DcDWXqZC9n82nzfsnSJg3hXLhIR+t7713bDjDRBE86Wu92kF9e93PgKXbF5BHPn0jcQunz+Btm21L1tMZQ/LfPcmlfO7MDg7PaRRn573s7Tbw5U6UNYMWvhmjELam4RmwM0q+XGZI7E1/pyrOqhN4uGKlScQgPHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719626079; c=relaxed/simple;
	bh=UmIWVxBU5T/CjBii5H+wghRlH2RxDfdLklVm05eEgX8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iu7foih6Qpv1Byrjvvuqryl+Y8Qx924DRAyaFyTEE8LRvYkQm+FcD0ENZrUKQghU9I1bJTA34iraYdEAO9xXQX1L7Z/BAGbypELIK3XvVBMLhK3SLXq0g1eqsZEbQpml1QdSh8tmRXba46Ue76Gkp9wKUbVaoCuRo6Z/C44bim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jfEcE70r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45T0h2R8010459;
	Sat, 29 Jun 2024 01:54:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbKfDTNtdjST8qUicLLRuZwsVZnpO50hUNs+1kj12FU=; b=jfEcE70rXLJmRJiL
	xntYheRn7991WLK/0fgc9R4OKYitw6zlrQpYWotWbDQtD2EQhK5TKgQ+kTnk3C8M
	sK04gTHvNTaQtdTIpELYJ7k3T+YDIx8d48yfVXzUN/+Ti177XN1AJxKluAADbIX/
	EKpzLufsz8mu0Sl1SDBt0Rl/gIshR2ODq7J00Trl2fqEAEJ6I7VyUGS9EW/wG5h7
	tYYxu5NXPfK3F0OU2Je9qwRRlO8deLXAX9NbP38Yk2jl3T4orbeqzjXlt/Y8AJUy
	Wo2bUwZLUUSCgkzdkwAhs1g0pvd2IOqidsLcZDx2n8/E5vHpEsg38WBch21Ebx3U
	dbs1Eg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027yf02x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 01:54:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45T1sBsR016408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 01:54:11 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 18:54:04 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Will
 Deacon" <will@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Sean Paul <sean@poorly.run>, Thomas Zimmermann
	<tzimmermann@suse.de>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: display/msm/gmu: Add Adreno X185 GMU
Date: Sat, 29 Jun 2024 07:19:34 +0530
Message-ID: <20240629015111.264564-2-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XZoQjYLIEVpix9k4i73gfQ82hgxKuUWS
X-Proofpoint-ORIG-GUID: XZoQjYLIEVpix9k4i73gfQ82hgxKuUWS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406290013

Document Adreno X185 GMU in the dt-binding specification.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---

Changes in v2:
- Minor update to compatible pattern, '[x]' -> 'x'

 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b3837368a260..b1bd372996d5 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -23,6 +23,9 @@ properties:
       - items:
           - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
+      - items:
+          - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
   reg:
@@ -225,6 +228,7 @@ allOf:
               - qcom,adreno-gmu-730.1
               - qcom,adreno-gmu-740.1
               - qcom,adreno-gmu-750.1
+              - qcom,adreno-gmu-x185.1
     then:
       properties:
         reg:
-- 
2.45.1


