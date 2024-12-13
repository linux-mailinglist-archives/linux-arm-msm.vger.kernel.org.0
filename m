Return-Path: <linux-arm-msm+bounces-41993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C69F0B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECD25188A142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3281DEFE6;
	Fri, 13 Dec 2024 11:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cj96nRLp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222441DE899;
	Fri, 13 Dec 2024 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089523; cv=none; b=fiX0vAuwJumzecgAb/LQEdOs6KhVW19EMlc5HqoRB2lkWwBI8llF+lHK5Nt8FfEKEUDjYocXIueHRy+z9Twq6WmposRnBG8x40Jmhbnsk1y+ENfdivR7LR8p8ZXc3sFE7Ty3ZtdCT+GIJH17Cb1Qy4yC5+ZxBpvOhPrHmUwkJvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089523; c=relaxed/simple;
	bh=jxyy/Rd3WlE7E38pgSOci7MfZjQyN9S/OqJlxiADmU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LP2p4ePDP9xU7yWA2R2bBPDXHXOvWr1afsvGXvK4FfWM4rJkAC4d+ZcgMfNaYGfgV281h5i6XCz13Qcnt1uYXrlG1YHFrhz7GqchmCw9TmPw8/15acm0UvZwmGZH0WNQ0Y2n9UJp2BXF1hrL2+TA1WE28rl7iaoDTI8x0WK0e/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cj96nRLp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9ZpWv006041;
	Fri, 13 Dec 2024 11:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9HFDEetOdgVS0AXXAZoXM/C4HH6dx4R7eVsi9pnoU8=; b=cj96nRLpCt3F+ODb
	uqM7oX0zBV/hB7jUTyd0Nyf8HZt6TufVOeNlA8WABHxSMoDEEwjB8qxsbS5tZNnm
	7zGI608zwOC075GmtxU+qcVXV6D7Vnlj1XpDvF7RZkicAWpQQcMNVvJ4WjCYLtvh
	w2qwwaPGzkit/r8RvMRnDgmKS6veSFzmogw/NhbRhn6/XOnYS1fQgFdb7L+iY1wK
	n8jc2bcZJnkdb/uRUGfF1SqPVCP2pZoQ+kawRx6Qq+G1l0z7pN6YEPjg740s2s01
	FIAqboV0McVzPQPj1ncU7TKklvP2n6zorRDzB6FKyDhfQ7ySLNfFg/uouGtkdQ6T
	75ogEg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43g6xusyk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:31:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDBVnEa010445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 11:31:49 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 03:31:44 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Fri, 13 Dec 2024 17:01:04 +0530
Subject: [PATCH RESEND v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-qcs615-gpu-dt-v2-2-47f3b312b178@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734089491; l=1603;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=jxyy/Rd3WlE7E38pgSOci7MfZjQyN9S/OqJlxiADmU0=;
 b=c3U2eg7fW2ddLFBTcjQSpyXnIzdXA6VEanXkZN0rJ0kLqhN/IHEhXKe5upsRRTM4tRn1bpMib
 Xv6oTv6LiEbAL4jKHXTVGYVKpn65NMQpAls6JSMSRrhwZiM48mcBrto
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BXb9JE0o4u137t9kPEV44sX8BrtLkZTE
X-Proofpoint-GUID: BXb9JE0o4u137t9kPEV44sX8BrtLkZTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130080

RGMU a.k.a Reduced Graphics Management Unit is a small state machine
with the sole purpose of providing IFPC support. Compared to GMU, it
doesn't manage GPU clock, voltage scaling, bw voting or any other
functionalities. All it does is detect an idle GPU and toggle the
GDSC switch. So it doesn't require iommu & opp table.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index b1bd372996d57138a0e80f8d93df09943775fdfa..6889dda7d4be71535dff1a62ca30f980bfc6128d 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -27,6 +27,7 @@ properties:
           - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
+      - const: qcom,adreno-rgmu
 
   reg:
     minItems: 1
@@ -267,12 +268,14 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-wrapper
+            enum:
+              - qcom,adreno-gmu-wrapper
+              - qcom,adreno-rgmu
     then:
       properties:
         reg:
           items:
-            - description: GMU wrapper register space
+            - description: RGMU/GMU wrapper register space
         reg-names:
           items:
             - const: gmu

-- 
2.45.2


